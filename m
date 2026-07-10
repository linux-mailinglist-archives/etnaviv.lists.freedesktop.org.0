Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C43+HMy0UGr73gIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 11:01:00 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1133E738C18
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 11:00:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=g2VD1UWv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0DB10E160;
	Fri, 10 Jul 2026 09:00:53 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B62610E15E
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 09:00:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-474560436c3so664852f8f.0
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 02:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783674050; x=1784278850; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Qt+LaAqPvwUm1y0oFk6gJUAvHbxtXN/0WfCUetMYAYg=;
 b=g2VD1UWvcRb57VaW8DWcRhBPji921dHMiPluDGy80h2N9PTR3LtY/dw2crSyM8FViH
 9K9cPIQjm8YXYk7p7qxXs0q+/iedUbyMMeygLM0VqHCiahSIFUl0qBxemkgFIQUWgeNM
 2sQ7nW8NFsfi3FDX1R/NGU3emH7Zk63AckXQIoyOZghWcto6yDyr9vhvnIk2PE0nybZp
 SDAZmGM3yUTbZySsNB8tmMQ+lBblzMP7zyexh1pRBS/Zj31GOpp6rtMogIxc6Qh0YdRc
 4lcA4ecIQDlP2s6oPJX0rEm90K7YIgChER+GJufvNfyMESfdmx3tr2a0R7p4aJjz4Y1k
 hSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783674050; x=1784278850;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Qt+LaAqPvwUm1y0oFk6gJUAvHbxtXN/0WfCUetMYAYg=;
 b=YJT+OwMRa0hlGt4/2s3/6iNKXX1jnV53mKOJ8jsPVGEecVaIKJ53ipXHeWOfs3fL5V
 ZIT+jrU/6oND6/wv4ss2OjqPozVVg3ROeFwFT4Gpt+tcPVIwyzHGJManjLf8hTs9jMcx
 eCaHxqY+6/BGf7ai5BsWXXhJCM3UXghlgBEQETL9CitIJcUbghD7WhKPaWn1rjIkTPur
 qeqwnhxvvT1P/JaqsPr2yw4vwrlY7miGJX2dgzPEylj3RNRUuvxcKIFegJUzB1ZzX6wt
 shTx76vKlztaB8HVt4+Akx7bLfGxiSUHbLhyY+1uzrGAb/Jk3HmKzQygZwvt7iSN/UTd
 /e1A==
X-Gm-Message-State: AOJu0YzDDKBJEaDczQLdpCU20uakpXpqCvUVPE4NlYSK2ea5F4GtyLWD
 COyLzUyOq2nRa3CiZCLe2KeCiAxS6N6Qtx7igQo9r7fg0MfsElGVJxbr5sagOJo6
X-Gm-Gg: AfdE7cmQoCRSjmcqVYNzqmn5S05rxaW5qZPofy88R3QeKtax5HAntW+gY0SWVCa65rU
 VCBGd3IWFLVsN6PrKiyPBzBqB7bkbBYg2Qd1/f++3KvUMGO5nA+NyzlOgZWZjPv6XJB00sRDk/8
 sTjHjG2CuJ5SE9Nwe8bHn/DH+Xp5ZumXic6tuvTXGJVyPbEOQ7aIE13BF7zZiE2nV1Yh680MZaR
 R7CE9jgJv1PxRMq8GIdBv3uzkKlADxGZsq/BOco9UUuKBNl3G1iYVxm8FUfMmUqr9ELWM0OHNie
 kmRW7YSZlJIoKx0ajpmfgTPMInRZDBu5IXE8BuJ28x9mqgs2+5XnoW77tRft+sGlP4CWtke+qYk
 yFt6rLF6QQXCmqRGoaGrlvZpoJpiPzBoqDjSajRFWXiTk4IAlJ8TpPdgpKCM3651CsEhqdH7Bzw
 znRXb7p2GTCCby12NPqzl1sdv7ii0m1dxJLwMMNUbUGHuhqpgrcqdteaADKcttlvPeI8BXZHDQu
 Tv5Zbl6kRY5bVfm8ukh7wq9QrfJ5btumQ==
X-Received: by 2002:a5d:588a:0:b0:475:cd6f:721e with SMTP id
 ffacd0b85a97d-47df07a2965mr11282514f8f.44.1783674049819; 
 Fri, 10 Jul 2026 02:00:49 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b0cesm59386076f8f.22.2026.07.10.02.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 02:00:48 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH v2 0/2] drm/etnaviv: Add GPU reset counters for robustness
Date: Fri, 10 Jul 2026 11:00:45 +0200
Message-Id: <20260710-etnaviv-reset-notification-v2-0-90cfebcf22a2@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQrCMBCG4auUrB1J+pO2rryHdDGN03ZAk5KEo
 JTe3Vhw6/L9YJ7ZRCDPFMSl2ISnxIGdzVGeCmEWtDMB33OLUpZatrIDihYTJ/AUKIJ1kSc2GPM
 ZjLJqVVOhQhxFBlZPE78O/DbkXjhE59/Hr6S+64/t/7FJgQRdG63autd90115xgfj2binGPZ9/
 wBudgQ0xQAAAA==
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel-dev@igalia.com,m:cgmeiner@igalia.com,m:linux@armlinux.org.uk,m:christiangmeiner@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	RSPAMD_EMAILBL_FAIL(0.00)[etnaviv-bounces@lists.freedesktop.org:query timed out,christiangmeiner@gmail.com:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,igalia.com:mid,igalia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1133E738C18

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

 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 44 ++++++++++++++++++++++++++--
 drivers/gpu/drm/etnaviv/etnaviv_drv.h        | 12 ++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  5 +++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  2 ++
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |  3 ++
 include/uapi/drm/etnaviv_drm.h               | 19 +++++++++++-
 6 files changed, 81 insertions(+), 4 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260708-etnaviv-reset-notification-b037153a1aab

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

