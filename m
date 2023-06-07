Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665F7726022
	for <lists+etnaviv@lfdr.de>; Wed,  7 Jun 2023 14:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBA210E4E4;
	Wed,  7 Jun 2023 12:58:45 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B8D10E4E4
 for <etnaviv@lists.freedesktop.org>; Wed,  7 Jun 2023 12:58:44 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q6skM-0003bY-BW; Wed, 07 Jun 2023 14:58:42 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: disable MLCG and pulse eater on GPU reset
Date: Wed,  7 Jun 2023 14:58:41 +0200
Message-Id: <20230607125841.3518385-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Module level clock gating and the pulse eater might interfere with
the GPU reset, as they both have the potential to stop the clock
and thus reset propagation to parts of the GPU.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
I'm not aware of any cases where this would have been an issue, but
it is what the downstream driver does and fundametally seems like
the right thing to do.
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index de8c9894967c..41aab1aa330b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -505,8 +505,19 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 	timeout = jiffies + msecs_to_jiffies(1000);
 
 	while (time_is_after_jiffies(timeout)) {
-		/* enable clock */
 		unsigned int fscale = 1 << (6 - gpu->freq_scale);
+		u32 pulse_eater = 0x01590880;
+
+		/* disable clock gating */
+		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
+
+		/* disable pulse eater */
+		pulse_eater |= BIT(17);
+		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
+		pulse_eater |= BIT(0);
+		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
+
+		/* enable clock */
 		control = VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
 		etnaviv_gpu_load_clock(gpu, control);
 
-- 
2.39.2

