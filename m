Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23506364AD5
	for <lists+etnaviv@lfdr.de>; Mon, 19 Apr 2021 21:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18AD6E42F;
	Mon, 19 Apr 2021 19:55:54 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB476E432
 for <etnaviv@lists.freedesktop.org>; Mon, 19 Apr 2021 18:37:26 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id k73so33655505ybf.3
 for <etnaviv@lists.freedesktop.org>; Mon, 19 Apr 2021 11:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bQeTylFnOjW+b6gdIGFwcrZmV9ywZQcosWNUEO6U/oA=;
 b=kMY29ZO6eKzNAbnynrTj6of8GkDgkRJJ1T7jQRF641sTEde+PQEz8uqjOMM8oIFc81
 MDhJiY13+opHnE0+Y1Nt0bC4AVPHza+a7cA08zcUvRtkec6ZLTVCRZ+thuLi/NigRNmQ
 jansRS1kQGaLQWwaBKNsw2eJpy2vU+bBPRM8M0piPbJY/VrYThF9hXMPj/i3vuNiTcV2
 ReDrnI+ko4h9E9alftnkriPzuMDXoxfyyxXd1j/AH9BdZwT9Y7OZJ1SM0qcbmc3M0M0c
 7mE6yJkcy19j3gcrT/s6psNF0SMryQNNWcoJil+BiF53Ad0hsE5zRiiF1fuZx6CLT/yU
 crHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQeTylFnOjW+b6gdIGFwcrZmV9ywZQcosWNUEO6U/oA=;
 b=QnI4GemoOIUOttWwhzz6Oci6aJ7zr6Qp72YMF8ADJhuA1VykkTn2c2l5cZc1Oevwxe
 g+4859YFNkT1GUROZGnyYj39MBhQYHsa0keSphrsm0n4gGpR1f8DFfLz4flkK8QtxlzG
 vs+3CtAk+hqmwWfqXWkDvN7Smi2n81e3UsSi+2D5ls8ghHuVNKcXNay74kmihynLu/mm
 rP65mB+/9qHT8OqYkw9U3S7ieEg8V26bbghiBz4QW+ucJ4BOn45wYx8wDOphg1kZo9zs
 dyXNU8CDh8PIQSio8M8mrjMor+NYX3fs2SDKhttmJ/hFn6eJaXYeOqKP1Eg5sZ/ol6do
 DACw==
X-Gm-Message-State: AOAM532lQ9B8t4xEl8KE/x7ZO5T5C8fA/falx8cnqOAxs8x2nwDlpiUu
 fTRukQy4LpXUYdoqZMgGyV4xCry+7TU9Nh0FKnDHew==
X-Google-Smtp-Source: ABdhPJyUhquz5fYjXe30VfA0CrIANs4qqp7geohRpceesJSYiQUYh3+A1s/YEbPOmkOCxZ7vcYJvXatG/ddRwxQs4TI=
X-Received: by 2002:a5b:ed2:: with SMTP id a18mr20092399ybs.466.1618857445737; 
 Mon, 19 Apr 2021 11:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <d83adc7a-d9db-af35-83c9-6d3dab60ab82@jm0.eu>
 <9880212dc158bbadbccb6313d9fa59a27698ef3e.camel@pengutronix.de>
 <a7002193-343d-9144-38ab-63542c09a4de@jm0.eu>
 <11943ea5d883bd2632c71f4a9e1a42c5f88c5e14.camel@pengutronix.de>
 <CALAqxLWsOLvrSxWzhGDzvUDyDfcKXJ7wK4oSaQ9Wqo4_iKLjkg@mail.gmail.com>
 <8d570278-aa6a-acbf-77af-e62641c25bf5@jm0.eu>
 <CALAqxLUBpvJ8WWgyO5nSdzm0MoADqUfGOEpggBiEz-XTHc9tgA@mail.gmail.com>
In-Reply-To: <CALAqxLUBpvJ8WWgyO5nSdzm0MoADqUfGOEpggBiEz-XTHc9tgA@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 19 Apr 2021 11:36:49 -0700
Message-ID: <CAGETcx88Je7G93NeaYKZ9MpCh6927yHbe4-jN4=TOEX+kbp=Dg@mail.gmail.com>
Subject: Re: etnaviv fails probe early, but succeeds after rmmod && modprobe
To: John Stultz <john.stultz@linaro.org>
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
 etnaviv@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Apr 19, 2021 at 11:19 AM John Stultz <john.stultz@linaro.org> wrote:
