Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDwHO2hGwWnpRwQAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Mon, 23 Mar 2026 14:55:52 +0100
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8872F36E1
	for <lists+etnaviv@lfdr.de>; Mon, 23 Mar 2026 14:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32BC10E3EF;
	Mon, 23 Mar 2026 13:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="br3sPpKd";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAF110E7DC
 for <etnaviv@lists.freedesktop.org>; Fri, 20 Mar 2026 01:08:16 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2b0586d5bb8so9489185ad.3
 for <etnaviv@lists.freedesktop.org>; Thu, 19 Mar 2026 18:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773968896; x=1774573696; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g+MtQY3GBP0FcqvY6s09ctlLbOJ05XY1yODrc7nIS/E=;
 b=br3sPpKddW0xS3b3/8JyaqoqEIxfK7/1aaxPQQQ6QIe8ufbLHYh/LoFY03GicjCehO
 JchW6CALrQWqG4IlJUpRFxkzUegDBpbaL/0ZGUBZWBp19CBsKfzoAKmgkBu2gVuhWD/7
 ZwFiClK0KmNqXGwB++9YLKV9Ggj+H8u9XOwOeOm25M30kzCvKWCydhQlb+xSHHKv0Guq
 PHrF/r+jDUI3zSGBnpbqprgyqo/W9eqDjGZnK8a6m339BXT9uSpqZWJipqUF/+dG0u5E
 f7/yWuDs0zweBQTAkLE+zz8AXMBj8Q4yj8of5Y3gJaE7icMUTIgCNtyQkrFeS+cUecor
 tVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773968896; x=1774573696;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+MtQY3GBP0FcqvY6s09ctlLbOJ05XY1yODrc7nIS/E=;
 b=pK3mOQtLySrEwkYplI5kGm+A3P18sVwv6rWS0ZjYo3mcSzONVfpBa7TFAWKC7htTMN
 oBo6bjFReRJ9AfeZsr61K8dPgb11oGAcAnOi4ZTCkMunBfBHGz0nhhc6g1u8KJG1Tbi/
 +SzdnWpypDVf841aN0vwJgCu/QMcLxVeU+gt/pOXBzPwStMcljrSPgyB+7TOhPbA07UX
 zvEvKw3T8u568s+TbQtkHNnDqxrLFu6AyF9fJmj1/vdBswm5kXn51sx8tiM12K4+veLO
 OIgoo8i/H/ARof+m9s4LIWWGeAAiCnU3uDCrg0SxLZi69cdG+vBSR/wvaI3aSiLqi33t
 ycfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFxOmc9A7JilEyMzKWdW3cI5wl7HuPoIYkHDvYDLTm+dWYD0CzCnS/bhqUORormg7I1FM/sB3S@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaO2ptq4pFVnJel+d8xM1+By4F75AQiS06RzJOvSSF0MfSD3LP
 kl9fxJkHrMo4eJqjqIAJrerbv8ZrA400dF5T9q7wDA87ZF6aKnWhZ5Ho
X-Gm-Gg: ATEYQzzQLYSthhmoBf/n8joj38WxMFs+WVQygUxjMW6tLfXBTCLTb7J/Z1unIC7wywZ
 e8koiR0wc7/lUPKrrXVWBKs97E+/U6eFvoI4YkLW2HFBfBBZr5wJxNCH70Z/kI9WQA3DJil/cK5
 dvqrIdJUDbfBnZC+1Uhoru9JPBVumcMrDsaBPawR54phgLaykXWAx3EC+rib00hkByQ2xRjcgzJ
 taygE34yBdB3tVmC5/4kk4xdUjtaDaMLu0KuzRCovfCcdd9jTFAyh5e4+rrkYPGcGCkbP6ak5Ec
 a4LQgkM0Adq/YMOFzX6XQ2s6a1Veq5kaxNKYaggJPh7dDIklRnhQ8uIyGruFYQtFcPKeWE8Knor
 U0Gufzd8oiR8kdTkrzv1L0Pfcx0wPG5wkqVT7GkneogW6Mw9xLmjWIYNZS61jhI2V+CMf5UGe+K
 mmYcSAhzmqDkmMpI67pDjUB+Hkvn95Pp4elMhj2Ur1gK86Gw9UPzIz4sc=
X-Received: by 2002:a17:902:ecc7:b0:2ae:5163:c2aa with SMTP id
 d9443c01a7336-2b0826feed5mr10568955ad.20.1773968895647; 
 Thu, 19 Mar 2026 18:08:15 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b083516b96sm5132935ad.7.2026.03.19.18.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 18:08:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org (moderated list:DRM DRIVERS FOR VIVANTE GPU IP), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/etnaviv: use kzalloc_flex
Date: Thu, 19 Mar 2026 18:07:57 -0700
Message-ID: <20260320010757.32158-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Mar 2026 13:55:49 +0000
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
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[84];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:linux@armlinux.org.uk,m:christiangmeiner@gmail.com,s:lists@lfdr.de];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3A8872F36E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A local helper was developed previously for struct_size.

kzalloc_flex can be used now.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h        | 12 ------------
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  3 +--
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 20dad16fd554..55a9e745604d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -93,18 +93,6 @@ void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 #define VERB(fmt, ...) if (0) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
-/*
- * Return the storage size of a structure with a variable length array.
- * The array is nelem elements of elem_size, where the base structure
- * is defined by base.  If the size overflows size_t, return zero.
- */
-static inline size_t size_vstruct(size_t nelem, size_t elem_size, size_t base)
-{
-	if (elem_size && nelem > (SIZE_MAX - base) / elem_size)
-		return 0;
-	return base + nelem * elem_size;
-}
-
 /*
  * Etnaviv timeouts are specified wrt CLOCK_MONOTONIC, not jiffies.
  * We need to calculate the timeout in terms of number of jiffies
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index fbf693addd74..1a77a09b3377 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -32,9 +32,8 @@ static struct etnaviv_gem_submit *submit_create(struct drm_device *dev,
 		struct etnaviv_gpu *gpu, size_t nr_bos, size_t nr_pmrs)
 {
 	struct etnaviv_gem_submit *submit;
-	size_t sz = size_vstruct(nr_bos, sizeof(submit->bos[0]), sizeof(*submit));
 
-	submit = kzalloc(sz, GFP_KERNEL);
+	submit = kzalloc_flex(*submit, bos, nr_bos);
 	if (!submit)
 		return NULL;
 
-- 
2.53.0

