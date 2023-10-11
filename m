Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D9E7C59F4
	for <lists+etnaviv@lfdr.de>; Wed, 11 Oct 2023 19:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A9510E17E;
	Wed, 11 Oct 2023 17:04:23 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A323C10E17E
 for <etnaviv@lists.freedesktop.org>; Wed, 11 Oct 2023 17:04:22 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qqcdA-0006Ez-NP; Wed, 11 Oct 2023 19:04:20 +0200
Message-ID: <8201caf4102cbb81ea15e87713a165590b11a684.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/5] drm/etnaviv: Various cleanup
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Date: Wed, 11 Oct 2023 19:04:19 +0200
In-Reply-To: <20231002111207.513297-1-suijingfeng@loongson.cn>
References: <20231002111207.513297-1-suijingfeng@loongson.cn>
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Montag, dem 02.10.2023 um 19:12 +0800 schrieb Sui Jingfeng:
> v2:
> 	* refine on v1 and update
>=20
Thanks, series applied to my etnaviv/next branch.

Regards,
Lucas

> Sui Jingfeng (5):
>   drm/etnaviv: Drop the second argument of the etnaviv_gem_new_impl()
>   drm/etnaviv: Fix coding style
>   drm/etnaviv: Add helper functions to create and destroy platform
>     device
>   drm/etnaviv: Add a helper to get the first available GPU device node
>   drm/etnaviv: Using 'dev' instead of 'etnaviv_obj->base.dev'
>=20
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 93 ++++++++++++++++++---------
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 12 ++--
>  2 files changed, 67 insertions(+), 38 deletions(-)
>=20

