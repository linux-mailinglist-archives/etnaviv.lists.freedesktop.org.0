Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275EB35974F
	for <lists+etnaviv@lfdr.de>; Fri,  9 Apr 2021 10:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE8C6EBA8;
	Fri,  9 Apr 2021 08:11:12 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E071A6EABF
 for <etnaviv@lists.freedesktop.org>; Thu,  8 Apr 2021 12:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617883285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9w9YC3zCV/phM+v6dbwLtZQB2bWMLSUUDF9CJsBj118=;
 b=SYQQ6b5Ab1oPrYJTG3R7VJEj2KMCrIS76KAJEADW5MVN4rQANjVmXdhErcGbG4z7iEFgwy
 IdXnoZXf0qnVtMFmPX7uBTjK+PrISvbsFIkXt89lQcdsD2ywGB8u7RiQa7fUPhur6gL8jb
 FduycXLXb0kAI1NJbqeqIAD5dl97UWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-ipUMHffwO8qCjSquithB5A-1; Thu, 08 Apr 2021 08:01:20 -0400
X-MC-Unique: ipUMHffwO8qCjSquithB5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E741F8710FD;
 Thu,  8 Apr 2021 12:00:54 +0000 (UTC)
Received: from [10.36.112.70] (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4480460853;
 Thu,  8 Apr 2021 12:00:49 +0000 (UTC)
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: Arnd Bergmann <arnd@arndb.de>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
 <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
 <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <3a2d64a7-8425-8daf-17ee-95b9f0c635f9@redhat.com>
Date: Thu, 8 Apr 2021 14:00:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mailman-Approved-At: Fri, 09 Apr 2021 08:11:07 +0000
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On 08.04.21 13:44, Arnd Bergmann wrote:
> On Thu, Apr 8, 2021 at 1:00 PM David Hildenbrand <david@redhat.com> wrote:
>>>
>>> It is a somewhat awkward way to say "prevent this symbol from
>>> being =y if the dependency is =m".
>>
>> What would be the right thing to do in the case here then to achieve the
>> "if DRMA_ASPEED_GFX is enabled, also enable DMA_CMA id possible"?
>>
>> One approach could be to have for DMA_CMA
>>
>> default y if DRMA_ASPEED_GFX
>>
>> but it feels like the wrong way to tackle this.
> 
> I'm still not sure what you are trying to achieve. Is the idea only to provide
> a useful default for DMA_CMA depending on which drivers are enabled?

"Random drivers should not override a user configuration of core knobs
(e.g., CONFIG_DMA_CMA=n)."

Let's assume I'm a distribution and want to set CONFIG_CMA=n or want to 
set CONFIG_DMA_CMA=n with CONFIG_CMA=y; there is no way to do that with 
e.g., DRMA_ASPEED_GFX=y because it will always override my (user!) 
setting -- even though it doesn't really always need it. Using "select" 
is the problem here.

> 
> This is something you could do using a hidden helper symbol like
> 
> config DRMA_ASPEED_GFX
>         bool "Aspeed display driver"
>         select DRM_WANT_CMA
> 
> config DRM_WANT_CMA
>         bool
>         help
>            Select this from any driver that benefits from CMA being enabled
> 
> config DMA_CMA
>         bool "Use CMA helpers for DRM"
>         default DRM_WANT_CMA
> 
>           Arnd
> 

That's precisely what I had first, with an additional "WANT_CMA" --  but 
looking at the number of such existing options (I was able to spot 1 !) 
I wondered if there is a better approach to achieve the same; "imply" 
sounded like a good candidate.

-- 
Thanks,

David / dhildenb

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
