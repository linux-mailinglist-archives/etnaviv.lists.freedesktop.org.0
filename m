Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FB820A182
	for <lists+etnaviv@lfdr.de>; Thu, 25 Jun 2020 17:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB07B6E1C4;
	Thu, 25 Jun 2020 15:03:59 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 531 seconds by postgrey-1.36 at gabe;
 Thu, 25 Jun 2020 15:03:58 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CF76E16F
 for <etnaviv@lists.freedesktop.org>; Thu, 25 Jun 2020 15:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id C3418FB03;
 Thu, 25 Jun 2020 16:55:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1airAkfx232Y; Thu, 25 Jun 2020 16:55:03 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 3490445273; Thu, 25 Jun 2020 16:55:03 +0200 (CEST)
Date: Thu, 25 Jun 2020 16:55:03 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 0/5] drm/etnaviv: Ignore MC bit when checking for runtime
 suspend
Message-ID: <20200625145503.GA48167@bogon.m.sigxcpu.org>
References: <cover.1583176306.git.agx@sigxcpu.org>
 <4c61fde86c5e0dced249221dbc0a8d4207d5bffa.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c61fde86c5e0dced249221dbc0a8d4207d5bffa.camel@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi,
On Tue, Mar 03, 2020 at 12:55:04PM +0100, Lucas Stach wrote:
> On Mo, 2020-03-02 at 20:13 +0100, Guido G=FCnther wrote:
> > At least GC7000 fails to enter runtime suspend for long periods of time=
 since
> > the MC becomes busy again even when the FE is idle. The rest of the ser=
ies
> > makes detecting similar issues easier to debug in the future by checking
> > all known bits in debugfs and also warning in the EBUSY case.
> =

> Thanks, series applied to etnaviv/next.
> =

> > Tested on GC7000 with a reduced runtime delay of 50ms. Patches are
> > against next-20200226.
> =

> I've already wondered if 200ms is too long, 50ms sounds more
> reasonable. Do you have any numbers on the power draw on the i.MX8M
> with idle GPU, vs. being fully power gated?

The difference is at least 250mW. It makes a huge difference over here.
We hit
https://lore.kernel.org/dri-devel/20200614064601.7872-1-navid.emamdoost@gma=
il.com/
recently and you notice instantly when that happens when looking at the
SoC temperature.

Cheers,
 -- Guido
> =

> Regards,
> Lucas
> =

> > Thanks to Lucas Stach for pointing me in the right direction.
> > =

> > Guido G=FCnther (5):
> >   drm/etnaviv: Fix typo in comment
> >   drm/etnaviv: Update idle bits
> >   drm/etnaviv: Consider all kwnown idle bits in debugfs
> >   drm/etnaviv: Ignore MC when checking runtime suspend idleness
> >   drm/etnaviv: Warn when GPU doesn't idle fast enough
> > =

> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 26 ++++++++++++++++++++++----
> >  drivers/gpu/drm/etnaviv/state_hi.xml.h |  7 +++++++
> >  2 files changed, 29 insertions(+), 4 deletions(-)
> > =

> =

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
