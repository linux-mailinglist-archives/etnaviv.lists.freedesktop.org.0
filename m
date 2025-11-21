Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FD2C78369
	for <lists+etnaviv@lfdr.de>; Fri, 21 Nov 2025 10:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A1310E803;
	Fri, 21 Nov 2025 09:46:07 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7972110E803
 for <etnaviv@lists.freedesktop.org>; Fri, 21 Nov 2025 09:46:06 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1vMNiP-0005vR-0k; Fri, 21 Nov 2025 10:46:05 +0100
Message-ID: <f01afdef41d15bbe11c4b46d0a89dae55f1f7ed3.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/etnaviv: force flush on power register ops
From: Lucas Stach <l.stach@pengutronix.de>
To: Randolph Sapp <rs@ti.com>
Cc: etnaviv@lists.freedesktop.org
Date: Fri, 21 Nov 2025 10:46:03 +0100
In-Reply-To: <18016c25-41c2-49f1-8162-95488de7c514@ti.com>
References: <20251013170122.1145387-2-rs@ti.com>
 <18016c25-41c2-49f1-8162-95488de7c514@ti.com>
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

Am Montag, dem 27.10.2025 um 18:29 -0500 schrieb Randolph Sapp:
> On 10/13/25 12:01, rs@ti.com wrote:
> > From: Randolph Sapp <rs@ti.com>
> >=20
> > Add gpu_write_power_sync to verify that power register modifications
> > have reached the endpoint device in sequence specific sections that do
> > not validate device state.
> >=20
> > These sequence specific areas have been detected experimentally with an
> > am57xx-evm through numerous boot and module load+unload cycles.
> >=20
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---
> >=20
> > v2:
> > 	- Add an explicit gpu_write_power_sync function to handle the readback
> > 	- Add a few more required readbacks as determined experimentally with
> > 	  5511 reboot cycles on am57xx-evm
> >=20
> >   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 10 +++++-----
> >   drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  6 ++++++
> >   2 files changed, 11 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/et=
naviv/etnaviv_gpu.c
> > index cf0d9049bcf1..dbbd5a8100e6 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -543,13 +543,13 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *g=
pu)
> >   		u32 pulse_eater =3D 0x01590880;
> >  =20
> >   		/* disable clock gating */
> > -		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
> > +		gpu_write_power_sync(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
> >  =20
> >   		/* disable pulse eater */
> >   		pulse_eater |=3D BIT(17);
> >   		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> >   		pulse_eater |=3D BIT(0);
> > -		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> > +		gpu_write_power_sync(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> >  =20
> >   		/* enable clock */
> >   		control =3D VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
> > @@ -643,7 +643,7 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_=
gpu *gpu)
> >   	    gpu->identity.revision =3D=3D 0x4302)
> >   		ppc |=3D VIVS_PM_POWER_CONTROLS_DISABLE_STALL_MODULE_CLOCK_GATING;
> >  =20
> > -	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, ppc);
> > +	gpu_write_power_sync(gpu, VIVS_PM_POWER_CONTROLS, ppc);
> >  =20
> >   	pmc =3D gpu_read_power(gpu, VIVS_PM_MODULE_CONTROLS);
> >  =20
> > @@ -687,7 +687,7 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_=
gpu *gpu)
> >   	pmc |=3D VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_HZ;
> >   	pmc |=3D VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_EZ;
> >  =20
> > -	gpu_write_power(gpu, VIVS_PM_MODULE_CONTROLS, pmc);
> > +	gpu_write_power_sync(gpu, VIVS_PM_MODULE_CONTROLS, pmc);
> >   }
> >  =20
> >   void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 p=
refetch)
> > @@ -753,7 +753,7 @@ static void etnaviv_gpu_setup_pulse_eater(struct et=
naviv_gpu *gpu)
> >   		pulse_eater |=3D BIT(18);
> >   	}
> >  =20
> > -	gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> > +	gpu_write_power_sync(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> >   }
> >  =20
> >   static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/et=
naviv/etnaviv_gpu.h
> > index 5cb46c84e03a..e89d591d7404 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> > @@ -204,6 +204,12 @@ static inline u32 gpu_read_power(struct etnaviv_gp=
u *gpu, u32 reg)
> >   	return readl(gpu->mmio + gpu_fix_power_address(gpu, reg));
> >   }
> >  =20
> > +static inline void gpu_write_power_sync(struct etnaviv_gpu *gpu, u32 r=
eg, u32 data)
> > +{
> > +	gpu_write_power(gpu, reg, data);
> > +	gpu_read_power(gpu, reg);
> > +}
> > +
> >   int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *va=
lue);
> >  =20
> >   int etnaviv_gpu_init(struct etnaviv_gpu *gpu);
>=20
> Was there any feedback regarding this change? I never heard anything on=
=20
> my end. Wanted to be sure my mail client didn't eat it.

I think the change itself is fine and I was about to apply it, but
after testing some more I still see incomplete GPU resets. Things seem
to be fine for the unloaded case, but when the GPU is reset while it's
loaded or hanging after an invalid command, I see sporadic cases where
parts of the GPU are not being properly reset. I'm currently
investigating the issue.

Regards,
Lucas
