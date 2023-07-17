Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A537756011
	for <lists+etnaviv@lfdr.de>; Mon, 17 Jul 2023 12:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311F310E21F;
	Mon, 17 Jul 2023 10:07:22 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A27710E21E
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Jul 2023 10:07:20 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qLL8L-00015l-Ud; Mon, 17 Jul 2023 12:07:14 +0200
Message-ID: <66749b1b4523d2859b9fbc6e9120e5f1e887d531.camel@pengutronix.de>
Subject: Re: [PATCH v1 8/8] drm/etnaviv: Add a helper to get a pointer to
 the first available node
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Mon, 17 Jul 2023 12:07:12 +0200
In-Reply-To: <20230623100822.274706-9-sui.jingfeng@linux.dev>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <20230623100822.274706-9-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
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
Cc: loongson-kernel@lists.loongnix.cn, Sui Jingfeng <suijingfeng@loongson.cn>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Freitag, dem 23.06.2023 um 18:08 +0800 schrieb Sui Jingfeng:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>=20
> This make the code in etnaviv_pdev_probe() less twisted, drop the referen=
ce
> to device node after finished. Also kill a double blank line.
>=20
I can't spot the double blank line you claim to remove.

> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 32 ++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 7d0eeab3e8b7..3446f8eabf59 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -27,6 +27,19 @@
>   * DRM operations:
>   */
> =20
> +/* If the DT contains at least one available GPU, return a pointer to it=
 */
> +
I think the code in the function is simple enough that we don't need a
comment explaining what it does.

Regards,
Lucas

> +static struct device_node *etnaviv_of_first_node(void)
> +{
> +	struct device_node *np;
> +
> +	for_each_compatible_node(np, NULL, "vivante,gc") {
> +		if (of_device_is_available(np))
> +			return np;
> +	}
> +
> +	return NULL;
> +}
> =20
>  static void load_gpu(struct drm_device *dev)
>  {
> @@ -587,7 +600,7 @@ static const struct component_master_ops etnaviv_mast=
er_ops =3D {
>  static int etnaviv_pdev_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct device_node *first_node =3D NULL;
> +	struct device_node *first_node;
>  	struct component_match *match =3D NULL;
> =20
>  	if (!dev->platform_data) {
> @@ -597,11 +610,10 @@ static int etnaviv_pdev_probe(struct platform_devic=
e *pdev)
>  			if (!of_device_is_available(core_node))
>  				continue;
> =20
> -			if (!first_node)
> -				first_node =3D core_node;
> -
>  			drm_of_component_match_add(&pdev->dev, &match,
>  						   component_compare_of, core_node);
> +
> +			of_node_put(core_node);
>  		}
>  	} else {
>  		char **names =3D dev->platform_data;
> @@ -634,8 +646,11 @@ static int etnaviv_pdev_probe(struct platform_device=
 *pdev)
>  	 * device as the GPU we found. This assumes that all Vivante
>  	 * GPUs in the system share the same DMA constraints.
>  	 */
> -	if (first_node)
> +	first_node =3D etnaviv_of_first_node();
> +	if (first_node) {
>  		of_dma_configure(&pdev->dev, first_node, true);
> +		of_node_put(first_node);
> +	}
> =20
>  	return component_master_add_with_match(dev, &etnaviv_master_ops, match)=
;
>  }
> @@ -709,17 +724,14 @@ static int __init etnaviv_init(void)
>  	 * If the DT contains at least one available GPU device, instantiate
>  	 * the DRM platform device.
>  	 */
> -	for_each_compatible_node(np, NULL, "vivante,gc") {
> -		if (!of_device_is_available(np))
> -			continue;
> +	np =3D etnaviv_of_first_node();
> +	if (np) {
>  		of_node_put(np);
> =20
>  		ret =3D etnaviv_create_platform_device("etnaviv",
>  						     &etnaviv_platform_device);
>  		if (ret)
>  			goto unregister_platform_driver;
> -
> -		break;
>  	}
> =20
>  	return 0;

