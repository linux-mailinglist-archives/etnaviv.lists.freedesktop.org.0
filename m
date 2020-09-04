Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B62BB25DC4B
	for <lists+etnaviv@lfdr.de>; Fri,  4 Sep 2020 16:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5546EC36;
	Fri,  4 Sep 2020 14:53:41 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3816EC18;
 Fri,  4 Sep 2020 14:53:39 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 231322074D;
 Fri,  4 Sep 2020 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599231219;
 bh=ASiZ0rB9LNwgfTE9ttuElktd19XeAlJ3o/IpyKudDPU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aR2RVbgZWjLaYqLsuAvDRAoxLGCQRm9KsDGoMMp/gGpODc1XE/ZpmzOUF1GTJldsI
 soD3XHAySHDgl59TNt7eXiWKS8uTSEJuDhusDjecYWQRjptUw3qSwxrPyPR2i8i9rV
 t6oKaiifMgz4rkD9iMzTPAs30EIopKu4CUaPFcTo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Li Yang <leoyang.li@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/13] dt-bindings: arm: fsl: Fix matching Purism Librem5
 phones
Date: Fri,  4 Sep 2020 16:53:02 +0200
Message-Id: <20200904145312.10960-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904145312.10960-1-krzk@kernel.org>
References: <20200904145312.10960-1-krzk@kernel.org>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

All Purism Librem5 phones have three compatibles so they need their own
entry to fix dbts_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml: /:
    compatible: ['purism,librem5r2', 'purism,librem5', 'fsl,imx8mq'] is not valid under any of the given schemas

  arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml: /:
    compatible: ['purism,librem5r2', 'purism,librem5', 'fsl,imx8mq'] is too long

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 37cef8653541..edef7a9f4e36 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -377,12 +377,18 @@ properties:
               - fsl,imx8mq-evk            # i.MX8MQ EVK Board
               - google,imx8mq-phanbell    # Google Coral Edge TPU
               - purism,librem5-devkit     # Purism Librem5 devkit
-              - purism,librem5r2          # Purism Librem5 phone "Chestnut"
-              - purism,librem5r3          # Purism Librem5 phone "Dogwood"
               - solidrun,hummingboard-pulse # SolidRun Hummingboard Pulse
               - technexion,pico-pi-imx8m  # TechNexion PICO-PI-8M evk
           - const: fsl,imx8mq
 
+      - description: Purism Librem5 phones
+        items:
+          - enum:
+              - purism,librem5r2          # Purism Librem5 phone "Chestnut"
+              - purism,librem5r3          # Purism Librem5 phone "Dogwood"
+          - const: purism,librem5
+          - const: fsl,imx8mq
+
       - description: Zodiac Inflight Innovations Ultra Boards
         items:
           - enum:
-- 
2.17.1

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
