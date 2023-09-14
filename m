Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2468D7A758A
	for <lists+etnaviv@lfdr.de>; Wed, 20 Sep 2023 10:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8B410E453;
	Wed, 20 Sep 2023 08:13:28 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B108210E2AA
 for <etnaviv@lists.freedesktop.org>; Thu, 14 Sep 2023 18:20:02 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d814105dc2cso1578416276.2
 for <etnaviv@lists.freedesktop.org>; Thu, 14 Sep 2023 11:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694715602; x=1695320402;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+tDCVePA3H/Y86jExEhecx21ZlR+zsTby9yjOcJea7c=;
 b=R40mTlw176X1gG9izZf+4jfB+fS2Bdu8uK7KIBsVQljsB/omboOUaLvfxma+ehnAbu
 WhMz+TlSlC42pmKng8TqrlxUT0O9KxdITx9ub88O+WPqaecT56e7ZIPdTcSDPKXOt+mX
 JybC/3sfxX0tSOnL6L0oD8uqxgNwxK7bo+4vA3z1Az6ieZu/8Z7Y3wnT7Jd0kbz9btZH
 AP9WWD2qBnGFItomjbD+aFnE3in9c6Kbq2IcVa3pLVDMQEjwjbo3g4kPeViPE7Aqm1tF
 kC8blgImGgGuInid5EgW9kjKImf2KD/HlzeOWZ7mfNf7YmVG61R8oHrLea7s/imGD1O7
 I2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694715602; x=1695320402;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+tDCVePA3H/Y86jExEhecx21ZlR+zsTby9yjOcJea7c=;
 b=qZVf22n3G2QxMdBcs0RaIQfpVF0DJIHmRGstJw1qJIoVLzthmHwGcnH1eYwReyFQXG
 CRnSGjac74CruwgiefmJDmupbvkKqJxZddyky8rVxyp1EJ3lzDZz6Wr7F1+jk0LE2kVN
 Ra0asaesS3qHB0onh57rR3ClmV2PbNqu+CJAr/Wd9mSonVRs6q1zn//3SOA3tZDxd2+V
 Tu3LrDHnZ+BrZ+WADri5Y+GoTMUURX1mJC9kdXzPwt97bSewoVFgseUBwmHIKqhXa4g/
 C25KWCuWlQSuCKCAy0s54pERutIfnbR8bwOl5gv4zRJylv15gRAJmFSzBoHQiEpTDMGe
 ndQg==
X-Gm-Message-State: AOJu0YyLQIORyC9twlHLZAAagWfw9b6wPLNW5g5z6enMVYMSUVmG1MnJ
 BVStWTP/oMmMvSB1Z1N+2ZTpjIIc2EjZOpBwrw==
X-Google-Smtp-Source: AGHT+IGfxVOd75Rdpx2cardrEaNX99DCozdAd+Y1ohWSOUbn/k74RQ3w7NoBhkr2+YnX8BQUjGQoK7m2XXfE0ndaVg==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:abaf:0:b0:d77:bcce:eb11 with SMTP
 id v44-20020a25abaf000000b00d77bcceeb11mr135467ybi.10.1694715601838; Thu, 14
 Sep 2023 11:20:01 -0700 (PDT)
Date: Thu, 14 Sep 2023 18:20:01 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANBOA2UC/zWNQQrDMAwEvxJ0rsBO0oP7lVJKsORUhyhGTk1Ly
 N9jCj3NzmVnh8ImXODW7WBcpciqTfylg/iadGYUag696wcX/IhlM435i2RS2QrO+d32grzpVKX
 ++cxsaVkVIxK5cB2Dp0QM7TcbJ/n8mvfHcZxWgPpkgwAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694715600; l=1992;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=SeuSKp981fs1thsOAOeS7EP9Ar4X1zn644iwNj5mbW0=;
 b=BWw2xpB4+Q0ImJXqA281cKFhurR2PsXPzdhCXMjsCWc7SsHnWYgeKtLVUn9zKZtXCCIxlq54x
 Lllt8bVOVZ2DwqP3B3RwgpiECJ3K+prluKT70wJhl50BC6TEYxoRCPO
X-Mailer: b4 0.12.3
Message-ID: <20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v1-1-3adc2d9bfc52@google.com>
Subject: [PATCH] drm/etnaviv: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Wed, 20 Sep 2023 08:13:27 +0000
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Justin Stitt <justinstitt@google.com>, Bo YU <tsu.yubo@gmail.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

A suitable replacement is `strscpy` [2] due to the fact that it guarantees
NUL-termination on the destination buffer.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Cc: Bo YU <tsu.yubo@gmail.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Similar to [1] which was never picked up. Let's prefer strscpy to strlcpy, though

[1]: https://lore.kernel.org/all/20190328080918.9290-1-tsu.yubo@gmail.com/
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index bafdfe49c1d8..9e7bebcf24eb 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -511,7 +511,7 @@ int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
 
 	domain->id = domain->iter;
 	domain->nr_signals = dom->nr_signals;
-	strncpy(domain->name, dom->name, sizeof(domain->name));
+	strscpy(domain->name, dom->name, sizeof(domain->name));
 
 	domain->iter++;
 	if (domain->iter == nr_domains)
@@ -540,7 +540,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
 	sig = &dom->signal[signal->iter];
 
 	signal->id = signal->iter;
-	strncpy(signal->name, sig->name, sizeof(signal->name));
+	strscpy(signal->name, sig->name, sizeof(signal->name));
 
 	signal->iter++;
 	if (signal->iter == dom->nr_signals)

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-dd095491dfde

Best regards,
--
Justin Stitt <justinstitt@google.com>

