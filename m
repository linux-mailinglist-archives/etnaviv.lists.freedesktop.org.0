Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3823A7ED3
	for <lists+etnaviv@lfdr.de>; Tue, 15 Jun 2021 15:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A4F8984D;
	Tue, 15 Jun 2021 13:13:27 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 504 seconds by postgrey-1.36 at gabe;
 Mon, 14 Jun 2021 22:26:30 UTC
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A5F89C68;
 Mon, 14 Jun 2021 22:26:30 +0000 (UTC)
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B1F9422253;
 Tue, 15 Jun 2021 00:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1623709086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SD9ah05R7q3Xl2JjUIPjpWWyqe3h4fOAzvP8iSEX2Hk=;
 b=U5MJr1VkoyQo1vU0kwB7yeUkXd4RKn9ihxT/uFlNjhcvsaeKUaKQOJRfUzZq4MRC1rtC9K
 4/WWfmg1EKlDcpzjk0xc2OQteI1TSsFCbIDZ2/d0J2rIKVDuo1I0/UmzFZ+vqJg+9y9oW2
 vNLQ0t/aBNfCsswPMXGlbJAQ5Ti5h3E=
From: Michael Walle <michael@walle.cc>
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] drm/etnaviv: add clock gating workaround for GC7000
 r6202
Date: Tue, 15 Jun 2021 00:17:52 +0200
Message-Id: <20210614221752.1251-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614221752.1251-1-michael@walle.cc>
References: <20210614221752.1251-1-michael@walle.cc>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Jun 2021 13:13:26 +0000
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
Cc: David Airlie <airlied@linux.ie>, Michael Walle <michael@walle.cc>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

The LS1028A SoC errata sheet mentions A-050121 "GPU hangs if clock
gating for Rasterizer, Setup Engine and Texture Engine are enabled".
The workaround is to disable the corresponding clock gatings.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 4102bcea3341..574e4e04dddc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -613,6 +613,12 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
 	    etnaviv_is_model_rev(gpu, GC2000, 0x5108))
 		pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_TX;
 
+	/* Disable RS, SE, TE clock gating on affected core revisions. */
+	if (etnaviv_is_model_rev(gpu, GC7000, 0x6202))
+		pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_SE |
+		       VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA |
+		       VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_TX;
+
 	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_HZ;
 	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_EZ;
 
-- 
2.20.1

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
