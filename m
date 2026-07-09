Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9xmbJvu2T2rCnAIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 16:58:03 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA97328C9
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 16:58:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h8hWhCOM;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2018010F61F;
	Thu,  9 Jul 2026 14:58:02 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33D710F61B
 for <etnaviv@lists.freedesktop.org>; Thu,  9 Jul 2026 14:57:59 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so8550135e9.0
 for <etnaviv@lists.freedesktop.org>; Thu, 09 Jul 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783609078; x=1784213878; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yd1dFdW3DE1YeT+fprMXo0jAXkdXd9jG5OHl8Qzt964=;
 b=h8hWhCOM8W+APxHBY3/WQi/m7f67SZnUtzO8s7baD8/30uDji9topMXThI3sayKLaO
 ZBF4DVL2dSfJhef9vmnQzrHRb/tG4Tc9FIcrKPEJfUzEXgw8dDLb07bzF6+xHP18IxIl
 bj2Vq/x0ojAs8A+Aghh7MHY3+qbQrdN8hobVCIL0Kv38CHg9lt/JMIAoSkXb7B3AdY20
 bvPdL1w10zxscoW5gD6cVuElB7uOOjCnny4nXGHindDVEP77VACTSajmNoDZb4c8Cn+k
 gKzW7h6/jIdp5JUHObIncD+Ro64hDwuDopSKoOXDeKWy7lpLmA6hmGQ4jfBa1WsVjFFP
 +Ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783609078; x=1784213878;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yd1dFdW3DE1YeT+fprMXo0jAXkdXd9jG5OHl8Qzt964=;
 b=OmLYDjxy5KWNMEQGRu4DETEWHH2uEt1g7Xejcu+nijDP8pRwoKS+srrcRA5dlRQsKh
 8ulMQuAfaR93aSDG4GCVcDJAgADqnPpwqK6fojkS0a/MZke04hkdP4k82CqAmZcsyIcF
 ubpvVMkZSv7egEYB6ccDPZxMPX5ECFmvxWZiyegGIr65IUyCquYJ6bAUDPhSDbF3RK1H
 LxShcgd0tMkPqSRc+0yJWr92gCmeZugZlcM+sgPWj0WJyrbcwBGwWFczRfGVziQVSuNn
 PYOqvm04zIAAFMY7j3SnO9hl1ybokN1oK/NdoZ7Hekm4rEG/+zfBwC47GjcJ4ypDDcWW
 8Thw==
X-Gm-Message-State: AOJu0YwzmhBUTq3QLOWXoJtSsRDtjv240fy0yLKWEFxiOfo+J9i4UJgl
 y/INZv1E93MZVzeeDxY4ADWsB0tdbVSK/sx7dMxOLttxrSuvkMKarW2J
X-Gm-Gg: AfdE7cmovD/E+9LaScFthseJToQhhGJU1nPrqQcfAosH+gJBMKCeX16DzHf7FNP/xqJ
 6DSnRvAx3QzFeNnPqEO2gGFRRqMyaliyF1z8AbrWotIfpyTDaNSm/cTwriJd9l34cQ5bwDstvaF
 36GV3B6o8tEcrx2B4HjSH0n0lOoaiFfw1sRrsw6ZBtcp86NG4r3VF6RmoncK38z5uXQPWddE0Y0
 pP2STXd3MAjk1PzGEirnnHuobpNoPQ3QqbPS2au05VERXS2h5jrKT67lcsTyUqBg//PxyHswIfn
 efLe2As6Nv8unCvyL9nmxgl5GW40omn5SG9gT0nUZIWQwvKn2zECYzMlVfT+vAd8NOLJ3nqOjvq
 IS543DyKvRjej4YQjbMfv8SzjTQ6B+eP6s5YZQVjM+xzsv4IVUBxlJDU1bMQ3ny2c6IV/oVPN/H
 qftw5dzDtkLaTlsbzJ+onmxS5zLCbMnrnCkoBmsNER2oRlGhGyhuShfyOMldBI01UzGtdv+SKrE
 kvJo0memqRGk4HJEdxDi244f8yruiNQbA==
X-Received: by 2002:a05:600c:8b53:b0:493:e79e:da87 with SMTP id
 5b1f17b1804b1-493e79edc1bmr65507825e9.31.1783609077936; 
 Thu, 09 Jul 2026 07:57:57 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e5a572c3sm162226435e9.1.2026.07.09.07.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 07:57:56 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 09 Jul 2026 16:57:45 +0200
