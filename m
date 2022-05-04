Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A461E519B12
	for <lists+etnaviv@lfdr.de>; Wed,  4 May 2022 11:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2076B10FCAF;
	Wed,  4 May 2022 09:02:34 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B5E10FD38
 for <etnaviv@lists.freedesktop.org>; Wed,  4 May 2022 09:02:32 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nmAtx-0002ZV-VZ; Wed, 04 May 2022 11:02:30 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/etnaviv: avoid cleaning up sched_job when submit
 succeeded
Date: Wed,  4 May 2022 11:02:29 +0200
Message-Id: <20220504090229.2506560-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
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
Cc: Michael Walle <michael@walle.cc>, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>,
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

While the labels may mislead the casual reader, the tail of the function
etnaviv_ioctl_gem_submit is always executed, as a lot of the structures
set up in this function need to be cleaned up regardless of whether the
submit succeeded or failed.

An exception is the newly added drm_sched_job_cleanup, which must only
be called when the submit failed before handing the job to the
scheduler.

Fixes: b827c84f5e84 ("drm/etnaviv: Use scheduler dependency handling")
Reported-by: Michael Walle <michael@walle.cc>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 98bb5c9239de..1ac916b24891 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -598,7 +598,12 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		sync_file = sync_file_create(submit->out_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
-			goto err_submit_job;
+			/*
+			 * When this late error is hit, the submit has already
+			 * been handed over to the scheduler. At this point
+			 * the sched_job must not be cleaned up.
+			 */
+			goto err_submit_put;
 		}
 		fd_install(out_fence_fd, sync_file->file);
 	}
@@ -607,7 +612,8 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	args->fence = submit->out_fence_id;
 
 err_submit_job:
-	drm_sched_job_cleanup(&submit->sched_job);
+	if (ret)
+		drm_sched_job_cleanup(&submit->sched_job);
 err_submit_put:
 	etnaviv_submit_put(submit);
 
-- 
2.30.2

