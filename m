Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dliNCeuDRmq3XgsAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 17:29:47 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650596F9698
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 17:29:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EZDY+QGc;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C1510E0D8;
	Thu,  2 Jul 2026 15:29:45 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4E210E0D8;
 Thu,  2 Jul 2026 15:29:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 25A4F418F4;
 Thu,  2 Jul 2026 15:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7DF1F000E9;
 Thu,  2 Jul 2026 15:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783006184;
 bh=AmvNH9wwHqyoIMesePnV6/zMDBtlSz51dFh4yHJ1BTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=EZDY+QGcsghhDIw9rxbIhnPAJRijthrModhJ3dAoSN5cVM+YkTpcpEvD+KPlh/M/u
 Qwt3kZkRl2OzXpZ8lNBF20cEMvcQmjr2C3N0OBOmi3krbMnyRHMJTEBJXrtiCGLkys
 hVceGk9nKeLivyWhhq1nb1heVf5ntbaXnUG4S4OpDlt89/1RU+lLBy/OziQBm1WY0f
 mLETtt6Kv1hVTKJQz++mgHlN+PUF+ac9yH5QtMrmNRfTW7GoeSyD7Rts3hi3Don33s
 UtJfTmtwGOSlfBDJEzVdm8IjgP96nHmx5GxFIPDKfkfCebxxa9UBrNHRuHW+T6BGzw
 FkrA9PbgKP9aQ==
Date: Thu, 2 Jul 2026 16:29:20 +0100
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
Subject: Re: [PATCH 06/13] mm/vma: convert vm_pgprot_modify() to use
 vma_flags_t and rename
Message-ID: <akaC-xxNr8ZyN4aH@lucifer>
References: <548ba81b2971734d4d2143237ad1465bd1b2f525.1782760670.git.ljs@kernel.org>
 <20260702122116.65642-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702122116.65642-1-lance.yang@linux.dev>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,lucifer:mid,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 650596F9698

On Thu, Jul 02, 2026 at 08:21:16PM +0800, Lance Yang wrote:
>
> On Mon, Jun 29, 2026 at 08:25:29PM +0100, Lorenzo Stoakes wrote:
> >Update vm_pgprot_modify() to use the new VMA flags type vma_flags_t, and
> >rename to vma_pgprot_modify() accordingly.
> >
> >This is part of the ongoing work to convert vm_flags_t to vma_flags_t, in
> >order to eliminate the arbitrary limit of the number of bits in a system
> >word on available VMA flags.
> >
> >Update VMA userland tests accordingly, updating vma_set_page_prot() to no
> >longer inline vma_pgprot_modify(), rather we can simply define
> >vma_pgprot_modify() as a static inline function and the tests will pick it
> >up from vma.h.
> >
> >No functional change intended.
> >
> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >---
> [...]
> >diff --git a/mm/vma.h b/mm/vma.h
> >index bcf0c2773449..6a8abb8ae937 100644
> >--- a/mm/vma.h
> >+++ b/mm/vma.h
> >@@ -522,9 +522,11 @@ static inline bool vma_wants_manual_pte_write_upgrade(struct vm_area_struct *vma
> > }
> >
> > #ifdef CONFIG_MMU
> >-static inline pgprot_t vm_pgprot_modify(pgprot_t oldprot, vm_flags_t vm_flags)
> >+static inline pgprot_t vma_pgprot_modify(pgprot_t oldprot, vma_flags_t vma_flags)
> > {
> >-	return pgprot_modify(oldprot, vm_get_page_prot(vm_flags));
> >+	const pgprot_t prot = vma_get_page_prot(vma_flags);
> >+
> >+	return pgprot_modify(oldprot, prot);
>
> Nit: could this just stay as a single return? something like:
>
> return pgprot_modify(oldprot, vma_get_page_prot(vma_flags));

I feel it's a bit clearer this way, separating out the two, I know it's a super
tiny difference but anyway :P

>
> Otherwise, LGTM, feel free to add:
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>

Thanks!

>
> [...]

Cheers, Lorenzo
