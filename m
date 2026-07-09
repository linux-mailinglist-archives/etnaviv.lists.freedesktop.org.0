Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IXz7Cfm2T2q9nAIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 16:58:01 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA37328C0
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 16:58:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YEhMmHg0;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F8B10F605;
	Thu,  9 Jul 2026 14:57:59 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A354510F605
 for <etnaviv@lists.freedesktop.org>; Thu,  9 Jul 2026 14:57:57 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493e4ccccc2so8109725e9.2
 for <etnaviv@lists.freedesktop.org>; Thu, 09 Jul 2026 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783609076; x=1784213876; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=2uYvJ99V7OcwcA873bLOHoWJoXNW9jnVzYVBsOqs+A8=;
 b=YEhMmHg0FXh3JhLNRafGQqXZaahx6HhpOgWWUUq4y1KJQwDu/oV0S0kRBV2/8ri9Ws
 N5J2dIzRenKvkyOJbIva9Cpoc24txB5F6Snylrff20Sgh8z8ecO5/d2HdnCAzpJ6PBsW
 Cf21xnNBQJG6TOXAwq3I62aH0SdAmvFpEVSC4mhOvt6d1OyySAw5o7heZrB1MPHGJI8V
 JUV6gEErOCQc1R4ZV/AGZgXg18h8qfnKEGSn7SLw+g8DZpxExeVtJelGyXumnq4tHxPD
 LRGVSrPCWTS0EtgnqeNE5q9tffd+S9JGyYGnKH7VM3ElyBCmDigTtcBv0z/h4JeZzNj1
 Yh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783609076; x=1784213876;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=2uYvJ99V7OcwcA873bLOHoWJoXNW9jnVzYVBsOqs+A8=;
 b=ATS/IuF07BIqwTO1biQ7i/G9T5J1pHVv/nrBkNv9k7Z+NJ3+f2Ncx2sggnNgASGVsF
 HnGN1H9xqE37NigdOS+3KS1VisHfC78+E1EeV00nV30AYgkNxWhO27fd1syDHSlyAfvR
 DhMru/jDqbr9dgf72IysMnrAljL1h7supchmtkbuOvcmxuUfgXhsKRiJf3nleEUbL5n2
 gzqbdgXsgScScgiHQVYQROjxfGMv15VKbW6QsQoCs6HdDT580olnKKuEUDvVYk7/bvp+
 N4HyengEJbCO4ttOm0OmT6psg1OZ9cByFV1Ilkc0RBcauw4BkcuKHs11qvPJXokKJdaj
 9iKg==
X-Gm-Message-State: AOJu0Ywemp71PW6+cWien87mTw5zIhG2iQI8iwTS7bpiUHY0vE5y5yHT
 ITfk2DqDssv9jN+IBKRzFrijOf/EjJvouFKtOz5VOd+NNO5M21r7eKtf
X-Gm-Gg: AfdE7clkiq65tCB0v7/gYQ+8lq+L3ZOxOaR35ZWlrxwgWp54rwzMAMQtCQRlx9c/BFq
 aVXOUMd0FUZ/uzQZXhKPM8MGxDN5+OuLHD1imMoYEqNrstDds/j/JSljRpWU54krkT4lzHjbd91
 baIEanX59QIAb1mBB1jD03S3x6sDYuPMSuuELtquT/Gdg0dXASU1E3LyK7ADEGW9APaieMLQ0oa
 W318cnQVVlIaodf1EsLnUXw0kU+nUiTgcUOAb+ZTxWl+aTXDyaOJZefA82TbdgDz600933XeBUH
 zd9sB4s0Go6+DVqYdcwa6qMiwQ0s05ncRlcTIlTHp+6SCqjjvuhFJ06hEOSlyQ27+Q1y25DFva5
 8GcjnJS5su60bmz+dIoy+QBYdrZ5xbZQ/wlxL704FzW3JvHBAnF2kh4S0UPRwioA0xLFKPSweFC
 Fx1ZNgJUXATIjSyvJG18YBZiIMRoh0xvvw+NgWguZXY8iVgjsGrpIefghTkZLqzXgNRNGi0snRI
 fAfbF+QxDw98NMZkQ74zuK8BHxplFEGvQ==
X-Received: by 2002:a05:600c:8709:b0:493:e4ce:acd0 with SMTP id
 5b1f17b1804b1-493ec667544mr34169015e9.1.1783609075884; 
 Thu, 09 Jul 2026 07:57:55 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-42.cable.dynamic.surfer.at.
 [62.178.82.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e5a572c3sm162226435e9.1.2026.07.09.07.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 07:57:55 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH 0/2] drm/etnaviv: Add GPU reset counters for robustness
Date: Thu, 09 Jul 2026 16:57:44 +0200
Message-Id: <20260709-etnaviv-reset-notification-v1-0-64c617496958@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBvQpB+6SrQYbarZWKhIIN09a
 fkt3isQOQhHmJsCgbNEuXyFbhtwJ/mDUbZq6FQ3qFFNyMlTloyBIyf0V5JdHKWaoVVm1L0hTWS
 hDu7Auzz/fFnf9wMshI8ebAAAAA==
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
	FORGED_RECIPIENTS(0.00)[m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel-dev@igalia.com,m:cgmeiner@igalia.com,m:linux@armlinux.org.uk,m:christiangmeiner@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
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
X-Rspamd-Queue-Id: 70AA37328C0

The OpenGL robustness extensions (GL_KHR_robustness) and Vulkan
(VK_ERROR_DEVICE_LOST) let an application detect a GPU reset and check
whether its own context caused it, so it can throw away the broken
context and build a new one. etnaviv already resets the GPU after a
hang, but userspace has no way to learn about it.

This series adds two counters, exposed through GET_PARAM, following the
model already used by msm and v3d:

- ETNAVIV_PARAM_GLOBAL_RESET_COUNTER counts every reset of a GPU core.
- ETNAVIV_PARAM_CONTEXT_RESET_COUNTER counts only the resets the
  calling context was guilty of.

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
Christian Gmeiner (2):
      drm/etnaviv: Reference count struct etnaviv_file_private
      drm/etnaviv: Add GPU reset counters

 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 22 +++++++++++++++++++---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h        | 12 ++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  5 ++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 12 +++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  6 +++++-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |  3 +++
 include/uapi/drm/etnaviv_drm.h               |  2 ++
 7 files changed, 56 insertions(+), 6 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260708-etnaviv-reset-notification-b037153a1aab

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

