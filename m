Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 83svO40HVGqqhAMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:53 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9752374603B
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dJG2R20R;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DAD10E790;
	Sun, 12 Jul 2026 21:30:52 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7050489B66;
 Fri, 10 Jul 2026 20:19:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D8A943E58;
 Fri, 10 Jul 2026 20:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623841F000E9;
 Fri, 10 Jul 2026 20:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783714791;
 bh=yTpEXCYyEBDssM0LXmlPBhbdcFdvloAKFT95xd9ND2E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=dJG2R20RS+ApyjgMsPxuzZUiPonPDpQSeCwtum1pQxYenuifhCDBec5AidB3GhKUO
 eCJ649sAicKn2q5tryjVOsVYFvIDOLvlTt++rEjL1v09Uf1kUXl5JoY5JdpXGso69C
 Ts/3B/u/d+o/c0gl4cya43kV3gK7sWCg5ncpfcUvZESCTWpk6G2Iaut6DI3fWKsQeC
 +DAYhKXzDEcXJqvM1ZywVW2Go90fdRor4SKKZ29CZjyk5M7G3cl+LS+k7oGPxHrZXB
 Ov9bXXWEnlI0qwJxKWM3r23dPvRJ83SJ+Z3LHjs87hJMKq4MdtK+x8EU0XbnCmNQwW
 pHyHNik67WVUw==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Fri, 10 Jul 2026 21:16:47 +0100
Subject: [PATCH v2 06/33] mm/rmap: parameterise vma_interval_tree_*() by
 address_space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-b4-pre-scalable-cow-v2-6-2a5aa403d977@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=23248; i=ljs@kernel.org;
 h=from:subject:message-id; bh=l37OTGuevZc5gXyVHaBH6LTDa3GZBR26w5oXVQ6z530=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLICg63PONzsnuP3/tlETZUjqzJ1pprsO16To7hp0k2bw
 spLtzbId5SyMIhxMciKKbI8/yK+P0gkbF7nBX83mDmsTCBDGLg4BWAiruwMv1lkF+a5CFZNcVFu
 8r3BH8b/443PjTe9p1g3hfO4BcVFXmdk2G/4tdB7ukr3nD1/xKK2XHimqvrhznoZ3ZpFDxdH3+F
 i4wYA
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
X-Rspamd-Queue-Id: 9752374603B

The file-backed mapping interval tree functions vma_interval_tree_*()
accept a raw rb_root_cached pointer to determine the tree in which they are
operating.

However, in each case, this is always associated with an address_space data
type.

So simply pass a pointer to that instead to simplify the code, and more
clearly differentiate between these operations and those concerning
anonymous mappings.

While we're here, make the generated interval tree functions static as they
do not need to be used externally (any previously existing external users
have now been removed).

We also rename VMA parameters from 'node' to 'vma' as calling this a node
is simply confusing, update the input index types to pgoff_t since they
reference page offsets and rename the parameters to pgoff_start and
pgoff_last.

No functional change intended.

