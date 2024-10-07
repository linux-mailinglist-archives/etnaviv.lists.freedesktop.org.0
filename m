Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897D39928DE
	for <lists+etnaviv@lfdr.de>; Mon,  7 Oct 2024 12:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6838410E365;
	Mon,  7 Oct 2024 10:12:49 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D0B10E365
 for <etnaviv@lists.freedesktop.org>; Mon,  7 Oct 2024 10:12:47 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sxkjK-0006J2-5b; Mon, 07 Oct 2024 12:12:42 +0200
Message-ID: <b93c08b0bab16c86190ca186f20d2cb036a4b8d0.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/etnaviv: Track GPU VA size separately
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 07 Oct 2024 12:12:41 +0200
In-Reply-To: <20241004194207.1013744-2-sui.jingfeng@linux.dev>
References: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
 <20241004194207.1013744-2-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Samstag, dem 05.10.2024 um 03:42 +0800 schrieb Sui Jingfeng:
> Etnaviv assumes that GPU page size is 4KiB, yet on some systems, the CPU
> page size is 16KiB. The size of etnaviv buffer objects will be aligned
> to CPU page size on kernel side, however, userspace still assumes the
> page size is 4KiB and doing allocation with 4KiB page as unit. This
> results in userspace allocated GPU virtual address range collision and
> therefore unable to be inserted to the specified hole exactly.
>=20
> The root cause is that kernel side BO takes up bigger address space than
> userspace assumes when the size of it is not CPU page size aligned. To
> Preserve GPU VA continuous as much as possible, track the size that
> userspace/GPU think of it is.
>=20
> Yes, we still need to overallocate to suit the CPU, but there is no need
> to waste GPU VA space anymore.
>=20
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 8 +++++---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h | 1 +
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 8 ++++----
>  3 files changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index 5c0c9d4e3be1..943fc20093e6 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -543,7 +543,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_=
object_funcs =3D {
>  	.vm_ops =3D &vm_ops,
>  };
> =20
> -static int etnaviv_gem_new_impl(struct drm_device *dev, u32 flags,
> +static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 fl=
ags,
>  	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
>  {
>  	struct etnaviv_gem_object *etnaviv_obj;
> @@ -570,6 +570,7 @@ static int etnaviv_gem_new_impl(struct drm_device *de=
v, u32 flags,
>  	if (!etnaviv_obj)
>  		return -ENOMEM;
> =20
> +	etnaviv_obj->user_size =3D size;
>  	etnaviv_obj->flags =3D flags;
>  	etnaviv_obj->ops =3D ops;
> =20
> @@ -588,11 +589,12 @@ int etnaviv_gem_new_handle(struct drm_device *dev, =
struct drm_file *file,
>  {
>  	struct etnaviv_drm_private *priv =3D dev->dev_private;
>  	struct drm_gem_object *obj =3D NULL;
> +	unsigned int user_size =3D size;

This still needs to be be aligned to 4K. Userspace may request
unaligned buffer sizes and we don't want to risk any confusion about
which part is visible to the GPU, so better make sure this size is
aligned to the GPU page size.

Also, that more personal preference, but I would call this gpu_size or
something like that, to avoid any confusion with the user_size in
etnaviv_cmdbuf, where user_size doesn't denote the GPU visible size.

Regards,
Lucas

>  	int ret;
> =20
>  	size =3D PAGE_ALIGN(size);
> =20
> -	ret =3D etnaviv_gem_new_impl(dev, flags, &etnaviv_gem_shmem_ops, &obj);
> +	ret =3D etnaviv_gem_new_impl(dev, user_size, flags, &etnaviv_gem_shmem_=
ops, &obj);
>  	if (ret)
>  		goto fail;
> =20
> @@ -627,7 +629,7 @@ int etnaviv_gem_new_private(struct drm_device *dev, s=
ize_t size, u32 flags,
>  	struct drm_gem_object *obj;
>  	int ret;
> =20
> -	ret =3D etnaviv_gem_new_impl(dev, flags, ops, &obj);
> +	ret =3D etnaviv_gem_new_impl(dev, size, flags, ops, &obj);
>  	if (ret)
>  		return ret;
> =20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etna=
viv/etnaviv_gem.h
> index a42d260cac2c..c6e27b9abb0c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> @@ -36,6 +36,7 @@ struct etnaviv_gem_object {
>  	const struct etnaviv_gem_ops *ops;
>  	struct mutex lock;
> =20
> +	u32 user_size;
>  	u32 flags;
> =20
>  	struct list_head gem_node;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etna=
viv/etnaviv_mmu.c
> index 1661d589bf3e..6fbc62772d85 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -281,6 +281,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_contex=
t *context,
>  {
>  	struct sg_table *sgt =3D etnaviv_obj->sgt;
>  	struct drm_mm_node *node;
> +	unsigned int user_size;
>  	int ret;
> =20
>  	lockdep_assert_held(&etnaviv_obj->lock);
> @@ -303,13 +304,12 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_cont=
ext *context,
>  	}
> =20
>  	node =3D &mapping->vram_node;
> +	user_size =3D etnaviv_obj->user_size;
> =20
>  	if (va)
> -		ret =3D etnaviv_iommu_insert_exact(context, node,
> -						 etnaviv_obj->base.size, va);
> +		ret =3D etnaviv_iommu_insert_exact(context, node, user_size, va);
>  	else
> -		ret =3D etnaviv_iommu_find_iova(context, node,
> -					      etnaviv_obj->base.size);
> +		ret =3D etnaviv_iommu_find_iova(context, node, user_size);
>  	if (ret < 0)
>  		goto unlock;
> =20

