Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD6736925
	for <lists+etnaviv@lfdr.de>; Tue, 20 Jun 2023 12:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D5310E2A5;
	Tue, 20 Jun 2023 10:23:51 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5DD5A10E2AE;
 Tue, 20 Jun 2023 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=U0SWL/JdjvOqGx7gC3JlFOSCNm1yICr30bcx3Pn/rOc=;
 b=k0IPjAgM7wS2e0KXaDA4o0dS4eUrwmCClAe12ml0sn2RoUBLAxLaYckkvZxY/x
 yjylrv815ow7DwRvC74/8BK9iCfjVaB007+txm7K8Yfg1AwBLhxL3oE7M+EqZccz
 IRpnlYaZ/jhvOM0neqiPKZ4xSAug0kLPwr2yvZlWSGTbw=
Received: from openarena.loongson.cn (unknown [114.242.206.180])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wAXg3CldZFkB8yiAQ--.11241S4;
 Tue, 20 Jun 2023 17:47:18 +0800 (CST)
From: Sui Jingfeng <18949883232@163.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v10 02/11] drm/etnaviv: Add a dedicated function to get
 various clocks
Date: Tue, 20 Jun 2023 17:47:07 +0800
Message-Id: <20230620094716.2231414-3-18949883232@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230620094716.2231414-1-18949883232@163.com>
References: <20230620094716.2231414-1-18949883232@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXg3CldZFkB8yiAQ--.11241S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFW3Zr13Cw1DWr4rJFWUJwb_yoW5ur1kpa
 1fJ3W5Kr1UCryUK3yxAF13tr1a9r1fCayxCwnYvrnavws8KF4Utw4YkFyYqF45uryrXFWS
 kr15GF4UCFyF9rUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jpWlkUUUUU=
X-Originating-IP: [114.242.206.180]
X-CM-SenderInfo: jprymkizyyjjits6il2tof0z/xtbBaQeU0VXl0TKDvQAAsG
X-Mailman-Approved-At: Tue, 20 Jun 2023 10:23:50 +0000
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Because it is also platform-dependent, there are systems where we don't
have DT-based clock drivers supported. For example, discrete PCI GPUs.
Therefire, don't quit if there is no clock subsystem support.
    
For the GPU in LS7A1000 and LS2K1000, the working frequency of the GPU is
rely on the GFX PLL to generate the clock. Typically, the GFX PLL is
configured by the platform firmware.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 53 ++++++++++++++++-----------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a03e81337d8f..5e88fa95dac2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1565,6 +1565,35 @@ static irqreturn_t irq_handler(int irq, void *data)
 	return ret;
 }
 
+static int etnaviv_gpu_clk_get(struct etnaviv_gpu *gpu)
+{
+	struct device *dev = gpu->dev;
+
+	gpu->clk_reg = devm_clk_get_optional(dev, "reg");
+	DBG("clk_reg: %p", gpu->clk_reg);
+	if (IS_ERR(gpu->clk_reg))
+		return PTR_ERR(gpu->clk_reg);
+
+	gpu->clk_bus = devm_clk_get_optional(dev, "bus");
+	DBG("clk_bus: %p", gpu->clk_bus);
+	if (IS_ERR(gpu->clk_bus))
+		return PTR_ERR(gpu->clk_bus);
+
+	gpu->clk_core = devm_clk_get(dev, "core");
+	DBG("clk_core: %p", gpu->clk_core);
+	if (IS_ERR(gpu->clk_core))
+		return PTR_ERR(gpu->clk_core);
+	gpu->base_rate_core = clk_get_rate(gpu->clk_core);
+
+	gpu->clk_shader = devm_clk_get_optional(dev, "shader");
+	DBG("clk_shader: %p", gpu->clk_shader);
+	if (IS_ERR(gpu->clk_shader))
+		return PTR_ERR(gpu->clk_shader);
+	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
+
+	return 0;
+}
+
 static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
 {
 	int ret;
@@ -1863,27 +1892,9 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 		return err;
 
 	/* Get Clocks: */
-	gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
-	DBG("clk_reg: %p", gpu->clk_reg);
-	if (IS_ERR(gpu->clk_reg))
-		return PTR_ERR(gpu->clk_reg);
-
-	gpu->clk_bus = devm_clk_get_optional(&pdev->dev, "bus");
-	DBG("clk_bus: %p", gpu->clk_bus);
-	if (IS_ERR(gpu->clk_bus))
-		return PTR_ERR(gpu->clk_bus);
-
-	gpu->clk_core = devm_clk_get(&pdev->dev, "core");
-	DBG("clk_core: %p", gpu->clk_core);
-	if (IS_ERR(gpu->clk_core))
-		return PTR_ERR(gpu->clk_core);
-	gpu->base_rate_core = clk_get_rate(gpu->clk_core);
-
-	gpu->clk_shader = devm_clk_get_optional(&pdev->dev, "shader");
-	DBG("clk_shader: %p", gpu->clk_shader);
-	if (IS_ERR(gpu->clk_shader))
-		return PTR_ERR(gpu->clk_shader);
-	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
+	err = etnaviv_gpu_clk_get(gpu);
+	if (err)
+		return err;
 
 	/* TODO: figure out max mapped size */
 	dev_set_drvdata(dev, gpu);
-- 
2.25.1

