Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KE0EB6jfUGqr6gIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 14:03:52 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ED873A7FB
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 14:03:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dcndVAD4;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6793810F88F;
	Fri, 10 Jul 2026 12:03:50 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C953710F894
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 12:03:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-476a130c138so1110501f8f.0
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 05:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783685028; x=1784289828; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CDXfk8heR8E8obrxXeseruKu7LCdsmZqgLzu+ejBn3M=;
 b=dcndVAD4dUnUhbjib1Il2NhmxXSnKINdi+GyusKyvwsJ/vRBOkSHqSJT6lm3ULNtWW
 hsrHePWshT7Y/pFLJ/IRF0i8+ydNwhLu/6UJy2uzF1OyO2N7UgGUIeukSrgH4Ea9vtOX
 w6IyEmAkafsJ6KSR+lnnus82areVydwkBBPC1EKbIpLX+MJzGoCpyaTbFc5f/aSm7W6w
 SDkDpglcrNBTQCWSWcYZUYPTfMRMr4qCkP+IBi1MgM0SdHszvDWrFs+BWit6wXcasGtE
 QyN+S9vFrCEeEeQVCpnqVQLY4v8txrRdqT9j+mAt6crGbnNP9Z2T1i/f0BBxdk/GQQip
 gcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783685028; x=1784289828;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CDXfk8heR8E8obrxXeseruKu7LCdsmZqgLzu+ejBn3M=;
 b=KAAUS5MH/oe2KjAnRWyYzIoXhwBVWc0HeWTOrMC+PrJ6Om4ZKbIbH/yGbR9mVqyHzX
 YJ36BFRDVAWVqWxQzWpneM9l0PktaLt6CYp35iP4NG4w+9q5eivmRyW6r4nIsM6PvtD6
 LGXA9Dq8O1pT3ltCjBt+mrDO3zPDliLrgVLcpFkHoxe92W0yrK7bE0VB79NzldTQON29
 2xYzd33shvTMrxzhYZUIC0ztQN66558OlWIdPrIsLr6l4r9WSEspeG/Hi3hjzQFNwPTh
 4lm0GGmHjIwkhgsrcHTzpIBtPWwhMHButF8M4db6WgfCkNpxX2ZS6GMJvJryhigc6hzX
 +JFg==
X-Gm-Message-State: AOJu0Yz1wY7livsqLwretOKEp6ajjyVLImj/r1XJnympKi7SnPtcE9l6
 IfMRHXs5zNvPzy+oPNh5DJHO0XaV7c63d1XSCxie9vzZdhUi57HP8Kcb
X-Gm-Gg: AfdE7ck8hKnPDQTvQU3j12utaz9eJJyDkxSLtmGe1ZvogBmBDBlG1oukrK3w06AfKzp
 KHLxixQwTjyJILGzWZ99Zo/gKzj0Jbz+gqeLT7fBozSm0ghC/7bvAy3GIOvLO1Q4BmQu0UTPD6f
 oLVrYzrfEaSQDy7otMZh53RhHv2liTyfATLY/EUIHz7y2YuwzRiJjneJxfL3I6nOtffiGkydPhc
 3WgKpiPOZ2jBXWIcwYCjf4m3DeaMMj7qBbYjn/UPUzG2VkwIB3VXaut6p38uBYEINSOAKQTrqBF
 ckH82OTdxG7LOHnW3f3PGzR9v/W7CoJtM/P/CWafPec2LEOYIM1pFEBdTFSj71h8P/Os5gokllu
 LpzVSrDJ+PR2wFVTR3I2keGpWVBRuOvHN5sm2pq5sURn3y40cU2FMg97gyPXSUOj5Xp47/NQnuI
 bRB5QPOOMALoUKEjsfz/7WQC1QP8wN8K91koYeSy0OzYfZa8/vwVcZY3f7p1mHd1t4BxA1JLv7d
 +NhNs+Cermf8eYP6gvWXyCj2EXRBoxtpw==
X-Received: by 2002:a05:6000:400f:b0:460:6a13:9131 with SMTP id
 ffacd0b85a97d-47df07238f9mr12877850f8f.19.1783685028028; 
 Fri, 10 Jul 2026 05:03:48 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d83bdsm59637487f8f.13.2026.07.10.05.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 05:03:47 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 10 Jul 2026 14:03:43 +0200
Subject: [PATCH v3 2/2] drm/etnaviv: Add GPU reset counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-etnaviv-reset-notification-v3-2-7a145c8a1d01@igalia.com>
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
X-Rspamd-Queue-Id: B5ED873A7FB

From: Christian Gmeiner <cgmeiner@igalia.com>

The OpenGL and Vulkan robustness extensions let an application detect a
GPU reset and check if its own context caused it, so the application can
drop the broken context and build a new one. The kernel knows both
facts, but etnaviv has no way to report them to userspace.

Add two counters and a RESET_QUERY ioctl that returns both in one call:
a per-GPU counter that counts every reset of that GPU, and a per-context
counter that only counts the resets this context was guilty of.
Userspace compares the counters with saved values: if the context
counter moved the context was guilty, if only the GPU counter moved the
context was an innocent victim.

The GPU counter is per GPU core and not per device, so a hang on one
pipe does not look like an innocent reset to contexts that only use
another pipe.

The timeout handler updates both counters and the ioctl reads both
under the GPU lock. Without the lock the query could run between the
two updates, see only the GPU counter move and report an innocent
reset to the guilty context.

Bump the driver minor version so userspace can detect the feature.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c   | 29 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h   |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h   |  2 ++
 drivers/gpu/drm/etnaviv/etnaviv_sched.c |  5 +++++
 include/uapi/drm/etnaviv_drm.h          | 19 ++++++++++++++++++-
 5 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index a27ed014fb4e..5c50e5a24408 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -296,6 +296,32 @@ static int etnaviv_ioctl_get_param(struct drm_device *dev, void *data,
 	return etnaviv_gpu_get_param(gpu, args->param, &args->value);
 }
 
