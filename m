Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zC/0Nv22T2rFnAIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 16:58:05 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853187328D9
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 16:58:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EmUreBF+;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4409510F62A;
	Thu,  9 Jul 2026 14:58:04 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC09F10F61F
 for <etnaviv@lists.freedesktop.org>; Thu,  9 Jul 2026 14:58:01 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-493d92b7db3so20588815e9.2
 for <etnaviv@lists.freedesktop.org>; Thu, 09 Jul 2026 07:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783609080; x=1784213880; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B+yIuIbKcmnvIo08VDFmWOFm6XPoaJaRYxeqX9lrp9Y=;
 b=EmUreBF+h40nCJ2rqyVD34+ThmrGGMxhjcSSO/KML0ikJdWeS4/M5UCr9riCVXK2My
 o2c80hgAyR/o69+FsiqEoyLYVNtkQeI4vnAwNqACehkCiakwtpwfOCyefNOu87YlSrTD
 1ZbyprSw4e92r0POLISW0TE026aSK7jvPgEa1pAPdOSK/eUx1kXnzJztk9RYBQ+AQI/0
 uAYiuGYoyGZrO6MJSYGrEMdUsXKldd1EMm3Sg7C5eVWWsj6bY6aNRyGyV0/2UJs1IznU
 8Zl6kIGgmTTUFPgYvHS+BFHrMD7/zaaKzAbl/4y3ggFexAwwNyRPYeH8r2MUre7lH8nf
 9zPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783609080; x=1784213880;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=B+yIuIbKcmnvIo08VDFmWOFm6XPoaJaRYxeqX9lrp9Y=;
 b=hWHu4UbdC6gzL4rzhB+lEEj8TKNlnwN4Lwoqlyd5D0bB6wWXpprc9ebCmDmyDx5w6I
 gVwaUZ0DjmSMifD6blrzqLCW0YEMLnWiE27XoYGj3Shto2nUfUpgBTMVqtd0T703jOVC
 HpYRShod4nwQX0MgzeB0L12alAXffeB/OjHlc32tX3NpWpyfxlq3njZiti7Ftz9kbwR7
 b/aK5qeByuiqbfTyn8uG4J6jTK8+xfIRuHuVBp6ZU4bVZBxsrqekP+PMuaPx8AYz9HxC
 cH1jEl7p1D5Y9cZtj79Rd9MtoDNQKhO1JV/khEbcqcCUOXNNCPxQSMmWl6HGJy3XQEvZ
 ZvCQ==
X-Gm-Message-State: AOJu0Yy8nHboo26logPRJZmvYl0ASBndQ2Nah+ZyCkCe5bh/QcW96xsw
 BUbBdrVZAZBrJZunOsPy+Ii07FG9LcAsyF1rEkseGuJJeJ08rWLxQ1bY
X-Gm-Gg: AfdE7ckAA0unKFsxVM25Qn0E+WJeS1hdRM9qhDa+mEIFVILsADpXipCHr+ym72zveXZ
 kozai/Jd3tl4JWD+KJv48J7RB6NLmjcAe/nqUAkqNQlT3cx3Jmgn7Hqg/rIvPOwOBGB+XnPPT9/
 +Hg9z2KN7s4SyAknnzQUG/zSCBIvhrMc+A0GgqB5n7Uaif3lXux3nskl4rKvE/XmErWTWpvftx4
 NeCTU96QCC9Q+ICVrwHcIi5vi4DuDX4TFTxBe4JTggGLp+lI1MfBRjZPKFLGa0STL6jXCoIVhLm
 +cxS9iV2vZyHGJKbF8m/Q1HMGJYZDmjFVs9XjnhE49B+1SoCLy27z/f6ADnrouB9RzCeM0cx2K7
 P7p1lsXJ8YCn8GBU27ZAwKYrcE6kduAqqa3ZTJ1iowwG6rTtDQQqoVN2wk9DPYP61UvNbxwOFAd
 qareudRyH6rk5wpD2K8X0C2BWZO1FVB0H9YLltmM8wJ/eXfB2ueC28SctRDmCNOYq5IbU7XOK/5
 fTLAGXo0AF1V3+hgI4hXpQ88GvDZobd3g==
X-Received: by 2002:a05:600d:844e:10b0:493:c785:e0d7 with SMTP id
 5b1f17b1804b1-493e68e7612mr59863285e9.28.1783609080000; 
 Thu, 09 Jul 2026 07:58:00 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e5a572c3sm162226435e9.1.2026.07.09.07.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 07:57:58 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 09 Jul 2026 16:57:46 +0200
Subject: [PATCH 2/2] drm/etnaviv: Add GPU reset counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-etnaviv-reset-notification-v1-2-64c617496958@igalia.com>
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
X-Rspamd-Queue-Id: 853187328D9

