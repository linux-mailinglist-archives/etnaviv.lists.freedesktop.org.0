Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665868CB29A
	for <lists+etnaviv@lfdr.de>; Tue, 21 May 2024 19:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6283210E398;
	Tue, 21 May 2024 17:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fWpkLXXN";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836AB10EA10
 for <etnaviv@lists.freedesktop.org>; Tue, 21 May 2024 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716311413;
 bh=fpyYJDes1L+b+8Dv9pQxZYKXFZ2/+BjkebNlZ21iIGk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=fWpkLXXNoe18iEnzMYPYWW9EPLU/IYEwT0hIT/DoWAVYUbMosBPXj7KGktPOie30m
 CNGc1rokHY7a6gfwQ2RSuDoYu1LRkYyT432yfIU9xHXAvIk8tBmZ7nvbJXIWUqMJt9
 ASw+O0x0cxSeBlZFSU66ell/FnrzU4iSX/VjglCS67J/p2L1Vl/zNKIy9OlRQ8Dl06
 6V0XngEEljPY6z5GlVWLHIqJbtueNJ+8hQaLB2U3T/Taws0eziR+/bXjl85qvijiLM
 EttFtEhKe/lfpLm+ugFu5S8rEFD7PhBd+1FCxQh2SMJZzEzJJRdIqY6Pozl3ZH+kSL
 zbxozth4wmSMQ==
Received: from [100.120.197.163] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: derekf)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 42F56378107C;
 Tue, 21 May 2024 17:10:13 +0000 (UTC)
Message-ID: <e17ced84-05b0-448f-8939-a29479604d1e@collabora.com>
Date: Tue, 21 May 2024 12:10:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/etnaviv: Read some FE registers twice
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
References: <20240503191158.281396-1-derek.foreman@collabora.com>
 <34fd5ade5f172545d8531275c094affb4b4a1ef1.camel@pengutronix.de>
Content-Language: en-US
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <34fd5ade5f172545d8531275c094affb4b4a1ef1.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello,

On 2024-05-16 12:36, Lucas Stach wrote:
> Hi Derek,
>
> Am Freitag, dem 03.05.2024 um 14:11 -0500 schrieb Derek Foreman:
>> On some hardware (such at the GC7000 rev 6009), these registers need to be
>> read twice to return the correct value. Hide that in gpu_read().
>>
>> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> index 197e0037732e..0f67c62be3d1 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> @@ -11,6 +11,7 @@
>>   #include "etnaviv_mmu.h"
>>   #include "etnaviv_drv.h"
>>   #include "common.xml.h"
>> +#include "state.xml.h"
>>   
>>   struct etnaviv_gem_submit;
>>   struct etnaviv_vram_mapping;
>> @@ -170,6 +171,13 @@ static inline void gpu_write(struct etnaviv_gpu *gpu, u32 reg, u32 data)
>>   
>>   static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
>>   {
>> +	/* On some variants, such as the GC7000 6009, some FE registers
>                                           GC7000 rev 6009
>> +	 * need two reads to be consistent. Do that extra read here and
>> +	 * throw away the result.
>> +	 */
> Please use the common comment style of this driver with a blank line
> after the /*
Oops - done for v2. Thanks.
>> +	if (reg >= VIVS_FE_DMA_STATUS && reg <= VIVS_FE_AUTO_FLUSH)
>> +		readl(gpu->mmio + reg);
> I don't think it matters much, but we can save some of the overhead
> here by using readl_relaxed.

Can I just not do this? I'm concerned that losing the memory barrier 
could result in weird reads again. The galcore driver doesn't use a 
relaxed read, and these registers are only ever read when something goes 
wrong - so I don't think performance is a concern at all?

Thanks,
Derek

> Regards,
> Lucas
>
>> +
>>   	return readl(gpu->mmio + reg);
>>   }
>>   
