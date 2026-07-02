Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CZk4AVFCRmosNAsAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 12:49:53 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD386F6308
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 12:49:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ehRl1qrh;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3645910F2CA;
	Thu,  2 Jul 2026 10:49:51 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CFC10F2BD;
 Thu,  2 Jul 2026 10:49:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4971960103;
 Thu,  2 Jul 2026 10:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0CBA1F000E9;
 Thu,  2 Jul 2026 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782989389;
 bh=PVxJrEfQsXPQX1baTkLT/w1gQ14jFIcsHbRcLw3FERA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ehRl1qrhylAe9ofHdw1uy6YCIvZpbl7YPRZ4CkgQorWifVv4m3a8Frk+KpW1OWNqB
 W5Mt0U4LzndlakymF8EBw78EGZWrzE3KlOp0pFy8YavkCJqwRLWZUPQFgQys3vfaPH
 bTMUz4RRFiIvMwxiQIu7Fk8dPwiz2pFu2EBdR33NrlR5z10UNCrkNmqGD7YAUa8uEr
 AlsmjkuHEjFCLGB6zV/S/C2QItxIy8OqiHtbryGaNt6Uy8xajwWaiky+0DlN0gAJVQ
 2jyUc5P1J1BsxSlw2ZnaryGL4v5EjiZqEd84yVjUJ4WyP5g+g4irqvRMSbuDxjuayZ
 B6/qpVMFwJ4tg==
Date: Thu, 2 Jul 2026 11:49:27 +0100
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
Subject: Re: [PATCH 16/30] mm/vma: use vma_start_pgoff(), linear_page_index()
 in mm code
Message-ID: <akZCKKOiXBaHrbya@lucifer>
References: <cover.1782735110.git.ljs@kernel.org>
 <33d79008948391d30bab38db5ae31072ce12f0a1.1782735110.git.ljs@kernel.org>
 <akZAwT-QWhA1wdA9@pedro-suse.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZAwT-QWhA1wdA9@pedro-suse.lan>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.de:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AD386F6308

On Thu, Jul 02, 2026 at 11:47:10AM +0100, Pedro Falcato wrote:
> small nit: perhaps the subject should simply have mm: as it hits mm in general
>
> On Mon, Jun 29, 2026 at 01:23:27PM +0100, Lorenzo Stoakes wrote:
> > There are many instances in which linear_page_index() (as well as
> > linear_page_delta()) is open-coded, which is confusing and inconsistent.
> >
> > Additionally, vma->vm_pgoff doesn't necessarily make it clear that this is
> > the page offset of the start of the VMA range.
> >
> > Doing so also aids greppability.
> >
> > So use vma_start_pgoff() in favour of directly accessing vma->vm_pgoff, and
> > linear_page_index() where we can.
> >
> > This also lays the ground for future changes which will add an anonymous
> > page offset in order to be able to index MAP_PRIVATE-file backed anon
> > folios in terms of their virtual page offset.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> > ---
> >  include/linux/huge_mm.h    |  1 +
> >  include/linux/hugetlb.h    |  3 +--
> >  include/linux/pagemap.h    |  2 +-
> >  mm/damon/vaddr.c           |  5 +++--
> >  mm/debug.c                 |  2 +-
> >  mm/filemap.c               |  7 ++++---
> >  mm/huge_memory.c           |  2 +-
> >  mm/hugetlb.c               | 11 ++++-------
> >  mm/internal.h              | 24 ++++++++++++++----------
> >  mm/khugepaged.c            |  3 ++-
> >  mm/madvise.c               |  6 +++---
> >  mm/mapping_dirty_helpers.c |  2 +-
> >  mm/memory.c                | 25 +++++++++++++------------
> >  mm/mempolicy.c             | 13 +++++++------
> >  mm/mremap.c                | 12 ++++--------
> >  mm/msync.c                 |  4 ++--
> >  mm/nommu.c                 |  7 ++++---
> >  mm/pagewalk.c              |  2 +-
> >  mm/shmem.c                 |  9 +++++----
> >  mm/userfaultfd.c           |  4 ++--
> >  mm/util.c                  |  4 ++--
> >  mm/vma.c                   | 15 +++++++--------
> >  mm/vma_exec.c              |  4 ++--
> >  mm/vma_init.c              |  2 +-
> >  24 files changed, 86 insertions(+), 83 deletions(-)
> >
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index ad20f7f8c179..653b81d08fe7 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -230,6 +230,7 @@ static inline bool thp_vma_suitable_order(struct vm_area_struct *vma,
> >
> >  	/* Don't have to check pgoff for anonymous vma */
> >  	if (!vma_is_anonymous(vma)) {
> > +		/* vma_start_pgoff() in mm.h so not available. */
>
> Yay for gigaheaders...

Yup C headers are a constant pain :)

>
> >  		if (!IS_ALIGNED((vma->vm_start >> PAGE_SHIFT) - vma->vm_pgoff,
> >  				hpage_size >> PAGE_SHIFT))
> >  			return false;
> > diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> > index 2abaf99321e9..8390f50604d6 100644
> > --- a/include/linux/hugetlb.h
> > +++ b/include/linux/hugetlb.h
> > @@ -792,8 +792,7 @@ static inline pgoff_t hugetlb_linear_page_index(struct vm_area_struct *vma,
> >  {
> >  	struct hstate *h = hstate_vma(vma);
> >
> > -	return ((address - vma->vm_start) >> huge_page_shift(h)) +
> > -		(vma->vm_pgoff >> huge_page_order(h));
> > +	return linear_page_index(vma, address) >> huge_page_order(h);
> >  }
> >
>
> Anyway, nothing jumped out at me.
>
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>

Thanks!

>
>
> --
> Pedro

Cheers, Lorenzo
