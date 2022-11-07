Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780BF61F8D9
	for <lists+etnaviv@lfdr.de>; Mon,  7 Nov 2022 17:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1902610E465;
	Mon,  7 Nov 2022 16:18:31 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5B610E456
 for <etnaviv@lists.freedesktop.org>; Mon,  7 Nov 2022 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+oJWZfKWoSUzQaG7FZQskadqtB6uOuGd99hd1wAZnI=;
 b=VTOxXrIDKp/AkEkQk9IaEhO0xKRQalBL/GWBqNADMXgSbKXzT14Hs1Eizr+nVhEuBtWYOt
 RPMBNdfWCZUjxSBCRtt3mJDehY8Fqm3XpktaVTGFnUvMWm6XgtGxQj/qKhwpxlsBoFSN7D
 ejp0dV76wLKogIW2aa0sVDcyE9d2VFA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-yxYkz-LWMkeOtOv1hyz8Xg-1; Mon, 07 Nov 2022 11:18:18 -0500
X-MC-Unique: yxYkz-LWMkeOtOv1hyz8Xg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E88B806001;
 Mon,  7 Nov 2022 16:18:17 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DB084B3FC6;
 Mon,  7 Nov 2022 16:18:12 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 05/19] mm: add early FAULT_FLAG_WRITE consistency checks
Date: Mon,  7 Nov 2022 17:17:26 +0100
Message-Id: <20221107161740.144456-6-david@redhat.com>
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

Let's catch abuse of FAULT_FLAG_WRITE early, such that we don't have to
care in all other handlers and might get "surprises" if we forget to do
so.

Write faults without VM_MAYWRITE don't make any sense, and our
maybe_mkwrite() logic could have hidden such abuse for now.

Write faults without VM_WRITE on something that is not a COW mapping is
similarly broken, and e.g., do_wp_page() could end up placing an
anonymous page into a shared mapping, which would be bad.

This is a preparation for reliable R/O long-term pinning of pages in
private mappings, whereby we want to make sure that we will never break
COW in a read-only private mapping.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index fe131273217a..826353da7b23 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5159,6 +5159,14 @@ static vm_fault_t sanitize_fault_flags(struct vm_area_struct *vma,
 		 */
 		if (!is_cow_mapping(vma->vm_flags))
 			*flags &= ~FAULT_FLAG_UNSHARE;
+	} else if (*flags & FAULT_FLAG_WRITE) {
+		/* Write faults on read-only mappings are impossible ... */
+		if (WARN_ON_ONCE(!(vma->vm_flags & VM_MAYWRITE)))
+			return VM_FAULT_SIGSEGV;
+		/* ... and FOLL_FORCE only applies to COW mappings. */
+		if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE) &&
+				 !is_cow_mapping(vma->vm_flags)))
+			return VM_FAULT_SIGSEGV;
 	}
 	return 0;
 }
-- 
2.38.1

