Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c6yCNYEHVGpkhAMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:41 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A5745FB8
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mab6I1St;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1125110E501;
	Sun, 12 Jul 2026 21:30:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B265B89361;
 Fri, 10 Jul 2026 20:25:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8B7A840C4B;
 Fri, 10 Jul 2026 20:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606461F00A3A;
 Fri, 10 Jul 2026 20:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783715138;
 bh=cISQtH1v9odRfIrbAbtNudocrvnlKFEn/zLm3RnWId0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=mab6I1StgAzj9g7uw5lQ/WS5hP///Fjejk+W+vwBcSz7BidfRMMNLWK8hC9Ksatl1
 gswNJV0nG+cI3mkpyGUw9hZtSi8RjZ1Hn0Cks+8M6durix9KxdHBsmsEJpP4uzzED8
 nwaNmCyg7v5aq+9gb6aFja4/BRzqV03uXijWLCJhjJBaKoIksOwwmCoPQNjfcTWVdb
 zpnr4ozejDmTByYn3l1TvntcG2kUv26aOn0O+NTjRuERWfwlgXGwDF2AQ7fQQthSpO
 OM87sySq0K04/Zv6rZAF7yNU1yp1Yno0o5/2J89J8xL9KBaczByOCZaLm6M2KmLaJs
 Zd11QZPEcWKsQ==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Fri, 10 Jul 2026 21:17:02 +0100
Subject: [PATCH v2 21/33] mm: use linear_page_[index, delta]() consistently
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-b4-pre-scalable-cow-v2-21-2a5aa403d977@kernel.org>
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
 kvm@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>, 
 Kai Huang <kai.huang@intel.com>, Ackerley Tng <ackerleytng@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10399; i=ljs@kernel.org;
 h=from:subject:message-id; bh=ckvqCIz6u2cx+l/WDG6gaArVCUWUIRqrGc2wRGUU3cQ=;
 b=kA0DAAoWz53NioHifxQByyZiAGpRUzzIHD/Ww2NC0/pDOgUFGYibcK9BkNhLN7CJLfyH3DJ7B
 oh1BAAWCgAdFiEE5/QXv1IUVp6J0E9Gz53NioHifxQFAmpRUzwACgkQz53NioHifxTDZQD7BkHF
 NX9UQukSdl2VQHKwu0wreg7UTF/+bcMU3geRfBYA/0WbEVtZm+JfAzf9LjseOW526ZEuHJGrzmp
 uZYAiIK0F
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
	RCPT_COUNT_GT_50(0.00)[124];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E5A5745FB8

There are a number of places where we open code what linear_page_index()
and linear_page_delta() calculate.

Replace this code with the appropriate functions for consistency.

No functional change intended.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de> # for DRM
Acked-by: Kai Huang <kai.huang@intel.com> # for sgx
Reviewed-by: Gregory Price <gourry@gourry.net>
Reviewed-by: Pedro Falcato <pfalcato@suse.de> # for mm
Reviewed-by: Ackerley Tng <ackerleytng@google.com> # for guest_memfd
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 arch/arm/mm/fault-armv.c              | 2 +-
 arch/x86/kernel/cpu/sgx/virt.c        | 3 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 3 ++-
 drivers/gpu/drm/gma500/gem.c          | 2 +-
 drivers/gpu/drm/msm/msm_gem.c         | 3 ++-
 drivers/gpu/drm/omapdrm/omap_gem.c    | 5 +++--
 drivers/gpu/drm/tegra/gem.c           | 3 ++-
 drivers/gpu/drm/ttm/ttm_bo_vm.c       | 7 ++++---
 drivers/vfio/pci/nvgrace-gpu/main.c   | 3 ++-
 drivers/vfio/pci/vfio_pci_core.c      | 3 ++-
 mm/nommu.c                            | 2 +-
 mm/vma.c                              | 2 +-
 virt/kvm/guest_memfd.c                | 2 +-
 13 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index b505f1fd7984..2769b0f3325f 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -132,7 +132,7 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
 	pgoff_t pgoff;
 	int aliases = 0;
 
