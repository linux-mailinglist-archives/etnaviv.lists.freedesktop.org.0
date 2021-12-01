Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35D9464DE1
	for <lists+etnaviv@lfdr.de>; Wed,  1 Dec 2021 13:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7126E5A1;
	Wed,  1 Dec 2021 12:29:38 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0D16E5A1
 for <etnaviv@lists.freedesktop.org>; Wed,  1 Dec 2021 12:29:37 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1msOju-00012c-Ll; Wed, 01 Dec 2021 13:29:34 +0100
Message-ID: <1b03b591d51250d5049028e93c1a54ef7f28aeae.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/3] drm/etnaviv: IOMMU related fixes
From: Lucas Stach <l.stach@pengutronix.de>
To: Michael Walle <michael@walle.cc>, Robin Murphy <robin.murphy@arm.com>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 01 Dec 2021 13:29:31 +0100
In-Reply-To: <20210907164945.2309815-1-michael@walle.cc>
References: <20210907164945.2309815-1-michael@walle.cc>
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
Cc: David Airlie <airlied@linux.ie>, Marek Vasut <marek.vasut@gmail.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 "Lukas F . Hartmann" <lukas@mntre.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Michael,

Am Dienstag, dem 07.09.2021 um 18:49 +0200 schrieb Michael Walle:
> This patch series fixes usage of the etnaviv driver with GPUs behind a
> IOMMU. It was tested on a NXP LS1028A SoC. Together with Lucas' MMU patches
> [1] there are not more (GPU internal) MMU nor (system) IOMMU faults on the
> LS1028A.
> 
> [1] https://lists.freedesktop.org/archives/etnaviv/2021-August/003682.html
> 
> changes since v1:
>  - don't move the former dma_mask setup code around in patch 2/3. Will
>    avoid any confusion.
> 
> Michael Walle (3):
>   drm/etnaviv: use PLATFORM_DEVID_NONE
>   drm/etnaviv: fix dma configuration of the virtual device
>   drm/etnaviv: use a 32 bit mask as coherent DMA mask
> 
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 41 ++++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 10 deletions(-)
> 
Thanks for the patches! I applied them to my etnaviv/next branch.

Regards,
Lucas

