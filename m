Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D26D358F68
	for <lists+etnaviv@lfdr.de>; Thu,  8 Apr 2021 23:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEC46E3F0;
	Thu,  8 Apr 2021 21:45:37 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAA26E3F0
 for <etnaviv@lists.freedesktop.org>; Thu,  8 Apr 2021 21:45:36 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d13so6420269lfg.7
 for <etnaviv@lists.freedesktop.org>; Thu, 08 Apr 2021 14:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8MVBTVTbGflc/UsLhIwl2nRzF2EsRH8eZ0QlPXqs5ps=;
 b=Zk2v3nSMdaCm5adH4aHswvLKgEBKklbkCPH2zPgIVKp64w70n2axR/qGDplIQ0OZ0n
 HLegwMCSSCAxIt8LPsDPeA7J+lV2LnPtLiSNhLWjp/m3yDKXUPRvs0hxnHugTRrpsB6U
 uiiThswQsEAPRovlktmLYn49OPrRupsH66VDSzbKlxFr/Wn44w766AsgYLN7vrCHZLyR
 Uur3yAtqGAhF8O/MxSPYa1P5Yxp+6YntEF7We62ytpY0VEX1MNQUtmH/O+iMLbWa2H+y
 yeUIQCjgCMD2v6FVfHm061JaiZ7pmmjnI2REqJ3G0vMQF8z8vVWj0AbKZlNKPI0hg/VG
 eF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8MVBTVTbGflc/UsLhIwl2nRzF2EsRH8eZ0QlPXqs5ps=;
 b=NwSBHRTGCyj3prgr4lFDlfE0BS5G4GU6OdjNR9cDreN03/fgpg8qMdD2oEkiQlMr1V
 W0ARQu52/25C4wJoWIBCOVwN7/yx88mxt6yNZ9HwoGYcr/TGPahcplgkKEWpoYwapXGT
 8EPRgceF118GtqmdJPvnLm1xaSghxKnu2avjKlSATJTyjgNcyxwSFS6HzFeOuUjYx3rp
 YHNwor/wPjqwKwDn8tyN+pimdMrgRpe7kIo3+b2ii61/WaLhBCz7i7QbVE6aIcFHJwet
 xT4Luf49FycQKz4xGVqRbX7sqPZi3C2E9FSD00PaoWi9r7+0gkuMCk+WWpX7AOF2GTnz
 DP6g==
X-Gm-Message-State: AOAM530N1yOz0D4Y50kwa+cLFe4wLAKIFSJpYHSQef9TLsDsRJXmRMr4
 /5jt3vzL2S6LoHFyjhyNbKZlzGrZTHwPjH+U8+6EhA==
X-Google-Smtp-Source: ABdhPJwOR1qaBP0hkaYoeDA9UZM861Q2LgMU2bP4wenXDG9wfbiuruw1rThn3wnUQVO3cDtDB82sQHZzPUH6KOtdfMo=
X-Received: by 2002:a19:ef18:: with SMTP id n24mr8062945lfh.291.1617918334556; 
 Thu, 08 Apr 2021 14:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <cd14d4b4-da82-b21c-2cd6-8e474d97b955@redhat.com>
 <CAK8P3a0Wg1mGZoBkD_RwMx-jzQNK2krrDxDQV5uhCHoyz-e=dw@mail.gmail.com>
 <7496ac87-9676-1b4e-3444-c2a662ec376b@redhat.com>
 <CAK8P3a1tVwkDbtvKi8atkrg1-CfoQHGrXLCzn_uo+=dfZJfdQA@mail.gmail.com>
 <3a2d64a7-8425-8daf-17ee-95b9f0c635f9@redhat.com>
 <CACRpkdYizKGhtYzE+22oZAduLNCOGP9Vbp=LQbXG1C-a+MyMcg@mail.gmail.com>
 <2ef3b65c-c0ef-7bbe-0e05-39ee8f2bae48@redhat.com>
In-Reply-To: <2ef3b65c-c0ef-7bbe-0e05-39ee8f2bae48@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Apr 2021 23:45:23 +0200
Message-ID: <CACRpkdbMLBzG_Q=-XzjsWvpofHyRv7sdB697mHLaRu4F=+GC-g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
To: David Hildenbrand <david@redhat.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>, Linux-MM <linux-mm@kvack.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Peter Collingbourne <pcc@google.com>, Mike Rapoport <rppt@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Thu, Apr 8, 2021 at 6:44 PM David Hildenbrand <david@redhat.com> wrote:

> > drivers/gpu/drm/mcde/Kconfig
> > drivers/gpu/drm/pl111/Kconfig
> > drivers/gpu/drm/tve200/Kconfig
>
> I was assuming these are "real" dependencies. Will it also work without
> DMA_CMA?

It will mostly work but that is only because the reservations are
mostly contiguous anyway because they are done early and
are small. The hardware requires contiguous buffers in all
three cases. I'm not sure I always got it right.

> > certainly needs this as well, and pretty much anything that is
> > selecting DRM_KMS_CMA_HELPER or
> > DRM_GEM_CMA_HELPER "wants" DMA_CMA.
>
> "wants" as in "desires to use but can life without" or "wants" as in
> "really needs it". ?

I don't know the exact semantics of using DRM_KMS_CMA*
without actually using DMA_CMA. I suspect small allocations
will be contiguous and big allocations will start to fragment?
but it's just my guess. I guess "really need it"?

Yours,
Linus Walleij
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
