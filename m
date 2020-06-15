Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572F51F8D8E
	for <lists+etnaviv@lfdr.de>; Mon, 15 Jun 2020 08:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1069589B42;
	Mon, 15 Jun 2020 06:13:21 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7794589B42;
 Mon, 15 Jun 2020 06:13:20 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id m81so16572618ioa.1;
 Sun, 14 Jun 2020 23:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l6JLd6VBkcDkATEVOSxJhkAGOZIDXqhoY8AZkpcmZ1I=;
 b=P7R3C+Pv5AStNTdmtByWH8kFJIAdbrKj63kPRxtluqt+798Vb3IuRi3kpqZPiUP1q2
 OO+3rEvIlkJUteKFWcqNGD+jYemiXli3MSM+4vuAj5aY15kAT9AldFavTYhW9RXxbKpD
 AKCVbPTgC1KEMgA5CWro19tnhyF/rRH99ptqhqMgnPpjgP3cCAqRZX2NfV4xcVTLh5xW
 TzIt/P8c6t85pSeeMOXu30H9ferniSHjmQdrwEFhDVEDMQTB//lHgNSSvbuoj0i5qtAP
 AxGPl/3neip1F+ady4JB+Y53uLG4zp2Ni8/jqOsQXbFMqbegxmv2rC2llztVNX6NtTbH
 d0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l6JLd6VBkcDkATEVOSxJhkAGOZIDXqhoY8AZkpcmZ1I=;
 b=Gixc2J/0B1X4JD8ulXt9hk/gzsAQ/HWtQLUohvHIc+nZi5+cu+wOzIoRd/KsfXm7aZ
 2P8Gq3bpyrwCp+kiholzBgf/e6LIwtxYVEvR5OG5ZJiHjhK+ZztuzOUcxvAEujIfWDN0
 7SaZJu7HWOq2moeKmXN0CdthAF3jfWDsI5uFYeOPhna1rdP3V2I+AMKXlfFK8fVMQ9X+
 iqglytoLGCozxc6WSx3uc4KB/rLom3txUrp/fVjC3BA2Vdf93CHSwsR2r2kFjFeCvQw+
 pqEW1Rlg8+R5rjGBas07cDpNRLOLMQyrhMjb4vbiyrb3wEY4vqH3asrFg+zcpVW3nJk6
 LJ6g==
X-Gm-Message-State: AOAM533GuPA3H3u8Mtx9tugbIVnc6aT6ZXVbOiUyi4WLaOZgcSDebopO
 IU7/RDAimqVrSJ4OhPT1u8GB7bectk2W2j/RG/o=
X-Google-Smtp-Source: ABdhPJxFXpC6yxoyS/q+VFmv3UDEL3AF9AGZcAzbg95oAGdfyGUv7KDldyeXnqrxKmupmPQJdhjCt6Ym7GydEAwH5dc=
X-Received: by 2002:a6b:39d7:: with SMTP id g206mr26366722ioa.31.1592201599906; 
 Sun, 14 Jun 2020 23:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200614064601.7872-1-navid.emamdoost@gmail.com>
 <CAHp75VcLR2w9Ym0YOqUT9G8xT9qWrdD1-wP4UA-1wtuwCNxqSA@mail.gmail.com>
In-Reply-To: <CAHp75VcLR2w9Ym0YOqUT9G8xT9qWrdD1-wP4UA-1wtuwCNxqSA@mail.gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Mon, 15 Jun 2020 01:13:09 -0500
Message-ID: <CAEkB2EQmtRh4HjhykCdKtw8SPaQWgLHgDc7VQ3=H0ssz=m1Y-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix ref count leak via pm_runtime_get_sync
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Cc: Qiushi Wu <wu000273@umn.edu>, David Airlie <airlied@linux.ie>,
 Stephen McCamant <smccaman@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
 etnaviv@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Navid Emamdoost <emamd001@umn.edu>, Daniel Vetter <daniel@ffwll.ch>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Sun, Jun 14, 2020 at 4:48 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jun 14, 2020 at 9:48 AM Navid Emamdoost
> <navid.emamdoost@gmail.com> wrote:
>
> ...
>
> > +               if (ret < 0) {
>
> > +                       pm_runtime_put(gpu->dev);
>
> Please, in all your patches fix this to be _put_noidle(). We wouldn't
> bear the flag day of fixing these parts again.
> Yes, I know that *now* behaviour is the same, but calling put here is
> slightly inconsistent.

v2 is sent.

>
> ...
>
> > +               pm_runtime_put(gpu->dev);
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Navid.
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
