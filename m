Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6FG9N4MHVGqThAMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:43 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E754745FDB
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RwSqHlF5;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2924810E6BC;
	Sun, 12 Jul 2026 21:30:40 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD1510E21D;
 Fri, 10 Jul 2026 20:21:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E3CB760051;
 Fri, 10 Jul 2026 20:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BBF1F00A3A;
 Fri, 10 Jul 2026 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783714906;
 bh=6ADg/hEbWmy/12b61reEQKb2Q6dpfi0RDajVlCkBx9A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=RwSqHlF5RvJEEn4ErgWmKYOk3ZNA/NYs5iVUHanpU0fENasllQUkcW9jyApuwPJUj
 a7eN9NLCu0Ex40SgOC5Ag9dwZYp5JwadBsKdnIjIVVwzeZspTkROWs7QVeMFZz1mWO
 hqbxrwH6VSB6kjD1KbfafnfAZjTH35xRIjD2wl9XlX0sHE9H/MpiCs2YTpkCNQ6Ud5
 ZkLqfA1kVv4k2FJ2Zq63YpAwgUQJzKyU02SjWFjZAvR9kBXwvtaLKtdvbq9aMQe7Rr
 aAdi7K9V3jayk8hMKG/qxFbOcOJLwhTs28jRl/n/kTh025kbHDI8CVvk0Tzb/sgyMd
 XUZVvVRrktafA==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Fri, 10 Jul 2026 21:16:52 +0100
Subject: [PATCH v2 11/33] mm/rmap: rename anon_vma_interval_tree_*() to
 anon_rmap_tree_*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-b4-pre-scalable-cow-v2-11-2a5aa403d977@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12674; i=ljs@kernel.org;
 h=from:subject:message-id; bh=QIh/wHED/x3vUIojrTapMUaEqiLB6lsiBuz6hviQqKk=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLICg613Kvj0Tr805Y/Xh4rOO3+1f705tfZh9qG2VVk5t
 VemTC2r6ShlYRDjYpAVU2R5/kV8f5BI2LzOC/5uMHNYmUCGMHBxCsBEiqUZ/vs37Vacemxfzzrm
 6T/Lfz6Oe8A7ScOt3yXny/Gd75l+TghnZFj+cFFc/HN+7gsK87a/nZDv+dvTXND9o8d81k1TdnL
 bBfABAA==
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
X-Rspamd-Queue-Id: 2E754745FDB

To be consistent with the newly renamed mapping_rmap_tree_*(), rename the
anon_vma_interval_tree_*() helpers to anon_rmap_tree_*().

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 include/linux/mm.h                | 27 ++++++++++++---------------
 mm/interval_tree.c                | 30 +++++++++++++++---------------
 mm/ksm.c                          |  4 ++--
 mm/memory-failure.c               |  2 +-
 mm/rmap.c                         | 10 +++++-----
 mm/vma.c                          | 30 +++++++++++++++---------------
 tools/testing/vma/include/stubs.h |  8 ++++----
 7 files changed, 54 insertions(+), 57 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ae7c976b516a..3d69b597b9b1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4110,26 +4110,23 @@ mapping_rmap_tree_iter_next(struct vm_area_struct *vma,
 	     vma; vma = mapping_rmap_tree_iter_next(vma, pgoff_start,	 \
 						    pgoff_last))
 
-void anon_vma_interval_tree_insert(struct anon_vma_chain *avc,
-				   struct anon_vma *anon_vma);
-void anon_vma_interval_tree_remove(struct anon_vma_chain *avc,
-				   struct anon_vma *anon_vma);
-
+void anon_rmap_tree_insert(struct anon_vma_chain *avc,
+			   struct anon_vma *anon_vma);
+void anon_rmap_tree_remove(struct anon_vma_chain *avc,
+			   struct anon_vma *anon_vma);
 struct anon_vma_chain *
-anon_vma_interval_tree_iter_first(struct anon_vma *anon_vma,
-				  pgoff_t pgoff_start, pgoff_t pgoff_last);
+anon_rmap_tree_iter_first(struct anon_vma *anon_vma,
+			  pgoff_t pgoff_start, pgoff_t pgoff_last);
 struct anon_vma_chain *
-anon_vma_interval_tree_iter_next(struct anon_vma_chain *avc,
-				 pgoff_t pgoff_start, pgoff_t pgoff_last);
+anon_rmap_tree_iter_next(struct anon_vma_chain *avc,
+			 pgoff_t pgoff_start, pgoff_t pgoff_last);
 #ifdef CONFIG_DEBUG_VM_RB
