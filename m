Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A77A59A049
	for <lists+etnaviv@lfdr.de>; Fri, 19 Aug 2022 18:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE1310E7E6;
	Fri, 19 Aug 2022 16:33:09 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B2310E708
 for <etnaviv@lists.freedesktop.org>; Fri, 19 Aug 2022 16:32:57 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oP4vV-0007Ko-EU; Fri, 19 Aug 2022 18:32:53 +0200
Message-ID: <fbc25d0455faf3f3a870388508747eb9271a4f4e.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Remove duplicate call to
 drm_gem_free_mmap_offset
From: Lucas Stach <l.stach@pengutronix.de>
To: "T.J. Mercier" <tjmercier@google.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Fri, 19 Aug 2022 18:32:51 +0200
In-Reply-To: <20220706182924.2563058-1-tjmercier@google.com>
References: <20220706182924.2563058-1-tjmercier@google.com>
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
 linux-kernel@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Mittwoch, dem 06.07.2022 um 18:29 +0000 schrieb T.J. Mercier:
> The docs explicitly say the drm_gem_object_release function already calls this,
> and this does not appear to be a prerequisite for the call to
> etnaviv_gem_ops.release.
> 
This looks correct to me. Patch applied to etnaviv/next.

Regards,
Lucas

> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index cc386f8a7116..ecb828e4e156 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -504,7 +504,6 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
>  		kfree(mapping);
>  	}
>  
> -	drm_gem_free_mmap_offset(obj);
>  	etnaviv_obj->ops->release(etnaviv_obj);
>  	drm_gem_object_release(obj);
>  


