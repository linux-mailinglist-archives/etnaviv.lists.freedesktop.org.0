Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IZ75GKhsRmo5UQsAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 15:50:32 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28006F8862
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 15:50:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=SBk2LGdo;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=linux.dev
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C187710F3C1;
	Thu,  2 Jul 2026 13:50:30 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502C510F3C1
 for <etnaviv@lists.freedesktop.org>; Thu,  2 Jul 2026 13:50:30 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1783000216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7JedrMMFsZ3SA9xp8Er9WQ7Q5NWmS7gMbpQ8O+PQSg=;
 b=SBk2LGdo8O2Fh816oQbqXrmhKAQAYAxHqV6r2z//9k66SRzp2XfssdY3VkdvqTHoJEhhne
 KBLV5b7WimMmbUd67b8UpLhwJTAsCl8UHKUpcr3XwD//YOwU43JswyAPjZ9yhLgdwnTOAg
 TszqN8wOwdlDLsXMvuRT5nF6gC9LQmA=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 l.stach@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, peter.griffin@linaro.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, lyude@redhat.com, dakr@kernel.org,
 tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, thierry.reding@kernel.org, mperttunen@nvidia.com,
 jonathanh@nvidia.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 zack.rusin@broadcom.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com,
 deller@gmx.de, bcrl@kvack.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 muchun.song@linux.dev, osalvador@suse.de, david@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, hughd@google.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
 kees@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-fbdev@vger.kernel.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 13/13] mm/mremap: convert mremap code to use vma_flags_t
Date: Thu,  2 Jul 2026 21:49:47 +0800
Message-Id: <20260702134947.25189-1-lance.yang@linux.dev>
In-Reply-To: <380f761d35a3faa4370f8b3f92e3d4af3d4c7110.1782760670.git.ljs@kernel.org>
References: <380f761d35a3faa4370f8b3f92e3d4af3d4c7110.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.l
 inux.org.uk,m:brauner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.org,m:linux-aio@
 kvack.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lance.yang@linux.dev,etnaviv-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,etnaviv-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[83];
	FORGED_SENDER_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,linux.dev:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E28006F8862


On Mon, Jun 29, 2026 at 08:25:36PM +0100, Lorenzo Stoakes wrote:
>Replace use of the legacy vm_flags_t flags with vma_flags_t values
>throughout the mremap logic.
>
>Additionally update comments to reflect the changes to be consistent.
>
>No functional change intended.
>
>Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>---

The vm_flags_set() cases below spell out vma_start_write(), but the
vm_flags_clear() cases don't?

Thanks, Lance

