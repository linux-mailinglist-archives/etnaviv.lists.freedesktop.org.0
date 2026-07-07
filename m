Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c6dPCsPRTGrpqAEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 07 Jul 2026 12:15:31 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D22F71A2C5
	for <lists+etnaviv@lfdr.de>; Tue, 07 Jul 2026 12:15:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HluYhwOW;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6369610EC3B;
	Tue,  7 Jul 2026 10:15:29 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FD810E482;
 Tue,  7 Jul 2026 10:15:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 64240424AD;
 Tue,  7 Jul 2026 10:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAC81F00A3D;
 Tue,  7 Jul 2026 10:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783419327;
 bh=mNSla9Czr4vFeuTIzrP/cHDzh+yx/IrTUvaJ5OnP34U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=HluYhwOWRqwjbw9mnNEjPVnyh7tR+UBSnSv/otgjpUQBigWOwZUJOYkpU0LnGQPOd
 9JWuafQR68ncbIWqn0jW8jTfwPafpmeDnt2Wvr8VLfjDqTgkyFdLwQrzBX5aGYlPBy
 bdDr9uov5pNq61DLoYMBBHIrYLPaluS9cGGvVLuwrNNgpnc0PxTOy1Y4Jv6WgqJLPU
 g8L2HsabDqHedwwaZisYTmwsI8Liu2LIO7hoQNV8VhXPReqA934JiUn5O3mwQK8rxr
 zZFBy1M3lH7Q7XggDkvTulkUo1eG7DFZ7mTqdd75PKoMBF8VkjG7TCZVSFf+WpnFzU
 vO+QqUik5Cd9A==
Date: Tue, 7 Jul 2026 11:15:02 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Zack Rusin <zack.rusin@broadcom.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Helge Deller <deller@gmx.de>, Benjamin LaHaise <bcrl@kvack.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Kees Cook <kees@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, 
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, 
 linux-fbdev@vger.kernel.org, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 02/13] mm/vma: update do_mmap() to use vma_flags_t
Message-ID: <akzRdIS8ZotxIOFR@lucifer>
References: <cover.1782760670.git.ljs@kernel.org>
 <e0ac58ad2b88ff7e2f0024e3286b2e786f79ca32.1782760670.git.ljs@kernel.org>
 <DJRZ2QCEIVA6.1AZF5S891NKS4@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJRZ2QCEIVA6.1AZF5S891NKS4@nvidia.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[etnaviv];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D22F71A2C5

On Mon, Jul 06, 2026 at 10:10:32PM -0400, Zi Yan wrote:
> On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> > The core do_mmap() function accepts a vm_flags_t parameter which it then
> > manipulates before passing to mmap_region() to do the heavy lifting of the
> > memory mapping.
> >
> > Update do_mmap() to instead accept a vma_flags_t parameter, and adjust all
> > the logic within do_mmap() to manipulate this instead.
> >
> > This is as part of the ongoing effort to convert VMA flags from a system
> > word size to a bitmap type which allows us to unrestrict the number of VMA
> > flags, as well as gain control over how VMA flag manipulation occurs.
> >
> > We do not cascade these changes to all functions which accept vm_flags_t,
> > but rather use vma_flags_to_legacy() where necessary, specifically
> > deferring converting calc_vm_prot_bits(), calc_vm_flag_bits() and
> > __get_unmapped_area() to vma_flags_t.
> >
> > Also utilise the new vma_flags_can_grow() predicate which correctly handles
> > the case of architectures without upward growing stacks.
> >
> > As part of this change, introduce VMA_SHADOW_STACK so we can correctly
> > handle the case of the shadow stack not being defined.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> > ---
> >  arch/mips/kernel/vdso.c |  4 +--
> >  fs/aio.c                |  2 +-
> >  include/linux/memfd.h   |  6 ++--
> >  include/linux/mm.h      |  6 ++--
> >  ipc/shm.c               |  3 +-
> >  mm/memfd.c              | 15 ++++-----
> >  mm/mmap.c               | 67 ++++++++++++++++++++++++-----------------
> >  mm/nommu.c              |  3 +-
> >  mm/util.c               | 10 +++---
> >  mm/vma.c                |  7 ++---
> >  mm/vma.h                |  2 +-
> >  11 files changed, 69 insertions(+), 56 deletions(-)
> >
>
> <snip>
>
> >
> > -static int check_write_seal(vm_flags_t *vm_flags_ptr)
> > +static int check_write_seal(vma_flags_t *vma_flags_ptr)
> >  {
> > -	vm_flags_t vm_flags = *vm_flags_ptr;
> > -	vm_flags_t mask = vm_flags & (VM_SHARED | VM_WRITE);
> > -
> >  	/* If a private mapping then writability is irrelevant. */
> > -	if (!(mask & VM_SHARED))
> > +	if (!vma_flags_test(vma_flags_ptr, VMA_SHARED_BIT))
> >  		return 0;
> >
> >  	/*
> >  	 * New PROT_WRITE and MAP_SHARED mmaps are not allowed when
> >  	 * write seals are active.
> >  	 */
> > -	if (mask & VM_WRITE)
> > +	if (vma_flags_test(vma_flags_ptr, VMA_WRITE_BIT))
> >  		return -EPERM;
> >
> >  	/*
> >  	 * This is a read-only mapping, disallow mprotect() from making a
> >  	 * write-sealed mapping writable in future.
> >  	 */
> > -	*vm_flags_ptr &= ~VM_MAYWRITE;
> > +	vma_flags_clear(vma_flags_ptr, VMA_MAYWRITE_BIT);
> >
> >  	return 0;
> >  }
>
> This function alone changed its original behavior, since vm_flags is a
> snapshot of *vm_flags_ptr, but after the change this snapshot is gone.
> But its only caller memfd_check_seals_mmap() gets vm_flags_ptr from the
> input parameter of do_mmap(), so the overall behavior does not change.

Right yeah, the snapshot was always just a convenience thing :)

>
> <snip>
>
> > +		case MAP_DROPPABLE: {
> > +			vma_flags_t droppable = VMA_DROPPABLE;
> > +
> > +			if (vma_flags_empty(&droppable))
> >  				return -EOPNOTSUPP;
> > +			vma_flags_set_mask(&vma_flags, droppable);
> > +
> >  			/*
> >  			 * A locked or stack area makes no sense to be droppable.
> >  			 *
> > @@ -515,23 +527,24 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
> >  			 */
> >  			if (flags & (MAP_LOCKED | MAP_HUGETLB))
> >  			        return -EINVAL;
> > -			if (vm_flags & (VM_GROWSDOWN | VM_GROWSUP))
> > +			if (vma_flags_can_grow(&vma_flags))
> >  			        return -EINVAL;
> >
> > -			vm_flags |= VM_DROPPABLE;
> > -
>
> Lance pointed out the reordering of setting VMA_DROPPABLE and checking
> of can_grow, but these flags are not overlapped and there is no parallel
> writer to vma_flags. So it is still no functional change, just not
> mechanical changes. :)

Right yes exactly :)

>
> Otherwise, LGTM.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

>
> --
> Best Regards,
> Yan, Zi
>

Cheers, Lorenzo
