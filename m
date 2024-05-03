Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C944F8BB17F
	for <lists+etnaviv@lfdr.de>; Fri,  3 May 2024 19:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF1B10FD1A;
	Fri,  3 May 2024 17:12:34 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C3110FD1A
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2024 17:12:34 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s2wSW-0004A2-Tb; Fri, 03 May 2024 19:12:32 +0200
Message-ID: <489f726758ecfcec0b3955530f405d93ea4a4e99.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: during dump, read registers twice
From: Lucas Stach <l.stach@pengutronix.de>
To: Derek Foreman <derek.foreman@collabora.com>, etnaviv@lists.freedesktop.org
Date: Fri, 03 May 2024 19:12:32 +0200
In-Reply-To: <6d4f4269-abe3-4d71-b91a-bb951de14627@collabora.com>
References: <20240503142255.263399-1-derek.foreman@collabora.com>
 <6d4f4269-abe3-4d71-b91a-bb951de14627@collabora.com>
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

Am Freitag, dem 03.05.2024 um 09:27 -0500 schrieb Derek Foreman:
> I have a follow up question related to this:
>=20
> In etnaviv_sched_timedoutjob we only read this register once - we should=
=20
> probably read twice there as well?
>=20
The register read being unreliable seems to be a specialty of the GPU
you are dealing with. I'm not saying that making this more robust is
the wrong thing to do, but I've seen quite a few GPU hang issues over
time and the reported DMA address always made sense on the GPUs I've
seen so far.

> Further, that function appears to always treat the first timeout as=20
> spurious because gpu->hangcheck_dma_addr starts as 0? The Vivante=20
> driver's hang check spins briefly to see if forward progress is being=20
> made, would that be a better thing to do there?
>=20
Briefly spinning will yield many false positives, as the DMA frontend
address doesn't move during large draws. The timeout we are using is
short enough that in most cases it's okay that we need to hit the
timeout twice until we mark the GPU as hung, but also long enough so it
doesn't get confused by large draws.

Regards,
Lucas

> Thanks,
> Derek
>=20
> On 2024-05-03 09:22, Derek Foreman wrote:
> > The vivante driver always reads dma registers twice and discards the fi=
rst
> > value - we need to do this too or at least the DMA address and low/high
> > fetches can return wrong results.
> >=20
> > Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> > ---
> >   drivers/gpu/drm/etnaviv/etnaviv_dump.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_dump.c
> > index 898f84a0fc30..8a8ca8dcc49a 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> > @@ -91,6 +91,8 @@ static void etnaviv_core_dump_registers(struct core_d=
ump_iterator *iter,
> >   		    read_addr <=3D VIVS_PM_PULSE_EATER)
> >   			read_addr =3D gpu_fix_power_address(gpu, read_addr);
> >   		reg->reg =3D cpu_to_le32(etnaviv_dump_registers[i]);
> > +		/* Discard first read, as it is frequently inaccurate */
> > +		gpu_read(gpu, read_addr);
> >   		reg->value =3D cpu_to_le32(gpu_read(gpu, read_addr));
> >   	}
> >  =20

