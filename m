Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE5D19BD4B
	for <lists+etnaviv@lfdr.de>; Thu,  2 Apr 2020 10:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB746EA01;
	Thu,  2 Apr 2020 08:06:27 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DC56E0C4;
 Mon, 30 Mar 2020 18:04:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 014EC804E5;
 Mon, 30 Mar 2020 20:04:45 +0200 (CEST)
Date: Mon, 30 Mar 2020 20:04:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH] Update my email address in various drivers
Message-ID: <20200330180444.GA16073@ravnborg.org>
References: <E1jIV26-0005X3-RS@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1jIV26-0005X3-RS@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=PHq6YzTAAAAA:8
 a=drOt6m5kAAAA:8 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8 a=fk1lIlRQAAAA:8
 a=e5mUnYsNAAAA:8 a=J_AMR1hbAAXD1OJ71a8A:9 a=pLlZParSi1_HdBrb:21
 a=f4gn02k5W12urO4c:21 a=CjuIK1q_8ugA:10 a=ZKzU8r6zoKMcqsNulkmm:22
 a=RMMjzBEyIzXRtoq5n5K6:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=U75ogvRika4pmaD_UPO0:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Mailman-Approved-At: Thu, 02 Apr 2020 08:06:26 +0000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-media@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 netdev@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Heiner Kallweit <hkallweit1@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Russell.

On Sun, Mar 29, 2020 at 11:19:10AM +0100, Russell King wrote:
> Globally update my email address in six files scattered through the
> tree.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/gpu/drm/armada/armada_drv.c                 | 2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c               | 2 +-
>  drivers/media/cec/cec-notifier.c                    | 2 +-
>  drivers/net/phy/swphy.c                             | 2 +-
>  include/media/cec-notifier.h                        | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

This changes all cases of:
   
   rmk+kernel@arm.linux.org.uk

to

  rmk+kernel@armlinux.org.uk or no mail address.

But I am confused.

The new address does not appear anywhere in MAINTAINERS and is used
only in three other files.

And there are a few other mail addresses that would reach you.
But no matter how confused I am the patch looks fine so:

Acked-by: Sam Ravnborg <sam@ravnborg.org>

And if the change is for private reaons then I do not have to know
anyway so feel free to ignore my confusion.

	Sam

> 
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index 3df2dacf4c94..5a82a12cd105 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -389,7 +389,7 @@ static void __exit armada_drm_exit(void)
>  }
>  module_exit(armada_drm_exit);
>  
> -MODULE_AUTHOR("Russell King <rmk+kernel@arm.linux.org.uk>");
> +MODULE_AUTHOR("Russell King <rmk+kernel@armlinux.org.uk>");
>  MODULE_DESCRIPTION("Armada DRM Driver");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:armada-drm");
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> index e8e3e9339ff9..f6f55776e43e 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> @@ -698,7 +698,7 @@ static struct platform_driver snd_dw_hdmi_driver = {
>  
>  module_platform_driver(snd_dw_hdmi_driver);
>  
> -MODULE_AUTHOR("Russell King <rmk+kernel@arm.linux.org.uk>");
> +MODULE_AUTHOR("Russell King <rmk+kernel@armlinux.org.uk>");
>  MODULE_DESCRIPTION("Synopsis Designware HDMI AHB ALSA interface");
>  MODULE_LICENSE("GPL v2");
>  MODULE_ALIAS("platform:" DRIVER_NAME);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 1f9c01be40d7..d6798f716b77 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -739,7 +739,7 @@ static void __exit etnaviv_exit(void)
>  module_exit(etnaviv_exit);
>  
>  MODULE_AUTHOR("Christian Gmeiner <christian.gmeiner@gmail.com>");
> -MODULE_AUTHOR("Russell King <rmk+kernel@arm.linux.org.uk>");
> +MODULE_AUTHOR("Russell King <rmk+kernel@armlinux.org.uk>");
>  MODULE_AUTHOR("Lucas Stach <l.stach@pengutronix.de>");
>  MODULE_DESCRIPTION("etnaviv DRM Driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
> index 7cf42b133dbc..2d4f7dd7cef7 100644
> --- a/drivers/media/cec/cec-notifier.c
> +++ b/drivers/media/cec/cec-notifier.c
> @@ -2,7 +2,7 @@
>  /*
>   * cec-notifier.c - notify CEC drivers of physical address changes
>   *
> - * Copyright 2016 Russell King <rmk+kernel@arm.linux.org.uk>
> + * Copyright 2016 Russell King.
>   * Copyright 2016-2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> diff --git a/drivers/net/phy/swphy.c b/drivers/net/phy/swphy.c
> index 53c214a22b95..774814714c82 100644
> --- a/drivers/net/phy/swphy.c
> +++ b/drivers/net/phy/swphy.c
> @@ -2,7 +2,7 @@
>  /*
>   * Software PHY emulation
>   *
> - * Code taken from fixed_phy.c by Russell King <rmk+kernel@arm.linux.org.uk>
> + * Code taken from fixed_phy.c by Russell King.
>   *
>   * Author: Vitaly Bordug <vbordug@ru.mvista.com>
>   *         Anton Vorontsov <avorontsov@ru.mvista.com>
> diff --git a/include/media/cec-notifier.h b/include/media/cec-notifier.h
> index 985afea1ee36..e2b1b894aae7 100644
> --- a/include/media/cec-notifier.h
> +++ b/include/media/cec-notifier.h
> @@ -2,7 +2,7 @@
>  /*
>   * cec-notifier.h - notify CEC drivers of physical address changes
>   *
> - * Copyright 2016 Russell King <rmk+kernel@arm.linux.org.uk>
> + * Copyright 2016 Russell King.
>   * Copyright 2016-2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
