Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470A2ACEF52
	for <lists+etnaviv@lfdr.de>; Thu,  5 Jun 2025 14:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D99210E882;
	Thu,  5 Jun 2025 12:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hyx1R8j+";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF1C10E806
 for <etnaviv@lists.freedesktop.org>; Thu,  5 Jun 2025 12:12:56 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-606741e8e7cso1532229a12.1
 for <etnaviv@lists.freedesktop.org>; Thu, 05 Jun 2025 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749125575; x=1749730375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dhq8N85DNbCg64/021wjsDyrSdEvY3ei6kXgVhuu4gM=;
 b=hyx1R8j+x7J9MCW/A2EA5JMkoHi31q48SNPrHBvt8nNaRKBi2R5gC4M9w2POq0KvF+
 j4txi2Ds56gTpXiWRU2nMiIVJz4rqraPOAd5/91N7pGA8lptXQ8an6Ly6/H2g/Zir0bV
 E7Y1Amh0Fhx44PeSHLsXEbhmL+Z3YgN8sKs4+6akiVhPABEGg9pZA8IanPcXAB1Oyl39
 UwcswJMbynFeoFM9/fYpR1T4zxQotUnRrLcZNR6B3www/Le0QUjz+4o34ay2u498ZD7J
 DZ3qyQtiBhbEibnktp8j7jn+akTCuoals7K4EhR5f98SUKq2JMgE5iDHmmwDOjEodp5X
 mOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749125575; x=1749730375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dhq8N85DNbCg64/021wjsDyrSdEvY3ei6kXgVhuu4gM=;
 b=Ftpl3ImGaO8g4QVAlxumhMfyRjicqC5OS4tlGYBHTH3EENme7Pq0FpfyjYMnni6nEZ
 B6qnfOt2oLZAH+AZbIv7DjgUCBIWN+KqdWp/TWtVMQHVrrJYepvCvauRTT0h3tIsc46h
 +ynDU1NSI718x6r0Sq7XEPx/pkWOY5bwNPGGaLZThFG/VlrCwmQGbsvgZPXUtarIZmgC
 KKRA/qcZ9NWsMypkFdhJHLHQ+i4Q0/Y/uiqY+oU+XEV4oPAqZK7z5sicdU8ZkUbmBvf/
 ol5exPuJIhjGhbOqf1T3erdUdRBPdxlea3u31HkLxREv0CCbeJlSCXCjbEOCG3kzlXwH
 VCrg==
X-Gm-Message-State: AOJu0YzuG+x2K3pXG2XrjmO+j4NGpCYu1vvH51us1dTWtd//QU1jzIxX
 quvqUpzCJ8nV6PxQMPtKgCyUeKlNFqPTU31kZfwyi5i229rwfxQ2K4fPkfae0A==
X-Gm-Gg: ASbGnctRyp8q9T4TFpZH/AL2sshy6uIxJ87XNEyx9yoiLDHYPrJr3YaN6Z+5OuHAR/Q
 glcwPGihvMROp2NdxSuIBIoXtgE7kktxVl2FYjvpF8C/NPcLTj1QeyGf1vrF8W24gyBANYk2Sgt
 IQ4JA6cGvV1O/9JN4Rz/nvjc2BKhVCM10sgqPvX6iiDTlbaNfJZN7xLGFDy29deXcc/uMIa9UE5
 A75oOonqCtkt4Vjd5wES2EKZEwZLXNh0WplcH8F2SV9hJdrRNLmry2Fjzo2xQtAtYiFXBW/3A6V
 m5oH8FO397XocoNF0KojNbFpBk6hHhGCL+aSIT6xU9aVdwy1UBsJrKCYzIsfexIJ6ywEyA==
X-Google-Smtp-Source: AGHT+IG8lyX6WKZ5tkHUDN5Bqv7UOG08HrcPR0mCyltrA78AYYWwDq4SvoDZ/IxOwzHLwbEa1jhxGA==
X-Received: by 2002:a05:6402:1d4f:b0:607:35d8:51ac with SMTP id
 4fb4d7f45d1cf-60735d855a6mr813828a12.0.1749125574885; 
 Thu, 05 Jun 2025 05:12:54 -0700 (PDT)
Received: from rivendell.box ([2a02:2454:c280:4800:7b01:afa0:a96d:a592])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-606bea242d3sm3360645a12.60.2025.06.05.05.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 05:12:54 -0700 (PDT)
From: Gert Wollny <gw.fossdev@gmail.com>
X-Google-Original-From: Gert Wollny <gert.wollny@collabora.com>
To: etnaviv@lists.freedesktop.org
Cc: Gert Wollny <gert.wollny@collabora.com>
Subject: [RFC PATCH 1/4] etnaviv: Add command stream definitions required for
 a PPU flop reset
