Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18731BD554E
	for <lists+etnaviv@lfdr.de>; Mon, 13 Oct 2025 19:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CB210E13C;
	Mon, 13 Oct 2025 17:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="sTj4y+5t";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A4C10E13C
 for <etnaviv@lists.freedesktop.org>; Mon, 13 Oct 2025 17:03:21 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DH3GTs945992;
 Mon, 13 Oct 2025 12:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760374996;
 bh=G26ViXGebYBEcQtmVdegVQEZKa9u6E1Ggm0wlUJmvHg=;
 h=From:To:CC:Subject:Date;
 b=sTj4y+5tsO44H+ZZnmQg+veGJq1UdtcOjT0c92WIHvOQCqJw4SLHeoF/VzJs/jt9+
 r4+hNmGty/qCneTbxkA7E4rYsusbtefzoEOWrY0n7FBr9hGL6Mbe3Uu1tTX2gtkd51
 nNyda6PBCF7PMEz+RHvSWXrwvzJ6rUb4RO/Lg46k=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DH3GHD3950414
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 13 Oct 2025 12:03:16 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 13
 Oct 2025 12:03:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 12:03:16 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DH3FmM2407895;
 Mon, 13 Oct 2025 12:03:15 -0500
From: <rs@ti.com>
To: <l.stach@pengutronix.de>, <christian.gmeiner@gmail.com>,
 <linux+etnaviv@armlinux.org.uk>
CC: <etnaviv@lists.freedesktop.org>, <detheridge@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH v2] drm/etnaviv: force flush on power register ops
Date: Mon, 13 Oct 2025 12:01:23 -0500
Message-ID: <20251013170122.1145387-2-rs@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

From: Randolph Sapp <rs@ti.com>

Add gpu_write_power_sync to verify that power register modifications
have reached the endpoint device in sequence specific sections that do
not validate device state.

These sequence specific areas have been detected experimentally with an
am57xx-evm through numerous boot and module load+unload cycles.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2:
	- Add an explicit gpu_write_power_sync function to handle the readback
	- Add a few more required readbacks as determined experimentally with
	  5511 reboot cycles on am57xx-evm

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 10 +++++-----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  6 ++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index cf0d9049bcf1..dbbd5a8100e6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -543,13 +543,13 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 		u32 pulse_eater = 0x01590880;
 
 		/* disable clock gating */
-		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
+		gpu_write_power_sync(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
 
 		/* disable pulse eater */
 		pulse_eater |= BIT(17);
 		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
 		pulse_eater |= BIT(0);
-		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
+		gpu_write_power_sync(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
 
 		/* enable clock */
 		control = VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
@@ -643,7 +643,7 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
 	    gpu->identity.revision == 0x4302)
 		ppc |= VIVS_PM_POWER_CONTROLS_DISABLE_STALL_MODULE_CLOCK_GATING;
 
-	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, ppc);
+	gpu_write_power_sync(gpu, VIVS_PM_POWER_CONTROLS, ppc);
 
 	pmc = gpu_read_power(gpu, VIVS_PM_MODULE_CONTROLS);
 
@@ -687,7 +687,7 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
 	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_HZ;
 	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_EZ;
 
-	gpu_write_power(gpu, VIVS_PM_MODULE_CONTROLS, pmc);
+	gpu_write_power_sync(gpu, VIVS_PM_MODULE_CONTROLS, pmc);
 }
 
 void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch)
@@ -753,7 +753,7 @@ static void etnaviv_gpu_setup_pulse_eater(struct etnaviv_gpu *gpu)
 		pulse_eater |= BIT(18);
 	}
 
-	gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
+	gpu_write_power_sync(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
 }
 
 static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 5cb46c84e03a..e89d591d7404 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -204,6 +204,12 @@ static inline u32 gpu_read_power(struct etnaviv_gpu *gpu, u32 reg)
 	return readl(gpu->mmio + gpu_fix_power_address(gpu, reg));
 }
 
+static inline void gpu_write_power_sync(struct etnaviv_gpu *gpu, u32 reg, u32 data)
+{
+	gpu_write_power(gpu, reg, data);
+	gpu_read_power(gpu, reg);
+}
+
 int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value);
 
 int etnaviv_gpu_init(struct etnaviv_gpu *gpu);
-- 
2.51.0