-void anon_vma_interval_tree_verify(struct anon_vma_chain *avc);
+void anon_rmap_tree_verify(struct anon_vma_chain *avc);
 #endif
 
-#define anon_vma_interval_tree_foreach(avc, anon_vma, pgoff_start, pgoff_last) \
-	for (avc = anon_vma_interval_tree_iter_first(anon_vma, pgoff_start,    \
-						     pgoff_last);	       \
-	     avc; avc = anon_vma_interval_tree_iter_next(avc, pgoff_start,     \
-							 pgoff_last))
+#define anon_rmap_tree_foreach(avc, anon_vma, pgoff_start, pgoff_last)		 \
+	for (avc = anon_rmap_tree_iter_first(anon_vma, pgoff_start, pgoff_last); \
+	     avc; avc = anon_rmap_tree_iter_next(avc, pgoff_start, pgoff_last))
 
 /* mmap.c */
 extern int __vm_enough_memory(const struct mm_struct *mm, long pages, int cap_sys_admin);
diff --git a/mm/interval_tree.c b/mm/interval_tree.c
index 5bfe95b5cd28..3ae9e106d3af 100644
--- a/mm/interval_tree.c
+++ b/mm/interval_tree.c
@@ -93,41 +93,41 @@ static pgoff_t avc_last_pgoff(struct anon_vma_chain *avc)
 
 INTERVAL_TREE_DEFINE(struct anon_vma_chain, rb, pgoff_t, rb_subtree_last,
 		     avc_start_pgoff, avc_last_pgoff,
-		     static, __anon_vma_interval_tree)
+		     static, __anon_rmap_tree)
 
-void anon_vma_interval_tree_insert(struct anon_vma_chain *avc,
-				   struct anon_vma *anon_vma)
+void anon_rmap_tree_insert(struct anon_vma_chain *avc,
+			   struct anon_vma *anon_vma)
 {
 #ifdef CONFIG_DEBUG_VM_RB
 	avc->cached_vma_start = avc_start_pgoff(avc);
 	avc->cached_vma_last = avc_last_pgoff(avc);
 #endif
-	__anon_vma_interval_tree_insert(avc, &anon_vma->rb_root);
+	__anon_rmap_tree_insert(avc, &anon_vma->rb_root);
 }
 
-void anon_vma_interval_tree_remove(struct anon_vma_chain *avc,
-				   struct anon_vma *anon_vma)
+void anon_rmap_tree_remove(struct anon_vma_chain *avc,
+			   struct anon_vma *anon_vma)
 {
-	__anon_vma_interval_tree_remove(avc, &anon_vma->rb_root);
+	__anon_rmap_tree_remove(avc, &anon_vma->rb_root);
 }
 
 struct anon_vma_chain *
-anon_vma_interval_tree_iter_first(struct anon_vma *anon_vma,
-				  pgoff_t pgoff_start, pgoff_t pgoff_last)
+anon_rmap_tree_iter_first(struct anon_vma *anon_vma,
+			  pgoff_t pgoff_start, pgoff_t pgoff_last)
 {
-	return __anon_vma_interval_tree_iter_first(&anon_vma->rb_root,
-						   pgoff_start, pgoff_last);
+	return __anon_rmap_tree_iter_first(&anon_vma->rb_root,
+					   pgoff_start, pgoff_last);
 }
 
 struct anon_vma_chain *
-anon_vma_interval_tree_iter_next(struct anon_vma_chain *avc,
-				  pgoff_t pgoff_start, pgoff_t pgoff_last)
+anon_rmap_tree_iter_next(struct anon_vma_chain *avc,
+			 pgoff_t pgoff_start, pgoff_t pgoff_last)
 {
-	return __anon_vma_interval_tree_iter_next(avc, pgoff_start, pgoff_last);
+	return __anon_rmap_tree_iter_next(avc, pgoff_start, pgoff_last);
 }
 
 #ifdef CONFIG_DEBUG_VM_RB
-void anon_vma_interval_tree_verify(struct anon_vma_chain *avc)
+void anon_rmap_tree_verify(struct anon_vma_chain *avc)
 {
 	WARN_ON_ONCE(avc->cached_vma_start != avc_start_pgoff(avc));
 	WARN_ON_ONCE(avc->cached_vma_last != avc_last_pgoff(avc));
diff --git a/mm/ksm.c b/mm/ksm.c
index 10fccc22e5f3..b3fb59a0e0d1 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -3187,7 +3187,7 @@ void rmap_walk_ksm(struct folio *folio, struct rmap_walk_control *rwc)
 			anon_vma_lock_read(anon_vma);
 		}
 