> mm/mremap.c | 38 ++++++++++++++++++++------------------
> 1 file changed, 20 insertions(+), 18 deletions(-)
>
>diff --git a/mm/mremap.c b/mm/mremap.c
>index 079a0ba0c4a7..0ea43302b7ed 100644
>--- a/mm/mremap.c
>+++ b/mm/mremap.c
>@@ -68,7 +68,7 @@ struct vma_remap_struct {
> 	bool populate_expand;		/* mlock()'d expanded, must populate. */
> 	enum mremap_type remap_type;	/* expand, shrink, etc. */
> 	bool mmap_locked;		/* Is mm currently write-locked? */
>-	unsigned long charged;		/* If VM_ACCOUNT, # pages to account. */
>+	unsigned long charged;		/* If VMA_ACCOUNT_BIT, # pgs to account */
> 	bool vmi_needs_invalidate;	/* Is the VMA iterator invalidated? */
> };
> 
>@@ -954,7 +954,7 @@ static unsigned long vrm_set_new_addr(struct vma_remap_struct *vrm)
> 
> 	if (vrm->flags & MREMAP_FIXED)
> 		map_flags |= MAP_FIXED;
>-	if (vma->vm_flags & VM_MAYSHARE)
>+	if (vma_test(vma, VMA_MAYSHARE_BIT))
> 		map_flags |= MAP_SHARED;
> 
> 	res = get_unmapped_area(vma->vm_file, new_addr, vrm->new_len, pgoff,
>@@ -976,7 +976,7 @@ static bool vrm_calc_charge(struct vma_remap_struct *vrm)
> {
> 	unsigned long charged;
> 
>-	if (!(vrm->vma->vm_flags & VM_ACCOUNT))
>+	if (!vma_test(vrm->vma, VMA_ACCOUNT_BIT))
> 		return true;
> 
> 	/*
>@@ -1003,7 +1003,7 @@ static bool vrm_calc_charge(struct vma_remap_struct *vrm)
>  */
> static void vrm_uncharge(struct vma_remap_struct *vrm)
> {
>-	if (!(vrm->vma->vm_flags & VM_ACCOUNT))
>+	if (!vma_test(vrm->vma, VMA_ACCOUNT_BIT))
> 		return;
> 
> 	vm_unacct_memory(vrm->charged);
>@@ -1023,7 +1023,7 @@ static void vrm_stat_account(struct vma_remap_struct *vrm,
> 	struct vm_area_struct *vma = vrm->vma;
> 
> 	vm_stat_account(mm, vma->vm_flags, pages);
>-	if (vma->vm_flags & VM_LOCKED)
>+	if (vma_test(vma, VMA_LOCKED_BIT))
> 		mm->locked_vm += pages;
> }
> 
>@@ -1167,7 +1167,7 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
> 	 * arose, in which case we _do_ wish to unmap the _new_ VMA, which means
> 	 * we actually _do_ want it be unaccounted.
> 	 */
>-	bool accountable_move = (vma->vm_flags & VM_ACCOUNT) &&
>+	bool accountable_move = vma_test(vma, VMA_ACCOUNT_BIT) &&
> 		!(vrm->flags & MREMAP_DONTUNMAP);
> 
> 	/*
>@@ -1186,7 +1186,7 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
> 	 * portions of the original VMA that remain.
> 	 */
> 	if (accountable_move) {
>-		vm_flags_clear(vma, VM_ACCOUNT);
>+		vma_clear_flags(vma, VMA_ACCOUNT_BIT);
> 		/* We are about to split vma, so store the start/end. */
> 		vm_start = vma->vm_start;
> 		vm_end = vma->vm_end;
>@@ -1211,8 +1211,8 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
> 	 * |             |
> 	 * |-------------|
> 	 *
>-	 * Having cleared VM_ACCOUNT from the whole VMA, after we unmap above
>-	 * we'll end up with:
>+	 * Having cleared VMA_ACCOUNT_BIT from the whole VMA, after we unmap
>+	 * above we'll end up with:
> 	 *
> 	 *    addr  end
> 	 *     |     |
>@@ -1232,13 +1232,15 @@ static void unmap_source_vma(struct vma_remap_struct *vrm)
> 		if (vm_start < addr) {
> 			struct vm_area_struct *prev = vma_prev(&vmi);
> 
>-			vm_flags_set(prev, VM_ACCOUNT); /* Acquires VMA lock. */
>+			vma_start_write(prev);
>+			vma_set_flags(prev, VMA_ACCOUNT_BIT);
> 		}
> 
> 		if (vm_end > end) {
> 			struct vm_area_struct *next = vma_next(&vmi);
> 
>-			vm_flags_set(next, VM_ACCOUNT); /* Acquires VMA lock. */
>+			vma_start_write(next);
>+			vma_set_flags(next, VMA_ACCOUNT_BIT);
> 		}
> 	}
> }
>@@ -1321,8 +1323,8 @@ static void dontunmap_complete(struct vma_remap_struct *vrm,
> 	unsigned long old_start = vrm->vma->vm_start;
> 	unsigned long old_end = vrm->vma->vm_end;
> 
>-	/* We always clear VM_LOCKED[ONFAULT] on the old VMA. */
>-	vm_flags_clear(vrm->vma, VM_LOCKED_MASK);
>+	/* We always clear VMA_LOCKED[ONFAULT]_BIT on the old VMA. */
>+	vma_clear_flags_mask(vrm->vma, VMA_LOCKED_MASK);
> 
> 	/*
> 	 * anon_vma links of the old vma is no longer needed after its page
>@@ -1758,14 +1760,14 @@ static int check_prep_vma(struct vma_remap_struct *vrm)
> 	 * based on the original.  There are no known use cases for this
> 	 * behavior.  As a result, fail such attempts.
> 	 */
>-	if (!old_len && !(vma->vm_flags & (VM_SHARED | VM_MAYSHARE))) {
>+	if (!old_len && !vma_test_any(vma, VMA_SHARED_BIT, VMA_MAYSHARE_BIT)) {
> 		pr_warn_once("%s (%d): attempted to duplicate a private mapping with mremap.  This is not supported.\n",
> 			     current->comm, current->pid);
> 		return -EINVAL;
> 	}
> 
> 	if ((vrm->flags & MREMAP_DONTUNMAP) &&
>-			(vma->vm_flags & (VM_DONTEXPAND | VM_PFNMAP)))
>+	    vma_test_any(vma, VMA_DONTEXPAND_BIT, VMA_PFNMAP_BIT))
> 		return -EINVAL;
> 
> 	/*
>@@ -1795,7 +1797,7 @@ static int check_prep_vma(struct vma_remap_struct *vrm)
> 		return 0;
> 
> 	/* We are expanding and the VMA is mlock()'d so we need to populate. */
>-	if (vma->vm_flags & VM_LOCKED)
>+	if (vma_test(vma, VMA_LOCKED_BIT))
> 		vrm->populate_expand = true;
> 
> 	/* Need to be careful about a growing mapping */
>@@ -1803,10 +1805,10 @@ static int check_prep_vma(struct vma_remap_struct *vrm)
> 	if (pgoff + (new_len >> PAGE_SHIFT) < pgoff)
> 		return -EINVAL;
> 
>-	if (vma->vm_flags & (VM_DONTEXPAND | VM_PFNMAP))
>+	if (vma_test_any(vma, VMA_DONTEXPAND_BIT, VMA_PFNMAP_BIT))
> 		return -EFAULT;
> 
>-	if (!mlock_future_ok(mm, vma->vm_flags & VM_LOCKED, vrm->delta))
>+	if (!mlock_future_ok(mm, vma_test(vma, VMA_LOCKED_BIT), vrm->delta))
> 		return -EAGAIN;
> 
> 	if (!may_expand_vm(mm, &vma->flags, vrm->delta >> PAGE_SHIFT))
>-- 
>2.54.0
>
>