-	pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+	pgoff = linear_page_index(vma, addr);
 
 	/*
 	 * If we have any shared mappings that are in the same mm
diff --git a/arch/x86/kernel/cpu/sgx/virt.c b/arch/x86/kernel/cpu/sgx/virt.c
index db6806c40483..6a1933ddc6fc 100644
--- a/arch/x86/kernel/cpu/sgx/virt.c
+++ b/arch/x86/kernel/cpu/sgx/virt.c
@@ -9,6 +9,7 @@
 #include <linux/miscdevice.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
+#include <linux/pagemap.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/signal.h>
 #include <linux/slab.h>
@@ -41,7 +42,7 @@ static int __sgx_vepc_fault(struct sgx_vepc *vepc,
 	WARN_ON(!mutex_is_locked(&vepc->lock));
 
 	/* Calculate index of EPC page in virtual EPC's page_array */
-	index = vma->vm_pgoff + PFN_DOWN(addr - vma->vm_start);
+	index = linear_page_index(vma, addr);
 
 	epc_page = xa_load(&vepc->page_array, index);
 	if (epc_page)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b0436a1e103f..2e4d6d117ee2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -6,6 +6,7 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 #include <linux/dma-mapping.h>
+#include <linux/pagemap.h>
 #include <linux/shmem_fs.h>
 #include <linux/spinlock.h>
 #include <linux/vmalloc.h>
@@ -188,7 +189,7 @@ static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
 	}
 
 	/* We don't use vmf->pgoff since that has the fake offset: */
-	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
+	pgoff = linear_page_delta(vma, vmf->address);
 
 	pfn = page_to_pfn(pages[pgoff]);
 
diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 88f1e86c8903..2708e8c68f4c 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -288,7 +288,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
 
 	/* Page relative to the VMA start - we must calculate this ourselves
 	   because vmf->pgoff is the fake GEM offset */
-	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
+	page_offset = linear_page_delta(vma, vmf->address);
 
 	/* CPU view of the page, don't go via the GART for CPU writes */
 	if (pobj->stolen)
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index efd3d3c9a449..cbf723a5d86f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -9,6 +9,7 @@
 #include <linux/spinlock.h>
 #include <linux/shmem_fs.h>
 #include <linux/dma-buf.h>
+#include <linux/pagemap.h>
 
 #include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
@@ -360,7 +361,7 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	}
 
 	/* We don't use vmf->pgoff since that has the fake offset: */
-	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
+	pgoff = linear_page_delta(vma, vmf->address);
 
 	pfn = page_to_pfn(pages[pgoff]);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 8e013e4f2c6b..00404fb6c29a 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/pagemap.h>
 #include <linux/seq_file.h>
 #include <linux/shmem_fs.h>
 #include <linux/spinlock.h>
