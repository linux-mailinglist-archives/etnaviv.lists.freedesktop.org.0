Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BED8CC10F
	for <lists+etnaviv@lfdr.de>; Wed, 22 May 2024 14:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6609810F13C;
	Wed, 22 May 2024 12:17:30 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416DE10F13C
 for <etnaviv@lists.freedesktop.org>; Wed, 22 May 2024 12:17:28 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s9kuL-0005z0-O2; Wed, 22 May 2024 14:17:25 +0200
Message-ID: <27b679784163cfeff255cec0af91774de979f8e5.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Read some FE registers twice
From: Lucas Stach <l.stach@pengutronix.de>
To: Derek Foreman <derek.foreman@collabora.com>, etnaviv@lists.freedesktop.org
Date: Wed, 22 May 2024 14:17:24 +0200
In-Reply-To: <e17ced84-05b0-448f-8939-a29479604d1e@collabora.com>
References: <20240503191158.281396-1-derek.foreman@collabora.com>
 <34fd5ade5f172545d8531275c094affb4b4a1ef1.camel@pengutronix.de>
 <e17ced84-05b0-448f-8939-a29479604d1e@collabora.com>
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

Am Dienstag, dem 21.05.2024 um 12:10 -0500 schrieb Derek Foreman:
> Hello,
>=20
> On 2024-05-16 12:36, Lucas Stach wrote:
> > Hi Derek,
> >=20
> > Am Freitag, dem 03.05.2024 um 14:11 -0500 schrieb Derek Foreman:
> > > On some hardware (such at the GC7000 rev 6009), these registers need =
to be
> > > read twice to return the correct value. Hide that in gpu_read().
> > >=20
> > > Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> > > ---
> > >   drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/=
etnaviv/etnaviv_gpu.h
> > > index 197e0037732e..0f67c62be3d1 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> > > @@ -11,6 +11,7 @@
> > >   #include "etnaviv_mmu.h"
> > >   #include "etnaviv_drv.h"
> > >   #include "common.xml.h"
> > > +#include "state.xml.h"
> > >  =20
> > >   struct etnaviv_gem_submit;
> > >   struct etnaviv_vram_mapping;
> > > @@ -170,6 +171,13 @@ static inline void gpu_write(struct etnaviv_gpu =
*gpu, u32 reg, u32 data)
> > >  =20
> > >   static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
> > >   {
> > > +	/* On some variants, such as the GC7000 6009, some FE registers
> >                                           GC7000 rev 6009
> > > +	 * need two reads to be consistent. Do that extra read here and
> > > +	 * throw away the result.
> > > +	 */
> > Please use the common comment style of this driver with a blank line
> > after the /*
> Oops - done for v2. Thanks.
> > > +	if (reg >=3D VIVS_FE_DMA_STATUS && reg <=3D VIVS_FE_AUTO_FLUSH)
> > > +		readl(gpu->mmio + reg);
> > I don't think it matters much, but we can save some of the overhead
> > here by using readl_relaxed.
>=20
> Can I just not do this? I'm concerned that losing the memory barrier=20
> could result in weird reads again. The galcore driver doesn't use a=20
> relaxed read, and these registers are only ever read when something goes=
=20
> wrong - so I don't think performance is a concern at all?

I understand the concern. According to the architecture the memory
barriers wouldn't make a difference, as accesses to the same slave are
ordered, but as this is already a workaround for a HW weirdness we
don't exactly know if we can trust the architecture guarantees here.

Feel free to ignore my suggestion and keep this as-is.

Regards,
Lucas
