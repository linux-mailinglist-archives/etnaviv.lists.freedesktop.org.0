Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA295B2558
	for <lists+etnaviv@lfdr.de>; Thu,  8 Sep 2022 20:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC3510EB91;
	Thu,  8 Sep 2022 18:10:22 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BD810EB90
 for <etnaviv@lists.freedesktop.org>; Thu,  8 Sep 2022 18:10:17 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oWLyg-0007bC-N3; Thu, 08 Sep 2022 20:10:14 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/scheduler: track GPU active time per entity
Date: Thu,  8 Sep 2022 20:10:11 +0200
Message-Id: <20220908181013.3214205-1-l.stach@pengutronix.de>
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, patchwork-lst@pengutronix.de,
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Track the accumulated time that jobs from this entity were active
on the GPU. This allows drivers using the scheduler to trivially
implement the DRM fdinfo when the hardware doesn't provide more
specific information than signalling job completion anyways.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/scheduler/sched_main.c | 6 ++++++
 include/drm/gpu_scheduler.h            | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 76fd2904c7c6..24c77a6a157f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -847,6 +847,12 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 
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
index addb135eeea6..573bef640664 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -196,6 +196,13 @@ struct drm_sched_entity {
 	 * drm_sched_entity_fini().
 	 */
 	struct completion		entity_idle;
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
2.30.2

