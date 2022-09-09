Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4EB5B3B5E
	for <lists+etnaviv@lfdr.de>; Fri,  9 Sep 2022 17:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA24810EDFE;
	Fri,  9 Sep 2022 15:01:00 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA49A10EDFD
 for <etnaviv@lists.freedesktop.org>; Fri,  9 Sep 2022 15:00:55 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id y127so1910857pfy.5
 for <etnaviv@lists.freedesktop.org>; Fri, 09 Sep 2022 08:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=oTCLGWKfYgRdRClyg9AiQFkfj4XayGNssJHCiuRy1Hw=;
 b=DnIPbWcjISE7EOyEdoUzT4oTs/Z6dMGNft6q2HJrsuP7Y6Jelk6BTUTY3+zCaqcnN+
 v/2DYpNkBUe83leExNcdKjxXANkV58wTvrh+iJIkMp5045L38rSmvkVN6RMwEnTs2Dcn
 CFR9OYZ15iqAxlFIEgrGlVWhF6XKPmx/yWsMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=oTCLGWKfYgRdRClyg9AiQFkfj4XayGNssJHCiuRy1Hw=;
 b=UyoyF2FjkyBNQqZX8DiX2oPIEhYiQ91W3NtwckWP5+GDfXiNydSOjk8SL3KymzxgIq
 jvbAoY61cc36z5cb+0THcb7eRKAgDSYOstnJMN8wM8x+ydEezCIzdFUqSWO4TcxUWoOz
 p2I5DsA2GATLJlXZm4U8yQ5yWMNTqBswNJWAHrSrzSuklWVbnSGpkS5G8MgGH50z4zd+
 4mLw6n6Zmr+tsAYKEdTWrmbeuJTJgqR/MKD5x01tXJTTqU4Qw5LstB84FeDzqwXSrfPd
 5Y9YMqiy4KxU99Oi0igtbEJt8YEs71LrItDfRN0gqX/VVuoIE0ibmh6lUHdjUYg/vzrN
 rx6A==
X-Gm-Message-State: ACgBeo215oNjGyyqkOOZMFAqUpE8DjaF5L9TH6IVDfo4sSJi8k14iuLo
 Uo3sQHFUClm2bCINfEnJamij9g==
X-Google-Smtp-Source: AA6agR5p5jIa66GFVjGQIP31saIqOfWV6XEeZPjwkHCF96DFWUSSQeWM8gydmxio503Sf0OOnc0dxw==
X-Received: by 2002:a62:2fc6:0:b0:53e:285c:9b7f with SMTP id
 v189-20020a622fc6000000b0053e285c9b7fmr14552085pfv.58.1662735655196; 
 Fri, 09 Sep 2022 08:00:55 -0700 (PDT)
Received: from [192.168.1.33] ([50.45.132.243])
 by smtp.googlemail.com with ESMTPSA id
 e16-20020a630f10000000b004340d105fd4sm620406pgl.21.2022.09.09.08.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 08:00:54 -0700 (PDT)
Message-ID: <118d55c9-b7cf-6e04-0a0b-b6faed626460@schmorgal.com>
Date: Fri, 9 Sep 2022 08:00:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/2] drm/etnaviv: fix power register offset on GC300
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220907024719.36478-1-doug@schmorgal.com>
 <20220907024719.36478-3-doug@schmorgal.com>
 <95370d0f87b698017da49be083f436d9b91a76b5.camel@pengutronix.de>
From: Doug Brown <doug@schmorgal.com>
In-Reply-To: <95370d0f87b698017da49be083f436d9b91a76b5.camel@pengutronix.de>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Lucas,

On 9/9/2022 1:48 AM, Lucas Stach wrote:

>> @@ -83,10 +83,15 @@ static void etnaviv_core_dump_registers(struct core_dump_iterator *iter,
>>   {
>>   	struct etnaviv_dump_registers *reg = iter->data;
>>   	unsigned int i;
>> +	u32 addr;
>>   
>>   	for (i = 0; i < ARRAY_SIZE(etnaviv_dump_registers); i++, reg++) {
>> -		reg->reg = cpu_to_le32(etnaviv_dump_registers[i]);
>> -		reg->value = cpu_to_le32(gpu_read(gpu, etnaviv_dump_registers[i]));
>> +		addr = etnaviv_dump_registers[i];
>> +		if (addr >= VIVS_PM_POWER_CONTROLS &&
>> +		    addr <= VIVS_PM_PULSE_EATER)
>> +			addr = gpu_fix_power_address(gpu, addr);
>> +		reg->reg = cpu_to_le32(addr);
> 
> As the dumpdecoder tool would then need to reverse this address offset,
> I think it would be preferable to keep writing the canonical (not fixed
> up) register address into the dump. That way only the kernel needs to
> know about this special offset on GC300.

Ahh, I had no idea about how it worked on that side of things. Makes
complete sense. Thanks for reviewing! Will submit V3 with this and
everything else you mentioned fixed.

Doug
