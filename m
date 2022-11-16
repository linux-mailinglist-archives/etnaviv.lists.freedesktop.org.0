Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BFE62B85A
	for <lists+etnaviv@lfdr.de>; Wed, 16 Nov 2022 11:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79A310E486;
	Wed, 16 Nov 2022 10:30:05 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B726710E480
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Nov 2022 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668594587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vwm/knGeRKTOygKvA/Obl+ChXNhkjAzB2LSFVD/DetE=;
 b=LjiHv8xCyA2Wlwt1ZSXOYcMq1jumYWpyiy06+YTXqEt8njzY2Tc4By+nPv7U81Jmcc9zQ2
 bzIUDY0EId+pWECWd1rE1iBbYs5F2hnyk+3/R0u24hEGpSt143qQ5iEcMt94gpzkOrGjr8
 0JQ9qX9jKlOt6CoFlJU2eNsYDlhrtyc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-brbllGSGP4mJ4Nc_w7a0rA-1; Wed, 16 Nov 2022 05:29:41 -0500
X-MC-Unique: brbllGSGP4mJ4Nc_w7a0rA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 714823C0E216;
 Wed, 16 Nov 2022 10:29:40 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A8D52028E8F;
 Wed, 16 Nov 2022 10:29:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 18/20] RDMA/hw/qib/qib_user_pages: remove
 FOLL_FORCE usage
Date: Wed, 16 Nov 2022 11:26:57 +0100
Message-Id: <20221116102659.70287-19-david@redhat.com>
In-Reply-To: <20221116102659.70287-1-david@redhat.com>
References: <20221116102659.70287-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-samsung-soc@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>,
 linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

FOLL_FORCE is really only for ptrace access. As we unpin the pinned pages
using unpin_user_pages_dirty_lock(true), the assumption is that all these
pages are writable.

FOLL_FORCE in this case seems to be a legacy leftover. Let's just remove
it.

Cc: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/infiniband/hw/qib/qib_user_pages.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/qib/qib_user_pages.c b/drivers/infiniband/hw/qib/qib_user_pages.c
index f4b5f05058e4..f693bc753b6b 100644
--- a/drivers/infiniband/hw/qib/qib_user_pages.c
+++ b/drivers/infiniband/hw/qib/qib_user_pages.c
@@ -110,7 +110,7 @@ int qib_get_user_pages(unsigned long start_page, size_t num_pages,
 	for (got = 0; got < num_pages; got += ret) {
 		ret = pin_user_pages(start_page + got * PAGE_SIZE,
 				     num_pages - got,
-				     FOLL_LONGTERM | FOLL_WRITE | FOLL_FORCE,
+				     FOLL_LONGTERM | FOLL_WRITE,
 				     p + got, NULL);
 		if (ret < 0) {
 			mmap_read_unlock(current->mm);
-- 
2.38.1

