Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907F960D105
	for <lists+etnaviv@lfdr.de>; Tue, 25 Oct 2022 17:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3933210E3E4;
	Tue, 25 Oct 2022 15:52:44 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180AA10E3F7
 for <etnaviv@lists.freedesktop.org>; Tue, 25 Oct 2022 15:52:40 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id p3so10368481pld.10
 for <etnaviv@lists.freedesktop.org>; Tue, 25 Oct 2022 08:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/LqY229OwUGbavnZwfPWtNu74wUnFi5nTHZwbb5Bj7M=;
 b=bjisVyv68dpp68CU9aOC67ftHhdZx6Sc9CB8VVKrWaqgRADpJBtNRUqRIGhAQWIu5m
 oUFvfhQfTgzAm+p/miXS9IrPb9Nj8NvLGTti+6ISIuIh9Lbj9hVLpOcrg9C9RfYIteJj
 taNe10nF7PkYksP2R+mr8Av2kVAMfbFep+BL8EFpKxhQOx4VG1gRaLLo1k5WC6/AbW2Y
 8oFk924OX1sGkhoYLBlQLtIJ0+bAqFZ/iMk66f5FnTwFilr3F+fOwyWKxye7njUrFQVP
 /RE8Qu4Kt1TmZQ7uCIrjL8dAy3XaDlwyo+QpFJ62Q3u88yvq3VzMA/20NoU5giBru+ej
 ppeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/LqY229OwUGbavnZwfPWtNu74wUnFi5nTHZwbb5Bj7M=;
 b=WLt/nkSpHC02R02BkuZLSCpZdGCNQXbWAYF4vlrW6zV0a/OEs9v1hX2yWz/KWcYdKK
 Y8f6xnGnjlJQ6u0RudRDHICprnjw3AiTeCrfKfAZqqLe2HiS1yfcYGJxisqgbIW5rqK7
 eMIDLrM5q3NtEbhmJD+VyQjThDzJpTSbJ1xnp1blsKrve+LhEL9UczFAMfFloe2b+G/2
 fM6O0dPzUASRkf8Qka8UzGw11a2gMtFBSYtRKy3zz3fnhPSVYzBIbnMprPIzw9fHrS9A
 KGkBcxabnQfyWyW4dpGf6sC9vXZck3EuuRgndD5UdsRa7JP191XeBswvPMLeYvvmwQn1
 LtDw==
X-Gm-Message-State: ACrzQf2UasUQoNJMEGj/+4mdF9nRskgwVI9y4YDIjrTeZkwnhcUstzon
 WtW/lSlWRU7pbFUTEAHgebrB4SZEo9iqgkNzTBrJ8A==
X-Google-Smtp-Source: AMsMyM6doWBHoo/KIRA6wuPdvpKuT5V3IgpWtt1wOvBWBpeXIemUI0JfQ9aavKYLDJBKApPndVku+TQo6ZZFHclG0b0=
X-Received: by 2002:a17:90b:1d8a:b0:20c:a6db:5713 with SMTP id
 pf10-20020a17090b1d8a00b0020ca6db5713mr82025425pjb.135.1666713159542; Tue, 25
 Oct 2022 08:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU3zyrAOVWmgPJpRLzMm1V05b9rEMeb6=4AutmZC_rJN8A@mail.gmail.com>
 <CAFXsbZoizMA8CK=_2uYrwKcZ8Uhwoze6Nod8FD2MPhxs9cOi=A@mail.gmail.com>
In-Reply-To: <CAFXsbZoizMA8CK=_2uYrwKcZ8Uhwoze6Nod8FD2MPhxs9cOi=A@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 25 Oct 2022 08:52:27 -0700
Message-ID: <CAJ+vNU3k3eVWHABSALUbkbNy3Dpyz0Wm6UOnU6vtCGF3=sOJPA@mail.gmail.com>
Subject: Re: IMX6 etnaviv issue
To: Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Fabio Estevam <festevam@gmail.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Sat, Oct 22, 2022 at 7:06 PM Chris Healy <cphealy@gmail.com> wrote:
>
> I can't speak to why you are experiencing issues when using the GPU,
> but in the examples you gave, the example that is working is using a
> SW based GL implementation instead of the real GPU.  This can be
> determined by looking at the GL_RENDERER string to see if it mentions
> a Vivante GPU or something else (like LLVMPIPE).  It's quite likely
> that if you were using the real GPU with etnaviv in Mesa with the
> older config you would also experience similar issues.  As such, we
> shouldn't consider this a regression between the two Ubuntu versions.

Chris,

Thanks for this insight. I was curious about the meaning of the
GL_RENDERER string which is why I included that.

I'm not clear how to configure what renderer is used?

Best Regards,

Tim



>
> One thing you may want to try doing is run with Mesa 22.2.1 and TOT to
> see if either of these address any of the issues you are experiencing.
>
> On Thu, Oct 20, 2022 at 1:44 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > Greetings,
> >
> > I use a standard Ubuntu 20.04 focal rootfs with a mainline kernel on
> > an IMX6Q based board and have had no issues using things like gnome
> > desktop, glxgears, glmark2 however recently I updated the rootfs to
> > Ubuntu 22.04 jammy using the same mainline kernel and now I see some
> > issues. I've replicated the issue with several kernel versions
> > including 5.4, 5.10, 5.15 and 6.0 so I would say this is not a kernel
> > regression but something related to the graphics stack being used
> > which I'm not very familiar with.
> >
> > The issues I see can be described as:
> > - mouse cursor is incorrect (looks like a hatched square)
> > - glxgears shows some sort of sync/jitter issue and has a fairly low framerate
> > - glmark2 shows a some sync issues then after a few seconds results in
> > a GPU hang
> >
> > My ubuntu focal image that appears to work fine has the following:
> > gnome 3.36.5-0
> > xserver-xorg 1:7.7+19
> > xserver-xorg-core 2:1.20.13-1
> > xwayland 2:1.20.13-1
> > glmark2 2021.02
> > mesa-utils 8.4.0-1
> > GL_VENDOR: Mesa/X.org
> > GL_RENDERER: llvmpipe (LLVM 12.0.0, 128 bits)
> > GL_VERSION: 3.1 Mesa 21.2.6
> >
> > My ubuntu jammy image that has the issues has the following:
> > gnome-41.7-0
> > xserver-xorg 1:7.7+23
> > xserver-xorg-core 2:21.1.3-2
> > xwayland 2:22.1.1-1
> > glmark2 2021.02-0
> > mesa-utils 8.4.0-1
> > GL_VENDOR: etnaviv
> > GL_RENDERER: Vivantte GC2000 rev 5108
> > GL_VERSION: 2.1 Mesa 22.0.5
> >
> > Does anyone have any ideas on what might be going on here? I apologize
> > for my lack of knowledge regarding the software layers on top of the
> > etnaviv kernel driver being used here.
> >
> > Best Regards,
> >
> > Tim
