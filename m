Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB743A7842
	for <lists+etnaviv@lfdr.de>; Tue, 15 Jun 2021 09:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78B46E188;
	Tue, 15 Jun 2021 07:47:53 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B861D6E188
 for <etnaviv@lists.freedesktop.org>; Tue, 15 Jun 2021 07:47:52 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lt3na-0003fh-QI; Tue, 15 Jun 2021 09:47:50 +0200
Message-ID: <df3c79738d997ace50bac2433a988f3914739cf6.camel@pengutronix.de>
Subject: Re: [RFC PATCH 2/2] drm/etnaviv: add clock gating workaround for
 GC7000 r6202
From: Lucas Stach <l.stach@pengutronix.de>
To: Michael Walle <michael@walle.cc>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 15 Jun 2021 09:47:48 +0200
In-Reply-To: <20210614221752.1251-3-michael@walle.cc>
References: <20210614221752.1251-1-michael@walle.cc>
 <20210614221752.1251-3-michael@walle.cc>
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
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
Cc: David Airlie <airlied@linux.ie>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Michael,

Am Dienstag, dem 15.06.2021 um 00:17 +0200 schrieb Michael Walle:
> The LS1028A SoC errata sheet mentions A-050121 "GPU hangs if clock
> gating for Rasterizer, Setup Engine and Texture Engine are enabled".
> The workaround is to disable the corresponding clock gatings.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 4102bcea3341..574e4e04dddc 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -613,6 +613,12 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
>  	    etnaviv_is_model_rev(gpu, GC2000, 0x5108))
>  		pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_TX;
>  
> +	/* Disable RS, SE, TE clock gating on affected core revisions. */

This comment is wrong. RS (resolver) is a different engine than RA
(rasterizer) and the texture engine is abbreviated TX throughout the
driver.

Regards,
Lucas

> +	if (etnaviv_is_model_rev(gpu, GC7000, 0x6202))
> +		pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_SE |
> +		       VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA |
> +		       VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_TX;
> +
>  	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_HZ;
>  	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_EZ;
>  


_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