@@ -359,7 +360,7 @@ static vm_fault_t omap_gem_fault_1d(struct drm_gem_object *obj,
 	pgoff_t pgoff;
 
 	/* We don't use vmf->pgoff since that has the fake offset: */
-	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
+	pgoff = linear_page_delta(vma, vmf->address);
 
 	if (omap_obj->pages) {
 		omap_gem_cpu_sync_page(obj, pgoff);
@@ -407,7 +408,7 @@ static vm_fault_t omap_gem_fault_2d(struct drm_gem_object *obj,
 	const int m = DIV_ROUND_UP(omap_obj->width << fmt, PAGE_SIZE);
 
 	/* We don't use vmf->pgoff since that has the fake offset: */
-	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
+	pgoff = linear_page_delta(vma, vmf->address);
 
 	/*
 	 * Actual address we start mapping at is rounded down to previous slot
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 436394e04812..1d8d27a5ea89 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -13,6 +13,7 @@
 #include <linux/dma-buf.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
+#include <linux/pagemap.h>
 #include <linux/vmalloc.h>
 
 #include <drm/drm_drv.h>
@@ -564,7 +565,7 @@ static vm_fault_t tegra_bo_fault(struct vm_fault *vmf)
 	if (!bo->pages)
 		return VM_FAULT_SIGBUS;
 
-	offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
+	offset = linear_page_delta(vma, vmf->address);
 	page = bo->pages[offset];
 
 	return vmf_insert_page(vma, vmf->address, page);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index a80510489c45..88babf435ac2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -32,6 +32,7 @@
 #define pr_fmt(fmt) "[TTM] " fmt
 
 #include <linux/export.h>
+#include <linux/pagemap.h>
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
@@ -208,9 +209,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 	if (unlikely(err != 0))
 		return VM_FAULT_SIGBUS;
 
-	page_offset = ((address - vma->vm_start) >> PAGE_SHIFT) +
-		vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node);
-	page_last = vma_pages(vma) + vma->vm_pgoff -
+	page_offset = linear_page_index(vma, address) -
+		drm_vma_node_start(&bo->base.vma_node);
+	page_last = vma_end_pgoff(vma) -
 		drm_vma_node_start(&bo->base.vma_node);
 
 	if (unlikely(page_offset >= PFN_UP(bo->base.size)))
diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
index d07dcacb76bd..963fd8ded20d 100644
--- a/drivers/vfio/pci/nvgrace-gpu/main.c
+++ b/drivers/vfio/pci/nvgrace-gpu/main.c
@@ -11,6 +11,7 @@
 #include <linux/jiffies.h>
 #include <linux/sched.h>
 #include <linux/pci-p2pdma.h>
+#include <linux/pagemap.h>
 #include <linux/pm_runtime.h>
 #include <linux/memory-failure.h>
 
@@ -385,7 +386,7 @@ static unsigned long addr_to_pgoff(struct vm_area_struct *vma,
 	u64 pgoff = vma->vm_pgoff &
 		((1U << (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
 
-	return ((addr - vma->vm_start) >> PAGE_SHIFT) + pgoff;
+	return linear_page_delta(vma, addr) + pgoff;
 }
 
 static vm_fault_t nvgrace_gpu_vfio_pci_huge_fault(struct vm_fault *vmf,
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 3f11a9624b9c..a113c55845e1 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
+#include <linux/pagemap.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -1780,7 +1781,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 	struct vm_area_struct *vma = vmf->vma;
 	struct vfio_pci_core_device *vdev = vma->vm_private_data;
 	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
-	unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
+	unsigned long pgoff = linear_page_delta(vma, addr);
 	unsigned long pfn = vma_to_pfn(vma) + pgoff;
 	vm_fault_t ret = VM_FAULT_FALLBACK;
 
diff --git a/mm/nommu.c b/mm/nommu.c
index 52074ea90acb..c0a0869cd0d6 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1355,7 +1355,7 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	*region = *vma->vm_region;
 	new->vm_region = region;
 
-	npages = (addr - vma->vm_start) >> PAGE_SHIFT;
+	npages = linear_page_delta(vma, addr);
 
 	if (new_below) {
 		region->vm_top = region->vm_end = new->vm_end = addr;
diff --git a/mm/vma.c b/mm/vma.c
index 4a4d096ba86a..7aa0149f076c 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -517,7 +517,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 		new->vm_end = addr;
 	} else {
 		new->vm_start = addr;
-		new->vm_pgoff += ((addr - vma->vm_start) >> PAGE_SHIFT);
+		new->vm_pgoff += linear_page_delta(vma, addr);
 	}
 
 	err = -ENOMEM;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index db57c5766ab6..f0e5da490866 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -440,7 +440,7 @@ static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpo
 static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
 					     unsigned long addr, pgoff_t *ilx)
 {
-	pgoff_t pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+	pgoff_t pgoff = linear_page_index(vma, addr);
 	struct inode *inode = file_inode(vma->vm_file);
 
 	*ilx = inode->i_ino;

-- 
2.55.0

