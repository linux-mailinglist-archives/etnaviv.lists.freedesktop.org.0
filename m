Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C1535820F
	for <lists+etnaviv@lfdr.de>; Thu,  8 Apr 2021 13:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53B06EAAA;
	Thu,  8 Apr 2021 11:38:22 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7768D6EAAA
 for <etnaviv@lists.freedesktop.org>; Thu,  8 Apr 2021 11:38:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a4so1784161wrr.2
 for <etnaviv@lists.freedesktop.org>; Thu, 08 Apr 2021 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=HNjO0LstTaF0YJ+tzxAFP4Syvm5fGCE8nxebVcvJLjU=;
 b=eS60djC9Lqi8q7fWOXC+yuTwdoDdp/fK2d8XmHmBdVmsTRb7l+NFwK+960b7+jwa0f
 FmsY22x6AYJ4yv6tWLC7INl0trTXzlztAcd+b0jK6akV35kkzli/s4AEGxnp0E9T3Hzm
 WeCrdaOppkgKGi6FkMG4W1g5pPS3g8Esg94hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=HNjO0LstTaF0YJ+tzxAFP4Syvm5fGCE8nxebVcvJLjU=;
 b=uc8BAeJjNwNYujXLHU3eUBr/YNlVzrNCoT43Dt5yTIs2IS92aVV+QMbuiPf0a9CGKl
 aStPPyMu6iaMiJVZRyudLFwcJUVNK7Bb1P4hFGxCdf3qaaF2aQLXBLffQ6beHlzRQuit
 jWf692Nz/08LawfuHgv66UwlifQKssUKu+f3DhnTr4Jl6MRDScWsw/tHvoThbl3jtwur
 HQoAG+kFb2OBhyXHnDsmrDbWUT5Ag31cEPKb4IzaIHKxkHH2yMofbPUh/iRqFgsaDe/E
 9Mc4bOPaLzQEArnkqP9mJEznII30at90sWU/uDILodeGM5RSS9Gg1J1FKWiX+GSrqUNu
 pneA==
X-Gm-Message-State: AOAM530YWQRI6Mqt9tBuuGbj4Ldz+eMlx5qjK8kfTRo767wJjiIOOuhZ
 RTw/+jyC+fuE3/AnYfurgf8+Hw==
X-Google-Smtp-Source: ABdhPJySG7qOaE9NShNXxHx9QrPK+umWifIaVL7kyUfSfMRMt7h7zvfu4kAyJkMeLpb8wsS1VXGRaA==
X-Received: by 2002:a5d:6d0f:: with SMTP id e15mr9348009wrq.218.1617881900156; 
 Thu, 08 Apr 2021 04:38:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n5sm24657875wrp.50.2021.04.08.04.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:38:19 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:38:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
Message-ID: <YG7rKfJkTDJorqvY@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Joel Stanley <joel@jms.id.au>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Mike Rapoport <rppt@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Peter Collingbourne <pcc@google.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Hildenbrand <david@redhat.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux-MM <linux-mm@kvack.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Joel Stanley <joel@jms.id.au>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Mike Rapoport <rppt@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 12:20:50PM +0200, Arnd Bergmann wrote:
> On Thu, Apr 8, 2021 at 11:22 AM David Hildenbrand <david@redhat.com> wrote:
> >
> > Random drivers should not override a user configuration of core knobs
> > (e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
> > dependencies and manual overrides.
> >
> > "This is similar to "select" as it enforces a lower limit on another
> >  symbol except that the "implied" symbol's value may still be set to n
> >  from a direct dependency or with a visible prompt."
> >
> > Implying DRM_CMA should be sufficient, as that depends on CMA.
> >
> > Note: If this is a real dependency, we should use "depends on DMA_CMA"
> > instead -  but I assume the driver can work without CMA just fine --
> > esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.
> 
> 'imply' is almost never the right solution, and it tends to cause more
> problems than it solves.
> 
> In particular, it does not prevent a configuration with 'DRM_CMA=m'
> and 'DRMA_ASPEED_GFX=y', or any build failures from such
> a configuration.
> 
> If you want this kind of soft dependency, you need
> 'depends on DRM_CMA || !DRM_CMA'.

The problem is that depends on is a real pain for users to find their
drivers. This is why we have a ton of select, because the kconfig ui tends
to suck.

If you want to change this, we need automatic conflict resolution like apt
and other package managers have, with suggestions how to fix the config if
you want to enable a driver, but some of its requirements are missing. The
current approach of hiding driver symbols complete if any of their
dependencies are off is really not great.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
