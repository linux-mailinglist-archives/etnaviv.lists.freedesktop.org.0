Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7863C82D650
	for <lists+etnaviv@lfdr.de>; Mon, 15 Jan 2024 10:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D2010E241;
	Mon, 15 Jan 2024 09:48:45 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 332 seconds by postgrey-1.36 at gabe;
 Mon, 15 Jan 2024 09:48:44 UTC
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59C2B10E241
 for <etnaviv@lists.freedesktop.org>; Mon, 15 Jan 2024 09:48:44 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id 744DDE74016; Mon, 15 Jan 2024 10:42:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00,
 T_SCC_BODY_TEXT_LINE autolearn=ham version=3.3.1
Received: from astat.fritz.box (a89-183-231-2.net-htp.de [89.183.231.2])
 by lynxeye.de (Postfix) with ESMTPA id 4637BE74012;
 Mon, 15 Jan 2024 10:42:40 +0100 (CET)
From: Lucas Stach <dev@lynxeye.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH DONTMERGE] drm/etnaviv: don't block scheduler when GPU is
 still active
Date: Mon, 15 Jan 2024 10:42:37 +0100
Message-ID: <20240115094237.484515-1-dev@lynxeye.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: etnaviv@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <etnaviv.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/etnaviv>
List-Post: <mailto:etnaviv@lists.freedesktop.org>
List-Help: <mailto:etnaviv-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=subscribe>
Cc: etnaviv@lists.freedesktop.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

From: Lucas Stach <l.stach@pengutronix.de>

Since 45ecaea73883 ("drm/sched: Partial revert of 'drm/sched: Keep
s_fence->parent pointer'") still active jobs aren't put back in the
pending list on drm_sched_start(), as they don't have a active
parent fence anymore, so if the GPU is still working and the timeout
is extended, all currently active jobs will be freed.

To avoid prematurely freeing jobs that are still active on the GPU,
don't block the scheduler until we are fully committed to actually
reset the GPU.

Cc: stable@vger.kernel.org #6.0
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
The behavior change in the scheduler is unfortunate and at least
deserves some updated documentation. This change aligns etnaviv with
the behavior of other drivers and avoids the issue.

ATTENTION: Do NOT merge this patch as-is. It will cause the hangcheck
timer to not be properly rearmed when only a single job is active. This
needs fixing in the scheduler.
---
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 9b79f218e21a..e8338ce5bd3f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -38,15 +38,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	u32 dma_addr;
 	int change;
 
-	/* block scheduler */
-	drm_sched_stop(&gpu->sched, sched_job);
-
 	/*
 	 * If the GPU managed to complete this jobs fence, the timout is
 	 * spurious. Bail out.
 	 */
 	if (dma_fence_is_signaled(submit->out_fence))
-		goto out_no_timeout;
+		return DRM_GPU_SCHED_STAT_NOMINAL;
 
 	/*
 	 * If the GPU is still making forward progress on the front-end (which
@@ -60,9 +57,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	     change < 0 || change > 16)) {
 		gpu->hangcheck_dma_addr = dma_addr;
 		gpu->hangcheck_fence = gpu->completed_fence;
-		goto out_no_timeout;
+		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
 
+	/* block scheduler */
+	drm_sched_stop(&gpu->sched, sched_job);
+
 	if(sched_job)
 		drm_sched_increase_karma(sched_job);
 
@@ -74,11 +74,6 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 
 	drm_sched_start(&gpu->sched, true);
 	return DRM_GPU_SCHED_STAT_NOMINAL;
-
-out_no_timeout:
-	/* restart scheduler after GPU is usable again */
-	drm_sched_start(&gpu->sched, true);
-	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
 static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)
-- 
2.43.0

