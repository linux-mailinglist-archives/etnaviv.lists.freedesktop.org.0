Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1458BCB0A8
	for <lists+etnaviv@lfdr.de>; Fri, 10 Oct 2025 00:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FE310EB2F;
	Thu,  9 Oct 2025 22:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="swR+2Xvk";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E1010EB2F
 for <etnaviv@lists.freedesktop.org>; Thu,  9 Oct 2025 22:12:53 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 599MClTT176704;
 Thu, 9 Oct 2025 17:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760047967;
 bh=JT/iSvaN8cCNSKfLdk62WnyitXfhGBt6XEFl0NcWWsY=;
 h=Date:CC:Subject:From:To:References:In-Reply-To;
 b=swR+2XvkGlEskJzsZca0umRSc/+7FC3kolRGcRmgZMFj9+i2pkaXGquK+88Dl+F91
 2ma0rXs+9vRCqtVqFe0fcEy+bCfnb7SZ5Bpv+m4aTv0mpRIR16BUrgkNLvy1NywDzI
 awCBkSUYbjPnHT4nJaFT2NtISppb3xvk+ux0kFjY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 599MClOI601521
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 9 Oct 2025 17:12:47 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 9
 Oct 2025 17:12:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Oct 2025 17:12:47 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 599MCl0h911815;
 Thu, 9 Oct 2025 17:12:47 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 9 Oct 2025 17:12:47 -0500
Message-ID: <DDE4XLZWLRKN.39408CPUE8CC0@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, <linux+etnaviv@armlinux.org.uk>,
 <etnaviv@lists.freedesktop.org>, <detheridge@ti.com>
Subject: Re: [PATCH] drm/etnaviv: force flush on power register ops
From: Randolph Sapp <rs@ti.com>
To: Lucas Stach <l.stach@pengutronix.de>, Randolph Sapp <rs@ti.com>, Christian
 Gmeiner <christian.gmeiner@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251006203008.986223-2-rs@ti.com>
 <5f015856-4458-4731-b660-627f3f6aed13@ti.com>
 <DDC7FYCGRF9A.3T68CVC1OAEBK@ti.com>
 <CAH9NwWeku_WfK0XbEJKyZoVKuybGs__gGEdBiSiXqkT+O8kjKw@mail.gmail.com>
 <DDCE1RF87NE6.14F1ZNRFIPQUS@ti.com>
 <435fc68dd068b012c45d61a19110ef687bc57a2f.camel@pengutronix.de>
In-Reply-To: <435fc68dd068b012c45d61a19110ef687bc57a2f.camel@pengutronix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On Thu Oct 9, 2025 at 3:51 AM CDT, Lucas Stach wrote:
> Am Dienstag, dem 07.10.2025 um 15:56 -0500 schrieb Randolph Sapp:
>> On Tue Oct 7, 2025 at 1:17 PM CDT, Christian Gmeiner wrote:
>> > Hi
>> >=20
>> > Am Di., 7. Okt. 2025 um 17:45 Uhr schrieb Randolph Sapp <rs@ti.com>:
>> > >=20
>> > > On Mon Oct 6, 2025 at 9:05 PM CDT, Udit Kumar wrote:
>> > > >=20
>> > > > On 10/7/2025 2:00 AM, rs@ti.com wrote:
>> > > > > From: Randolph Sapp <rs@ti.com>
>> > > > >=20
>> > > > > Force a cache flush on power register operations during etnaviv_=
hw_reset
>> > > > > with two readbacks. I'm not sure if there are any other calls in=
 this
