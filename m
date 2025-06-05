Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23145ACEF50
	for <lists+etnaviv@lfdr.de>; Thu,  5 Jun 2025 14:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277F010E83D;
	Thu,  5 Jun 2025 12:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YjzQjZNx";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E4F10E806
 for <etnaviv@lists.freedesktop.org>; Thu,  5 Jun 2025 12:12:57 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-60477f1a044so1537068a12.0
 for <etnaviv@lists.freedesktop.org>; Thu, 05 Jun 2025 05:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749125576; x=1749730376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9zNALnQWTXcJqsJ+K+qLSJhT/CLM1q+Dop83ialWRE=;
 b=YjzQjZNxHmdOysSVyLEictlGUCRhJfFtUZQLnoV1yhQq4yZYBi0aGL/DKGPV8R5uY6
 NU+fvBkY6qlK1GoWcINsBt7kosWWZxaZs4eyeIXNFEajKdHA/c2mkmGjmP27PSx+GJl3
 PqDBnefEADoE1LZrifk9lU/LFsg8g0XmMCTvUTRrXqZ8pmSdmDJqBAVovM2VPZ2uksLP
 RkJHBmm2eQkTESGWQDWdEkQRQdAtTpM28mUAJIloDEDV3bW+F5202PoR/nyl12q6yLPh
 ZXtL5bVkJBZhw+ss+WTi+XUCz/ykou3oEnE3zpB2f+950IgW4tqLphlPWOAS8ky0mcbO
 W1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749125576; x=1749730376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9zNALnQWTXcJqsJ+K+qLSJhT/CLM1q+Dop83ialWRE=;
 b=JUp7DdKU02dV+9nhmPspe9LZRxhHP/uel3aPmRBqxUzJWb5tRMf/panDOQx+xKY+fs
 BcaC7OypS/fpfqJ4ZAJmVMJBLBmsxk2r7EOr8r32C5/6ZkHH6Nz2p8Fh+ltI9LtzaSm+
 qqXNgkfOI5II0IAt8bbrCaAbmQWP7KNexZMS8ENMljNmdklo7RMVKbu9QRyZO8w7yqMu
 Q6s0W8qrX7BGIDxFTfx/dXeF7Sd1SU3AJFaOpEMeQnGjWLYMLJVr9QEwiBwasKcrGobd
 0KlRhGBgQHh/AbudIwBQt5WzueWfUz0Q3YyP0tb8FdJ++EXpgDatewyjMifulJhLDkZ1
 wnlQ==
X-Gm-Message-State: AOJu0YxquZQ5A7knC8x1zH+60Gc/HlxBEgmg2B3tAaS5j+H8FIqOQ3d3
 nbmPjM+FHBMSMARzD7q8zFQqFqB4uusbi8RD3Siu5bZ+THRS0BcElMe97MeX6Q==
X-Gm-Gg: ASbGncv/imQcOKoaj6b3UlR3Cy7FszQVmzkTUGh1wbWdfx5ZaN3iUqhuT/Jb7swsnl2
 WFWef4N8erZkSGb9hTb5QK7HproOG3iYSFbKyp2IN+PFU0lSZvsgzVkQBs/f0cfO0uXsqP9ho5H
 STukgBl82YfDqoa6I4S56/xCheNZfsF8T09ampe1T0n9qpG/UsbRHnT/dUtkViQ3h4bRoHd3IMj
 HMcPC5bfKbJOWOFiihvgH2d9O0kDm38nn+XDyBcbDr3Z33Qh3VrckUv0/sMM6DJXfJnHSttylT7
 dx86qHb0u0sT6sBe+VlXiQPCpYEW0HBQk944N0kZfdlcDpt931agvx9M6kb6i9cc7u0ALQ==
X-Google-Smtp-Source: AGHT+IHOWZUcORUDhD8kMmQYKxZN5VTt8qIXiQVIEdO6iOyFshEoaif8dyHxVJsu9ggaWbCAoUJSJw==
X-Received: by 2002:a05:6402:34cc:b0:5f7:29e0:5cf9 with SMTP id
 4fb4d7f45d1cf-606e91ff76dmr5679428a12.5.1749125575489; 
 Thu, 05 Jun 2025 05:12:55 -0700 (PDT)
Received: from rivendell.box ([2a02:2454:c280:4800:7b01:afa0:a96d:a592])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-606bea242d3sm3360645a12.60.2025.06.05.05.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 05:12:55 -0700 (PDT)
From: Gert Wollny <gw.fossdev@gmail.com>
X-Google-Original-From: Gert Wollny <gert.wollny@collabora.com>
To: etnaviv@lists.freedesktop.org
Cc: Gert Wollny <gert.wollny@collabora.com>
Subject: [RFC PATCH 2/4] etnaviv: move some functions to a header to be able
 to use them
