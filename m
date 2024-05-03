Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAB18BB3BD
	for <lists+etnaviv@lfdr.de>; Fri,  3 May 2024 21:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF33F112946;
	Fri,  3 May 2024 19:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dzzjI8ym";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6650112947
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2024 19:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714763533;
 bh=TKxFj/6Z5sWkTKKlk/YE73nFXdS87Oxz0jFbG+nFuFU=;
 h=From:To:Cc:Subject:Date:From;
 b=dzzjI8ym3Plvdv7UB5NXDb31IwiKmEzAOMHIKxcV2+Tj7unDhtsTGr0+JTEuacRHL
 55VBX0H3KMMPMSAgUSdUMXYuWNf9G4UOAYiBqkbRYcDK93lwxn5JehJCOpglM+kIWI
 Wbup5Ppn0/wObsnUW4CYlfUKBq+SSxK88m8wuxyAtvSyFX2M0KF1pIX6OPJkpuhvJB
 639b4nXwf1cMAfQvr1AwQ2B4SOha9UAELShciSCMkJKLMP96siF8PWbFXmes1GFx04
 xDzzNnONJsvCHgVgAjgw8o8g0k1j96Nu0QRuHySJ+nYTcZoyCHQofKf1xzu551/2h8
 amcHGNMAz9Yrg==
Received: from sisyphus.fouville.ca (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: derekf)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9E50F378143B;
 Fri,  3 May 2024 19:12:12 +0000 (UTC)
From: Derek Foreman <derek.foreman@collabora.com>
To: etnaviv@lists.freedesktop.org
Cc: Derek Foreman <derek.foreman@collabora.com>
Subject: [PATCH] drm/etnaviv: Read some FE registers twice
Date: Fri,  3 May 2024 14:11:58 -0500
Message-ID: <20240503191158.281396-1-derek.foreman@collabora.com>
X-Mailer: git-send-email 2.44.0
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

On some hardware (such at the GC7000 rev 6009), these registers need to be
read twice to return the correct value. Hide that in gpu_read().

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 197e0037732e..0f67c62be3d1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -11,6 +11,7 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_drv.h"
 #include "common.xml.h"
+#include "state.xml.h"
 
 struct etnaviv_gem_submit;
 struct etnaviv_vram_mapping;
@@ -170,6 +171,13 @@ static inline void gpu_write(struct etnaviv_gpu *gpu, u32 reg, u32 data)
 
 static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
 {
+	/* On some variants, such as the GC7000 6009, some FE registers
+	 * need two reads to be consistent. Do that extra read here and
+	 * throw away the result.
+	 */
+	if (reg >= VIVS_FE_DMA_STATUS && reg <= VIVS_FE_AUTO_FLUSH)
+		readl(gpu->mmio + reg);
+
 	return readl(gpu->mmio + reg);
 }
 
-- 
2.44.0

