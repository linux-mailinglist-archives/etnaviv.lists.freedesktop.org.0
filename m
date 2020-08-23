Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5015A24EF70
	for <lists+etnaviv@lfdr.de>; Sun, 23 Aug 2020 21:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A766E570;
	Sun, 23 Aug 2020 19:28:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 512 seconds by postgrey-1.36 at gabe;
 Sun, 23 Aug 2020 19:28:38 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606346E570
 for <etnaviv@lists.freedesktop.org>; Sun, 23 Aug 2020 19:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3fF6Mlmm3gJtBShPFzFPOko81F6k4KIOq/kf7RgYAgk=; b=0TVRAPIR7uXCAc1Rvleb8CExp
 6EOFYFzsKPefQYiWDW0gFT18KJKHzSEKuQtXsjgW2UKJA9Lrc4PVra81Trj3FeIW8KRGun/YPGJnu
 0acBokLq142gUB6Enk9zCY+EAjmS1QxB+iwn+opfq417cuDm0jU0mmVx997mlGHuOtJmLjexgN37D
 ib4ZTVIeunOKZxchqfEJ7vy8Y8ycxFQKE5HHou3sXvwTpl+7HsOf5dL98oOaC5eV8ruKeaMw54iaV
 lNQbE8H3YZD2R2lavdrygu7NxgW/fMTb1r8nl63W34NIWsyNt44dVwazEWX3F6QU3hO3/LI9vS4W/
 uQADyHsNA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56250)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1k9vX6-0007Rq-2x; Sun, 23 Aug 2020 20:20:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1k9vX2-0006eC-G2; Sun, 23 Aug 2020 20:19:56 +0100
Date: Sun, 23 Aug 2020 20:19:56 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix external abort seen on GC600 rev 0x19
Message-ID: <20200823191956.GH1551@shell.armlinux.org.uk>
References: <20200821181731.94852-1-christian.gmeiner@gmail.com>
 <4dbee9c7-8a59-9250-ab13-394cbab689a8@jm0.eu>
 <CAH9NwWdLnwb0BiR6qAHKFexFm2NJkpHv7Z7YAdQ7fJBVxjGH4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH9NwWdLnwb0BiR6qAHKFexFm2NJkpHv7Z7YAdQ7fJBVxjGH4w@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Ing. Josua Mayer" <josua.mayer@jm0.eu>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Sun, Aug 23, 2020 at 09:10:25PM +0200, Christian Gmeiner wrote:
> Hi
> 
> > I have formally tested the patch with 5.7.10 - and it doesn't resolve
> > the issue - sadly :(
> >
> > From my testing, the reads on
> > VIVS_HI_CHIP_PRODUCT_ID
> > VIVS_HI_CHIP_ECO_ID
> > need to be conditional - while
> > VIVS_HI_CHIP_CUSTOMER_ID
> > seems to be okay.
> >
> 
> Uhh.. okay.. just send a V2 - thanks for testing :)

There is also something else going on with the GC600 - 5.4 worked fine,
5.8 doesn't - my 2D Xorg driver gets stuck waiting on a BO after just
a couple of minutes.  Looking in debugfs, there's a whole load of BOs
that are listed as "active", yet the GPU is idle:

   00020000: A  0 ( 7) 00000000 00000000 8294400
   00010000: I  0 ( 1) 00000000 00000000 4096
   00010000: I  0 ( 1) 00000000 00000000 4096
   00010000: I  0 ( 1) 00000000 00000000 327680
   00010000: A  0 ( 7) 00000000 00000000 8388608
   00010000: I  0 ( 1) 00000000 00000000 8388608
   00010000: I  0 ( 1) 00000000 00000000 8388608
   00010000: A  0 ( 7) 00000000 00000000 8388608
   00010000: A  0 ( 3) 00000000 00000000 8388608
   00010000: A  0 ( 4) 00000000 00000000 8388608
   00010000: A  0 ( 3) 00000000 00000000 8388608
   00010000: A  0 ( 3) 00000000 00000000 8388608
   00010000: A  0 ( 3) 00000000 00000000 8388608
....
   00010000: A  0 ( 3) 00000000 00000000 8388608
Total 38 objects, 293842944 bytes

My guess is there's something up with the way a job completes that's
causing the BOs not to be marked inactive.  I haven't yet been able
to debug any further.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
