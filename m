Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1e+JO6bfUGqo6gIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 14:03:51 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9AD73A7F3
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 14:03:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NplBuogt;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E93210F86B;
	Fri, 10 Jul 2026 12:03:48 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7FC10F88B
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 12:03:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-475881b9a4bso834876f8f.3
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 05:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783685025; x=1784289825; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=hksPX1U2TBlTextUaSByNI1aeIBAxfzf3b6cw/OY5vY=;
 b=NplBuogt8bSAPEuAb77jfOVj/DEH5IYq2dd2YkQRPkGlU9f1lusHfYeSTukzOUU6bB
 VHFAG5EUWXBcooW5NkqNlVs9LIQheLmtjNM2mwhIPKhPxpF2t2HxHYxhtRsGmTtIDoL4
 j7wBz+fpU0BD6GHdEI/cf6kFJ7Ecev9kQUD41ReSRLc59hwn+w+U1pN3qGD+bpzYdts2
 W/2gOMT2VFpqrtdp3VnGe4AV9ByCwRM4qksi8TMhDMUQ+m/jW2uGb8t/4g55Bjj6GlBj
 9n7kxdAlndwzrxvB35oD4ozaWCbzStYHOwfURkrPflaG/NkjizWf9i1wD0qDI2DC7a17
 4WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783685025; x=1784289825;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hksPX1U2TBlTextUaSByNI1aeIBAxfzf3b6cw/OY5vY=;
 b=T3Hcark5uO2bdY5DEl23mIMV0EdTMe9bG0t6902JOMDmxxpV5Lgsxz6t/QST+AsCvl
 Yc7UM5uJyNHFyVQKHDwsmr3cpkwZwc9JwzkBCChFgR+OEhCcUWgtTXj+VzpYpYDavZnM
 4DKYZ5MBKGYw6K/eJ96Dr9JcQrHxyGgi8SxByLgCfCA9VFGWsOsDW2PJDuqFa7pmnmkk
 EYOINeeCMmNEu8z5wecUW6t132oVHeMcVT297VzY50TyKeWYG9OiDsvBtZvHnrvvHiVa
 AB02nogdVlSZqZoMZWUunaIatoWguVLiTl35MFr7LT4xhoXqSuwyO+9nd+FRQoJ/BoMV
 DMtw==
X-Gm-Message-State: AOJu0Ywq8OiLEGYox6Zv8LOWUhCSuhT0aEfc4+s2k1Y7DKlPucbZfK9w
 47yHQAFYJ4NbYdLPOffnlvfRkd82+Tv9riq0/ox+1AvMogngx/ljABx5
X-Gm-Gg: AfdE7ckEJ8sHbdeA48Ufsf6Uf96Bmn0kNn7tPQC0BKYXbK+yGCYeYM69Mi33Hq8mi9q
 QegKOv93Skg0WHmlHOGPzUs7jj3AOQNBIDA+aA4q9DsT5EIqUnNPhxByQzTfTw3eZ/JHGuFfdgN
 +LMZD8hQW0FII6bMofhxbDK4DTZJlFxzbzNLgHCuUZnvL20vPY1zttB2IC3OfkMOy3rCM8jWdMS
 K1r3claAYvykoWboBZJrbWsJHJCNqqGhNgU79jYHR0Qx9vKnDyXeg0tolOG4y+lx36txFobmbqq
 +6lO8luymocWUGsaZtZBKTvUNaqHS+w/E303qnjviSsZm0diBJ++xQyilE32SRs5gj11JbzcFJ2
 gY1NHhsGyRKOLQfF4uXe7XqxBJghrUtZxMGea1XsnNR7seEvXRPFdFXPSoRb8QvpzERtOlQ3SF+
 X8hj7d2G8l2dAHlunIRm4Di+2uf5bHlecXypsUU7SGqg2dTZs2g4SfAFD98kCCbLlqKup2jEGUI
 nTgd+s/8op+kJTN5+H1ki+fha7vXNM55A==