From: Christian Gmeiner <cgmeiner@igalia.com>

The OpenGL and Vulkan robustness extensions let an application detect a
GPU reset and check if its own context caused it, so the application can
drop the broken context and build a new one. The kernel knows both
facts, but etnaviv has no way to report them to userspace.

Add two counters and expose them through GET_PARAM: a per-GPU counter
that counts every reset of that GPU, and a per-context counter that only
counts the resets this context was guilty of. Userspace compares the
counters with saved values: if the context counter moved the context was
guilty, if only the GPU counter moved the context was an innocent
victim.

The GPU counter is per GPU core and not per device, so a hang on one
pipe does not look like an innocent reset to contexts that only use
another pipe.

Bump the driver minor version so userspace can detect the feature.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c   |  5 +++--
 drivers/gpu/drm/etnaviv/etnaviv_drv.h   |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c   | 12 +++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h   |  6 +++++-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c |  3 +++
 include/uapi/drm/etnaviv_drm.h          |  2 ++
 6 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index a27ed014fb4e..14f2fe5fb98c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -293,7 +293,8 @@ static int etnaviv_ioctl_get_param(struct drm_device *dev, void *data,
 	if (!gpu)
 		return -ENXIO;
 
-	return etnaviv_gpu_get_param(gpu, args->param, &args->value);
+	return etnaviv_gpu_get_param(gpu, file->driver_priv, args->param,
+				     &args->value);
 }
 
 static int etnaviv_ioctl_gem_new(struct drm_device *dev, void *data,
@@ -530,7 +531,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.name               = "etnaviv",
 	.desc               = "etnaviv DRM",
 	.major              = 1,
-	.minor              = 4,
+	.minor              = 5,
 };
 
 /*
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index cba4323ae589..fbbb0544130c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -34,6 +34,7 @@ struct etnaviv_file_private {
 	int id;
 	struct etnaviv_iommu_context	*mmu;
 	struct drm_sched_entity		sched_entity[ETNA_MAX_PIPES];
+	atomic_t reset_counter;
 };
 
 struct etnaviv_drm_private {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index c314b3cb5e70..4253560caa14 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -39,7 +39,9 @@ static const struct platform_device_id gpu_ids[] = {
  * Driver functions:
  */
 
-int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
+int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu,
+			  struct etnaviv_file_private *ctx,
+			  u32 param, u64 *value)
 {
 	struct etnaviv_drm_private *priv = gpu->drm->dev_private;
 
@@ -167,6 +169,14 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
 		*value = gpu->identity.eco_id;
 		break;
 
+	case ETNAVIV_PARAM_GLOBAL_RESET_COUNTER:
+		*value = atomic_read(&gpu->reset_counter);
+		break;
+
+	case ETNAVIV_PARAM_CONTEXT_RESET_COUNTER:
+		*value = atomic_read(&ctx->reset_counter);
+		break;
+
 	default:
 		DBG("%s: invalid param: %u", dev_name(gpu->dev), param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 5cb46c84e03a..a5d7c2158eb5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -148,6 +148,8 @@ struct etnaviv_gpu {
 	u32 hangcheck_primid;
 	u32 hangcheck_fence;
 
+	atomic_t reset_counter;
+
 	void __iomem *mmio;
 	int irq;
 
@@ -204,7 +206,9 @@ static inline u32 gpu_read_power(struct etnaviv_gpu *gpu, u32 reg)
 	return readl(gpu->mmio + gpu_fix_power_address(gpu, reg));
 }
 
-int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value);
+int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu,
+			  struct etnaviv_file_private *ctx,
+			  u32 param, u64 *value);
 
 int etnaviv_gpu_init(struct etnaviv_gpu *gpu);
 bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 139e6e38784b..398608009924 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -79,6 +79,9 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	if(sched_job)
 		drm_sched_increase_karma(sched_job);
 
+	atomic_inc(&gpu->reset_counter);
+	atomic_inc(&submit->ctx->reset_counter);
+
 	/* get the GPU back into the init state */
 	etnaviv_core_dump(submit);
 	etnaviv_gpu_recover_hang(submit);
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
index af024d90453d..977f6ae82fae 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -77,6 +77,8 @@ struct drm_etnaviv_timespec {
 #define ETNAVIV_PARAM_GPU_PRODUCT_ID                0x1c
 #define ETNAVIV_PARAM_GPU_CUSTOMER_ID               0x1d
 #define ETNAVIV_PARAM_GPU_ECO_ID                    0x1e
+#define ETNAVIV_PARAM_GLOBAL_RESET_COUNTER          0x1f
+#define ETNAVIV_PARAM_CONTEXT_RESET_COUNTER         0x20
 
 #define ETNA_MAX_PIPES 4
 

-- 
2.54.0

