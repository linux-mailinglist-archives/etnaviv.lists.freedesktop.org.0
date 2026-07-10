Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 55WWM4MHVGqMhAMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:43 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A390F745FD1
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=W7uhOJok;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214F010E506;
	Sun, 12 Jul 2026 21:30:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2236289361;
 Fri, 10 Jul 2026 20:24:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D9E5F41B1A;
 Fri, 10 Jul 2026 20:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3C11F00A3A;
 Fri, 10 Jul 2026 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783715091;
 bh=C9U7hTVIV5hnW3Iy6tzDPxArKTc/td9u7V5EE/DSgA8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=W7uhOJokhKc2gJUfGeoUmCzknt4Uxys2U+9X59vh+pxKi5io2g2zMfJcd7yhqe+Rz
 PJuzoJIGnd3IH7hewvWSxE5ZTmcXH6LdeBTOkn/+XgwR9cqd6axeVqm1wxysu08ieN
 MLVpRkBnA0838K8Rrt8GC8FcdYZk8MTw62dLxILsRnOz2/SC4Dv9NtLxpF37T0uAdj
 VJEdaWU+Rv29jCHBWZafM0pjlpkfNbnmHg4dVJxwp5wGPBCtM2aP7vZJ7HTPwMkCkm
 XljXzGGXS0Cpa8u/2enRoxyu8aqSQAUNeUJ1sSuPOzOysHNf2I58eZf7+Fp8a5rNPh
 318DpOBchn2jQ==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Fri, 10 Jul 2026 21:17:00 +0100
Subject: [PATCH v2 19/33] mm: prefer vma_[start,end]_pgoff() to
 vma->vm_pgoff in kernel/
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-b4-pre-scalable-cow-v2-19-2a5aa403d977@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11256; i=ljs@kernel.org;
 h=from:subject:message-id; bh=0R0W7VTOgU1IPpg8ezqD30zdmiulVdYqX8Tjb5nSXd4=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLICg230KqLcZxxjPdSmk3RkvUZI5Yr7Siffuqxo/H0xZ
 G121+RZHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZiIdRfDHy537lDf6d4PPjFf
 OW++NrVRreKvwy6H2xnT9ZK8tjoWRTL8M5XKqlxwI3v6u/lWb176Vz6e9TjqwvY3u9v4rzx8zvi
 XnxsA
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,surriel.com,linux.dev,suse.de,armlinux.org.uk,siemens-energy.com,HansenPartnership.com,gmx.de,zeniv.linux.org.uk,suse.cz,redhat.com,arm.com,linux.intel.com,intel.com,linaro.org,nvidia.com,linux.alibaba.com,huawei.com,gmail.com,zte.com.cn,sk.com,gourry.net,samsung.com,goodmis.org,efficios.com,alien8.de,zytor.com,mev.co.uk,visionengravers.com,pengutronix.de,ffwll.ch,oss.qualcomm.com,poorly.run,somainline.org,ideasonboard.com,amd.com,ziepe.ca,shazbot.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[122];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A390F745FD1

Be consistent in using vma_start_pgoff() and vma_end_pgoff(), which clearly
indicates which part of the VMA the page offset refers to and aids
greppability.

This is part of a broader series laying the ground to provide a virtual
page offset for MAP_PRIVATE-file backed anon folios.

No functional change intended.

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com> # for kernel/dma
Reviewed-by: Gregory Price <gourry@gourry.net>
Acked-by: Pedro Falcato <pfalcato@suse.de>
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
index d7f3e2c2ecb1..44a092db5d58 100644
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
@@ -7344,6 +7345,7 @@ static int perf_mmap_rb(struct vm_area_struct *vma, struct perf_event *event,
 static int perf_mmap_aux(struct vm_area_struct *vma, struct perf_event *event,
 			 unsigned long nr_pages)
 {
+	const pgoff_t pgoff_start = vma_start_pgoff(vma);
 	long extra = 0, user_extra = nr_pages;
 	u64 aux_offset, aux_size;
 	struct perf_buffer *rb;
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
index ac340a703d06..ae2f3b9f8d50 100644
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
2.55.0

