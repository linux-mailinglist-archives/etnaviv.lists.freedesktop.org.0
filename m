Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22654ACEF4F
	for <lists+etnaviv@lfdr.de>; Thu,  5 Jun 2025 14:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D22B10E869;
	Thu,  5 Jun 2025 12:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MbEvGC8B";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E3C10E806
 for <etnaviv@lists.freedesktop.org>; Thu,  5 Jun 2025 12:12:58 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so1702322a12.2
 for <etnaviv@lists.freedesktop.org>; Thu, 05 Jun 2025 05:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749125577; x=1749730377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YioNfLI7E8HOst2Zp/r8rdYtaqc4fLx1DeGfyAUzAaI=;
 b=MbEvGC8BYOE96/p11bjE65F/KXybZJdSuzvoFivcNI+YyKeDR+fc9fIJGUuHml28j+
 S3jYbzd5MQA7rQC0xCUKrj++hfItDMQir/Xj8yTvomhoTXscMSBviBLpiYh1KgHYTJWW
 p5Q5wZtwkjksFe5JmmulLZhs9SckUgdVY5flMbDFC+rqzUuQj+DYZUT8JoosREWOH/gF
 AX5HNgbWAp0UmQ5WfKq4Zq5EN9CL5dLqHCp2PZsqAajbtGLu9OqAczGIggxrBeKiJ5F5
 Pm3G4nla3LxT6keiD4y4CyaiafCAuXJzVY3+/zWfw+zFuF7xnM7KCzvWPTL1pF4YS4zP
 /Zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749125577; x=1749730377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YioNfLI7E8HOst2Zp/r8rdYtaqc4fLx1DeGfyAUzAaI=;
 b=bGgr58oAKi9wj2cttjY7qgt/Z1Cgwg7ybkwypRX3b3jAK0UgqeeIcpTaV74t4CqeM+
 nzH3H5MqCL7YWBMwjVczcelQjsw4L29tFYB1JhmUpw3KO176Kj4zU21yUQ51k2XUGXaH
 cKmpFR1pWhYmJBgfLxXwqC3n4w0myuDzLFiKoJHTNRTegnuuJQS0ju9LHdw7XuVs6Rj1
 c1WS2ie1vutcBCazKUhrji/gxhHzafZvck2x6OELlbKaqTkleR1JZpgT04A6LBdiLd/U
 OJoG0wBQ3wlJiQgdoCSpUdSbb7x2cMZvi0vKGpo4xjksEQX7EjT1iudnMWUakqbMwCkU
 p97Q==
X-Gm-Message-State: AOJu0YzzVu7bD+kU/PRWOsWRvnXxguZdh6mE0zTxyj6QyjkbQGQtHQj+
 WgrbKUiwZXal1QZvWrfrrU7OpOXNWJ1aohh9A93SXBIS30xsaz5meF8q678XOQ==
X-Gm-Gg: ASbGnctyGW4HHtGOMB4DjnvTSD1TlwQ5pcd9rb33ssImjMtimfAw9r4YBes8oVNbGWL
 pEQUTuLPFJZ49HijshFO48BZy3dtzkXEB0U5fb6AONeQzajkwu/lRHGWYCe2FLWxg90jGOZ6MEl
 1PWuKEL32v7SwHJRI/qmPrq+8jtOoWAnGowVEQa52SQUe0GPVtabbkY6wackJzX1nahl5PjgUaa
 Wh0pxV68cixDdGyUPT43+eEWxO9ZKKNMpiGoHlWBYqZHE78PDuqiD9nMqlrqRVo5RZyiQpE8cyC
 6zCZbVvHCOwrWYG1mvjorbK1D95RbLcZLqwAdPmzR5yBhs33z7nHnel6zvA=
