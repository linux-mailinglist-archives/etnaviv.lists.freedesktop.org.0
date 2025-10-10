Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E704BCC1E6
	for <lists+etnaviv@lfdr.de>; Fri, 10 Oct 2025 10:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086AB10E3CA;
	Fri, 10 Oct 2025 08:26:02 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A56B10E3CA
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Oct 2025 08:26:01 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1v78Rm-0000qI-Nc; Fri, 10 Oct 2025 10:25:54 +0200
Message-ID: <19fb78a514f5d913526241edd0bb5934e7e289aa.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: force flush on power register ops
From: Lucas Stach <l.stach@pengutronix.de>
To: Randolph Sapp <rs@ti.com>, Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: "Kumar, Udit" <u-kumar1@ti.com>, linux+etnaviv@armlinux.org.uk, 
 etnaviv@lists.freedesktop.org, detheridge@ti.com
Date: Fri, 10 Oct 2025 10:25:52 +0200
In-Reply-To: <DDE4XLZWLRKN.39408CPUE8CC0@ti.com>
References: <20251006203008.986223-2-rs@ti.com>
 <5f015856-4458-4731-b660-627f3f6aed13@ti.com>
 <DDC7FYCGRF9A.3T68CVC1OAEBK@ti.com>
 <CAH9NwWeku_WfK0XbEJKyZoVKuybGs__gGEdBiSiXqkT+O8kjKw@mail.gmail.com>
 <DDCE1RF87NE6.14F1ZNRFIPQUS@ti.com>
 <435fc68dd068b012c45d61a19110ef687bc57a2f.camel@pengutronix.de>
 <DDE4XLZWLRKN.39408CPUE8CC0@ti.com>
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

Am Donnerstag, dem 09.10.2025 um 17:12 -0500 schrieb Randolph Sapp:
> On Thu Oct 9, 2025 at 3:51 AM CDT, Lucas Stach wrote:
> > Am Dienstag, dem 07.10.2025 um 15:56 -0500 schrieb Randolph Sapp:
> > > On Tue Oct 7, 2025 at 1:17 PM CDT, Christian Gmeiner wrote:
> > > > Hi
> > > >=20
> > > > Am Di., 7. Okt. 2025 um 17:45 Uhr schrieb Randolph Sapp <rs@ti.com>=
:
> > > > >=20
> > > > > On Mon Oct 6, 2025 at 9:05 PM CDT, Udit Kumar wrote:
> > > > > >=20
> > > > > > On 10/7/2025 2:00 AM, rs@ti.com wrote:
> > > > > > > From: Randolph Sapp <rs@ti.com>
> > > > > > >=20
> > > > > > > Force a cache flush on power register operations during etnav=
iv_hw_reset
> > > > > > > with two readbacks. I'm not sure if there are any other calls=
 in this
> > > > > > > reset sequence that are susceptible, but without these read o=
ps we see
> > > > > >=20
> > > > > > "I'm not sure" could be avoided in commit message
> > > > > >=20
> > > > > > > occasional failures with etnaviv_hw_reset during boot and aft=
er multiple
> > > > > > > probe/unprobe calls on the am57xx-evm.
> > > > > > >=20
> > > > > > > Signed-off-by: Randolph Sapp <rs@ti.com>
> > > > > > > ---
> > > > > > >   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 ++
> > > > > > >   1 file changed, 2 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/=
gpu/drm/etnaviv/etnaviv_gpu.c
> > > > > > > index cf0d9049bcf1..320be7f66d74 100644
> > > > > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > > > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > > > > > @@ -544,12 +544,14 @@ static int etnaviv_hw_reset(struct etna=
viv_gpu *gpu)
> > > > > > >=20
> > > > > > >              /* disable clock gating */
> > > > > > >              gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0=
);
> > > > > > > +            gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
> > > > > >=20
> > > > > > what about updating gpu_write_power function itself.
> > > > > >=20
> > > > > > something like
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> > > > > > b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h index 31322195b9e4..d27=
3d9f2a1b1
> > > > > > 100644 --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h +++
> > > > > > b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h @@ -194,6 +194,7 @@ sta=
tic
> > > > > > inline u32 gpu_fix_power_address(struct etnaviv_gpu *gpu, u32 r=
eg)
> > > > > > static inline void gpu_write_power(struct etnaviv_gpu *gpu, u32=
 reg, u32
> > > > > > data) { writel(data, gpu->mmio + gpu_fix_power_address(gpu, reg=
)); +
> > > > > > readl(gpu->mmio + gpu_fix_power_address(gpu, reg)); }
> > > > > >=20
> > > > > > this will take care of all other calls too.
> > > > >=20
> > > > > I was hoping the maintainer would suggest such comment. I see tha=
t as a 50/50.
> > > > > Benefits most cases but then someone could complain about a handf=
ul of back to
> > > > > back operations not needing to be flushed immediately. Prime real=
 estate for
