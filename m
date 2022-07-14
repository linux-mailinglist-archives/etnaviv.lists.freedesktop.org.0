Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD1D574AA0
	for <lists+etnaviv@lfdr.de>; Thu, 14 Jul 2022 12:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142C8A45A1;
	Thu, 14 Jul 2022 10:31:47 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF262A45A0
 for <etnaviv@lists.freedesktop.org>; Thu, 14 Jul 2022 10:31:45 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oBw8G-0005K5-49; Thu, 14 Jul 2022 12:31:44 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 2/2] drm/etnaviv: reap idle mapping if it doesn't match the
 softpin address
Date: Thu, 14 Jul 2022 12:31:43 +0200
Message-Id: <20220714103143.1704573-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220714103143.1704573-1-l.stach@pengutronix.de>
References: <20220714103143.1704573-1-l.stach@pengutronix.de>
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

When a idle BO, which is held open by another process, gets freed by
userspace and subsequently referenced again by e.g. importing it again,
userspace may assign a different softpin VA than the last time around.
As the kernel GEM object still exists, we likely have a idle mapping
with the old VA still cached, if it hasn't been reaped in the meantime.

As the context matches, we then simply try to resurrect this mapping by
increasing the refcount. As the VA in this mapping does not match the
new softpin address, we consequently fail the otherwise valid submit.
Instead of failing, reap the idle mapping.

Cc: stable@vger.kernel.org # 5.19
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index cc386f8a7116..5cf13e52f7c9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -258,7 +258,12 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
 		if (mapping->use == 0) {
 			mutex_lock(&mmu_context->lock);
 			if (mapping->context == mmu_context)
-				mapping->use += 1;
+				if (va && mapping->iova != va) {
+					etnaviv_iommu_reap_mapping(mapping);
+					mapping = NULL;
+				} else {
+					mapping->use += 1;
+				}
 			else
 				mapping = NULL;
 			mutex_unlock(&mmu_context->lock);
-- 
2.30.2

