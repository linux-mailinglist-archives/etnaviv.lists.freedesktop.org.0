Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ED861F8FE
	for <lists+etnaviv@lfdr.de>; Mon,  7 Nov 2022 17:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D8710E47B;
	Mon,  7 Nov 2022 16:19:41 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A2F10E48D
 for <etnaviv@lists.freedesktop.org>; Mon,  7 Nov 2022 16:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KLZRZjgmtcgxGnOVW1plINu4o5lxWeTUer368nax8co=;
 b=PCUE8W2xgBLofa1EdDiKE50kII5Z0GOFu54xT+x+RMsqJSWQgvMvJTfNH0KGiaWCISDzKN
 kggDWw896rYkfHX1BDZewRJx29MQtsdvYQdwE75mzxmxIhO9v2LjUFE4vbDAqV/kXm8oqa
 Mrmm4I915BlmRQTDkLDGGx0oOgCqyfw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-w-Z1rkmbPauCSeJRfGLJ5g-1; Mon, 07 Nov 2022 11:19:27 -0500
X-MC-Unique: w-Z1rkmbPauCSeJRfGLJ5g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E10DC3C0F7E8;
 Mon,  7 Nov 2022 16:19:25 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DDE94B3FCF;
 Mon,  7 Nov 2022 16:19:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 15/19] media: pci/ivtv: remove FOLL_FORCE usage
Date: Mon,  7 Nov 2022 17:17:36 +0100
Message-Id: <20221107161740.144456-16-david@redhat.com>
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
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 etnaviv@lists.freedesktop.org, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Andy Walls <awalls@md.metrocast.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

FOLL_FORCE is really only for debugger access. R/O pinning a page is
supposed to fail if the VMA misses proper access permissions (no VM_READ).

Let's just remove FOLL_FORCE usage here; there would have to be a pretty
good reason to allow arbitrary drivers to R/O pin pages in a PROT_NONE
VMA. Most probably, FOLL_FORCE usage is just some legacy leftover.

Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/media/pci/ivtv/ivtv-udma.c | 2 +-
 drivers/media/pci/ivtv/ivtv-yuv.c  | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-udma.c b/drivers/media/pci/ivtv/ivtv-udma.c
index 210be8290f24..99b9f55ca829 100644
--- a/drivers/media/pci/ivtv/ivtv-udma.c
+++ b/drivers/media/pci/ivtv/ivtv-udma.c
@@ -115,7 +115,7 @@ int ivtv_udma_setup(struct ivtv *itv, unsigned long ivtv_dest_addr,
 
 	/* Pin user pages for DMA Xfer */
 	err = pin_user_pages_unlocked(user_dma.uaddr, user_dma.page_count,
-			dma->map, FOLL_FORCE);
+			dma->map, 0);
 
 	if (user_dma.page_count != err) {
 		IVTV_DEBUG_WARN("failed to map user pages, returned %d instead of %d\n",
diff --git a/drivers/media/pci/ivtv/ivtv-yuv.c b/drivers/media/pci/ivtv/ivtv-yuv.c
index 4ba10c34a16a..582146f8d70d 100644
--- a/drivers/media/pci/ivtv/ivtv-yuv.c
+++ b/drivers/media/pci/ivtv/ivtv-yuv.c
@@ -63,12 +63,11 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, struct ivtv_user_dma *dma,
 
 	/* Pin user pages for DMA Xfer */
 	y_pages = pin_user_pages_unlocked(y_dma.uaddr,
-			y_dma.page_count, &dma->map[0], FOLL_FORCE);
+			y_dma.page_count, &dma->map[0], 0);
 	uv_pages = 0; /* silence gcc. value is set and consumed only if: */
 	if (y_pages == y_dma.page_count) {
 		uv_pages = pin_user_pages_unlocked(uv_dma.uaddr,
-				uv_dma.page_count, &dma->map[y_pages],
-				FOLL_FORCE);
+				uv_dma.page_count, &dma->map[y_pages], 0);
 	}
 
 	if (y_pages != y_dma.page_count || uv_pages != uv_dma.page_count) {
-- 
2.38.1