Date: Thu,  5 Jun 2025 14:12:03 +0200
Message-ID: <20250605121230.3405127-2-gert.wollny@collabora.com>
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
 drivers/gpu/drm/etnaviv/state_3d.xml.h | 93 ++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/state_3d.xml.h b/drivers/gpu/drm/etnaviv/state_3d.xml.h
index ebbd4fcf3096..7bd1181aa44c 100644
--- a/drivers/gpu/drm/etnaviv/state_3d.xml.h
+++ b/drivers/gpu/drm/etnaviv/state_3d.xml.h
@@ -4,6 +4,99 @@
 
 /* This is a cut-down version of the state_3d.xml.h file */
 
+#define VIVS_CL_CONFIG						0x00000900
+#define VIVS_CL_CONFIG_DIMENSIONS__MASK			0x00000003
+#define VIVS_CL_CONFIG_DIMENSIONS__SHIFT			0
+#define VIVS_CL_CONFIG_DIMENSIONS(x)				(((x) << VIVS_CL_CONFIG_DIMENSIONS__SHIFT) & VIVS_CL_CONFIG_DIMENSIONS__MASK)
+#define VIVS_CL_CONFIG_TRAVERSE_ORDER__MASK			0x00000070
+#define VIVS_CL_CONFIG_TRAVERSE_ORDER__SHIFT			4
+#define VIVS_CL_CONFIG_TRAVERSE_ORDER(x)			(((x) << VIVS_CL_CONFIG_TRAVERSE_ORDER__SHIFT) & VIVS_CL_CONFIG_TRAVERSE_ORDER__MASK)
+#define VIVS_CL_CONFIG_ENABLE_SWATH_X				0x00000100
+#define VIVS_CL_CONFIG_ENABLE_SWATH_Y				0x00000200
+#define VIVS_CL_CONFIG_ENABLE_SWATH_Z				0x00000400
+#define VIVS_CL_CONFIG_SWATH_SIZE_X__MASK			0x0000f000
+#define VIVS_CL_CONFIG_SWATH_SIZE_X__SHIFT			12
+#define VIVS_CL_CONFIG_SWATH_SIZE_X(x)				(((x) << VIVS_CL_CONFIG_SWATH_SIZE_X__SHIFT) & VIVS_CL_CONFIG_SWATH_SIZE_X__MASK)
+#define VIVS_CL_CONFIG_SWATH_SIZE_Y__MASK			0x000f0000
+#define VIVS_CL_CONFIG_SWATH_SIZE_Y__SHIFT			16
+#define VIVS_CL_CONFIG_SWATH_SIZE_Y(x)				(((x) << VIVS_CL_CONFIG_SWATH_SIZE_Y__SHIFT) & VIVS_CL_CONFIG_SWATH_SIZE_Y__MASK)
+#define VIVS_CL_CONFIG_SWATH_SIZE_Z__MASK			0x00f00000
+#define VIVS_CL_CONFIG_SWATH_SIZE_Z__SHIFT			20
+#define VIVS_CL_CONFIG_SWATH_SIZE_Z(x)				(((x) << VIVS_CL_CONFIG_SWATH_SIZE_Z__SHIFT) & VIVS_CL_CONFIG_SWATH_SIZE_Z__MASK)
+
+#define VIVS_CL_CONFIG_DIMENSIONS__MASK			0x00000003
+#define VIVS_CL_CONFIG_DIMENSIONS__SHIFT			0
+#define VIVS_CL_CONFIG_DIMENSIONS(x)				(((x) << VIVS_CL_CONFIG_DIMENSIONS__SHIFT) & VIVS_CL_CONFIG_DIMENSIONS__MASK)
+
+#define VIVS_CL_CONFIG_VALUE_ORDER__MASK			0x07000000
+#define VIVS_CL_CONFIG_VALUE_ORDER__SHIFT			24
+#define VIVS_CL_CONFIG_VALUE_ORDER(x)				(((x) << VIVS_CL_CONFIG_VALUE_ORDER__SHIFT) & VIVS_CL_CONFIG_VALUE_ORDER__MASK)
+
+#define VIVS_CL_GLOBAL_WORK_OFFSET_X				0x0000092c
+#define VIVS_CL_GLOBAL_WORK_OFFSET_Y				0x00000934
+#define VIVS_CL_GLOBAL_WORK_OFFSET_Z				0x0000093c
+
+#define VIVS_CL_KICKER						0x00000920
+#define VIVS_CL_THREAD_ALLOCATION				0x0000091c
+#define VIVS_CL_UNK00924					0x00000924
+
+#define VIVS_CL_WORKGROUP_COUNT_X				0x00000940
+#define VIVS_CL_WORKGROUP_COUNT_Y				0x00000944
+#define VIVS_CL_WORKGROUP_COUNT_Z				0x00000948
+#define VIVS_CL_WORKGROUP_SIZE_X				0x0000094c
+#define VIVS_CL_WORKGROUP_SIZE_Y				0x00000950
+#define VIVS_CL_WORKGROUP_SIZE_Z				0x00000954
+
+#define VIVS_PA_VS_OUTPUT_COUNT				0x00000aa8
+#define VIVS_PS_CONTROL_EXT					0x00001030
+#define VIVS_PS_ICACHE_COUNT					0x00001094
+#define VIVS_PS_ICACHE_PREFETCH				0x00001048
+
+#define VIVS_PS_INPUT_COUNT					0x00001008
+#define VIVS_PS_INPUT_COUNT_COUNT__MASK			0x0000001f
+#define VIVS_PS_INPUT_COUNT_COUNT__SHIFT			0
+#define VIVS_PS_INPUT_COUNT_COUNT(x)				(((x) << VIVS_PS_INPUT_COUNT_COUNT__SHIFT) & VIVS_PS_INPUT_COUNT_COUNT__MASK)
+
+
+#define VIVS_PS_NEWRANGE_LOW					0x0000087c
+#define VIVS_PS_NEWRANGE_HIGH					0x00001090
+#define VIVS_PS_SAMPLER_BASE					0x00001058
+
+#define VIVS_PS_UNIFORM_BASE					0x00001024
+#define VIVS_PS_INST_ADDR					0x00001028
+
+#define VIVS_PS_TEMP_REGISTER_CONTROL				0x0000100c
+#define VIVS_PS_TEMP_REGISTER_CONTROL_NUM_TEMPS__MASK		0x0000003f
+#define VIVS_PS_TEMP_REGISTER_CONTROL_NUM_TEMPS__SHIFT		0
+#define VIVS_PS_TEMP_REGISTER_CONTROL_NUM_TEMPS(x)		(((x) << VIVS_PS_TEMP_REGISTER_CONTROL_NUM_TEMPS__SHIFT) & VIVS_PS_TEMP_REGISTER_CONTROL_NUM_TEMPS__MASK)
+
+#define VIVS_PS_VARYING_NUM_COMPONENTS(i0)		       (0x00001080 + 0x4*(i0))
+#define VIVS_PS_VARYING_NUM_COMPONENTS__ESIZE			0x00000004
+#define VIVS_PS_VARYING_NUM_COMPONENTS__LEN			0x00000004
+
+#define VIVS_SH_CONFIG						0x00015600
+#define VIVS_SH_CONFIG_RTNE_ROUNDING				0x00000002
+
+#define VIVS_SH_HALTI5_UNIFORMS(i0)			       (0x00036000 + 0x4*(i0))
+#define VIVS_SH_HALTI5_UNIFORMS__ESIZE				0x00000004
+#define VIVS_SH_HALTI5_UNIFORMS__LEN				0x00000800
+
+#define VIVS_VS_HALTI5_UNK008A0				0x000008a0
+#define VIVS_VS_HALTI5_UNK008A0_A__MASK			0x0000003f
+#define VIVS_VS_HALTI5_UNK008A0_A__SHIFT			0
+#define VIVS_VS_HALTI5_UNK008A0_A(x)				(((x) << VIVS_VS_HALTI5_UNK008A0_A__SHIFT) & VIVS_VS_HALTI5_UNK008A0_A__MASK)
+
+
+#define VIVS_VS_ICACHE_CONTROL					0x00000868
+#define VIVS_VS_ICACHE_CONTROL_ENABLE				0x00000001
+
+#define VIVS_VS_ICACHE_INVALIDATE				0x000008b0
+
+#define VIVS_VS_OUTPUT_COUNT					0x00000804
+#define VIVS_VS_OUTPUT_COUNT_COUNT__MASK			0x000000ff
+#define VIVS_VS_OUTPUT_COUNT_COUNT__SHIFT			0
+#define VIVS_VS_OUTPUT_COUNT_COUNT(x)				(((x) << VIVS_VS_OUTPUT_COUNT_COUNT__SHIFT) & VIVS_VS_OUTPUT_COUNT_COUNT__MASK)
+
 #define VIVS_TS_FLUSH_CACHE					0x00001650
 #define VIVS_TS_FLUSH_CACHE_FLUSH				0x00000001
 
-- 
2.47.2

