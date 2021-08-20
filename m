Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD43F350B
	for <lists+etnaviv@lfdr.de>; Fri, 20 Aug 2021 22:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3716EB18;
	Fri, 20 Aug 2021 20:18:35 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9117B6EB18
 for <etnaviv@lists.freedesktop.org>; Fri, 20 Aug 2021 20:18:34 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mHAyG-000258-Ou; Fri, 20 Aug 2021 22:18:32 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 4/8] drm/etnaviv: keep MMU context across runtime
 suspend/resume
Date: Fri, 20 Aug 2021 22:18:26 +0200
Message-Id: <20210820201830.2005563-4-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820201830.2005563-1-l.stach@pengutronix.de>
References: <20210820201830.2005563-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

The MMU state may be kept across a runtime suspend/resume cycle, as we
avoid a full hardware reset to keep the latency of the runtime PM small.

Don't pretend that the MMU state is lost in driver state. The MMU
context is pushed out when new HW jobs with a different context are
coming in. The only exception to this is when the GPU is unbound, in
which case we need to make sure to also free the last active context.

Cc: stable@vger.kernel.org # 5.4
Reported-by: Michael Walle <michael@walle.cc>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Michael Walle <michael@walle.cc>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 325858cfc2c3..973843c35fca 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1590,9 +1590,6 @@ static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
 		 */
 		etnaviv_gpu_wait_idle(gpu, 100);
 
-		etnaviv_iommu_context_put(gpu->mmu_context);
-		gpu->mmu_context = NULL;
-
 		gpu->fe_running = false;
 	}
 
@@ -1741,6 +1738,9 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 	etnaviv_gpu_hw_suspend(gpu);
 #endif
 
+	if (gpu->mmu_context)
+		etnaviv_iommu_context_put(gpu->mmu_context);
+
 	if (gpu->initialized) {
 		etnaviv_cmdbuf_free(&gpu->buffer);
 		etnaviv_iommu_global_fini(gpu);
-- 
2.30.2

