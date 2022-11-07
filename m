Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4129E62C874
	for <lists+etnaviv@lfdr.de>; Wed, 16 Nov 2022 19:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A9610E50F;
	Wed, 16 Nov 2022 18:55:35 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 450 seconds by postgrey-1.36 at gabe;
 Mon, 07 Nov 2022 18:00:42 UTC
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937B610E50E
 for <etnaviv@lists.freedesktop.org>; Mon,  7 Nov 2022 18:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843586; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/tEoyaSzgCjLFBBFxGEhWlA0ueX0gH414aDBJ34Uqk=;
 b=s5x6gJB0oQvdi9PxxKMObWjBnPttc+tIKgp3iV4JP6g4i87boCxDyjZA/XoT/rKmnXe7t8
 xsktO8YC1dL/BiuJLBoa6YnWHzQMKkXinVg2EN+ugTEBlcoleFv5aHpBsM8lZV+SEHRZnV
 LW/vSG/9vQPVgw8OhbbX7mHviYNoaEE=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 12/26] drm: etnaviv: Remove #ifdef guards for PM related
 functions
Date: Mon,  7 Nov 2022 17:52:42 +0000
Message-Id: <20221107175256.360839-2-paul@crapouillou.net>
In-Reply-To: <20221107175256.360839-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175256.360839-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Nov 2022 18:55:06 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Use the RUNTIME_PM_OPS() and pm_ptr() macros to handle the
.runtime_suspend/.runtime_resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_PM is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Some #ifdef CONFIG_PM guards were protecting simple statements, and were
also converted to "if (IS_ENABLED(CONFIG_PM))".

Note that this driver should probably use the
DEFINE_RUNTIME_DEV_PM_OPS() macro instead, which will provide
.suspend/.resume callbacks, pointing to pm_runtime_force_suspend() and
pm_runtime_force_resume() respectively; unless those callbacks really
aren't needed.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 30 +++++++++++----------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..e9a5444ec1c7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1605,7 +1605,6 @@ static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
 	return etnaviv_gpu_clk_disable(gpu);
 }
 
-#ifdef CONFIG_PM
 static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
 {
 	int ret;
@@ -1621,7 +1620,6 @@ static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
 
 	return 0;
 }
-#endif
 
 static int
 etnaviv_gpu_cooling_get_max_state(struct thermal_cooling_device *cdev,
@@ -1689,11 +1687,10 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	if (ret)
 		goto out_workqueue;
 
-#ifdef CONFIG_PM
-	ret = pm_runtime_get_sync(gpu->dev);
-#else
-	ret = etnaviv_gpu_clk_enable(gpu);
-#endif
+	if (IS_ENABLED(CONFIG_PM))
+		ret = pm_runtime_get_sync(gpu->dev);
+	else
+		ret = etnaviv_gpu_clk_enable(gpu);
 	if (ret < 0)
 		goto out_sched;
 
@@ -1737,12 +1734,12 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 
 	etnaviv_sched_fini(gpu);
 
-#ifdef CONFIG_PM
-	pm_runtime_get_sync(gpu->dev);
-	pm_runtime_put_sync_suspend(gpu->dev);
-#else
-	etnaviv_gpu_hw_suspend(gpu);
-#endif
+	if (IS_ENABLED(CONFIG_PM)) {
+		pm_runtime_get_sync(gpu->dev);
+		pm_runtime_put_sync_suspend(gpu->dev);
+	} else {
+		etnaviv_gpu_hw_suspend(gpu);
+	}
 
 	if (gpu->mmu_context)
 		etnaviv_iommu_context_put(gpu->mmu_context);
@@ -1856,7 +1853,6 @@ static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int etnaviv_gpu_rpm_suspend(struct device *dev)
 {
 	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
@@ -1899,18 +1895,16 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
-	SET_RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume,
-			   NULL)
+	RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume, NULL)
 };
 
 struct platform_driver etnaviv_gpu_driver = {
 	.driver = {
 		.name = "etnaviv-gpu",
 		.owner = THIS_MODULE,
-		.pm = &etnaviv_gpu_pm_ops,
+		.pm = pm_ptr(&etnaviv_gpu_pm_ops),
 		.of_match_table = etnaviv_gpu_match,
 	},
 	.probe = etnaviv_gpu_platform_probe,
-- 
2.35.1

