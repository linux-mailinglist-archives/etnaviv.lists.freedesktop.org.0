Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6A88CB295
	for <lists+etnaviv@lfdr.de>; Tue, 21 May 2024 19:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC81910E204;
	Tue, 21 May 2024 17:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b1aubXPL";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D322910E204
 for <etnaviv@lists.freedesktop.org>; Tue, 21 May 2024 17:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716311041;
 bh=Mnc2SDbKIB43tl7ceLGDbnoTuC2zphOUN1BR+6BDCXo=;
 h=From:To:Cc:Subject:Date:From;
 b=b1aubXPLmEQ2YWGcUdcNFml0HhFu558Miv9XFvozA45ADugxhdsWoziHf0WEusgkm
 t+ITgPOX6seDH/JdjfRbyJkd0NKL/Qu4t7ENJTzuqdnE14seKPoxpvMacbU/o6fteT
 uVMEg1TjkwhttJ/Shsh0XLAoEnUtbWWVYRh5Dup7bWObWU+X9m0RnlR+RU5YaL4DEN
 4RBMlB+w8NUQNeJfjW6hBwajQ6jf4DBI4jFA0RisgOpco0eRxvKCHoqLnri7xGF8uU
 K2rVv4caF2ugrVb76D0eUhP0AwJlJvhghy9hv7V1/37i41zcGozCe36TMOWkdIJtg3
 qtNkGxKDMnPRA==
Received: from sisyphus.fouville.ca (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: derekf)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E1A62378218B;
 Tue, 21 May 2024 17:04:00 +0000 (UTC)
From: Derek Foreman <derek.foreman@collabora.com>
To: etnaviv@lists.freedesktop.org
Cc: Derek Foreman <derek.foreman@collabora.com>
Subject: [PATCH v2] drm/etnaviv: Read some FE registers twice
Date: Tue, 21 May 2024 12:03:53 -0500
Message-ID: <20240521170353.1003402-1-derek.foreman@collabora.com>
X-Mailer: git-send-email 2.45.0
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
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 197e0037732e..c68e91839428 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -11,6 +11,7 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_drv.h"
 #include "common.xml.h"
+#include "state.xml.h"
 
 struct etnaviv_gem_submit;
 struct etnaviv_vram_mapping;
@@ -170,6 +171,14 @@ static inline void gpu_write(struct etnaviv_gpu *gpu, u32 reg, u32 data)
 
 static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
 {
+	/*
+	 * On some variants, such as the GC7000 6009, some FE registers
+	 * need two reads to be consistent. Do that extra read here and
+	 * throw away the result.
+	 */
+	if (reg >= VIVS_FE_DMA_STATUS && reg <= VIVS_FE_AUTO_FLUSH)
+		readl(gpu->mmio + reg);
+
 	return readl(gpu->mmio + reg);
 }
 
-- 
2.45.0

