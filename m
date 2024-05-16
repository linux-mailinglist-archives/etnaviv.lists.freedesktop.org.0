Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0C98C7B6A
	for <lists+etnaviv@lfdr.de>; Thu, 16 May 2024 19:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C444E10ED7E;
	Thu, 16 May 2024 17:36:20 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7752310ED7E
 for <etnaviv@lists.freedesktop.org>; Thu, 16 May 2024 17:36:19 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s7f1e-00043j-4H; Thu, 16 May 2024 19:36:18 +0200
Message-ID: <34fd5ade5f172545d8531275c094affb4b4a1ef1.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Read some FE registers twice
From: Lucas Stach <l.stach@pengutronix.de>
To: Derek Foreman <derek.foreman@collabora.com>, etnaviv@lists.freedesktop.org
Date: Thu, 16 May 2024 19:36:17 +0200
In-Reply-To: <20240503191158.281396-1-derek.foreman@collabora.com>
References: <20240503191158.281396-1-derek.foreman@collabora.com>
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

Hi Derek,

Am Freitag, dem 03.05.2024 um 14:11 -0500 schrieb Derek Foreman:
> On some hardware (such at the GC7000 rev 6009), these registers need to b=
e
> read twice to return the correct value. Hide that in gpu_read().
>=20
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.h
> index 197e0037732e..0f67c62be3d1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -11,6 +11,7 @@
>  #include "etnaviv_mmu.h"
>  #include "etnaviv_drv.h"
>  #include "common.xml.h"
> +#include "state.xml.h"
> =20
>  struct etnaviv_gem_submit;
>  struct etnaviv_vram_mapping;
> @@ -170,6 +171,13 @@ static inline void gpu_write(struct etnaviv_gpu *gpu=
, u32 reg, u32 data)
> =20
>  static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
>  {
> +	/* On some variants, such as the GC7000 6009, some FE registers
                                         GC7000 rev 6009
> +	 * need two reads to be consistent. Do that extra read here and
> +	 * throw away the result.
> +	 */

Please use the common comment style of this driver with a blank line
after the /*

> +	if (reg >=3D VIVS_FE_DMA_STATUS && reg <=3D VIVS_FE_AUTO_FLUSH)
> +		readl(gpu->mmio + reg);

I don't think it matters much, but we can save some of the overhead
here by using readl_relaxed.

Regards,
Lucas

> +
>  	return readl(gpu->mmio + reg);
>  }
> =20

