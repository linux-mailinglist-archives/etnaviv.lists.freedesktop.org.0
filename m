Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E609327B37
	for <lists+etnaviv@lfdr.de>; Mon,  1 Mar 2021 10:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFE26E563;
	Mon,  1 Mar 2021 09:53:05 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54756E550
 for <etnaviv@lists.freedesktop.org>; Mon,  1 Mar 2021 09:53:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id k66so13825176wmf.1
 for <etnaviv@lists.freedesktop.org>; Mon, 01 Mar 2021 01:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EeI5BVtXyBefOOJ/+aIoV3DIZyRdktgzKXSwldp6gq0=;
 b=QXspYk7DS04z5eUBW9cQsUAIwrzMNOLHNcC+SckHflj62WDbMbFuafwPwdu5J8j8ek
 B6/2FbH0e6z/iVAwNipbgWFZzKFk2iHwHyoTvAjrY/X10dQTQAwMX4L9Iis/6LeGCXGx
 xN4KyoCcDQoyJcsvinRXAow9txmNXBA86E+1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EeI5BVtXyBefOOJ/+aIoV3DIZyRdktgzKXSwldp6gq0=;
 b=PBf0+yTh/4q4pvT47/Iova3inYpBSnk+SGZJawC4quEDGbbaLCLX0xwM8+doEnYfUg
 DAWfpPfioFZ699vTfbaWzs4Gfm0duAy6n6h8BPyYTvfkpRdUydOWByHcwTzx1OuI2BAP
 AZhL57wi7hKDSI2uHG33ifmUHPUOOxBG/wLOjPKClG6k9EpvLurEttko5UK5/g4EaFPa
 JDxSFDQQk9+wDSycP3/4kULhnCgauR2V5vRelGBLdrRf+ekcH5naMlyWvB1ZVMLHdOYa
 2HAmpqXxLEcMqDO7cWAG9u32m4uFoOntsidwZfi1NHtNWQLuxtUVnoUOnKucadAb8oyd
 HDrQ==
X-Gm-Message-State: AOAM532ZTNlexKlDgr9B9ennklz4jDLUb6yDmAk28vHsR5zf5+TRT0Wy
 G2pKfo+pg+RXCUJa7EkdZ2jZI9QyplCdMw==
X-Google-Smtp-Source: ABdhPJzAT/HGgrD0jcr9hGqgkHEqI6mRUy3x2si+8Fm43GhWylSKXhSbuAtccfHgZVQUYP86vSCPzw==
X-Received: by 2002:a05:600c:410e:: with SMTP id
 j14mr15446043wmi.36.1614592382589; 
 Mon, 01 Mar 2021 01:53:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c9sm21770155wmb.33.2021.03.01.01.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 01:53:02 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/etnaviv: User FOLL_LONGTERM in userptr
Date: Mon,  1 Mar 2021 10:52:54 +0100
Message-Id: <20210301095254.1946084-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
References: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
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
 etnaviv@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

There's no mmu notifier or anything like that, releasing this pin is
entirely up to userspace. Hence FOLL_LONGTERM.

No cc: stable for this patch since a lot of the infrastructure around
FOLL_LONGETRM (like not allowing it for pages currently sitting in
ZONE_MOVEABLE before they're migrated) is still being worked on. So
not big benefits yet.

Cc: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index a9e696d05b33..db69f19ab5bc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -689,7 +689,8 @@ static int etnaviv_gem_userptr_get_pages(struct etnaviv_gem_object *etnaviv_obj)
 		struct page **pages = pvec + pinned;
 
 		ret = pin_user_pages_fast(ptr, num_pages,
-					  FOLL_WRITE | FOLL_FORCE, pages);
+					  FOLL_WRITE | FOLL_FORCE | FOLL_LONGTERM,
+					  pages);
 		if (ret < 0) {
 			unpin_user_pages(pvec, pinned);
 			kvfree(pvec);
-- 
2.30.0

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
