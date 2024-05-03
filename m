Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68398BAEE6
	for <lists+etnaviv@lfdr.de>; Fri,  3 May 2024 16:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C465210E05D;
	Fri,  3 May 2024 14:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="c9n3nygq";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE9E10E05D
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2024 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714746183;
 bh=/pcxvMiAYpOYbton7TFHTM19WScbTS/aXVSA8wx/Ahc=;
 h=From:To:Cc:Subject:Date:From;
 b=c9n3nygqOfu8rxGldckmGK0znCioIyL3tDhQucOoOwcbZjl0jEwvdlrjRxaIoDh9K
 cNNQw/TKmDiiZPrSZAEb/OYI10e4cQOir7H+vgkaXXUlhQ8DluT+5WqNvy9gYC74I1
 3185mI0cIM8U0FQGLXc+nnzCSIlCfT+9JNCTmKBh9RPpS4kxQxkCSyJ7beLJHNWD5U
 NEL//jxBfWq+79bdNVY/Xl2FSB31HPoCSut16RzCTBCIssCKRCP3PK0HPmQ9NNhKT2
 DtPbChpuAL2RF+ievwFjhsy8fetVhRhEYOTZagSmpBRkXhb9w+ZDXbITcmT/jK4RRK
 7N+iVsMDhMxrQ==
Received: from sisyphus.fouville.ca (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: derekf)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7C5CF37804B2;
 Fri,  3 May 2024 14:23:02 +0000 (UTC)
From: Derek Foreman <derek.foreman@collabora.com>
To: etnaviv@lists.freedesktop.org
Cc: Derek Foreman <derek.foreman@collabora.com>
Subject: [PATCH] drm/etnaviv: during dump, read registers twice
Date: Fri,  3 May 2024 09:22:55 -0500
Message-ID: <20240503142255.263399-1-derek.foreman@collabora.com>
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

The vivante driver always reads dma registers twice and discards the first
value - we need to do this too or at least the DMA address and low/high
fetches can return wrong results.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_dump.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
index 898f84a0fc30..8a8ca8dcc49a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
@@ -91,6 +91,8 @@ static void etnaviv_core_dump_registers(struct core_dump_iterator *iter,
 		    read_addr <= VIVS_PM_PULSE_EATER)
 			read_addr = gpu_fix_power_address(gpu, read_addr);
 		reg->reg = cpu_to_le32(etnaviv_dump_registers[i]);
+		/* Discard first read, as it is frequently inaccurate */
+		gpu_read(gpu, read_addr);
 		reg->value = cpu_to_le32(gpu_read(gpu, read_addr));
 	}
 
-- 
2.44.0

