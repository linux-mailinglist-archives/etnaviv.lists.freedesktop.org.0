Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCED1FC0EE
	for <lists+etnaviv@lfdr.de>; Tue, 16 Jun 2020 23:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4805B6E9A5;
	Tue, 16 Jun 2020 21:22:10 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from v6.sk (v6.sk [167.172.42.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3886E9A7;
 Tue, 16 Jun 2020 21:22:09 +0000 (UTC)
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id 5C4C76163A;
 Tue, 16 Jun 2020 21:21:38 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [RESEND PATCH v2 3/4] drm/etnaviv: Make the "core" clock mandatory
Date: Tue, 16 Jun 2020 23:21:26 +0200
Message-Id: <20200616212127.986410-4-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200616212127.986410-1-lkundrak@v3.sk>
References: <20200616212127.986410-1-lkundrak@v3.sk>
MIME-Version: 1.0
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
Cc: Russell King <linux+etnaviv@arlinux.org.uk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>,
 Christian Geiner <christian.gmeiner@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

It is always present. It was documented as mandatory prior to
commit 90aeca875f8a ("dt-bindings: display: Convert etnaviv to
json-schema").

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Add this patch

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index f303172c091db..798fdbc8ecdb5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1796,7 +1796,7 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(gpu->clk_bus))
 		return PTR_ERR(gpu->clk_bus);
 
-	gpu->clk_core = devm_clk_get_optional(&pdev->dev, "core");
+	gpu->clk_core = devm_clk_get(&pdev->dev, "core");
 	DBG("clk_core: %p", gpu->clk_core);
 	if (IS_ERR(gpu->clk_core))
 		return PTR_ERR(gpu->clk_core);
-- 
2.26.2

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
