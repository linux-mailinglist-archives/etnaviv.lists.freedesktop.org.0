Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA41B0F50
	for <lists+etnaviv@lfdr.de>; Mon, 20 Apr 2020 17:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2556E5B9;
	Mon, 20 Apr 2020 15:08:51 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC0C6E24E
 for <etnaviv@lists.freedesktop.org>; Wed, 15 Apr 2020 17:38:26 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h25so4605265lja.10
 for <etnaviv@lists.freedesktop.org>; Wed, 15 Apr 2020 10:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHqR2C2kxuUQojnOegpnVpnZsXBDzDgx0iHXx8OBUys=;
 b=Vy4tGFrR/UDz2J5FSZuzqmOKo1GCzxTWtZYw44vcauEzWQop68wvIG9gTD/GD6vSVx
 XU/sx8wBiHWMnElHjd+vgG43Pu0fwjE3OO6i10GBubZa9VgOL7U0dcLRL7z//U4t7RVc
 yLc9JmltDVJ99nNme9B93oOoyJNrRlTztgoU7PoT7uk9kJpOkDNL2nlKBeZazkdblE01
 TYsbPQTSf+oLWvQov5xMyKCCjZmXaHOs4Oj2N8do8WbBa1c82XNc6T+bPgKB33ZBEsEE
 wlFNw5pM/M5kzUb6Trl6SkDgQkpS5pamRzWGqC8x2YCx0gKHq/ICFrqJXnZTr9ti2G55
 KnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHqR2C2kxuUQojnOegpnVpnZsXBDzDgx0iHXx8OBUys=;
 b=RYqOBdlXsxPw3xAL+dU4uVLASovHBdwn0MSDyH4iRYwZ3y0QrulvU3nCcTve35Bhzx
 zN451Jahw4AK/JXudoDmWCLK62WrcscJswbW80IRx/b/5VW+P526Uf80owDKosCVAlp0
 1osGfH+PcCbmGaiB0PfAfaREiHokzfn9tlNHbiwQS1L11Ax6MoeSP6ZCgfwzBqWPZ3ln
 oy7OZwsBlAJuGpeBj/hMcBBGMOhpB8k6wWv2G0B58vMQN1PbEBJ5fLcbQcqcxM3WJuDS
 C8ibiFy5K5iQX4c4Aysgh1of50vyHPDtPzoaobm081OtvStbk88ZnBzFG9vv2Q46h+Q3
 kw0g==
X-Gm-Message-State: AGi0PuZPa0V41AuHs178mOqh3fJ2jbH2v1l71MSTm64/Q1aZbPjmGGeU
 HcjyzD4IpMqV97UPQzGMpIsvAEJVmhxOJhxff4LFFA==
X-Google-Smtp-Source: APiQypLDAmF2P6A5YCpLFM2PBnROKXHaBtzTgdG+1WeYnzrJQ57PGXzD+r87BQuOOpT+tLulD2nVxdXC0mh6T+pWCAQ=
X-Received: by 2002:a2e:9455:: with SMTP id o21mr3998409ljh.245.1586972304780; 
 Wed, 15 Apr 2020 10:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200228103752.1944629-1-christian.gmeiner@gmail.com>
 <4a5436201ff4345194f64aac1553f9656887203a.camel@pengutronix.de>
In-Reply-To: <4a5436201ff4345194f64aac1553f9656887203a.camel@pengutronix.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 15 Apr 2020 23:08:13 +0530
Message-ID: <CA+G9fYvVC8TYk1u-B98MvABqQUuG6hEB6Y7AYd0Qnzs0=-pFUw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: rework perfmon query infrastructure
To: Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
X-Mailman-Approved-At: Mon, 20 Apr 2020 15:08:50 +0000
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
Cc: David Airlie <airlied@linux.ie>, lkft-triage@lists.linaro.org,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Tue, 3 Mar 2020 at 17:19, Lucas Stach <l.stach@pengutronix.de> wrote:
>
> On Fr, 2020-02-28 at 11:37 +0100, Christian Gmeiner wrote:
> > Report the correct perfmon domains and signals depending
> > on the supported feature flags.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Fixes: 9e2c2e273012 ("drm/etnaviv: add infrastructure to query perf counter")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
>
> Thanks, applied to etnaviv/next.
>
> Regards,
> Lucas
>
> >
> > ---
> > Changes V1 -> V2:
> >   - Handle domain == NULL case better to get rid of BUG_ON(..) usage.
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 59 ++++++++++++++++++++---
> >  1 file changed, 52 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > index 8adbf2861bff..e6795bafcbb9 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> > @@ -32,6 +32,7 @@ struct etnaviv_pm_domain {
> >  };
> >
> >  struct etnaviv_pm_domain_meta {
> > +     unsigned int feature;
> >       const struct etnaviv_pm_domain *domains;
> >       u32 nr_domains;
> >  };
> > @@ -410,36 +411,78 @@ static const struct etnaviv_pm_domain doms_vg[] = {
> >
> >  static const struct etnaviv_pm_domain_meta doms_meta[] = {
> >       {
> > +             .feature = chipFeatures_PIPE_3D,

make modules failed for arm architecture on stable rc 4.19 branch.

drivers/gpu/drm/etnaviv/etnaviv_perfmon.c:392:14: error:
'chipFeatures_PIPE_3D' undeclared here (not in a function)
   .feature = chipFeatures_PIPE_3D,
              ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/etnaviv/etnaviv_perfmon.c:397:14: error:
'chipFeatures_PIPE_2D' undeclared here (not in a function); did you
mean 'chipFeatures_PIPE_3D'?
   .feature = chipFeatures_PIPE_2D,
              ^~~~~~~~~~~~~~~~~~~~
              chipFeatures_PIPE_3D
drivers/gpu/drm/etnaviv/etnaviv_perfmon.c:402:14: error:
'chipFeatures_PIPE_VG' undeclared here (not in a function); did you
mean 'chipFeatures_PIPE_2D'?
   .feature = chipFeatures_PIPE_VG,
              ^~~~~~~~~~~~~~~~~~~~
              chipFeatures_PIPE_2D


ref:
https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-4.19/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/511/consoleText
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
