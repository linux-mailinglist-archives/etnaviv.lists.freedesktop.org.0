Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE31F32E8
	for <lists+etnaviv@lfdr.de>; Tue,  9 Jun 2020 06:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E73B6E9EA;
	Tue,  9 Jun 2020 04:09:27 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871656E99C
 for <etnaviv@lists.freedesktop.org>; Mon,  8 Jun 2020 21:06:08 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id f18so18814830qkh.1
 for <etnaviv@lists.freedesktop.org>; Mon, 08 Jun 2020 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=88E1b1M85yoLt2wQSUARt1kqrX/wmst0RMRkdQQFLvY=;
 b=eV6tB2DMiYMp9aq5CL2nHjRZfadoA56ZVinBb8t1ouoHvNvsZdHME1MO6SN75PuU3O
 7pe+icAw3bycKTtJjBP3EssD8kQDOjH8/b6a69azEZ7plAQwmSFYe13Iv96OCAOAAbIE
 KvlIqzAwKODnrtgDHQxgKdLObgPHEwmhhM2VH8iVpzU1f7sWyf45PHXSEPhGmqEotQXv
 0cvRnineQC3NVTNPdZgxpGWu3j5sfJUZGpDGrnjUHoLHHVAYI8EfFHo1lKEkURHEd4gd
 sbzQ+YVZgQ0S5vwfM5hLyQoXx5umlq1MUMJhRiFyk31QiEjn/4OQU0/pjk45lHjTGXEL
 Stpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=88E1b1M85yoLt2wQSUARt1kqrX/wmst0RMRkdQQFLvY=;
 b=WTTIIMBCyiDpxNvP81uMtziO+xcoUx/M2hXhiLG3FcdbqhudIyXM7AgpRMWIkVs+qT
 iN3AZQLVxpearARVmaYzpAjG0okuYLSAbyuBC9C+9axL32FQrNBt2WzTOp/Q/qmDZ08m
 /K95SaYCGjcP/kTQErZf8cjraMdDxPYbIAQI1zxV+kUvRtws3KPQ4L/n1H2zsK5FcQii
 yfOZjRUhJfmA5F3T6oYdLEAiKZovO2TlZeRNRIKp05285yTUIGz+LCrgGw0pdb3tGXWx
 D3IWPHF35yyiUsuDcCHIW7J06N5/1XTLxspVrX2Irh7f7UrL1Q54+TdeYsbUelVKMvSh
 nwhg==
X-Gm-Message-State: AOAM530Wam3MViD8JABinh2Mj9dLPGuwBGXox4gtHotS6A4zQFy78r+T
 xuL5jwiPWRBRh/kwylAtVNsZrA==
X-Google-Smtp-Source: ABdhPJw+jlIdPJV1eXMsqqg65yxIIDLqsUSVa/vXlYz25h1eL1tIBueBHjuCloadV2NlG9t6xhSOPA==
X-Received: by 2002:a05:620a:15e8:: with SMTP id
 p8mr25094222qkm.333.1591650367719; 
 Mon, 08 Jun 2020 14:06:07 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id u7sm7606239qku.119.2020.06.08.14.06.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:06:07 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 07/13] drm/etnaviv: Change buffer dump checks to target
 syslog
Date: Mon,  8 Jun 2020 17:04:57 -0400
Message-Id: <20200608210505.48519-8-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
X-Mailman-Approved-At: Tue, 09 Jun 2020 04:09:26 +0000
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 daniel.vetter@ffwll.ch, maarten.lankhorst@linux.intel.com,
 Christian Gmeiner <christian.gmeiner@gmail.com>, mripard@kernel.org,
 etnaviv@lists.freedesktop.org, ppaalanen@gmail.com,
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de,
 Russell King <linux+etnaviv@armlinux.org.uk>, airlied@gmail.com,
 Lucas Stach <l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index 76d38561c910..7713474800e8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -353,7 +353,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 
 	lockdep_assert_held(&gpu->lock);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
 		etnaviv_buffer_dump(gpu, buffer, 0, 0x50);
 
 	link_target = etnaviv_cmdbuf_get_va(cmdbuf,
@@ -509,13 +509,13 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
 		 + buffer->user_size - 4);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
 		pr_info("stream link to 0x%08x @ 0x%08x %p\n",
 			return_target,
 			etnaviv_cmdbuf_get_va(cmdbuf, &gpu->mmu_context->cmdbuf_mapping),
 			cmdbuf->vaddr);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER)) {
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER)) {
 		print_hex_dump(KERN_INFO, "cmd ", DUMP_PREFIX_OFFSET, 16, 4,
 			       cmdbuf->vaddr, cmdbuf->size, 0);
 
@@ -534,6 +534,6 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 				    VIV_FE_LINK_HEADER_PREFETCH(link_dwords),
 				    link_target);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
 		etnaviv_buffer_dump(gpu, buffer, 0, 0x50);
 }
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
