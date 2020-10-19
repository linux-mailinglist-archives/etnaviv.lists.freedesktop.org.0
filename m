Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAF7292ACF
	for <lists+etnaviv@lfdr.de>; Mon, 19 Oct 2020 17:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688876EA06;
	Mon, 19 Oct 2020 15:48:42 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2DB6EA06
 for <etnaviv@lists.freedesktop.org>; Mon, 19 Oct 2020 15:48:40 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id md26so14549186ejb.10
 for <etnaviv@lists.freedesktop.org>; Mon, 19 Oct 2020 08:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UE4y2VbqK1/Zi0QNxFnIQE/Bv6a9dZOvirWXzxycJiY=;
 b=rRyzICPb/dSxgTjOFKkCXxEh0Yto5+rmlMwYGOx9J0yGyurbmteVZJnJeidvfSueSF
 4A7fSHKewWXd6tO/23TwHGNbmKBkFesDJVpf3Kv4Pvi65iBK5JHi9GmGQTqhyECyYT0T
 /IzC8WQTDvjTsRiLFnPrP36AiWi55+MWXCxY0WGdS0YcnJaVXMxMrzJ7ZwD6cbwt0r06
 SggFF3pRx4r3I9LnpqGI/Gc6NxphjSPkB6Jl8IxdyAgmZyV3FAhzsHm/yKwHJu2MuwWi
 ITJVqqjnvooPTmoHn9Rh/nqGrVpi/CQFXyuUtTMSpQCjOC5Y5lenQO94Z1ylUmZkEqh5
 l7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UE4y2VbqK1/Zi0QNxFnIQE/Bv6a9dZOvirWXzxycJiY=;
 b=F+9oTOpehIaStakGdSErN3CuykP5OCr5Dggfw39gOmRIn4vggCP0cth/tqVd+J8mAB
 LCG7BzaI/WR5WCo+jSHtqGf3bN+5KrgPA8DrxDWXS9cxG9JXYmWjasyhdbX0i6kiMdef
 wIkMFDDvraHjT2J2LMaORBGcZ4ZCW8DT4EkH5aw9tKo2HGIIqnTzaEMmtYOBJCJSd/7T
 DFQDY7p9BS+vg8fz8skA6CtkVF+6LXHSW0Q5V9iFBsInk6tOAsXLzcX7/ZjT+FIcMgeR
 rtcP6c/XZAyATDfgB8YaQCh1Jbnz/bvuU4aLYF0smE2kJT9Is0oTdPrDj9qbJrHWDv5+
 Bj5A==
X-Gm-Message-State: AOAM5305fn3LWcN9VggQKJw2MMw4lzXH/h/06tgWG11G71wGg8+vrnf8
 qzutDzlufOIEEvVAUgfNo6Hgb2rDCdFOZ891L+ystA==
X-Google-Smtp-Source: ABdhPJzXx3y0gFv9CdomfhOU4V44ogGEUIqibLuxdd5+A1WUgTNOj2EyFsPkyVpcKSmxXn+CD4E59XSY1d75X0yOJng=
X-Received: by 2002:a17:906:cc53:: with SMTP id
 mm19mr502534ejb.514.1603122519389; 
 Mon, 19 Oct 2020 08:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1M=GxceoURX+SffkQHSxVr3fKUxwysbZmU1-jAu0YY_A@mail.gmail.com>
 <CAH9NwWc-qCopDNYe64788Ei_JCQvZAV6BrXguYcvFBOBp-YgvQ@mail.gmail.com>
In-Reply-To: <CAH9NwWc-qCopDNYe64788Ei_JCQvZAV6BrXguYcvFBOBp-YgvQ@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 19 Oct 2020 08:48:26 -0700
Message-ID: <CAJ+vNU20sriZK8DjtqDCCwoAzUhQKf3b4VuYaDDr0=FwC3H74A@mail.gmail.com>
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 6:12 AM Christian Gmeiner
<christian.gmeiner@gmail.com> wrote:
>
> Hi Tim
>
> >
> > Could anyone explain if OpenCL can run with etnaviv? I'm also not
> > quite understanding if OpenCL has specific hardware requirements. I
> > have users that I support wanting to run OpenCL on an IMX8M and am
> > finding that NXP states the IMX8MM doesn't support OpenCL (yet the
> > IMX8MN does)  and I'm trying to understand if that is a technical
> > issue or just simply that they won't support it through their closed
> > Vivante driver.
> >
>
> On the etnaviv side OpenCL is possible but nothing has done in that
> direction and
> needs work to get it up and running. Hardware wise it should work on GPUs with
> SSBOs and Images support. Intuitively it should work on most Vivante GPUs. Also
> you might have a look https://en.wikipedia.org/wiki/Vivante_Corporation
>

Christian,

Thanks - this is very helpful. I found some info about what a Shader
Storage Buffer Object (SSBO) is but I haven't managed to find what you
mean by Images support. I'm also not clear how to tell what Vivante
GPU's have this support. The wikipedia page doesn't go into detail on
SSBO's and Images support. Where do you typically find this info?

What led me to post this question was NXP stating that the IMX8MM does
not support OpenCL or Vulkan whereas the other IMX8M's (IMX8MN,
IMX8MP, and IMX8MQ) do. I wasn't clear if it was a limitation in what
NXP offers through the Vivante driver or if this was a technical
limit. It would appear that it is likely both but more so a technical
limit.

> > I suppose for my own education I also have the same question about
> > Vulkan. Is there specific GPU hardware requirements for that? My
> > understanding is that things like OpenCL and Vulkan are just software
> > API's to tap into the hardware units.
> >
>
> I am a big vulkan newbie but I think the baseline for vulkan is ES 3.1. So any
> GPU where we can support ES 3.1 could also be driven by the Vulkan API.
>

The IMX8MM has a GC NanoUltra (1 shader) supporting OpenGL ES 2.0 and
a GC502L for 2D from what I can find. So if the baseline is ES 3.1
there would never be any hope for Vulkan on that. I'm assuming the
GLES API's are implemented in hardware and not some sort of
abstraction layer.

> But the Vulkan road for etnaviv is even longer one. I think gles 3.0 is more
> important at the moment. So do not expect anything in that area in the near and
> far future.

Meaning that entaviv currently supports GLES 2.0 and work is being
done to improve that support to GLES 3.0?

Best Regards,

Tim
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
