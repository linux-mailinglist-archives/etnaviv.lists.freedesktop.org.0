Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2655A293CE8
	for <lists+etnaviv@lfdr.de>; Tue, 20 Oct 2020 15:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8D26EC8E;
	Tue, 20 Oct 2020 13:06:03 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D1B6EC8E
 for <etnaviv@lists.freedesktop.org>; Tue, 20 Oct 2020 13:06:02 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kUrKy-00055Y-L8; Tue, 20 Oct 2020 15:06:00 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kUrKx-0006ML-S0; Tue, 20 Oct 2020 15:05:59 +0200
Message-ID: <f16bb0da4b28dfaf179052ddd0fbf27a4f75a4dd.camel@pengutronix.de>
Subject: Re: OpenCL on etnaviv?
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tim Harvey <tharvey@gateworks.com>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Date: Tue, 20 Oct 2020 15:05:59 +0200
In-Reply-To: <CAJ+vNU20sriZK8DjtqDCCwoAzUhQKf3b4VuYaDDr0=FwC3H74A@mail.gmail.com>
References: <CAJ+vNU1M=GxceoURX+SffkQHSxVr3fKUxwysbZmU1-jAu0YY_A@mail.gmail.com>
 <CAH9NwWc-qCopDNYe64788Ei_JCQvZAV6BrXguYcvFBOBp-YgvQ@mail.gmail.com>
 <CAJ+vNU20sriZK8DjtqDCCwoAzUhQKf3b4VuYaDDr0=FwC3H74A@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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

Hi,

On Mon, 2020-10-19 at 08:48 -0700, Tim Harvey wrote:
> On Mon, Oct 19, 2020 at 6:12 AM Christian Gmeiner
> <christian.gmeiner@gmail.com> wrote:
> > Hi Tim
> > 
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

The i.MX Graphics Users Guide [1], chapter 5.3.9 "Using buffers instead
of images" makes it look like image support (support for
read/write_image* OpenCL functions) is always emulated in the shaders.

[1] https://www.nxp.com/docs/en/user-guide/i.MX_Graphics_User%27s_Guide_Linux.pdf

> What led me to post this question was NXP stating that the IMX8MM does
> not support OpenCL or Vulkan whereas the other IMX8M's (IMX8MN,
> IMX8MP, and IMX8MQ) do. I wasn't clear if it was a limitation in what
> NXP offers through the Vivante driver or if this was a technical
> limit. It would appear that it is likely both but more so a technical
> limit.

There's a separate hardware API mode for OpenCL compute shader dispatch.
Some features may be emulated in software, but at least that and memory
load/store instructions must be supported by the hardware.

> > > I suppose for my own education I also have the same question about
> > > Vulkan. Is there specific GPU hardware requirements for that? My
> > > understanding is that things like OpenCL and Vulkan are just software
> > > API's to tap into the hardware units.
> > 
> > I am a big vulkan newbie but I think the baseline for vulkan is ES 3.1. So any
> > GPU where we can support ES 3.1 could also be driven by the Vulkan API.
> 
> The IMX8MM has a GC NanoUltra (1 shader) supporting OpenGL ES 2.0 and
> a GC502L for 2D from what I can find. So if the baseline is ES 3.1
> there would never be any hope for Vulkan on that. I'm assuming the
> GLES API's are implemented in hardware and not some sort of
> abstraction layer.

Given that the Vivante homepage listed OpenCL support as optional for
GCNano Ultra, I believe that the implementation on i.MX8MM may have the
required hardware features for compute shaders disabled.

regards
Philipp
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
