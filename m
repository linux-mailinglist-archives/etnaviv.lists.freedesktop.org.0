Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A53BC0B65
	for <lists+etnaviv@lfdr.de>; Tue, 07 Oct 2025 10:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5589210E07F;
	Tue,  7 Oct 2025 08:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="v68iVk6/";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C446F10E0A0
 for <etnaviv@lists.freedesktop.org>; Tue,  7 Oct 2025 02:06:03 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59725wpS3729736;
 Mon, 6 Oct 2025 21:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1759802758;
 bh=YVUvO84xKLi99yVUHBezl4FZcILgqigiD/e6pfppTkI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=v68iVk6/yalxq3QR5DUu+Ep350cP9pIEV/h+J4VRF2fXBeKRtjtlSpdroKBUugOdB
 8wACDgUJ2EBrL79wKcyyBELjkMxN9FZ7y+dY9BxjCQAvsw76t3WGMNHh/pkKmDLwPf
 aaH5dJLGEhqaUKLobJZVJEExgFg2fCldxznJnzGQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59725wit3731981
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 6 Oct 2025 21:05:58 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 21:05:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 21:05:57 -0500
Received: from [10.249.141.75] ([10.249.141.75])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59725tKC403121;
 Mon, 6 Oct 2025 21:05:55 -0500
Message-ID: <5f015856-4458-4731-b660-627f3f6aed13@ti.com>
Date: Tue, 7 Oct 2025 07:35:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/etnaviv: force flush on power register ops
To: <rs@ti.com>, <l.stach@pengutronix.de>, <linux+etnaviv@armlinux.org.uk>,
 <christian.gmeiner@gmail.com>
CC: <etnaviv@lists.freedesktop.org>, <detheridge@ti.com>, <u-kumar1@ti.com>
References: <20251006203008.986223-2-rs@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20251006203008.986223-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Tue, 07 Oct 2025 08:39:35 +0000
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


On 10/7/2025 2:00 AM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Force a cache flush on power register operations during etnaviv_hw_reset
> with two readbacks. I'm not sure if there are any other calls in this
> reset sequence that are susceptible, but without these read ops we see

"I'm not sure" could be avoided in commit message

> occasional failures with etnaviv_hw_reset during boot and after multiple
> probe/unprobe calls on the am57xx-evm.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index cf0d9049bcf1..320be7f66d74 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -544,12 +544,14 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
>   
>   		/* disable clock gating */
>   		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
> +		gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);

what about updating gpu_write_power function itself.

something like

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h 
b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h index 31322195b9e4..d273d9f2a1b1 
100644 --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h +++ 
b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h @@ -194,6 +194,7 @@ static 
inline u32 gpu_fix_power_address(struct etnaviv_gpu *gpu, u32 reg) 
static inline void gpu_write_power(struct etnaviv_gpu *gpu, u32 reg, u32 
data) { writel(data, gpu->mmio + gpu_fix_power_address(gpu, reg)); + 
readl(gpu->mmio + gpu_fix_power_address(gpu, reg)); }

this will take care of all other calls too.

>   
>   		/* disable pulse eater */
>   		pulse_eater |= BIT(17);
>   		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>   		pulse_eater |= BIT(0);
>   		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> +		gpu_read_power(gpu, VIVS_PM_PULSE_EATER);
>   
>   		/* enable clock */
>   		control = VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
