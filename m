Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 860AB3D1871
	for <lists+etnaviv@lfdr.de>; Wed, 21 Jul 2021 22:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F28A6E3AA;
	Wed, 21 Jul 2021 20:54:44 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E606E3AA
 for <etnaviv@lists.freedesktop.org>; Wed, 21 Jul 2021 20:54:42 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1m6JEg-0006hs-Dm; Wed, 21 Jul 2021 22:54:34 +0200
Message-ID: <36057b25e939270c98d66fd24823b5edfa789d60.camel@pengutronix.de>
Subject: Re: [RESEND PATCH v6 07/14] drm/etnaviv: Change buffer dump checks
 to target syslog
From: Lucas Stach <l.stach@pengutronix.de>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 ppaalanen@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de,  airlied@linux.ie, daniel.vetter@ffwll.ch
Date: Wed, 21 Jul 2021 22:54:29 +0200
In-Reply-To: <20210721175526.22020-8-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-8-sean@poorly.run>
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, etnaviv@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Mittwoch, dem 21.07.2021 um 13:55 -0400 schrieb Sean Paul:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Since the logs protected by these checks specifically target syslog,
> use the new drm_debug_syslog_enabled() call to avoid triggering
> these prints when only trace is enabled.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Acked-by: Lucas Stach <l.stach@pengutronix.de>

> Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-8-sean@poorly.run #v5
> 
> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> index 76d38561c910..7713474800e8 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -353,7 +353,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
>  
>  	lockdep_assert_held(&gpu->lock);
>  
> -	if (drm_debug_enabled(DRM_UT_DRIVER))
> +	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
>  		etnaviv_buffer_dump(gpu, buffer, 0, 0x50);
>  
>  	link_target = etnaviv_cmdbuf_get_va(cmdbuf,
> @@ -509,13 +509,13 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
>  		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
>  		 + buffer->user_size - 4);
>  
> -	if (drm_debug_enabled(DRM_UT_DRIVER))
> +	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
>  		pr_info("stream link to 0x%08x @ 0x%08x %p\n",
>  			return_target,
>  			etnaviv_cmdbuf_get_va(cmdbuf, &gpu->mmu_context->cmdbuf_mapping),
>  			cmdbuf->vaddr);
>  
> -	if (drm_debug_enabled(DRM_UT_DRIVER)) {
> +	if (drm_debug_syslog_enabled(DRM_UT_DRIVER)) {
>  		print_hex_dump(KERN_INFO, "cmd ", DUMP_PREFIX_OFFSET, 16, 4,
>  			       cmdbuf->vaddr, cmdbuf->size, 0);
>  
> @@ -534,6 +534,6 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
>  				    VIV_FE_LINK_HEADER_PREFETCH(link_dwords),
>  				    link_target);
>  
> -	if (drm_debug_enabled(DRM_UT_DRIVER))
> +	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
>  		etnaviv_buffer_dump(gpu, buffer, 0, 0x50);
>  }


_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
