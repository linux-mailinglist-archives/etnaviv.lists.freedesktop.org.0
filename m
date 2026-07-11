Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PxrUGO54UmoSQQMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sat, 11 Jul 2026 19:10:06 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DDA742575
	for <lists+etnaviv@lfdr.de>; Sat, 11 Jul 2026 19:10:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=k3fNhKS6;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3CD10E3A9;
	Sat, 11 Jul 2026 17:10:04 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6550110E3A9;
 Sat, 11 Jul 2026 17:10:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3878D6111A;
 Sat, 11 Jul 2026 17:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6F71F000E9;
 Sat, 11 Jul 2026 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783789801;
 bh=AvtNjMXUVGcPIUxCxCfqbdEtpU8jR9HOTGYaAlW6IJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=k3fNhKS66r/p/o8Bc1xI7ewhTioGM5eE5UxTbAfHwiEEG5NZOQoHjazK2cWX+6/SE
 v+U9r2rkD4VP0CNSplf/nSgPr33pdrLmGKOrJy6x0c8Xsnfudte+l8CuZRkvsJHzhL
 2xzdkO2v+Q+2PPXWrMuMSvbGqEw9CmT9+ZHMiG1WT8jUC5NdwLiZsm50xu5zeD+/aW
 zvImcxhwsTnEPAUhEbcG4TpZeBj1kqZVb6dm8VWTrMRJu36W2lybHuDy0lpFg0MMPF
 ANsT8GKLEgijBVcxkcvqBp+1nPOUHmAwPtV+5/DPz8eLqjTPOJ42AuY6RZqVPq55n+
 bc2Qco/fVIOQQ==
Date: Sat, 11 Jul 2026 18:09:35 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, 
 tsbogend@alpha.franken.de, maddy@linux.ibm.com, mpe@ellerman.id.au, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, l.stach@pengutronix.de, inki.dae@samsung.com, 
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org, 
 peter.griffin@linaro.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tursulin@ursulin.net, robin.clark@oss.qualcomm.com, 
 lumag@kernel.org, lyude@redhat.com, dakr@kernel.org, 
 tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, 
 thierry.reding@kernel.org, mperttunen@nvidia.com, jonathanh@nvidia.com,
 kraxel@redhat.com, 
 dmitry.osipenko@collabora.com, zack.rusin@broadcom.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com,
 deller@gmx.de, bcrl@kvack.org, 
 viro@zeniv.linux.org.uk, brauner@kernel.org, muchun.song@linux.dev,
 osalvador@suse.de, 
 david@kernel.org, baolin.wang@linux.alibaba.com, liam@infradead.org, 
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
 hughd@google.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
 mhocko@suse.com, jannh@google.com, pfalcato@suse.de, kees@kernel.org, 
 perex@perex.cz, tiwai@suse.com, linux-mips@vger.kernel.org, 
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
Subject: Re: [PATCH 13/13] mm/mremap: convert mremap code to use vma_flags_t
Message-ID: <alJ4VPr7Igk3SJYt@lucifer>
References: <380f761d35a3faa4370f8b3f92e3d4af3d4c7110.1782760670.git.ljs@kernel.org>
 <20260702134947.25189-1-lance.yang@linux.dev>
 <akaJx8Zt8kazlrjq@lucifer> <DJTOP760MDDG.2KUSKD8WVVKJ5@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJTOP760MDDG.2KUSKD8WVVKJ5@nvidia.com>
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
	FREEMAIL_CC(0.00)[linux.dev,linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2DDA742575

On Wed, Jul 08, 2026 at 10:28:00PM -0400, Zi Yan wrote:
> On Thu Jul 2, 2026 at 12:07 PM EDT, Lorenzo Stoakes wrote:
> > On Thu, Jul 02, 2026 at 09:49:47PM +0800, Lance Yang wrote:
> >>
> >> On Mon, Jun 29, 2026 at 08:25:36PM +0100, Lorenzo Stoakes wrote:
> >> >Replace use of the legacy vm_flags_t flags with vma_flags_t values
> >> >throughout the mremap logic.
> >> >
> >> >Additionally update comments to reflect the changes to be consistent.
> >> >
> >> >No functional change intended.
> >> >
> >> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >> >---
> >>
> >> The vm_flags_set() cases below spell out vma_start_write(), but the
> >> vm_flags_clear() cases don't?
> >
> > Yep as I said elsewhere, implicitly taking the lock is terrible and me doing
> > this is completely on purpose to get rid of that :)
> >
> > But I haven't been clear enough clearly, so I should put the argument as to why
> > that's ok in the commit message.
> >
> > Will do so on respin.
>
> How about also add a comment to vma_clear*() telling us a lock is not
> needed and why like you explained a lock is needed for vma_set*()?
> This asymmetry could confuse people.

Well you do absolutely have to hold the lock once the VMA is initialised when
using any VMA flags API that manipulates flags (apart from the explicitly atomic
case).

The argument here is that the VMA was _already locked_ at the point of clearing
:)

>
> This patch looks good to me.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

>
> --
> Best Regards,
> Yan, Zi
>

Cheers, Lorenzo