X-Google-Smtp-Source: AGHT+IEJ+H9uYJMbjEjmCKgGXd4T3/2ecNX2jRa+fyFaAkL/YWt1mrtE5WcSUIWpgS2d4IGNC6vQ3g==
X-Received: by 2002:a05:6402:280b:b0:606:b778:78af with SMTP id
 4fb4d7f45d1cf-606ea1913ddmr7056267a12.27.1749125576707; 
 Thu, 05 Jun 2025 05:12:56 -0700 (PDT)
Received: from rivendell.box ([2a02:2454:c280:4800:7b01:afa0:a96d:a592])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-606bea242d3sm3360645a12.60.2025.06.05.05.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 05:12:56 -0700 (PDT)
From: Gert Wollny <gw.fossdev@gmail.com>
X-Google-Original-From: Gert Wollny <gert.wollny@collabora.com>
To: etnaviv@lists.freedesktop.org
Cc: Gert Wollny <gert.wollny@collabora.com>
Subject: [RFC PATCH 4/4] etnaviv: Add PPU flop reset
Date: Thu,  5 Jun 2025 14:12:06 +0200
Message-ID: <20250605121230.3405127-5-gert.wollny@collabora.com>
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

The PPU flop reset is required on some hardware to clear the
temporary registers. This implementation follows the code
implemented in the public galcore kernel module code to this
for the PPU.

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/Makefile             |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |  15 +-
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c | 162 +++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h |  13 ++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |   2 +
 5 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h

diff --git a/drivers/gpu/drm/etnaviv/Makefile b/drivers/gpu/drm/etnaviv/Makefile
index 46e5ffad69a6..903101e8751a 100644
--- a/drivers/gpu/drm/etnaviv/Makefile
+++ b/drivers/gpu/drm/etnaviv/Makefile
@@ -14,6 +14,7 @@ etnaviv-y := \
 	etnaviv_iommu.o \
 	etnaviv_mmu.o \
 	etnaviv_perfmon.o \
+	etnaviv_flop_reset.o \
 	etnaviv_sched.o
 
 obj-$(CONFIG_DRM_ETNAVIV)	+= etnaviv.o
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index 9e007d977efe..7c60088e4c4d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -18,6 +18,8 @@
 #include "state_3d.xml.h"
 #include "cmdstream.xml.h"
 
