Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931615B48CA
	for <lists+etnaviv@lfdr.de>; Sat, 10 Sep 2022 22:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542D210E2BE;
	Sat, 10 Sep 2022 20:30:20 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA34B10E2BE
 for <etnaviv@lists.freedesktop.org>; Sat, 10 Sep 2022 20:30:17 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id o23so3228552pji.4
 for <etnaviv@lists.freedesktop.org>; Sat, 10 Sep 2022 13:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Z9jxByzVkMoMNaDlz07fE7aVRK3JIOG/ZFD9GTYnd5A=;
 b=Rf4gLgZs0TJmmTOOtjDDZx+tIifNxAbZNtBhCdXRBTekUHDiJszS/5UyvgZMerFM1f
 Rt9fnsHB+5DKDorWMYCVhWNjtm/vv0LVVngbmR/MCRPgZqm1if6QymRM4str9dSnEXYv
 fe5DE2TFW7cj6L87eYTiFgptXdj4jCFBCasSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Z9jxByzVkMoMNaDlz07fE7aVRK3JIOG/ZFD9GTYnd5A=;
 b=tuTKXMrHN2SQsi5OMHrnkeTXtejFChqT62Co5G5cmZrQpBYAJXqrWaRF7ySiY3Yr+s
 gr+s+d2B2qz47XYFjkgyHwoN5C7KybyuyHCTZ7fjDOh8+gdbVQgjprTJadKIowrPYU4Q
 Z0xf5a6MnSmNtS7PEuvqHbUPHTbdj4PoGDdHeRyj0V1jY633zs68NMN1kMrjIEaCt9/G
 Y3x+Mu3hxNZJFbKXo0F5DsYVMBPqvfG7D4VlzBbZSPi9s05XKmeCJGP96Lcs048Edod8
 K4M0x2jBUfZbMgUO4HNeKvwieJsY2y6P153PmnKWlfdq4mFCFIIFNfd9Oby+iWsAXiyz
 ZTIQ==
X-Gm-Message-State: ACgBeo2/X0xSN7s6xs5fDmtqBdS4BwXOvEnNuPCXS7U69oSe53/BpKFL
 WSztpPbzxy8noBeIYaRW02yJTZ4Jr+SOaUZMYIQ=
X-Google-Smtp-Source: AA6agR5QHm1l5nuhm8GSF3lx0whdh3DtLL6pScGNtufe6t8U65MusH0f844h1caDQPtwym+qmmDnYg==
X-Received: by 2002:a17:902:a409:b0:176:a717:4d5d with SMTP id
 p9-20020a170902a40900b00176a7174d5dmr19350119plq.148.1662841817237; 
 Sat, 10 Sep 2022 13:30:17 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.124])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a655382000000b00412a708f38asm2641313pgq.35.2022.09.10.13.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 13:30:16 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 1/2] drm/etnaviv: add missing quirks for GC300
Date: Sat, 10 Sep 2022 13:29:38 -0700
Message-Id: <20220910202939.31010-2-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220910202939.31010-1-doug@schmorgal.com>
References: <20220910202939.31010-1-doug@schmorgal.com>
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
Cc: Doug Brown <doug@schmorgal.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

The GC300's features register doesn't specify that a 2D pipe is
available, and like the GC600, its idle register reports zero bits where
modules aren't present.

Signed-off-by: Doug Brown <doug@schmorgal.com>
Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..f667e7906d1f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -416,6 +416,12 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 	if (gpu->identity.model == chipModel_GC700)
 		gpu->identity.features &= ~chipFeatures_FAST_CLEAR;
 
+	/* These models/revisions don't have the 2D pipe bit */
+	if ((gpu->identity.model == chipModel_GC500 &&
+	     gpu->identity.revision <= 2) ||
+	    gpu->identity.model == chipModel_GC300)
+		gpu->identity.features |= chipFeatures_PIPE_2D;
+
 	if ((gpu->identity.model == chipModel_GC500 &&
 	     gpu->identity.revision < 2) ||
 	    (gpu->identity.model == chipModel_GC300 &&
@@ -449,8 +455,9 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 				gpu_read(gpu, VIVS_HI_CHIP_MINOR_FEATURE_5);
 	}
 
-	/* GC600 idle register reports zero bits where modules aren't present */
-	if (gpu->identity.model == chipModel_GC600)
+	/* GC600/300 idle register reports zero bits where modules aren't present */
+	if (gpu->identity.model == chipModel_GC600 ||
+	    gpu->identity.model == chipModel_GC300)
 		gpu->idle_mask = VIVS_HI_IDLE_STATE_TX |
 				 VIVS_HI_IDLE_STATE_RA |
 				 VIVS_HI_IDLE_STATE_SE |
-- 
2.25.1

