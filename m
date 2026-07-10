Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eCNeNYEHVGpjhAMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:41 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E29745FB7
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UJnlrTyq;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF5210E4FD;
	Sun, 12 Jul 2026 21:30:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF6B10E22D;
 Fri, 10 Jul 2026 20:28:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2FAF260051;
 Fri, 10 Jul 2026 20:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCC91F00A3A;
 Fri, 10 Jul 2026 20:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783715323;
 bh=2+OkEViyUBUTI9uYLEX4a4/L0I2mHL2JL8LovbGGiMs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=UJnlrTyqmIX76dhyuIJH+ZWeuwY2uSvegVNMHFmEwJS5ocaNZYISJS5JyWmBkSzbH
 UKl7cX8yUe6IAwGKYMBvQ1AtAheCCYRuKTz3ZwBjHtWknVjpRaA2L1umW1nd+gocfN
 uYSLyXTLS9g/m49T3bKQBwJ6bVtk02YqDXiOTC3Z0Ae1w7haCafZThtvQIsOsq/xD2
 TyOEZJuaBvJm3nFlQnmL5EMx7WPZf7duGBLnLNoh4wgb9e/im1OGNIk33fMzJZFzeH
 8IMw/hMYKsEbQCSkfHU9sEt4oreIes1GlIljfxrfCHA321k3WfSaKpA6UXcsWBD0jS
 PXToqOuC7BRlA==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Fri, 10 Jul 2026 21:17:10 +0100
Subject: [PATCH v2 29/33] mm/vma: introduce and use vma_set_pgoff()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-b4-pre-scalable-cow-v2-29-2a5aa403d977@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6848; i=ljs@kernel.org;
 h=from:subject:message-id; bh=lsNQUYSqY8ftQ/S4LD1hHSt9yR5KwVcyJgXwScgbugs=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLICg21rKw7tulL8I+ZRxy4Dt53VciHnrd73X9PobOva3
 V6pJ2fbUcrCIMbFICumyPL8i/j+IJGweZ0X/N1g5rAygQxh4OIUgIlYvGX4Xz5p+j7GExfu3Dws
 dUiu/h7j+1myno/eP78s28f/8YCc51SG/4VH5p2X8H/x3WJ6GqdZs/vz0HfMsw8mG4jETHd4vdf
 pKRsA
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
X-Rspamd-Queue-Id: 37E29745FB7

In order to lay the foundation for work that permits us to track the
virtual page offset of MAP_PRIVATE file-backed mappings, we abstract the
assignment of vma->vm_pgoff to vma_set_pgoff().

We additionally add a lock check here using the newly introduced
vma_assert_can_modify(). This asserts the VMA write lock if the VMA is
attached.

We also assert that, if this is an anonymous VMA and unfaulted, that its
(virtual) page offset is equal to the page offset of the VMA's address.

We must be careful about MAP_PRIVATE-/dev/zero which violates fundamental
assumptions about anonymous memory, so we check for !vma->vm_file after
using vma_is_anonymous() which these mappings satisfy.

Additionally, we only perform the assert if CONFIG_MMU is defined, as nommu
does not set vma->vm_pgoff = addr >> PAGE_SHIFT. This isn't really relevant
to rmap as it has no anon rmap (nor needs it), but we must avoid it
asserting falsely.

All of this logic is kept in assert_sane_pgoff() to keep things clear.

In order to maintain correctness given this assert, we also update
__install_special_mapping() to invoke vma_set_range() after it's set
vma->vm_ops (which determine whether the VMA is anonymous or not).

We do not use vma_set_pgoff() in vm_area_init_from(), as at the point of
forking, we don't necessarily have correct locking state.

Updating vma_set_range() covers most cases, but in addition to this we also
update insert_vm_struct(), compat_set_vma_from_desc() and nommu callers.

We also update vma_add_pgoff() and vma_sub_pgoff() to use vma_set_pgoff().

While we're here, we drop a BUG_ON() and update insert_vm_struct()'s
comment to reflect the fact anonymous mappings can be added here.

Finally, we update the CONFIG_MMU, CONFIG_PER_VMA_LOCK defines in the VMA
userland tests so IS_ENABLED() will work correctly with them.

No functional change intended.

Reviewed-by: Pedro Falcato <pfalcato@suse.de>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/nommu.c                       |  2 +-
 mm/vma.c                         | 14 +++++++-------
 mm/vma.h                         | 35 ++++++++++++++++++++++++++++++++---
 tools/testing/vma/vma_internal.h |  4 ++--
 4 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/mm/nommu.c b/mm/nommu.c