+#include "etnaviv_flop_reset.h"
+
 static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
 	struct etnaviv_cmdbuf *buffer, u8 pipe)
 {
@@ -91,15 +93,26 @@ static u32 etnaviv_buffer_reserve(struct etnaviv_gpu *gpu,
 	       buffer->user_size;
 }
 
+static bool etnaviv_require_flop_reset(const struct etnaviv_chip_identity *chip_id)
+{
+	if (chip_id->model == 0x8000 && chip_id->revision == 0x6205)
+		return true;
+	return false;
+}
+
 u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
 {
-	struct etnaviv_cmdbuf *buffer = &gpu->buffer;
+       struct etnaviv_cmdbuf *buffer = &gpu->buffer;
 
 	lockdep_assert_held(&gpu->lock);
 
 	/* initialize buffer */
 	buffer->user_size = 0;
 
+	/* Queue in PPU flop reset */
+	if (etnaviv_require_flop_reset(&gpu->identity))
+		etnaviv_flop_reset_ppu(gpu);
+
 	CMD_WAIT(buffer, gpu->fe_waitcycles);
 	CMD_LINK(buffer, 2,
 		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
new file mode 100644
index 000000000000..49f2423567a2
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Etnaviv Project
+ */
+
+#include "asm-generic/int-ll64.h"
+#include "etnaviv_buffer.h"
+#include "etnaviv_cmdbuf.h"
+#include "state_3d.xml.h"
+
+#include "etnaviv_flop_reset.h"
+
+#define VIVS_CL_GLOBAL_SCALE_X 0x0958
+#define VIVS_CL_GLOBAL_SCALE_Y 0x095c
+#define VIVS_CL_GLOBAL_SCALE_Z 0x0960
+
+#define PPU_IMAGE_STRIDE 64
+#define PPU_IMAGE_XSIZE 64
+#define PPU_IMAGE_YSIZE 6
+
+#define PPU_FLOP_RESET_INSTRUCTION_DWORD_COUNT 16
+
+static void
+etnaviv_emit_ppu_flopreset_state(struct etnaviv_cmdbuf *cmdbuf,
+				 u32 buffer_base,
+				 u32 input_offset,
+				 u32 output_offset,
+				 u32 shader_offset,
+				 u32 shader_size,
+				 u32 shader_register_count)
+{
+	CMD_LOAD_STATE(cmdbuf, VIVS_GL_API_MODE, VIVS_GL_API_MODE_OPENCL);
+	CMD_SEM(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
+	CMD_STALL(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
+
+	CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(0), 4);
+
+	OUT(cmdbuf, buffer_base + input_offset);
+	OUT(cmdbuf, PPU_IMAGE_STRIDE);
+	OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE  << 16));
+	OUT(cmdbuf, 0x444051f0);
+	OUT(cmdbuf, 0xffffffff);
+
+	CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(4), 4);
+	OUT(cmdbuf, buffer_base + output_offset);
+	OUT(cmdbuf, PPU_IMAGE_STRIDE);
+	OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE  << 16));
+	OUT(cmdbuf, 0x444051f0);
+	OUT(cmdbuf, 0xffffffff);
+
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_CONFIG, VIVS_CL_CONFIG_DIMENSIONS(2) |
+		       VIVS_CL_CONFIG_VALUE_ORDER(3));
+	CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_INVALIDATE, 0x1f);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_VARYING_NUM_COMPONENTS(0), 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_TEMP_REGISTER_CONTROL, shader_register_count);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_SAMPLER_BASE, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_UNIFORM_BASE, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_LOW, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_HIGH, shader_size / 16);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_INST_ADDR, buffer_base + shader_offset);
+	CMD_LOAD_STATE(cmdbuf, VIVS_SH_CONFIG, VIVS_SH_CONFIG_RTNE_ROUNDING);
+	CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_CONTROL, VIVS_VS_ICACHE_CONTROL_ENABLE);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_ICACHE_COUNT, shader_size / 16 - 1);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_INPUT_COUNT, 0x1f01);
+	CMD_LOAD_STATE(cmdbuf, VIVS_VS_HALTI5_UNK008A0, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PA_VS_OUTPUT_COUNT, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_GL_VARYING_TOTAL_COMPONENTS, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_CONTROL_EXT, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_VS_OUTPUT_COUNT, 0x1);
+	CMD_LOAD_STATE(cmdbuf, VIVS_GL_HALTI5_SH_SPECIALS, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_PS_ICACHE_PREFETCH, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_UNK00924, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_THREAD_ALLOCATION, 0x1);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_X, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_Y, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_Z, 0x0);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_SCALE_X, 0x4);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_SCALE_Y, 0x1);
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_SCALE_Z, 0x0);
+
+	CMD_LOAD_STATES_START(cmdbuf, VIVS_CL_WORKGROUP_COUNT_X, 6);
+	OUT(cmdbuf, 0xf);
+	OUT(cmdbuf, 0x5);
+	OUT(cmdbuf, 0xffffffff);
+	OUT(cmdbuf, 0x0);
+	OUT(cmdbuf, 0x0);
+	OUT(cmdbuf, 0x3ff);
+	OUT(cmdbuf, 0x0);
+
+	CMD_LOAD_STATE(cmdbuf, VIVS_CL_KICKER, 0xbadabeeb);
+	CMD_LOAD_STATE(cmdbuf, VIVS_GL_FLUSH_CACHE,
+		       VIVS_GL_FLUSH_CACHE_SHADER_L1 | VIVS_GL_FLUSH_CACHE_UNK10 |
+		       VIVS_GL_FLUSH_CACHE_UNK11);
+}
+
+static void
+etnaviv_flop_reset_ppu_fill_input_image(struct etnaviv_cmdbuf *buffer,
+					u32 size, u32 offset)
+{
+	uint32_t *data = (uint32_t *)buffer->vaddr + offset/sizeof(uint32_t);
+
+	for (int i = 0; i < size/4; ++i, ++data)
+		*data = 0x01010101;
+}
+
+static void
+etnaviv_flop_reset_ppu_set_shader(struct etnaviv_cmdbuf *buffer, u32 offset)
+{
+	u8 *data = (u8 *)buffer->vaddr + offset;
+
+	const uint32_t inst[PPU_FLOP_RESET_INSTRUCTION_DWORD_COUNT] = {
+		/* img_load.u8 r1, c0, r0.xy */
+		0x78011779, 0x39000804, 0x00A90050, 0x00000000,
+		/* img_load.u8 r2, c0, r0.xy */
+		0x78021779, 0x39000804, 0x00A90050, 0x00000000,
+		/* dp2x8 r1, r1, r2, c3_512 */
+		0xB8017145, 0x390018FC, 0x01C90140, 0x40390028,
+		/* img_store.u8 r1, c2, r0.xy, r1 */
+		0x380007BA, 0x39001804, 0x00A90050, 0x00390018,
+	};
+	const u32 shader_size = PPU_FLOP_RESET_INSTRUCTION_DWORD_COUNT * sizeof(uint32_t);
+	memcpy(data, inst, shader_size);
+}
+
+void
+etnaviv_flop_reset_ppu(struct etnaviv_gpu *gpu)
+{
+	const u32 image_data_size = PPU_IMAGE_STRIDE * PPU_IMAGE_YSIZE;
+	const u32 input_offset = 0;
+	const u32 output_offset = ALIGN(image_data_size, 64);
+	const u32 shader_offset = ALIGN(output_offset + image_data_size, 64);
+	const u32 shader_size = PPU_FLOP_RESET_INSTRUCTION_DWORD_COUNT * sizeof(u32);
+	const u32 shader_register_count = 3;
+	const u32 buffer_size = shader_offset + shader_size;
+
+	if (!gpu->ppu_flopreset_data.suballoc) {
+
+		struct etnaviv_drm_private *priv = gpu->drm->dev_private;
+
+		/* Get some space from the rung buffer to put the payload
+		   (input and output image, and shader), we keep this buffer
+		   for the whole life time of the GPU */
+		etnaviv_cmdbuf_init(priv->cmdbuf_suballoc,
+				    &gpu->ppu_flopreset_data, buffer_size);
+		etnaviv_flop_reset_ppu_fill_input_image(&gpu->ppu_flopreset_data,
+							image_data_size,
+							input_offset);
+		etnaviv_flop_reset_ppu_set_shader(&gpu->ppu_flopreset_data,
+						  shader_offset);
+	}
+
+	u32 payload_buffer_base = etnaviv_cmdbuf_get_va(&gpu->ppu_flopreset_data,
+							&gpu->mmu_context->cmdbuf_mapping);
+
+	etnaviv_emit_ppu_flopreset_state(&gpu->buffer,
+					 payload_buffer_base,
+					 input_offset,
+					 output_offset,
+					 shader_offset,
+					 shader_size,
+					 shader_register_count);
+}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
new file mode 100644
index 000000000000..c5c8f77f2176
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Etnaviv Project
+ */
+
+
+#ifndef etnaviv_flop_reset_h
+#define etnaviv_flop_reset_h
+
+void
+etnaviv_flop_reset_ppu(struct etnaviv_gpu *gpu);
+
+#endif
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 5cb46c84e03a..604a47f965b1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -122,6 +122,8 @@ struct etnaviv_gpu {
 	struct etnaviv_cmdbuf buffer;
 	int exec_state;
 
+	struct etnaviv_cmdbuf ppu_flopreset_data;
+
 	/* event management: */
 	DECLARE_BITMAP(event_bitmap, ETNA_NR_EVENTS);
 	struct etnaviv_event event[ETNA_NR_EVENTS];
-- 
2.47.2

