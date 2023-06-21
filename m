Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6272738A8B
	for <lists+etnaviv@lfdr.de>; Wed, 21 Jun 2023 18:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AC610E238;
	Wed, 21 Jun 2023 16:12:31 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1AF10E178
 for <etnaviv@lists.freedesktop.org>; Wed, 21 Jun 2023 16:12:29 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qC0RQ-0007gc-08; Wed, 21 Jun 2023 18:12:20 +0200
Message-ID: <737b07582ef2a4b2f134a1a931b6621ff96adb77.camel@pengutronix.de>
Subject: Re: [PATCH v10 07/11] drm/etnaviv: Add support for the dma coherent
 device
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <18949883232@163.com>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jun 2023 18:12:16 +0200
In-Reply-To: <9c8afcb4-70c0-a920-2a78-78a9ac884c80@loongson.cn>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-8-18949883232@163.com>
 <8f74f0962c8bab6c832919a5340667c54e1a7ddc.camel@pengutronix.de>
 <aa73348d-5ec8-4ac0-2ec0-0cce24756c63@loongson.cn>
 <87c9576e6ca1b58fa94e0bc1a2f4be3847f0518c.camel@pengutronix.de>
 <9c8afcb4-70c0-a920-2a78-78a9ac884c80@loongson.cn>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Mittwoch, dem 21.06.2023 um 23:41 +0800 schrieb Sui Jingfeng:
> On 2023/6/21 23:23, Lucas Stach wrote:
> > Am Mittwoch, dem 21.06.2023 um 22:44 +0800 schrieb Sui Jingfeng:
> > > Hi,
> > >=20
> > > On 2023/6/21 18:00, Lucas Stach wrote:
> > > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/=
drm/etnaviv/etnaviv_drv.h
> > > > > index 9cd72948cfad..644e5712c050 100644
> > > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> > > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> > > > > @@ -46,6 +46,12 @@ struct etnaviv_drm_private {
> > > > >    	struct xarray active_contexts;
> > > > >    	u32 next_context_id;
> > > > >   =20
> > > > > +	/*
> > > > > +	 * If true, the GPU is capable of snooping cpu cache. Here, it
> > > > > +	 * also means that cache coherency is enforced by the hardware.
> > > > > +	 */
> > > > > +	bool dma_coherent;
> > > > > +
> > > > No need for this, I think. Just use dev_is_dma_coherent() where you
> > > > need to know this.
> > > >=20
> > > No, we want this value cached by the driver.
> > >=20
> > Why? dev_is_dma_coherent() is a header-only function with a single
> > pointer chasing operation. Your cache is also a single pointer chasing
> > access, just that we now need storage for this information in both
> > struct device and struct etnaviv_gpu.
>=20
>=20
> You don't need store it in struct etnaviv_gpu.
>=20
> As this variable is shared across the device, so it is better to be put=
=20
> in the struct etnaviv_drm_private.
>=20
> I don't think another 4 bytes allocation is something what we can't pay f=
or.
>=20
>=20
> My patch doesn't mentioned that it need to store it inside of struct=20
> etnaviv_gpu, do I?

You are right, I was mistaken about the etnaviv struct this is added
to. However there is still the fundamental question: what's the gain of
this cache? The information is already available in struct device and
will be accessed with the same amount of loads if you care that much
about micro-optimization.

Regards,
Lucas

