Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A990ADF7EB
	for <lists+etnaviv@lfdr.de>; Wed, 18 Jun 2025 22:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F21710E94E;
	Wed, 18 Jun 2025 20:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XciBH6Tx";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF33C10E94F;
 Wed, 18 Jun 2025 20:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750279337;
 bh=J6V/lWrwi9SsMBmzCiPDoKNqm/YDWe50nHVIVs90nIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XciBH6TxyzLidGEdaRtYrDfrHfgrT582Yz2GjjKp48AsoxnGntrVeKFB1mwRCNKw9
 6CWoGmZdAlEMzD3k6XRmehO+ycvBwTX5gOS5N/cXAsDHyam0IyqZcGsWTCjHCyOdrV
 eSK69uMb9mof4a9joj0gq/DyqCoW995XO0AnTgIx5wDLTmX0DdZ0wWEnH5I9Y1+iDC
 HZ21Y3CNxzvHNFcz8i6UeqqmXDRK8W6Nb1RTUuFhRznW8gH1EEDTWbSrwRMPgUVjUJ
 fRUzqPdmVUFu9M+2bIvud5q+89aS5oNs4IFpLVe/M9OAhd0l7wqCKmI/sIFlqnk1SQ
 6L5XD8uvY7sxg==
Received: from localhost.localdomain (unknown [89.186.158.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E0D217E155C;
 Wed, 18 Jun 2025 22:42:17 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v2 3/6] drm/etnaviv: Add a new function to emit a series of
 states to cmd stream
Date: Wed, 18 Jun 2025 22:43:31 +0200
Message-ID: <20250618204400.21808-4-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618204400.21808-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
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

v2: fix formatting and remove superfluous masking (Lucas)

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
index caf820d91ef5..842a7ca55c44 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
@@ -41,6 +41,19 @@ static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer,
 	OUT(buffer, value);
 }
 
+static inline void CMD_LOAD_STATES_START(struct etnaviv_cmdbuf *buffer,
+					u32 reg, u32 nvalues)
+{
+	u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
+
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	/* write a register via cmd stream */
+	OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
+	            VIV_FE_LOAD_STATE_HEADER_OFFSET(index) |
+	            VIV_FE_LOAD_STATE_HEADER_COUNT(nvalues));
+}
+
 static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
 {
 	buffer->user_size = ALIGN(buffer->user_size, 8);
-- 
2.49.0

