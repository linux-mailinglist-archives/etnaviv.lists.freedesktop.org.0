Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB50473F6BA
	for <lists+etnaviv@lfdr.de>; Tue, 27 Jun 2023 10:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA4E10E2A7;
	Tue, 27 Jun 2023 08:17:11 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from out-7.mta0.migadu.com (out-7.mta0.migadu.com [91.218.175.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F2610E639
 for <etnaviv@lists.freedesktop.org>; Fri, 23 Jun 2023 10:17:06 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1687514915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HapoD/NYZ/OiH+lAomI9HpFCENnwDqcm4Zh/feZWP3Y=;
 b=hpR0WYsUXhqCELG7hJcoQpTmNanUXJvDl9+HBv27lzRFj5gYV/9ygVqGeGk2PYpyMI17Sb
 mu578hE5Urf/rjylw/BPFNt5mI7W9DSpQJwPQtHToFYGInI6Bl3TUnROlqqkBGJMMimOBn
 ncKbpVf952YfeWYqicPaDunD0BrsbHo=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 3/8] drm/etnaviv: Drop the second argument of the
 etnaviv_gem_new_impl()
Date: Fri, 23 Jun 2023 18:08:17 +0800
Message-Id: <20230623100822.274706-4-sui.jingfeng@linux.dev>
In-Reply-To: <20230623100822.274706-1-sui.jingfeng@linux.dev>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 27 Jun 2023 08:17:10 +0000
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
Cc: loongson-kernel@lists.loongnix.cn, Sui Jingfeng <suijingfeng@loongson.cn>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Because it is not used by the etnaviv_gem_new_impl() function,
no functional change.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b5f73502e3dd..be2f459c66b5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -542,7 +542,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
 	.vm_ops = &vm_ops,
 };
 
-static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
+static int etnaviv_gem_new_impl(struct drm_device *dev, u32 flags,
 	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
 {
 	struct etnaviv_gem_object *etnaviv_obj;
@@ -591,8 +591,7 @@ int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 
 	size = PAGE_ALIGN(size);
 
-	ret = etnaviv_gem_new_impl(dev, size, flags,
-				   &etnaviv_gem_shmem_ops, &obj);
+	ret = etnaviv_gem_new_impl(dev, flags, &etnaviv_gem_shmem_ops, &obj);
 	if (ret)
 		goto fail;
 
@@ -627,7 +626,7 @@ int etnaviv_gem_new_private(struct drm_device *dev, size_t size, u32 flags,
 	struct drm_gem_object *obj;
 	int ret;
 
-	ret = etnaviv_gem_new_impl(dev, size, flags, ops, &obj);
+	ret = etnaviv_gem_new_impl(dev, flags, ops, &obj);
 	if (ret)
 		return ret;
 
-- 
2.25.1

