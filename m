Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8rG7AoUHVGqchAMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:45 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74979746013
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="HJU/LxQF";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F6A10E774;
	Sun, 12 Jul 2026 21:30:40 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6194E10E22D;
 Fri, 10 Jul 2026 20:30:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D58FE60051;
 Fri, 10 Jul 2026 20:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5081F000E9;
 Fri, 10 Jul 2026 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783715416;
 bh=B5I9XJhmOOi1LkWbRSVKnYIkRF+jGCGnmzoiak9EY5o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=HJU/LxQFVzsJlRTCMRzOJHdKDqTBAxtBcBwpt63liPwwYag6kcqfVKglYfllNuHwG
 zruaDbLFSHOKgoo0BqDuxifQenxMZ32LDVjzeICMBYJ3UJv5j+AnJcMgzxnGHtBdeN
 j8C36crjgwo2R/uzmYN1HthGyrQ3fCMsmbG+73WdXAXoxUFqceMyzp9ZW1PdmaRa9O
 G5/VT52++Jk599/Cwob6URDW22K7/Nduaq0RP+KDtJ0pkxdcPa3d89vPvW4V4rHBk/
 CW0bBjmWxC4r28Ips94X2CU8upp1gMEWiWKnHmBXHuAIxpE3/rXj+RtTqbCeQkATao
 rwCQBxnl2483Q==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Fri, 10 Jul 2026 21:17:14 +0100
Subject: [PATCH v2 33/33] tools/testing/vma: output compared expression on
 ASSERT_[EQ, NE]()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-b4-pre-scalable-cow-v2-33-2a5aa403d977@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2588; i=ljs@kernel.org;
 h=from:subject:message-id; bh=G0Z54AjtjNI6CjvRN0QWBiGJMevNN1T++vP+QCfqk78=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLICg+027xOdH8B2QFVjitv8mSdNCqatzzDPuLx5q/P3m
 bsqvNas6ihlYRDjYpAVU2R5/kV8f5BI2LzOC/5uMHNYmUCGMHBxCsBESt8y/M8V4Tz0xp5xXe19
 wcer453cVuotTvQq2Z9Z+MFqXm4M42uG/5UJ81+tnzZdSGb1KWONWwnKD/+4b41bGtXx//vvOW9
 DqtkB
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
X-Rspamd-Queue-Id: 74979746013

Update the macros to output the compared values at hex for easier debugging
when test asserts fail.

We have to be careful not to re-evaluate expressions as they may have
side-effects. So update the code to take local copies and use these for
both the test and the debug output.

Also remove unused IS_SET() macro.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 tools/testing/vma/shared.h | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/tools/testing/vma/shared.h b/tools/testing/vma/shared.h
index ca4f1238f1c7..97cd7a679dc1 100644
--- a/tools/testing/vma/shared.h
+++ b/tools/testing/vma/shared.h
@@ -21,19 +21,35 @@
 		}							\
 	} while (0)
 
-#define ASSERT_TRUE(_expr)						\
-	do {								\
-		if (!(_expr)) {						\
-			fprintf(stderr,					\
-				"Assert FAILED at %s:%d:%s(): %s is FALSE.\n", \
-				__FILE__, __LINE__, __FUNCTION__, #_expr); \
-			return false;					\
-		}							\
+#define __ASSERT_TRUE(_expr, _fmt, ...)					   \
+	do {								   \
+		if (!(_expr)) {						   \
+			fprintf(stderr,					   \
+				"Assert FAILED at %s:%d:%s(): %s is FALSE" \
+				_fmt ".\n",				   \
+				__FILE__, __LINE__, __FUNCTION__, #_expr   \
+				__VA_OPT__(,) __VA_ARGS__);		   \
+			return false;					   \
+		}							   \
 	} while (0)
 
+#define __TO_SCALAR(x)	((unsigned long long)(uintptr_t)(x))
+
+#define ASSERT_TRUE(_expr) __ASSERT_TRUE(_expr, "")
 #define ASSERT_FALSE(_expr) ASSERT_TRUE(!(_expr))
-#define ASSERT_EQ(_val1, _val2) ASSERT_TRUE((_val1) == (_val2))
-#define ASSERT_NE(_val1, _val2) ASSERT_TRUE((_val1) != (_val2))
+#define ASSERT_EQ(_val1, _val2) do {				 \
+	__typeof__(_val1) __val1 = (_val1);			 \
+	__typeof__(_val2) __val2 = (_val2);			 \
+	__ASSERT_TRUE(__val1 == __val2, " (0x%llx != 0x%llx)",	 \
+		      __TO_SCALAR(__val1), __TO_SCALAR(__val2)); \
+	} while (0)
+
+#define ASSERT_NE(_val1, _val2) do {				 \
+	__typeof__(_val1) __val1 = (_val1);			 \
+	__typeof__(_val2) __val2 = (_val2);			 \
+	__ASSERT_TRUE(__val1 != __val2, " (0x%llx == 0x%llx)",	 \
+		      __TO_SCALAR(__val1), __TO_SCALAR(__val2)); \
+	} while (0)
 
 #define ASSERT_FLAGS_SAME_MASK(_flags, _flags_other) \
 	ASSERT_TRUE(vma_flags_same_mask((_flags), (_flags_other)))
@@ -53,8 +69,6 @@
 #define ASSERT_FLAGS_NONEMPTY(_flags) \
 	ASSERT_FALSE(vma_flags_empty(_flags))
 
-#define IS_SET(_val, _flags) ((_val & _flags) == _flags)
-
 extern bool fail_prealloc;
 
 /* Override vma_iter_prealloc() so we can choose to fail it. */

-- 
2.55.0

