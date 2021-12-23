Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D92AC47E559
	for <lists+etnaviv@lfdr.de>; Thu, 23 Dec 2021 16:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837DB10E26A;
	Thu, 23 Dec 2021 15:13:19 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 494 seconds by postgrey-1.36 at gabe;
 Thu, 23 Dec 2021 15:13:18 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AB410E26A
 for <etnaviv@lists.freedesktop.org>; Thu, 23 Dec 2021 15:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id C3625FB03;
 Thu, 23 Dec 2021 16:05:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x1Woeusw7in0; Thu, 23 Dec 2021 16:05:01 +0100 (CET)
Date: Thu, 23 Dec 2021 16:04:59 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH RFT] drm/etnaviv: reap idle softpin mappings when necessary
Message-ID: <YcSQGyO11b1jlMdr@qwark.sigxcpu.org>
References: <20211217205936.153220-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211217205936.153220-1-l.stach@pengutronix.de>
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

Hi Lucas,
On Fri, Dec 17, 2021 at 09:59:36PM +0100, Lucas Stach wrote:
> Right now the only point where softpin mappings get removed from the
> MMU context is when the mapped GEM object is destroyed. However,
> userspace might want to reuse that address space before the object
> is destroyed, which is a valid usage, as long as all mapping in that
> region of the address space are no longer used by any GPU jobs.
> 
> Implement reaping of idle MMU mappings that would otherwise
> prevent the insertion of a softpin mapping.

Thanks. I couldn't break that with my usual test cases. The code also
looks good to me but since I made more than one mistake in that area
already i went for Acked-by instead of Reviewed-by.

Tested-by: Guido Günther <agx@sigxcpu.org>
Acked-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido


> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 39 +++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> index 9fb1a2aadbcb..9111288b4062 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -219,8 +219,47 @@ static int etnaviv_iommu_find_iova(struct etnaviv_iommu_context *context,
>  static int etnaviv_iommu_insert_exact(struct etnaviv_iommu_context *context,
>  		   struct drm_mm_node *node, size_t size, u64 va)
>  {
> +	struct etnaviv_vram_mapping *m, *n;
> +	struct drm_mm_node *scan_node;
> +	LIST_HEAD(scan_list);
> +	int ret;
> +
>  	lockdep_assert_held(&context->lock);
>  
> +	ret = drm_mm_insert_node_in_range(&context->mm, node, size, 0, 0, va,
> +					  va + size, DRM_MM_INSERT_LOWEST);
> +	if (ret != -ENOSPC)
> +		return ret;
> +
> +	/*
> +	 * When we can't insert the node, due to a existing mapping blocking
> +	 * the address space, there are two possible reasons:
> +	 * 1. Userspace genuinely messed up and tried to reuse address space
> +	 * before the last job using this VMA has finished executing.
> +	 * 2. The existing buffer mappings are idle, but the buffers are not
> +	 * destroyed yet (likely due to being referenced by another context) in
> +	 * which case the mappings will not be cleaned up and we must reap them
> +	 * here to make space for the new mapping.
> +	 */
> +
> +	drm_mm_for_each_node_in_range(scan_node, &context->mm, va, va + size) {
> +		m = container_of(scan_node, struct etnaviv_vram_mapping,
> +				 vram_node);
> +
> +		if (m->use)
> +			return -ENOSPC;
> +
> +		list_add(&m->scan_node, &scan_list);
> +	}
> +
> +	list_for_each_entry_safe(m, n, &scan_list, scan_node) {
> +		etnaviv_iommu_remove_mapping(context, m);
> +		etnaviv_iommu_context_put(m->context);
> +		m->context = NULL;
> +		list_del_init(&m->mmu_node);
> +		list_del_init(&m->scan_node);
> +	}
> +
>  	return drm_mm_insert_node_in_range(&context->mm, node, size, 0, 0, va,
>  					   va + size, DRM_MM_INSERT_LOWEST);
>  }
> -- 
> 2.31.1
> 
