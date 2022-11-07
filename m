Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F407F61F8DD
	for <lists+etnaviv@lfdr.de>; Mon,  7 Nov 2022 17:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C1810E440;
	Mon,  7 Nov 2022 16:18:41 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F9110E46A
 for <etnaviv@lists.freedesktop.org>; Mon,  7 Nov 2022 16:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYDRz25IYQjafttz7S2rblYgKrpIBuhep8CtEmNwApc=;
 b=a2ZjOPnCIlW6BIgaqnFFrpy1YkY2u6YPFMf+eLl4AJbRD4eLlW/pmdZS7RxG4gbsIK4t4O
 Mhuworq5QKB0H6YuRjOLU3jT+uX6WltbAXT5995sIGiEXDPGd1RhqPR7So0ZyhQgtdaEfG
 /DXaoE0OnCMSBdxaqHX9sZKmKVeRyac=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-gL9TAPUqOVKRnMGmjKJ-GQ-1; Mon, 07 Nov 2022 11:18:29 -0500
X-MC-Unique: gL9TAPUqOVKRnMGmjKJ-GQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F1913811F3B;
 Mon,  7 Nov 2022 16:18:28 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 666144B3FC6;
 Mon,  7 Nov 2022 16:18:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 07/19] mm: don't call vm_ops->huge_fault() in
 wp_huge_pmd()/wp_huge_pud() for private mappings
Date: Mon,  7 Nov 2022 17:17:28 +0100
Message-Id: <20221107161740.144456-8-david@redhat.com>
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

If we already have a PMD/PUD mapped write-protected in a private mapping
and we want to break COW either due to FAULT_FLAG_WRITE or
FAULT_FLAG_UNSHARE, there is no need to inform the file system just like on
the PTE path.

Let's just split (->zap) + fallback in that case.

This is a preparation for more generic FAULT_FLAG_UNSHARE support in
COW mappings.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 41e4c697033a..d2f9673755be 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4791,6 +4791,7 @@ static inline vm_fault_t create_huge_pmd(struct vm_fault *vmf)
 static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
 {
 	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
+	vm_fault_t ret;
 
 	if (vma_is_anonymous(vmf->vma)) {
 		if (likely(!unshare) &&
@@ -4798,11 +4799,13 @@ static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
 			return handle_userfault(vmf, VM_UFFD_WP);
 		return do_huge_pmd_wp_page(vmf);
 	}
-	if (vmf->vma->vm_ops->huge_fault) {
-		vm_fault_t ret = vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PMD);
 
-		if (!(ret & VM_FAULT_FALLBACK))
-			return ret;
+	if (vmf->vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) {
+		if (vmf->vma->vm_ops->huge_fault) {
+			ret = vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PMD);
+			if (!(ret & VM_FAULT_FALLBACK))
+				return ret;
+		}
 	}
 
 	/* COW or write-notify handled on pte level: split pmd. */
@@ -4828,14 +4831,17 @@ static vm_fault_t wp_huge_pud(struct vm_fault *vmf, pud_t orig_pud)
 {
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) &&			\
 	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
+	vm_fault_t ret;
+
 	/* No support for anonymous transparent PUD pages yet */
 	if (vma_is_anonymous(vmf->vma))
 		goto split;
-	if (vmf->vma->vm_ops->huge_fault) {
-		vm_fault_t ret = vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PUD);
-
-		if (!(ret & VM_FAULT_FALLBACK))
-			return ret;
+	if (vmf->vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) {
+		if (vmf->vma->vm_ops->huge_fault) {
+			ret = vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PUD);
+			if (!(ret & VM_FAULT_FALLBACK))
+				return ret;
+		}
 	}
 split:
 	/* COW or write-notify not handled on PUD level: split pud.*/
-- 
2.38.1

