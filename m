Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t5UQNaXVTGpFqgEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 07 Jul 2026 12:32:05 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA1171A6A6
	for <lists+etnaviv@lfdr.de>; Tue, 07 Jul 2026 12:32:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CJQD7ZPp;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2610EC65;
	Tue,  7 Jul 2026 10:32:04 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A19210EC55;
 Tue,  7 Jul 2026 10:32:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 48D5C618A6;
 Tue,  7 Jul 2026 10:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76161F000E9;
 Tue,  7 Jul 2026 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783420321;
 bh=soT56A/TsitxOPYJdfdItvncnq3Epp2rkiDUFibzwAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=CJQD7ZPpnY0LATwFP4HY6e99mGG6GCfwtV8prggnPIqZJoBT7sw1qkGBcMUymGabb
 thMKdB37j3Mngsn9NR0xZM3ngVTkWAKFGJ1phdZyrmdRqTmT//SItbTSX5gLMuvCGh
 h03dHdDBVKfa160LAt0yaBWio5lu77qjq0yudAYfiJObv5RjqQLRDbmptoyC6hGNHW
 E8y81BbE7fqCE9Ns7/a0r4BVgl44yGmApnpjPyV6g+rojpwE7+I26L2qbh+RXETO8y
 +yjDFpLtM0uRECmpnCPEvJUaccNc37yoAjGG17lTCIWiiaHTnl5i2XvNsouOomVvyo
 X9ITIQzR+3YOQ==
Date: Tue, 7 Jul 2026 11:31:37 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
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
Subject: Re: [PATCH 22/30] mm/vma: move __install_special_mapping() to vma.c
Message-ID: <akzTj7Xv8kiUU2-w@lucifer>
References: <cover.1782735110.git.ljs@kernel.org>
 <b3254231831037ca3e9757e3e05c90072e04a6aa.1782735110.git.ljs@kernel.org>
 <akZJjNic8u0pDxgD@pedro-suse.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZJjNic8u0pDxgD@pedro-suse.lan>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,lists.freedesktop.org:from_smtp,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AA1171A6A6

On Thu, Jul 02, 2026 at 12:22:56PM +0100, Pedro Falcato wrote:
> On Mon, Jun 29, 2026 at 01:23:33PM +0100, Lorenzo Stoakes wrote:
> > This function is operating on VMAs and rightly belongs in vma.c, where it
> > can be subject to VMA userland testing and allows us to isolate it from the
> > rest of mm.
> >
> > The _install_special_mapping() function will remain in mmap.c as a wrapper,
> > since this is used by architecture-specific code.
> >
> > Doing so allows us to isolate more functions in vma.c for the same reasons.
> >
> > This forms part of work to allow for tracking MAP_PRIVATE file-backed
> > mappings by their anonymous virtual page offset, as doing so allows us to
> > isolate and keep code that interacts with this together.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> > ---
> >  mm/mmap.c | 38 --------------------------------------
> >  mm/vma.c  | 38 ++++++++++++++++++++++++++++++++++++++
> >  mm/vma.h  |  5 +++++
> >  3 files changed, 43 insertions(+), 38 deletions(-)
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 2d09a57e3620..46174e706bbe 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -1447,44 +1447,6 @@ static vm_fault_t special_mapping_fault(struct vm_fault *vmf)
> >  	return VM_FAULT_SIGBUS;
> >  }
> >
> > -static struct vm_area_struct *__install_special_mapping(
> > -	struct mm_struct *mm,
> > -	unsigned long addr, unsigned long len,
> > -	vm_flags_t vm_flags, void *priv,
> > -	const struct vm_operations_struct *ops)
> > -{
> > -	int ret;
> > -	struct vm_area_struct *vma;
> > -
> > -	vma = vm_area_alloc(mm);
> > -	if (unlikely(vma == NULL))
> > -		return ERR_PTR(-ENOMEM);
> > -
> > -	vma_set_range(vma, addr, addr + len, 0);
> > -	vm_flags |= mm->def_flags | VM_DONTEXPAND;
> > -	if (pgtable_supports_soft_dirty())
> > -		vm_flags |= VM_SOFTDIRTY;
> > -	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
> > -	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> > -
> > -	vma->vm_ops = ops;
> > -	vma->vm_private_data = priv;
> > -
> > -	ret = insert_vm_struct(mm, vma);
> > -	if (ret)
> > -		goto out;
> > -
> > -	vm_stat_account(mm, vma->vm_flags, len >> PAGE_SHIFT);
> > -
> > -	perf_event_mmap(vma);
> > -
> > -	return vma;
> > -
> > -out:
> > -	vm_area_free(vma);
> > -	return ERR_PTR(ret);
> > -}
> > -
> >  bool vma_is_special_mapping(const struct vm_area_struct *vma,
> >  	const struct vm_special_mapping *sm)
> >  {
> > diff --git a/mm/vma.c b/mm/vma.c
> > index cb7222e20c93..f4de706a2728 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -3399,3 +3399,41 @@ __weak unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
> >  {
> >  	return vma_kernel_pagesize(vma);
> >  }
> > +
> > +struct vm_area_struct *__install_special_mapping(
> > +	struct mm_struct *mm,
> > +	unsigned long addr, unsigned long len,
> > +	vm_flags_t vm_flags, void *priv,
> > +	const struct vm_operations_struct *ops)
> > +{
> > +	int ret;
> > +	struct vm_area_struct *vma;
> > +
> > +	vma = vm_area_alloc(mm);
> > +	if (unlikely(vma == NULL))
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	vma_set_range(vma, addr, addr + len, 0);
> > +	vm_flags |= mm->def_flags | VM_DONTEXPAND;
> > +	if (pgtable_supports_soft_dirty())
> > +		vm_flags |= VM_SOFTDIRTY;
> > +	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
> > +	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> > +
> > +	vma->vm_ops = ops;
> > +	vma->vm_private_data = priv;
> > +
> > +	ret = insert_vm_struct(mm, vma);
> > +	if (ret)
> > +		goto out;
> > +
> > +	vm_stat_account(mm, vma->vm_flags, len >> PAGE_SHIFT);
> > +
> > +	perf_event_mmap(vma);
> > +
> > +	return vma;
> > +
> > +out:
> > +	vm_area_free(vma);
> > +	return ERR_PTR(ret);
> > +}
> > diff --git a/mm/vma.h b/mm/vma.h
> > index 47fe35e5307e..14f026bf3be4 100644
> > --- a/mm/vma.h
> > +++ b/mm/vma.h
> > @@ -775,4 +775,9 @@ static inline bool map_deny_write_exec(const vma_flags_t *old,
> >  }
> >  #endif
> >
> > +struct vm_area_struct *__install_special_mapping(struct mm_struct *mm,
> > +		unsigned long addr, unsigned long len,
> > +		vm_flags_t vm_flags, void *priv,
> > +		const struct vm_operations_struct *ops);
> > +
> >  #endif	/* __MM_VMA_H */
>
> I'm really annoyed that _install_special_mapping has a leading underscore.
> That's it.

Yeah it's horrible :)

>
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>

Thanks!

>
> --
> Pedro

Cheers, Lorenzo
