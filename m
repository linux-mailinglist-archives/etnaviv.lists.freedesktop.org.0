Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBC14DB79A
	for <lists+etnaviv@lfdr.de>; Wed, 16 Mar 2022 18:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B4810E81A;
	Wed, 16 Mar 2022 17:51:38 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FE110E81A
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Mar 2022 17:51:38 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nUXo8-0003BX-Sk; Wed, 16 Mar 2022 18:51:36 +0100
Message-ID: <3c46483cc1791616b41993e387b9153f470df837.camel@pengutronix.de>
Subject: Re: [PATCH RFT] drm/etnaviv: reap idle softpin mappings when necessary
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Date: Wed, 16 Mar 2022 18:51:36 +0100
In-Reply-To: <YjIgZif16Ppzeofh@qwark.sigxcpu.org>
References: <20211217205936.153220-1-l.stach@pengutronix.de>
 <YjIgZif16Ppzeofh@qwark.sigxcpu.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Guido,

Am Mittwoch, dem 16.03.2022 um 18:37 +0100 schrieb Guido Günther:
> Hi Lucas,
> On Fri, Dec 17, 2021 at 09:59:36PM +0100, Lucas Stach wrote:
> > Right now the only point where softpin mappings get removed from the
> > MMU context is when the mapped GEM object is destroyed. However,
> > userspace might want to reuse that address space before the object
> > is destroyed, which is a valid usage, as long as all mapping in that
> > region of the address space are no longer used by any GPU jobs.
> > 
> > Implement reaping of idle MMU mappings that would otherwise
> > prevent the insertion of a softpin mapping.
> 
> Looking at current Linus tree and next it seems the patch never got
> submitted. Is there anything missing?

Yes, there is still a interaction between the gem close path and this
reaping that I didn't get around yet to fully reason about. I'm not
confident in committing this change without thinking this through, as
it might introduce a kernel memory corruption.

Regards,
Lucas

> Cheers,
>  -- Guido
> 
> > 
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 39 +++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> > index 9fb1a2aadbcb..9111288b4062 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> > @@ -219,8 +219,47 @@ static int etnaviv_iommu_find_iova(struct etnaviv_iommu_context *context,
> >  static int etnaviv_iommu_insert_exact(struct etnaviv_iommu_context *context,
> >  		   struct drm_mm_node *node, size_t size, u64 va)
> >  {
> > +	struct etnaviv_vram_mapping *m, *n;
> > +	struct drm_mm_node *scan_node;
> > +	LIST_HEAD(scan_list);
> > +	int ret;
> > +
> >  	lockdep_assert_held(&context->lock);
> >  
> > +	ret = drm_mm_insert_node_in_range(&context->mm, node, size, 0, 0, va,
> > +					  va + size, DRM_MM_INSERT_LOWEST);
> > +	if (ret != -ENOSPC)
> > +		return ret;
> > +
> > +	/*
> > +	 * When we can't insert the node, due to a existing mapping blocking
> > +	 * the address space, there are two possible reasons:
> > +	 * 1. Userspace genuinely messed up and tried to reuse address space
> > +	 * before the last job using this VMA has finished executing.
> > +	 * 2. The existing buffer mappings are idle, but the buffers are not
> > +	 * destroyed yet (likely due to being referenced by another context) in
> > +	 * which case the mappings will not be cleaned up and we must reap them
> > +	 * here to make space for the new mapping.
> > +	 */
> > +
> > +	drm_mm_for_each_node_in_range(scan_node, &context->mm, va, va + size) {
> > +		m = container_of(scan_node, struct etnaviv_vram_mapping,
> > +				 vram_node);
> > +
> > +		if (m->use)
> > +			return -ENOSPC;
> > +
> > +		list_add(&m->scan_node, &scan_list);
> > +	}
> > +
> > +	list_for_each_entry_safe(m, n, &scan_list, scan_node) {
> > +		etnaviv_iommu_remove_mapping(context, m);
> > +		etnaviv_iommu_context_put(m->context);
> > +		m->context = NULL;
> > +		list_del_init(&m->mmu_node);
> > +		list_del_init(&m->scan_node);
> > +	}
> > +
> >  	return drm_mm_insert_node_in_range(&context->mm, node, size, 0, 0, va,
> >  					   va + size, DRM_MM_INSERT_LOWEST);
> >  }
> > -- 
> > 2.31.1
> > 