index 2a0136f6081d..21cbe8b093fc 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1062,7 +1062,7 @@ unsigned long do_mmap(struct file *file,
 	region->vm_pgoff = pgoff;
 
 	vm_flags_init(vma, vm_flags);
-	vma->vm_pgoff = pgoff;
+	vma_set_pgoff(vma, pgoff);
 
 	if (file) {
 		region->vm_file = get_file(file);
diff --git a/mm/vma.c b/mm/vma.c
index ec64e179d2f9..7c75dd78edef 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -81,7 +81,7 @@ static void vma_set_range(struct vm_area_struct *vma, unsigned long start,
 			  unsigned long end, pgoff_t pgoff)
 {
 	__vma_set_range(vma, start, end);
-	vma->vm_pgoff = pgoff;
+	vma_set_pgoff(vma, pgoff);
 }
 
 /* Was this VMA ever forked from a parent, i.e. maybe contains CoW mappings? */
@@ -3347,9 +3347,9 @@ int __vm_munmap(unsigned long start, size_t len, bool unlock)
 	return ret;
 }
 
-/* Insert vm structure into process list sorted by address
- * and into the inode's i_mmap tree.  If vm_file is non-NULL
- * then i_mmap_rwsem is taken here.
+/*
+ * Insert vm structure into process list sorted by address
+ * and into the inode's i_mmap tree if file-backed.
  */
 int insert_vm_struct(struct mm_struct *mm, struct vm_area_struct *vma)
 {
@@ -3375,8 +3375,8 @@ int insert_vm_struct(struct mm_struct *mm, struct vm_area_struct *vma)
 	 * Similarly in do_mmap and in do_brk_flags.
 	 */
 	if (vma_is_anonymous(vma)) {
-		BUG_ON(vma->anon_vma);
-		vma->vm_pgoff = vma->vm_start >> PAGE_SHIFT;
+		WARN_ON_ONCE(vma->anon_vma);
+		vma_set_pgoff(vma, vma->vm_start >> PAGE_SHIFT);
 	}
 
 	if (vma_link(mm, vma)) {
@@ -3422,7 +3422,6 @@ struct vm_area_struct *__install_special_mapping(
 	if (unlikely(vma == NULL))
 		return ERR_PTR(-ENOMEM);
 
-	vma_set_range(vma, addr, addr + len, 0);
 	vm_flags |= mm->def_flags | VM_DONTEXPAND;
 	if (pgtable_supports_soft_dirty())
 		vm_flags |= VM_SOFTDIRTY;
@@ -3431,6 +3430,7 @@ struct vm_area_struct *__install_special_mapping(
 
 	vma->vm_ops = ops;
 	vma->vm_private_data = priv;
+	vma_set_range(vma, addr, addr + len, 0);
 
 	ret = insert_vm_struct(mm, vma);
 	if (ret)
diff --git a/mm/vma.h b/mm/vma.h
index 40effaa3ebe4..58f48609ce22 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -247,16 +247,45 @@ static inline pgoff_t vmg_end_pgoff(const struct vma_merge_struct *vmg)
 	return vmg_start_pgoff(vmg) + vmg_pages(vmg);
 }
 
+static inline void assert_sane_pgoff(struct vm_area_struct *vma, pgoff_t pgoff)
+{
+	/* nommu doesn't set a virtual pgoff for anon VMAs. */
+	if (!IS_ENABLED(CONFIG_MMU))
+		return;
+	/*
+	 * File-backed VMAs have arbitrary page offset (either page offset into
+	 * file or for pfnmap the PFN of the start of the range or drivers may
+	 * set arbitrary page offset).
+	 */
+	if (!vma_is_anonymous(vma))
+		return;
+	/* MAP_PRIVATE-/dev/zero is anon, non-NULL vm_file, but has file pgoff. */
+	if (vma->vm_file)
+		return;
+	/* If faulted in, could have been remapped. */
+	if (vma->anon_vma)
+		return;
+	/* OK this is really an anon VMA - expect virtual page offset. */
+	VM_WARN_ON_ONCE(pgoff != vma->vm_start >> PAGE_SHIFT);
+}
+
+static inline void vma_set_pgoff(struct vm_area_struct *vma, pgoff_t pgoff)
+{
+	vma_assert_can_modify(vma);
+	assert_sane_pgoff(vma, pgoff);
+	vma->vm_pgoff = pgoff;
+}
+
 static inline void vma_add_pgoff(struct vm_area_struct *vma, pgoff_t delta)
 {
 	vma_assert_can_modify(vma);
-	vma->vm_pgoff += delta;
+	vma_set_pgoff(vma, vma_start_pgoff(vma) + delta);
 }
 
 static inline void vma_sub_pgoff(struct vm_area_struct *vma, pgoff_t delta)
 {
 	vma_assert_can_modify(vma);
-	vma->vm_pgoff -= delta;
+	vma_set_pgoff(vma, vma_start_pgoff(vma) - delta);
 }
 
 #define VMG_STATE(name, mm_, vmi_, start_, end_, vma_flags_, pgoff_)	\
@@ -331,7 +360,7 @@ static inline void compat_set_vma_from_desc(struct vm_area_struct *vma,
 	 */
 
 	/* Mutable fields. Populated with initial state. */
-	vma->vm_pgoff = desc->pgoff;
+	vma_set_pgoff(vma, desc->pgoff);
 	if (desc->vm_file != vma->vm_file)
 		vma_set_file(vma, desc->vm_file);
 	vma->flags = desc->vma_flags;
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index e12ab2c80f95..4f6c5666ac07 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -14,8 +14,8 @@
 
 #include <stdlib.h>
 
-#define CONFIG_MMU
-#define CONFIG_PER_VMA_LOCK
+#define CONFIG_MMU		1
+#define CONFIG_PER_VMA_LOCK	1
 
 #ifdef __CONCAT
 #undef __CONCAT

-- 
2.55.0

