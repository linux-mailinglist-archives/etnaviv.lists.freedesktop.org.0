Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B5056CB79
	for <lists+etnaviv@lfdr.de>; Sat,  9 Jul 2022 23:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF3F11B941;
	Sat,  9 Jul 2022 21:00:54 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60EA10F74C
 for <etnaviv@lists.freedesktop.org>; Wed,  6 Jul 2022 18:29:43 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-31814f7654dso113177257b3.15
 for <etnaviv@lists.freedesktop.org>; Wed, 06 Jul 2022 11:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=WFIqq+Ih1CphrUsWAZ/TbaFgC8wSAo6D8gk6Qgq5hnE=;
 b=KKDpFirza47Orl3k+eu59zksxZJfyAAZGEmAozAnCJw/8ycZWnOjOjZ66rNx63/vff
 CZsDzYCXha5g6Bz4HHm0aZpHX2Q+dIfjkWlrcIgYR1xbw+R8rB36+ZJjZFQgvFOhao7b
 EyHykMj40N8gXOSwjRJ1zKW5UQbMYtNCBLwjmi45IOZbkBjBaeQeF2rLMpuKKOOXtkaf
 OH76PqHJAHOoZ/cm5sexyU6e5adhrjxjASPMEaG9zGkd7SZKHw0Fzt6PZhws365Afemg
 80iD5wE/Nh2Z6cosBcnbXu7i+/RD+2HazCOm0sc7hW/GObtZmHOeK0i4vX8PaJmUq5XJ
 4YUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=WFIqq+Ih1CphrUsWAZ/TbaFgC8wSAo6D8gk6Qgq5hnE=;
 b=Tv9GoGs2JrXwTnMEb3FZObsFhMm1JBh0ARivHnuNTqBQ1Ru+xX4U3rnKqx1P/32Vc5
 fcVr9IeoI62g0ABQA2MGRzqfnSGw7tLZ0SK59xGbriu/fDQTP3Opd2lECM348wYFtSsw
 mrG6WKcKdihFUUi4pl6+HftptLoLQCDNQ9eILr3ONgsKgkiPta/pzwzA9I4E8XLvISlA
 guWA0f/Qctc33OQhn5P4DsX01rbIHLNlnVl6FZl+v3rL1uYIjeMAiOnOMm0MIH1iRAfG
 BYjPCOWHX2lX+IxlWALr4qxEz9kNBrQFG9LCanoE/HgvQ01Vk5QCNrO5a8lIc30Yitci
 FEeg==
X-Gm-Message-State: AJIora/mBdVFTWMjcMXb6JBD3UnJ+sv2wZmk9aOFkk7H8ccckYcorFpN
 3HBihxDNllyhvDmnjaOMzTsTVPrXYvBIudw=
X-Google-Smtp-Source: AGRyM1s7dT6nr0ViJcQtDJEIuz8ngMKQXBvRBWAFFgqLK42PyV8aI8hdF86axENugYHnaXsYT6RhQn4SdgVZ/bk=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:53a])
 (user=tjmercier job=sendgmr) by 2002:a81:110:0:b0:317:a640:ad04 with SMTP id
 16-20020a810110000000b00317a640ad04mr49013482ywb.427.1657132182771; Wed, 06
 Jul 2022 11:29:42 -0700 (PDT)
Date: Wed,  6 Jul 2022 18:29:24 +0000
Message-Id: <20220706182924.2563058-1-tjmercier@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] drm/etnaviv: Remove duplicate call to drm_gem_free_mmap_offset
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 09 Jul 2022 21:00:52 +0000
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
 linux-kernel@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

The docs explicitly say the drm_gem_object_release function already calls this,
and this does not appear to be a prerequisite for the call to
etnaviv_gem_ops.release.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index cc386f8a7116..ecb828e4e156 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -504,7 +504,6 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
 		kfree(mapping);
 	}
 
-	drm_gem_free_mmap_offset(obj);
 	etnaviv_obj->ops->release(etnaviv_obj);
 	drm_gem_object_release(obj);
 
-- 
2.37.0.rc0.161.g10f37bed90-goog

