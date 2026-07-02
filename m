Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3A3YOdiHRmrQXwsAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 17:46:32 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927DB6F99AC
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 17:46:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Mynx6GD6;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2817310F48B;
	Thu,  2 Jul 2026 15:46:31 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1426F10F37E;
 Thu,  2 Jul 2026 15:46:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2EBA4601EE;
 Thu,  2 Jul 2026 15:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EC61F000E9;
 Thu,  2 Jul 2026 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783007187;
 bh=jvE9wSqWBUCbGMsJG9svgBUezevNvrm1MrcHHSCChso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Mynx6GD6LkebsGmUnF9MjOYGoc5t/kjVRBAa3y4hDMiI7/vl1tQdkpNYaMYBglDKt
 PpjOhV7WkyGWbA6148JfY40EHSUewPFem4EcHLSNtrDL52P+m6uRZFhhXV+p8drDP5
 krlXhtnXXcRAzWJ2KFYq3Hh8rhTgMNWOvfDO5ubcScHxjko5fhA5/oYXfBSBTm3FYZ
 q91+d//PbttUXOxvDyYYUNz2FFsT7LJ6pIAF99pcS/rpWlpmF6qsZCGqK6q0R7Cu6u
 A7jMMvK5AtByO3p0pYtd9gulxJxBI42o3AQ7j7VXEvArqPbpGQYUH4EuymRAwVZamK
 6IrFtw9w61Ysg==
Date: Thu, 2 Jul 2026 16:46:04 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, tsbogend@alpha.franken.de, 
 maddy@linux.ibm.com, mpe@ellerman.id.au, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 l.stach@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com, 
 kyungmin.park@samsung.com, krzk@kernel.org, peter.griffin@linaro.org, 
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, 
 tursulin@ursulin.net, robin.clark@oss.qualcomm.com, lumag@kernel.org,
 lyude@redhat.com, 
 dakr@kernel.org, tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com, 
 heiko@sntech.de, andy.yan@rock-chips.com, thierry.reding@kernel.org, 
 mperttunen@nvidia.com, jonathanh@nvidia.com, kraxel@redhat.com, 
 dmitry.osipenko@collabora.com, zack.rusin@broadcom.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com,
 deller@gmx.de, bcrl@kvack.org, 
 viro@zeniv.linux.org.uk, brauner@kernel.org, muchun.song@linux.dev,
 osalvador@suse.de, 
 david@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
 liam@infradead.org, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
 baohua@kernel.org, hughd@google.com, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de, 
 kees@kernel.org, perex@perex.cz, tiwai@suse.com, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-fbdev@vger.kernel.org, 
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 10/13] mm/vma: convert miscellaneous uses of VMA flags in
 core mm
Message-ID: <akaGxiTaJreEQn8T@lucifer>
References: <1e7d834c887b6a65627d730addcff13d458c6268.1782760670.git.ljs@kernel.org>
 <20260702131233.59026-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702131233.59026-1-lance.yang@linux.dev>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 927DB6F99AC

On Thu, Jul 02, 2026 at 09:12:33PM +0800, Lance Yang wrote:
>
> On Mon, Jun 29, 2026 at 08:25:33PM +0100, Lorenzo Stoakes wrote:
> >Update various uses of legacy flags in vma.c and mmap.c to the new
> >vma_flags_t type, updating comments alongside them to be consistent.
> >
> >Also update __install_special_mapping() to rearrange things slightly to
> >accommodate the changes.
> >
> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >---
> [...]
> >diff --git a/mm/vma.c b/mm/vma.c
> >index b81c05e67a61..ab2ef0f04420 100644
> >--- a/mm/vma.c
> >+++ b/mm/vma.c
> >@@ -3417,23 +3417,27 @@ struct vm_area_struct *__install_special_mapping(
> > 	vm_flags_t vm_flags, void *priv,
> > 	const struct vm_operations_struct *ops)
> > {
> >-	int ret;
> >+	vma_flags_t vma_flags = legacy_to_vma_flags(vm_flags);
> > 	struct vm_area_struct *vma;
> >+	int ret;
> >
> > 	vma = vm_area_alloc(mm);
> >-	if (unlikely(vma == NULL))
> >+	if (unlikely(!vma))
> > 		return ERR_PTR(-ENOMEM);
> >
> >-	vma_set_range(vma, addr, addr + len, 0);
> >-	vm_flags |= vma_flags_to_legacy(mm->def_vma_flags) | VM_DONTEXPAND;
> >+	vma_flags_set_mask(&vma_flags, mm->def_vma_flags);
> >+	vma_flags_set(&vma_flags, VMA_DONTEXPAND_BIT);
> > 	if (pgtable_supports_soft_dirty())
> >-		vm_flags |= VM_SOFTDIRTY;
> >-	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
> >+		vma_flags_set(&vma_flags, VMA_SOFTDIRTY_BIT);
> >+	vma_flags_clear_mask(&vma_flags, VMA_LOCKED_MASK);
> >+	vma->flags = vma_flags;
>
> Maybe worth a vma_flags_init() helper here to mirror vm_flags_init()?
> With this open-coded, we lose the soft-dirty WARN_ON_ONCE sanity check.
>
> Might be nicer to keep that check in one place ;)

I really hate all the VMA flag accessors, they conflate things horribly - we
should be explicitly taking VMA write locks when we need to (and often killable
ones actually) not assuming that a VMA flags accessor does (they should at most
assert).

This case is even more terribly egregious - you are setting flags at an
arbitrary time, why are we asserting something about softdirty?

You may update them as part of initialisation, maybe not. It's far from a
guarantee and feels like a lazy place to put it.

BUT obviously it's an oversight not to open code that here, so I'll update the
patch to do that!

I want VMA flags to be a clean stateless thing, other than the flags
themselves. Implicit, unrelated, asserts or lock acquisitions in general should
be done separately IMO.

>
> [...]

Thanks, Lorenzo
