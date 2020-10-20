Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C247329442F
	for <lists+etnaviv@lfdr.de>; Tue, 20 Oct 2020 23:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD686E064;
	Tue, 20 Oct 2020 21:03:16 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B24C6E064
 for <etnaviv@lists.freedesktop.org>; Tue, 20 Oct 2020 21:03:15 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id e22so4844654ejr.4
 for <etnaviv@lists.freedesktop.org>; Tue, 20 Oct 2020 14:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BHcvJFmhgrlfmxloHGaWcNgi4Hc+LNIZ/dV5nf9Q704=;
 b=H7+kL+n4EbLdBlu8gyUSQcBEz6T00giZu8DLr57XjMI23w+8a3gKKE18UYL+SbGPhG
 CzPGafnY5yHR69XXuyNiYcuS5KCPf6wZQ9pHlGUVl70a94pkfOyq6DNapKxJKmbLNPqg
 CgK1ddwN/BDsq5ZpowNplcs1j604u1836VprqXQ3GOpLoJXmBI/uqtJULsH6cpkpjQUU
 m9XOIB9+1N7D2s8Fm+G/MEH9WpYaoczuJx6MU0bIxLtwoVnbmC4i+QIMOcRRwI/S/ceN
 WvLR8H3mttsGghC0EjfUWySHDpmlqzzWTV1+apmiMPWaB23NYxmL7TlmyIFjQrJT6fOC
 ThyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BHcvJFmhgrlfmxloHGaWcNgi4Hc+LNIZ/dV5nf9Q704=;
 b=dUWE4hmb28qtabxMsm1QIZoGRZxjSn+OFlad4F+IwV7JAU5buW8oXrPwm9HuhW+yiE
 a91vLRv2P0rKoXhmJBDBeKxFXlKt/1DOnYh4k8jmTqoKFP89DOU7E+uzw5QDU1hOrQr0
 TASZtTeEDbcLTgNoETi0jJa8RoOUo4UOdaetA4gZUOZlLZRydtXTctYkBcrYeca92RbT
 74OPx1uJQIzgqDtHBHIV4YO+fD8sFfuFMP8bftnrZO0I3Q6zuIMrX8QwXjEs0Ss50ewE
 Ch/p8MJVnriVIjUN/CGBLoKHlrqP7NLHuEQpJNuNHoUWc+dU6cldC0LCsjZ9QSx9s7zo
 aXMw==
X-Gm-Message-State: AOAM531/QqsFFRkaPhjY0C7HVuI/D8PibywOUhOZfM4pfvnRuHUxdq8H
 pNJ/ch6ASRf+p3bitYHge/V61PDqsTfMxmk61yFekw==
X-Google-Smtp-Source: ABdhPJxMskM70XPOgysGJgY5Fte5YRdk6IcHRMrOHVCHEsRs/0D04hunmt/omb4ehCCPZL7JBGc0MGBUInwxjdCcPKE=
X-Received: by 2002:a17:906:940c:: with SMTP id
 q12mr55562ejx.195.1603227794013; 
 Tue, 20 Oct 2020 14:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1M=GxceoURX+SffkQHSxVr3fKUxwysbZmU1-jAu0YY_A@mail.gmail.com>
 <CAH9NwWc-qCopDNYe64788Ei_JCQvZAV6BrXguYcvFBOBp-YgvQ@mail.gmail.com>
 <CAJ+vNU20sriZK8DjtqDCCwoAzUhQKf3b4VuYaDDr0=FwC3H74A@mail.gmail.com>
 <CAH9NwWcvYWtH193fsCxRUiaSOsAoNZi144KuCqTN6-pL2L4fRw@mail.gmail.com>
