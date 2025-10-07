Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FDABC2B61
	for <lists+etnaviv@lfdr.de>; Tue, 07 Oct 2025 22:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BD810E714;
	Tue,  7 Oct 2025 20:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="TbjLSlvW";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5A410E714
 for <etnaviv@lists.freedesktop.org>; Tue,  7 Oct 2025 20:56:08 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597Ku3Iq3901710;
 Tue, 7 Oct 2025 15:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1759870563;
 bh=QMy7aWJ20bHEpQ4OXuJ6tuq+jVG6Sf/zPWfZkFQWHLU=;
 h=Date:CC:Subject:From:To:References:In-Reply-To;
 b=TbjLSlvWkm1+gCBtt7cDhozTq0xCFvwPGvwoTshlPg5jYBdrKwQa6Iw+yTftJNbUv
 F4Pr1LF1n2kGSAZPG7fCfs9Tp2EuOSB+AYwuGev2f20TQeySekz4gmxhPDtrApaLGB
 BfVjYvkQAMMR1ZAUdxKfbLWxs7rG35q1VDaud9LE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597Ku3ha3848804
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 7 Oct 2025 15:56:03 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 7
 Oct 2025 15:56:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 15:56:02 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597Ku2px1707946;
 Tue, 7 Oct 2025 15:56:02 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 7 Oct 2025 15:56:02 -0500
Message-ID: <DDCE1RF87NE6.14F1ZNRFIPQUS@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, <l.stach@pengutronix.de>,
 <linux+etnaviv@armlinux.org.uk>, <etnaviv@lists.freedesktop.org>,
 <detheridge@ti.com>
Subject: Re: [PATCH] drm/etnaviv: force flush on power register ops
From: Randolph Sapp <rs@ti.com>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251006203008.986223-2-rs@ti.com>
 <5f015856-4458-4731-b660-627f3f6aed13@ti.com>
 <DDC7FYCGRF9A.3T68CVC1OAEBK@ti.com>
 <CAH9NwWeku_WfK0XbEJKyZoVKuybGs__gGEdBiSiXqkT+O8kjKw@mail.gmail.com>
In-Reply-To: <CAH9NwWeku_WfK0XbEJKyZoVKuybGs__gGEdBiSiXqkT+O8kjKw@mail.gmail.com>
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

On Tue Oct 7, 2025 at 1:17 PM CDT, Christian Gmeiner wrote:
> Hi
>
> Am Di., 7. Okt. 2025 um 17:45 Uhr schrieb Randolph Sapp <rs@ti.com>:
>>
>> On Mon Oct 6, 2025 at 9:05 PM CDT, Udit Kumar wrote:
>> >
>> > On 10/7/2025 2:00 AM, rs@ti.com wrote:
>> >> From: Randolph Sapp <rs@ti.com>
>> >>
>> >> Force a cache flush on power register operations during etnaviv_hw_re=
set
>> >> with two readbacks. I'm not sure if there are any other calls in this
>> >> reset sequence that are susceptible, but without these read ops we se=
e
>> >
>> > "I'm not sure" could be avoided in commit message
>> >
>> >> occasional failures with etnaviv_hw_reset during boot and after multi=
ple
>> >> probe/unprobe calls on the am57xx-evm.
>> >>
>> >> Signed-off-by: Randolph Sapp <rs@ti.com>
>> >> ---
>> >>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 ++
>> >>   1 file changed, 2 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/=
etnaviv/etnaviv_gpu.c
>> >> index cf0d9049bcf1..320be7f66d74 100644
>> >> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> >> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> >> @@ -544,12 +544,14 @@ static int etnaviv_hw_reset(struct etnaviv_gpu =
*gpu)
>> >>
>> >>              /* disable clock gating */
>> >>              gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
>> >> +            gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
>> >
>> > what about updating gpu_write_power function itself.
>> >
>> > something like
>> >
>> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> > b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h index 31322195b9e4..d273d9f2a1=
b1
>> > 100644 --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h +++
>> > b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h @@ -194,6 +194,7 @@ static
>> > inline u32 gpu_fix_power_address(struct etnaviv_gpu *gpu, u32 reg)
>> > static inline void gpu_write_power(struct etnaviv_gpu *gpu, u32 reg, u=
32
>> > data) { writel(data, gpu->mmio + gpu_fix_power_address(gpu, reg)); +
>> > readl(gpu->mmio + gpu_fix_power_address(gpu, reg)); }
>> >
>> > this will take care of all other calls too.
>>
>> I was hoping the maintainer would suggest such comment. I see that as a =
50/50.
>> Benefits most cases but then someone could complain about a handful of b=
ack to
>> back operations not needing to be flushed immediately. Prime real estate=
 for
>> opinions.
>>
>
> You sent your email less than 24 hours ago - please give the
> maintainer and developers
> some time to respond.

Right, it wasn't a dig at the maintainers, it's more to say "yes, that is t=
he
obvious secondary implementation here's why I didn't choose to do that firs=
t."
As well as an indication that I wanted to wait for further input.

> I had a quick look at the galcore kernel driver but didn=E2=80=99t find
> anything resembling your
> workaround. I=E2=80=99m wondering:
> a) why we haven=E2=80=99t encountered this issue on other platforms, and
> b) what the underlying problem is that you=E2=80=99re trying to address.
>
> Do you observe the same issue when using the binary blob driver stack
> on your SoC?

As to why we haven't seen this on other platforms, that's a fair point. I a=
ssume
it's something to do with the generic interconnect target module that's wra=
pping
our definition. This may be wrong though, I haven't spent too much time dig=
ging
through our older IP.

The underlying problem seems to be that occasionally when calling
etnaviv_hw_reset we see reports from omap_l3_noc that an L3 application err=
or
occurred.

We do not see the same issue when using the binary blob driver, but from a
cursory glance it's reset mechanism is much more complicated/obfuscated. Th=
ey
also use 1 microsecond delays between the power related ops, the triggering=
 of
the software reset, and the reading of the idle status. It could very well =
be
timing related, though this doesn't seem to be supported by other patches l=
ike:

4046217954d4 (drm/etnaviv: reduce reset delay, 2017-10-09)

- Randolph
