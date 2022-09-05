Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B42B5ACF07
	for <lists+etnaviv@lfdr.de>; Mon,  5 Sep 2022 11:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC4F10E22C;
	Mon,  5 Sep 2022 09:42:12 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E5210E22C
 for <etnaviv@lists.freedesktop.org>; Mon,  5 Sep 2022 09:42:08 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oV8cI-0006V0-Fg; Mon, 05 Sep 2022 11:42:06 +0200
Message-ID: <307dbff19237092927f7568e2bf1a8b71166cf15.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/etnaviv: add HWDB entry for GC7000 r6203
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 05 Sep 2022 11:42:05 +0200
In-Reply-To: <CAH9NwWc46-gggmK0_qkpiHxMnbGiCJJ2jwc4ogFvK-62PabeFQ@mail.gmail.com>
References: <20220826190728.3213793-1-l.stach@pengutronix.de>
 <CAH9NwWc46-gggmK0_qkpiHxMnbGiCJJ2jwc4ogFvK-62PabeFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>, Adam Ford <aford173@gmail.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

H Christian,

Am Samstag, dem 03.09.2022 um 13:16 +0200 schrieb Christian Gmeiner:
> Hi all
> 
> Am Fr., 26. Aug. 2022 um 21:07 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
> > 
> > From: Marco Felsch <m.felsch@pengutronix.de>
> > 
> > The GPU is found on the NXP i.MX8MN SoC. The feature bits are taken from
> > the NXP downstream kernel driver 6.4.3.p2.
> > 
> 
> Can we stop adding new entries to the kernel hwdb and start to
> establish a hwdb in the userspace aka mesa?
> The kernel provides all the needed information to the user space so
> "all" that's left is to add the mesa side. You might
> ask why? It is much simpler to maintain such a database in the user
> space (thanks to stable patch releases of mesa) than
> forcing users to update their kernels to get this new database entry.
> 
Some of the feature bits are also interesting to the kernel, so you
need to update the kernel anyways if you want a new GPU to work. HWDB
entries, same as PCI ID additions, could be picked up into the stable
kernel releases if anyone cares.

I'm not opposed to userspace having its own HWDB, but at this point we
can not remove the kernel HWDB, even just to keep API compatibility.

Regards,
Lucas

