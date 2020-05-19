Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CAA1D989D
	for <lists+etnaviv@lfdr.de>; Tue, 19 May 2020 15:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81326E061;
	Tue, 19 May 2020 13:53:25 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86786E2F2
 for <etnaviv@lists.freedesktop.org>; Tue, 19 May 2020 10:49:51 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jazoU-00061m-TM; Tue, 19 May 2020 12:49:34 +0200
Message-ID: <20aa90bd9004e24d6e79968fa03a97d2030bf013.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Fix a leak in submit_pin_objects()
From: Lucas Stach <l.stach@pengutronix.de>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 May 2020 12:49:33 +0200
In-Reply-To: <20200518112955.GA48709@mwanda>
References: <20200518112955.GA48709@mwanda>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 19 May 2020 13:53:24 +0000
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 kernel-janitors@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Montag, den 18.05.2020, 14:29 +0300 schrieb Dan Carpenter:
> If the mapping address is wrong then we have to release the reference to
> it before returning -EINVAL.
> 
> Fixes: 088880ddc0b2 ("drm/etnaviv: implement softpin")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to etnaviv/fixes.

Regards,
Lucas

> ---
> From static analysis.  Untested.
> 
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 3b0afa156d92..54def341c1db 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -238,8 +238,10 @@ static int submit_pin_objects(struct etnaviv_gem_submit *submit)
>  		}
>  
>  		if ((submit->flags & ETNA_SUBMIT_SOFTPIN) &&
> -		     submit->bos[i].va != mapping->iova)
> +		     submit->bos[i].va != mapping->iova) {
> +			etnaviv_gem_mapping_unreference(mapping);
>  			return -EINVAL;
> +		}
>  
>  		atomic_inc(&etnaviv_obj->gpu_active);
>  

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
