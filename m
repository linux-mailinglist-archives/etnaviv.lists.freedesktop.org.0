Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3168892F08
	for <lists+etnaviv@lfdr.de>; Sun, 31 Mar 2024 10:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E3510E16B;
	Sun, 31 Mar 2024 08:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XwdqXDzo";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E7F10E407
 for <etnaviv@lists.freedesktop.org>; Sat, 30 Mar 2024 20:52:46 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-34261edaf7eso2074810f8f.1
 for <etnaviv@lists.freedesktop.org>; Sat, 30 Mar 2024 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831965; x=1712436765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ur6wj7Am1MhdI1MTeYGSKdLS/Zh7sDkgdWv9M5NMjj8=;
 b=XwdqXDzog9bosCMyZraU16lCtckkAY59fdUtkurDOy+TuRXBxPWxny968nnUnBEgak
 jXz5uetJzepqeGow8+zdF5byjwrZpj4SKjO31Tj0DPivSzhudunT+knOOLKzrZnjgmXo
 1MVSx4HiVmNHsx8NZ35fM+r4ohzIhO1E5N4o26s4PhKLEoGdIVPEmMuTQ+j24ZmPCnKm
 hHjD3AF993ev33sXQD91YmATiznqD4Mn2/z6Ez8DmVaWSEqTmtQ7Z3LMmPK4G1RErG6N
 p0BhIhzqTAZN/fKkmaEZqmOoYtwD0mK4/mfYBrldVp+G/xIgw9woEhu7GS/eaIdXqdG5
 XOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831965; x=1712436765;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ur6wj7Am1MhdI1MTeYGSKdLS/Zh7sDkgdWv9M5NMjj8=;
 b=TBzniSBf3b1oXrMSjDj/D4PkzsKacPTrcjqwSkOcB45CAjiiXQZ3Tphl3ijKA4YxAr
 V/ZhVhVPi11ycJuJ4tHFrb19w+1QgSgz6LsIK2fG2zY2l5hZPSrtXdZ9jHxbDIM8EKUS
 QZWufxSwiaELPgB6rd0d+o0v3TmbLdKtQoNZkiE7mv8OuKGpfrfdVbP7s2E9dRWuaQpl
 mAQcWMHNcF++jvE8NqERpo5b6lSLDIgCcs9UZ7f3qB+UaCbCIvOrAZqyFSQZmIpPWNJP
 yigDHdj/XekWFfhgrti2si3CnDY9Qorx9d33bs+4BH12lsv5RUVo5GxA35aj2qxg0N3Q
 9JtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMv4fso8wbpwhYz9VXLGLWwLhlcfVi53/RZXK+UfXqMG7FUYukIyLCVoi/TLhZLukGQ8h6RYy3XpfyH1CnV7aS/xRyz+nz8G1u2Dkrcw==
X-Gm-Message-State: AOJu0YzJuJbBm7IK7B/5k2LOKY4LxR2peWssx7AxkctOYrVooJS0i/An
 Mkj0UdNO42wye4HQ/1K9EFlvbMc4SCPsqZwN+NrBpMsTVaobJQY1lr9ZXJnCSJI=
X-Google-Smtp-Source: AGHT+IHGeV8E/r8D99VT6rlf9tYE71QgG9MvULvj0tWUuJAxe/CbejwGsfVZwcwIlP7QPuju+VqMNg==
X-Received: by 2002:adf:f142:0:b0:341:7656:d358 with SMTP id
 y2-20020adff142000000b003417656d358mr3715366wro.38.1711831964745; 
 Sat, 30 Mar 2024 13:52:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 i9-20020a0560001ac900b0033e41e1ad93sm7279868wry.57.2024.03.30.13.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:52:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/etnaviv: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:52:41 +0100
Message-Id: <20240330205241.92711-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 31 Mar 2024 08:38:09 +0000
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 734412aae94d..87b31cfee41d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1995,7 +1995,6 @@ static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
 struct platform_driver etnaviv_gpu_driver = {
 	.driver = {
 		.name = "etnaviv-gpu",
-		.owner = THIS_MODULE,
 		.pm = pm_ptr(&etnaviv_gpu_pm_ops),
 		.of_match_table = etnaviv_gpu_match,
 	},
-- 
2.34.1

