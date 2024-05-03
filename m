Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE08BB369
	for <lists+etnaviv@lfdr.de>; Fri,  3 May 2024 20:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59E2112655;
	Fri,  3 May 2024 18:44:47 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C26B112655
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2024 18:44:46 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s2xtl-00089m-0m; Fri, 03 May 2024 20:44:45 +0200
Message-ID: <5442523fd31d434ebf68371779877a4b38f53436.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: during dump, read registers twice
From: Lucas Stach <l.stach@pengutronix.de>
To: Derek Foreman <derek.foreman@collabora.com>, etnaviv@lists.freedesktop.org
Date: Fri, 03 May 2024 20:44:44 +0200
In-Reply-To: <a597b0d0-816b-4063-b35f-08d125c3a0e7@collabora.com>
References: <20240503142255.263399-1-derek.foreman@collabora.com>
 <6d4f4269-abe3-4d71-b91a-bb951de14627@collabora.com>
 <489f726758ecfcec0b3955530f405d93ea4a4e99.camel@pengutronix.de>
 <a597b0d0-816b-4063-b35f-08d125c3a0e7@collabora.com>
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

Am Freitag, dem 03.05.2024 um 12:54 -0500 schrieb Derek Foreman:
> =C2=A0Hi Lucas,
> =C2=A0=C2=A0
> On 2024-05-03 12:12, Lucas Stach wrote:
> =C2=A0=C2=A0
> > Hi Derek,
> >=20
> > Am Freitag, dem 03.05.2024 um 09:27 -0500 schrieb Derek Foreman:
> >=20
> > >=20
> > > I have a follow up question related to this:
> > >=20
> > > In etnaviv_sched_timedoutjob we only read this register once - we sho=
uld=20
> > > probably read twice there as well?
> >=20
> > The register read being unreliable seems to be a specialty of the GPU
> > you are dealing with. I'm not saying that making this more robust is
> > the wrong thing to do, but I've seen quite a few GPU hang issues over
> > time and the reported DMA address always made sense on the GPUs I've
> > seen so far.
> > =C2=A0=C2=A0
> Yes, this is a GC7000 rev 6009, and it seems to occasionally return very =
exciting values on the first read.
> =C2=A0=C2=A0
> An example:
> =C2=A00000065c =3D 0000c1f8
> =C2=A000000660 =3D 00000001 Cmd: [dec DMA: idle Fetch: idle] Req idle Cal=
 idle
> =C2=A000000664 =3D 00000905 Command DMA address
> =C2=A000000668 =3D 0000c1f8 FE fetched word 0
> =C2=A00000066c =3D 080105d0 FE fetched word 1
> =C2=A000000670 =3D feb71000
> =C2=A0
> Some of the values are shifted by one register. 905 should have been in 6=
60, c1f8 should have been in 664, and the state load should have been in 66=
8 instead of 66c. Very confusing.
> =C2=A0=C2=A0
> =C2=A0I can only assume this weirdness is why the gpu-viv driver uncondit=
ionally reads the DMA registers twice every time. I expect that the extra r=
ead is pointless on most of the registers in the dump, but I was lazy - wou=
ld you prefer I limit the extra read to only DMA registers?
> =C2=A0
Seems like someone built a clock-domain crossing issue into that
specific hardware variant. Probably result being returned to the bus
before the actual value has been fetched from the FE internal state.

>=20
> It looks like we use these registers in other places (verify_dma, etnaviv=
_gpu_debugfs). Should I add this double read there as well?
>=20
>=20
If there is a CDC issue in the hardware we should probably repeat all
reads from the FE registers. This could simply be fixed up by matching
the FE address range in gpu_read and having the double read contained
in this function.

> =C2=A0
> > >=20
> > > Further, that function appears to always treat the first timeout as=
=20
> > > spurious because gpu->hangcheck_dma_addr starts as 0? The Vivante=20
> > > driver's hang check spins briefly to see if forward progress is being=
=20
> > > made, would that be a better thing to do there?
> >=20
> > Briefly spinning will yield many false positives, as the DMA frontend
> > address doesn't move during large draws. The timeout we are using is
> > short enough that in most cases it's okay that we need to hit the
> > timeout twice until we mark the GPU as hung, but also long enough so it
> > doesn't get confused by large draws.
>=20
> Fair enough - I won't bother sending a patch to change that behavior.
>=20
> I do wonder if setting the timeout to be twice as long instead of requiri=
ng it to trigger twice would be more intuitive, though.
> =C2=A0
It's not totally obvious, but we need the first timeout trigger to
record the current FE address to see if the FE still makes progress
inside the current job.

Regards,
Lucas
>=20
> Thanks,
> =C2=A0Derek
> =C2=A0
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> =C2=A0
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> =C2=A0
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> =C2=A0
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> > =C2=A0
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> > Regards,
> > Lucas
> >=20
> > =C2=A0
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> > > =C2=A0
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > > Thanks,
> > > Derek
> > >=20
> > > On 2024-05-03 09:22, Derek Foreman wrote:
> > > =C2=A0
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > > > =C2=A0
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > > The vivante driver always reads dma registers twice and discards th=
e first
> > > > value - we need to do this too or at least the DMA address and low/=
high
> > > > fetches can return wrong results.
> > > >=20
> > > > Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> > > > ---
> > > > =C2=A0=C2=A0drivers/gpu/drm/etnaviv/etnaviv_dump.c | 2 ++
> > > > =C2=A0=C2=A01 file changed, 2 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/d=
rm/etnaviv/etnaviv_dump.c
> > > > index 898f84a0fc30..8a8ca8dcc49a 100644
> > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> > > > @@ -91,6 +91,8 @@ static void etnaviv_core_dump_registers(struct co=
re_dump_iterator *iter,
> > > > =C2=A0=C2=A0		    read_addr <=3D VIVS_PM_PULSE_EATER)
> > > > =C2=A0=C2=A0			read_addr =3D gpu_fix_power_address(gpu, read_addr);
> > > > =C2=A0=C2=A0		reg->reg =3D cpu_to_le32(etnaviv_dump_registers[i]);
> > > > +		/* Discard first read, as it is frequently inaccurate */
> > > > +		gpu_read(gpu, read_addr);
> > > > =C2=A0=C2=A0		reg->value =3D cpu_to_le32(gpu_read(gpu, read_addr));
> > > > =C2=A0=C2=A0	}
> > > > =C2=A0=C2=A0
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > > =C2=A0
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > =C2=A0
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > =C2=A0=C2=A0
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> >=20
> =C2=A0
>=20
>=20
>=20
>=20
>=20
>=20
>=20