>
> On Sat, Apr 17, 2021 at 3:52 AM Ing. Josua Mayer <josua.mayer@jm0.eu> wrote:
> > Am 17.04.21 um 05:46 schrieb John Stultz:
> > > On Fri, Apr 16, 2021 at 4:13 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > >> Am Freitag, dem 16.04.2021 um 12:57 +0200 schrieb Ing. Josua Mayer:
> > >>> Hi Lucas,
> > >>>
> > >>> anatop_regulator is indeed a module currently,
> > >>> this is one of the changes introduced in their jump from kernel 5.9 to
> > >>> 5.10 - and has even landed in buster through backports ...
> > >>>
> > >>> I wonder how / where those timeouts are specified.
> > >>> Regarding the order of module loading there is not much I can do, it is
> > >>> already the second module inserted by the initramfs.
> > >>
> > >> This looks like a kernel bug to me. If no timeout is given on the
> > >> command line, the status is immediately considered as timed-out after
> > >> the initcalls are done, as the code doesn't differentiate between "no
> > >> timeout given" and "timeout expired" at that point.
> > >>
> > >> CC'ing John Stultz, who touched that code last.
> > >
> > > Yea, sadly my attempts to try to stretch the default timeouts so this
> > > wouldn't happen ended up causing problems for the "optional links"
> > > case, where folks want the driver core to stop deferring and return an
> > > error for the bits that aren't present. So we had to back out most of
> > > those changes (so yes, I touched it last, but unfortunately had to to
> > > put things mostly back the way it was).
> >  >
> > Thank you for your comments!
> > I am sad to hear that adjusting timeouts was not a path of success ...
> >
> > > Personally, I think the implicit optional link concept in dts was a
> > > mistake, as I think having some explicit notation would have made
> > > things work a lot better since the timeout solution does not feel
> > > ideal for anyone, but I also am (happily) not the expert there, so I
> > > probably shouldn't judge. :)
> > >
> > > In the end, it seems the fw_devlink logic Saravana is working on is
> > > really the better solution. I know he's getting closer to being able
> > > to set it as the default, so you might check that out?
> > >
> > > thanks
> > > -john
> > >
> >
> > So from all these pointers I finally played with the
> > deferred_probe_timeout kernel parameter. Maybe something just needed
> > more time? Well ... for some reason passing 20 made it so that etnaviv
> > eventually probes successfully!
> >
> > I am attaching the full dmesg for reference - note that all modules are
> > in initramfs only for debugging purposes, this is not the default debian
> > split.
> >
> > Is there really a difference between specifying and not specifying
> > deferred_probe_timeout which is described as a debugging feature?
>
> The timeout value just specifies how long after init starts that
> modules with missing dependency links will return EPROBE_DEFER. After
> which, the missing links will return EPROBE_TIMEOUT and if the link is
> optional the driver will be able to load ok, but if the link is not
> optional, the module load will fail.
>
> Unfortunately with modules, it's easy for a dependency to be loaded
> late or from storage mounted after init, so the timeout just allows
> more time for the dependencies to be loaded. However, it also means
> modules with optional links have to wait around a bit longer before
> they give up on optional dependencies that will never show up (and in
> some cases, that delay can cause other problems - which is why the
> default timeout couldn't be extended to something more reasonable).
>
> So again, the better solution is Saravana's fw_devlink which uses the
> DTS graph to help load modules in the proper order to avoid missing
> dependencies.

John,

Thanks for adding me. Yeah, fw_devlink=on is the default in
driver-core-next. I've fixed some minor issues that came up and also
improved deferred_probe_timeout to be smarter (without touching that
code much). No new issues have come up so far. So, hopefully, it'll
land this time.

Josua,

If you are using 5.12, you should be able to pass fw_devlink=on for it
to kick in and do its thing in terms of ordering probes correctly. You
might also want to set fw_devlink.strict=1 if all your iommu and dma
dependencies mentioned in your DT should be treated as mandatory.

Other than that, it should just work if your device is the average
case. You should not need to set any timeouts. I've also handled some
additional corner cases and improved the deferred_probe_timeout to be
smarter in driver-core-next. So if you still have issues on 5.12, try
testing linux-next and as an absolute last resort, try timeout. The
timeout is only needed if you'll have suppliers that'll never have any
modules loaded for them but you still want some of their consumers to
load and work.

Hope that helps.

-Saravana
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
