Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0t84NYEHVGpihAMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:41 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C761745FBA
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZH1nApuP;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203AD10E504;
	Sun, 12 Jul 2026 21:30:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEFA10E21D;
 Fri, 10 Jul 2026 20:20:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 63EA443788;
 Fri, 10 Jul 2026 20:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2C21F000E9;
 Fri, 10 Jul 2026 20:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783714837;
 bh=ZXEEecnLaKE6h4XeKdlR4nDvBvNTcWsABqUFAmimjJ0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=ZH1nApuPVTF1D1B+iN8EbTPp/3uwPW9yotrcDoJEcJAJwLcMvVQhYsTyYOukc5mDm
 MvOatc/5ADIDZbbRw9nApLZT+1iPKP7tqTJoxz+9eX5qrz/mMNU79eiY/+7IxNrKNg
 DRK9JIXhtJ0NMHwPgyY3CkcnuBcIDoAMiq2D5IMCwDIV7M5EP9LT2Q61+izj5QwFSz
 KlhCZsnpr92nIfLGpy8nJTth124ZNJJerEpgSayMqHUpoafEYlpJbtrsDzMfqlXYcP
 Rinv0zxgaWGvMvqRwpbJtq7nQCt76GLZ+sgFswAVpINsg9nhT/t5oWJGYvQ8T5FZb4
 0bjb7DGgoSHWw==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Fri, 10 Jul 2026 21:16:49 +0100
Subject: [PATCH v2 08/33] mm/rmap: rename vma_interval_tree_*() to
 mapping_rmap_tree_*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-b4-pre-scalable-cow-v2-8-2a5aa403d977@kernel.org>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
In-Reply-To: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, 
 Lance Yang <lance.yang@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
 Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Dan Williams <djbw@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Xu Xin <xu.xin16@zte.com.cn>, 
 Chengming Zhou <chengming.zhou@linux.dev>, SJ Park <sj@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, 
 Peter Xu <peterx@redhat.com>, Kees Cook <kees@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Yishai Hadas <yishaih@nvidia.com>, 
 Shameer Kolothum <skolothumtho@nvidia.com>, 
 Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, 
 Alex Williamson <alex@shazbot.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Usama Arif <usama.arif@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-parisc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, damon@lists.linux.dev, 
 iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
 linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 kvm@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18824; i=ljs@kernel.org;
 h=from:subject:message-id; bh=NGir1YzSu95tIryD8ttAylxZ9DhWUH4kYxuWYXIxsQg=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLICg60deXMcvb12mxouTP6eLPbc7qr1rs+XQ/3bNMrWb
 1hwN+FGRykLgxgXg6yYIsvzL+L7g0TC5nVe8HeDmcPKBDKEgYtTACbCy8LwT1f4/LSaabMP/IiR
 z5x+uTlturXPWkcVuW/HX+g4vRGdXMDwzyJGbX0F+8ucT7ziPMYH6peVLr5izHS3paU6ubRs6uw
 XbAA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-Mailman-Approved-At: Sun, 12 Jul 2026 21:30:36 +0000
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[49];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,surriel.com,linux.dev,suse.de,armlinux.org.uk,siemens-energy.com,HansenPartnership.com,gmx.de,zeniv.linux.org.uk,suse.cz,redhat.com,arm.com,linux.intel.com,intel.com,linaro.org,nvidia.com,linux.alibaba.com,huawei.com,gmail.com,zte.com.cn,sk.com,gourry.net,samsung.com,goodmis.org,efficios.com,alien8.de,zytor.com,mev.co.uk,visionengravers.com,pengutronix.de,ffwll.ch,oss.qualcomm.com,poorly.run,somainline.org,ideasonboard.com,amd.com,ziepe.ca,shazbot.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[122];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C761745FBA

The family of vma_interval_tree_() functions manipulate the
address_space (which, of course, is generally referred to as 'mapping')
reverse mapping, but are named the 'VMA' interval tree.

