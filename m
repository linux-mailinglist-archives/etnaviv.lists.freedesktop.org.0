Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9pbAJIK+T2rQngIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 17:30:10 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C8C732EA5
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 17:30:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=n5NHVUwr;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C5110F0B2;
	Thu,  9 Jul 2026 15:30:08 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE2510E31D
 for <etnaviv@lists.freedesktop.org>; Thu,  9 Jul 2026 15:30:07 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-51c05dcdf49so18492481cf.0
 for <etnaviv@lists.freedesktop.org>; Thu, 09 Jul 2026 08:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1783611006; x=1784215806; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fYSI9yTT5sy6RSjg3MJktJbkZRCOSo/WRgJFUwJppy4=;
 b=n5NHVUwr8Yz7ZxwippJ/0Az5gsT7EifvAxbiuTS0EphQ7CBVcETbjjkbxuAOWSqfAi
 yeYco9B+3z4T+7k3lYYuzcMbP0r/98bLXTRdV0TDqa3bEN0/cBS/PxbOGuAym4APa4aA
 2tM2fs63jlx0nJIhXaF8UzHmkapQnpgUMlHIUtD500yyDckoFb8BX9VEpafPA/BU40MU
 4zgWFsJbdlMncW7cAKCfLoFFmGcRYzZrPTquh6Xs1okhtOEGDz1/sC3lBnbpexUvACNf
 de+6fMuks09EzbNukm/fteLvU0FQyEMA7HCmcf2xx0lja0qOg0LOtJGR5hVgnQfov+N+
 isMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783611006; x=1784215806;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fYSI9yTT5sy6RSjg3MJktJbkZRCOSo/WRgJFUwJppy4=;
 b=U7FKqT5CV9Vfsq3X0sv7HjK+Ncjq5U3ngr1K5Ki3zOzyn8v+jTi1Hz6CjYB7ay1220
 PLZk9OH2rMvDcxK9eMWpSAVIpnpBc2JH2niLLGdvBhTRHiibXuL0AAGtV166fToInKGg
 pbOLmiT9o+HElKrtEQeLs/zTDGmNkbQtszWyqs3T/pxKfMCGZ1fjrBiVfxVOAd6K8dQ5
 58tQxdEoiVhDEpDLzDQqkI6Ilg4hJGa1dIkdJbHWS9nc/wfNKjx/0MYelFDWRHq7+zq+
 HkX9jirfPMUPpbtTaMC3O1hecC6rqkqIWj/Ewv0kMkmRAKvkwJpTXcYXTkmyUwVgKpdm
 aCBw==
X-Forwarded-Encrypted: i=1;
 AHgh+RobEn51iqNoF75hIu1hKdas1kOnEiwjEV+Y9qDTzsrZl6n46ooC1k47VOl8ahIGeXl0XESRUF+6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO3Kp0SDjzXVDzB8UDAeE8BuDvz6nB8+atFgiBev2vJ9lTnS9n
 o9YmchVXr2bTVtAnwnhxLhZFVe+0BmHlrX7KWSOJCUneIghyfO2B21Lpv9EpD77NsTQ=
X-Gm-Gg: AfdE7clwaCIiIM/s2E9698eQ2uTH6Tyj2cEIgISWXaYYZaSCws3/WIL2LimEY2R/LGK
 DO94IMXlznYfW+wXI0+vOtWTN9bb6SV4B2zEK87m12OIMeTssjHU2oHUB0ALvLuz1dSNSr9WGIn
 UDXyv4JW4XY1jofOjuPvWfFVM9HomwGg9pUmHr0x+dW+tRli46EFqHunYirkbGIUIpQw/GE4qPV
 JNmiRbMih57WQdAKRcqmbwRbtfWOLcdNx/xBz3D6pVAzrgqg7s4UBPJtK+LSHl3a7gfpj6lpK42
 XO2CKbyN72Qnhj6R+tIdfp6UOAi0W0kO2OXyk/D6wJy0qJBcAiDJUw5tezII0wx0XYVtSEbUXPf
 Mvz7EdUPf8JW9UpmaDHBKq2VJr33/QJs9ytyajOxCGXeJdcfpgGo9qJsgjOthO9bQiIWUZLsNCZ
 LOhqHhWbwrhXT1kw+ZqFjqgyhIc47zEN2LwRg5AhJtRdgJn+38luNyGFvK57c5nrmgY5HM
X-Received: by 2002:ac8:7e8f:0:b0:51c:7b12:5fda with SMTP id
 d75a77b69052e-51c8b438e93mr84318041cf.86.1783611005740; 
 Thu, 09 Jul 2026 08:30:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F
 (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd81f4bbdsm19539096d6.36.2026.07.09.08.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 08:30:04 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:29:58 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>,
 Simon Schuster <schuster.simon@siemens-energy.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
 Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
 Alex Williamson <alex@shazbot.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Dan Williams <djbw@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "Liam R . Howlett" <liam@infradead.org>,
 Matthew Wilcox <willy@infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>,
 Miaohe Lin <linmiaohe@huawei.com>, Hugh Dickins <hughd@google.com>,
 Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-mm@kvack.org, iommu@lists.linux.dev,
 linux-perf-users@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 damon@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH 16/30] mm/vma: use vma_start_pgoff(), linear_page_index()
 in mm code
