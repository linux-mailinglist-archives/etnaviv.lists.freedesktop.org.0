Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337816A404
	for <lists+etnaviv@lfdr.de>; Mon, 24 Feb 2020 11:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5E36E420;
	Mon, 24 Feb 2020 10:37:22 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B136E420
 for <etnaviv@lists.freedesktop.org>; Mon, 24 Feb 2020 10:37:21 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j6B71-0007iD-5M; Mon, 24 Feb 2020 11:37:19 +0100
Message-ID: <38c7cdc27213697b50517ce103a9d38120f84bd3.camel@pengutronix.de>
Subject: Re: Etnaviv issues on i.MX8M-Mini
From: Lucas Stach <l.stach@pengutronix.de>
To: Schrempf Frieder <frieder.schrempf@kontron.de>, Chris Healy
 <cphealy@gmail.com>, "etnaviv@lists.freedesktop.org"
 <etnaviv@lists.freedesktop.org>
Date: Mon, 24 Feb 2020 11:37:18 +0100
In-Reply-To: <d1c98cb7-c75f-d8ca-9541-3c118d371a57@kontron.de>
References: <2704d3bd-5563-8951-58f7-75a906782754@kontron.de>
 <CAFXsbZp9kW555gm+8Cz+oQVRNSzVzzQO2rM5YqzitCd6T7KN6Q@mail.gmail.com>
 <bcc3af77-07c5-fbc7-ad20-d070c5ab1ce8@kontron.de>
 <CAFXsbZqNQMi+-tPE22oMTHqb+8vEOy+v8cLfUMmhqs7S5RLoqg@mail.gmail.com>
 <d1c98cb7-c75f-d8ca-9541-3c118d371a57@kontron.de>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Frieder,

On Mo, 2020-02-24 at 10:28 +0000, Schrempf Frieder wrote:
> On 20.02.20 19:58, Chris Healy wrote:
> > For the jerkey transitions, can you determine if this is a symptom of
> > a low framerate or dropped frames or something else?
> > 
> > Perhaps you can start your app with
> > "GALLIUM_HUD=fps,cpu,draw-calls,frametime".  This may give some clues.
> 
> The framerate seems ok. I get something between 50 and 70 FPS.
> 
> I have a Qt demo app with a menu and an animated 'ball' that moves 
> across the screen. When the menu is visible, the ball movement is really 
> jerky (ball seems to 'jump back and forth' instead of moving linearly).
> 
> As soon as I hide the menu and show the animation fullscreen, the 
> movements are perfectly smooth.
> 
> Running the same app with software rendering, everything looks good, too.
> 
> No idea what that means, though. I probably need to look at the code of 
> the app and do some more experiments to get a better idea of what might 
> cause the distortion.
> 
> Unless some of the graphics experts here already have an idea of what 
> can cause and/or how to debug such an issue!?

Which driver is used for the display side? It seems like the display
side doesn't properly handle the dma fences used to synchronize scanout
and rendering.

> Is it even correct, that the GPUs are detected as GC520 and GC600? Is it 
> known if they need some changes in the HWDB?

We probably need some addition to the HWDB. It is highly likely that
the GPU is some variant of the GC600 (all this NanoUltra stuff is just
marketing fluff), but it seems the feature registers on those newer
cores aren't fully correct anymore, as the vendor driver handles most
of this via the HWDB these days.

Regards,
Lucas

> Thanks for your support!
> 
> > On Thu, Feb 20, 2020 at 10:25 AM Schrempf Frieder
> > <frieder.schrempf@kontron.de> wrote:
> > > Hi Chris,
> > > 
> > > On 20.02.20 18:19, Chris Healy wrote:
> > > > Hi Frieder,
> > > > 
> > > > For your #1, can you provide more detail on your configuration?  What
> > > > is your display resolution?  Are you running Qt with egl_fs or are you
> > > > running on top of a compositor?  If you are running on top of a
> > > > compositor, is the 3D GPU being used for compositing?
> > > 
> > > Sure. The display resolution I'm testing with is 1024x600 and I'm using
> > > the eglfs/KMS backend without compositor.
> > > 
> > > I'm passing this simple config to Qt via QT_QPA_EGLFS_KMS_CONFIG:
> > > 
> > > {
> > >       "device": "/dev/dri/card1"
> > > }
> > > 
> > > > For your #2, at least in the case of the GC2000, the GPU cannot deal
> > > > with shaders that have more than 512 instructions.  The terrain demo
> > > > has a shader that is typically larger than 512 instructions.  I've
> > > > always seen the terrain demo fail on the GC2000.  With the GC3000 and
> > > > GC7000L, this 512 instruction limit does not exist and the terrain
> > > > demo has always worked.  Likely the GC600 has this 512 instruction
> > > > limit.
> > > 
> > > Ok, that's likely the reason for this. Thanks for explaining.
> > > 
> > > Best regards,
> > > Frieder
> > > 
> > > > Regards,
> > > > 
> > > > Chris
> > > > 
> > > > On Thu, Feb 20, 2020 at 8:56 AM Schrempf Frieder
> > > > <frieder.schrempf@kontron.de> wrote:
> > > > > Hi,
> > > > > 
> > > > > according to the documents, the i.MX8M-Mini features a GC320 and a
> > > > > GCNanoUltra. I tried to run the etnaviv drivers and the following GPUs
> > > > > are detected:
> > > > > 
> > > > >           etnaviv-gpu 38000000.gpu: model: GC600, revision: 4653
> > > > >           etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341
> > > > > 
> > > > > Running some demos and tests with mesa 19.1.6 most things seem to work.
> > > > > Still I currently have two issues, while the first one is kind of a
> > > > > show-stopper and the second one is not really important as it seems to
> > > > > affect shaders only.
> > > > > 
> > > > > 1. When running any QtQuick applications, all transformations like
> > > > > moving elements are really jerky and not smooth at all as it should be.
> > > > > Any ideas what the reason could be, or how to get more information about
> > > > > this problem?
> > > > > 
> > > > > 2. With some demos (e.g. with 'glmark2-es2-drm -b terrain') I get:
> > > > > 
> > > > >           error: compile failed!
> > > > >           etna_draw_vbo:222: compiled shaders are not okay
> > > > > 
> > > > > Can this be fixed somehow, or is this due to the limitations of the GPU?
> > > > > 
> > > > > Thanks,
> > > > > Frieder
> > > > > _______________________________________________
> > > > > etnaviv mailing list
> > > > > etnaviv@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/etnaviv
> _______________________________________________
> etnaviv mailing list
> etnaviv@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/etnaviv

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
