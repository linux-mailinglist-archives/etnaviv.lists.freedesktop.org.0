Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3128B90F1
	for <lists+etnaviv@lfdr.de>; Wed,  1 May 2024 22:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D65710EA2B;
	Wed,  1 May 2024 20:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="axUwz/Wc";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A6910EA2B
 for <etnaviv@lists.freedesktop.org>; Wed,  1 May 2024 20:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714597073;
 bh=z8wGCwaUeMdHPdI1K0wVB1JfPnjdDQD2fHcpNTXq7nI=;
 h=From:To:Cc:Subject:Date:From;
 b=axUwz/WchI7Fp18tHCS3q5TTKCO92rK/d5ebiLJSWJI8CSE4co2Eh0l3znSwCr42D
 p7xewXjjazkts/VF4dSw6qQSS2qBpS4ymU64BKiFQb1fyyqNlSHTUaWiJPExaKuxbg
 /mcCAquVgfeYRkDSSG+OvSNTw6pt8CJpcAvVDYbN4T4JnodXR1qp51C+j+zjWAdvKC
 2zlHvvIoeq4lpf91XL6fpAR+X3+vO4QjdZqsdCUMdjRt3e3z5CEdN7ptsyqZJIS5Oh
 OmoWsu54pYUoOMrh1W2gVdXDE6zCd4xEUMqHbJ0cb2y8T9DluzzJ1m+SlfSbsN3Plj
 2B7bG0BXk3bKg==
Received: from sisyphus.fouville.ca (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: derekf)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 93F833781013;
 Wed,  1 May 2024 20:57:52 +0000 (UTC)
From: Derek Foreman <derek.foreman@collabora.com>
To: etnaviv@lists.freedesktop.org
Cc: Derek Foreman <derek.foreman@collabora.com>
Subject: [PATCH] drm/etnaviv: dump DMA registers first
Date: Wed,  1 May 2024 15:57:09 -0500
Message-ID: <20240501205709.129992-1-derek.foreman@collabora.com>
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

On at least some hardware, reading one of these other registers has the
side effect of changing the DMA address register, making dumps much less
useful.

Move some DMA registers to the top of the list to increase the chance of
getting a useful devcoredump.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_dump.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
index 898f84a0fc30..920bbf627aa3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
@@ -25,6 +25,9 @@ struct core_dump_iterator {
 };
 
 static const unsigned short etnaviv_dump_registers[] = {
+	VIVS_FE_DMA_ADDRESS,
+	VIVS_FE_DMA_LOW,
+	VIVS_FE_DMA_HIGH,
 	VIVS_HI_AXI_STATUS,
 	VIVS_HI_CLOCK_CONTROL,
 	VIVS_HI_IDLE_STATE,
@@ -58,9 +61,6 @@ static const unsigned short etnaviv_dump_registers[] = {
 	VIVS_MC_BUS_CONFIG,
 	VIVS_FE_DMA_STATUS,
 	VIVS_FE_DMA_DEBUG_STATE,
-	VIVS_FE_DMA_ADDRESS,
-	VIVS_FE_DMA_LOW,
-	VIVS_FE_DMA_HIGH,
 	VIVS_FE_AUTO_FLUSH,
 };
 
-- 
2.44.0

