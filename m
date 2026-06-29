Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XgEmMDKhQ2phdwoAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:54 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA986E33BD
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fy5hgPIF;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C131F10EC6A;
	Tue, 30 Jun 2026 10:57:50 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F71810E876;
 Mon, 29 Jun 2026 12:25:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 29A9E4094E;
 Mon, 29 Jun 2026 12:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE591F000E9;
 Mon, 29 Jun 2026 12:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782735916;
 bh=wZLLn6w5tKaY1nW+KkITtgwyfLONnb8tW4SFWVp8Sgg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fy5hgPIFV0OpgIW/0nPU7jLTQ8rPiZ8dM8upySZALILoZhYgNzHuFDpmCfg6JWomN
 G0HPTvmQAFebwcgjThqux4FlQ+/BO6XRgEJbIwamZ24hcP+1wgCRotnYnKflTBCJJR
 bpGhjvShcYRZylRyaqINKKmzKch04WcHFUPyws35pHkGRTjBHPqVgAeat0g2pBE/j8
 o1t2l+K+FKK1VISsw0FzfZNZrSQzaWBl/42hcRwpcZICvBxv/Xy4PrKx39z5FkfqVd
 TvkRJba6GypFsA0LGOL+E2NStUyXgzGuaEDWg150uHCn9m0SJvxjVby4OswnV+cS8a
 lxabVOtJQBhVA==
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
Subject: [PATCH 27/30] mm/vma: correct incorrect vma.h inclusion
Date: Mon, 29 Jun 2026 13:23:38 +0100
Message-ID: <22d0f4e3fe11f6fd1312734e242d008267ad142c.1782735110.git.ljs@kernel.org>
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
X-Rspamd-Queue-Id: 6DA986E33BD

The only files which should be including vma.h are the implementation files
for the core VMA logic - vma.c, vma_init.c, and vma_exec.c.

This is in order to allow for userland testing of core VMA logic. In this
cases, vma_internal.h and vma.h are included, providing both the
dependencies upon which the core VMA logic requires and its declarations.

Userland testable VMA logic is achieved by having separate vma_internal.h
implementations for userland and kernel.

Callers other than the core VMA implementation should include internal.h
instead. This header does not need to include vma_internal.h as it only
contains the vma.h declarations, for which the includes already present
suffice.

Update code to reflect this, update comments to reflect the fact there are
3 VMA implementation files and document things more clearly.

While we're here, slightly improve the language of the comment describing
vma_exec.c.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/mmu_notifier.c | 2 +-
 mm/nommu.c        | 1 -
 mm/vma.c          | 4 ++++
 mm/vma.h          | 9 ++++++++-
 mm/vma_exec.c     | 8 ++++++--
 mm/vma_init.c     | 4 ++++
 mm/vma_internal.h | 4 ++--
 7 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 245b74f39f91..df69ba6e797f 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -19,7 +19,7 @@
 #include <linux/sched/mm.h>
 #include <linux/slab.h>
 
-#include "vma.h"
+#include "internal.h"
 
 /* global SRCU for all MMs */
 DEFINE_STATIC_SRCU(srcu);
diff --git a/mm/nommu.c b/mm/nommu.c
index ba1c923c0942..4fef6fbbd6e9 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -41,7 +41,6 @@
 #include <asm/tlbflush.h>
 #include <asm/mmu_context.h>
 #include "internal.h"
-#include "vma.h"
 
 unsigned long highest_memmap_pfn;
 int heap_stack_gap = 0;
diff --git a/mm/vma.c b/mm/vma.c
index d727150e377a..5c3062e0e706 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -4,6 +4,10 @@
  * VMA-specific functions.
  */
 
+/*
+ * To allow for userland testing we place internal dependencies in
+ * vma_internal.h and external VMA API declarations in vma.h.
+ */
 #include "vma_internal.h"
 #include "vma.h"
 
diff --git a/mm/vma.h b/mm/vma.h
index 155eadda47aa..f4f885615a92 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -2,7 +2,14 @@
 /*
  * vma.h
  *
- * Core VMA manipulation API implemented in vma.c.
+ * Core VMA manipulation API implemented in vma.c, vma_init.c and vma_exec.c.
+ *
+ * Note that, in order for VMA logic to be userland testable, this header
+ * intentionally includes no dependencies.
+ *
+ * This is specifically scoped to mm-only. Users of this functionality (other
+ * than the core VMA implementation itself) should not include this header
+ * directly, but rather include internal.h.
  */
 #ifndef __MM_VMA_H
 #define __MM_VMA_H
diff --git a/mm/vma_exec.c b/mm/vma_exec.c
index 0107a6e3918c..c0f7ba2cfb27 100644
--- a/mm/vma_exec.c
+++ b/mm/vma_exec.c
@@ -1,10 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /*
- * Functions explicitly implemented for exec functionality which however are
- * explicitly VMA-only logic.
+ * Functions provided for exec functionality which however are
+ * specifically VMA-only logic.
  */
 
+/*
+ * To allow for userland testing we place internal dependencies in
+ * vma_internal.h and external VMA API declarations in vma.h.
+ */
 #include "vma_internal.h"
 #include "vma.h"
 
diff --git a/mm/vma_init.c b/mm/vma_init.c
index a459669a1654..715feee283f0 100644
--- a/mm/vma_init.c
+++ b/mm/vma_init.c
@@ -5,6 +5,10 @@
  * between CONFIG_MMU and non-CONFIG_MMU kernel configurations.
  */
 
+/*
+ * To allow for userland testing we place internal dependencies in
+ * vma_internal.h and external VMA API declarations in vma.h.
+ */
 #include "vma_internal.h"
 #include "vma.h"
 
diff --git a/mm/vma_internal.h b/mm/vma_internal.h
index 2da6d224c1a8..4d300e7bbaf4 100644
--- a/mm/vma_internal.h
+++ b/mm/vma_internal.h
@@ -2,8 +2,8 @@
 /*
  * vma_internal.h
  *
- * Headers required by vma.c, which can be substituted accordingly when testing
- * VMA functionality.
+ * Headers required by vma.c, vma_init.c and vma_exec.c, which can be
+ * substituted accordingly when testing VMA functionality.
  */
 
 #ifndef __MM_VMA_INTERNAL_H
-- 
2.54.0

