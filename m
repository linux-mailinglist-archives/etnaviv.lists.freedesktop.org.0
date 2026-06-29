Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2cIDOjChQ2pEdwoAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:52 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA76E336F
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=kernel.org header.s=k20260515 header.b=PlndaMYO;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3465410EC4D;
	Tue, 30 Jun 2026 10:57:49 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649E010E870;
 Mon, 29 Jun 2026 12:24:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CC197600E2;
 Mon, 29 Jun 2026 12:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC75F1F00A3F;
 Mon, 29 Jun 2026 12:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782735886;
 bh=lsln70Nt2xZ3e+TM/n/yGo1O6uRwImQ7en0yGThaEMY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PlndaMYOEEDo9y/BYx1L4NafUGtOw9hv0rBUhMcjKwlZmqbjc94j2hVFLqS/KvZ+y
 40OFrYDVSSF7T9EypqFSK6TimQk/4XGGd8umptAGTerO+BOZsNYpw3L7GtcNSfPwM7
 SsZ0tc06chaOtQb5ZSfbU6KDl53Cw6DknS3B97eBehCTm8g9K9btYeMFOMNSygzaBK
 EwTmsweFODQqTlA8WvspAXfk0bJC3OwLqAZuwS3SQ5sBHz4xtGlKyMP31PmgDAMTE0
 Mluv0Zrvs/xdiEsrbn9HMSsNhic3GiJi2z1Uh7dcPNVmDO6p0HLYIghRVt2kLheU9D
 UArLqvg1MyX8g==
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
Subject: [PATCH 17/30] mm: prefer vma_[start,
 end]_pgoff() to vma->vm_pgoff in kernel/
Date: Mon, 29 Jun 2026 13:23:28 +0100
Message-ID: <ea87349d63205bf4c26ea79854f179a9bf8cfb0b.1782735110.git.ljs@kernel.org>
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
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_GT_50(0.00)[75];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,kernel.org,siemens-energy.com,HansenPartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52DA76E336F

Be consistent in using vma_start_pgoff() and vma_end_pgoff(), which clearly
indicates which part of the VMA the page offset refers to and aids
greppability.

