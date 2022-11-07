Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C048E61F904
	for <lists+etnaviv@lfdr.de>; Mon,  7 Nov 2022 17:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C8C10E48A;
	Mon,  7 Nov 2022 16:19:54 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D5E10E481
 for <etnaviv@lists.freedesktop.org>; Mon,  7 Nov 2022 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3EQBQS9ueNhIRYtlLuS9A1vlgsPqX0+ffQJOXP9CF0=;
 b=Q0/RzqGVjIIN2R52v/IWV2VDMXPLu4YbxjsaHpmXWbGe8jqS7l/xOl7xjHMhSSChJfdEMA
 pMcGjn1W9kdbFD7c+rsBpbspqNP2BYb9lQSgd46/749D9v9Ggf1C43uc9ATrdM+wJY5xCz
 Lj3qrUuHMK3lD3gDGS3/2zRbXcdsP4w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-zow3dLr8Oq6fkd6eMjvZxg-1; Mon, 07 Nov 2022 11:19:39 -0500
X-MC-Unique: zow3dLr8Oq6fkd6eMjvZxg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A468C185A79C;
 Mon,  7 Nov 2022 16:19:37 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 236834B3FC6;
 Mon,  7 Nov 2022 16:19:32 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 17/19] drm/exynos: remove FOLL_FORCE usage
Date: Mon,  7 Nov 2022 17:17:38 +0100
Message-Id: <20221107161740.144456-18-david@redhat.com>
In-Reply-To: <20221107161740.144456-1-david@redhat.com>
References: <20221107161740.144456-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 linux-rdma@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 etnaviv@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>,
 Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

FOLL_FORCE is really only for debugger access. As we unpin the pinned pages
using unpin_user_pages_dirty_lock(true), the assumption is that all these
pages are writable.

FOLL_FORCE in this case seems to be a legacy leftover. Let's just remove
it.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 471fd6c8135f..e19c2ceb3759 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -477,7 +477,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 	}
 
 	ret = pin_user_pages_fast(start, npages,
-				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
+				  FOLL_WRITE | FOLL_LONGTERM,
 				  g2d_userptr->pages);
 	if (ret != npages) {
 		DRM_DEV_ERROR(g2d->dev,
-- 
2.38.1