In-Reply-To: <CAH9NwWcvYWtH193fsCxRUiaSOsAoNZi144KuCqTN6-pL2L4fRw@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 20 Oct 2020 14:03:02 -0700
Message-ID: <CAJ+vNU36Mii85=akC+mg0AOwgrh1MAWzL-cy1pqMC3WtnXvNRQ@mail.gmail.com>
Subject: Re: OpenCL on etnaviv?
To: Christian Gmeiner <christian.gmeiner@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Tue, Oct 20, 2020 at 1:26 PM Christian Gmeiner
<christian.gmeiner@gmail.com> wrote:
>
> Hi Tim,
>
> Am Mo., 19. Okt. 2020 um 17:48 Uhr schrieb Tim Harvey <tharvey@gateworks.com>:
> >
> > On Mon, Oct 19, 2020 at 6:12 AM Christian Gmeiner
> > <christian.gmeiner@gmail.com> wrote:
> > >
> > > Hi Tim
> > >
> > > >
> > > > Could anyone explain if OpenCL can run with etnaviv? I'm also not
> > > > quite understanding if OpenCL has specific hardware requirements. I
> > > > have users that I support wanting to run OpenCL on an IMX8M and am
> > > > finding that NXP states the IMX8MM doesn't support OpenCL (yet the
> > > > IMX8MN does)  and I'm trying to understand if that is a technical
> > > > issue or just simply that they won't support it through their closed
> > > > Vivante driver.
> > > >
> > >
> > > On the etnaviv side OpenCL is possible but nothing has done in that
> > > direction and
> > > needs work to get it up and running. Hardware wise it should work on GPUs with
> > > SSBOs and Images support. Intuitively it should work on most Vivante GPUs. Also
> > > you might have a look https://en.wikipedia.org/wiki/Vivante_Corporation
> > >
> >
> > Christian,
> >
> > Thanks - this is very helpful. I found some info about what a Shader
> > Storage Buffer Object (SSBO) is but I haven't managed to find what you
> > mean by Images support. I'm also not clear how to tell what Vivante
> > GPU's have this support. The wikipedia page doesn't go into detail on
> > SSBO's and Images support. Where do you typically find this info?
> >
>
> Regarding images: https://livebook.manning.com/book/opencl-in-action/chapter-6/
>
> > What led me to post this question was NXP stating that the IMX8MM does
> > not support OpenCL or Vulkan whereas the other IMX8M's (IMX8MN,
> > IMX8MP, and IMX8MQ) do. I wasn't clear if it was a limitation in what
> > NXP offers through the Vivante driver or if this was a technical
> > limit. It would appear that it is likely both but more so a technical
> > limit.
> >
>
> This is a hard question to answer as there is no feature flag regarding compute.
> Also NXP might have not packed opencl support into their release even though the
> gpu supports it. Maybe just ask NXP? Btw. how is the upstream support for the
> imx8mm? I do not own such hardware.

from what I can tell imx8mm upstream support is deadlocked waiting for
the linux devs and NXP to agree on power domain management (NXP is
being stubborn and keeps insisting power domain should be handled in
ARM Trusted Firmware even though patches have been submitted that add
it to existing Linux drivers). This power domain issue is keeping USB
from working (drivers are fine, you just have to enable the power
domain manually, like in boot firmware). It's also from what I can
tell keeping PCIe from getting the minor attention it needs to add
support to existing drivers. And as far as I can tell almost nothing
in the way of MIPI DSI or CSI bridge drivers have been done upstream
yet and I doubt NXP will be helping there if from past experiences. I
believe I read that etnaviv works on IMX8M but not clear where I saw
that and because DSI bridge support isn't there it would be difficult
to verify. I'm also not clear which IMX8M that would be for as there
are four variants with different GPUs in use.

Philipp, Marek or Fabio likely know much more.

>
> > > > I suppose for my own education I also have the same question about
> > > > Vulkan. Is there specific GPU hardware requirements for that? My
> > > > understanding is that things like OpenCL and Vulkan are just software
> > > > API's to tap into the hardware units.
> > > >
> > >
> > > I am a big vulkan newbie but I think the baseline for vulkan is ES 3.1. So any
> > > GPU where we can support ES 3.1 could also be driven by the Vulkan API.
> > >
> >
> > The IMX8MM has a GC NanoUltra (1 shader) supporting OpenGL ES 2.0 and
> > a GC502L for 2D from what I can find. So if the baseline is ES 3.1
> > there would never be any hope for Vulkan on that. I'm assuming the
> > GLES API's are implemented in hardware and not some sort of
> > abstraction layer.
> >
>
> Yeah.. no Vulkan.
>
> > > But the Vulkan road for etnaviv is even longer one. I think gles 3.0 is more
> > > important at the moment. So do not expect anything in that area in the near and
> > > far future.
> >
> > Meaning that entaviv currently supports GLES 2.0 and work is being
> > done to improve that support to GLES 3.0?
> >
>
> Correct... next stop is es 3.0.
>

Thanks for the info!

Tim
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
