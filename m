Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IitXKjShQ2ptdwoAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:56 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530096E33F3
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jdGf9jH9;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB5710EC81;
	Tue, 30 Jun 2026 10:57:52 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9235110E870;
 Mon, 29 Jun 2026 12:24:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 76CF743E4E;
 Mon, 29 Jun 2026 12:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3A41F00A3D;
 Mon, 29 Jun 2026 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782735892;
 bh=+tfecYI3iCL9+dzv6JtnQtpRoRey92E96q+WqEoW8Sw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jdGf9jH9adsBJRms93JJP2hO4xGy6V0e5hV2nXk2WS0hZ2yJvg9go1tFLhsAXUrnd
 D1dST5LU5l7l/ozI1VERvCoxX9njVJSdFvvIaWCvBDsDWfzkGyRiq325cmVLrry1Zy
 ws0snYdC7Z709CZvZySt0/MydVXYxo6HK0m+11iIQmh+aUD5W6SCmgucHBfO/XgDSB
 dWPU0haqhNHmmmg7aldX6EIdMkp7hJzh0g+78x/8Knt2+ALN7yHG00bcvR6zhVKvcQ
 rMq/f+Xh9kkJlTpeda7U2Jpw4Ur9pBeReuM1xj9AfSoMAEC/ukDTYL0C2FbWs+cPhH
 PIRri4XkVH9Eg==
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
Subject: [PATCH 19/30] mm: use linear_page_[index, delta]() consistently
Date: Mon, 29 Jun 2026 13:23:30 +0100
Message-ID: <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 530096E33F3

There are a number of places where we open code what linear_page_index()
and linear_page_delta() calculate.

Replace this code with the appropriate functions for consistency.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 arch/arm/mm/fault-armv.c              | 2 +-
 arch/x86/kernel/cpu/sgx/virt.c        | 3 ++-
 drivers/comedi/comedi_fops.c          | 3 ++-
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
 14 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index bd1ad4181a53..306cfd7b0765 100644
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
diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index c09bbe04be6c..536c25d8dcee 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -25,6 +25,7 @@
 #include <linux/fs.h>
 #include <linux/comedi/comedidev.h>
 #include <linux/cdev.h>
+#include <linux/pagemap.h>
 
 #include <linux/io.h>
 #include <linux/uaccess.h>
@@ -2462,7 +2463,7 @@ static int comedi_vm_access(struct vm_area_struct *vma, unsigned long addr,
 {
 	struct comedi_buf_map *bm = vma->vm_private_data;
 	unsigned long offset =
-	    addr - vma->vm_start + (vma->vm_pgoff << PAGE_SHIFT);
+	    addr - vma->vm_start + (vma_start_pgoff(vma) << PAGE_SHIFT);
 
 	if (len < 0)
 		return -EINVAL;
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
index a28f1e99362c..55d4937d495a 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
+#include <linux/pagemap.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -1727,7 +1728,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 	struct vm_area_struct *vma = vmf->vma;
 	struct vfio_pci_core_device *vdev = vma->vm_private_data;
 	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
-	unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
+	unsigned long pgoff = linear_page_delta(vma, addr);
 	unsigned long pfn = vma_to_pfn(vma) + pgoff;
 	vm_fault_t ret = VM_FAULT_FALLBACK;
 
diff --git a/mm/nommu.c b/mm/nommu.c
index 60560b2c457e..7333d855e974 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1332,7 +1332,7 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	*region = *vma->vm_region;
 	new->vm_region = region;
 
-	npages = (addr - vma->vm_start) >> PAGE_SHIFT;
+	npages = linear_page_delta(vma, addr);
 
 	if (new_below) {
 		region->vm_top = region->vm_end = new->vm_end = addr;
diff --git a/mm/vma.c b/mm/vma.c
index ee3a8ca13d07..185d07397ca6 100644
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
2.54.0