> > > > > opinions.
> > > > >=20
> > > >=20
> > > > You sent your email less than 24 hours ago - please give the
> > > > maintainer and developers
> > > > some time to respond.
> > >=20
> > > Right, it wasn't a dig at the maintainers, it's more to say "yes, tha=
t is the
> > > obvious secondary implementation here's why I didn't choose to do tha=
t first."
> > > As well as an indication that I wanted to wait for further input.
> > >=20
> > > > I had a quick look at the galcore kernel driver but didn=E2=80=99t =
find
> > > > anything resembling your
> > > > workaround. I=E2=80=99m wondering:
> > > > a) why we haven=E2=80=99t encountered this issue on other platforms=
, and
> >=20
> > I've recently seen some cases where the GPU reset didn't properly
> > propagate and left the MMU enabled, which I suspect is related to those
> > power gating register writes. Maybe the TI platform just makes it a bit
> > more obvious what is happening here.
> >=20
> > > > b) what the underlying problem is that you=E2=80=99re trying to add=
ress.
> > > >=20
> > > > Do you observe the same issue when using the binary blob driver sta=
ck
> > > > on your SoC?
> > >=20
> > > As to why we haven't seen this on other platforms, that's a fair poin=
t. I assume
> > > it's something to do with the generic interconnect target module that=
's wrapping
> > > our definition. This may be wrong though, I haven't spent too much ti=
me digging
> > > through our older IP.
> > >=20
> > > The underlying problem seems to be that occasionally when calling
> > > etnaviv_hw_reset we see reports from omap_l3_noc that an L3 applicati=
on error
> > > occurred.
> > >=20
> > > We do not see the same issue when using the binary blob driver, but f=
rom a
> > > cursory glance it's reset mechanism is much more complicated/obfuscat=
ed. They
> > > also use 1 microsecond delays between the power related ops, the trig=
gering of
> > > the software reset, and the reading of the idle status. It could very=
 well be
> > > timing related, though this doesn't seem to be supported by other pat=
ches like:
> > >=20
> > > 4046217954d4 (drm/etnaviv: reduce reset delay, 2017-10-09)
> >=20
> > Yes, etnaviv uses much smaller delays in the reset sequence than the
> > vendor driver. Note that the msleep(1) in the downstream driver might
> > sleep for up to 10 milliseconds depending on kernel configuration.
> >=20
> > I would like to keep the tight delays in etnaviv if possible, as they
> > directly contribute to system startup time in some use cases that care
> > very much about this. I'm fine with deviating a bit from the vendor
> > driver reset sequence, if we can make it reliable.
> >=20
> > Regards,
> > Lucas
>=20
> Cool, this patch makes it slightly more reliable. Still capable of seeing=
 an
> issue after 1000 power cycles. I have another version that guards the oth=
er
> power interactions in this driver and I've tested 4038 cycles so far with=
out any
> issue.
>=20
> I will ask, since this does improve reliability and manually initializing
> flushes only saves us 2 gpu_read_power calls right now, should we continu=
e
> manually specifying gpu_read_power or should we just jam a gpu_read_power
> call into the gpu_write_power function to prevent any future issues?

I specifically don't want to penalize the power register writes in
sync_point_perfmon_sample_pre/post, as those have no timing component
to them and the barriers on command stream submission will make sure
the GPU gets to see things in the right order.

Please add a new function gpu_write_power_sync() containing the
readback and use this new function in the reset sequence, so we don't
sprinkle the readbacks onto every write there, but also don't penalize
the users outside the reset sequence.

Regards,
Lucas
