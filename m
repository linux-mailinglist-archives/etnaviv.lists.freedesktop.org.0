Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nXhgKTShQ2psdwoAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:56 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8CA6E33F2
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KaK+dupM;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F014E10EC80;
	Tue, 30 Jun 2026 10:57:51 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D5C10E86B;
 Mon, 29 Jun 2026 12:24:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0876960129;
 Mon, 29 Jun 2026 12:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E561F00A3A;
 Mon, 29 Jun 2026 12:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782735859;
 bh=0Q3vLqjSYWlwbLr3BVqIm4FOIf2vBl23E5yOjtR2bew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KaK+dupM7oS93ledZ/C/RT8b2PW1/pHfg8os68FjDDwaRKx+7ux4VE9UL772nsNJ5
 Y/2pjy6vv0wlpt6Z9Lv0lX2GqgSeWfBw0ogSB8VtInNDLX94yy8vDA9fYK9c2r5iGC
 bjrKmZigcydrTstqVrfshhJo23T0/1I1ayW9WcT3ZnmhGUTrwmnib525MMWIr+MMEs
 BQr9rptChxdp3VltKNK8jgy545Gh4UVrmxLXeh6BwyFDJ9N3gwq9hzJU5UhHDyKuvS
 FRiGGKQ9Q4Y2QU/XFHuxECcd88Vcy3QZNCUejotqyoSBdMQuRHt8uXJabhBRAInnBr
 58B09cQQmpStw==
From: Lorenzo Stoakes <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>,
 Simon Schuster <schuster.simon@siemens-energy.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Ankit Agrawal <ankita@nvidia.com>, Alex Williamson <alex@shazbot.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Dan Williams <djbw@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "Liam R . Howlett" <liam@infradead.org>,
 Matthew Wilcox <willy@infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 SeongJae Park <sj@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>,
 Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>,
 Kees Cook <kees@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-sgx@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kvm@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org,
 iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 damon@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
 Jann Horn <jannh@google.com>
Subject: [PATCH 08/30] mm/rmap: rename vma_interval_tree_*() to
 mapping_interval_tree_*()
