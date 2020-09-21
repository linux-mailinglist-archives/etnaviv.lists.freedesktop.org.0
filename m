Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF48272472
	for <lists+etnaviv@lfdr.de>; Mon, 21 Sep 2020 14:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C915C6E2C0;
	Mon, 21 Sep 2020 12:59:44 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E3C6E2C0
 for <etnaviv@lists.freedesktop.org>; Mon, 21 Sep 2020 12:59:43 +0000 (UTC)
Received: from [2a0a:edc0:0:900:6245:cbff:fea0:1793]
 (helo=kresse.office.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kKLPw-0003aX-8Z; Mon, 21 Sep 2020 14:59:41 +0200
Message-ID: <e29e8ef235407831ed3f5e8d5d54763f79183025.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Russell King - ARM Linux
 <linux@armlinux.org.uk>,  The etnaviv authors
 <etnaviv@lists.freedesktop.org>
Date: Mon, 21 Sep 2020 14:59:39 +0200
In-Reply-To: <CAOMZO5C=XTOepsy7NJqS8DsL=9h0PvE8VyMSad4Jc-u89ccO_A@mail.gmail.com>
References: <CAOMZO5C=XTOepsy7NJqS8DsL=9h0PvE8VyMSad4Jc-u89ccO_A@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:6245:cbff:fea0:1793
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: Re: Etnaviv: eglCreateWindowSurface fails with glmark2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Adam Ford <aford173@gmail.com>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Fabio,

On Mo, 2020-09-21 at 09:41 -0300, Fabio Estevam wrote:
> Hi,
> 
> I am trying to run glmark2 and I am getting the following error on an
> imx6qp-sabresd with kernel 5.8.4:
> 
> # glmark2-es2-drm -d
> Debug: Using Udev to detect the right DRM node to use
> Debug: Looking for the main GPU DRM node...
> Debug: Not found!
> Debug: Looking for a concrete GPU DRM node...
> Debug: Success!
> Debug: Trying to use the DRM node /dev/dri/card0
> Debug: Success!
> Debug: Using eglGetPlatformDisplayEXT()
> Debug: Got 6 suitable EGLConfigs:
> Debug:
> Debug:     cfg buf  rgb  colorbuffer dp st config native support
> surface sample
> Debug:      id  sz  lum  r  g  b  a  th cl caveat
> render  visid    type  buf ns
> Debug: --------------------------------------------------------------
> ----------
> Debug:     0x2  32  rgb 10 10 10  2  16  0   None   true0x30334241
> 0x4   0  0
> Debug:     0xa  32  rgb  8  8  8  8  16  0   None   true0x34325241
> 0x4   0  0
> Debug:     0x3  32  rgb 10 10 10  2  24  0   None   true0x30334241
> 0x4   0  0
> Debug:     0xb  32  rgb  8  8  8  8  24  0   None   true0x34325241
> 0x4   0  0
> Debug:     0x4  32  rgb 10 10 10  2  24  8   None   true0x30334241
> 0x4   0  0
> Debug:     0xc  32  rgb  8  8  8  8  24  8   None   true0x34325241
> 0x4   0  0
> Debug:
> Debug: Best EGLConfig ID: 0x3
> Error: eglCreateWindowSurface failed with error: 0x3009
> Error: eglCreateWindowSurface failed with error: 0x3009
> Error: CanvasGeneric: Invalid EGL state
> Error: main: Could not initialize canvas
> 
> kmscube runs without issues.
> 
> glmark2-es2-drm used to work fine with older kernel/Mesa versions.
> 
> Does anyone have any ideas?

Since a while Mesa offers 10bit EGL configs, which have the highest
priority and thus get selected if the application doesn't care about
bit depth. imx-drm is unable to scanout those formats.

Try starting glmark with --visual-config red=8 as a workaround to get a
scanout capable visual.

Regards,
Lucas

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
