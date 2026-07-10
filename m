Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UQXeHoMHVGqChAMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:43 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4697745FD2
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=drJA3TiK;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3DA10E50D;
	Sun, 12 Jul 2026 21:30:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5EA10E22D;
 Fri, 10 Jul 2026 20:27:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2CB4C60051;
 Fri, 10 Jul 2026 20:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F841F00A3A;
 Fri, 10 Jul 2026 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783715230;
 bh=IPE+/P9KdKkfiafscak8Qeedwgljtr0X+OnR3tsbkh0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=drJA3TiK+PeoZ2nu79QhphTfcNqJcaVpJ8OrZAJ/WiBLBgSuNTzJICprZt5FC4O9S
 3h2HjqlXf6uHYTGH6HKtyVkmlM9tNpsnzlHgJ8SgIXhPRwO8Mxflc7CI7u/LnJl1jN
 o3Y/oZKScReVzOIjwXvsQpQsUhs+NzRIePHqBDAniSxzca3Wp2d9hKCB6EFAc6Ena5
 9eifILN5EaHhUs5Jl8ljfGagLXkvH/vjQc/WrufaW+JVZZLpI6hJqNBN9v+ubRWI+D
 f8OFGl0Cv9BKeEGVwh9lipVXptpUW5ZjL2aUnSqMgN5SfwTyhiP7bXRjj2XwzYCTtx
 851hK/6GxFGqw==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Fri, 10 Jul 2026 21:17:06 +0100
Subject: [PATCH v2 25/33] mm/vma: make vma_set_range() static, drop
 insert_vm_struct() decl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-b4-pre-scalable-cow-v2-25-2a5aa403d977@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3631; i=ljs@kernel.org;
 h=from:subject:message-id; bh=DYBIxKjyIjg2H1S6yqXRCrIrObFnJroA9O36yuI28hY=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLICg22X7tsrcNZQdubGGY8ZeW1e29V7zlxxOK3+cPbOG
 WeF5aVsOkpZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCR14YM/9R8K5NV5Y2MWF6c
 vSte8e2PzcyIgNeTetd93BU5Q92s+h0jw6WMAI+VUk1/mc91c4Z2cZ/wmvv59r+qxuBd6nsvamy
 S5gAA
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
X-Rspamd-Queue-Id: A4697745FD2

With __install_special_mapping() moved to vma.c, vma_set_range() can be
made into a static function there and is now completely isolated from the
rest of mm.

While we're here, we can also remove the insert_vm_struct() declaration
from mm.h - the function is implemented in vma.c and already declared in
vma.h, and has no users outside of mm.

Also update the VMA userland tests to reflect this change.

No functional change intended.

Reviewed-by: Pedro Falcato <pfalcato@suse.de>
Reviewed-by: Gregory Price <gourry@gourry.net>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 include/linux/mm.h         | 1 -
 mm/internal.h              | 9 ---------
 mm/vma.c                   | 8 ++++++++
 tools/testing/vma/shared.c | 9 ---------
 tools/testing/vma/shared.h | 5 -----
 5 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3d69b597b9b1..762313b47301 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4130,7 +4130,6 @@ void anon_rmap_tree_verify(struct anon_vma_chain *avc);
 
 /* mmap.c */
 extern int __vm_enough_memory(const struct mm_struct *mm, long pages, int cap_sys_admin);
-extern int insert_vm_struct(struct mm_struct *, struct vm_area_struct *);
 extern void exit_mmap(struct mm_struct *);
 bool mmap_read_lock_maybe_expand(struct mm_struct *mm, struct vm_area_struct *vma,
 				 unsigned long addr, bool write);
diff --git a/mm/internal.h b/mm/internal.h
index 01a762bcc2b2..2c650d280e90 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1540,15 +1540,6 @@ extern bool mirrored_kernelcore;
 bool memblock_has_mirror(void);
 void memblock_free_all(void);
 
-static __always_inline void vma_set_range(struct vm_area_struct *vma,
-					  unsigned long start, unsigned long end,
-					  pgoff_t pgoff)
-{
-	vma->vm_start = start;
-	vma->vm_end = end;
-	vma->vm_pgoff = pgoff;
-}
-
 static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
 {
 	/*
diff --git a/mm/vma.c b/mm/vma.c
index 5308aa5a8c91..cc0e449ad0be 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -70,6 +70,14 @@ struct mmap_state {
 		.state = VMA_MERGE_START,				\
 	}
 
+static void vma_set_range(struct vm_area_struct *vma, unsigned long start,
+			  unsigned long end, pgoff_t pgoff)
+{
+	vma->vm_start = start;
+	vma->vm_end = end;
+	vma->vm_pgoff = pgoff;
+}
+
 /* Was this VMA ever forked from a parent, i.e. maybe contains CoW mappings? */
 static bool vma_is_fork_child(struct vm_area_struct *vma)
 {
diff --git a/tools/testing/vma/shared.c b/tools/testing/vma/shared.c
index 2565a5aecb80..bea9ea6db02a 100644
--- a/tools/testing/vma/shared.c
+++ b/tools/testing/vma/shared.c
@@ -120,12 +120,3 @@ unsigned long rlimit(unsigned int limit)
 {
 	return (unsigned long)-1;
 }
-
-void vma_set_range(struct vm_area_struct *vma,
-		   unsigned long start, unsigned long end,
-		   pgoff_t pgoff)
-{
-	vma->vm_start = start;
-	vma->vm_end = end;
-	vma->vm_pgoff = pgoff;
-}
diff --git a/tools/testing/vma/shared.h b/tools/testing/vma/shared.h
index 8b9e3b11c3cb..ca4f1238f1c7 100644
--- a/tools/testing/vma/shared.h
+++ b/tools/testing/vma/shared.h
@@ -125,8 +125,3 @@ void __vma_set_dummy_anon_vma(struct vm_area_struct *vma,
 /* Provide a simple dummy VMA/anon_vma dummy setup for testing. */
 void vma_set_dummy_anon_vma(struct vm_area_struct *vma,
 			    struct anon_vma_chain *avc);
-
-/* Helper function to specify a VMA's range. */
-void vma_set_range(struct vm_area_struct *vma,
-		   unsigned long start, unsigned long end,
-		   pgoff_t pgoff);

-- 
2.55.0

