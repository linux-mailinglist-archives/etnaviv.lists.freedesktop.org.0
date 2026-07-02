Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F6AtD9CCRmphXgsAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 17:25:04 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962926F95FF
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 17:25:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="kbG+cL/z";
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EEA10F465;
	Thu,  2 Jul 2026 15:25:02 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C89610F480;
 Thu,  2 Jul 2026 15:25:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C929640801;
 Thu,  2 Jul 2026 15:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0E41F000E9;
 Thu,  2 Jul 2026 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783005900;
 bh=LX3BYrLY2k63JpXB67A/Bjg+Ew5yjhUF+WJZEyA1fRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=kbG+cL/z/Lm6qSE4udnGibaK8FsMK4daZd2R+hoEFAnemIecEE1GgHP0X+YmGanAO
 lUy6V/tOsn4eLItop07tyF1+tKZLAB376Z73zBZZR/VxVccPToewSf2zWsClidLb0a
 1ba3VdHACF4EGJhQZxBSvTHBcWlMH/zUclnichRT0/C3hk+pIj4TS7GYchozD+ZWNu
 evu0CqyUEndELEE8NUvVmpXBep2Kukvvzwrnf2DWGzh4uAWg/PKpNORRO9bOZEjI+M
 pMTZGas90E8+KBulzvC/BZdad1hSIx2FR4a50cjXxyZVyxi/oq6E9v6gCdozTTgwHV
 VbLDs0NzwuGjg==
Date: Thu, 2 Jul 2026 16:24:37 +0100
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
Subject: Re: [PATCH 05/13] mm: prefer mm->def_vma_flags in mm logic
Message-ID: <akaCFf_SjccZznnP@lucifer>
References: <3b4ccdc38819b42ddc79ee5a795831208ac7986c.1782760670.git.ljs@kernel.org>
 <20260702121022.49113-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702121022.49113-1-lance.yang@linux.dev>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,linux.dev:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 962926F95FF

On Thu, Jul 02, 2026 at 08:10:22PM +0800, Lance Yang wrote:
>
> On Mon, Jun 29, 2026 at 08:25:28PM +0100, Lorenzo Stoakes wrote:
> >Currently mm->def_flags (of type vm_flags_t) is union'd with
> >mm->def_vma_flags (of type vma_flags_t).
> >
> >As part of the effort to convert vm_flags_t usage to vma_flags_t (in order
> >to no longer be arbitrarily limited to a system word size for VMA flags),
> >prefer mm->def_vma_flags to mm->def_flags throughout the mm logic.
> >
> >No functional change intended.
> >
> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >---
> > mm/debug.c |  2 +-
> > mm/mlock.c | 13 +++++++------
> > mm/mmap.c  | 11 ++++++-----
> > mm/vma.c   |  4 ++--
> > 4 files changed, 16 insertions(+), 14 deletions(-)
> >
> >diff --git a/mm/debug.c b/mm/debug.c
> >index 497654b36f1a..f0a354a9496a 100644
> >--- a/mm/debug.c
> >+++ b/mm/debug.c
> >@@ -226,7 +226,7 @@ void dump_mm(const struct mm_struct *mm)
> > 		mm->numa_next_scan, mm->numa_scan_offset, mm->numa_scan_seq,
> > #endif
> > 		atomic_read(&mm->tlb_flush_pending),
> >-		mm->def_flags, &mm->def_flags
> >+		vma_flags_to_legacy(mm->def_vma_flags), &mm->def_vma_flags
> > 	);
>
> While at it, one thing for later: dump_mm() still assumes one-world VMA
> flags. That works today since vma_flags_t is one word. Maybe worth a
> BUILD_BUG_ON() here, before that stops being true?

Ah yeah that could actually be pretty straightforward, if you see
https://www.kernel.org/doc/Documentation/printk-formats.txt there is a bitmap
format that could be used.

Can do that on a respin!

>
> Not a big deal though. Feel free to add:
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
>
> > }
> > EXPORT_SYMBOL(dump_mm);
> [...]

Cheers, Lorenzo
