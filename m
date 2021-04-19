Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36954364AD7
	for <lists+etnaviv@lfdr.de>; Mon, 19 Apr 2021 21:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C60A6E432;
	Mon, 19 Apr 2021 19:55:55 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D2E6E42A
 for <etnaviv@lists.freedesktop.org>; Mon, 19 Apr 2021 18:19:20 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id z8so40464741ljm.12
 for <etnaviv@lists.freedesktop.org>; Mon, 19 Apr 2021 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hhaU0CHyV0yfPfNXiZ32J8pCcsjENu5ACnuvr8CACNM=;
 b=FcptqchHDckc55Hh+98ztIL4V76IklQTi+OPHat/g/g4btj4Q+5WKLOisvn9kj3kXr
 nD2trRH/Fn3IDwrBPdx1Uow6/tp6x78pLIATL2SeI2KPsdFYGQdHjihM2pSPlhctbCBy
 wBSYwJY/XfEtzrZ8HqX/q3lF1RDPGmFl0JY+D9uvzzseP016FgSEFseAmk9pRM0GaZYC
 UGkgcYaZE/MDIjgpHKIgMdtnPkaqApsPmpWdqw0EZVXOmAyHVnUBidBAlJ0KwEx5B2RD
 XdkmN7jQhTfmFLeRgHh/Si7ZyBwLwBO5HOYEOrfQYG3mNPscGNOiD5nuENrFmNJrulb2
 Kg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hhaU0CHyV0yfPfNXiZ32J8pCcsjENu5ACnuvr8CACNM=;
 b=DvMoopL0u4nAbS1nxyIvOq3Osb53jwaNyPAio2KDB4cCBIgTN63413qZ8Bk0xb/Uje
 g4YBzEaphM87IybFNZjYVroMWf/GyCzYY0hn0TT74afY2FPzMWgg8Sj72yjk3QfiPCaD
 5Hm2x+VqNc2943TcgVmZNfBresDPgAUgTbhKH5PmXtiT5dtjUFhm3r3kQVyWQGyaU1hP
 5aM7TH2yPkWyOui8aQFPAqBMtGnflLEznla+GJEI2obSurNhQ6pdg5CWC70LLLcVHSrW
 HmTnhlXcACwlJVf01AU3RJIt885GSV8zzx8alImbahz0Q11IYTUfF6VgIgFW8ymVfUff
 Yl2Q==
X-Gm-Message-State: AOAM533pAN5k1+syweMUMx/wO47JY6LF2EGhGaSdHpJsKILVr5EPY/zs
 GI5SoQqCBzHg/WbVPbydWqnZQoDQ0s4kayu8151X7A==
X-Google-Smtp-Source: ABdhPJx5AQ6vYPzY62b6k0GHbv4uXbYGuFDd1u+TrUCcWCevZhe7LsBSiZqPlG9sq+CSzD+WbLkeky/0LsWurSQGDbM=
X-Received: by 2002:a2e:b165:: with SMTP id a5mr7903473ljm.172.1618856359281; 
 Mon, 19 Apr 2021 11:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <d83adc7a-d9db-af35-83c9-6d3dab60ab82@jm0.eu>
 <9880212dc158bbadbccb6313d9fa59a27698ef3e.camel@pengutronix.de>
 <a7002193-343d-9144-38ab-63542c09a4de@jm0.eu>
 <11943ea5d883bd2632c71f4a9e1a42c5f88c5e14.camel@pengutronix.de>
 <CALAqxLWsOLvrSxWzhGDzvUDyDfcKXJ7wK4oSaQ9Wqo4_iKLjkg@mail.gmail.com>
 <8d570278-aa6a-acbf-77af-e62641c25bf5@jm0.eu>
In-Reply-To: <8d570278-aa6a-acbf-77af-e62641c25bf5@jm0.eu>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 19 Apr 2021 11:19:09 -0700
Message-ID: <CALAqxLUBpvJ8WWgyO5nSdzm0MoADqUfGOEpggBiEz-XTHc9tgA@mail.gmail.com>
Subject: Re: etnaviv fails probe early, but succeeds after rmmod && modprobe
To: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
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
Cc: Rob Herring <robh@kernel.org>, etnaviv@lists.freedesktop.org,
 Saravana Kannan <saravanak@google.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Sat, Apr 17, 2021 at 3:52 AM Ing. Josua Mayer <josua.mayer@jm0.eu> wrote:
> Am 17.04.21 um 05:46 schrieb John Stultz:
> > On Fri, Apr 16, 2021 at 4:13 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> >> Am Freitag, dem 16.04.2021 um 12:57 +0200 schrieb Ing. Josua Mayer:
> >>> Hi Lucas,
> >>>
> >>> anatop_regulator is indeed a module currently,
> >>> this is one of the changes introduced in their jump from kernel 5.9 to
> >>> 5.10 - and has even landed in buster through backports ...
> >>>
> >>> I wonder how / where those timeouts are specified.
> >>> Regarding the order of module loading there is not much I can do, it is
> >>> already the second module inserted by the initramfs.
> >>
> >> This looks like a kernel bug to me. If no timeout is given on the
> >> command line, the status is immediately considered as timed-out after
> >> the initcalls are done, as the code doesn't differentiate between "no
> >> timeout given" and "timeout expired" at that point.
> >>
> >> CC'ing John Stultz, who touched that code last.
> >
> > Yea, sadly my attempts to try to stretch the default timeouts so this
> > wouldn't happen ended up causing problems for the "optional links"
> > case, where folks want the driver core to stop deferring and return an
> > error for the bits that aren't present. So we had to back out most of
> > those changes (so yes, I touched it last, but unfortunately had to to
> > put things mostly back the way it was).
>  >
> Thank you for your comments!
> I am sad to hear that adjusting timeouts was not a path of success ...
>
> > Personally, I think the implicit optional link concept in dts was a
> > mistake, as I think having some explicit notation would have made
> > things work a lot better since the timeout solution does not feel
> > ideal for anyone, but I also am (happily) not the expert there, so I
> > probably shouldn't judge. :)
> >
> > In the end, it seems the fw_devlink logic Saravana is working on is
> > really the better solution. I know he's getting closer to being able
> > to set it as the default, so you might check that out?
> >
> > thanks
> > -john
> >
>
> So from all these pointers I finally played with the
> deferred_probe_timeout kernel parameter. Maybe something just needed
> more time? Well ... for some reason passing 20 made it so that etnaviv
> eventually probes successfully!
>
> I am attaching the full dmesg for reference - note that all modules are
> in initramfs only for debugging purposes, this is not the default debian
> split.
>
> Is there really a difference between specifying and not specifying
> deferred_probe_timeout which is described as a debugging feature?

The timeout value just specifies how long after init starts that
modules with missing dependency links will return EPROBE_DEFER. After
which, the missing links will return EPROBE_TIMEOUT and if the link is
optional the driver will be able to load ok, but if the link is not
optional, the module load will fail.

Unfortunately with modules, it's easy for a dependency to be loaded
late or from storage mounted after init, so the timeout just allows
more time for the dependencies to be loaded. However, it also means
modules with optional links have to wait around a bit longer before
they give up on optional dependencies that will never show up (and in
some cases, that delay can cause other problems - which is why the
default timeout couldn't be extended to something more reasonable).

So again, the better solution is Saravana's fw_devlink which uses the
DTS graph to help load modules in the proper order to avoid missing
dependencies.

thanks
-john
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
