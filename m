Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0883F5ABD57
	for <lists+etnaviv@lfdr.de>; Sat,  3 Sep 2022 08:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FAB10E77B;
	Sat,  3 Sep 2022 06:07:03 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894F310E77B
 for <etnaviv@lists.freedesktop.org>; Sat,  3 Sep 2022 06:07:01 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id f24so3829724plr.1
 for <etnaviv@lists.freedesktop.org>; Fri, 02 Sep 2022 23:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Hqs+EOWSoVn8x/QAKmfg4Hu1Z05+52oHCjQloLi5jzQ=;
 b=Q3JZBdTwrV9sR7Edp6HSHF70gt77E2SNZYWVht+P2XUcr5IPt24yxv21sH5atPk/Zj
 YzZ2mHkn746G357ZxRFm42UBc3BLKMxQe9as0HTQy7jsSVsqW2dewmRUtJgCcqTd71lJ
 n9H1ADFCyxHMtYq7vcFWj4qHLN6XcO9rTB48o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Hqs+EOWSoVn8x/QAKmfg4Hu1Z05+52oHCjQloLi5jzQ=;
 b=tcQgelcL6u1Lk8vXYCwWImXAai1TNew/vrewopOEe4fpNMWndV/Mp3b8GjEczOjV9o
 OvSrdJ47ncBPOtShLN5cQiv5dBOXN7Z4nMYFDVJTedXRPK/2XgdBZD9yn2CVylsuhpSs
 TctIw85EKMtA8JebUMmPxsFGSYCeGJiw5IpPQOSBjYHqymIgXihKmBSoGxE+hC2rohqc
 qz0oWw1r7qmknyhx5iM8clQqrVpP6+A3B0305QzxHCqRfTy1i+5x4HGUNguj0FkEgZMz
 gQGj+d8iiwKwG3cb+0mQWEb6FiJPsNXAQMSkv0w7vgV0PfnFw6l2kfuBr+O0MUeu0qBb
 4+Mg==
X-Gm-Message-State: ACgBeo0iI20YbUXrF6XIBKq+7IoJlYl/vUUmKTVFIzICxVXWcVYJNLat
 A1rU8CTQ8k3z5Dp4y1KO5DxzuQ==
X-Google-Smtp-Source: AA6agR6Rlahf8BH6dUKZjItBDrclPm4u0ueSF2l2JtZWYwLxbahSL+34Ja9X8R3Hecx5NAp6dhWeWQ==
X-Received: by 2002:a17:902:aa01:b0:172:b0dc:ba40 with SMTP id
 be1-20020a170902aa0100b00172b0dcba40mr39250123plb.101.1662185221217; 
 Fri, 02 Sep 2022 23:07:01 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
 by smtp.gmail.com with ESMTPSA id
 v28-20020aa799dc000000b00537ab89c66csm3048793pfi.143.2022.09.02.23.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 23:07:00 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/etnaviv: add missing quirks for GC300
Date: Fri,  2 Sep 2022 23:05:57 -0700
Message-Id: <20220903060558.55167-2-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220903060558.55167-1-doug@schmorgal.com>
References: <20220903060558.55167-1-doug@schmorgal.com>
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

