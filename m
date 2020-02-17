Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39116181E
	for <lists+etnaviv@lfdr.de>; Mon, 17 Feb 2020 17:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78EA6E082;
	Mon, 17 Feb 2020 16:42:17 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF586E992
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Feb 2020 16:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 01EFDFB03;
 Mon, 17 Feb 2020 17:42:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_EVAcYhMEQA; Mon, 17 Feb 2020 17:42:12 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 60B8940FE5; Mon, 17 Feb 2020 17:42:12 +0100 (CET)
Date: Mon, 17 Feb 2020 17:42:12 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Chris Healy <cphealy@gmail.com>,
	Bernhard Rosenkraenzer <bero@lindev.ch>
Subject: Re: Is there an i.MX8 HDMI TX driver that works with Etnaviv?
Message-ID: <20200217164212.GA158912@bogon.m.sigxcpu.org>
References: <2aad-5e2cfd00-9-275e0440@259173318>
 <CAFXsbZqNnYpgm1n9ADgJdEWSvx-TeEcASRSCKUw=mznKNgnNCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFXsbZqNnYpgm1n9ADgJdEWSvx-TeEcASRSCKUw=mznKNgnNCg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
On Sat, Jan 25, 2020 at 07:00:58PM -0800, Chris Healy wrote:
> Hi Bero,
> 
> NXP has a 5.4 kernel tree with DCSS driver and HDMI driver that might
> work with the 5.5-rc7 tree you have.  You can find it here:
> 
> https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/imx?h=imx_5.4.0_8dxlphantom_er

I've brought over the dcss (hdmi) related bits on a next-20200108 branch
for my testing a while ago

   https://source.puri.sm/guido.gunther/linux-imx8/commits/experiment/next-20200108/dcss-hdmi/v0-wip

This might be a bit simpler than sorting things out of NXPs tree.
For mesa you need

   https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3449

Cheers,
 -- Guido

> 
> Regards,
> 
> Chris
> 
> On Sat, Jan 25, 2020 at 6:49 PM Bernhard Rosenkraenzer <bero@lindev.ch> wrote:
> >
> > Hi,
> > I'm trying to get etnaviv up and running on an i.MX8 based Hummingboard Pulse, on top of kernel 5.5-rc7.
> > Everything looks good, etnaviv loads and recognizes the GC7000 correctly:
> >
> > [Sun Jan 26 00:32:40 2020] etnaviv etnaviv: bound 38000000.gpu (ops gpu_ops [etnaviv])
> > [Sun Jan 26 00:32:40 2020] etnaviv-gpu 38000000.gpu: model: GC7000, revision: 6214
> > [Sun Jan 26 00:32:40 2020] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on minor 0
> >
> > Opening /dev/dri/card0 etc. works too - but of course there's no signal on the HDMI port given there's no HDMI TX driver in 5.5-rc7 (at least none that I could find).
> > Is there any out of tree driver that will work (or could be made work) on 5.5 without insane amounts of effort?
> >
> > Thanks
> > bero
> >
> > _______________________________________________
> > etnaviv mailing list
> > etnaviv@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/etnaviv
> _______________________________________________
> etnaviv mailing list
> etnaviv@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/etnaviv
> 
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
