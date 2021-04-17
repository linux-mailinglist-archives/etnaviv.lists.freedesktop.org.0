Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33134364AD6
	for <lists+etnaviv@lfdr.de>; Mon, 19 Apr 2021 21:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A3D6E430;
	Mon, 19 Apr 2021 19:55:54 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16076E03D
 for <etnaviv@lists.freedesktop.org>; Sat, 17 Apr 2021 03:46:54 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j4so8312475lfp.0
 for <etnaviv@lists.freedesktop.org>; Fri, 16 Apr 2021 20:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XFxGtrXgbmXjfZCesZLkekdr/NFK2RHjMWs9Si8qaW4=;
 b=pUt973xgO/jhJGstUOeoWJyQaVVcFUx3Py99aPyfIePWcyqVk2TNRZ9McCWE5SWfwU
 JS0adGs/fmKuan5y1th/FXngsLaNrq2RT9N7r855IfnNCAsY14P7cmlAFrIcuxg1Dr7m
 YmDH4JqX+TmvtWNxNGF0Pml6N096lqD1dXC7kFx35UrnqWYFwBxj4WE8etCvam20bgZ6
 pakAg6XXYR+MmfUqGeUTfI5oK7F87yQnAkw9e6QSCNKlVcQ1zHpmbcsQD5lKScGBTq4n
 F2jYXsHk03yHq+5Xo+D2ur1v142brTKLSPfcUFycWaltVAwxTD3ZxXgupzI5EJegHwSv
 iL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XFxGtrXgbmXjfZCesZLkekdr/NFK2RHjMWs9Si8qaW4=;
 b=oR3L/VknPJbRfjUM9cAQtxmoiN7Z1LLab0nYxmz3RdbwgckFst9M1giBes8GebJHX5
 S1TZhT7f4JmsAGoQ/+dAYTB/OH2mOFXVDJFTgoloLADc0BGeypSVuWIDuPG+SLl5XblP
 IJnGmvXQ+EyQiLKzxEJsuBxGJlvjEv4FhTFslgu84vFZXnnUCQ0b3eUQE2o0z5n0CLEA
 qz0gKP8gKXtqRHF5uhrMt3vvmG7qyORIcJILAJZCGJalzdA9/6ufuRooQzjvbHlhpuNW
 8jSqxLOD9uciB+lnX4i4q1BOq8Fhzo7JNz933cs5bLTjw6YSHCIcUYnVjsj/DYkD4alt
 0KsA==
X-Gm-Message-State: AOAM532YJchHlWgrBgp5KA8s9HjUTyX+OvHOIT1EuLHgWeelZo6FgqJJ
 MND0o3ByNvln6k7memz6fJZxwafvnT3SBPZvOz8pOA==
X-Google-Smtp-Source: ABdhPJz1ZMJODsEgaUcffHKQmT9ga4gXaMF6q3NEnZOoxBgg72eKA73vTRAA/JcctxtXhEcIqRpHR5FPdkmsxkMmJ4Q=
X-Received: by 2002:ac2:5238:: with SMTP id i24mr5237382lfl.535.1618631213053; 
 Fri, 16 Apr 2021 20:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <d83adc7a-d9db-af35-83c9-6d3dab60ab82@jm0.eu>
 <9880212dc158bbadbccb6313d9fa59a27698ef3e.camel@pengutronix.de>
 <a7002193-343d-9144-38ab-63542c09a4de@jm0.eu>
 <11943ea5d883bd2632c71f4a9e1a42c5f88c5e14.camel@pengutronix.de>
In-Reply-To: <11943ea5d883bd2632c71f4a9e1a42c5f88c5e14.camel@pengutronix.de>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 16 Apr 2021 20:46:41 -0700
Message-ID: <CALAqxLWsOLvrSxWzhGDzvUDyDfcKXJ7wK4oSaQ9Wqo4_iKLjkg@mail.gmail.com>
Subject: Re: etnaviv fails probe early, but succeeds after rmmod && modprobe
To: Lucas Stach <l.stach@pengutronix.de>
X-Mailman-Approved-At: Mon, 19 Apr 2021 19:55:53 +0000
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
Cc: Rob Herring <robh@kernel.org>, "Ing. Josua Mayer" <josua.mayer@jm0.eu>,
 etnaviv@lists.freedesktop.org, Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 4:13 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> Am Freitag, dem 16.04.2021 um 12:57 +0200 schrieb Ing. Josua Mayer:
> > Hi Lucas,
> >
> > anatop_regulator is indeed a module currently,
> > this is one of the changes introduced in their jump from kernel 5.9 to
> > 5.10 - and has even landed in buster through backports ...
> >
> > I wonder how / where those timeouts are specified.
> > Regarding the order of module loading there is not much I can do, it is
> > already the second module inserted by the initramfs.
>
> This looks like a kernel bug to me. If no timeout is given on the
> command line, the status is immediately considered as timed-out after
> the initcalls are done, as the code doesn't differentiate between "no
> timeout given" and "timeout expired" at that point.
>
> CC'ing John Stultz, who touched that code last.

Yea, sadly my attempts to try to stretch the default timeouts so this
wouldn't happen ended up causing problems for the "optional links"
case, where folks want the driver core to stop deferring and return an
error for the bits that aren't present. So we had to back out most of
those changes (so yes, I touched it last, but unfortunately had to to
put things mostly back the way it was).

Personally, I think the implicit optional link concept in dts was a
mistake, as I think having some explicit notation would have made
things work a lot better since the timeout solution does not feel
ideal for anyone, but I also am (happily) not the expert there, so I
probably shouldn't judge. :)

In the end, it seems the fw_devlink logic Saravana is working on is
really the better solution. I know he's getting closer to being able
to set it as the default, so you might check that out?

thanks
-john
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
