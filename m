Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1B686A36
	for <lists+etnaviv@lfdr.de>; Wed,  1 Feb 2023 16:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A8710E40F;
	Wed,  1 Feb 2023 15:26:14 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039DA10E40B
 for <etnaviv@lists.freedesktop.org>; Wed,  1 Feb 2023 15:26:12 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pNEzy-0000ja-7B; Wed, 01 Feb 2023 16:26:10 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/scheduler: track GPU active time per entity
Date: Wed,  1 Feb 2023 16:26:07 +0100
Message-Id: <20230201152609.1395525-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Track the accumulated time that jobs from this entity were active
on the GPU. This allows drivers using the scheduler to trivially
implement the DRM fdinfo when the hardware doesn't provide more
specific information than signalling job completion anyways.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 6 ++++++
 include/drm/gpu_scheduler.h            | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 31f3a1267be4..cc5e77a30a66 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -895,6 +895,12 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 
 	spin_unlock(&sched->job_list_lock);
 
+	if (job) {
+		job->entity->elapsed_ns += ktime_to_ns(
+			ktime_sub(job->s_fence->finished.timestamp,
+				  job->s_fence->scheduled.timestamp));
+	}
+
 	return job;
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index ca857ec9e7eb..f88a3fc14fb1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -228,6 +228,13 @@ struct drm_sched_entity {
 	 */
 	struct rb_node			rb_tree_node;
 
+	/**
+	 * @elapsed_ns
+	 *
+	 * Records the amount of time where jobs from this entity were active
+	 * on the GPU.
+	 */
+	uint64_t elapsed_ns;
 };
 
 /**
-- 
2.39.1

