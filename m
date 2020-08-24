Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F17B24FC38
	for <lists+etnaviv@lfdr.de>; Mon, 24 Aug 2020 13:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6A86E1E8;
	Mon, 24 Aug 2020 11:02:51 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 610 seconds by postgrey-1.36 at gabe;
 Mon, 24 Aug 2020 11:02:50 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6781C6E1E8
 for <etnaviv@lists.freedesktop.org>; Mon, 24 Aug 2020 11:02:50 +0000 (UTC)
Received: from [2001:67c:670:100:1d::28] (helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kAAFU-00008d-K9; Mon, 24 Aug 2020 13:02:48 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: always start/stop scheduler in timeout processing
Date: Mon, 24 Aug 2020 13:02:48 +0200
Message-Id: <20200824110248.5998-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

The drm scheduler currently expects that the stop/start sequence is always
executed in the timeout handling, as the job at the head of the hardware
execution list is always removed from the ring mirror before the driver
function is called and only inserted back into the list when starting the
scheduler.

This adds some unnecessary overhead if the timeout handler determines
that the GPU is still executing jobs normally and just wished to extend
the timeout, but a better solution requires a major rearchitecture of the
scheduler, which is not applicable as a fix.

Fixes: 135517d3565b drm/scheduler: Avoid accessing freed bad job.)
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 4e3e95dce6d8..cd46c882269c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -89,12 +89,15 @@ static void etnaviv_sched_timedout_job(struct drm_sched_job *sched_job)
 	u32 dma_addr;
 	int change;
 
+	/* block scheduler */
+	drm_sched_stop(&gpu->sched, sched_job);
+
 	/*
 	 * If the GPU managed to complete this jobs fence, the timout is
 	 * spurious. Bail out.
 	 */
 	if (dma_fence_is_signaled(submit->out_fence))
-		return;
+		goto out_no_timeout;
 
 	/*
 	 * If the GPU is still making forward progress on the front-end (which
@@ -105,12 +108,9 @@ static void etnaviv_sched_timedout_job(struct drm_sched_job *sched_job)
 	change = dma_addr - gpu->hangcheck_dma_addr;
 	if (change < 0 || change > 16) {
 		gpu->hangcheck_dma_addr = dma_addr;
-		return;
+		goto out_no_timeout;
 	}
 
-	/* block scheduler */
-	drm_sched_stop(&gpu->sched, sched_job);
-
 	if(sched_job)
 		drm_sched_increase_karma(sched_job);
 
@@ -120,6 +120,7 @@ static void etnaviv_sched_timedout_job(struct drm_sched_job *sched_job)
 
 	drm_sched_resubmit_jobs(&gpu->sched);
 
+out_no_timeout:
 	/* restart scheduler after GPU is usable again */
 	drm_sched_start(&gpu->sched, true);
 }
-- 
2.20.1

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
