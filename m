Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE43515440
	for <lists+etnaviv@lfdr.de>; Fri, 29 Apr 2022 21:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BDD10E908;
	Fri, 29 Apr 2022 19:17:35 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D497710E908
 for <etnaviv@lists.freedesktop.org>; Fri, 29 Apr 2022 19:17:34 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nkW7Q-00019X-8v; Fri, 29 Apr 2022 21:17:32 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/etnaviv: avoid cleaning up sched_job when submit succeeded
Date: Fri, 29 Apr 2022 21:17:31 +0200
Message-Id: <20220429191731.2187339-1-l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
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
Daniel, please apply to the appropriate drm-misc branch to make sure
this ends up in the same pullrequest as the offending commit.
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 98bb5c9239de..bf2a400f59c9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -607,7 +607,8 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	args->fence = submit->out_fence_id;
 
 err_submit_job:
-	drm_sched_job_cleanup(&submit->sched_job);
+	if (ret)
+		drm_sched_job_cleanup(&submit->sched_job);
 err_submit_put:
 	etnaviv_submit_put(submit);
 
-- 
2.30.2

