Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984041DAFBB
	for <lists+etnaviv@lfdr.de>; Wed, 20 May 2020 12:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F936E5CF;
	Wed, 20 May 2020 10:11:45 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lf1-x161.google.com (mail-lf1-x161.google.com
 [IPv6:2a00:1450:4864:20::161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDE16E5CF
 for <etnaviv@lists.freedesktop.org>; Wed, 20 May 2020 10:11:43 +0000 (UTC)
Received: by mail-lf1-x161.google.com with SMTP id z22so1986070lfd.0
 for <etnaviv@lists.freedesktop.org>; Wed, 20 May 2020 03:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flowbird.group; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=yp51Q0sOB5VzCHGDErAd468gZKoo7fbqGFyeoX1zhRY=;
 b=ThEl8Oxvvu2EpOgExjI1uw9IJaWrOTyN6TeoIOAx66gl8ZXbMJfUAKKMeLsAnRwDKe
 9+61cEz99V0JnrapuBITGj08OB2JjzLIQmmHGMvzul/KNjYnomamrTG45VavwijuJAaX
 fnTCW+XQdTt7EzgQQitb7oA966p5UrUDMKCFjcOHlPn8zuejMQ/l6Oko6ApauFyyJKyD
 /OnfLeowMAHn9WlDNpsbv/K4GwI8Tk0t9MfetoG5KNcPHHJtLbIG4GKXqS/5gjBOQe/H
 YDmm+DvGX+3VBGHnrFJdhzqGZFyOX/d4IeO70/MdrJtL6P//p4z6i7yuesLlLI8yoZsV
 D1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yp51Q0sOB5VzCHGDErAd468gZKoo7fbqGFyeoX1zhRY=;
 b=XcekDih0a5rjtBCBAjCAN+shKg4ijuZJ1iC009BvBWVnjdeaLfGQIU619x/JzdIXca
 k5yXYNf9aiIN0//jVDj563d8UeCJr7kPFIXtrBXk+bO+SAWq12n7ip+b3e0nmVymnc5v
 5NJj4a7q/5UgquRT6RnrdpES6HtnwD//6/5j2vTiATe7sPuR4jRJQY6Xn3DdrzVhMqS4
 5mGTL8TkdPnp7rABb9jbxBDnrYuQ2tZKbuLO8OUJrsXqN6sGzdbryAfO0D+uT2HZqz2Q
 YkWRKkw0EiDbUsULtvNw2YgfkNon79uGnJYN4xpFIQJQxyhJYiIy7Iu7C7nrZhxFpsXV
 PsGQ==
X-Gm-Message-State: AOAM5334YNORTgykQH5GNXoAcjFnmzk+JUFX06bbE+/WQD75uk7RjsXZ
 x+IpSc0u7zEpgQkcb+5Q1+eFgslZr4B5AijKGDdy5gupMfhY
X-Google-Smtp-Source: ABdhPJy2NKKbUt6o8dwz2I3/kDRRKV+s2TFbEoOUyNC+W7l4M+gSyIhS7fKhPsOMazs4jPjQDBaXZWKDlgm3
X-Received: by 2002:a19:3855:: with SMTP id d21mr2248332lfj.156.1589969501504; 
 Wed, 20 May 2020 03:11:41 -0700 (PDT)
Received: from mail.besancon.parkeon.com ([185.149.63.251])
 by smtp-relay.gmail.com with ESMTPS id a25sm12902lfl.26.2020.05.20.03.11.41
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 20 May 2020 03:11:41 -0700 (PDT)
X-Relaying-Domain: flowbird.group
Received: from [172.16.13.226] (port=44934
 helo=PC12445-BES.dynamic.besancon.parkeon.com)
 by mail.besancon.parkeon.com with esmtp (Exim 4.71)
 (envelope-from <martin.fuzzey@flowbird.group>)
 id 1jbLhM-0001dH-QH; Wed, 20 May 2020 12:11:40 +0200
From: Martin Fuzzey <martin.fuzzey@flowbird.group>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH] drm/etnaviv: fix memory leak when mapping prime imported
 buffers
Date: Wed, 20 May 2020 12:10:02 +0200
Message-Id: <1589969500-6554-1-git-send-email-martin.fuzzey@flowbird.group>
X-Mailer: git-send-email 1.9.1
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

When using mmap() on a prime imported buffer allocated by a
different driver (such as imx-drm) the later munmap() does
not correctly decrement the refcount of the original enaviv_gem_object,
leading to a leak.

Signed-off-by: Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index f24dd21..28a01b8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -93,7 +93,25 @@ static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *etnaviv_obj)
 static int etnaviv_gem_prime_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 		struct vm_area_struct *vma)
 {
-	return dma_buf_mmap(etnaviv_obj->base.dma_buf, vma, 0);
+	int ret;
+
+	ret = dma_buf_mmap(etnaviv_obj->base.dma_buf, vma, 0);
+
+	/* drm_gem_mmap_obj() has already been called before this function
+	 * and has incremented our refcount, expecting it to be decremented
+	 * on unmap() via drm_gem_vm_close().
+	 * However dma_buf_mmap() invokes drm_gem_cma_prime_mmap()
+	 * that ends up updating the vma->vma_private_data to point to the
+	 * dma_buf's gem object.
+	 * Hence our gem object here will not have its refcount decremented
+	 * when userspace does unmap().
+	 * So decrement the refcount here to avoid a memory leak if the dma
+	 * buf mapping was successful.
+	 */
+	if (!ret)
+		drm_gem_object_put_unlocked(&etnaviv_obj->base);
+
+	return ret;
 }
 
 static const struct etnaviv_gem_ops etnaviv_gem_prime_ops = {
-- 
1.9.1

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
