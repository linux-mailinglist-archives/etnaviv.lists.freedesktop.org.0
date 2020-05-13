Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E15A91D18B9
	for <lists+etnaviv@lfdr.de>; Wed, 13 May 2020 17:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989486EA6D;
	Wed, 13 May 2020 15:08:20 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from v6.sk (v6.sk [167.172.42.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0FF6EA6A
 for <etnaviv@lists.freedesktop.org>; Wed, 13 May 2020 15:07:03 +0000 (UTC)
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id D41E6610D7;
 Wed, 13 May 2020 15:00:16 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 3/3] drm/etnaviv: Simplify clock enable/disable
Date: Wed, 13 May 2020 17:00:07 +0200
Message-Id: <20200513150007.1315395-4-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513150007.1315395-1-lkundrak@v3.sk>
References: <[PATCH 0/3] drm/etnaviv: Clock fixes>
 <20200513150007.1315395-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 15:08:18 +0000
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
 etnaviv@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

All the NULL checks are pointless, clk_*() routines already deal with NULL
just fine.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 53 ++++++++++-----------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index e7dbb924f576..f5b95cb4f058 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1487,55 +1487,40 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
 {
 	int ret;
 
-	if (gpu->clk_reg) {
-		ret = clk_prepare_enable(gpu->clk_reg);
-		if (ret)
-			return ret;
-	}
+	ret = clk_prepare_enable(gpu->clk_reg);
+	if (ret)
+		return ret;
 
-	if (gpu->clk_bus) {
-		ret = clk_prepare_enable(gpu->clk_bus);
-		if (ret)
-			goto disable_clk_reg;
-	}
+	ret = clk_prepare_enable(gpu->clk_bus);
+	if (ret)
+		goto disable_clk_reg;
 
-	if (gpu->clk_core) {
-		ret = clk_prepare_enable(gpu->clk_core);
-		if (ret)
-			goto disable_clk_bus;
-	}
+	ret = clk_prepare_enable(gpu->clk_core);
+	if (ret)
+		goto disable_clk_bus;
 
-	if (gpu->clk_shader) {
-		ret = clk_prepare_enable(gpu->clk_shader);
-		if (ret)
-			goto disable_clk_core;
-	}
+	ret = clk_prepare_enable(gpu->clk_shader);
+	if (ret)
+		goto disable_clk_core;
 
 	return 0;
 
 disable_clk_core:
-	if (gpu->clk_core)
-		clk_disable_unprepare(gpu->clk_core);
+	clk_disable_unprepare(gpu->clk_core);
 disable_clk_bus:
-	if (gpu->clk_bus)
-		clk_disable_unprepare(gpu->clk_bus);
+	clk_disable_unprepare(gpu->clk_bus);
 disable_clk_reg:
-	if (gpu->clk_reg)
-		clk_disable_unprepare(gpu->clk_reg);
+	clk_disable_unprepare(gpu->clk_reg);
 
 	return ret;
 }
 
 static int etnaviv_gpu_clk_disable(struct etnaviv_gpu *gpu)
 {
-	if (gpu->clk_shader)
-		clk_disable_unprepare(gpu->clk_shader);
-	if (gpu->clk_core)
-		clk_disable_unprepare(gpu->clk_core);
-	if (gpu->clk_bus)
-		clk_disable_unprepare(gpu->clk_bus);
-	if (gpu->clk_reg)
-		clk_disable_unprepare(gpu->clk_reg);
+	clk_disable_unprepare(gpu->clk_shader);
+	clk_disable_unprepare(gpu->clk_core);
+	clk_disable_unprepare(gpu->clk_bus);
+	clk_disable_unprepare(gpu->clk_reg);
 
 	return 0;
 }
-- 
2.26.2

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
