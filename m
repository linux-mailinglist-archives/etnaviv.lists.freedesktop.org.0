Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nu4eDHZJRmo6NwsAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 13:20:22 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81716F6973
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 13:20:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PgCpqqxi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oeEsfdun;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PgCpqqxi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oeEsfdun;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=suse.de
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B02F10F2EA;
	Thu,  2 Jul 2026 11:20:20 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EDD10F2CA
 for <etnaviv@lists.freedesktop.org>; Thu,  2 Jul 2026 11:20:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4BB0E74173;
 Thu,  2 Jul 2026 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1782991216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j9HqakDIjcCcTQyUF2MV7bxyTIX1upg8T2CXHTGbmPY=;
 b=PgCpqqxie7t8+CkwpPP13NW6wQohMzurOqQ3M60mxkSvPUID4ZQOKndTpBXqeUuVhdKIfx
 t+2FJW3O/MNyOgFxUfD/N1cfpHLCK8FHDiqwUFTQFndqACbeCmnNWvqmGlEefRvEf4d7hB
 IQhWnkSLQ2dpEmnyOFJPaliYHOfjrfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1782991216;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j9HqakDIjcCcTQyUF2MV7bxyTIX1upg8T2CXHTGbmPY=;
 b=oeEsfdunpBw1BldK/9+YFlfUYsk4g2GKuSeX7pnNOrhZYXAOuDPvAQY6PG7s0cv9YpWemp
 mWdG22AvAmx0j3Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1782991216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j9HqakDIjcCcTQyUF2MV7bxyTIX1upg8T2CXHTGbmPY=;
 b=PgCpqqxie7t8+CkwpPP13NW6wQohMzurOqQ3M60mxkSvPUID4ZQOKndTpBXqeUuVhdKIfx
 t+2FJW3O/MNyOgFxUfD/N1cfpHLCK8FHDiqwUFTQFndqACbeCmnNWvqmGlEefRvEf4d7hB
 IQhWnkSLQ2dpEmnyOFJPaliYHOfjrfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1782991216;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j9HqakDIjcCcTQyUF2MV7bxyTIX1upg8T2CXHTGbmPY=;
 b=oeEsfdunpBw1BldK/9+YFlfUYsk4g2GKuSeX7pnNOrhZYXAOuDPvAQY6PG7s0cv9YpWemp
 mWdG22AvAmx0j3Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C6F00779AA;
 Thu,  2 Jul 2026 11:20:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RDeaLGtJRmoSbQAAD6G6ig
 (envelope-from <pfalcato@suse.de>); Thu, 02 Jul 2026 11:20:11 +0000
