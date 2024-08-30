Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182D7966A0F
	for <lists+etnaviv@lfdr.de>; Fri, 30 Aug 2024 21:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC55910E0B9;
	Fri, 30 Aug 2024 19:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="UVUQhKxz";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5336910E02E
 for <etnaviv@lists.freedesktop.org>; Fri, 30 Aug 2024 19:49:12 +0000 (UTC)
Message-ID: <ee484db3-48e5-434f-8f41-21535c1bf069@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725047350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jlo7JXcZy13WFGclfaaL1pYp+Vqeb6IGWRjH5IJWAM8=;
 b=UVUQhKxzPkbU6KYHPDeNVPypYrkPwtMT9wxRxMe3vaHiVR6pTwY2ikE7u8Vsy2KBMCHza7
 qpat9lOCHFyBqpERh7nv3Rt50e9fyuP/pt3NXejBp3NC/vwTzEiRDV+QW8AujIlywr7s65
 unHj1N2lBjwdEZVdKaPmXV6yuns67fc=
Date: Sat, 31 Aug 2024 03:48:49 +0800
MIME-Version: 1.0
Subject: Re: [v2] drm/etnaviv: Clear the __GFP_HIGHMEM bit in GFP_HIGHUSER
 with 32 address
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: "Wang, Xiaolei" <Xiaolei.Wang@windriver.com>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>,
 "christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <MW5PR11MB57648F441CEDD36E614E31EA95812@MW5PR11MB5764.namprd11.prod.outlook.com>
 <761c07a9-a507-44a6-94e5-69655881c137@linux.dev>
Content-Language: en-US
In-Reply-To: <761c07a9-a507-44a6-94e5-69655881c137@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

On 2024/8/31 03:40, Sui Jingfeng wrote:
> Hi, Xiaolei
>
>
> On 2024/8/16 09:55, Wang, Xiaolei wrote:
>> Ping ...
>
> I think, the more proper fix that Lucas hint
> is to modify the 'priv->shm_gfp_mask' variable
> in the|etnaviv_bind() function|. Say:
> |Use "priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | 
> __GFP_NOWARN;"|
>
> instead of
>
> |"priv->shm_gfp_mask = ||GFP_HIGHUSER||| __GFP_RETRY_MAYFAIL | 
> __GFP_NOWARN;|"
>
>

Oops, please ignore the irrelevant(superfluous) "|" characters in my
reply, my Thunderbird mail client has some problem, generate them unreasonably.

Should be:

priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;



> Right?
>
>> thanks
>> xiaolei
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c 
>> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> index 7c7f97793ddd..0e6bdf2d028b 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> @@ -844,8 +844,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>>            * request pages for our SHM backend buffers from the DMA32 
>> zone to
>>            * hopefully avoid performance killing SWIOTLB bounce 
>> buffering.
>>            */
>> -       if (dma_addressing_limited(gpu->dev))
>> +       if (dma_addressing_limited(gpu->dev)) {
>>                   priv->shm_gfp_mask |= GFP_DMA32;
>> +               priv->shm_gfp_mask &= ~__GFP_HIGHMEM;
>> +       }
>>
>>           /* Create buffer: */
>>           ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
>
-- 
Best regards,
Sui

