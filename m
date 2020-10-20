Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A3E2943D5
	for <lists+etnaviv@lfdr.de>; Tue, 20 Oct 2020 22:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102AA6E159;
	Tue, 20 Oct 2020 20:26:59 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9344D6E159
 for <etnaviv@lists.freedesktop.org>; Tue, 20 Oct 2020 20:26:57 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id v23so1878887vsp.6
 for <etnaviv@lists.freedesktop.org>; Tue, 20 Oct 2020 13:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/q1Wec3g5+fnSDAxDmzk0WFa5eC5h9fUVRQBJXjzj9k=;
 b=Wnk5q3EUk9y24i1wrHiTm9LQRFmIrz0ToGJqCKOINfSjaHOJ1WCpGmiEK/Sf1lhosZ
 DtiRaoF5wl6c61PyQGjjwevLUBXqjmv1P8YOa3ZP3ijb2PJg5gMvKjz3tqIKFCX6KfJ2
 ZaEonfXxNdxE8m0ywtkfYjlqNmTOSBdJXsVXTyLpjiutxyQqrDE2hJ2fN0dB+9dcLcPM
 b7czkVC3aoiIWFHyDBHvcTp6X3ZS2v8SOiDbnz4UzuZ9Qt+qrxs+pkENIj/qancFLkj4
 DeIOboIrhhcq9DzzI43GV0l7qsDqrHu2ca5ZN25FzrXRh8iYBk8t1IFGDrUx1tv1L1Hl
 orrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/q1Wec3g5+fnSDAxDmzk0WFa5eC5h9fUVRQBJXjzj9k=;
 b=UoL7fHUaFkVPW3F2NKENxtN1w+lZN05Bte5DT2+AE62g5QeGouC1vPBKu6jxx/edkl
 s3lQCmHC5k1y8FUY/KRop+WjUJR7bp2eAU2aZYP0G4ls9jk0cvCHBnWZMlGn61m90I8V
 taNaXw0VC7fhaKC8G+fGuy8kuhM9vdwk2RPybe4JCBOJJdyWJBzIxGxuTqzokbSDf5sx
 2/c5NbkPXVc3P1LuCXG7qMFeQrpoFwLBMUIuTH+1qPvnslY12oHaF3jSQE887WCO0XBy
 5f0kDeb0svETqxvsnZNVZ+uExBGmaT5/ALujXAtjqb+VRNrKTi5drSCHOCT98LWJMbHk
 //gQ==
X-Gm-Message-State: AOAM532Skmy7SL5YeseUItt/0ZwR+f5ocuC+VEkZEUOG8r7xPmaUlLE8
 I/Mwgcyz1lcEUuooQdsMP6dHInkhmhn6SBE982w=
X-Google-Smtp-Source: ABdhPJwa0stAkyGzAZUAJpjok5V6EKNCHSJilh8PDNGfqpOOHrGXXoVh2nmMlJD5BisJTanRhI/SL8e80YL6Nl4plgU=
X-Received: by 2002:a67:6203:: with SMTP id w3mr3468098vsb.15.1603225616497;
 Tue, 20 Oct 2020 13:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1M=GxceoURX+SffkQHSxVr3fKUxwysbZmU1-jAu0YY_A@mail.gmail.com>
 <CAH9NwWc-qCopDNYe64788Ei_JCQvZAV6BrXguYcvFBOBp-YgvQ@mail.gmail.com>
 <CAJ+vNU20sriZK8DjtqDCCwoAzUhQKf3b4VuYaDDr0=FwC3H74A@mail.gmail.com>
In-Reply-To: <CAJ+vNU20sriZK8DjtqDCCwoAzUhQKf3b4VuYaDDr0=FwC3H74A@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 20 Oct 2020 22:26:44 +0200
Message-ID: <CAH9NwWcvYWtH193fsCxRUiaSOsAoNZi144KuCqTN6-pL2L4fRw@mail.gmail.com>
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

Hi Tim,

Am Mo., 19. Okt. 2020 um 17:48 Uhr schrieb Tim Harvey <tharvey@gateworks.com>:
>
> On Mon, Oct 19, 2020 at 6:12 AM Christian Gmeiner
> <christian.gmeiner@gmail.com> wrote:
> >
> > Hi Tim
> >
> > >
> > > Could anyone explain if OpenCL can run with etnaviv? I'm also not
> > > quite understanding if OpenCL has specific hardware requirements. I
> > > have users that I support wanting to run OpenCL on an IMX8M and am
> > > finding that NXP states the IMX8MM doesn't support OpenCL (yet the
> > > IMX8MN does)  and I'm trying to understand if that is a technical
> > > issue or just simply that they won't support it through their closed
> > > Vivante driver.
> > >
> >
> > On the etnaviv side OpenCL is possible but nothing has done in that
> > direction and
> > needs work to get it up and running. Hardware wise it should work on GPUs with
> > SSBOs and Images support. Intuitively it should work on most Vivante GPUs. Also
> > you might have a look https://en.wikipedia.org/wiki/Vivante_Corporation
> >
>
> Christian,
>
> Thanks - this is very helpful. I found some info about what a Shader
> Storage Buffer Object (SSBO) is but I haven't managed to find what you
> mean by Images support. I'm also not clear how to tell what Vivante
> GPU's have this support. The wikipedia page doesn't go into detail on
> SSBO's and Images support. Where do you typically find this info?
>

Regarding images: https://livebook.manning.com/book/opencl-in-action/chapter-6/

> What led me to post this question was NXP stating that the IMX8MM does
> not support OpenCL or Vulkan whereas the other IMX8M's (IMX8MN,
> IMX8MP, and IMX8MQ) do. I wasn't clear if it was a limitation in what
> NXP offers through the Vivante driver or if this was a technical
> limit. It would appear that it is likely both but more so a technical
> limit.
>

This is a hard question to answer as there is no feature flag regarding compute.
Also NXP might have not packed opencl support into their release even though the
gpu supports it. Maybe just ask NXP? Btw. how is the upstream support for the
imx8mm? I do not own such hardware.

> > > I suppose for my own education I also have the same question about
> > > Vulkan. Is there specific GPU hardware requirements for that? My
> > > understanding is that things like OpenCL and Vulkan are just software
> > > API's to tap into the hardware units.
> > >
> >
> > I am a big vulkan newbie but I think the baseline for vulkan is ES 3.1. So any
> > GPU where we can support ES 3.1 could also be driven by the Vulkan API.
> >
>
> The IMX8MM has a GC NanoUltra (1 shader) supporting OpenGL ES 2.0 and
> a GC502L for 2D from what I can find. So if the baseline is ES 3.1
> there would never be any hope for Vulkan on that. I'm assuming the
> GLES API's are implemented in hardware and not some sort of
> abstraction layer.
>

Yeah.. no Vulkan.

> > But the Vulkan road for etnaviv is even longer one. I think gles 3.0 is more
> > important at the moment. So do not expect anything in that area in the near and
> > far future.
>
> Meaning that entaviv currently supports GLES 2.0 and work is being
> done to improve that support to GLES 3.0?
>

Correct... next stop is es 3.0.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