Date: Thu, 2 Jul 2026 12:20:10 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>, 
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Lucas Stach <l.stach@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Ankit Agrawal <ankita@nvidia.com>, 
 Alex Williamson <alex@shazbot.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Dan Williams <djbw@kernel.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 "Liam R . Howlett" <liam@infradead.org>, Matthew Wilcox <willy@infradead.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Zijlstra <peterz@infradead.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>,
 Miaohe Lin <linmiaohe@huawei.com>, 
 Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>,
 Kees Cook <kees@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-sgx@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 kvm@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org, 
 iommu@lists.linux.dev, linux-perf-users@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 damon@lists.linux.dev, 
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH 21/30] mm/vma: add and use vma_[add/sub]_pgoff()
Message-ID: <akZI0n1U32Ptd0ye@pedro-suse.lan>
References: <cover.1782735110.git.ljs@kernel.org>
 <794044881e454fd8ac13e59d5ff5fc86fca08b03.1782735110.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <794044881e454fd8ac13e59d5ff5fc86fca08b03.1782735110.git.ljs@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infradead.org,m:m.szyprow
 ski@samsung.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[pfalcato@suse.de,etnaviv-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pfalcato@suse.de,etnaviv-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:from_mime,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,pedro-suse.lan:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C81716F6973

On Mon, Jun 29, 2026 at 01:23:32PM +0100, Lorenzo Stoakes wrote:
> Add helpers for adding or subtracting to a VMA's page offset, exposed
> internally for VMA users within mm in mm/vma.h.
> 
> This is to lay the foundations for tracking anonymous page offset for
> MAP_PRIVATE file-backed mappings, where adding and subtracting from this
> value must be reflected in both the file and anonymous offsets.
> 
> These are used on VMA split and downward stack expansion.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  mm/nommu.c                      |  6 ++++--
>  mm/vma.c                        |  6 +++---
>  mm/vma.h                        | 12 ++++++++++++
>  tools/testing/vma/include/dup.h | 13 ++++++++++++-
>  4 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 7333d855e974..c7fafcd87c14 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -41,6 +41,7 @@
>  #include <asm/tlbflush.h>
>  #include <asm/mmu_context.h>
>  #include "internal.h"
> +#include "vma.h"
>  
>  unsigned long highest_memmap_pfn;
>  int heap_stack_gap = 0;
> @@ -1338,7 +1339,8 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  		region->vm_top = region->vm_end = new->vm_end = addr;
>  	} else {
>  		region->vm_start = new->vm_start = addr;
> -		region->vm_pgoff = new->vm_pgoff += npages;
> +		vma_add_pgoff(new, npages);
> +		region->vm_pgoff = vma_start_pgoff(new);
>  	}
>  
>  	vma_iter_config(vmi, new->vm_start, new->vm_end);
> @@ -1355,7 +1357,7 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	delete_nommu_region(vma->vm_region);
>  	if (new_below) {
>  		vma->vm_region->vm_start = vma->vm_start = addr;
> -		vma->vm_pgoff += npages;
> +		vma_add_pgoff(vma, npages);
>  		vma->vm_region->vm_pgoff = vma_start_pgoff(vma);
>  	} else {
>  		vma->vm_region->vm_end = vma->vm_end = addr;
> diff --git a/mm/vma.c b/mm/vma.c
> index 185d07397ca6..cb7222e20c93 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -517,7 +517,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  		new->vm_end = addr;
>  	} else {
>  		new->vm_start = addr;
> -		new->vm_pgoff += linear_page_delta(vma, addr);
> +		vma_add_pgoff(new, linear_page_delta(vma, addr));
>  	}
>  
>  	err = -ENOMEM;
> @@ -556,7 +556,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  
>  	if (new_below) {
>  		vma->vm_start = addr;
> -		vma->vm_pgoff += (addr - new->vm_start) >> PAGE_SHIFT;
> +		vma_add_pgoff(vma, (addr - new->vm_start) >> PAGE_SHIFT);
>  	} else {
>  		vma->vm_end = addr;
>  	}
> @@ -3305,7 +3305,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
>  				vm_stat_account(mm, vma->vm_flags, grow);
>  				anon_vma_interval_tree_pre_update_vma(vma);
>  				vma->vm_start = address;
> -				vma->vm_pgoff -= grow;
> +				vma_sub_pgoff(vma, grow);
>  				/* Overwrite old entry in mtree. */
>  				vma_iter_store_overwrite(&vmi, vma);
>  				anon_vma_interval_tree_post_update_vma(vma);
> diff --git a/mm/vma.h b/mm/vma.h
> index 2342516ce00e..47fe35e5307e 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -247,6 +247,18 @@ static inline pgoff_t vmg_end_pgoff(const struct vma_merge_struct *vmg)
>  	return vmg_start_pgoff(vmg) + vmg_pages(vmg);
>  }
>  
> +static inline void vma_add_pgoff(struct vm_area_struct *vma, pgoff_t delta)
> +{
> +	vma_assert_can_modify(vma);
> +	vma->vm_pgoff += delta;
> +}
> +
> +static inline void vma_sub_pgoff(struct vm_area_struct *vma, pgoff_t delta)
> +{
> +	vma_assert_can_modify(vma);
> +	vma->vm_pgoff -= delta;
> +}
> +
>  #define VMG_STATE(name, mm_, vmi_, start_, end_, vma_flags_, pgoff_)	\
>  	struct vma_merge_struct name = {				\
>  		.mm = mm_,						\
> diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
> index 7ed165c8d9bc..41fea90a344d 100644
> --- a/tools/testing/vma/include/dup.h
> +++ b/tools/testing/vma/include/dup.h
> @@ -1163,6 +1163,11 @@ static inline struct vm_area_struct *vma_next(struct vma_iterator *vmi)
>  	return mas_find(&vmi->mas, ULONG_MAX);
>  }
>  
> +static inline bool vma_is_attached(struct vm_area_struct *vma)
> +{
> +	return refcount_read(&vma->vm_refcnt);
> +}
> +
>  /*
>   * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
>   * assertions should be made either under mmap_write_lock or when the object
> @@ -1170,7 +1175,13 @@ static inline struct vm_area_struct *vma_next(struct vma_iterator *vmi)
>   */
>  static inline void vma_assert_attached(struct vm_area_struct *vma)
>  {
> -	WARN_ON_ONCE(!refcount_read(&vma->vm_refcnt));
> +	WARN_ON_ONCE(!vma_is_attached(vma));
> +}
> +
> +static inline void vma_assert_can_modify(struct vm_area_struct *vma)
> +{
> +	if (vma_is_attached(vma))
> +		vma_assert_write_locked(vma);
>  }

These hunks in dup.h look lost. Should perhaps be on the previous patch
(adding the helpers).

Anyway, Obviously Correct(tm).

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