VMAs may be mapped by an anon_vma, an address_space, or both. Therefore
calling the mapping interval tree a 'VMA' interval tree is rather
confusing.

This is also inconsistent with the anon_vma_interval_tree_*() functions
which explicitly reference the rmap object to which they pertain.

Rename the vma_interval_tree_*() functions to mapping_rmap_tree_*() to
correct this.

We will rename the anon rmap functions similarly in a subsequent patch.

No functional change intended.

Reviewed-by: Gregory Price <gourry@gourry.net>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 arch/arm/mm/fault-armv.c          |  2 +-
 arch/arm/mm/flush.c               |  2 +-
 arch/nios2/mm/cacheflush.c        |  2 +-
 arch/parisc/kernel/cache.c        |  2 +-
 fs/dax.c                          |  2 +-
 fs/hugetlbfs/inode.c              |  4 ++--
 include/linux/mm.h                | 16 ++++++++--------
 kernel/events/uprobes.c           |  2 +-
 mm/hugetlb.c                      |  4 ++--
 mm/interval_tree.c                | 22 +++++++++++-----------
 mm/khugepaged.c                   |  4 ++--
 mm/memory-failure.c               |  6 +++---
 mm/memory.c                       |  2 +-
 mm/mmap.c                         |  2 +-
 mm/nommu.c                        |  8 ++++----
 mm/pagewalk.c                     |  2 +-
 mm/rmap.c                         |  2 +-
 mm/vma.c                          | 12 ++++++------
 tools/testing/vma/include/stubs.h |  4 ++--
 19 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index cd52cf7f8874..b505f1fd7984 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -140,7 +140,7 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
 	 * cache coherency.
 	 */
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_foreach(mpnt, mapping, pgoff, pgoff) {
+	mapping_rmap_tree_foreach(mpnt, mapping, pgoff, pgoff) {
 		/*
 		 * If we are using split PTE locks, then we need to take the pte
 		 * lock. Otherwise we are using shared mm->page_table_lock which
diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
index 8c593e9898ee..66270904f874 100644
--- a/arch/arm/mm/flush.c
+++ b/arch/arm/mm/flush.c
@@ -251,7 +251,7 @@ static void __flush_dcache_aliases(struct address_space *mapping, struct folio *
 	pgoff_end = pgoff + folio_nr_pages(folio) - 1;
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff_end) {
+	mapping_rmap_tree_foreach(vma, mapping, pgoff, pgoff_end) {
 		unsigned long start, offset, pfn;
 		unsigned int nr;
 
diff --git a/arch/nios2/mm/cacheflush.c b/arch/nios2/mm/cacheflush.c
index 42e3bf892316..10232476031f 100644
--- a/arch/nios2/mm/cacheflush.c
+++ b/arch/nios2/mm/cacheflush.c
@@ -82,7 +82,7 @@ static void flush_aliases(struct address_space *mapping, struct folio *folio)
 	pgoff = folio->index;
 
 	flush_dcache_mmap_lock_irqsave(mapping, flags);
-	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
+	mapping_rmap_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
 		unsigned long start;
 
 		if (vma->vm_mm != mm)
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index f28aa7884cbf..98200b6b5b82 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -503,7 +503,7 @@ void flush_dcache_folio(struct folio *folio)
 	 * on machines that support equivalent aliasing
 	 */
 	flush_dcache_mmap_lock_irqsave(mapping, flags);
-	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
+	mapping_rmap_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
 		unsigned long offset = pgoff - vma->vm_pgoff;
 		unsigned long pfn = folio_pfn(folio);
 
diff --git a/fs/dax.c b/fs/dax.c
index 2f0818a68a7f..4ea3384ecefd 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1201,7 +1201,7 @@ static int dax_writeback_one(struct xa_state *xas, struct dax_device *dax_dev,
 
 	/* Walk all mappings of a given index of a file and writeprotect them */
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, mapping, index, end) {
+	mapping_rmap_tree_foreach(vma, mapping, index, end) {
 		pfn_mkclean_range(pfn, count, index, vma);
 		cond_resched();
 	}
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 4ea1798f1ffb..9fddd1e0b813 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -393,7 +393,7 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 	i_mmap_lock_write(mapping);
 retry:
 	vma_lock = NULL;
-	vma_interval_tree_foreach(vma, mapping, start, end - 1) {
+	mapping_rmap_tree_foreach(vma, mapping, start, end - 1) {
 		v_start = vma_offset_start(vma, start);
 		v_end = vma_offset_end(vma, end);
 
@@ -469,7 +469,7 @@ hugetlb_vmdelete_list(struct address_space *mapping, pgoff_t start,
 	 * unmapped.  Note, end is exclusive, whereas the interval tree takes
 	 * an inclusive "last".
 	 */
-	vma_interval_tree_foreach(vma, mapping, start,
+	mapping_rmap_tree_foreach(vma, mapping, start,
 				  end ? end - 1 : ULONG_MAX) {
 		unsigned long v_start;
 		unsigned long v_end;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index da4b7540837d..d4ac9dc83ddd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4090,24 +4090,24 @@ extern atomic_long_t mmap_pages_allocated;
 extern int nommu_shrink_inode_mappings(struct inode *, size_t, size_t);
 
 /* interval_tree.c */
-void vma_interval_tree_insert(struct vm_area_struct *vma,
+void mapping_rmap_tree_insert(struct vm_area_struct *vma,
 			      struct address_space *mapping);
-void vma_interval_tree_insert_after(struct vm_area_struct *vma,
+void mapping_rmap_tree_insert_after(struct vm_area_struct *vma,
 				    struct vm_area_struct *prev,
 				    struct address_space *mapping);
-void vma_interval_tree_remove(struct vm_area_struct *vma,
+void mapping_rmap_tree_remove(struct vm_area_struct *vma,
 			      struct address_space *mapping);
 struct vm_area_struct *
-vma_interval_tree_iter_first(struct address_space *mapping,
+mapping_rmap_tree_iter_first(struct address_space *mapping,
 			     pgoff_t pgoff_start, pgoff_t pgoff_last);
 struct vm_area_struct *
-vma_interval_tree_iter_next(struct vm_area_struct *vma,
+mapping_rmap_tree_iter_next(struct vm_area_struct *vma,
 			    pgoff_t pgoff_start, pgoff_t pgoff_last);
 
-#define vma_interval_tree_foreach(vma, mapping, pgoff_start, pgoff_last) \
-	for (vma = vma_interval_tree_iter_first(mapping, pgoff_start,	 \
+#define mapping_rmap_tree_foreach(vma, mapping, pgoff_start, pgoff_last) \
+	for (vma = mapping_rmap_tree_iter_first(mapping, pgoff_start,	 \
 						pgoff_last);		 \
-	     vma; vma = vma_interval_tree_iter_next(vma, pgoff_start,	 \
+	     vma; vma = mapping_rmap_tree_iter_next(vma, pgoff_start,	 \
 						    pgoff_last))
 
 void anon_vma_interval_tree_insert(struct anon_vma_chain *node,
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 50a96a4d812d..ac340a703d06 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1210,7 +1210,7 @@ build_map_info(struct address_space *mapping, loff_t offset, bool is_register)
 
  again:
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
+	mapping_rmap_tree_foreach(vma, mapping, pgoff, pgoff) {
 		if (!valid_vma(vma, is_register))
 			continue;
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 9dddd4227dbf..92796c0cd89e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5454,7 +5454,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * __unmap_hugepage_range() is called as the lock is already held
 	 */
 	i_mmap_lock_write(mapping);
-	vma_interval_tree_foreach(iter_vma, mapping, pgoff, pgoff) {
+	mapping_rmap_tree_foreach(iter_vma, mapping, pgoff, pgoff) {
 		/* Do not unmap the current VMA */
 		if (iter_vma == vma)
 			continue;
@@ -6997,7 +6997,7 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 	pte_t *pte;
 
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(svma, mapping, idx, idx) {
+	mapping_rmap_tree_foreach(svma, mapping, idx, idx) {
 		if (svma == vma)
 			continue;
 
diff --git a/mm/interval_tree.c b/mm/interval_tree.c
index b387d39e0547..39e020555910 100644
--- a/mm/interval_tree.c
+++ b/mm/interval_tree.c
@@ -16,16 +16,16 @@
 INTERVAL_TREE_DEFINE(struct vm_area_struct, shared.rb,
 		     pgoff_t, shared.rb_subtree_last,
 		     vma_start_pgoff, vma_last_pgoff, static,
-		     __vma_interval_tree)
+		     __mapping_rmap_tree)
 
-void vma_interval_tree_insert(struct vm_area_struct *vma,
+void mapping_rmap_tree_insert(struct vm_area_struct *vma,
 			      struct address_space *mapping)
 {
-	__vma_interval_tree_insert(vma, &mapping->i_mmap);
+	__mapping_rmap_tree_insert(vma, &mapping->i_mmap);
 }
 
 /* Insert vma immediately after prev in the interval tree */
-void vma_interval_tree_insert_after(struct vm_area_struct *vma,
+void mapping_rmap_tree_insert_after(struct vm_area_struct *vma,
 				    struct vm_area_struct *prev,
 				    struct address_space *mapping)
 {
@@ -55,28 +55,28 @@ void vma_interval_tree_insert_after(struct vm_area_struct *vma,
 	vma->shared.rb_subtree_last = pgoff_last;
 	rb_link_node(&vma->shared.rb, &parent->shared.rb, link);
 	rb_insert_augmented(&vma->shared.rb, &mapping->i_mmap.rb_root,
-			    &__vma_interval_tree_augment);
+			    &__mapping_rmap_tree_augment);
 }
 
-void vma_interval_tree_remove(struct vm_area_struct *vma,
+void mapping_rmap_tree_remove(struct vm_area_struct *vma,
 			      struct address_space *mapping)
 {
-	__vma_interval_tree_remove(vma, &mapping->i_mmap);
+	__mapping_rmap_tree_remove(vma, &mapping->i_mmap);
 }
 
 struct vm_area_struct *
-vma_interval_tree_iter_first(struct address_space *mapping,
+mapping_rmap_tree_iter_first(struct address_space *mapping,
 			     pgoff_t pgoff_start, pgoff_t pgoff_last)
 {
-	return __vma_interval_tree_iter_first(&mapping->i_mmap,
+	return __mapping_rmap_tree_iter_first(&mapping->i_mmap,
 					      pgoff_start, pgoff_last);
 }
 
 struct vm_area_struct *
-vma_interval_tree_iter_next(struct vm_area_struct *vma,
+mapping_rmap_tree_iter_next(struct vm_area_struct *vma,
 			    pgoff_t pgoff_start, pgoff_t pgoff_last)
 {
-	return __vma_interval_tree_iter_next(vma, pgoff_start, pgoff_last);
+	return __mapping_rmap_tree_iter_next(vma, pgoff_start, pgoff_last);
 }
 
 /* Anonymous interval tree (anon_vma->rb_root) */
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index e5462e026642..912be3daf37e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2141,7 +2141,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 	struct vm_area_struct *vma;
 
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
+	mapping_rmap_tree_foreach(vma, mapping, pgoff, pgoff) {
 		struct mmu_notifier_range range;
 		struct mm_struct *mm;
 		unsigned long addr;
@@ -2573,7 +2573,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		 * not be able to observe any missing pages due to the
 		 * previously inserted retry entries.
 		 */
-		vma_interval_tree_foreach(vma, mapping, start, end) {
+		mapping_rmap_tree_foreach(vma, mapping, start, end) {
 			if (userfaultfd_missing(vma)) {
 				result = SCAN_EXCEED_NONE_PTE;
 				goto immap_locked;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 4358856e764f..66ae93c6d4b2 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -598,7 +598,7 @@ static void collect_procs_file(const struct folio *folio,
 
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
+		mapping_rmap_tree_foreach(vma, mapping, pgoff, pgoff) {
 			/*
 			 * Send early kill signal to tasks where a vma covers
 			 * the page but the corrupted page is not necessarily
@@ -649,7 +649,7 @@ static void collect_procs_fsdax(const struct page *page,
 			t = task_early_kill(tsk, true);
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
+		mapping_rmap_tree_foreach(vma, mapping, pgoff, pgoff) {
 			if (vma->vm_mm == t->mm)
 				add_to_kill_fsdax(t, page, vma, to_kill, pgoff);
 		}
@@ -2296,7 +2296,7 @@ static void collect_procs_pfn(struct pfn_address_space *pfn_space,
 		t = task_early_kill(tsk, true);
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, mapping, 0, ULONG_MAX) {
+		mapping_rmap_tree_foreach(vma, mapping, 0, ULONG_MAX) {
 			pgoff_t pgoff;
 
 			if (vma->vm_mm == t->mm &&
diff --git a/mm/memory.c b/mm/memory.c
index 6ce92badc38a..b7e9a7e53516 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4369,7 +4369,7 @@ static inline void unmap_mapping_range_tree(struct address_space *mapping,
 	unsigned long start, size;
 	struct mmu_gather tlb;
 
-	vma_interval_tree_foreach(vma, mapping, first_index, last_index) {
+	mapping_rmap_tree_foreach(vma, mapping, first_index, last_index) {
 		const pgoff_t start_idx = max(first_index, vma->vm_pgoff);
 		const pgoff_t end_idx = min(last_index, vma_last_pgoff(vma)) + 1;
 
diff --git a/mm/mmap.c b/mm/mmap.c
index 2f22fb0d068d..91eaa0c9e7ee 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1830,7 +1830,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 				mapping_allow_writable(mapping);
 			flush_dcache_mmap_lock(mapping);
 			/* insert tmp into the share list, just after mpnt */
-			vma_interval_tree_insert_after(tmp, mpnt, mapping);
+			mapping_rmap_tree_insert_after(tmp, mpnt, mapping);
 			flush_dcache_mmap_unlock(mapping);
 			i_mmap_unlock_write(mapping);
 		}
diff --git a/mm/nommu.c b/mm/nommu.c
index 13023d73d1e4..f51a4a375c8c 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -569,7 +569,7 @@ static void setup_vma_to_mm(struct vm_area_struct *vma, struct mm_struct *mm)
 
 		i_mmap_lock_write(mapping);
 		flush_dcache_mmap_lock(mapping);
-		vma_interval_tree_insert(vma, mapping);
+		mapping_rmap_tree_insert(vma, mapping);
 		flush_dcache_mmap_unlock(mapping);
 		i_mmap_unlock_write(mapping);
 	}
@@ -585,7 +585,7 @@ static void cleanup_vma_from_mm(struct vm_area_struct *vma)
 
 		i_mmap_lock_write(mapping);
 		flush_dcache_mmap_lock(mapping);
-		vma_interval_tree_remove(vma, mapping);
+		mapping_rmap_tree_remove(vma, mapping);
 		flush_dcache_mmap_unlock(mapping);
 		i_mmap_unlock_write(mapping);
 	}
@@ -1843,7 +1843,7 @@ int nommu_shrink_inode_mappings(struct inode *inode, size_t size,
 	i_mmap_lock_read(inode->i_mapping);
 
 	/* search for VMAs that fall within the dead zone */
-	vma_interval_tree_foreach(vma, inode->i_mapping, low, high) {
+	mapping_rmap_tree_foreach(vma, inode->i_mapping, low, high) {
 		/* found one - only interested if it's shared out of the page
 		 * cache */
 		if (vma->vm_flags & VM_SHARED) {
@@ -1859,7 +1859,7 @@ int nommu_shrink_inode_mappings(struct inode *inode, size_t size,
 	 * we don't check for any regions that start beyond the EOF as there
 	 * shouldn't be any
 	 */
-	vma_interval_tree_foreach(vma, inode->i_mapping, 0, ULONG_MAX) {
+	mapping_rmap_tree_foreach(vma, inode->i_mapping, 0, ULONG_MAX) {
 		if (!(vma->vm_flags & VM_SHARED))
 			continue;
 
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 490a14691660..7e7819cf5a3a 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -810,7 +810,7 @@ int walk_page_mapping(struct address_space *mapping, pgoff_t first_index,
 		return -EINVAL;
 
 	lockdep_assert_held(&mapping->i_mmap_rwsem);
-	vma_interval_tree_foreach(vma, mapping, first_index,
+	mapping_rmap_tree_foreach(vma, mapping, first_index,
 				  first_index + nr - 1) {
 		/* Clip to the vma */
 		vba = vma->vm_pgoff;
diff --git a/mm/rmap.c b/mm/rmap.c
index 73673cd3961e..d3d3d6cb17b8 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -3053,7 +3053,7 @@ static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
 		i_mmap_lock_read(mapping);
 	}
 lookup:
-	vma_interval_tree_foreach(vma, mapping, pgoff_start, pgoff_end) {
+	mapping_rmap_tree_foreach(vma, mapping, pgoff_start, pgoff_end) {
 		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
 
 		VM_BUG_ON_VMA(address == -EFAULT, vma);
diff --git a/mm/vma.c b/mm/vma.c
index ce4ec4b71138..d99e2088de4e 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -234,7 +234,7 @@ static void __vma_link_file(struct vm_area_struct *vma,
 		mapping_allow_writable(mapping);
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_insert(vma, mapping);
+	mapping_rmap_tree_insert(vma, mapping);
 	flush_dcache_mmap_unlock(mapping);
 }
 
@@ -248,7 +248,7 @@ static void __remove_shared_vm_struct(struct vm_area_struct *vma,
 		mapping_unmap_writable(mapping);
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_remove(vma, mapping);
+	mapping_rmap_tree_remove(vma, mapping);
 	flush_dcache_mmap_unlock(mapping);
 }
 
@@ -319,9 +319,9 @@ static void vma_prepare(struct vma_prepare *vp)
 
 	if (vp->file) {
 		flush_dcache_mmap_lock(vp->mapping);
-		vma_interval_tree_remove(vp->vma, vp->mapping);
+		mapping_rmap_tree_remove(vp->vma, vp->mapping);
 		if (vp->adj_next)
-			vma_interval_tree_remove(vp->adj_next, vp->mapping);
+			mapping_rmap_tree_remove(vp->adj_next, vp->mapping);
 	}
 
 }
@@ -339,8 +339,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 {
 	if (vp->file) {
 		if (vp->adj_next)
-			vma_interval_tree_insert(vp->adj_next, vp->mapping);
-		vma_interval_tree_insert(vp->vma, vp->mapping);
+			mapping_rmap_tree_insert(vp->adj_next, vp->mapping);
+		mapping_rmap_tree_insert(vp->vma, vp->mapping);
 		flush_dcache_mmap_unlock(vp->mapping);
 	}
 
diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
index 94442b29458d..37f81b11e8b7 100644
--- a/tools/testing/vma/include/stubs.h
+++ b/tools/testing/vma/include/stubs.h
@@ -257,12 +257,12 @@ static inline void vm_acct_memory(long pages)
 {
 }
 
-static inline void vma_interval_tree_insert(struct vm_area_struct *vma,
+static inline void mapping_rmap_tree_insert(struct vm_area_struct *vma,
 					    struct address_space *mapping)
 {
 }
 
-static inline void vma_interval_tree_remove(struct vm_area_struct *vma,
+static inline void mapping_rmap_tree_remove(struct vm_area_struct *vma,
 					    struct address_space *mapping)
 {
 }

-- 
2.55.0

