Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0F2927ED
	for <lists+etnaviv@lfdr.de>; Mon, 19 Oct 2020 15:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3986E97F;
	Mon, 19 Oct 2020 13:12:44 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7506E97F
 for <etnaviv@lists.freedesktop.org>; Mon, 19 Oct 2020 13:12:42 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id s15so5643134vsm.0
 for <etnaviv@lists.freedesktop.org>; Mon, 19 Oct 2020 06:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DXUIhqC7rDkrnC2m3lyXCuFhprisEU9uw4/zVJdHdzk=;
 b=Z4PXjOz1JToryrz4NpxE6Maq0pSdDkTRr5lxg8BPOsA9grxAqlUS2upOXaKeUIGQ4Q
 BPZSQMHkodPeN2VqPnmqig5lb3TBRXarCqqNAOHTI1FPYZYJiziiT2OINjDL2K/INrmh
 fkA5WBd020u9kk56tYLVrWx01oKRKliyc6q+NV3U4dq77g7BqSvAUUmHC9cUINedmFGn
 l78cBPGokUUuvbONPEiyEDYJugtVleSy+NlBmPHmlh33ne1tq62zrG6tjZAs0sTyYHTo
 WPmHb69ky5d8P3tElX3IA4T6OQrWznUHCsDJKM4KGkLi1qzeBY5N7gLKXx7QVhr6Osao
 Mmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXUIhqC7rDkrnC2m3lyXCuFhprisEU9uw4/zVJdHdzk=;
 b=gyJ/mpqx5aA+YkJFR0/nlyLT/QALyNIE3KA8oQRCMxOjI8KLq1rA5A007yzpquxy6H
 UF0948NN1W9WZ1q0Fnl+d/IYCOaAiCpNaIijDpzmwR7n0UiB2Hi9W2sz8FXD4CSLWV6F
 sVVvMj4sRxGuLs6bF4usFRTeHpZr0eOOuIvYXa4yJBvstOUIRw/lXaw0shoVaUWqDSRr
 1Tcgw7rfbScWklAJphSw4b8iL/ugKofEExdyNOh/Q6fZC3C5btGrv9bvuXvXvG5GIBD4
 c7Vmp31scqcXK0WKt4l0Xzu/KpM5IY1El/jFILnqsDEsJO4XowKluewWxzSGcCGhaFKW
 X9JA==
X-Gm-Message-State: AOAM532WQxNF0CwNDs2nPdC/PjqzoItYowoATMMDHxWKbVIiPYP5KoKP
 A6SPFTQ+ox2qSSYN1Zuy9TJ9XJNNDHXHt6ZeE6lvzjkKpt7eqQ==
X-Google-Smtp-Source: ABdhPJyGZ+16WwRsOdFA95JTJJN3IMR5sRMyMW2jp6k/dFqF6ZQAiror1cIjEylkMfy6s+4u6E7/mLTPFZT8HYLmP9w=
X-Received: by 2002:a67:fb96:: with SMTP id n22mr8536613vsr.13.1603113162014; 
 Mon, 19 Oct 2020 06:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1M=GxceoURX+SffkQHSxVr3fKUxwysbZmU1-jAu0YY_A@mail.gmail.com>
In-Reply-To: <CAJ+vNU1M=GxceoURX+SffkQHSxVr3fKUxwysbZmU1-jAu0YY_A@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 19 Oct 2020 15:12:30 +0200
Message-ID: <CAH9NwWc-qCopDNYe64788Ei_JCQvZAV6BrXguYcvFBOBp-YgvQ@mail.gmail.com>
Subject: Re: OpenCL on etnaviv?
To: Tim Harvey <tharvey@gateworks.com>
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Tim

>
> Could anyone explain if OpenCL can run with etnaviv? I'm also not
> quite understanding if OpenCL has specific hardware requirements. I
> have users that I support wanting to run OpenCL on an IMX8M and am
> finding that NXP states the IMX8MM doesn't support OpenCL (yet the
> IMX8MN does)  and I'm trying to understand if that is a technical
> issue or just simply that they won't support it through their closed
> Vivante driver.
>

On the etnaviv side OpenCL is possible but nothing has done in that
direction and
needs work to get it up and running. Hardware wise it should work on GPUs with
SSBOs and Images support. Intuitively it should work on most Vivante GPUs. Also
you might have a look https://en.wikipedia.org/wiki/Vivante_Corporation

> I suppose for my own education I also have the same question about
> Vulkan. Is there specific GPU hardware requirements for that? My
> understanding is that things like OpenCL and Vulkan are just software
> API's to tap into the hardware units.
>

I am a big vulkan newbie but I think the baseline for vulkan is ES 3.1. So any
GPU where we can support ES 3.1 could also be driven by the Vulkan API.

But the Vulkan road for etnaviv is even longer one. I think gles 3.0 is more
important at the moment. So do not expect anything in that area in the near and
far future.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
