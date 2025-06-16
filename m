Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69009ADAA78
	for <lists+etnaviv@lfdr.de>; Mon, 16 Jun 2025 10:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0695A10E2CF;
	Mon, 16 Jun 2025 08:16:43 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BE110E2CF
 for <etnaviv@lists.freedesktop.org>; Mon, 16 Jun 2025 08:16:42 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uR51E-0001Mc-Vd; Mon, 16 Jun 2025 10:16:40 +0200
Message-ID: <9058520332cdcec11ba5d8a2dc5446cb5ecf7609.camel@pengutronix.de>
Subject: Re: [RFC PATCH 3/4] etnaviv: Add a new function to emit a series of
 states to cmd stream
From: Lucas Stach <l.stach@pengutronix.de>
To: Gert Wollny <gw.fossdev@gmail.com>, etnaviv@lists.freedesktop.org
Cc: Gert Wollny <gert.wollny@collabora.com>
Date: Mon, 16 Jun 2025 10:16:40 +0200
In-Reply-To: <20250605121230.3405127-4-gert.wollny@collabora.com>
References: <20250605121230.3405127-1-gert.wollny@collabora.com>
 <20250605121230.3405127-4-gert.wollny@collabora.com>
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

Am Donnerstag, dem 05.06.2025 um 14:12 +0200 schrieb Gert Wollny:
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/e=
tnaviv/etnaviv_buffer.h
> index 0cb65a0c3bfc..b0a093b28774 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> @@ -41,6 +41,20 @@ static inline void CMD_LOAD_STATE(struct etnaviv_cmdbu=
f *buffer,
>  	OUT(buffer, value);
>  }
> =20
> +static inline void CMD_LOAD_STATES_START(struct etnaviv_cmdbuf *buffer,
> +					u32 reg, u32 nvalues)
> +{
> +	u32 index =3D reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
> +
> +	buffer->user_size =3D ALIGN(buffer->user_size, 8);
> +
> +	/* write a register via cmd stream */
> +	OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
> +	    VIV_FE_LOAD_STATE_HEADER_OFFSET(index) |

I see we aren't totally consistent in the other functions right now,
but please align those continued lines to the second argument.

> +	    (VIV_FE_LOAD_STATE_HEADER_COUNT(nvalues) &
> +	     VIV_FE_LOAD_STATE_HEADER_COUNT__MASK));

VIV_FE_LOAD_STATE_HEADER_COUNT already includes
VIV_FE_LOAD_STATE_HEADER_COUNT__MASK, so you don't need to do mask it
here.

Regards,
Lucas

> +}
> +
>  static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
>  {
>  	buffer->user_size =3D ALIGN(buffer->user_size, 8);

