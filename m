Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BFE5ADA85
	for <lists+etnaviv@lfdr.de>; Mon,  5 Sep 2022 23:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C3C10E3DA;
	Mon,  5 Sep 2022 21:05:43 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6C910E114
 for <etnaviv@lists.freedesktop.org>; Mon,  5 Sep 2022 21:05:38 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id u22so9365745plq.12
 for <etnaviv@lists.freedesktop.org>; Mon, 05 Sep 2022 14:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date; bh=2xu9ufF7COCj2Pj+OFGVCC6niLar26JmSUKbKSGjg0s=;
 b=bOaPh0dqRI00nYYxH8DTvSoT4UQ7GFMlMoDixV7Zx9s2PUWTDsEWwhZZNDa+i7AT3m
 R3B/b1HSjULEZQm52p8koTtdz3JD8XcQj/lKMwYIAxkhyQ4lMl4rOuNdjoszs+Auqqv/
 bFha2P3vi1TAYCJ/EJfg5XFdtI9gxMkI3AMGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2xu9ufF7COCj2Pj+OFGVCC6niLar26JmSUKbKSGjg0s=;
 b=zMY84YBWm6ECz5tWL665lNivAIaG+4S7lrO4xrghdJfRrP7Ij9HOSpPXwFPOzUQoC5
 jVpQPe/sYvSTO2ILJG3FcT6YmUUjET/sQO2BYJdG4gEWMOzNL/fpKJJq1Kd1ve7RKeT0
 GF+Cklkkd/gOI1kt29AZ6EqhJ0z7ay74cVB1N8zpOAHgnxpzurcvoFxDcun0oaEt9+9/
 /xLpQ5A+C42TpihjhzhCxkk0hagbmgwy4JOuWsL64/A239wLJOZHMeSdfqXuqcZsQQsB
 2Y+v0fAkdZdb7nlVyr5FOE9wqwjSuoaJGU7sb8FTS7jFO3ZewnILyZmShOSvYYf2VpJF
 aBbQ==
X-Gm-Message-State: ACgBeo2F9SBWrj3+mCw6ai7BBAJnEbtpUcnURiTHxfBh7g8RxIsOiIfm
 id3jcolPMz4ZRA36ppTF6tlC9Q==
X-Google-Smtp-Source: AA6agR6f4ahCA5Yh1pr8IEekOEfXQy5/TBebnT92LfX5NZph+Hu1V5a8po6u/eWpc0pvmIf3/GWUsQ==
X-Received: by 2002:a17:90b:4d8e:b0:200:73b4:4da2 with SMTP id
 oj14-20020a17090b4d8e00b0020073b44da2mr5766559pjb.197.1662411938373; 
 Mon, 05 Sep 2022 14:05:38 -0700 (PDT)
Received: from [192.168.1.33] ([50.45.132.243])
 by smtp.googlemail.com with ESMTPSA id
 b4-20020a17090a7ac400b001fd9c63e56bsm10934825pjl.32.2022.09.05.14.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 14:05:37 -0700 (PDT)
Message-ID: <6e97587f-e101-13cd-0d40-fa3dc4c625c9@schmorgal.com>
Date: Mon, 5 Sep 2022 14:05:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Christian Gmeiner <christian.gmeiner@gmail.com>
References: <20220903060558.55167-1-doug@schmorgal.com>
 <20220903060558.55167-3-doug@schmorgal.com>
 <CAH9NwWd1Q6iGUZoB7j3zAd-Pj_vq4WueguyfhKeWdWo6SPJ+PQ@mail.gmail.com>
From: Doug Brown <doug@schmorgal.com>
Subject: Re: [PATCH 2/2] drm/etnaviv: fix power register offset on GC300
In-Reply-To: <CAH9NwWd1Q6iGUZoB7j3zAd-Pj_vq4WueguyfhKeWdWo6SPJ+PQ@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, etnaviv@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Christian,

On 9/3/2022 4:49 AM, Christian Gmeiner wrote:

> I had a quick look at what vivantes kernel driver did. It uses a per
> gpu instance variable powerBaseAddress
> that gets set accordingly. I am not sure if I really like the
> gpu_fix_reg_address(..) idea, as it gets called on every
> register read and write. For me I see two other possible solutions:
> 
> 1) Add two seperate helpers ala gpu_read_power() and gpu_write_power()
> where we do the if beast.
> 2) Add a power register offset variable to etnaviv_gpu and explicitly
> use it on for reads and writes - like the Vivante driver does.
> 
> But that's just my personal opinion. Can't wait to hear what Lucas thinks.
> 

Thanks for reviewing so fast! I honestly agree. It felt kind of dirty
modifying gpu_write and gpu_read. The reason I went for it is I was
thinking that in most cases the compiler is going to optimize the ugly
"if" out.

The two solutions listed above both sound good. They would need a
special case in etnaviv_core_dump_registers, but that's probably much
less nasty than modifying gpu_read and gpu_write. Any preferences from
everyone on which of the other two options I should do? The
gpu_read_power and gpu_write_power approach sounds pretty clean to me.

Also, dropping David Airlie from the chain -- his email address bounced
on my original patch messages.

Doug
