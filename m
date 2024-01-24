Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9751F83AE58
	for <lists+etnaviv@lfdr.de>; Wed, 24 Jan 2024 17:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A4110EDDD;
	Wed, 24 Jan 2024 16:27:30 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 1038 seconds by postgrey-1.36 at gabe;
 Wed, 24 Jan 2024 16:27:28 UTC
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9480A10EDDD
 for <etnaviv@lists.freedesktop.org>; Wed, 24 Jan 2024 16:27:28 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rSfnA-0007qU-9Q; Wed, 24 Jan 2024 17:07:56 +0100
Message-ID: <4e495bd7449159b9fe1710b673b6f9b4f185862d.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/etnaviv: Disable SH_EU clock gating on VIPNano-Si+
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Wed, 24 Jan 2024 17:07:55 +0100
In-Reply-To: <20240124-etnaviv-npu-v1-2-a5aaf64aec65@pengutronix.de>
References: <20240124-etnaviv-npu-v1-0-a5aaf64aec65@pengutronix.de>
 <20240124-etnaviv-npu-v1-2-a5aaf64aec65@pengutronix.de>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Mittwoch, dem 24.01.2024 um 10:22 +0100 schrieb Philipp Zabel:
> Disable SH_EU clock gating for the VIPNano-Si+ NPU on i.MX8MP.
> Taken from linux-imx lf-6.1.36-2.1.0, specifically [1].
>=20
> [1] https://github.com/nxp-imx/linux-imx/blob/lf-6.1.36-2.1.0/drivers/mxc=
/gpu-viv/hal/kernel/arch/gc_hal_kernel_hardware.c#L2747-L2761
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 9b8445d2a128..e28332a2560d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -641,6 +641,10 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_g=
pu *gpu)
>  		pmc |=3D VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_SE |
>  		       VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA;
> =20
> +	/* Disable SH_EU clock gating on affected core revisions. */
> +	if (etnaviv_is_model_rev(gpu, GC8000, 0x8002))
> +		pmc |=3D VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_SH_EU;
> +
With the other clock gate disables in the driver we match on all chip
revisions found in downstream drivers, even if etnaviv hasn't been
tested with the specific GPU. To stay consistent, this workaround
should also match GC8000r7200 and GC9200r6304, same as the downstream
driver.

Regards,
Lucas