Subject: [PATCH 1/2] drm/etnaviv: Reference count struct etnaviv_file_private
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-etnaviv-reset-notification-v1-1-64c617496958@igalia.com>
References: <20260709-etnaviv-reset-notification-v1-0-64c617496958@igalia.com>
In-Reply-To: <20260709-etnaviv-reset-notification-v1-0-64c617496958@igalia.com>
To: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel-dev@igalia.com,m:cgmeiner@igalia.com,m:linux@armlinux.org.uk,m:christiangmeiner@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid,igalia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42BA97328C9

From: Christian Gmeiner <cgmeiner@igalia.com>

The next commit updates per-context data from the GPU reset path, which
runs in the scheduler timeout worker. This can race with closing the DRM
file: drm_sched_entity_flush() only waits until the entity queue is
empty, it does not wait for jobs still running on the hardware. So the
context can already be freed while the reset path still needs it.

Reference count the context and let every submit hold a reference, the
same way a submit already keeps its mmu context and pid alive. No
functional change.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 17 ++++++++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h        | 11 +++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  5 ++++-
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 08aca9035fc1..a27ed014fb4e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -60,6 +60,19 @@ static void load_gpu(struct drm_device *dev)
 	}
 }
 
+static void etnaviv_file_private_release(struct kref *kref)
+{
+	struct etnaviv_file_private *ctx =
+		container_of(kref, struct etnaviv_file_private, refcount);
+
+	kfree(ctx);
+}
+
+void etnaviv_file_private_put(struct etnaviv_file_private *ctx)
+{
+	kref_put(&ctx->refcount, etnaviv_file_private_release);
+}
+
 static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct etnaviv_drm_private *priv = dev->dev_private;
@@ -70,6 +83,8 @@ static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
 	if (!ctx)
 		return -ENOMEM;
 
+	kref_init(&ctx->refcount);
+
 	ret = xa_alloc_cyclic(&priv->active_contexts, &ctx->id, ctx,
 			      xa_limit_32b, &priv->next_context_id, GFP_KERNEL);
 	if (ret < 0)
@@ -120,7 +135,7 @@ static void etnaviv_postclose(struct drm_device *dev, struct drm_file *file)
 
 	xa_erase(&priv->active_contexts, ctx->id);
 
-	kfree(ctx);
+	etnaviv_file_private_put(ctx);
 }
 
 /*
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 55a9e745604d..cba4323ae589 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -7,6 +7,7 @@
 #define __ETNAVIV_DRV_H__
 
 #include <linux/io.h>
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/mm_types.h>
 #include <linux/sizes.h>
@@ -29,6 +30,7 @@ struct etnaviv_iommu_global;
 #define ETNAVIV_SOFTPIN_START_ADDRESS	SZ_4M /* must be >= SUBALLOC_SIZE */
 
 struct etnaviv_file_private {
+	struct kref refcount;
 	int id;
 	struct etnaviv_iommu_context	*mmu;
 	struct drm_sched_entity		sched_entity[ETNA_MAX_PIPES];
@@ -53,6 +55,15 @@ struct etnaviv_drm_private {
 	struct etnaviv_cmdbuf *flop_reset_data_ppu;
 };
 
+void etnaviv_file_private_put(struct etnaviv_file_private *ctx);
+
+static inline struct etnaviv_file_private *
+etnaviv_file_private_get(struct etnaviv_file_private *ctx)
+{
+	kref_get(&ctx->refcount);
+	return ctx;
+}
+
 int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 1a77a09b3377..98f1f59a8b05 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -398,6 +398,9 @@ static void submit_cleanup(struct kref *kref)
 
 	put_pid(submit->pid);
 
+	if (submit->ctx)
+		etnaviv_file_private_put(submit->ctx);
+
 	kfree(submit->pmrs);
 	kfree(submit);
 }
@@ -526,7 +529,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto err_submit_put;
 
-	submit->ctx = file->driver_priv;
+	submit->ctx = etnaviv_file_private_get(file->driver_priv);
 	submit->mmu_context = etnaviv_iommu_context_get(submit->ctx->mmu);
 	submit->exec_state = args->exec_state;
 	submit->flags = args->flags;

-- 
2.54.0

