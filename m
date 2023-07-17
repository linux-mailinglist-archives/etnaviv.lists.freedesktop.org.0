Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCA175650E
	for <lists+etnaviv@lfdr.de>; Mon, 17 Jul 2023 15:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461A810E253;
	Mon, 17 Jul 2023 13:34:08 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from out-10.mta0.migadu.com (out-10.mta0.migadu.com [91.218.175.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660F710E257
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Jul 2023 13:34:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------IJqnIXHQHd0oWDiqCHPxgcBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689600843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kkckZSA+inAR7TFamVZNuzW5TIQv43tF8fQPgC6ze4U=;
 b=pFcInVz32lzzxaGc48q9cCI+P8pY1nDNyCYMWa9gpPNdfkwe7TRBiqt1ZScQVKuu9zXtF4
 X/01soZdcxtwdtJnAH3+8pQs+08mTOLXTfelaOeZpTu94wT0jhcK0TCDPyg8sopmm+rRwl
 lmgj0sBlzDjsrGa9jsgak6557stfrfc=
Message-ID: <b224d17b-4889-a913-8856-bad1f4262f9c@linux.dev>
Date: Mon, 17 Jul 2023 21:33:55 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v1 1/8] drm/etnaviv: Using the size_t variable to store
 the number of pages
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <20230623100822.274706-2-sui.jingfeng@linux.dev>
 <4f80b175f94eaf386354d1f3425208ca6cf20482.camel@pengutronix.de>
 <4484c007-132c-ce47-fa71-87f33c87fe07@linux.dev>
 <8b0d82d48ff24f578e7a1c7433e56ddaadc3188b.camel@pengutronix.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <8b0d82d48ff24f578e7a1c7433e56ddaadc3188b.camel@pengutronix.de>
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
Cc: loongson-kernel@lists.loongnix.cn, Sui Jingfeng <suijingfeng@loongson.cn>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------IJqnIXHQHd0oWDiqCHPxgcBt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2023/7/17 18:38, Lucas Stach wrote:
> Am Montag, dem 17.07.2023 um 18:12 +0800 schrieb Sui Jingfeng:
>> Hi
>>
>> On 2023/7/17 17:43, Lucas Stach wrote:
>>> Hi Jingfeng,
>>>
>>> Am Freitag, dem 23.06.2023 um 18:08 +0800 schrieb Sui Jingfeng:
>>>> From: Sui Jingfeng<suijingfeng@loongson.cn>
>>>>
>>>> Because the etnaviv_gem_new_private() function receives the size_t argument
>>>> for the number of pages. And the number of pages should be unsigned.
>>>>
>>>> Note that Most 32-bit architectures use "unsigned int" size_t,
>>>> and all 64-bit architectures use "unsigned long" size_t.
>>>> So, let's keep the argument and parameter consistent.
>>>>
>>> This explanation doesn't add up. npages is just that: a number of
>>> pages. Why would it make sense to use size_t here?
>> Because the 'size' variable in the etnaviv_gem_prime_import_sg_table()
>> function is declared
>>
>> as size_t type. On 64-bit machine, size_t is actually is 64-bit wide and
>> it is*unsigned*.
>>
>> While 'int' is actually 32-bit wide(at both 32-bit system and 64-bit
>> system) and it is*signed*,
>>
>> So, my point (argument) is that
>>
>>
>> 1) This patch help to avoid the unnecessary 64 bit to 32 bit conversion.
>>
>> 2) The kvmalloc_array() function also accept  size_t type (see the
>> prototype of  kvmalloc_array function include/linux/slab.h)
>>
>>
>> So my patch do helps to keep the code style consistent.
>>
> But then we go on to call drm_prime_sq_to_page_array(), which takes a
> integer as the number of pages parameter, so the parameter types are
> inconsistent before and after your patch, it just switches which
> function call has to do some conversion.
>
But the drm_prime_sg_to_page_array() function is going to be depreciated,

We probably could modified it also to unified it, that is to take size_t 
arguments.

--------------IJqnIXHQHd0oWDiqCHPxgcBt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 2023/7/17 18:38, Lucas Stach wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8b0d82d48ff24f578e7a1c7433e56ddaadc3188b.camel@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">Am Montag, dem 17.07.2023 um 18:12 +0800 schrieb Sui Jingfeng:
</pre>
      <blockquote type="cite" style="color: #007cff;">
        <pre class="moz-quote-pre" wrap="">Hi

On 2023/7/17 17:43, Lucas Stach wrote:
</pre>
        <blockquote type="cite" style="color: #007cff;">
          <pre class="moz-quote-pre" wrap="">Hi Jingfeng,

Am Freitag, dem 23.06.2023 um 18:08 +0800 schrieb Sui Jingfeng:
</pre>
          <blockquote type="cite" style="color: #007cff;">
            <pre class="moz-quote-pre" wrap="">From: Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn" moz-do-not-send="true">&lt;suijingfeng@loongson.cn&gt;</a>

Because the etnaviv_gem_new_private() function receives the size_t argument
for the number of pages. And the number of pages should be unsigned.

Note that Most 32-bit architectures use "unsigned int" size_t,
and all 64-bit architectures use "unsigned long" size_t.
So, let's keep the argument and parameter consistent.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">This explanation doesn't add up. npages is just that: a number of
pages. Why would it make sense to use size_t here?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Because the 'size' variable in the etnaviv_gem_prime_import_sg_table() 
function is declared

as size_t type. On 64-bit machine, size_t is actually is 64-bit wide and 
it is <b class="moz-txt-star"><span class="moz-txt-tag">*</span>unsigned<span class="moz-txt-tag">*</span></b>.

While 'int' is actually 32-bit wide(at both 32-bit system and 64-bit 
system) and it is <b class="moz-txt-star"><span class="moz-txt-tag">*</span>signed<span class="moz-txt-tag">*</span></b>,

So, my point (argument) is that


1) This patch help to avoid the unnecessary 64 bit to 32 bit conversion.

2) The kvmalloc_array() function also accept  size_t type (see the 
prototype of  kvmalloc_array function include/linux/slab.h)


So my patch do helps to keep the code style consistent.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">But then we go on to call drm_prime_sq_to_page_array(), which takes a
integer as the number of pages parameter, so the parameter types are
inconsistent before and after your patch, it just switches which
function call has to do some conversion.

</pre>
    </blockquote>
    <p>But the drm_prime_sg_to_page_array() function is going to be
      depreciated, <br>
    </p>
    <p>We probably could modified it also to unified it, that is to take
      size_t arguments.<br>
    </p>
  </body>
</html>

--------------IJqnIXHQHd0oWDiqCHPxgcBt--