Date: Mon, 29 Jun 2026 13:23:19 +0100
Message-ID: <f95462457025370efd047b9dfb039e76bbddf58b.1782735110.git.ljs@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782735110.git.ljs@kernel.org>
References: <cover.1782735110.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Jun 2026 10:57:47 +0000
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[armlinux.org.uk,kernel.org,siemens-energy.com,HansenPartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C8CA6E33F2

The family of vma_interval_tree_() functions manipulate the
address_space (which, of course, is generally referred to as 'mapping')
reverse mapping, but are named the 'VMA' interval tree.

VMAs may be mapped by an anon_vma, an address_space, or both. Therefore
calling the mapping interval tree a 'VMA' interval tree is rather
confusing.

This is also inconsistent with the anon_vma_interval_tree_*() functions
which explicitly reference the rmap object to which they pertain.

Rename the vma_interval_tree_*() functions to mapping_interval_tree_*() to
correct this.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 arch/arm/mm/fault-armv.c          |  2 +-
 arch/arm/mm/flush.c               |  2 +-
 arch/nios2/mm/cacheflush.c        |  2 +-
 arch/parisc/kernel/cache.c        |  2 +-
 fs/dax.c                          |  2 +-
 fs/hugetlbfs/inode.c              |  6 +++---
 include/linux/mm.h                | 34 +++++++++++++++----------------
 kernel/events/uprobes.c           |  2 +-
 mm/hugetlb.c                      |  4 ++--
 mm/interval_tree.c                | 22 ++++++++++----------
 mm/khugepaged.c                   |  4 ++--
 mm/memory-failure.c               |  6 +++---
 mm/memory.c                       |  2 +-
 mm/mmap.c                         |  2 +-
 mm/nommu.c                        |  8 ++++----
 mm/pagewalk.c                     |  4 ++--
 mm/rmap.c                         |  2 +-
 mm/vma.c                          | 12 +++++------
 tools/testing/vma/include/stubs.h |  8 ++++----
 19 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index cd52cf7f8874..bd1ad4181a53 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -140,7 +140,7 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
 	 * cache coherency.
 	 */
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_foreach(mpnt, mapping, pgoff, pgoff) {
+	mapping_interval_tree_foreach(mpnt, mapping, pgoff, pgoff) {
 		/*
 		 * If we are using split PTE locks, then we need to take the pte
 		 * lock. Otherwise we are using shared mm->page_table_lock which
diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
index 8c593e9898ee..153132eaa120 100644
--- a/arch/arm/mm/flush.c
+++ b/arch/arm/mm/flush.c
@@ -251,7 +251,7 @@ static void __flush_dcache_aliases(struct address_space *mapping, struct folio *
 	pgoff_end = pgoff + folio_nr_pages(folio) - 1;
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff_end) {
+	mapping_interval_tree_foreach(vma, mapping, pgoff, pgoff_end) {
 		unsigned long start, offset, pfn;
 		unsigned int nr;
 
diff --git a/arch/nios2/mm/cacheflush.c b/arch/nios2/mm/cacheflush.c
index 42e3bf892316..f73406365e8b 100644
--- a/arch/nios2/mm/cacheflush.c
+++ b/arch/nios2/mm/cacheflush.c
@@ -82,7 +82,7 @@ static void flush_aliases(struct address_space *mapping, struct folio *folio)
 	pgoff = folio->index;
 
 	flush_dcache_mmap_lock_irqsave(mapping, flags);
-	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
+	mapping_interval_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
 		unsigned long start;
 
 		if (vma->vm_mm != mm)
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index f28aa7884cbf..3c25adc2379e 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -503,7 +503,7 @@ void flush_dcache_folio(struct folio *folio)
 	 * on machines that support equivalent aliasing
 	 */
 	flush_dcache_mmap_lock_irqsave(mapping, flags);
-	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
+	mapping_interval_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
 		unsigned long offset = pgoff - vma->vm_pgoff;
 		unsigned long pfn = folio_pfn(folio);
 
diff --git a/fs/dax.c b/fs/dax.c
index 2f0818a68a7f..91943fb43c92 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1201,7 +1201,7 @@ static int dax_writeback_one(struct xa_state *xas, struct dax_device *dax_dev,
 
 	/* Walk all mappings of a given index of a file and writeprotect them */
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, mapping, index, end) {
+	mapping_interval_tree_foreach(vma, mapping, index, end) {
 		pfn_mkclean_range(pfn, count, index, vma);
 		cond_resched();
 	}
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 4ea1798f1ffb..894d02e73302 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -393,7 +393,7 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 	i_mmap_lock_write(mapping);
 retry:
 	vma_lock = NULL;
-	vma_interval_tree_foreach(vma, mapping, start, end - 1) {
+	mapping_interval_tree_foreach(vma, mapping, start, end - 1) {
 		v_start = vma_offset_start(vma, start);
 		v_end = vma_offset_end(vma, end);
 
@@ -469,8 +469,8 @@ hugetlb_vmdelete_list(struct address_space *mapping, pgoff_t start,
 	 * unmapped.  Note, end is exclusive, whereas the interval tree takes
 	 * an inclusive "last".
 	 */
-	vma_interval_tree_foreach(vma, mapping, start,
-				  end ? end - 1 : ULONG_MAX) {
+	mapping_interval_tree_foreach(vma, mapping, start,
+				      end ? end - 1 : ULONG_MAX) {
 		unsigned long v_start;
 		unsigned long v_end;
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index bdba25491b0e..703e07ff7d12 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4061,25 +4061,25 @@ extern atomic_long_t mmap_pages_allocated;
 extern int nommu_shrink_inode_mappings(struct inode *, size_t, size_t);
 
 /* interval_tree.c */
-void vma_interval_tree_insert(struct vm_area_struct *vma,
-			      struct address_space *mapping);
-void vma_interval_tree_insert_after(struct vm_area_struct *vma,
-				    struct vm_area_struct *prev,
-				    struct address_space *mapping);
-void vma_interval_tree_remove(struct vm_area_struct *vma,
-			      struct address_space *mapping);
+void mapping_interval_tree_insert(struct vm_area_struct *vma,
+				  struct address_space *mapping);
+void mapping_interval_tree_insert_after(struct vm_area_struct *vma,
+					struct vm_area_struct *prev,
+					struct address_space *mapping);
+void mapping_interval_tree_remove(struct vm_area_struct *vma,
+				  struct address_space *mapping);
 struct vm_area_struct *
-vma_interval_tree_iter_first(struct address_space *mapping,
-			     pgoff_t pgoff_start, pgoff_t pgoff_last);
+mapping_interval_tree_iter_first(struct address_space *mapping,
+				 pgoff_t pgoff_start, pgoff_t pgoff_last);
 struct vm_area_struct *
-vma_interval_tree_iter_next(struct vm_area_struct *vma,
-			    pgoff_t pgoff_start, pgoff_t pgoff_last);
-
-#define vma_interval_tree_foreach(vma, mapping, pgoff_start, pgoff_last) \
-	for (vma = vma_interval_tree_iter_first(mapping, pgoff_start,	 \
-						pgoff_last);		 \
-	     vma; vma = vma_interval_tree_iter_next(vma, pgoff_start,	 \
-						    pgoff_last))
+mapping_interval_tree_iter_next(struct vm_area_struct *vma,
+				pgoff_t pgoff_start, pgoff_t pgoff_last);
+
+#define mapping_interval_tree_foreach(vma, mapping, pgoff_start, pgoff_last) \
+	for (vma = mapping_interval_tree_iter_first(mapping, pgoff_start,    \
+						    pgoff_last);	      \
+	     vma; vma = mapping_interval_tree_iter_next(vma, pgoff_start,    \
+							pgoff_last))
 
 void anon_vma_interval_tree_insert(struct anon_vma_chain *node,
 				   struct rb_root_cached *root);
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 50a96a4d812d..f23cebacbc6d 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1210,7 +1210,7 @@ build_map_info(struct address_space *mapping, loff_t offset, bool is_register)
 
  again:
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
+	mapping_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 		if (!valid_vma(vma, is_register))
 			continue;
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1e1fbf348c51..f45000149a78 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5382,7 +5382,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * __unmap_hugepage_range() is called as the lock is already held
 	 */
 	i_mmap_lock_write(mapping);
-	vma_interval_tree_foreach(iter_vma, mapping, pgoff, pgoff) {
+	mapping_interval_tree_foreach(iter_vma, mapping, pgoff, pgoff) {
 		/* Do not unmap the current VMA */
 		if (iter_vma == vma)
 			continue;
@@ -6864,7 +6864,7 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 	pte_t *pte;
 
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(svma, mapping, idx, idx) {
+	mapping_interval_tree_foreach(svma, mapping, idx, idx) {
 		if (svma == vma)
 			continue;
 
diff --git a/mm/interval_tree.c b/mm/interval_tree.c
index b387d39e0547..cbd3038e46a9 100644
--- a/mm/interval_tree.c
+++ b/mm/interval_tree.c
@@ -18,16 +18,16 @@ INTERVAL_TREE_DEFINE(struct vm_area_struct, shared.rb,
 		     vma_start_pgoff, vma_last_pgoff, static,
 		     __vma_interval_tree)
 
-void vma_interval_tree_insert(struct vm_area_struct *vma,
-			      struct address_space *mapping)
+void mapping_interval_tree_insert(struct vm_area_struct *vma,
+				  struct address_space *mapping)
 {
 	__vma_interval_tree_insert(vma, &mapping->i_mmap);
 }
 
 /* Insert vma immediately after prev in the interval tree */
-void vma_interval_tree_insert_after(struct vm_area_struct *vma,
-				    struct vm_area_struct *prev,
-				    struct address_space *mapping)
+void mapping_interval_tree_insert_after(struct vm_area_struct *vma,
+					struct vm_area_struct *prev,
+					struct address_space *mapping)
 {
 	struct rb_node **link;
 	struct vm_area_struct *parent;
@@ -58,23 +58,23 @@ void vma_interval_tree_insert_after(struct vm_area_struct *vma,
 			    &__vma_interval_tree_augment);
 }
 
-void vma_interval_tree_remove(struct vm_area_struct *vma,
-			      struct address_space *mapping)
+void mapping_interval_tree_remove(struct vm_area_struct *vma,
+				  struct address_space *mapping)
 {
 	__vma_interval_tree_remove(vma, &mapping->i_mmap);
 }
 
 struct vm_area_struct *
-vma_interval_tree_iter_first(struct address_space *mapping,
-			     pgoff_t pgoff_start, pgoff_t pgoff_last)
+mapping_interval_tree_iter_first(struct address_space *mapping,
+				 pgoff_t pgoff_start, pgoff_t pgoff_last)
 {
 	return __vma_interval_tree_iter_first(&mapping->i_mmap,
 					      pgoff_start, pgoff_last);
 }
 
 struct vm_area_struct *
-vma_interval_tree_iter_next(struct vm_area_struct *vma,
-			    pgoff_t pgoff_start, pgoff_t pgoff_last)
+mapping_interval_tree_iter_next(struct vm_area_struct *vma,
+				pgoff_t pgoff_start, pgoff_t pgoff_last)
 {
 	return __vma_interval_tree_iter_next(vma, pgoff_start, pgoff_last);
 }
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 9dcf38dc0f8c..bd5f86cf4bd8 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2136,7 +2136,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 	struct vm_area_struct *vma;
 
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
+	mapping_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 		struct mmu_notifier_range range;
 		struct mm_struct *mm;
 		unsigned long addr;
@@ -2568,7 +2568,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		 * not be able to observe any missing pages due to the
 		 * previously inserted retry entries.
 		 */
-		vma_interval_tree_foreach(vma, mapping, start, end) {
+		mapping_interval_tree_foreach(vma, mapping, start, end) {
 			if (userfaultfd_missing(vma)) {
 				result = SCAN_EXCEED_NONE_PTE;
 				goto immap_locked;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 3c842b472a75..5b97d26ee9b6 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -586,7 +586,7 @@ static void collect_procs_file(const struct folio *folio,
 
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
+		mapping_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 			/*
 			 * Send early kill signal to tasks where a vma covers
 			 * the page but the corrupted page is not necessarily
@@ -637,7 +637,7 @@ static void collect_procs_fsdax(const struct page *page,
 			t = task_early_kill(tsk, true);
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
+		mapping_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 			if (vma->vm_mm == t->mm)
 				add_to_kill_fsdax(t, page, vma, to_kill, pgoff);
 		}
@@ -2238,7 +2238,7 @@ static void collect_procs_pfn(struct pfn_address_space *pfn_space,
 		t = task_early_kill(tsk, true);
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, mapping, 0, ULONG_MAX) {
+		mapping_interval_tree_foreach(vma, mapping, 0, ULONG_MAX) {
 			pgoff_t pgoff;
 
 			if (vma->vm_mm == t->mm &&
diff --git a/mm/memory.c b/mm/memory.c
index 1cf59041600c..98c1a245f45a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4345,7 +4345,7 @@ static inline void unmap_mapping_range_tree(struct address_space *mapping,
 	unsigned long start, size;
 	struct mmu_gather tlb;
 
-	vma_interval_tree_foreach(vma, mapping, first_index, last_index) {
+	mapping_interval_tree_foreach(vma, mapping, first_index, last_index) {
 		const pgoff_t start_idx = max(first_index, vma->vm_pgoff);
 		const pgoff_t end_idx = min(last_index, vma_last_pgoff(vma)) + 1;
 
diff --git a/mm/mmap.c b/mm/mmap.c
index 2f22fb0d068d..2d09a57e3620 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1830,7 +1830,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 				mapping_allow_writable(mapping);
 			flush_dcache_mmap_lock(mapping);
 			/* insert tmp into the share list, just after mpnt */
-			vma_interval_tree_insert_after(tmp, mpnt, mapping);
+			mapping_interval_tree_insert_after(tmp, mpnt, mapping);
 			flush_dcache_mmap_unlock(mapping);
 			i_mmap_unlock_write(mapping);
 		}
diff --git a/mm/nommu.c b/mm/nommu.c
index 9a01b01ba8ed..6d168f69763f 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -569,7 +569,7 @@ static void setup_vma_to_mm(struct vm_area_struct *vma, struct mm_struct *mm)
 
 		i_mmap_lock_write(mapping);
 		flush_dcache_mmap_lock(mapping);
-		vma_interval_tree_insert(vma, mapping);
+		mapping_interval_tree_insert(vma, mapping);
 		flush_dcache_mmap_unlock(mapping);
 		i_mmap_unlock_write(mapping);
 	}
@@ -585,7 +585,7 @@ static void cleanup_vma_from_mm(struct vm_area_struct *vma)
 
 		i_mmap_lock_write(mapping);
 		flush_dcache_mmap_lock(mapping);
-		vma_interval_tree_remove(vma, mapping);
+		mapping_interval_tree_remove(vma, mapping);
 		flush_dcache_mmap_unlock(mapping);
 		i_mmap_unlock_write(mapping);
 	}
@@ -1816,7 +1816,7 @@ int nommu_shrink_inode_mappings(struct inode *inode, size_t size,
 	i_mmap_lock_read(inode->i_mapping);
 
 	/* search for VMAs that fall within the dead zone */
-	vma_interval_tree_foreach(vma, inode->i_mapping, low, high) {
+	mapping_interval_tree_foreach(vma, inode->i_mapping, low, high) {
 		/* found one - only interested if it's shared out of the page
 		 * cache */
 		if (vma->vm_flags & VM_SHARED) {
@@ -1832,7 +1832,7 @@ int nommu_shrink_inode_mappings(struct inode *inode, size_t size,
 	 * we don't check for any regions that start beyond the EOF as there
 	 * shouldn't be any
 	 */
-	vma_interval_tree_foreach(vma, inode->i_mapping, 0, ULONG_MAX) {
+	mapping_interval_tree_foreach(vma, inode->i_mapping, 0, ULONG_MAX) {
 		if (!(vma->vm_flags & VM_SHARED))
 			continue;
 
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 490a14691660..98d090ede077 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -810,8 +810,8 @@ int walk_page_mapping(struct address_space *mapping, pgoff_t first_index,
 		return -EINVAL;
 
 	lockdep_assert_held(&mapping->i_mmap_rwsem);
-	vma_interval_tree_foreach(vma, mapping, first_index,
-				  first_index + nr - 1) {
+	mapping_interval_tree_foreach(vma, mapping, first_index,
+				      first_index + nr - 1) {
 		/* Clip to the vma */
 		vba = vma->vm_pgoff;
 		vea = vba + vma_pages(vma);
diff --git a/mm/rmap.c b/mm/rmap.c
index 13ffa71bd20d..567e46799c64 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -3051,7 +3051,7 @@ static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
 		i_mmap_lock_read(mapping);
 	}
 lookup:
-	vma_interval_tree_foreach(vma, mapping, pgoff_start, pgoff_end) {
+	mapping_interval_tree_foreach(vma, mapping, pgoff_start, pgoff_end) {
 		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
 
 		VM_BUG_ON_VMA(address == -EFAULT, vma);
diff --git a/mm/vma.c b/mm/vma.c
index ce4ec4b71138..7dc9d087c2c7 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -234,7 +234,7 @@ static void __vma_link_file(struct vm_area_struct *vma,
 		mapping_allow_writable(mapping);
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_insert(vma, mapping);
+	mapping_interval_tree_insert(vma, mapping);
 	flush_dcache_mmap_unlock(mapping);
 }
 
@@ -248,7 +248,7 @@ static void __remove_shared_vm_struct(struct vm_area_struct *vma,
 		mapping_unmap_writable(mapping);
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_remove(vma, mapping);
+	mapping_interval_tree_remove(vma, mapping);
 	flush_dcache_mmap_unlock(mapping);
 }
 
@@ -319,9 +319,9 @@ static void vma_prepare(struct vma_prepare *vp)
 
 	if (vp->file) {
 		flush_dcache_mmap_lock(vp->mapping);
-		vma_interval_tree_remove(vp->vma, vp->mapping);
+		mapping_interval_tree_remove(vp->vma, vp->mapping);
 		if (vp->adj_next)
-			vma_interval_tree_remove(vp->adj_next, vp->mapping);
+			mapping_interval_tree_remove(vp->adj_next, vp->mapping);
 	}
 
 }
@@ -339,8 +339,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 {
 	if (vp->file) {
 		if (vp->adj_next)
-			vma_interval_tree_insert(vp->adj_next, vp->mapping);
-		vma_interval_tree_insert(vp->vma, vp->mapping);
+			mapping_interval_tree_insert(vp->adj_next, vp->mapping);
+		mapping_interval_tree_insert(vp->vma, vp->mapping);
 		flush_dcache_mmap_unlock(vp->mapping);
 	}
 
diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
index 94442b29458d..9c151b860f36 100644
--- a/tools/testing/vma/include/stubs.h
+++ b/tools/testing/vma/include/stubs.h
@@ -257,13 +257,13 @@ static inline void vm_acct_memory(long pages)
 {
 }
 
-static inline void vma_interval_tree_insert(struct vm_area_struct *vma,
-					    struct address_space *mapping)
+static inline void mapping_interval_tree_insert(struct vm_area_struct *vma,
+						struct address_space *mapping)
 {
 }
 
-static inline void vma_interval_tree_remove(struct vm_area_struct *vma,
-					    struct address_space *mapping)
+static inline void mapping_interval_tree_remove(struct vm_area_struct *vma,
+						struct address_space *mapping)
 {
 }
 
-- 
2.54.0

