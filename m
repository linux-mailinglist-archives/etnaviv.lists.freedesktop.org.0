Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A74ACEF55
	for <lists+etnaviv@lfdr.de>; Thu,  5 Jun 2025 14:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE7310E812;
	Thu,  5 Jun 2025 12:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hgGDukST";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A4610E7C6
 for <etnaviv@lists.freedesktop.org>; Wed,  4 Jun 2025 21:20:57 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-602346b1997so362791a12.3
 for <etnaviv@lists.freedesktop.org>; Wed, 04 Jun 2025 14:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749072056; x=1749676856; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dhq8N85DNbCg64/021wjsDyrSdEvY3ei6kXgVhuu4gM=;
 b=hgGDukST++rMrNaDiL15Hu21Ze8y1VhyIL42z7u2wKer+zHVBe3btWT+wZkIOfUmcl
 eq3GPXRuU5jsQIuQpDO2eoxdE8CRU2iQNGE36ntB+cGHA3XmvIFnZ/qCL8B2ePKvrC7y
 l92Ur9VPgJoIrS0ZaGh1J79fnyRKrJCuKOO3DcbBKrczhUZTnDpa7LXETGXz9MdGRu9i
 f7qcQpKHxD55PF6vb3MdKuU4jvZPegeUVTKItArwlmUvAjwd4WNWUkdISwGJdmjHJH9F
 bkwSyaPk6ZJC5tjx5+NC/PRkxygx9jeYV7gKh5fsLeZDb+sIFPfMJrJ5hoH+6Qk4ASer
 Lpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749072056; x=1749676856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dhq8N85DNbCg64/021wjsDyrSdEvY3ei6kXgVhuu4gM=;
 b=KfyoK9aQddUy9rLMSW1mWzTKaPsA0OowDIA3McVFMaYKoO/txjbIjKCiRKhWebxUaJ
 F0zWay4I2ZwELJR06LG7RSjJWWI2sFWim3zZHxUvRIwuOa3ysiJDJT0sakSfCZOFfXaG
 pEY8H0/LzPS5Cc22qD5Li+l1cvjQIyaY80vHSCGJyADgqXe7emPBFsO0cW1nge3eg3fe
 0HncQxSsNhp9yGfBaGO/zIXhm9gfv0rJUwVpXwZbu+7c9CrYJAS3wTQ6E3PayF7LMleJ
 tIz3WY5zUwHI2DVbpCwY+7GvJnFofyUqEmdMtQ2DA+P/TJD/mwXFDp/t/1ztkheha7BG
 lTug==
X-Gm-Message-State: AOJu0YyUPZZxj4S8gaw2rHzkppw4EvqwzvVqxKJ82Sj5CxwWJRBdCUWg
 AI7hAapTr5urM4dupx9fmHtRm00ovL7UGB2GxCvLVFxJJzLSuy9/uHQqmTZSfWAe
X-Gm-Gg: ASbGncsSjTi+4Fvqf6Ut141EtlGti5x2IyjmQk0CZ6Ht3iLeMkme8GsgqYw2sFl5PP0
 F6a4INf+58C4UcDzFYerjcTQW1/5xetRkRYv1kF1qpM/E9YHBgYCMXbShh4SrlPAfo1GTJHnkej
 zbiKFrMk6tzgwrxUZUSVr+1xJvKQgHENHtCI0KDC91NfGpWfz+bxvlFg+qde1kFkkmKZr36Ym30
 rq19g3wzsWQGa2dr6rfD9Q10cZ+hZisU2CS2bU2zC7PYRyfNPYbmZMVzuaAvnxxl3n67/L+WqI7
 geqIcr2bxFl08qM9P/j+u2JTm+zhOrHXo6tnIVy6LVGeeeyzou9vdRm6nJCj1Ude
X-Google-Smtp-Source: AGHT+IG8fmdDmk6dYmJOVopuqyXWcBzHq6mBh6+65VVgtmZROnXAEM+k/blX+RYrFkgSbc7Q+jPtGQ==
X-Received: by 2002:a17:906:c115:b0:adb:e08:5e6d with SMTP id
 a640c23a62f3a-addf8d5eefdmr371591666b.22.1749072056221; 
 Wed, 04 Jun 2025 14:20:56 -0700 (PDT)
Received: from rivendell.box ([2a02:2454:c280:4800:63d:9df9:3ebb:5fc6])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ada5dd043a9sm1145699466b.89.2025.06.04.14.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 14:20:55 -0700 (PDT)
From: Gert Wollny <gw.fossdev@gmail.com>
X-Google-Original-From: Gert Wollny <gert.wollny@collabora.com>
To: etnaviv@lists.freedesktop.org
Cc: Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH 1/4] etnaviv: Add command stream definitions required for a
 PPU flop reset
Date: Wed,  4 Jun 2025 23:19:19 +0200
Message-ID: <20250604212032.3387616-2-gert.wollny@collabora.com>
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
 drivers/gpu/drm/etnaviv/state_3d.xml.h | 93 ++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/state_3d.xml.h b/drivers/gpu/drm/etnaviv/state_3d.xml.h
index ebbd4fcf3096..7bd1181aa44c 100644
--- a/drivers/gpu/drm/etnaviv/state_3d.xml.h
+++ b/drivers/gpu/drm/etnaviv/state_3d.xml.h
@@ -4,6 +4,99 @@
 
 /* This is a cut-down version of the state_3d.xml.h file */
 
+#define VIVS_CL_CONFIG						0x00000900
+#define VIVS_CL_CONFIG_DIMENSIONS__MASK				0x00000003
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
+#define VIVS_CL_CONFIG_DIMENSIONS__MASK				0x00000003
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
+#define VIVS_PA_VS_OUTPUT_COUNT					0x00000aa8
+#define VIVS_PS_CONTROL_EXT					0x00001030
+#define VIVS_PS_ICACHE_COUNT					0x00001094
+#define VIVS_PS_ICACHE_PREFETCH					0x00001048
+
+#define VIVS_PS_INPUT_COUNT					0x00001008
+#define VIVS_PS_INPUT_COUNT_COUNT__MASK				0x0000001f
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
+#define VIVS_VS_HALTI5_UNK008A0					0x000008a0
+#define VIVS_VS_HALTI5_UNK008A0_A__MASK				0x0000003f
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

