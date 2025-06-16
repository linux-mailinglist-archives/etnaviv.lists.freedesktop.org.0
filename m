Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E165ADAA58
	for <lists+etnaviv@lfdr.de>; Mon, 16 Jun 2025 10:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A471210E2CF;
	Mon, 16 Jun 2025 08:11:18 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B694B10E2CF
 for <etnaviv@lists.freedesktop.org>; Mon, 16 Jun 2025 08:11:17 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uR4vz-000343-Fh; Mon, 16 Jun 2025 10:11:15 +0200
Message-ID: <f0803593760360945a2a45a2702ffe5fb73b8bb5.camel@pengutronix.de>
Subject: Re: [RFC PATCH 4/4] etnaviv: Add PPU flop reset
From: Lucas Stach <l.stach@pengutronix.de>
To: Gert Wollny <gw.fossdev@gmail.com>, etnaviv@lists.freedesktop.org
Cc: Gert Wollny <gert.wollny@collabora.com>
Date: Mon, 16 Jun 2025 10:11:14 +0200
In-Reply-To: <20250605121230.3405127-5-gert.wollny@collabora.com>
References: <20250605121230.3405127-1-gert.wollny@collabora.com>
 <20250605121230.3405127-5-gert.wollny@collabora.com>
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

Hi Gert,

Am Donnerstag, dem 05.06.2025 um 14:12 +0200 schrieb Gert Wollny:
> The PPU flop reset is required on some hardware to clear the
> temporary registers. This implementation follows the code
> implemented in the public galcore kernel module code to this
> for the PPU.
>=20
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> ---
>=20
[...]
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h b/drivers/gpu/d=
rm/etnaviv/etnaviv_flop_reset.h
> new file mode 100644
> index 000000000000..c5c8f77f2176
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Etnaviv Project
> + */
> +
> +
> +#ifndef etnaviv_flop_reset_h
> +#define etnaviv_flop_reset_h
> +
> +void
> +etnaviv_flop_reset_ppu(struct etnaviv_gpu *gpu);
> +
> +#endif
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.h
> index 5cb46c84e03a..604a47f965b1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -122,6 +122,8 @@ struct etnaviv_gpu {
>  	struct etnaviv_cmdbuf buffer;
>  	int exec_state;
> =20
> +	struct etnaviv_cmdbuf ppu_flopreset_data;
> +
You should be able to place this in etnaviv_drm_private, so if we have
multiple GPUs requiring the flop reset in a single driver instance, we
only pay the memory cost once. But then you should allocate this buffer
in etnaviv_gpu_bind to avoid races between GPUs starting up and trying
to allocate this global memory.

Regards,
Lucas

>  	/* event management: */
>  	DECLARE_BITMAP(event_bitmap, ETNA_NR_EVENTS);
>  	struct etnaviv_event event[ETNA_NR_EVENTS];

