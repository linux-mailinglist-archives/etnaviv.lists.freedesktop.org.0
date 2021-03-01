Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE37327B36
	for <lists+etnaviv@lfdr.de>; Mon,  1 Mar 2021 10:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4996E550;
	Mon,  1 Mar 2021 09:53:04 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046E36E550
 for <etnaviv@lists.freedesktop.org>; Mon,  1 Mar 2021 09:53:03 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id u187so10999361wmg.4
 for <etnaviv@lists.freedesktop.org>; Mon, 01 Mar 2021 01:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gCxNwSmtosKjBOsP3oJostPTdxL4pw1j5WTp0Gs5jN4=;
 b=aT/lpsg3hVIo/j/sXTbm1YQnEo2Mhu8qNhuBG1++3ci9SmJZnTW1ScmMGSFirtKKo+
 6p/wq16Ys3GaxMJGktYpmGy9yfrOinrwYQg8YIxDxaODMfAeY07P6X6DxvfKufZ+/jKz
 jcvC1b842TLcrMDiduAHx5Mt88Yg6pXG8VfZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gCxNwSmtosKjBOsP3oJostPTdxL4pw1j5WTp0Gs5jN4=;
 b=Rg0xE7WDh9TTYLrTB4nWMc+l6q4wn5fK/EadbYxNqNNMqUnrM20SSpqPuosYGtxw8X
 ez/B3mdPnLelkGVraYpGT/htF1KF4vsKn9fgKGZDb+7Cel6I9NytNYIRrueLar/49YC/
 UzH8H8MQ9+zq84p3ySw60LQUBF0gpoGt2fxgmdvd5MzAGH/Cm4qdaQU7uYODOR/V26cD
 pO1cCvcKnxudYIRqG9ILTX+phOcQVm3W5y60VlDnrjDVqtgljB4krxMwOziAUKVf3hL4
 JUNmkSYioQcZJ4UgpRoQ3FKx5LCEFDHOOyWIilC38/lSBmvE3oc3yRHVPimpbry4VY2s
 26Sw==
X-Gm-Message-State: AOAM53090oGVFuKw3EzRXV8VzMzYtylzyJQFo4Ejf8DYIVrcR61AbhrR
 Aif73zDNEKGmlG7i5NR+o0Ji2A==
X-Google-Smtp-Source: ABdhPJzS9tzgwkxeKN9NVWheGzS19gf3IPi0FqJ1+eBzNy1c7Bj1uTvARfgNW1EOExC3AnAg0STfPw==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr13089760wmj.119.1614592381781; 
 Mon, 01 Mar 2021 01:53:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c9sm21770155wmb.33.2021.03.01.01.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 01:53:00 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/etnaviv: Use FOLL_FORCE for userptr
Date: Mon,  1 Mar 2021 10:52:53 +0100
Message-Id: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 etnaviv@lists.freedesktop.org, stable@vger.kernel.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Nothing checks userptr.ro except this call to pup_fast, which means
there's nothing actually preventing userspace from writing to this.
Which means you can just read-only mmap any file you want, userptr it
and then write to it with the gpu. Not good.

The right way to handle this is FOLL_WRITE | FOLL_FORCE, which will
break any COW mappings and update tracking for MAY_WRITE mappings so
there's no exploit and the vm isn't confused about what's going on.
For any legit use case there's no difference from what userspace can
observe and do.

Cc: stable@vger.kernel.org
Cc: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 6d38c5c17f23..a9e696d05b33 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -689,7 +689,7 @@ static int etnaviv_gem_userptr_get_pages(struct etnaviv_gem_object *etnaviv_obj)
 		struct page **pages = pvec + pinned;
 
 		ret = pin_user_pages_fast(ptr, num_pages,
-					  !userptr->ro ? FOLL_WRITE : 0, pages);
+					  FOLL_WRITE | FOLL_FORCE, pages);
 		if (ret < 0) {
 			unpin_user_pages(pvec, pinned);
 			kvfree(pvec);
-- 
2.30.0

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
