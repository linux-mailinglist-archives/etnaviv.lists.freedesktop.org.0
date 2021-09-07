Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87017402D29
	for <lists+etnaviv@lfdr.de>; Tue,  7 Sep 2021 18:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5266E069;
	Tue,  7 Sep 2021 16:49:59 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7988B6E062;
 Tue,  7 Sep 2021 16:49:57 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 91D2B2224D;
 Tue,  7 Sep 2021 18:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1631033394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LwepDWImkuIA5stkYQAIEg9VyHhfX67GLfbm+wF6adQ=;
 b=aEmFIGSqVk9XaLG5RHuDYC3l7m9PIozNeuwEwotWmQQiUd8vSmVQwXLQl2L2ud38FvkRFg
 /m7jXKipzlst87bIt8MXLjZ3oaluzRoWtXEkdUuxzd/e3YG/G61jl4YgfmqfJzU6CbUOIO
 UZljlmKMibS8zYXH/U9rGQfeAOSiobQ=
From: Michael Walle <michael@walle.cc>
To: Robin Murphy <robin.murphy@arm.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: "Lukas F . Hartmann" <lukas@mntre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v2 3/3] drm/etnaviv: use a 32 bit mask as coherent DMA mask
Date: Tue,  7 Sep 2021 18:49:45 +0200
Message-Id: <20210907164945.2309815-4-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907164945.2309815-1-michael@walle.cc>
References: <20210907164945.2309815-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

The STLB and the first command buffer (which is used to set up the TLBs)
has a 32 bit size restriction in hardware. There seems to be no way to
specify addresses larger than 32 bit. Keep it simple and restict the
addresses to the lower 4 GiB range for all coherent DMA memory
allocations.

Please note, that platform_device_alloc() will initialize dev->dma_mask
to point to pdev->platform_dma_mask, thus dma_set_mask() will work as
expected.

While at it, move the dma_mask setup code to the of_dma_configure() to
keep all the DMA setup code next to each other.

Suggested-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 54eb653ca295..0b756ecb1bc2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -613,6 +613,24 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			component_match_add(dev, &match, compare_str, names[i]);
 	}
 
+	/*
+	 * PTA and MTLB can have 40 bit base addresses, but
+	 * unfortunately, an entry in the MTLB can only point to a
+	 * 32 bit base address of a STLB. Moreover, to initialize the
+	 * MMU we need a command buffer with a 32 bit address because
+	 * without an MMU there is only an indentity mapping between
+	 * the internal 32 bit addresses and the bus addresses.
+	 *
+	 * To make things easy, we set the dma_coherent_mask to 32
+	 * bit to make sure we are allocating the command buffers and
+	 * TLBs in the lower 4 GiB address space.
+	 */
+	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(40)) ||
+	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32))) {
+		dev_dbg(&pdev->dev, "No suitable DMA available\n");
+		return -ENODEV;
+	}
+
 	/*
 	 * Apply the same DMA configuration to the virtual etnaviv
 	 * device as the GPU we found. This assumes that all Vivante
@@ -671,8 +689,6 @@ static int __init etnaviv_init(void)
 			of_node_put(np);
 			goto unregister_platform_driver;
 		}
-		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
-		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
 
 		ret = platform_device_add(pdev);
 		if (ret) {
-- 
2.30.2