X-Received: by 2002:a05:6000:2007:b0:460:1301:dec6 with SMTP id
 ffacd0b85a97d-47df0715673mr12782183f8f.10.1783685025316; 
 Fri, 10 Jul 2026 05:03:45 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d83bdsm59637487f8f.13.2026.07.10.05.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 05:03:44 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH v3 0/2] drm/etnaviv: Add GPU reset counters for robustness
Date: Fri, 10 Jul 2026 14:03:41 +0200
Message-Id: <20260710-etnaviv-reset-notification-v3-0-7a145c8a1d01@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQqDMBCF4atI1k1JokbtqvcoXYzpRAdaU5IQW
 sS7NwqFduPyfzDfzCygJwzsVMzMY6JAbspRHgpmRpgG5HTLzZRQWjSi5RgnSJS4x4CRTy6SJQM
 xn/FelI2sS5AAPcvA06Ol14ZfrrlHCtH59/YryXX9st0emyQXXFdGy6bqdFe3ZxrgTnA07sFWN
 6kfS4pdS2WrE8Zib6xSoP6sZVk+pcmaIxEBAAA=
X-Change-ID: 20260708-etnaviv-reset-notification-b037153a1aab
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,igalia.com:mid,igalia.com:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F9AD73A7F3

The OpenGL robustness extensions (GL_KHR_robustness) and Vulkan
(VK_ERROR_DEVICE_LOST) let an application detect a GPU reset and check
whether its own context caused it, so it can throw away the broken
context and build a new one. etnaviv already resets the GPU after a
hang, but userspace has no way to learn about it.

This series adds two counters and a RESET_QUERY ioctl that returns both
in one call:

- a global counter that counts every reset of a GPU core.
- a context counter that only counts the resets the calling context was
  guilty of.

Userspace samples both values and compares them later: if the context
counter moved the context was guilty, if only the global counter moved
the context was an innocent victim. That is all that is needed to
implement glGetGraphicsResetStatus() and Vulkan device loss.

The global counter is kept per GPU core and not per device, so a hang
on one pipe does not look like an innocent reset to contexts that only
use another pipe.

The first patch is preparation: the counters are updated from the
scheduler timeout worker, which can race with the DRM file being
closed, so struct etnaviv_file_private becomes reference counted and
every submit holds a reference.

Link to the Mesa MR implementing the userspace side:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/42826

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
Changes in v3:
- Update the reset counters and read them back under the GPU lock, so
  the RESET_QUERY ioctl cannot run between the two updates and report
  an innocent reset to the guilty context (Lucas).
- Link to v2: https://lore.kernel.org/r/20260710-etnaviv-reset-notification-v2-0-90cfebcf22a2@igalia.com

Changes in v2:
- Replace the two GET_PARAM values with a dedicated RESET_QUERY ioctl
  that returns both counters in one call. The ioctl has a flags field
  that must be zero for now, so the query can later be extended to name
  a specific context once a DRM file can hold more than one context
  (Lucas).
- Make the reset counters plain u32 instead of atomics (Lucas).
- Use __u32 for the ioctl counter fields to match the internal
  counters, following i915 GET_RESET_STATS.
- Link to v1: https://lore.kernel.org/r/20260709-etnaviv-reset-notification-v1-0-64c617496958@igalia.com

---
Christian Gmeiner (2):
      drm/etnaviv: Reference count struct etnaviv_file_private
      drm/etnaviv: Add GPU reset counters

 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 46 ++++++++++++++++++++++++++--
 drivers/gpu/drm/etnaviv/etnaviv_drv.h        | 12 ++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  5 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  2 ++
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |  5 +++
 include/uapi/drm/etnaviv_drm.h               | 19 +++++++++++-
 6 files changed, 85 insertions(+), 4 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260708-etnaviv-reset-notification-b037153a1aab

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