-		anon_vma_interval_tree_foreach(vmac, anon_vma, 0, ULONG_MAX) {
+		anon_rmap_tree_foreach(vmac, anon_vma, 0, ULONG_MAX) {
 
 			cond_resched();
 			vma = vmac->vma;
@@ -3248,7 +3248,7 @@ void collect_procs_ksm(const struct folio *folio, const struct page *page,
 				task_early_kill(tsk, force_early);
 			if (!t)
 				continue;
-			anon_vma_interval_tree_foreach(vmac, av, 0, ULONG_MAX) {
+			anon_rmap_tree_foreach(vmac, av, 0, ULONG_MAX) {
 				vma = vmac->vma;
 				if (vma->vm_mm == t->mm) {
 					addr = rmap_item->address & PAGE_MASK;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 24d660c32058..aaf14608b30e 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -564,7 +564,7 @@ static void collect_procs_anon(const struct folio *folio,
 
 		if (!t)
 			continue;
-		anon_vma_interval_tree_foreach(vmac, av, pgoff, pgoff) {
+		anon_rmap_tree_foreach(vmac, av, pgoff, pgoff) {
 			vma = vmac->vma;
 			if (vma->vm_mm != t->mm)
 				continue;
diff --git a/mm/rmap.c b/mm/rmap.c
index 6d4423a16c8b..e854679553b9 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -211,7 +211,7 @@ int __anon_vma_prepare(struct vm_area_struct *vma)
 	if (likely(!vma->anon_vma)) {
 		vma->anon_vma = anon_vma;
 		anon_vma_chain_assign(vma, avc, anon_vma);
-		anon_vma_interval_tree_insert(avc, anon_vma);
+		anon_rmap_tree_insert(avc, anon_vma);
 		anon_vma->num_active_vmas++;
 		allocated = NULL;
 		avc = NULL;
@@ -354,7 +354,7 @@ int anon_vma_clone(struct vm_area_struct *dst, struct vm_area_struct *src,
 	list_for_each_entry_reverse(avc, &dst->anon_vma_chain, same_vma) {
 		struct anon_vma *anon_vma = avc->anon_vma;
 
-		anon_vma_interval_tree_insert(avc, anon_vma);
+		anon_rmap_tree_insert(avc, anon_vma);
 		if (operation == VMA_OP_FORK)
 			maybe_reuse_anon_vma(dst, anon_vma);
 	}
@@ -434,7 +434,7 @@ int anon_vma_fork(struct vm_area_struct *vma, struct vm_area_struct *pvma)
 	anon_vma_chain_assign(vma, avc, anon_vma);
 	/* Now let rmap see it. */
 	anon_vma_lock_write(anon_vma);
-	anon_vma_interval_tree_insert(avc, anon_vma);
+	anon_rmap_tree_insert(avc, anon_vma);
 	anon_vma->parent->num_children++;
 	anon_vma_unlock_write(anon_vma);
 
@@ -499,7 +499,7 @@ void unlink_anon_vmas(struct vm_area_struct *vma)
 	list_for_each_entry_safe(avc, next, &vma->anon_vma_chain, same_vma) {
 		struct anon_vma *anon_vma = avc->anon_vma;
 
-		anon_vma_interval_tree_remove(avc, anon_vma);
+		anon_rmap_tree_remove(avc, anon_vma);
 
 		/*
 		 * Leave empty anon_vmas on the list - we'll need
@@ -2988,7 +2988,7 @@ static void rmap_walk_anon(struct folio *folio,
 
 	pgoff_start = folio_pgoff(folio);
 	pgoff_end = pgoff_start + folio_nr_pages(folio) - 1;
-	anon_vma_interval_tree_foreach(avc, anon_vma, pgoff_start, pgoff_end) {
+	anon_rmap_tree_foreach(avc, anon_vma, pgoff_start, pgoff_end) {
 		struct vm_area_struct *vma = avc->vma;
 		unsigned long address = vma_address(vma, pgoff_start,
 				folio_nr_pages(folio));
diff --git a/mm/vma.c b/mm/vma.c
index 2cd70f1d4db7..35ba3475128f 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -258,30 +258,30 @@ static void __remove_shared_vm_struct(struct vm_area_struct *vma,
  *
  * Before updating the vma's vm_start / vm_end / vm_pgoff fields, the
  * vma must be removed from the anon_vma's interval trees using
- * anon_vma_interval_tree_pre_update_vma().
+ * anon_rmap_tree_pre_update_vma().
  *
  * After the update, the vma will be reinserted using
- * anon_vma_interval_tree_post_update_vma().
+ * anon_rmap_tree_post_update_vma().
  *
  * The entire update must be protected by exclusive mmap_lock and by
  * the root anon_vma's mutex.
  */
 static void
-anon_vma_interval_tree_pre_update_vma(struct vm_area_struct *vma)
+anon_rmap_tree_pre_update_vma(struct vm_area_struct *vma)
 {
 	struct anon_vma_chain *avc;
 
 	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
-		anon_vma_interval_tree_remove(avc, avc->anon_vma);
+		anon_rmap_tree_remove(avc, avc->anon_vma);
 }
 
 static void
-anon_vma_interval_tree_post_update_vma(struct vm_area_struct *vma)
+anon_rmap_tree_post_update_vma(struct vm_area_struct *vma)
 {
 	struct anon_vma_chain *avc;
 
 	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
-		anon_vma_interval_tree_insert(avc, avc->anon_vma);
+		anon_rmap_tree_insert(avc, avc->anon_vma);
 }
 
 /*
@@ -312,9 +312,9 @@ static void vma_prepare(struct vma_prepare *vp)
 
 	if (vp->anon_vma) {
 		anon_vma_lock_write(vp->anon_vma);
-		anon_vma_interval_tree_pre_update_vma(vp->vma);
+		anon_rmap_tree_pre_update_vma(vp->vma);
 		if (vp->adj_next)
-			anon_vma_interval_tree_pre_update_vma(vp->adj_next);
+			anon_rmap_tree_pre_update_vma(vp->adj_next);
 	}
 
 	if (vp->file) {
@@ -359,9 +359,9 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 	}
 
 	if (vp->anon_vma) {
-		anon_vma_interval_tree_post_update_vma(vp->vma);
+		anon_rmap_tree_post_update_vma(vp->vma);
 		if (vp->adj_next)
-			anon_vma_interval_tree_post_update_vma(vp->adj_next);
+			anon_rmap_tree_post_update_vma(vp->adj_next);
 		anon_vma_unlock_write(vp->anon_vma);
 	}
 
@@ -677,7 +677,7 @@ void validate_mm(struct mm_struct *mm)
 		if (anon_vma) {
 			anon_vma_lock_read(anon_vma);
 			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
-				anon_vma_interval_tree_verify(avc);
+				anon_rmap_tree_verify(avc);
 			anon_vma_unlock_read(anon_vma);
 		}
 #endif
@@ -3177,11 +3177,11 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 				if (vma_test(vma, VMA_LOCKED_BIT))
 					mm->locked_vm += grow;
 				vm_stat_account(mm, vma->vm_flags, grow);
-				anon_vma_interval_tree_pre_update_vma(vma);
+				anon_rmap_tree_pre_update_vma(vma);
 				vma->vm_end = address;
 				/* Overwrite old entry in mtree. */
 				vma_iter_store_overwrite(&vmi, vma);
-				anon_vma_interval_tree_post_update_vma(vma);
+				anon_rmap_tree_post_update_vma(vma);
 
 				perf_event_mmap(vma);
 			}
@@ -3256,12 +3256,12 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 				if (vma_test(vma, VMA_LOCKED_BIT))
 					mm->locked_vm += grow;
 				vm_stat_account(mm, vma->vm_flags, grow);
-				anon_vma_interval_tree_pre_update_vma(vma);
+				anon_rmap_tree_pre_update_vma(vma);
 				vma->vm_start = address;
 				vma->vm_pgoff -= grow;
 				/* Overwrite old entry in mtree. */
 				vma_iter_store_overwrite(&vmi, vma);
-				anon_vma_interval_tree_post_update_vma(vma);
+				anon_rmap_tree_post_update_vma(vma);
 
 				perf_event_mmap(vma);
 			}
diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
index 3a11547b5bd1..d6136e19a8af 100644
--- a/tools/testing/vma/include/stubs.h
+++ b/tools/testing/vma/include/stubs.h
@@ -271,13 +271,13 @@ static inline void flush_dcache_mmap_unlock(struct address_space *mapping)
 {
 }
 
-static inline void anon_vma_interval_tree_insert(struct anon_vma_chain *avc,
-						 struct anon_vma *anon_vma)
+static inline void anon_rmap_tree_insert(struct anon_vma_chain *avc,
+					 struct anon_vma *anon_vma)
 {
 }
 
-static inline void anon_vma_interval_tree_remove(struct anon_vma_chain *avc,
-						 struct anon_vma *anon_vma)
+static inline void anon_rmap_tree_remove(struct anon_vma_chain *avc,
+					 struct anon_vma *anon_vma)
 {
 }
 

-- 
2.55.0

