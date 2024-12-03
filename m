Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E229E29A1
	for <lists+etnaviv@lfdr.de>; Tue,  3 Dec 2024 18:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4E310E456;
	Tue,  3 Dec 2024 17:43:16 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F0D10E456
 for <etnaviv@lists.freedesktop.org>; Tue,  3 Dec 2024 17:43:16 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tIWvL-0003Bm-7c; Tue, 03 Dec 2024 18:42:59 +0100
Message-ID: <df8c5796a8103e0a4daa4e20b61251af82ab5a53.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: etnaviv_cmdbuf.c: Drop the unneeded
 include of drm_mm.h
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 03 Dec 2024 18:42:58 +0100
In-Reply-To: <20241025175620.414666-1-sui.jingfeng@linux.dev>
References: <20241025175620.414666-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
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

Am Samstag, dem 26.10.2024 um 01:56 +0800 schrieb Sui Jingfeng:
> The etnaviv_cmdbuf.c doesn't reference any functions or data members
> defined in drm_mm.h, remove unneeded headers may reduce kernel compile
> times.
>=20
Thanks, applied to etnaviv/next.

Regards,
Lucas

> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_cmdbuf.c
> index 66a407f1b3ee..7aa5f14d0c87 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> @@ -5,8 +5,6 @@
> =20
>  #include <linux/dma-mapping.h>
> =20
> -#include <drm/drm_mm.h>
> -
>  #include "etnaviv_cmdbuf.h"
>  #include "etnaviv_gem.h"
>  #include "etnaviv_gpu.h"

