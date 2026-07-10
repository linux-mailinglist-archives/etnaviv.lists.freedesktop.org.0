Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id joV9AaffUGqq6gIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 14:03:51 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247373A7F4
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 14:03:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DWp3PnqA;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5332610F88B;
	Fri, 10 Jul 2026 12:03:49 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FCB10F882
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 12:03:48 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47122683cf3so516612f8f.0
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783685027; x=1784289827; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yd1dFdW3DE1YeT+fprMXo0jAXkdXd9jG5OHl8Qzt964=;
 b=DWp3PnqAglmSEZ6Y4MDGTy+1T5l5gYykGvPRP2rRKi1fhI3vOlIjSW/eGF4zU85mJ5
 47ccScB8Cj3bpraBwASUw+cwsTTEUjhkA92/AvQMm7WwEg5UXAdCe/NFAvnSOQFTryd5
 zJnywFQqwrDcfcZvLdsYEiWHcS3cfcP7KdJLEUEj5i5w+wKEZto9cVS9n/morTX1Kjwp
 IbVSljoz4RIFlLXac7TxqMO5MStkb5YZJdemFe29yLzwCiWN1ioLORFk00dFBmh/BW6E
 EOz5xq2mQE2BqVoRaPAgZHiNZIhaS0RDCe/fyUgjYj22LviNebAolvgPc8FSHOIZh0PC
 /l2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783685027; x=1784289827;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yd1dFdW3DE1YeT+fprMXo0jAXkdXd9jG5OHl8Qzt964=;
 b=MgqgMobHhqtauKMWfVeaJMl0ipT8znxBttFvJsrZLENS8i+/jtkcakE5ln07mLE/Gs
 C7hyzVBmIQGSiL0E13+DeYAGWg2INze3RZ67IWpJ1UOiuQsQ2wgOAxIc3QdlIdmvU3br
 DokOJps0k3jS2//Fu6pTS5Z5aJu3xqUbImVMSvLs9/nm9iPIK9/REYRJIOUcXfE2hAyS
 IccvOBoAKTAndz6i/qy/8JpR8D0P/TBLPVQNaV9oMluwD40VjDyTDwrY+N8JDmX5o39X
 y4RAkReloJs6xezd90YnPPvqJPT49+gQDgCLC1KyhCIBzL/ntwGSydw7i7DsYGwuW8Lh
 K50g==
X-Gm-Message-State: AOJu0YzGq7fBAn4zeBWJRi9JzKUMHotnjgFtENjOacV8Ep/vuu645TMC
 qiH4Hc1mYa7KXuBqIGSVKCVadWk93OAoDRNb3C327nkqEWN+9RyEXh//WoKdep7I
X-Gm-Gg: AfdE7cmwGHWZG4nhsP38U1gg4Zjyp7l3fMDEJc5zxkYylXxZvdrzifVKVVTWLgjLxN/
 yTO9RsOCksNxlkQLguPsRft27inccqayLprzcuhIVDVsUifqjhFTco/CopoEbCds74MDMd/kBi3
 1qooJVAUQG64ORG50LYO0wdT5HiKJH2ugUL/J6DlNbWju3790+NyfoA6mNEC8SIEXCEPBD3TNa6
 EUo1ZGkCzIYduKjbkd1Jna330l1ZKjv3YzKwS/2fjljZPn3OqwSv0QxpIEzE4kP1/YRANlR0pAQ
 /9mKQRVyDSRye0wDmOTuyF8oReSHx9nB0Jd6rvsBRzpQSgeDvwPXmmdkLSm6yLB8yNUTiRcn9oV
 nEqn8CDKFdoC8oHPNY5bwFpmFg7HjIGe9YlG+3o5k11rpnb9OqJY/9xM33Yhv+F8nc4XeDsxWDf
 RoAX3fLO6nukPr/0Ltihin76byCpd4WidHmK5Yy2+Vi9UQDwt4ViMsBPah+va/wDY+ULe8I316i
 QfSoXo1BFUmjrxbXGcQvXppg3OPJStCRw==
X-Received: by 2002:a05:6000:41ee:b0:46e:6210:ad4a with SMTP id
 ffacd0b85a97d-47df071e518mr11370482f8f.5.1783685026628; 
 Fri, 10 Jul 2026 05:03:46 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d83bdsm59637487f8f.13.2026.07.10.05.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 05:03:46 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 10 Jul 2026 14:03:42 +0200
Subject: [PATCH v3 1/2] drm/etnaviv: Reference count struct
 etnaviv_file_private
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-etnaviv-reset-notification-v3-1-7a145c8a1d01@igalia.com>
References: <20260710-etnaviv-reset-notification-v3-0-7a145c8a1d01@igalia.com>
In-Reply-To: <20260710-etnaviv-reset-notification-v3-0-7a145c8a1d01@igalia.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,igalia.com:mid,igalia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9247373A7F4

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

