Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2FB443E2B
	for <lists+etnaviv@lfdr.de>; Wed,  3 Nov 2021 09:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F42734C1;
	Wed,  3 Nov 2021 08:12:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3E8734B9;
 Wed,  3 Nov 2021 08:12:38 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u1so2185719wru.13;
 Wed, 03 Nov 2021 01:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6i0TILSChMzKedgIRlQxmjqUOkHsjq/nCVlt/Lvwgi8=;
 b=fbXMem3BZAeM4zx05udJs8RU83SnUnDknEVTLjOG268mHwt7lNy1OMfi09Yg0VAf7c
 apmaEJKTNSrVORqXHNyi6g/doqrxSzp+7ySTipnL3XhT66vYc+E81thxqEytTakRYAf8
 RlGc560K9HAGEOHIp/yGkTL0dRACqUXUqW3ySNR2u3aunQnWrTbRwgSIrFVdwz+WpJWf
 jIAGnLBOIwjKT3ealUaEHayAVXGH8V4K2Z1TBrNa+OfOFAApjM3Q9avwjytVIYGQ040b
 IQtRfxRxrepXd6NWzILfCQON2YWqLSxAJZ3nH74a3ww3qhM2LDbVlmHE6Qwq2uajjmf6
 ZkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6i0TILSChMzKedgIRlQxmjqUOkHsjq/nCVlt/Lvwgi8=;
 b=dTCZn0To+upfAop+HVmrWCIMLXtezDdeDbcf8j2/e8LkaMyr4LEagmKGQWPC5NVYwc
 G5MhVoxzNMS+Ey0s4csAmkdSmI6496Rf7HQ0kI9g7JeVf2I9FRbkiXeSgE5w7lD0uc9T
 LtHIZRJXdfIRgSwyzdFr5mahEoHQDAvvKs004VYA1lRPKusLibIp81JtbUvlz2S9coE4
 k6a2882UkPd0o1+aGJuwsMgkfj2ph0/1puvDde2TKATNeKwLAkMn09dR8haBxQ41r9M8
 IXX6i9y2PNgheF2/jW8f+ucsyylRxmkWBgSq/JgpqORuSP8QW+lHxR0AAH0S/D3IBlZe
 5zAQ==
X-Gm-Message-State: AOAM531OUM3jhpeuPattrHX2XOsDmOdLVCFW0Zu9pyRQycmxksasXXnj
 1TXezqHM7gqD3vGxU7GUvrE=
X-Google-Smtp-Source: ABdhPJyW3RmT8hjvHLXqmp+ylp5ci7lZJCiF7FrEggbZd+lRPfI+n6ryKMqhriDVaUPELcJAYDGeWg==
X-Received: by 2002:a5d:5888:: with SMTP id n8mr10318438wrf.234.1635927157429; 
 Wed, 03 Nov 2021 01:12:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l7sm1450088wry.86.2021.11.03.01.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:12:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, etnaviv@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/etnaviv: use dma_resv_describe
Date: Wed,  3 Nov 2021 09:12:30 +0100
Message-Id: <20211103081231.18578-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103081231.18578-1-christian.koenig@amd.com>
References: <20211103081231.18578-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: sumit.semwal@linaro.org, daniel@ffwll.ch, l.stach@pengutronix.de
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Instead of dumping the fence info manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b018693e3877..d5314aa28ff7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -424,36 +424,24 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 }
 
 #ifdef CONFIG_DEBUG_FS
-static void etnaviv_gem_describe_fence(struct dma_fence *fence,
-	const char *type, struct seq_file *m)
-{
-	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
-		   fence->ops->get_driver_name(fence),
-		   fence->ops->get_timeline_name(fence),
-		   fence->seqno);
-}
-
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
+	int r;
 
 	seq_printf(m, "%08x: %c %2d (%2d) %08lx %p %zd\n",
 			etnaviv_obj->flags, is_active(etnaviv_obj) ? 'A' : 'I',
 			obj->name, kref_read(&obj->refcount),
 			off, etnaviv_obj->vaddr, obj->size);
 
-	dma_resv_iter_begin(&cursor, robj, true);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		if (dma_resv_iter_is_exclusive(&cursor))
-			etnaviv_gem_describe_fence(fence, "Exclusive", m);
-		else
-			etnaviv_gem_describe_fence(fence, "Shared", m);
-	}
-	dma_resv_iter_end(&cursor);
+	r = dma_resv_lock(robj, NULL);
+	if (r)
+		return;
+
+	dma_resv_describe(robj, m);
+	dma_resv_unlock(robj);
 }
 
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
-- 
2.25.1

