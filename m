Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40289686A37
	for <lists+etnaviv@lfdr.de>; Wed,  1 Feb 2023 16:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050F210E412;
	Wed,  1 Feb 2023 15:26:15 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EBD10E40B
 for <etnaviv@lists.freedesktop.org>; Wed,  1 Feb 2023 15:26:12 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pNEzy-0000ja-U4; Wed, 01 Feb 2023 16:26:10 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/etnaviv: export client GPU usage statistics via
 fdinfo
Date: Wed,  1 Feb 2023 16:26:09 +0100
Message-Id: <20230201152609.1395525-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201152609.1395525-1-l.stach@pengutronix.de>
References: <20230201152609.1395525-1-l.stach@pengutronix.de>
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

This exposes a accumulated GPU active time per client via the
fdinfo infrastructure.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v3: handle NPU cores
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 43 ++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 31a7f59ccb49..44ca803237a5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -22,6 +22,7 @@
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
+#include "common.xml.h"
 
 /*
  * DRM operations:
@@ -475,7 +476,47 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_FOPS(fops);
+static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct drm_file *file = f->private_data;
+	struct drm_device *dev = file->minor->dev;
+	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_file_private *ctx = file->driver_priv;
+
+	/*
+	 * For a description of the text output format used here, see
+	 * Documentation/gpu/drm-usage-stats.rst.
+	 */
+	seq_printf(m, "drm-driver:\t%s\n", dev->driver->name);
+	seq_printf(m, "drm-client-id:\t%u\n", ctx->id);
+
+	for (int i = 0; i < ETNA_MAX_PIPES; i++) {
+		struct etnaviv_gpu *gpu = priv->gpu[i];
+		char engine[10] = "UNK";
+		int cur = 0;
+
+		if (!gpu)
+			continue;
+
+		if (gpu->identity.features & chipFeatures_PIPE_2D)
+			cur = snprintf(engine, sizeof(engine), "2D");
+		if (gpu->identity.features & chipFeatures_PIPE_3D)
+			cur = snprintf(engine + cur, sizeof(engine) - cur,
+				       "%s3D", cur ? "/" : "");
+		if (gpu->identity.nn_core_count > 0)
+			cur = snprintf(engine + cur, sizeof(engine) - cur,
+				       "%sNN", cur ? "/" : "");
+
+		seq_printf(m, "drm-engine-%s:\t%llu ns\n", engine,
+			   ctx->sched_entity[i].elapsed_ns);
+	}
+}
+
+static const struct file_operations fops = {
+	.owner = THIS_MODULE,
+	DRM_GEM_FOPS,
+	.show_fdinfo = etnaviv_fop_show_fdinfo,
+};
 
 static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
-- 
2.39.1

