Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209BA1DB02A
	for <lists+etnaviv@lfdr.de>; Wed, 20 May 2020 12:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C2389CF2;
	Wed, 20 May 2020 10:29:23 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585A189CF2
 for <etnaviv@lists.freedesktop.org>; Wed, 20 May 2020 10:29:23 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jbLyS-0004HF-Sa; Wed, 20 May 2020 12:29:20 +0200
Message-ID: <d7a0646840374e1d7515bfea7da2badd94df0042.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: fix memory leak when mapping prime
 imported buffers
From: Lucas Stach <l.stach@pengutronix.de>
To: Martin Fuzzey <martin.fuzzey@flowbird.group>
Date: Wed, 20 May 2020 12:29:19 +0200
In-Reply-To: <1589969500-6554-1-git-send-email-martin.fuzzey@flowbird.group>
References: <1589969500-6554-1-git-send-email-martin.fuzzey@flowbird.group>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Martin,

Am Mittwoch, den 20.05.2020, 12:10 +0200 schrieb Martin Fuzzey:
> When using mmap() on a prime imported buffer allocated by a
> different driver (such as imx-drm) the later munmap() does
> not correctly decrement the refcount of the original enaviv_gem_object,
> leading to a leak.
> 
> Signed-off-by: Martin Fuzzey <martin.fuzzey@flowbird.group>
> Cc: stable@vger.kernel.org

What's the use-case where you did hit this issue? mmap'ing of imported
buffers through the etnaviv DRM device is currently not well defined
and I was pondering the idea of forbidding it completely by not
returning a mmap offset for those objects.

Regards,
Lucas

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index f24dd21..28a01b8 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -93,7 +93,25 @@ static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *etnaviv_obj)
>  static int etnaviv_gem_prime_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
>  		struct vm_area_struct *vma)
>  {
> -	return dma_buf_mmap(etnaviv_obj->base.dma_buf, vma, 0);
> +	int ret;
> +
> +	ret = dma_buf_mmap(etnaviv_obj->base.dma_buf, vma, 0);
> +
> +	/* drm_gem_mmap_obj() has already been called before this function
> +	 * and has incremented our refcount, expecting it to be decremented
> +	 * on unmap() via drm_gem_vm_close().
> +	 * However dma_buf_mmap() invokes drm_gem_cma_prime_mmap()
> +	 * that ends up updating the vma->vma_private_data to point to the
> +	 * dma_buf's gem object.
> +	 * Hence our gem object here will not have its refcount decremented
> +	 * when userspace does unmap().
> +	 * So decrement the refcount here to avoid a memory leak if the dma
> +	 * buf mapping was successful.
> +	 */
> +	if (!ret)
> +		drm_gem_object_put_unlocked(&etnaviv_obj->base);
> +
> +	return ret;
>  }
>  
>  static const struct etnaviv_gem_ops etnaviv_gem_prime_ops = {

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
