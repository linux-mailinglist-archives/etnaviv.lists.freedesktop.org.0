Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D281E95E45F
	for <lists+etnaviv@lfdr.de>; Sun, 25 Aug 2024 18:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0ED10E057;
	Sun, 25 Aug 2024 16:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="CER7Z9cw";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 511 seconds by postgrey-1.36 at gabe;
 Sun, 25 Aug 2024 16:32:00 UTC
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE0410E057
 for <etnaviv@lists.freedesktop.org>; Sun, 25 Aug 2024 16:31:59 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1724603007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=okOLfjQVl4D8wTvlHZg+l7qNyNYtvSQnrJ226EM9Ivw=;
 b=CER7Z9cwG8vuqhW8bXU0fXKMBXslT0I23xEa2vfA1m4BwPlqeOCmMF7V0cNUuY9zswotoz
 SWoGcCYCZCx8etzk0WnHZ/PfOWb+bfguESF9xO3h3iBiIfDCeTx+eJzxlGsgH32JqAX+6a
 +3+e5vkQ5OCIsxmAeugqUYCRs5+bdds=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/etnaviv: Use unsigned type to count the number of pages
Date: Mon, 26 Aug 2024 00:23:00 +0800
Message-Id: <20240825162300.417306-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

The drm_prime_pages_to_sg() function takes unsigned int argument to store
length of the page vector, and the type of struct drm_gem_object::size is
a size_t. The size of the object in CPU pages can not be negative, hence,
use unsigned variable to store the number of pages, instead of the signed
type.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 3524b5811682..6b98200068e4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -17,7 +17,7 @@ static struct lock_class_key etnaviv_prime_lock_class;
 struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
-	int npages = obj->size >> PAGE_SHIFT;
+	unsigned int npages = obj->size >> PAGE_SHIFT;
 
 	if (WARN_ON(!etnaviv_obj->pages))  /* should have already pinned! */
 		return ERR_PTR(-EINVAL);
-- 
2.34.1

