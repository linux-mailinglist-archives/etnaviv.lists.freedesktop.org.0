Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7887912E2E
	for <lists+etnaviv@lfdr.de>; Fri, 21 Jun 2024 22:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8300410E0D8;
	Fri, 21 Jun 2024 20:00:24 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A5110E07E
 for <etnaviv@lists.freedesktop.org>; Fri, 21 Jun 2024 20:00:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sKkQm-0006WI-VN; Fri, 21 Jun 2024 22:00:20 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sKkQm-0040xr-HE; Fri, 21 Jun 2024 22:00:20 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de
Subject: [PATCH] drm/etnaviv: reduce number of ktime_get calls in IRQ handler
Date: Fri, 21 Jun 2024 22:00:20 +0200
Message-Id: <20240621200020.491579-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

A single IRQ might signal the completion of multiple jobs/fences
at once. There is no point in attaching a new timestamp to each
fence that only differs in when exactly the IRQ handler was able
to process this fence.

Get a single timestamp when the IRQ handler has determined that
there are completed jobs and reuse this for all fences that get
signalled by the handler.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7502c55199b8..7c7f97793ddd 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1548,6 +1548,7 @@ static irqreturn_t irq_handler(int irq, void *data)
 	u32 intr = gpu_read(gpu, VIVS_HI_INTR_ACKNOWLEDGE);
 
 	if (intr != 0) {
+		ktime_t now = ktime_get();
 		int event;
 
 		pm_runtime_mark_last_busy(gpu->dev);
@@ -1597,7 +1598,7 @@ static irqreturn_t irq_handler(int irq, void *data)
 			 */
 			if (fence_after(fence->seqno, gpu->completed_fence))
 				gpu->completed_fence = fence->seqno;
-			dma_fence_signal(fence);
+			dma_fence_signal_timestamp(fence, now);
 
 			event_free(gpu, event);
 		}
-- 
2.39.2

