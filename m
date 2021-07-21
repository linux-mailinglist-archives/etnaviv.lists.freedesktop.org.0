Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7DA3D15AF
	for <lists+etnaviv@lfdr.de>; Wed, 21 Jul 2021 19:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3DF6EBA4;
	Wed, 21 Jul 2021 17:56:05 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF7A6EB9B
 for <etnaviv@lists.freedesktop.org>; Wed, 21 Jul 2021 17:56:03 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id bm6so2905742qkb.1
 for <etnaviv@lists.freedesktop.org>; Wed, 21 Jul 2021 10:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eJajPBJwhf0xkvC8Oc1cscrVWsD0SBsh6BLFW6m+BMo=;
 b=Y+nsyUWFzVgiQIYW7sTA3tIlsuW/nl99urrJ3NdUug231lxe3jrgAvDWvFQE7tCbI5
 21YruvE83bUgTlRbdEE+z4BWfW1HF2y3MGRFAvJgyD98XbJ0/y/MGXJKX2AsVX8CM53J
 A9wTDCCvnUCLoXfiWS6x4lrlBxBTs5/Qz4R6QtZAJt6B1+JX0GHfeXKUPRxc6QDKnV1W
 9+lWbYPKbPQNMsT8t3kcyKTyQdCHarHowm/W56WlnfNGV7M7c2gO/jLkMNb90PWoveNz
 irYV2/aA7L4/fKVj+7DU27pqyzPpmKgrjGJqe8EnGxv1mfZ97BAXld31uvSejB38UxWD
 eHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eJajPBJwhf0xkvC8Oc1cscrVWsD0SBsh6BLFW6m+BMo=;
 b=KIBrxodvCmvYA6JyRHLyGrbVJOuuiKdXaK7FRDOdT/WivYfbyqYGXAT7wUm0kPolto
 FB6egiwm/0m4hipbkYAiMiNsnxVShcSr+G1kNP602l1xiC9FbG/1CvRZSVkiBcuRQrXt
 j+uCYIPUIdZV6OfqGJ45iSAPvHjVhXPUAWy3ux2syfY7zu69854AIEwJG9tPrIAE/tlB
 Tr4xIP2uCrKbg59m4UaasbD505N5JgH5I4NsZlxuvfxjFJNtqXUfVjlvtw5AKKPOKPAw
 Zqlpm8jCOrrgY0SFbgOweo22VyAeZQrQFqtk62agdmz8f7KKrntAl/7f4tTxsCOo5ka7
 gX0Q==
X-Gm-Message-State: AOAM530kKbDiaPd8hne/6UngIU2zZnw6jZVw1jq19CL6oVo79bufFpm8
 dtaYH2dgj6ZdqoGpYC84dS5BUCd3a7MGdg==
X-Google-Smtp-Source: ABdhPJzWRa/fAH7WwN/95bHK8iq5i7MUlrXC1A1uaG0usBMGrf7krfV6gtM2+zieR1s8y8XzyOrCPw==
X-Received: by 2002:a37:a647:: with SMTP id p68mr35490185qke.133.1626890162671; 
 Wed, 21 Jul 2021 10:56:02 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id q206sm11670559qka.19.2021.07.21.10.56.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:56:02 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 07/14] drm/etnaviv: Change buffer dump checks to
 target syslog
Date: Wed, 21 Jul 2021 13:55:14 -0400
Message-Id: <20210721175526.22020-8-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
MIME-Version: 1.0
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
Cc: etnaviv@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-8-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
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