>> > > > > reset sequence that are susceptible, but without these read ops =
we see
>> > > >=20
>> > > > "I'm not sure" could be avoided in commit message
>> > > >=20
>> > > > > occasional failures with etnaviv_hw_reset during boot and after =
multiple
>> > > > > probe/unprobe calls on the am57xx-evm.
>> > > > >=20
>> > > > > Signed-off-by: Randolph Sapp <rs@ti.com>
>> > > > > ---
>> > > > >   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 ++
>> > > > >   1 file changed, 2 insertions(+)
>> > > > >=20
>> > > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu=
/drm/etnaviv/etnaviv_gpu.c
>> > > > > index cf0d9049bcf1..320be7f66d74 100644
>> > > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> > > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> > > > > @@ -544,12 +544,14 @@ static int etnaviv_hw_reset(struct etnaviv=
_gpu *gpu)
>> > > > >=20
>> > > > >              /* disable clock gating */
>> > > > >              gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
>> > > > > +            gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
>> > > >=20
>> > > > what about updating gpu_write_power function itself.
>> > > >=20
>> > > > something like
>> > > >=20
>> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> > > > b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h index 31322195b9e4..d273d9=
f2a1b1
>> > > > 100644 --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h +++
>> > > > b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h @@ -194,6 +194,7 @@ static
>> > > > inline u32 gpu_fix_power_address(struct etnaviv_gpu *gpu, u32 reg)
>> > > > static inline void gpu_write_power(struct etnaviv_gpu *gpu, u32 re=
g, u32
>> > > > data) { writel(data, gpu->mmio + gpu_fix_power_address(gpu, reg));=
 +
>> > > > readl(gpu->mmio + gpu_fix_power_address(gpu, reg)); }
>> > > >=20
>> > > > this will take care of all other calls too.
>> > >=20
>> > > I was hoping the maintainer would suggest such comment. I see that a=
s a 50/50.
>> > > Benefits most cases but then someone could complain about a handful =
of back to
>> > > back operations not needing to be flushed immediately. Prime real es=
tate for
>> > > opinions.
>> > >=20
>> >=20
>> > You sent your email less than 24 hours ago - please give the
>> > maintainer and developers
>> > some time to respond.
>>=20
>> Right, it wasn't a dig at the maintainers, it's more to say "yes, that i=
s the
>> obvious secondary implementation here's why I didn't choose to do that f=
irst."
>> As well as an indication that I wanted to wait for further input.
>>=20
>> > I had a quick look at the galcore kernel driver but didn=E2=80=99t fin=
d
>> > anything resembling your
>> > workaround. I=E2=80=99m wondering:
>> > a) why we haven=E2=80=99t encountered this issue on other platforms, a=
nd
>
> I've recently seen some cases where the GPU reset didn't properly
> propagate and left the MMU enabled, which I suspect is related to those
> power gating register writes. Maybe the TI platform just makes it a bit
> more obvious what is happening here.
>
>> > b) what the underlying problem is that you=E2=80=99re trying to addres=
s.
>> >=20
>> > Do you observe the same issue when using the binary blob driver stack
>> > on your SoC?
>>=20
>> As to why we haven't seen this on other platforms, that's a fair point. =
I assume
>> it's something to do with the generic interconnect target module that's =
wrapping
>> our definition. This may be wrong though, I haven't spent too much time =
digging
>> through our older IP.
>>=20
>> The underlying problem seems to be that occasionally when calling
>> etnaviv_hw_reset we see reports from omap_l3_noc that an L3 application =
error
>> occurred.
>>=20
>> We do not see the same issue when using the binary blob driver, but from=
 a
>> cursory glance it's reset mechanism is much more complicated/obfuscated.=
 They
>> also use 1 microsecond delays between the power related ops, the trigger=
ing of
>> the software reset, and the reading of the idle status. It could very we=
ll be
>> timing related, though this doesn't seem to be supported by other patche=
s like:
>>=20
>> 4046217954d4 (drm/etnaviv: reduce reset delay, 2017-10-09)
>
> Yes, etnaviv uses much smaller delays in the reset sequence than the
> vendor driver. Note that the msleep(1) in the downstream driver might
> sleep for up to 10 milliseconds depending on kernel configuration.
>
> I would like to keep the tight delays in etnaviv if possible, as they
> directly contribute to system startup time in some use cases that care
> very much about this. I'm fine with deviating a bit from the vendor
> driver reset sequence, if we can make it reliable.
>
> Regards,
> Lucas

Cool, this patch makes it slightly more reliable. Still capable of seeing a=
n
issue after 1000 power cycles. I have another version that guards the other
power interactions in this driver and I've tested 4038 cycles so far withou=
t any
issue.

I will ask, since this does improve reliability and manually initializing
flushes only saves us 2 gpu_read_power calls right now, should we continue
manually specifying gpu_read_power or should we just jam a gpu_read_power
call into the gpu_write_power function to prevent any future issues?

- Randolph
