Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9030DACEF54
	for <lists+etnaviv@lfdr.de>; Thu,  5 Jun 2025 14:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909E910E883;
	Thu,  5 Jun 2025 12:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eiqM8f2Q";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C1F10E7C6
 for <etnaviv@lists.freedesktop.org>; Wed,  4 Jun 2025 21:20:58 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-adb4e36904bso60302866b.1
 for <etnaviv@lists.freedesktop.org>; Wed, 04 Jun 2025 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749072057; x=1749676857; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9zNALnQWTXcJqsJ+K+qLSJhT/CLM1q+Dop83ialWRE=;
 b=eiqM8f2QhQiR74ese5Pj2uwxwi2V+wE+iIHGiKxiHBfro0NadR5tl9dk4ZWWnAsU3s
 dAJJLMEW6OckpRkd6qlTIVhaACD5sjaOy88Y1J+rNimCrCq7CBEb2IqNPiPgorC6flsW
 slJVw2du9Ss6Gjqq0cZrZ2L69J/3p4cNtXHvtlLfa6TcCwMmp9PwT78Ijom+71faGTQQ
 OmYyhV294NmBiqQShig/ymYBabBazEEtH0lvty/fOiJSdqWas3rmVbxq+iy8G8n20xk6
 biWyYZ0KLPeRjm6yKngAUHMspI9zFrTPI6CKyv7ygQAPuNBQ89JPs14/lD0rF2HV8j98
 xf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749072057; x=1749676857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9zNALnQWTXcJqsJ+K+qLSJhT/CLM1q+Dop83ialWRE=;
 b=EY78kyLbzGKxPe4JE4lqPG9qfJ2o/4lBxSEcgg7vYFSJQav/0reNnjVT919DrrPwmu
 wfwP18wgpUCaA5N2gVQcQlGbYpDGTXmZkK7NWmQCx6LADwzNicdf935dpVvV9qn2/Zao
 U9aJglcG4yBiVxoJrDFYXynsH00ATI7rYZL0ZOEt9hYxx0Cr8lmvINBh8GJgUG2fzAga
 msFl6CjMuGKjMHhp2PzXcMEOPFXLTP2KK8qdrulOUmdHBJS7uJrd42NfjJExaedJ4qQa
 3HwAXTZF1HDeR07JYE7itxQQDrsiz1P1/fYPDI5utnvAR539RLs4XDMN+LCRTSuxWVAo
 8apQ==
X-Gm-Message-State: AOJu0Yy/6gN9p3c8ra1Na+ssJdkfjHSxqoPm+2N+MbJWi3FfbA/NqMQQ
 d/TWVSCBGCY2OxGUIVNjy/9WuoTWzxlxnabP6rhZCpKVPWvrng0IIu6XYJMPvFko
X-Gm-Gg: ASbGnctCvNO2XiC/NUf5I6SQucOXCwDYztA+ybMmTx0uL1BEjYMGOEmo6qiYNm3Veza
 pQn4BiHFUS1jiiCCewFvRaBs58s9h4ZpcBPAb2lGhMY31jdh3UkQtxs0f8gkq2hoL09RZtS2CZW
 L+r7RjiWEdW6eFm9A106lfOJvov+Yd7KM1dFCBNwY6is9kmX0kuMMZk5pq4ohcxo9puRqOUPcsG
 7RnAI0aZMjQlZmlloplpZzlR2ydAihRGgPQWIoZHyyNlPsHkhULOGvUkB8fX4UtQCU+RPYtECFN
 aOziv/0dVrtPOhJNYwO36jqjr+cGzelj5po+AVEf1Fu60slnD10xxXOJgyR616tzGMZCCDfDv+0
 =
X-Google-Smtp-Source: AGHT+IGRTxoVGU9YYUokZQ3lJ2Db9CNWtTUtCbzSVjnS91sxfPRRJ5Y796eY8/KQrFmU/dV93wcdwg==
X-Received: by 2002:a17:906:6992:b0:ad8:9c97:c2dd with SMTP id
 a640c23a62f3a-addf8cdbaacmr311816966b.17.1749072056883; 
 Wed, 04 Jun 2025 14:20:56 -0700 (PDT)
Received: from rivendell.box ([2a02:2454:c280:4800:63d:9df9:3ebb:5fc6])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ada5dd043a9sm1145699466b.89.2025.06.04.14.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 14:20:56 -0700 (PDT)
From: Gert Wollny <gw.fossdev@gmail.com>
X-Google-Original-From: Gert Wollny <gert.wollny@collabora.com>
To: etnaviv@lists.freedesktop.org
Cc: Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH 2/4] etnaviv: move some functions to a header to be able to
 use them
Date: Wed,  4 Jun 2025 23:19:20 +0200
Message-ID: <20250604212032.3387616-3-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250604212032.3387616-1-gert.wollny@collabora.com>
References: <20250604212032.3387616-1-gert.wollny@collabora.com>
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