+static int etnaviv_ioctl_reset_query(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_file_private *ctx = file->driver_priv;
+	struct drm_etnaviv_reset_query *args = data;
+	struct etnaviv_gpu *gpu;
+
+	if (args->flags)
+		return -EINVAL;
+
+	if (args->pipe >= ETNA_MAX_PIPES)
+		return -EINVAL;
+
+	gpu = priv->gpu[args->pipe];
+	if (!gpu)
+		return -ENXIO;
+
+	mutex_lock(&gpu->lock);
+	args->global_reset_counter = gpu->reset_counter;
+	args->context_reset_counter = ctx->reset_counter;
+	mutex_unlock(&gpu->lock);
+
+	return 0;
+}
+
 static int etnaviv_ioctl_gem_new(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -502,6 +528,7 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(GEM_WAIT,     gem_wait,     DRM_RENDER_ALLOW),
 	ETNA_IOCTL(PM_QUERY_DOM, pm_query_dom, DRM_RENDER_ALLOW),
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
+	ETNA_IOCTL(RESET_QUERY,  reset_query,  DRM_RENDER_ALLOW),
 };
 
 static void etnaviv_show_fdinfo(struct drm_printer *p, struct drm_file *file)
@@ -530,7 +557,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.name               = "etnaviv",
 	.desc               = "etnaviv DRM",
 	.major              = 1,
-	.minor              = 4,
+	.minor              = 5,
 };
 
 /*
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index cba4323ae589..9c348aa7f8d3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -34,6 +34,7 @@ struct etnaviv_file_private {
 	int id;
 	struct etnaviv_iommu_context	*mmu;
 	struct drm_sched_entity		sched_entity[ETNA_MAX_PIPES];
+	u32 reset_counter;
 };
 
 struct etnaviv_drm_private {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 5cb46c84e03a..a97780131426 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -148,6 +148,8 @@ struct etnaviv_gpu {
 	u32 hangcheck_primid;
 	u32 hangcheck_fence;
 
+	u32 reset_counter;
+
 	void __iomem *mmio;
 	int irq;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 139e6e38784b..6e9b677122e3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -79,6 +79,11 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	if(sched_job)
 		drm_sched_increase_karma(sched_job);
 
+	mutex_lock(&gpu->lock);
+	gpu->reset_counter++;
+	submit->ctx->reset_counter++;
+	mutex_unlock(&gpu->lock);
+
 	/* get the GPU back into the init state */
 	etnaviv_core_dump(submit);
 	etnaviv_gpu_recover_hang(submit);
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
index af024d90453d..b50a3a0799e6 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -265,6 +265,21 @@ struct drm_etnaviv_pm_signal {
 	char  name[64];   /* out, name of domain */
 };
 
+/*
+ * Reset status query:
+ *
+ * Both counters start at zero and only ever increase. Userspace saves
+ * both values and compares them on a later query: if the context
+ * counter moved this context caused a reset, if only the global
+ * counter moved the GPU was reset on behalf of another context.
+ */
+struct drm_etnaviv_reset_query {
+	__u32 pipe;			/* in */
+	__u32 flags;			/* in, must be 0 */
+	__u32 global_reset_counter;	/* out, all resets of this GPU core */
+	__u32 context_reset_counter;	/* out, resets caused by this context */
+};
+
 #define DRM_ETNAVIV_GET_PARAM          0x00
 /* placeholder:
 #define DRM_ETNAVIV_SET_PARAM          0x01
@@ -279,7 +294,8 @@ struct drm_etnaviv_pm_signal {
 #define DRM_ETNAVIV_GEM_WAIT           0x09
 #define DRM_ETNAVIV_PM_QUERY_DOM       0x0a
 #define DRM_ETNAVIV_PM_QUERY_SIG       0x0b
-#define DRM_ETNAVIV_NUM_IOCTLS         0x0c
+#define DRM_ETNAVIV_RESET_QUERY        0x0c
+#define DRM_ETNAVIV_NUM_IOCTLS         0x0d
 
 #define DRM_IOCTL_ETNAVIV_GET_PARAM    DRM_IOWR(DRM_COMMAND_BASE + DRM_ETNAVIV_GET_PARAM, struct drm_etnaviv_param)
 #define DRM_IOCTL_ETNAVIV_GEM_NEW      DRM_IOWR(DRM_COMMAND_BASE + DRM_ETNAVIV_GEM_NEW, struct drm_etnaviv_gem_new)
@@ -292,6 +308,7 @@ struct drm_etnaviv_pm_signal {
 #define DRM_IOCTL_ETNAVIV_GEM_WAIT     DRM_IOW(DRM_COMMAND_BASE + DRM_ETNAVIV_GEM_WAIT, struct drm_etnaviv_gem_wait)
 #define DRM_IOCTL_ETNAVIV_PM_QUERY_DOM DRM_IOWR(DRM_COMMAND_BASE + DRM_ETNAVIV_PM_QUERY_DOM, struct drm_etnaviv_pm_domain)
 #define DRM_IOCTL_ETNAVIV_PM_QUERY_SIG DRM_IOWR(DRM_COMMAND_BASE + DRM_ETNAVIV_PM_QUERY_SIG, struct drm_etnaviv_pm_signal)
+#define DRM_IOCTL_ETNAVIV_RESET_QUERY  DRM_IOWR(DRM_COMMAND_BASE + DRM_ETNAVIV_RESET_QUERY, struct drm_etnaviv_reset_query)
 
 #if defined(__cplusplus)
 }

-- 
2.54.0