Message-ID: <ak--doS80hnAeQ9s@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <33d79008948391d30bab38db5ae31072ce12f0a1.1782735110.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33d79008948391d30bab38db5ae31072ce12f0a1.1782735110.git.ljs@kernel.org>
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
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infradead.org,m:m.szyprow
 ski@samsung.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:pfalcato@suse.de,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[gourry.net];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER(0.00)[gourry@gourry.net,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gourry.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[76];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[gourry@gourry.net,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry.net:from_mime,gourry.net:email,gourry.net:dkim,lists.freedesktop.org:from_smtp,gourry-fedora-PF4VCD3F:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5C8C732EA5

On Mon, Jun 29, 2026 at 01:23:27PM +0100, Lorenzo Stoakes wrote:
> There are many instances in which linear_page_index() (as well as
> linear_page_delta()) is open-coded, which is confusing and inconsistent.
> 
> Additionally, vma->vm_pgoff doesn't necessarily make it clear that this is
> the page offset of the start of the VMA range.
> 
> Doing so also aids greppability.
> 
> So use vma_start_pgoff() in favour of directly accessing vma->vm_pgoff, and
> linear_page_index() where we can.
> 
> This also lays the ground for future changes which will add an anonymous
> page offset in order to be able to index MAP_PRIVATE-file backed anon
> folios in terms of their virtual page offset.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

such a nice readability improvement, thank you.

This made me wonder though whether we can make it painful for people to
open-code this in the future, otherwise I fear another one of these
patches creeping in 5-10 years down the line.

Not sure it's feasible though

Reviewed-by: Gregory Price <gourry@gourry.net>

> ---
>  include/linux/huge_mm.h    |  1 +
>  include/linux/hugetlb.h    |  3 +--
>  include/linux/pagemap.h    |  2 +-
>  mm/damon/vaddr.c           |  5 +++--
>  mm/debug.c                 |  2 +-
>  mm/filemap.c               |  7 ++++---
>  mm/huge_memory.c           |  2 +-
>  mm/hugetlb.c               | 11 ++++-------
>  mm/internal.h              | 24 ++++++++++++++----------
>  mm/khugepaged.c            |  3 ++-
>  mm/madvise.c               |  6 +++---
>  mm/mapping_dirty_helpers.c |  2 +-
>  mm/memory.c                | 25 +++++++++++++------------
>  mm/mempolicy.c             | 13 +++++++------
>  mm/mremap.c                | 12 ++++--------
>  mm/msync.c                 |  4 ++--
>  mm/nommu.c                 |  7 ++++---
>  mm/pagewalk.c              |  2 +-
>  mm/shmem.c                 |  9 +++++----
>  mm/userfaultfd.c           |  4 ++--
>  mm/util.c                  |  4 ++--
>  mm/vma.c                   | 15 +++++++--------
>  mm/vma_exec.c              |  4 ++--
>  mm/vma_init.c              |  2 +-
>  24 files changed, 86 insertions(+), 83 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index ad20f7f8c179..653b81d08fe7 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -230,6 +230,7 @@ static inline bool thp_vma_suitable_order(struct vm_area_struct *vma,
>  
>  	/* Don't have to check pgoff for anonymous vma */
>  	if (!vma_is_anonymous(vma)) {
> +		/* vma_start_pgoff() in mm.h so not available. */
>  		if (!IS_ALIGNED((vma->vm_start >> PAGE_SHIFT) - vma->vm_pgoff,
>  				hpage_size >> PAGE_SHIFT))
>  			return false;
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 2abaf99321e9..8390f50604d6 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -792,8 +792,7 @@ static inline pgoff_t hugetlb_linear_page_index(struct vm_area_struct *vma,
>  {
>  	struct hstate *h = hstate_vma(vma);
>  
> -	return ((address - vma->vm_start) >> huge_page_shift(h)) +
> -		(vma->vm_pgoff >> huge_page_order(h));
> +	return linear_page_index(vma, address) >> huge_page_order(h);
>  }
>  
>  static inline bool order_is_gigantic(unsigned int order)
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 644c0f25ae73..68a88d34a468 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -1101,7 +1101,7 @@ static inline pgoff_t linear_page_index(const struct vm_area_struct *vma,
>  	pgoff_t pgoff;
>  
>  	pgoff = linear_page_delta(vma, address);
> -	pgoff += vma->vm_pgoff;
> +	pgoff += vma_start_pgoff(vma);
>  	return pgoff;
>  }
>  
> diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
> index d27147603564..faa44aa3219b 100644
> --- a/mm/damon/vaddr.c
> +++ b/mm/damon/vaddr.c
> @@ -12,6 +12,7 @@
>  #include <linux/mman.h>
>  #include <linux/mmu_notifier.h>
>  #include <linux/page_idle.h>
> +#include <linux/pagemap.h>
>  #include <linux/pagewalk.h>
>  #include <linux/sched/mm.h>
>  
> @@ -627,8 +628,8 @@ static void damos_va_migrate_dests_add(struct folio *folio,
>  	}
>  
>  	order = folio_order(folio);
> -	ilx = vma->vm_pgoff >> order;
> -	ilx += (addr - vma->vm_start) >> (PAGE_SHIFT + order);
> +	ilx = vma_start_pgoff(vma) >> order;
> +	ilx += linear_page_delta(vma, addr) >> order;
>  
>  	for (i = 0; i < dests->nr_dests; i++)
>  		weight_total += dests->weight_arr[i];
> diff --git a/mm/debug.c b/mm/debug.c
> index 77fa8fe1d641..497654b36f1a 100644
> --- a/mm/debug.c
> +++ b/mm/debug.c
> @@ -163,7 +163,7 @@ void dump_vma(const struct vm_area_struct *vma)
>  		"flags: %#lx(%pGv)\n",
>  		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
>  		(unsigned long)pgprot_val(vma->vm_page_prot),
> -		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> +		vma->anon_vma, vma->vm_ops, vma_start_pgoff(vma),
>  		vma->vm_file, vma->vm_private_data,
>  #ifdef CONFIG_PER_VMA_LOCK
>  		refcount_read(&vma->vm_refcnt),
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 5af62e6abca5..bcb07b21a685 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3402,8 +3402,8 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>  		 * of memory.
>  		 */
>  		struct vm_area_struct *vma = vmf->vma;
> -		unsigned long start = vma->vm_pgoff;
> -		unsigned long end = start + vma_pages(vma);
> +		const unsigned long start = vma_start_pgoff(vma);
> +		const unsigned long end = vma_end_pgoff(vma);
>  		unsigned long ra_end;
>  
>  		ra->order = exec_folio_order();
> @@ -3921,7 +3921,8 @@ vm_fault_t filemap_map_pages(struct vm_fault *vmf,
>  		goto out;
>  	}
>  
> -	addr = vma->vm_start + ((start_pgoff - vma->vm_pgoff) << PAGE_SHIFT);
> +	addr = vma->vm_start +
> +		((start_pgoff - vma_start_pgoff(vma)) << PAGE_SHIFT);
>  	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, addr, &vmf->ptl);
>  	if (!vmf->pte) {
>  		folio_unlock(folio);
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2bccb0a53a0a..e94f56487225 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -180,7 +180,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>  	 */
>  	if (!in_pf && shmem_file(vma->vm_file))
>  		return orders & shmem_allowable_huge_orders(file_inode(vma->vm_file),
> -						   vma, vma->vm_pgoff, 0,
> +						   vma, vma_start_pgoff(vma), 0,
>  						   forced_collapse);
>  
>  	if (!vma_is_anonymous(vma)) {
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index f45000149a78..d44a3ac5ee0a 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1011,8 +1011,7 @@ static long region_count(struct resv_map *resv, long f, long t)
>  static pgoff_t vma_hugecache_offset(struct hstate *h,
>  			struct vm_area_struct *vma, unsigned long address)
>  {
> -	return ((address - vma->vm_start) >> huge_page_shift(h)) +
> -			(vma->vm_pgoff >> huge_page_order(h));
> +	return linear_page_index(vma, address) >> huge_page_order(h);
>  }
>  
>  /*
> @@ -5372,8 +5371,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
>  	 * from page cache lookup which is in HPAGE_SIZE units.
>  	 */
>  	address = address & huge_page_mask(h);
> -	pgoff = ((address - vma->vm_start) >> PAGE_SHIFT) +
> -			vma->vm_pgoff;
> +	pgoff = linear_page_index(vma, address);
>  	mapping = vma->vm_file->f_mapping;
>  
>  	/*
> @@ -6771,7 +6769,7 @@ static unsigned long page_table_shareable(struct vm_area_struct *svma,
>  				struct vm_area_struct *vma,
>  				unsigned long addr, pgoff_t idx)
>  {
> -	unsigned long saddr = ((idx - svma->vm_pgoff) << PAGE_SHIFT) +
> +	unsigned long saddr = ((idx - vma_start_pgoff(svma)) << PAGE_SHIFT) +
>  				svma->vm_start;
>  	unsigned long sbase = saddr & PUD_MASK;
>  	unsigned long s_end = sbase + PUD_SIZE;
> @@ -6856,8 +6854,7 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
>  		      unsigned long addr, pud_t *pud)
>  {
>  	struct address_space *mapping = vma->vm_file->f_mapping;
> -	pgoff_t idx = ((addr - vma->vm_start) >> PAGE_SHIFT) +
> -			vma->vm_pgoff;
> +	const pgoff_t idx = linear_page_index(vma, addr);
>  	struct vm_area_struct *svma;
>  	unsigned long saddr;
>  	pte_t *spte = NULL;
> diff --git a/mm/internal.h b/mm/internal.h
> index 181e79f1d6a2..89e5b7efe256 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1143,26 +1143,28 @@ static inline bool
>  folio_within_range(struct folio *folio, struct vm_area_struct *vma,
>  		unsigned long start, unsigned long end)
>  {
> -	pgoff_t pgoff, addr;
> -	unsigned long vma_pglen = vma_pages(vma);
> +	const unsigned long vma_pglen = vma_pages(vma);
> +	pgoff_t pgoff_folio, pgoff_vma_start;
> +	unsigned long addr;
>  
>  	VM_WARN_ON_FOLIO(folio_test_ksm(folio), folio);
>  	if (start > end)
>  		return false;
>  
> +	pgoff_folio = folio_pgoff(folio);
> +	pgoff_vma_start = vma_start_pgoff(vma);
> +
>  	if (start < vma->vm_start)
>  		start = vma->vm_start;
>  
>  	if (end > vma->vm_end)
>  		end = vma->vm_end;
>  
> -	pgoff = folio_pgoff(folio);
> -
>  	/* if folio start address is not in vma range */
> -	if (!in_range(pgoff, vma->vm_pgoff, vma_pglen))
> +	if (!in_range(pgoff_folio, pgoff_vma_start, vma_pglen))
>  		return false;
>  
> -	addr = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
> +	addr = vma->vm_start + ((pgoff_folio - pgoff_vma_start) << PAGE_SHIFT);
>  
>  	return !(addr < start || end - addr < folio_size(folio));
>  }
> @@ -1234,15 +1236,16 @@ extern pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
>  static inline unsigned long vma_address(const struct vm_area_struct *vma,
>  		pgoff_t pgoff, unsigned long nr_pages)
>  {
> +	const pgoff_t pgoff_start = vma_start_pgoff(vma);
>  	unsigned long address;
>  
> -	if (pgoff >= vma->vm_pgoff) {
> +	if (pgoff >= pgoff_start) {
>  		address = vma->vm_start +
> -			((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
> +			((pgoff - pgoff_start) << PAGE_SHIFT);
>  		/* Check for address beyond vma (or wrapped through 0?) */
>  		if (address < vma->vm_start || address >= vma->vm_end)
>  			address = -EFAULT;
> -	} else if (pgoff + nr_pages - 1 >= vma->vm_pgoff) {
> +	} else if (pgoff + nr_pages - 1 >= pgoff_start) {
>  		/* Test above avoids possibility of wrap to 0 on 32-bit */
>  		address = vma->vm_start;
>  	} else {
> @@ -1266,7 +1269,8 @@ static inline unsigned long vma_address_end(struct page_vma_mapped_walk *pvmw)
>  		return pvmw->address + PAGE_SIZE;
>  
>  	pgoff = pvmw->pgoff + pvmw->nr_pages;
> -	address = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
> +	address = vma->vm_start +
> +		((pgoff - vma_start_pgoff(vma)) << PAGE_SHIFT);
>  	/* Check for address beyond vma (or wrapped through 0?) */
>  	if (address < vma->vm_start || address > vma->vm_end)
>  		address = vma->vm_end;
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index bd5f86cf4bd8..ffef738d826c 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2145,7 +2145,8 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
>  		spinlock_t *ptl;
>  		bool success = false;
>  
> -		addr = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
> +		addr = vma->vm_start +
> +			((pgoff - vma_start_pgoff(vma)) << PAGE_SHIFT);
>  		if (addr & ~HPAGE_PMD_MASK ||
>  		    vma->vm_end < addr + HPAGE_PMD_SIZE)
>  			continue;
> diff --git a/mm/madvise.c b/mm/madvise.c
> index cd9bb077072c..6730c4200a93 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -253,7 +253,7 @@ static void shmem_swapin_range(struct vm_area_struct *vma,
>  			continue;
>  
>  		addr = vma->vm_start +
> -			((xas.xa_index - vma->vm_pgoff) << PAGE_SHIFT);
> +			((xas.xa_index - vma_start_pgoff(vma)) << PAGE_SHIFT);
>  		xas_pause(&xas);
>  		rcu_read_unlock();
>  
> @@ -318,7 +318,7 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
>  	mark_mmap_lock_dropped(madv_behavior);
>  	get_file(file);
>  	offset = (loff_t)(start - vma->vm_start)
> -			+ ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
> +			+ ((loff_t)vma_start_pgoff(vma) << PAGE_SHIFT);
>  	mmap_read_unlock(mm);
>  	vfs_fadvise(file, offset, end - start, POSIX_FADV_WILLNEED);
>  	fput(file);
> @@ -1023,7 +1023,7 @@ static long madvise_remove(struct madvise_behavior *madv_behavior)
>  		return -EACCES;
>  
>  	offset = (loff_t)(start - vma->vm_start)
> -			+ ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
> +			+ ((loff_t)vma_start_pgoff(vma) << PAGE_SHIFT);
>  
>  	/*
>  	 * Filesystem's fallocate may need to take i_rwsem.  We need to
> diff --git a/mm/mapping_dirty_helpers.c b/mm/mapping_dirty_helpers.c
> index 737c407f4081..e0efa36e0a07 100644
> --- a/mm/mapping_dirty_helpers.c
> +++ b/mm/mapping_dirty_helpers.c
> @@ -95,7 +95,7 @@ static int clean_record_pte(pte_t *pte, unsigned long addr,
>  
>  	if (pte_dirty(ptent)) {
>  		pgoff_t pgoff = ((addr - walk->vma->vm_start) >> PAGE_SHIFT) +
> -			walk->vma->vm_pgoff - cwalk->bitmap_pgoff;
> +			vma_start_pgoff(walk->vma) - cwalk->bitmap_pgoff;
>  		pte_t old_pte = ptep_modify_prot_start(walk->vma, addr, pte);
>  
>  		ptent = pte_mkclean(old_pte);
> diff --git a/mm/memory.c b/mm/memory.c
> index 98c1a245f45a..f5eb06544ba4 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -725,10 +725,10 @@ static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
>  				if (!pfn_valid(pfn))
>  					return NULL;
>  			} else {
> -				unsigned long off = (addr - vma->vm_start) >> PAGE_SHIFT;
> +				const pgoff_t index = linear_page_index(vma, addr);
>  
>  				/* Only CoW'ed anon folios are "normal". */
> -				if (pfn == vma->vm_pgoff + off)
> +				if (pfn == index)
>  					return NULL;
>  				if (!is_cow_mapping(vma->vm_flags))
>  					return NULL;
> @@ -2643,7 +2643,7 @@ static int __vm_map_pages(struct vm_area_struct *vma, struct page **pages,
>  int vm_map_pages(struct vm_area_struct *vma, struct page **pages,
>  				unsigned long num)
>  {
> -	return __vm_map_pages(vma, pages, num, vma->vm_pgoff);
> +	return __vm_map_pages(vma, pages, num, vma_start_pgoff(vma));
>  }
>  EXPORT_SYMBOL(vm_map_pages);
>  
> @@ -3298,7 +3298,8 @@ int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsigned long
>  	unsigned long pfn;
>  	int err;
>  
> -	err = __simple_ioremap_prep(vm_len, vma->vm_pgoff, start, len, &pfn);
> +	err = __simple_ioremap_prep(vm_len, vma_start_pgoff(vma), start, len,
> +				    &pfn);
>  	if (err)
>  		return err;
>  
> @@ -4342,15 +4343,15 @@ static inline void unmap_mapping_range_tree(struct address_space *mapping,
>  					    struct zap_details *details)
>  {
>  	struct vm_area_struct *vma;
> -	unsigned long start, size;
>  	struct mmu_gather tlb;
>  
>  	mapping_interval_tree_foreach(vma, mapping, first_index, last_index) {
> -		const pgoff_t start_idx = max(first_index, vma->vm_pgoff);
> +		const pgoff_t start_idx = max(first_index, vma_start_pgoff(vma));
>  		const pgoff_t end_idx = min(last_index, vma_last_pgoff(vma)) + 1;
> -
> -		start = vma->vm_start + ((start_idx - vma->vm_pgoff) << PAGE_SHIFT);
> -		size = (end_idx - start_idx) << PAGE_SHIFT;
> +		const pgoff_t offset = start_idx - vma_start_pgoff(vma);
> +		const unsigned long offset_bytes = offset << PAGE_SHIFT;
> +		const unsigned long start = vma->vm_start + offset_bytes;
> +		const unsigned long size = (end_idx - start_idx) << PAGE_SHIFT;
>  
>  		tlb_gather_mmu(&tlb, vma->vm_mm);
>  		zap_vma_range_batched(&tlb, vma, start, size, details);
> @@ -5684,7 +5685,7 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>  	} else if (nr_pages > 1) {
>  		pgoff_t idx = folio_page_idx(folio, page);
>  		/* The page offset of vmf->address within the VMA. */
> -		pgoff_t vma_off = vmf->pgoff - vmf->vma->vm_pgoff;
> +		pgoff_t vma_off = vmf->pgoff - vma_start_pgoff(vmf->vma);
>  		/* The index of the entry in the pagetable for fault page. */
>  		pgoff_t pte_off = pte_index(vmf->address);
>  
> @@ -5796,7 +5797,7 @@ static vm_fault_t do_fault_around(struct vm_fault *vmf)
>  	pgoff_t nr_pages = READ_ONCE(fault_around_pages);
>  	pgoff_t pte_off = pte_index(vmf->address);
>  	/* The page offset of vmf->address within the VMA. */
> -	pgoff_t vma_off = vmf->pgoff - vmf->vma->vm_pgoff;
> +	pgoff_t vma_off = vmf->pgoff - vma_start_pgoff(vmf->vma);
>  	pgoff_t from_pte, to_pte;
>  	vm_fault_t ret;
>  
> @@ -7274,7 +7275,7 @@ void print_vma_addr(char *prefix, unsigned long ip)
>  	if (vma && vma->vm_file) {
>  		struct file *f = vma->vm_file;
>  		ip -= vma->vm_start;
> -		ip += vma->vm_pgoff << PAGE_SHIFT;
> +		ip += vma_start_pgoff(vma) << PAGE_SHIFT;
>  		printk("%s%pD[%lx,%lx+%lx]", prefix, f, ip,
>  				vma->vm_start,
>  				vma->vm_end - vma->vm_start);
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 36699fabd3c2..650cdb23354a 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2048,8 +2048,8 @@ struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
>  		pol = get_task_policy(current);
>  	if (pol->mode == MPOL_INTERLEAVE ||
>  	    pol->mode == MPOL_WEIGHTED_INTERLEAVE) {
> -		*ilx += vma->vm_pgoff >> order;
> -		*ilx += (addr - vma->vm_start) >> (PAGE_SHIFT + order);
> +		*ilx += vma_start_pgoff(vma) >> order;
> +		*ilx += linear_page_delta(vma, addr) >> order;
>  	}
>  	return pol;
>  }
> @@ -3250,16 +3250,17 @@ EXPORT_SYMBOL_FOR_MODULES(mpol_shared_policy_init, "kvm");
>  int mpol_set_shared_policy(struct shared_policy *sp,
>  			struct vm_area_struct *vma, struct mempolicy *pol)
>  {
> -	int err;
> +	const pgoff_t pgoff = vma_start_pgoff(vma);
> +	const pgoff_t pgoff_end = vma_end_pgoff(vma);
>  	struct sp_node *new = NULL;
> -	unsigned long sz = vma_pages(vma);
> +	int err;
>  
>  	if (pol) {
> -		new = sp_alloc(vma->vm_pgoff, vma->vm_pgoff + sz, pol);
> +		new = sp_alloc(pgoff, pgoff_end, pol);
>  		if (!new)
>  			return -ENOMEM;
>  	}
> -	err = shared_policy_replace(sp, vma->vm_pgoff, vma->vm_pgoff + sz, new);
> +	err = shared_policy_replace(sp, pgoff, pgoff_end, new);
>  	if (err && new)
>  		sp_free(new);
>  	return err;
> diff --git a/mm/mremap.c b/mm/mremap.c
> index e9c8b1d05832..079a0ba0c4a7 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -948,8 +948,7 @@ static unsigned long vrm_set_new_addr(struct vma_remap_struct *vrm)
>  	struct vm_area_struct *vma = vrm->vma;
>  	unsigned long map_flags = 0;
>  	/* Page Offset _into_ the VMA. */
> -	pgoff_t internal_pgoff = (vrm->addr - vma->vm_start) >> PAGE_SHIFT;
> -	pgoff_t pgoff = vma->vm_pgoff + internal_pgoff;
> +	const pgoff_t pgoff = linear_page_index(vma, vrm->addr);
>  	unsigned long new_addr = vrm_implies_new_addr(vrm) ? vrm->new_addr : 0;
>  	unsigned long res;
>  
> @@ -1255,12 +1254,10 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
>  static int copy_vma_and_data(struct vma_remap_struct *vrm,
>  			     struct vm_area_struct **new_vma_ptr)
>  {
> -	unsigned long internal_offset = vrm->addr - vrm->vma->vm_start;
> -	unsigned long internal_pgoff = internal_offset >> PAGE_SHIFT;
> -	unsigned long new_pgoff = vrm->vma->vm_pgoff + internal_pgoff;
> -	unsigned long moved_len;
> +	const unsigned long new_pgoff = linear_page_index(vrm->vma, vrm->addr);
>  	struct vm_area_struct *vma = vrm->vma;
>  	struct vm_area_struct *new_vma;
> +	unsigned long moved_len;
>  	int err = 0;
>  	PAGETABLE_MOVE(pmc, NULL, NULL, vrm->addr, vrm->new_addr, vrm->old_len);
>  
> @@ -1802,8 +1799,7 @@ static int check_prep_vma(struct vma_remap_struct *vrm)
>  		vrm->populate_expand = true;
>  
>  	/* Need to be careful about a growing mapping */
> -	pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
> -	pgoff += vma->vm_pgoff;
> +	pgoff = linear_page_index(vma, addr);
>  	if (pgoff + (new_len >> PAGE_SHIFT) < pgoff)
>  		return -EINVAL;
>  
> diff --git a/mm/msync.c b/mm/msync.c
> index ac4c9bfea2e7..90b491a27a14 100644
> --- a/mm/msync.c
> +++ b/mm/msync.c
> @@ -12,6 +12,7 @@
>  #include <linux/mm.h>
>  #include <linux/mman.h>
>  #include <linux/file.h>
> +#include <linux/pagemap.h>
>  #include <linux/syscalls.h>
>  #include <linux/sched.h>
>  
> @@ -85,8 +86,7 @@ SYSCALL_DEFINE3(msync, unsigned long, start, size_t, len, int, flags)
>  			goto out_unlock;
>  		}
>  		file = vma->vm_file;
> -		fstart = (start - vma->vm_start) +
> -			 ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
> +		fstart = (loff_t)linear_page_index(vma, start) << PAGE_SHIFT;
>  		fend = fstart + (min(end, vma->vm_end) - start) - 1;
>  		start = vma->vm_end;
>  		if ((flags & MS_SYNC) && file &&
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 6d168f69763f..60560b2c457e 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -975,7 +975,7 @@ static int do_mmap_private(struct vm_area_struct *vma,
>  		/* read the contents of a file into the copy */
>  		loff_t fpos;
>  
> -		fpos = vma->vm_pgoff;
> +		fpos = vma_start_pgoff(vma);
>  		fpos <<= PAGE_SHIFT;
>  
>  		ret = kernel_read(vma->vm_file, base, len, &fpos);
> @@ -1355,7 +1355,8 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	delete_nommu_region(vma->vm_region);
>  	if (new_below) {
>  		vma->vm_region->vm_start = vma->vm_start = addr;
> -		vma->vm_region->vm_pgoff = vma->vm_pgoff += npages;
> +		vma->vm_pgoff += npages;
> +		vma->vm_region->vm_pgoff = vma_start_pgoff(vma);
>  	} else {
>  		vma->vm_region->vm_end = vma->vm_end = addr;
>  		vma->vm_region->vm_top = addr;
> @@ -1603,7 +1604,7 @@ int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsigned long
>  	unsigned long pfn = start >> PAGE_SHIFT;
>  	unsigned long vm_len = vma->vm_end - vma->vm_start;
>  
> -	pfn += vma->vm_pgoff;
> +	pfn += vma_start_pgoff(vma);
>  	return io_remap_pfn_range(vma, vma->vm_start, pfn, vm_len, vma->vm_page_prot);
>  }
>  EXPORT_SYMBOL(vm_iomap_memory);
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index 98d090ede077..0a3bbff57d46 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -813,7 +813,7 @@ int walk_page_mapping(struct address_space *mapping, pgoff_t first_index,
>  	mapping_interval_tree_foreach(vma, mapping, first_index,
>  				      first_index + nr - 1) {
>  		/* Clip to the vma */
> -		vba = vma->vm_pgoff;
> +		vba = vma_start_pgoff(vma);
>  		vea = vba + vma_pages(vma);
>  		cba = first_index;
>  		cba = max(cba, vba);
> diff --git a/mm/shmem.c b/mm/shmem.c
> index b51f83c970bb..4e7f6bc7a389 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1032,6 +1032,8 @@ unsigned long shmem_swap_usage(struct vm_area_struct *vma)
>  	struct inode *inode = file_inode(vma->vm_file);
>  	struct shmem_inode_info *info = SHMEM_I(inode);
>  	struct address_space *mapping = inode->i_mapping;
> +	const pgoff_t pgoff = vma_start_pgoff(vma);
> +	const pgoff_t pgoff_end = vma_end_pgoff(vma);
>  	unsigned long swapped;
>  
>  	/* Be careful as we don't hold info->lock */
> @@ -1045,12 +1047,11 @@ unsigned long shmem_swap_usage(struct vm_area_struct *vma)
>  	if (!swapped)
>  		return 0;
>  
> -	if (!vma->vm_pgoff && vma->vm_end - vma->vm_start >= inode->i_size)
> +	if (!pgoff && vma->vm_end - vma->vm_start >= inode->i_size)
>  		return swapped << PAGE_SHIFT;
>  
>  	/* Here comes the more involved part */
> -	return shmem_partial_swap_usage(mapping, vma->vm_pgoff,
> -					vma->vm_pgoff + vma_pages(vma));
> +	return shmem_partial_swap_usage(mapping, pgoff, pgoff_end);
>  }
>  
>  /*
> @@ -2839,7 +2840,7 @@ static struct mempolicy *shmem_get_policy(struct vm_area_struct *vma,
>  	 * by page order, as in shmem_get_pgoff_policy() and get_vma_policy()).
>  	 */
>  	*ilx = inode->i_ino;
> -	index = ((addr - vma->vm_start) >> PAGE_SHIFT) + vma->vm_pgoff;
> +	index = linear_page_index(vma, addr);
>  	return mpol_shared_policy_lookup(&SHMEM_I(inode)->policy, index);
>  }
>  
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 246af12bf801..bf4518f4449d 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -481,7 +481,7 @@ static void mfill_retry_state_save(struct mfill_retry_state *s,
>  {
>  	s->flags = vma_flags_and_mask(&vma->flags, MFILL_RETRY_STATE_VMA_FLAGS);
>  	s->ops = vma_uffd_ops(vma);
> -	s->pgoff = vma->vm_pgoff;
> +	s->pgoff = vma_start_pgoff(vma);
>  
>  	if (vma->vm_file)
>  		s->file = get_file(vma->vm_file);
> @@ -507,7 +507,7 @@ static bool mfill_retry_state_changed(struct mfill_retry_state *state,
>  
>  	/* VMA was file backed, but file, inode or offset has changed */
>  	if (!vma->vm_file || vma->vm_file->f_inode != state->file->f_inode ||
> -	    state->file != vma->vm_file || vma->vm_pgoff != state->pgoff)
> +	    state->file != vma->vm_file || vma_start_pgoff(vma) != state->pgoff)
>  		return true;
>  
>  	return false;
> diff --git a/mm/util.c b/mm/util.c
> index af2c2103f0d9..61e6d32b2c16 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1188,7 +1188,7 @@ void compat_set_desc_from_vma(struct vm_area_desc *desc,
>  	desc->start = vma->vm_start;
>  	desc->end = vma->vm_end;
>  
> -	desc->pgoff = vma->vm_pgoff;
> +	desc->pgoff = vma_start_pgoff(vma);
>  	desc->vm_file = vma->vm_file;
>  	desc->vma_flags = vma->flags;
>  	desc->page_prot = vma->vm_page_prot;
> @@ -1379,7 +1379,7 @@ static int call_vma_mapped(struct vm_area_struct *vma)
>  	if (!vm_ops || !vm_ops->mapped)
>  		return 0;
>  
> -	err = vm_ops->mapped(vma->vm_start, vma->vm_end, vma->vm_pgoff,
> +	err = vm_ops->mapped(vma->vm_start, vma->vm_end, vma_start_pgoff(vma),
>  			     vma->vm_file, &vm_private_data);
>  	if (err)
>  		return err;
> diff --git a/mm/vma.c b/mm/vma.c
> index dc4c2c1077f4..ee3a8ca13d07 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -967,10 +967,9 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  		 *   prev   middle   next
>  		 *  extend  delete  delete
>  		 */
> -
>  		vmg->start = prev->vm_start;
>  		vmg->end = next->vm_end;
> -		vmg->pgoff = prev->vm_pgoff;
> +		vmg->pgoff = vma_start_pgoff(prev);
>  
>  		/*
>  		 * We already ensured anon_vma compatibility above, so now it's
> @@ -987,9 +986,8 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  		 *   prev     middle
>  		 *  extend shrink/delete
>  		 */
> -
>  		vmg->start = prev->vm_start;
> -		vmg->pgoff = prev->vm_pgoff;
> +		vmg->pgoff = vma_start_pgoff(prev);
>  
>  		if (!vmg->__remove_middle)
>  			vmg->__adjust_middle_start = true;
> @@ -1011,13 +1009,13 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  
>  		if (vmg->__remove_middle) {
>  			vmg->end = next->vm_end;
> -			vmg->pgoff = next->vm_pgoff - pglen;
> +			vmg->pgoff = vma_start_pgoff(next) - pglen;
>  		} else {
>  			/* We shrink middle and expand next. */
>  			vmg->__adjust_next_start = true;
>  			vmg->start = middle->vm_start;
>  			vmg->end = start;
> -			vmg->pgoff = middle->vm_pgoff;
> +			vmg->pgoff = vma_start_pgoff(middle);
>  		}
>  
>  		err = dup_anon_vma(next, middle, &anon_dup);
> @@ -1126,7 +1124,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
>  	if (can_merge_left) {
>  		vmg->start = prev->vm_start;
>  		vmg->target = prev;
> -		vmg->pgoff = prev->vm_pgoff;
> +		vmg->pgoff = vma_start_pgoff(prev);
>  
>  		/*
>  		 * If this merge would result in removal of the next VMA but we
> @@ -1957,7 +1955,8 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
>  			VM_BUG_ON_VMA(faulted_in_anon_vma, new_vma);
>  			*vmap = vma = new_vma;
>  		}
> -		*need_rmap_locks = (new_vma->vm_pgoff <= vma->vm_pgoff);
> +		*need_rmap_locks =
> +			(vma_start_pgoff(new_vma) <= vma_start_pgoff(vma));
>  	} else {
>  		new_vma = vm_area_dup(vma);
>  		if (!new_vma)
> diff --git a/mm/vma_exec.c b/mm/vma_exec.c
> index 5cee8b7efa0f..e3644a3042e2 100644
> --- a/mm/vma_exec.c
> +++ b/mm/vma_exec.c
> @@ -37,7 +37,7 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
>  	unsigned long new_end = old_end - shift;
>  	VMA_ITERATOR(vmi, mm, new_start);
>  	VMG_STATE(vmg, mm, &vmi, new_start, old_end, EMPTY_VMA_FLAGS,
> -		  vma->vm_pgoff);
> +		  vma_start_pgoff(vma));
>  	struct vm_area_struct *next;
>  	struct mmu_gather tlb;
>  	PAGETABLE_MOVE(pmc, vma, vma, old_start, new_start, length);
> @@ -89,7 +89,7 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
>  
>  	vma_prev(&vmi);
>  	/* Shrink the vma to just the new range */
> -	return vma_shrink(&vmi, vma, new_start, new_end, vma->vm_pgoff);
> +	return vma_shrink(&vmi, vma, new_start, new_end, vma_start_pgoff(vma));
>  }
>  
>  /*
> diff --git a/mm/vma_init.c b/mm/vma_init.c
> index 3c0b65950510..a459669a1654 100644
> --- a/mm/vma_init.c
> +++ b/mm/vma_init.c
> @@ -46,7 +46,7 @@ static void vm_area_init_from(const struct vm_area_struct *src,
>  	dest->vm_start = src->vm_start;
>  	dest->vm_end = src->vm_end;
>  	dest->anon_vma = src->anon_vma;
> -	dest->vm_pgoff = src->vm_pgoff;
> +	dest->vm_pgoff = vma_start_pgoff(src);
>  	dest->vm_file = src->vm_file;
>  	dest->vm_private_data = src->vm_private_data;
>  	vm_flags_init(dest, src->vm_flags);
> -- 
> 2.54.0
> 