Date: Thu,  5 Jun 2025 14:12:04 +0200
Message-ID: <20250605121230.3405127-3-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250605121230.3405127-1-gert.wollny@collabora.com>
References: <20250605121230.3405127-1-gert.wollny@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Jun 2025 12:35:02 +0000
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

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 71 +-------------------
 drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 85 ++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 70 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_buffer.h

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index b13a17276d07..9e007d977efe 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -9,6 +9,7 @@
 #include "etnaviv_gpu.h"
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
+#include "etnaviv_buffer.h"
 
 #include "common.xml.h"
 #include "state.xml.h"
@@ -17,76 +18,6 @@
 #include "state_3d.xml.h"
 #include "cmdstream.xml.h"
 
-/*
- * Command Buffer helper:
- */
-
-
-static inline void OUT(struct etnaviv_cmdbuf *buffer, u32 data)
-{
-	u32 *vaddr = (u32 *)buffer->vaddr;
-
-	BUG_ON(buffer->user_size >= buffer->size);
-
-	vaddr[buffer->user_size / 4] = data;
-	buffer->user_size += 4;
-}
-
-static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer,
-	u32 reg, u32 value)
-{
-	u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
-
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	/* write a register via cmd stream */
-	OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
-		    VIV_FE_LOAD_STATE_HEADER_COUNT(1) |
-		    VIV_FE_LOAD_STATE_HEADER_OFFSET(index));
-	OUT(buffer, value);
-}
-
-static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_END_HEADER_OP_END);
-}
-
-static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
-			    unsigned int waitcycles)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
-}
-
-static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
-	u16 prefetch, u32 address)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_LINK_HEADER_OP_LINK |
-		    VIV_FE_LINK_HEADER_PREFETCH(prefetch));
-	OUT(buffer, address);
-}
-
-static inline void CMD_STALL(struct etnaviv_cmdbuf *buffer,
-	u32 from, u32 to)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_STALL_HEADER_OP_STALL);
-	OUT(buffer, VIV_FE_STALL_TOKEN_FROM(from) | VIV_FE_STALL_TOKEN_TO(to));
-}
-
-static inline void CMD_SEM(struct etnaviv_cmdbuf *buffer, u32 from, u32 to)
-{
-	CMD_LOAD_STATE(buffer, VIVS_GL_SEMAPHORE_TOKEN,
-		       VIVS_GL_SEMAPHORE_TOKEN_FROM(from) |
-		       VIVS_GL_SEMAPHORE_TOKEN_TO(to));
-}
-
 static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
 	struct etnaviv_cmdbuf *buffer, u8 pipe)
 {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
new file mode 100644
index 000000000000..0cb65a0c3bfc
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
@@ -0,0 +1,85 @@
+
+
+#ifndef etnaviv_buffer_h
+#define etnaviv_buffer_h
+
+#include "etnaviv_cmdbuf.h"
+#include "etnaviv_gpu.h"
+#include "etnaviv_gem.h"
+#include "etnaviv_mmu.h"
+
+#include "common.xml.h"
+#include "linux/printk.h"
+#include "state.xml.h"
+#include "state_blt.xml.h"
+#include "state_hi.xml.h"
+#include "state_3d.xml.h"
+#include "cmdstream.xml.h"
+
+static inline void OUT(struct etnaviv_cmdbuf *buffer, u32 data)
+{
+	u32 *vaddr = (u32 *)buffer->vaddr;
+
+	BUG_ON(buffer->user_size >= buffer->size);
+	
+	vaddr[buffer->user_size / 4] = data;
+	buffer->user_size += 4;
+}
+
+static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer,
+	u32 reg, u32 value)
+{
+  
+	u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
+
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	/* write a register via cmd stream */
+	OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
+		    VIV_FE_LOAD_STATE_HEADER_COUNT(1) |
+		    VIV_FE_LOAD_STATE_HEADER_OFFSET(index));
+	OUT(buffer, value);
+}
+
+static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_END_HEADER_OP_END);
+}
+
+static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
+			    unsigned int waitcycles)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
+}
+
+static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
+	u16 prefetch, u32 address)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_LINK_HEADER_OP_LINK |
+		    VIV_FE_LINK_HEADER_PREFETCH(prefetch));
+	OUT(buffer, address);
+}
+
+static inline void CMD_STALL(struct etnaviv_cmdbuf *buffer,
+	u32 from, u32 to)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_STALL_HEADER_OP_STALL);
+	OUT(buffer, VIV_FE_STALL_TOKEN_FROM(from) | VIV_FE_STALL_TOKEN_TO(to));
+}
+
+static inline void CMD_SEM(struct etnaviv_cmdbuf *buffer, u32 from, u32 to)
+{
+	CMD_LOAD_STATE(buffer, VIVS_GL_SEMAPHORE_TOKEN,
+		       VIVS_GL_SEMAPHORE_TOKEN_FROM(from) |
+		       VIVS_GL_SEMAPHORE_TOKEN_TO(to));
+}
+
+#endif
-- 
2.47.2

