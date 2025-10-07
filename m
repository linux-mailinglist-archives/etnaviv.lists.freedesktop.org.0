Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20546BC201F
	for <lists+etnaviv@lfdr.de>; Tue, 07 Oct 2025 17:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F229010E1BA;
	Tue,  7 Oct 2025 15:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="XMhny7Qd";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 806 seconds by postgrey-1.36 at gabe;
 Tue, 07 Oct 2025 15:58:58 UTC
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915A910E1BA
 for <etnaviv@lists.freedesktop.org>; Tue,  7 Oct 2025 15:58:58 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597FjRJ8110694;
 Tue, 7 Oct 2025 10:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1759851927;
 bh=mAVaiGh5E1lXP7xZJPSuze+UZmYDgHfDPInqsqPezkk=;
 h=Date:CC:Subject:From:To:References:In-Reply-To;
 b=XMhny7QdDdFzRLiHAG7kAyl4Yzt7rS1/C+RivfdpZb/K0djNq4F+AsDusUEKrj/Z/
 Dw9v10BGdXvgHStMCzqHPDZR9nch0TUvObEE76fZL5ilYl5YkAdCQaALwEVGXnXcf+
 ME4o/nbH3Cxdv8zgNvdGWlFvuHRat0UFUcIcBSMY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597FjRIn3080146
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 7 Oct 2025 10:45:27 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 7
 Oct 2025 10:45:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 10:45:27 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597FjRlx1351636;
 Tue, 7 Oct 2025 10:45:27 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 7 Oct 2025 10:45:27 -0500
Message-ID: <DDC7FYCGRF9A.3T68CVC1OAEBK@ti.com>
CC: <etnaviv@lists.freedesktop.org>, <detheridge@ti.com>
Subject: Re: [PATCH] drm/etnaviv: force flush on power register ops
From: Randolph Sapp <rs@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>, <rs@ti.com>, <l.stach@pengutronix.de>,
 <linux+etnaviv@armlinux.org.uk>, <christian.gmeiner@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251006203008.986223-2-rs@ti.com>
 <5f015856-4458-4731-b660-627f3f6aed13@ti.com>
In-Reply-To: <5f015856-4458-4731-b660-627f3f6aed13@ti.com>
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

On Mon Oct 6, 2025 at 9:05 PM CDT, Udit Kumar wrote:
>
> On 10/7/2025 2:00 AM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Force a cache flush on power register operations during etnaviv_hw_reset
>> with two readbacks. I'm not sure if there are any other calls in this
>> reset sequence that are susceptible, but without these read ops we see
>
> "I'm not sure" could be avoided in commit message
>
>> occasional failures with etnaviv_hw_reset during boot and after multiple
>> probe/unprobe calls on the am57xx-evm.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etn=
aviv/etnaviv_gpu.c
>> index cf0d9049bcf1..320be7f66d74 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> @@ -544,12 +544,14 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gp=
u)
>>  =20
>>   		/* disable clock gating */
>>   		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
>> +		gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
>
> what about updating gpu_write_power function itself.
>
> something like
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h=20
> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h index 31322195b9e4..d273d9f2a1b1=
=20
> 100644 --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h +++=20
> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h @@ -194,6 +194,7 @@ static=20
> inline u32 gpu_fix_power_address(struct etnaviv_gpu *gpu, u32 reg)=20
> static inline void gpu_write_power(struct etnaviv_gpu *gpu, u32 reg, u32=
=20
> data) { writel(data, gpu->mmio + gpu_fix_power_address(gpu, reg)); +=20
> readl(gpu->mmio + gpu_fix_power_address(gpu, reg)); }
>
> this will take care of all other calls too.

I was hoping the maintainer would suggest such comment. I see that as a 50/=
50.
Benefits most cases but then someone could complain about a handful of back=
 to
back operations not needing to be flushed immediately. Prime real estate fo=
r
opinions.

- Randolph

>>  =20
>>   		/* disable pulse eater */
>>   		pulse_eater |=3D BIT(17);
>>   		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>>   		pulse_eater |=3D BIT(0);
>>   		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>> +		gpu_read_power(gpu, VIVS_PM_PULSE_EATER);
>>  =20
>>   		/* enable clock */
>>   		control =3D VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);

