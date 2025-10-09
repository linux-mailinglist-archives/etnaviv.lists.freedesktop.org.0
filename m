Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CCDBC81B7
	for <lists+etnaviv@lfdr.de>; Thu, 09 Oct 2025 10:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206A910E11D;
	Thu,  9 Oct 2025 08:45:46 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08C510E11D
 for <etnaviv@lists.freedesktop.org>; Thu,  9 Oct 2025 08:45:44 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1v6mHL-0004jL-Rl; Thu, 09 Oct 2025 10:45:39 +0200
Message-ID: <05acd8873716a49c2a78edaebd89159fec193ecd.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: force flush on power register ops
From: Lucas Stach <l.stach@pengutronix.de>
To: rs@ti.com, linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com
Cc: etnaviv@lists.freedesktop.org, detheridge@ti.com, u-kumar1@ti.com
Date: Thu, 09 Oct 2025 10:45:38 +0200
In-Reply-To: <20251006203008.986223-2-rs@ti.com>
References: <20251006203008.986223-2-rs@ti.com>
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

Hi Randolph,

Am Montag, dem 06.10.2025 um 15:30 -0500 schrieb rs@ti.com:
> From: Randolph Sapp <rs@ti.com>
>=20
> Force a cache flush on power register operations during etnaviv_hw_reset
> with two readbacks. I'm not sure if there are any other calls in this
> reset sequence that are susceptible, but without these read ops we see
> occasional failures with etnaviv_hw_reset during boot and after multiple
> probe/unprobe calls on the am57xx-evm.
>=20
It's interesting that those two calls seem to be the problematic ones
in your setup. If at all, I would have suspected the HI_CLOCK_CONTROL
writes to be an issue when you get delayed writes. I hope your wrapper
doesn't allow writes to the GPU AHB slave to be reordered?!?

I've just looked over other places in the driver where we write the
power registers and I think your implementation is fine. I wouldn't
want to penalize all of them just because we have some specific
ordering requirements in the reset sequence. I think it makes sense to
add a new inline function gpu_write_power_sync that does the necessary
readback of the written register and call this as needed from the reset
sequence.

Regards,
Lucas

> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index cf0d9049bcf1..320be7f66d74 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -544,12 +544,14 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu=
)
> =20
>  		/* disable clock gating */
>  		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
> +		gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
> =20
>  		/* disable pulse eater */
>  		pulse_eater |=3D BIT(17);
>  		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>  		pulse_eater |=3D BIT(0);
>  		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> +		gpu_read_power(gpu, VIVS_PM_PULSE_EATER);
> =20
>  		/* enable clock */
>  		control =3D VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);

