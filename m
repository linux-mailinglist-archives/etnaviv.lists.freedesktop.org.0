Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DA4151876
	for <lists+etnaviv@lfdr.de>; Tue,  4 Feb 2020 11:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67706E5C8;
	Tue,  4 Feb 2020 10:06:37 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B3A6E5C8
 for <etnaviv@lists.freedesktop.org>; Tue,  4 Feb 2020 10:06:36 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1iyv6I-0001v5-M2; Tue, 04 Feb 2020 11:06:34 +0100
Message-ID: <a9190db5357dcff46fb2e2d1061061e57992115c.camel@pengutronix.de>
Subject: Re: Vivante GC7000UL
From: Lucas Stach <l.stach@pengutronix.de>
To: nanaki89 <nanaki89@hotmail.fr>, etnaviv@lists.freedesktop.org
Date: Tue, 04 Feb 2020 11:06:34 +0100
In-Reply-To: <VI1PR07MB39979776FF3B325DE5A69413B9090@VI1PR07MB3997.eurprd07.prod.outlook.com>
References: <VI1PR07MB39979776FF3B325DE5A69413B9090@VI1PR07MB3997.eurprd07.prod.outlook.com>
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

Hi,

On Sa, 2020-01-25 at 18:28 +0100, nanaki89 wrote:
> Hi,
> 
> I'm building android for an old device, samsung galaxy grand prime 
> (grandprimevelte), mainly to play with it rather than making it usable 
> again, its old and slow.
> 
> I was looking for some Vivante kernel driver and it appears this device 
> uses a SoC Marvell PXA1908 and a GPU Vivante GC7000UL, do you think the 
> etnaviv could be used on this device ?

I see no reason why etnaviv wouldn't work on this GPU. You may need a
kernel HWDB entry for this specific GPU, as the newer GPUs seem to
provide some incorrect info in the feature registers. Other than that,
things might just work.

Regards,
Lucas

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
