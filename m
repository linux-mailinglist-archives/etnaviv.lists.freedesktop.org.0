Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC92BBF675
	for <lists+etnaviv@lfdr.de>; Mon, 06 Oct 2025 22:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C650310E4B0;
	Mon,  6 Oct 2025 20:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="kVVFMYJp";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 1573 seconds by postgrey-1.36 at gabe;
 Mon, 06 Oct 2025 20:57:04 UTC
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D3210E4B0
 for <etnaviv@lists.freedesktop.org>; Mon,  6 Oct 2025 20:57:03 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596KUhpf3620515;
 Mon, 6 Oct 2025 15:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1759782643;
 bh=IF/GIht95FoAFwWX/ScpNYbmSnw5LLUr0y3CnaUP/vc=;
 h=From:To:CC:Subject:Date;
 b=kVVFMYJpM187lPMCwkORsyy/TE8bIMvses1Ku00OPedshgIoW4kDDEmk5Y2/ptH+l
 2hX2Jwaj1JDfvDAlxlcN8CtUNgaPOGhpP3No2b+CMFv7++EKXTS/y1+8DHduu/KxR0
 Qi2zA7YityvAitY+ve50RCfW9LDA98RMGG3hnEmU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596KUhwD3555571
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 6 Oct 2025 15:30:43 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 15:30:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 15:30:43 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596KUhhH047822;
 Mon, 6 Oct 2025 15:30:43 -0500
From: <rs@ti.com>
To: <l.stach@pengutronix.de>, <linux+etnaviv@armlinux.org.uk>,
 <christian.gmeiner@gmail.com>
CC: <etnaviv@lists.freedesktop.org>, <detheridge@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH] drm/etnaviv: force flush on power register ops
Date: Mon, 6 Oct 2025 15:30:09 -0500
Message-ID: <20251006203008.986223-2-rs@ti.com>
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

Force a cache flush on power register operations during etnaviv_hw_reset
with two readbacks. I'm not sure if there are any other calls in this
reset sequence that are susceptible, but without these read ops we see
occasional failures with etnaviv_hw_reset during boot and after multiple
probe/unprobe calls on the am57xx-evm.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index cf0d9049bcf1..320be7f66d74 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -544,12 +544,14 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 
 		/* disable clock gating */
 		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
+		gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
 
 		/* disable pulse eater */
 		pulse_eater |= BIT(17);
 		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
 		pulse_eater |= BIT(0);
 		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
+		gpu_read_power(gpu, VIVS_PM_PULSE_EATER);
 
 		/* enable clock */
 		control = VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
-- 
2.51.0