This is part of a broader series laying the ground to provide a virtual
page offset for MAP_PRIVATE-file backed anon folios.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 kernel/dma/coherent.c      |  7 ++++---
 kernel/dma/direct.c        |  6 ++++--
 kernel/dma/mapping.c       |  8 +++++---
 kernel/dma/ops_helpers.c   |  4 ++--
 kernel/events/core.c       | 20 +++++++++++---------
 kernel/events/uprobes.c    | 11 +++++++----
 kernel/kcov.c              |  2 +-
 kernel/trace/ring_buffer.c |  3 ++-
 8 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index bcdc0f76d2e8..2d3195eb7e83 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -236,14 +236,15 @@ static int __dma_mmap_from_coherent(struct dma_coherent_mem *mem,
 {
 	if (mem && vaddr >= mem->virt_base && vaddr + size <=
 		   (mem->virt_base + ((dma_addr_t)mem->size << PAGE_SHIFT))) {
-		unsigned long off = vma->vm_pgoff;
+		const pgoff_t pgoff_start = vma_start_pgoff(vma);
+		const pgoff_t pgoff_end = vma_end_pgoff(vma);
 		int start = (vaddr - mem->virt_base) >> PAGE_SHIFT;
 		unsigned long user_count = vma_pages(vma);
 		int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
 
 		*ret = -ENXIO;
-		if (off < count && user_count <= count - off) {
-			unsigned long pfn = mem->pfn_base + start + off;
+		if (pgoff_start < count && pgoff_end <= count) {
+			unsigned long pfn = mem->pfn_base + start + pgoff_start;
 			*ret = remap_pfn_range(vma, vma->vm_start, pfn,
 					       user_count << PAGE_SHIFT,
 					       vma->vm_page_prot);
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 4391b797d4db..436310d6e4a2 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -534,6 +534,8 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
 	unsigned long user_count = vma_pages(vma);
 	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
 	unsigned long pfn = PHYS_PFN(dma_to_phys(dev, dma_addr));
+	const pgoff_t pgoff_start = vma_start_pgoff(vma);
+	const pgoff_t pgoff_end = vma_end_pgoff(vma);
 	int ret = -ENXIO;
 
 	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
@@ -545,9 +547,9 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
 	if (dma_mmap_from_global_coherent(vma, cpu_addr, size, &ret))
 		return ret;
 
-	if (vma->vm_pgoff >= count || user_count > count - vma->vm_pgoff)
+	if (pgoff_start >= count || pgoff_end > count)
 		return -ENXIO;
-	return remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
+	return remap_pfn_range(vma, vma->vm_start, pfn + pgoff_start,
 			user_count << PAGE_SHIFT, vma->vm_page_prot);
 }
 
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 4fe04669e5e6..c986639044e9 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -761,12 +761,14 @@ EXPORT_SYMBOL_GPL(dma_free_pages);
 int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
 		size_t size, struct page *page)
 {
-	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	const pgoff_t pgoff_start = vma_start_pgoff(vma);
+	const pgoff_t pgoff_end = vma_end_pgoff(vma);
+	const unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
 
-	if (vma->vm_pgoff >= count || vma_pages(vma) > count - vma->vm_pgoff)
+	if (pgoff_start >= count || pgoff_end > count)
 		return -ENXIO;
 	return remap_pfn_range(vma, vma->vm_start,
-			       page_to_pfn(page) + vma->vm_pgoff,
+			       page_to_pfn(page) + pgoff_start,
 			       vma_pages(vma) << PAGE_SHIFT, vma->vm_page_prot);
 }
 EXPORT_SYMBOL_GPL(dma_mmap_pages);
diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 20caf9cabf69..6b5f9208d31c 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -39,7 +39,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 #ifdef CONFIG_MMU
 	unsigned long user_count = vma_pages(vma);
 	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
-	unsigned long off = vma->vm_pgoff;
+	unsigned long off = vma_start_pgoff(vma);
 	struct page *page = dma_common_vaddr_to_page(cpu_addr);
 	int ret = -ENXIO;
 
@@ -52,7 +52,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 		return -ENXIO;
 
 	return remap_pfn_range(vma, vma->vm_start,
-			page_to_pfn(page) + vma->vm_pgoff,
+			page_to_pfn(page) + vma_start_pgoff(vma),
 			user_count << PAGE_SHIFT, vma->vm_page_prot);
 #else
 	return -ENXIO;
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 954c36e28101..d6d2d557ccb8 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6998,7 +6998,7 @@ static void perf_mmap_open(struct vm_area_struct *vma)
 	refcount_inc(&event->mmap_count);
 	refcount_inc(&event->rb->mmap_count);
 
-	if (vma->vm_pgoff)
+	if (vma_start_pgoff(vma))
 		refcount_inc(&event->rb->aux_mmap_count);
 
 	if (mapped)
@@ -7032,7 +7032,7 @@ static void perf_mmap_close(struct vm_area_struct *vma)
 	 * The AUX buffer is strictly a sub-buffer, serialize using aux_mutex
 	 * to avoid complications.
 	 */
-	if (rb_has_aux(rb) && vma->vm_pgoff == rb->aux_pgoff &&
+	if (rb_has_aux(rb) && vma_start_pgoff(vma) == rb->aux_pgoff &&
 	    refcount_dec_and_mutex_lock(&rb->aux_mmap_count, &rb->aux_mutex)) {
 		/*
 		 * Stop all AUX events that are writing to this buffer,
@@ -7190,7 +7190,8 @@ static int map_range(struct perf_buffer *rb, struct vm_area_struct *vma)
 	 */
 	for (pagenum = 0; pagenum < nr_pages; pagenum++) {
 		unsigned long va = vma->vm_start + PAGE_SIZE * pagenum;
-		struct page *page = perf_mmap_to_page(rb, vma->vm_pgoff + pagenum);
+		struct page *page = perf_mmap_to_page(rb,
+				vma_start_pgoff(vma) + pagenum);
 
 		if (page == NULL) {
 			err = -EINVAL;
@@ -7348,6 +7349,7 @@ static int perf_mmap_aux(struct vm_area_struct *vma, struct perf_event *event,
 	u64 aux_offset, aux_size;
 	struct perf_buffer *rb;
 	int ret, rb_flags = 0;
+	const pgoff_t pgoff_start = vma_start_pgoff(vma);
 
 	rb = event->rb;
 	if (!rb)
@@ -7366,11 +7368,11 @@ static int perf_mmap_aux(struct vm_area_struct *vma, struct perf_event *event,
 	if (aux_offset < perf_data_size(rb) + PAGE_SIZE)
 		return -EINVAL;
 
-	if (aux_offset != vma->vm_pgoff << PAGE_SHIFT)
+	if (aux_offset != pgoff_start << PAGE_SHIFT)
 		return -EINVAL;
 
 	/* already mapped with a different offset */
-	if (rb_has_aux(rb) && rb->aux_pgoff != vma->vm_pgoff)
+	if (rb_has_aux(rb) && rb->aux_pgoff != pgoff_start)
 		return -EINVAL;
 
 	if (aux_size != nr_pages * PAGE_SIZE)
@@ -7400,7 +7402,7 @@ static int perf_mmap_aux(struct vm_area_struct *vma, struct perf_event *event,
 		if (vma->vm_flags & VM_WRITE)
 			rb_flags |= RING_BUFFER_WRITABLE;
 
-		ret = rb_alloc_aux(rb, event, vma->vm_pgoff, nr_pages,
+		ret = rb_alloc_aux(rb, event, pgoff_start, nr_pages,
 				   event->attr.aux_watermark, rb_flags);
 		if (ret) {
 			refcount_dec(&rb->mmap_count);
@@ -7457,7 +7459,7 @@ static int perf_mmap(struct file *file, struct vm_area_struct *vma)
 		if (event->state <= PERF_EVENT_STATE_REVOKED)
 			return -ENODEV;
 
-		if (vma->vm_pgoff == 0)
+		if (!vma_start_pgoff(vma))
 			ret = perf_mmap_rb(vma, event, nr_pages);
 		else
 			ret = perf_mmap_aux(vma, event, nr_pages);
@@ -9884,7 +9886,7 @@ static bool perf_addr_filter_vma_adjust(struct perf_addr_filter *filter,
 					struct perf_addr_filter_range *fr)
 {
 	unsigned long vma_size = vma->vm_end - vma->vm_start;
-	unsigned long off = vma->vm_pgoff << PAGE_SHIFT;
+	unsigned long off = vma_start_pgoff(vma) << PAGE_SHIFT;
 	struct file *file = vma->vm_file;
 
 	if (!perf_addr_filter_match(filter, file, off, vma_size))
@@ -9974,7 +9976,7 @@ void perf_event_mmap(struct vm_area_struct *vma)
 			/* .tid */
 			.start  = vma->vm_start,
 			.len    = vma->vm_end - vma->vm_start,
-			.pgoff  = (u64)vma->vm_pgoff << PAGE_SHIFT,
+			.pgoff  = (u64)vma_start_pgoff(vma) << PAGE_SHIFT,
 		},
 		/* .maj (attr_mmap2 only) */
 		/* .min (attr_mmap2 only) */
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index f23cebacbc6d..244651380ca1 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -144,12 +144,14 @@ static bool valid_vma(struct vm_area_struct *vma, bool is_register)
 
 static unsigned long offset_to_vaddr(struct vm_area_struct *vma, loff_t offset)
 {
-	return vma->vm_start + offset - ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
+	return vma->vm_start + offset -
+		((loff_t)vma_start_pgoff(vma) << PAGE_SHIFT);
 }
 
 static loff_t vaddr_to_offset(struct vm_area_struct *vma, unsigned long vaddr)
 {
-	return ((loff_t)vma->vm_pgoff << PAGE_SHIFT) + (vaddr - vma->vm_start);
+	return ((loff_t)vma_start_pgoff(vma) << PAGE_SHIFT) +
+		(vaddr - vma->vm_start);
 }
 
 /**
@@ -1482,7 +1484,7 @@ static int unapply_uprobe(struct uprobe *uprobe, struct mm_struct *mm)
 		    file_inode(vma->vm_file) != uprobe->inode)
 			continue;
 
-		offset = (loff_t)vma->vm_pgoff << PAGE_SHIFT;
+		offset = (loff_t)vma_start_pgoff(vma) << PAGE_SHIFT;
 		if (uprobe->offset <  offset ||
 		    uprobe->offset >= offset + vma->vm_end - vma->vm_start)
 			continue;
@@ -2453,7 +2455,8 @@ static struct uprobe *find_active_uprobe_speculative(unsigned long bp_vaddr)
 	if (!vm_file)
 		return NULL;
 
-	offset = (loff_t)(vma->vm_pgoff << PAGE_SHIFT) + (bp_vaddr - vma->vm_start);
+	offset = (loff_t)(vma_start_pgoff(vma) << PAGE_SHIFT) +
+		(bp_vaddr - vma->vm_start);
 	uprobe = find_uprobe_rcu(vm_file->f_inode, offset);
 	if (!uprobe)
 		return NULL;
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 1df373fb562b..b19b473c366a 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -512,7 +512,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 
 	spin_lock_irqsave(&kcov->lock, flags);
 	size = kcov->size * sizeof(unsigned long);
-	if (kcov->area == NULL || vma->vm_pgoff != 0 ||
+	if (kcov->area == NULL || vma_start_pgoff(vma) ||
 	    vma->vm_end - vma->vm_start != size) {
 		res = -EINVAL;
 		goto exit;
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 56a328e94395..dfa493d54ef9 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7613,7 +7613,8 @@ static int __rb_inc_dec_mapped(struct ring_buffer_per_cpu *cpu_buffer,
 static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
 			struct vm_area_struct *vma)
 {
-	unsigned long nr_subbufs, nr_pages, nr_vma_pages, pgoff = vma->vm_pgoff;
+	unsigned long nr_subbufs, nr_pages, nr_vma_pages;
+	pgoff_t pgoff = vma_start_pgoff(vma);
 	unsigned int subbuf_pages, subbuf_order;
 	struct page **pages __free(kfree) = NULL;
 	int p = 0, s = 0;
-- 
2.54.0

