Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C805073F6BB
	for <lists+etnaviv@lfdr.de>; Tue, 27 Jun 2023 10:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1279D10E2AA;
	Tue, 27 Jun 2023 08:17:12 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from out-18.mta0.migadu.com (out-18.mta0.migadu.com [91.218.175.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A43310E633
 for <etnaviv@lists.freedesktop.org>; Fri, 23 Jun 2023 10:17:06 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1687514927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mYSHA82Ggr/qk8LcxRbWw+jtvr8ZShkQNBHi2vnZ+s=;
 b=Lzg3YyZjlP7eRGip2Pkq+Mlkn9hRfaUhzylAQ7XKNRcqwCBYLb1w4P73Ire/0LVeXvDLIz
 MfyjpGmYhjQcQC4Hb+QFcuzk44dUFpduWHPWYF3n1tUjfYU02Rg7J0nHbNxqVTl/9EN6km
 1KkGyTaVOUxJgeE5C2JJqu6xcW0bLVg=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 8/8] drm/etnaviv: Add a helper to get a pointer to the
 first available node
Date: Fri, 23 Jun 2023 18:08:22 +0800
Message-Id: <20230623100822.274706-9-sui.jingfeng@linux.dev>
In-Reply-To: <20230623100822.274706-1-sui.jingfeng@linux.dev>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 27 Jun 2023 08:17:10 +0000
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
Cc: loongson-kernel@lists.loongnix.cn, Sui Jingfeng <suijingfeng@loongson.cn>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

This make the code in etnaviv_pdev_probe() less twisted, drop the reference
to device node after finished. Also kill a double blank line.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 32 ++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 7d0eeab3e8b7..3446f8eabf59 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -27,6 +27,19 @@
  * DRM operations:
  */
 
+/* If the DT contains at least one available GPU, return a pointer to it */
+
+static struct device_node *etnaviv_of_first_node(void)
+{
+	struct device_node *np;
+
+	for_each_compatible_node(np, NULL, "vivante,gc") {
+		if (of_device_is_available(np))
+			return np;
+	}
+
+	return NULL;
+}
 
 static void load_gpu(struct drm_device *dev)
 {
@@ -587,7 +600,7 @@ static const struct component_master_ops etnaviv_master_ops = {
 static int etnaviv_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *first_node = NULL;
+	struct device_node *first_node;
 	struct component_match *match = NULL;
 
 	if (!dev->platform_data) {
@@ -597,11 +610,10 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			if (!of_device_is_available(core_node))
 				continue;
 
-			if (!first_node)
-				first_node = core_node;
-
 			drm_of_component_match_add(&pdev->dev, &match,
 						   component_compare_of, core_node);
+
+			of_node_put(core_node);
 		}
 	} else {
 		char **names = dev->platform_data;
@@ -634,8 +646,11 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	 * device as the GPU we found. This assumes that all Vivante
 	 * GPUs in the system share the same DMA constraints.
 	 */
-	if (first_node)
+	first_node = etnaviv_of_first_node();
+	if (first_node) {
 		of_dma_configure(&pdev->dev, first_node, true);
+		of_node_put(first_node);
+	}
 
 	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
 }
@@ -709,17 +724,14 @@ static int __init etnaviv_init(void)
 	 * If the DT contains at least one available GPU device, instantiate
 	 * the DRM platform device.
 	 */
-	for_each_compatible_node(np, NULL, "vivante,gc") {
-		if (!of_device_is_available(np))
-			continue;
+	np = etnaviv_of_first_node();
+	if (np) {
 		of_node_put(np);
 
 		ret = etnaviv_create_platform_device("etnaviv",
 						     &etnaviv_platform_device);
 		if (ret)
 			goto unregister_platform_driver;
-
-		break;
 	}
 
 	return 0;
-- 
2.25.1

