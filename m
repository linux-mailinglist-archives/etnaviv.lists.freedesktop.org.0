Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BA91FCBAC
	for <lists+etnaviv@lfdr.de>; Wed, 17 Jun 2020 13:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B716E917;
	Wed, 17 Jun 2020 11:03:43 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from v6.sk (v6.sk [167.172.42.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BB66E917;
 Wed, 17 Jun 2020 11:03:42 +0000 (UTC)
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id AD621610B4;
 Wed, 17 Jun 2020 11:03:10 +0000 (UTC)
Date: Wed, 17 Jun 2020 13:03:08 +0200
From: Lubomir Rintel <lkundrak@v3.sk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v5 0/2] mfd: Add ENE KB3930 Embedded Controller driver
Message-ID: <20200617110308.GA1036641@furthur.local>
References: <20200616224404.994285-1-lkundrak@v3.sk>
 <6ce028567aead7e5270c7d62b4f201bc686c0b3e.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ce028567aead7e5270c7d62b4f201bc686c0b3e.camel@pengutronix.de>
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
Cc: linux-kernel@vger.kernel.org,
 Christian Geiner <christian.gmeiner@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 10:58:28AM +0200, Lucas Stach wrote:
> Hi Lubomir,
> 
> Am Mittwoch, den 17.06.2020, 00:44 +0200 schrieb Lubomir Rintel:
> > Hi,
> > 
> > please consider applying the patches chained to this message. It's the
> > fifth version of the driver for the ENE KB3930 Embedded Controller.
> > 
> > This version is essentially a resend of v4. The only actual change is the
> > addition of the Rob's Reviewed-by tag which I failed to do previously.
> > Detailed change logs are in the individual patch descriptions.
> 
> I don't think you wanted this to go to the etnaviv list and
> maintainers, right?

Indeed, a case of git send-email --embarass-yourself.

Sorry about that and thanks for letting me know.

Lubo
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