Reviewed-by: Pedro Falcato <pfalcato@suse.de>
Reviewed-by: Gregory Price <gourry@gourry.net>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 arch/arm/mm/fault-armv.c          |  2 +-
 arch/arm/mm/flush.c               |  2 +-
 arch/nios2/mm/cacheflush.c        |  2 +-
 arch/parisc/kernel/cache.c        |  2 +-
 fs/dax.c                          |  2 +-
 fs/hugetlbfs/inode.c              | 15 +++++-----
 include/linux/mm.h                | 34 ++++++++++++-----------
 kernel/events/uprobes.c           |  2 +-
 mm/hugetlb.c                      |  4 +--
 mm/interval_tree.c                | 58 +++++++++++++++++++++++++++++----------
 mm/khugepaged.c                   |  4 +--
 mm/memory-failure.c               |  7 ++---
 mm/memory.c                       |  8 +++---
 mm/mmap.c                         |  3 +-
 mm/nommu.c                        |  8 +++---
 mm/pagewalk.c                     |  2 +-
 mm/rmap.c                         |  3 +-
 mm/vma.c                          | 14 ++++------
 tools/testing/vma/include/stubs.h |  4 +--
 19 files changed, 100 insertions(+), 76 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 91e488767783..cd52cf7f8874 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -140,7 +140,7 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
 	 * cache coherency.
 	 */
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
+	vma_interval_tree_foreach(mpnt, mapping, pgoff, pgoff) {
 		/*
 		 * If we are using split PTE locks, then we need to take the pte
 		 * lock. Otherwise we are using shared mm->page_table_lock which
diff --git a/arch/arm/mm/flush.c b/arch/arm/mm/flush.c
index 4d7ef5cc36b6..8c593e9898ee 100644
--- a/arch/arm/mm/flush.c
+++ b/arch/arm/mm/flush.c
@@ -251,7 +251,7 @@ static void __flush_dcache_aliases(struct address_space *mapping, struct folio *
 	pgoff_end = pgoff + folio_nr_pages(folio) - 1;
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff_end) {
+	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff_end) {
 		unsigned long start, offset, pfn;
 		unsigned int nr;
 
diff --git a/arch/nios2/mm/cacheflush.c b/arch/nios2/mm/cacheflush.c
index 8321182eb927..42e3bf892316 100644
--- a/arch/nios2/mm/cacheflush.c
+++ b/arch/nios2/mm/cacheflush.c
@@ -82,7 +82,7 @@ static void flush_aliases(struct address_space *mapping, struct folio *folio)
 	pgoff = folio->index;
 
 	flush_dcache_mmap_lock_irqsave(mapping, flags);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff + nr - 1) {
+	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
 		unsigned long start;
 
 		if (vma->vm_mm != mm)
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 0170b69a21d3..f28aa7884cbf 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -503,7 +503,7 @@ void flush_dcache_folio(struct folio *folio)
 	 * on machines that support equivalent aliasing
 	 */
 	flush_dcache_mmap_lock_irqsave(mapping, flags);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff + nr - 1) {
+	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff + nr - 1) {
 		unsigned long offset = pgoff - vma->vm_pgoff;
 		unsigned long pfn = folio_pfn(folio);
 
diff --git a/fs/dax.c b/fs/dax.c
index 6d175cd47a99..2f0818a68a7f 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1201,7 +1201,7 @@ static int dax_writeback_one(struct xa_state *xas, struct dax_device *dax_dev,
 
 	/* Walk all mappings of a given index of a file and writeprotect them */
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, index, end) {
+	vma_interval_tree_foreach(vma, mapping, index, end) {
 		pfn_mkclean_range(pfn, count, index, vma);
 		cond_resched();
 	}
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 216e1a0dd0b2..4ea1798f1ffb 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -380,7 +380,6 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 					struct address_space *mapping,
 					struct folio *folio, pgoff_t index)
 {
-	struct rb_root_cached *root = &mapping->i_mmap;
 	struct hugetlb_vma_lock *vma_lock;
 	unsigned long pfn = folio_pfn(folio);
 	struct vm_area_struct *vma;
@@ -394,7 +393,7 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 	i_mmap_lock_write(mapping);
 retry:
 	vma_lock = NULL;
-	vma_interval_tree_foreach(vma, root, start, end - 1) {
+	vma_interval_tree_foreach(vma, mapping, start, end - 1) {
 		v_start = vma_offset_start(vma, start);
 		v_end = vma_offset_end(vma, end);
 
@@ -460,8 +459,8 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 }
 
 static void
-hugetlb_vmdelete_list(struct rb_root_cached *root, pgoff_t start, pgoff_t end,
-		      zap_flags_t zap_flags)
+hugetlb_vmdelete_list(struct address_space *mapping, pgoff_t start,
+		      pgoff_t end, zap_flags_t zap_flags)
 {
 	struct vm_area_struct *vma;
 
@@ -470,7 +469,8 @@ hugetlb_vmdelete_list(struct rb_root_cached *root, pgoff_t start, pgoff_t end,
 	 * unmapped.  Note, end is exclusive, whereas the interval tree takes
 	 * an inclusive "last".
 	 */
-	vma_interval_tree_foreach(vma, root, start, end ? end - 1 : ULONG_MAX) {
+	vma_interval_tree_foreach(vma, mapping, start,
+				  end ? end - 1 : ULONG_MAX) {
 		unsigned long v_start;
 		unsigned long v_end;
 
@@ -615,8 +615,7 @@ static void hugetlb_vmtruncate(struct inode *inode, loff_t offset)
 	i_size_write(inode, offset);
 	i_mmap_lock_write(mapping);
 	if (mapping_mapped(mapping))
-		hugetlb_vmdelete_list(&mapping->i_mmap, pgoff, 0,
-				      ZAP_FLAG_DROP_MARKER);
+		hugetlb_vmdelete_list(mapping, pgoff, 0, ZAP_FLAG_DROP_MARKER);
 	i_mmap_unlock_write(mapping);
 	remove_inode_hugepages(inode, offset, LLONG_MAX);
 }
@@ -676,7 +675,7 @@ static long hugetlbfs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 	/* Unmap users of full pages in the hole. */
 	if (hole_end > hole_start) {
 		if (mapping_mapped(mapping))
-			hugetlb_vmdelete_list(&mapping->i_mmap,
+			hugetlb_vmdelete_list(mapping,
 					      hole_start >> PAGE_SHIFT,
 					      hole_end >> PAGE_SHIFT, 0);
 	}
diff --git a/include/linux/mm.h b/include/linux/mm.h
index c56ca22d406c..da4b7540837d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4090,23 +4090,25 @@ extern atomic_long_t mmap_pages_allocated;
 extern int nommu_shrink_inode_mappings(struct inode *, size_t, size_t);
 
 /* interval_tree.c */
-void vma_interval_tree_insert(struct vm_area_struct *node,
-			      struct rb_root_cached *root);
-void vma_interval_tree_insert_after(struct vm_area_struct *node,
+void vma_interval_tree_insert(struct vm_area_struct *vma,
+			      struct address_space *mapping);
+void vma_interval_tree_insert_after(struct vm_area_struct *vma,
 				    struct vm_area_struct *prev,
-				    struct rb_root_cached *root);
-void vma_interval_tree_remove(struct vm_area_struct *node,
-			      struct rb_root_cached *root);
-struct vm_area_struct *vma_interval_tree_subtree_search(struct vm_area_struct *node,
-				unsigned long start, unsigned long last);
-struct vm_area_struct *vma_interval_tree_iter_first(struct rb_root_cached *root,
-				unsigned long start, unsigned long last);
-struct vm_area_struct *vma_interval_tree_iter_next(struct vm_area_struct *node,
-				unsigned long start, unsigned long last);
-
-#define vma_interval_tree_foreach(vma, root, start, last)		\
-	for (vma = vma_interval_tree_iter_first(root, start, last);	\
-	     vma; vma = vma_interval_tree_iter_next(vma, start, last))
+				    struct address_space *mapping);
+void vma_interval_tree_remove(struct vm_area_struct *vma,
+			      struct address_space *mapping);
+struct vm_area_struct *
+vma_interval_tree_iter_first(struct address_space *mapping,
+			     pgoff_t pgoff_start, pgoff_t pgoff_last);
+struct vm_area_struct *
+vma_interval_tree_iter_next(struct vm_area_struct *vma,
+			    pgoff_t pgoff_start, pgoff_t pgoff_last);
+
+#define vma_interval_tree_foreach(vma, mapping, pgoff_start, pgoff_last) \
+	for (vma = vma_interval_tree_iter_first(mapping, pgoff_start,	 \
+						pgoff_last);		 \
+	     vma; vma = vma_interval_tree_iter_next(vma, pgoff_start,	 \
+						    pgoff_last))
 
 void anon_vma_interval_tree_insert(struct anon_vma_chain *node,
 				   struct rb_root_cached *root);
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 4084e926e284..50a96a4d812d 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1210,7 +1210,7 @@ build_map_info(struct address_space *mapping, loff_t offset, bool is_register)
 
  again:
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
+	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 		if (!valid_vma(vma, is_register))
 			continue;
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a85ea663b192..9dddd4227dbf 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5454,7 +5454,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * __unmap_hugepage_range() is called as the lock is already held
 	 */
 	i_mmap_lock_write(mapping);
-	vma_interval_tree_foreach(iter_vma, &mapping->i_mmap, pgoff, pgoff) {
+	vma_interval_tree_foreach(iter_vma, mapping, pgoff, pgoff) {
 		/* Do not unmap the current VMA */
 		if (iter_vma == vma)
 			continue;
@@ -6997,7 +6997,7 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 	pte_t *pte;
 
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(svma, &mapping->i_mmap, idx, idx) {
+	vma_interval_tree_foreach(svma, mapping, idx, idx) {
 		if (svma == vma)
 			continue;
 
diff --git a/mm/interval_tree.c b/mm/interval_tree.c
index 2d50bc6228c4..ff36fd14ef37 100644
--- a/mm/interval_tree.c
+++ b/mm/interval_tree.c
@@ -14,19 +14,26 @@
 /* File-backed interval tree (address_space->i_mmap) */
 
 INTERVAL_TREE_DEFINE(struct vm_area_struct, shared.rb,
-		     unsigned long, shared.rb_subtree_last,
-		     vma_start_pgoff, vma_last_pgoff, /* empty */, vma_interval_tree)
+		     pgoff_t, shared.rb_subtree_last,
+		     vma_start_pgoff, vma_last_pgoff, static,
+		     __vma_interval_tree)
 
-/* Insert node immediately after prev in the interval tree */
-void vma_interval_tree_insert_after(struct vm_area_struct *node,
+void vma_interval_tree_insert(struct vm_area_struct *vma,
+			      struct address_space *mapping)
+{
+	__vma_interval_tree_insert(vma, &mapping->i_mmap);
+}
+
+/* Insert vma immediately after prev in the interval tree */
+void vma_interval_tree_insert_after(struct vm_area_struct *vma,
 				    struct vm_area_struct *prev,
-				    struct rb_root_cached *root)
+				    struct address_space *mapping)
 {
 	struct rb_node **link;
 	struct vm_area_struct *parent;
-	unsigned long last = vma_last_pgoff(node);
+	const pgoff_t pgoff_last = vma_last_pgoff(vma);
 
-	VM_WARN_ON_ONCE_VMA(vma_start_pgoff(node) != vma_start_pgoff(prev), node);
+	VM_WARN_ON_ONCE_VMA(vma_start_pgoff(vma) != vma_start_pgoff(prev), vma);
 
 	if (!prev->shared.rb.rb_right) {
 		parent = prev;
@@ -34,21 +41,42 @@ void vma_interval_tree_insert_after(struct vm_area_struct *node,
 	} else {
 		parent = rb_entry(prev->shared.rb.rb_right,
 				  struct vm_area_struct, shared.rb);
-		if (parent->shared.rb_subtree_last < last)
-			parent->shared.rb_subtree_last = last;
+		if (parent->shared.rb_subtree_last < pgoff_last)
+			parent->shared.rb_subtree_last = pgoff_last;
 		while (parent->shared.rb.rb_left) {
 			parent = rb_entry(parent->shared.rb.rb_left,
 				struct vm_area_struct, shared.rb);
-			if (parent->shared.rb_subtree_last < last)
-				parent->shared.rb_subtree_last = last;
+			if (parent->shared.rb_subtree_last < pgoff_last)
+				parent->shared.rb_subtree_last = pgoff_last;
 		}
 		link = &parent->shared.rb.rb_left;
 	}
 
-	node->shared.rb_subtree_last = last;
-	rb_link_node(&node->shared.rb, &parent->shared.rb, link);
-	rb_insert_augmented(&node->shared.rb, &root->rb_root,
-			    &vma_interval_tree_augment);
+	vma->shared.rb_subtree_last = pgoff_last;
+	rb_link_node(&vma->shared.rb, &parent->shared.rb, link);
+	rb_insert_augmented(&vma->shared.rb, &mapping->i_mmap.rb_root,
+			    &__vma_interval_tree_augment);
+}
+
+void vma_interval_tree_remove(struct vm_area_struct *vma,
+			      struct address_space *mapping)
+{
+	__vma_interval_tree_remove(vma, &mapping->i_mmap);
+}
+
+struct vm_area_struct *
+vma_interval_tree_iter_first(struct address_space *mapping,
+			     pgoff_t pgoff_start, pgoff_t pgoff_last)
+{
+	return __vma_interval_tree_iter_first(&mapping->i_mmap,
+					      pgoff_start, pgoff_last);
+}
+
+struct vm_area_struct *
+vma_interval_tree_iter_next(struct vm_area_struct *vma,
+			    pgoff_t pgoff_start, pgoff_t pgoff_last)
+{
+	return __vma_interval_tree_iter_next(vma, pgoff_start, pgoff_last);
 }
 
 /* Anonymous interval tree (anon_vma->rb_root) */
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 55157567dc4c..e5462e026642 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2141,7 +2141,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 	struct vm_area_struct *vma;
 
 	i_mmap_lock_read(mapping);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
+	vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 		struct mmu_notifier_range range;
 		struct mm_struct *mm;
 		unsigned long addr;
@@ -2573,7 +2573,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		 * not be able to observe any missing pages due to the
 		 * previously inserted retry entries.
 		 */
-		vma_interval_tree_foreach(vma, &mapping->i_mmap, start, end) {
+		vma_interval_tree_foreach(vma, mapping, start, end) {
 			if (userfaultfd_missing(vma)) {
 				result = SCAN_EXCEED_NONE_PTE;
 				goto immap_locked;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index bf717ec59508..4358856e764f 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -598,8 +598,7 @@ static void collect_procs_file(const struct folio *folio,
 
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff,
-				      pgoff) {
+		vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 			/*
 			 * Send early kill signal to tasks where a vma covers
 			 * the page but the corrupted page is not necessarily
@@ -650,7 +649,7 @@ static void collect_procs_fsdax(const struct page *page,
 			t = task_early_kill(tsk, true);
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
+		vma_interval_tree_foreach(vma, mapping, pgoff, pgoff) {
 			if (vma->vm_mm == t->mm)
 				add_to_kill_fsdax(t, page, vma, to_kill, pgoff);
 		}
@@ -2297,7 +2296,7 @@ static void collect_procs_pfn(struct pfn_address_space *pfn_space,
 		t = task_early_kill(tsk, true);
 		if (!t)
 			continue;
-		vma_interval_tree_foreach(vma, &mapping->i_mmap, 0, ULONG_MAX) {
+		vma_interval_tree_foreach(vma, mapping, 0, ULONG_MAX) {
 			pgoff_t pgoff;
 
 			if (vma->vm_mm == t->mm &&
diff --git a/mm/memory.c b/mm/memory.c
index 87db93f35bcf..6ce92badc38a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4360,7 +4360,7 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 	return wp_page_copy(vmf);
 }
 
-static inline void unmap_mapping_range_tree(struct rb_root_cached *root,
+static inline void unmap_mapping_range_tree(struct address_space *mapping,
 					    pgoff_t first_index,
 					    pgoff_t last_index,
 					    struct zap_details *details)
@@ -4369,7 +4369,7 @@ static inline void unmap_mapping_range_tree(struct rb_root_cached *root,
 	unsigned long start, size;
 	struct mmu_gather tlb;
 
-	vma_interval_tree_foreach(vma, root, first_index, last_index) {
+	vma_interval_tree_foreach(vma, mapping, first_index, last_index) {
 		const pgoff_t start_idx = max(first_index, vma->vm_pgoff);
 		const pgoff_t end_idx = min(last_index, vma_last_pgoff(vma)) + 1;
 
@@ -4411,7 +4411,7 @@ void unmap_mapping_folio(struct folio *folio)
 
 	i_mmap_lock_read(mapping);
 	if (unlikely(mapping_mapped(mapping)))
-		unmap_mapping_range_tree(&mapping->i_mmap, first_index,
+		unmap_mapping_range_tree(mapping, first_index,
 					 last_index, &details);
 	i_mmap_unlock_read(mapping);
 }
@@ -4441,7 +4441,7 @@ void unmap_mapping_pages(struct address_space *mapping, pgoff_t start,
 
 	i_mmap_lock_read(mapping);
 	if (unlikely(mapping_mapped(mapping)))
-		unmap_mapping_range_tree(&mapping->i_mmap, first_index,
+		unmap_mapping_range_tree(mapping, first_index,
 					 last_index, &details);
 	i_mmap_unlock_read(mapping);
 }
diff --git a/mm/mmap.c b/mm/mmap.c
index 2311ae7c2ff4..2f22fb0d068d 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1830,8 +1830,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 				mapping_allow_writable(mapping);
 			flush_dcache_mmap_lock(mapping);
 			/* insert tmp into the share list, just after mpnt */
-			vma_interval_tree_insert_after(tmp, mpnt,
-					&mapping->i_mmap);
+			vma_interval_tree_insert_after(tmp, mpnt, mapping);
 			flush_dcache_mmap_unlock(mapping);
 			i_mmap_unlock_write(mapping);
 		}
diff --git a/mm/nommu.c b/mm/nommu.c
index 852ec9bd0505..13023d73d1e4 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -569,7 +569,7 @@ static void setup_vma_to_mm(struct vm_area_struct *vma, struct mm_struct *mm)
 
 		i_mmap_lock_write(mapping);
 		flush_dcache_mmap_lock(mapping);
-		vma_interval_tree_insert(vma, &mapping->i_mmap);
+		vma_interval_tree_insert(vma, mapping);
 		flush_dcache_mmap_unlock(mapping);
 		i_mmap_unlock_write(mapping);
 	}
@@ -585,7 +585,7 @@ static void cleanup_vma_from_mm(struct vm_area_struct *vma)
 
 		i_mmap_lock_write(mapping);
 		flush_dcache_mmap_lock(mapping);
-		vma_interval_tree_remove(vma, &mapping->i_mmap);
+		vma_interval_tree_remove(vma, mapping);
 		flush_dcache_mmap_unlock(mapping);
 		i_mmap_unlock_write(mapping);
 	}
@@ -1843,7 +1843,7 @@ int nommu_shrink_inode_mappings(struct inode *inode, size_t size,
 	i_mmap_lock_read(inode->i_mapping);
 
 	/* search for VMAs that fall within the dead zone */
-	vma_interval_tree_foreach(vma, &inode->i_mapping->i_mmap, low, high) {
+	vma_interval_tree_foreach(vma, inode->i_mapping, low, high) {
 		/* found one - only interested if it's shared out of the page
 		 * cache */
 		if (vma->vm_flags & VM_SHARED) {
@@ -1859,7 +1859,7 @@ int nommu_shrink_inode_mappings(struct inode *inode, size_t size,
 	 * we don't check for any regions that start beyond the EOF as there
 	 * shouldn't be any
 	 */
-	vma_interval_tree_foreach(vma, &inode->i_mapping->i_mmap, 0, ULONG_MAX) {
+	vma_interval_tree_foreach(vma, inode->i_mapping, 0, ULONG_MAX) {
 		if (!(vma->vm_flags & VM_SHARED))
 			continue;
 
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 3ae2586ff45b..490a14691660 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -810,7 +810,7 @@ int walk_page_mapping(struct address_space *mapping, pgoff_t first_index,
 		return -EINVAL;
 
 	lockdep_assert_held(&mapping->i_mmap_rwsem);
-	vma_interval_tree_foreach(vma, &mapping->i_mmap, first_index,
+	vma_interval_tree_foreach(vma, mapping, first_index,
 				  first_index + nr - 1) {
 		/* Clip to the vma */
 		vba = vma->vm_pgoff;
diff --git a/mm/rmap.c b/mm/rmap.c
index 26166a6b8cb9..73673cd3961e 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -3053,8 +3053,7 @@ static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
 		i_mmap_lock_read(mapping);
 	}
 lookup:
-	vma_interval_tree_foreach(vma, &mapping->i_mmap,
-			pgoff_start, pgoff_end) {
+	vma_interval_tree_foreach(vma, mapping, pgoff_start, pgoff_end) {
 		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
 
 		VM_BUG_ON_VMA(address == -EFAULT, vma);
diff --git a/mm/vma.c b/mm/vma.c
index 9eea2850818a..ce4ec4b71138 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -234,7 +234,7 @@ static void __vma_link_file(struct vm_area_struct *vma,
 		mapping_allow_writable(mapping);
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_insert(vma, &mapping->i_mmap);
+	vma_interval_tree_insert(vma, mapping);
 	flush_dcache_mmap_unlock(mapping);
 }
 
@@ -248,7 +248,7 @@ static void __remove_shared_vm_struct(struct vm_area_struct *vma,
 		mapping_unmap_writable(mapping);
 
 	flush_dcache_mmap_lock(mapping);
-	vma_interval_tree_remove(vma, &mapping->i_mmap);
+	vma_interval_tree_remove(vma, mapping);
 	flush_dcache_mmap_unlock(mapping);
 }
 
@@ -319,10 +319,9 @@ static void vma_prepare(struct vma_prepare *vp)
 
 	if (vp->file) {
 		flush_dcache_mmap_lock(vp->mapping);
-		vma_interval_tree_remove(vp->vma, &vp->mapping->i_mmap);
+		vma_interval_tree_remove(vp->vma, vp->mapping);
 		if (vp->adj_next)
-			vma_interval_tree_remove(vp->adj_next,
-						 &vp->mapping->i_mmap);
+			vma_interval_tree_remove(vp->adj_next, vp->mapping);
 	}
 
 }
@@ -340,9 +339,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 {
 	if (vp->file) {
 		if (vp->adj_next)
-			vma_interval_tree_insert(vp->adj_next,
-						 &vp->mapping->i_mmap);
-		vma_interval_tree_insert(vp->vma, &vp->mapping->i_mmap);
+			vma_interval_tree_insert(vp->adj_next, vp->mapping);
+		vma_interval_tree_insert(vp->vma, vp->mapping);
 		flush_dcache_mmap_unlock(vp->mapping);
 	}
 
diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
index 64164e25658f..94442b29458d 100644
--- a/tools/testing/vma/include/stubs.h
+++ b/tools/testing/vma/include/stubs.h
@@ -258,12 +258,12 @@ static inline void vm_acct_memory(long pages)
 }
 
 static inline void vma_interval_tree_insert(struct vm_area_struct *vma,
-					    struct rb_root_cached *rb)
+					    struct address_space *mapping)
 {
 }
 
 static inline void vma_interval_tree_remove(struct vm_area_struct *vma,
-					    struct rb_root_cached *rb)
+					    struct address_space *mapping)
 {
 }
 

-- 
2.55.0

