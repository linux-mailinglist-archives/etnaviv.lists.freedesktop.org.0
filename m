Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qT9CN4MHVGqOhAMAu9opvQ:T2
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:45 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8502774601A
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Yvcme1ie;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A3E10E77E;
	Sun, 12 Jul 2026 21:30:41 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE05810E50F;
 Fri, 10 Jul 2026 20:24:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A9AD6411DC;
 Fri, 10 Jul 2026 20:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B448D1F00A3A;
 Fri, 10 Jul 2026 20:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783715045;
 bh=7rHiUFVguoq1IEHDVydiWk+wjTNnrgUwNwUljwJg4jE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=Yvcme1ieNXyFDoo+lIS03nV9pipt34r5wD+C/clXyI1xGd4MIhe9cWBew+GBWRUkJ
 OfNs6ewKzvo+PT4kUyxpZzl1C28zcBojxJSpeoM1fltsLT4Q3YftMtg84J6KqN16lM
 i6bmnzRy3cNRGNjTONoKz6tAu0Xm9REPzvoTin9cYBi7f97Cr3waoYlROrRJyJh08B
 iFqx09yKxv+YjA7GXu/KYTgZod4stmW3dMbcoBXT5wmPGSf8M/ZsOcAn4azvutQbxN
 YKaBXd6IIQNWqpqMBTU8pGx5qikO6e/CXGgvZLiiCoSPGHjrXioIbjQ0XF2RIK/9G/
 CmjN3WgETetvA==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Fri, 10 Jul 2026 21:16:58 +0100
Subject: [PATCH v2 17/33] mm: introduce and use linear_page_delta()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-b4-pre-scalable-cow-v2-17-2a5aa403d977@kernel.org>
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
 Ackerley Tng <ackerleytng@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722; i=ljs@kernel.org;
 h=from:subject:message-id; bh=RyHoLL9QYKzn8GmfhUypF1HMy7j9yuNgRKqt7m0CxCM=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLICg20sa5N6ffOdZY/uuM49Q6T0gTqfSuNy/0tvAlWFV
 naFqt7oKGVhEONikBVTZHn+RXx/kEjYvM4L/m4wc1iZQIYwcHEKwEQiUhj+CqbqT5iddiQ5f9qS
 CascLV90qXjKHGEJqw4LrAm3UHI/xcjwb/6q1bkn6llcu88Ye2TFXFveuNVaLfBPeaex5DqGCYy
 MAA==
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
	RCPT_COUNT_GT_50(0.00)[123];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8502774601A

It's often useful to obtain the number of pages a given address lies at
within a VMA.

Add linear_page_delta() to determine this and update linear_page_index() to
make use of it.

Add comments to describe both linear_page_delta() and linear_page_index().

We refer the reader to the comment for vma_start_pgoff() so we don't
duplicate information about the meaning of a VMA's page offset, which is
also less likely to result in bitrot.

No functional change intended.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Gregory Price <gourry@gourry.net>
Reviewed-by: Pedro Falcato <pfalcato@suse.de>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 include/linux/pagemap.h | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 2c3718d592d6..a950070b045f 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -1063,11 +1063,40 @@ static inline pgoff_t folio_pgoff(const struct folio *folio)
 	return folio->index;
 }
 
+/**
+ * linear_page_delta() - Determine the relative page offset of @address within
+ * @vma.
+ * @vma: The VMA in which @address resides.
+ * @address: The address whose relative page offset is required.
+ *
+ * The result is identical for both file-backed and anonymous mappings and
+ * simply determines how many pages @address lies from @vma->vm_start.
+ *
+ * Returns: The number of pages @address is offset by within @vma.
+ */
+static inline pgoff_t linear_page_delta(const struct vm_area_struct *vma,
+					const unsigned long address)
+{
+	return (address - vma->vm_start) >> PAGE_SHIFT;
+}
+
+/**
+ * linear_page_index() - Determine the absolute page offset of @address within
+ * @vma.
+ * @vma: The VMA in which @address resides.
+ * @address: The address whose absolute page offset is required.
+ *
+ * See the comment for vma_start_pgoff() for a description of what the page
+ * offset signifies.
+ *
+ * Returns: The absolute page offset of @address within @vma.
+ */
 static inline pgoff_t linear_page_index(const struct vm_area_struct *vma,
 					const unsigned long address)
 {
 	pgoff_t pgoff;
-	pgoff = (address - vma->vm_start) >> PAGE_SHIFT;
+
+	pgoff = linear_page_delta(vma, address);
 	pgoff += vma->vm_pgoff;
 	return pgoff;
 }
@@ -1219,7 +1248,7 @@ static inline vm_fault_t folio_lock_or_retry(struct folio *folio,
 void folio_wait_bit(struct folio *folio, int bit_nr);
 int folio_wait_bit_killable(struct folio *folio, int bit_nr);
 
-/* 
+/*
  * Wait for a folio to be unlocked.
  *
  * This must be called with the caller "holding" the folio,

-- 
2.55.0

