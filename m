Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB37B61F8DF
	for <lists+etnaviv@lfdr.de>; Mon,  7 Nov 2022 17:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCFB10E46D;
	Mon,  7 Nov 2022 16:18:48 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D11E10E46C
 for <etnaviv@lists.freedesktop.org>; Mon,  7 Nov 2022 16:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBnIIqhyhD6iyBujMvwC62HNjvRYMc/Z3DOfUddgdGg=;
 b=OA8GF7a3N147aCsY+7FG/wvWm9eElT7WAGBMZsogUhwXZyvKxNHwxgvIsqfVuqgkp81XS6
 awB8QL2wnm26pgoX4N/OrWgGhgRtJ+YB2eckXj2K5fOUj1KTyPGaOY9LLClRbhYSfq5zZC
 Mc89S8ucJeOZtyKXKkCogmW3iGffoQY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-grZU38baPf-7EYRvd2zYkw-1; Mon, 07 Nov 2022 11:18:37 -0500
X-MC-Unique: grZU38baPf-7EYRvd2zYkw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 776FE3C0E462;
 Mon,  7 Nov 2022 16:18:34 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF99B4B3FC6;
 Mon,  7 Nov 2022 16:18:28 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 08/19] mm: extend FAULT_FLAG_UNSHARE support to anything
 in a COW mapping
Date: Mon,  7 Nov 2022 17:17:29 +0100
Message-Id: <20221107161740.144456-9-david@redhat.com>
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
 Muchun Song <songmuchun@bytedance.com>, Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Extend FAULT_FLAG_UNSHARE to break COW on anything mapped into a
COW (i.e., private writable) mapping and adjust the documentation
accordingly.

FAULT_FLAG_UNSHARE will now also break COW when encountering the shared
zeropage, a pagecache page, a PFNMAP, ... inside a COW mapping, by
properly replacing the mapped page/pfn by a private copy (an exclusive
anonymous page).

Note that only do_wp_page() needs care: hugetlb_wp() already handles
FAULT_FLAG_UNSHARE correctly. wp_huge_pmd()/wp_huge_pud() also handles it
correctly, for example, splitting the huge zeropage on FAULT_FLAG_UNSHARE
such that we can handle FAULT_FLAG_UNSHARE on the PTE level.

This change is a requirement for reliable long-term R/O pinning in
COW mappings.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm_types.h | 8 ++++----
 mm/memory.c              | 4 ----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 834022721bc6..3f9fa01a3e24 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -965,9 +965,9 @@ typedef struct {
  * @FAULT_FLAG_REMOTE: The fault is not for current task/mm.
  * @FAULT_FLAG_INSTRUCTION: The fault was during an instruction fetch.
  * @FAULT_FLAG_INTERRUPTIBLE: The fault can be interrupted by non-fatal signals.
- * @FAULT_FLAG_UNSHARE: The fault is an unsharing request to unshare (and mark
- *                      exclusive) a possibly shared anonymous page that is
- *                      mapped R/O.
+ * @FAULT_FLAG_UNSHARE: The fault is an unsharing request to break COW in a
+ *                      COW mapping, making sure that an exclusive anon page is
+ *                      mapped after the fault.
  * @FAULT_FLAG_ORIG_PTE_VALID: whether the fault has vmf->orig_pte cached.
  *                        We should only access orig_pte if this flag set.
  *
@@ -992,7 +992,7 @@ typedef struct {
  *
  * The combination FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE is illegal.
  * FAULT_FLAG_UNSHARE is ignored and treated like an ordinary read fault when
- * no existing R/O-mapped anonymous page is encountered.
+ * applied to mappings that are not COW mappings.
  */
 enum fault_flag {
 	FAULT_FLAG_WRITE =		1 << 0,
diff --git a/mm/memory.c b/mm/memory.c
index d2f9673755be..73ed83def548 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3431,10 +3431,6 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 		}
 		wp_page_reuse(vmf);
 		return 0;
-	} else if (unshare) {
-		/* No anonymous page -> nothing to do. */
-		pte_unmap_unlock(vmf->pte, vmf->ptl);
-		return 0;
 	}
 copy:
 	/*
-- 
2.38.1

