Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F2163F707
	for <lists+etnaviv@lfdr.de>; Thu,  1 Dec 2022 19:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D232410E66E;
	Thu,  1 Dec 2022 18:01:28 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829FC10E66A
 for <etnaviv@lists.freedesktop.org>; Thu,  1 Dec 2022 18:01:22 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p0ns8-0002aO-Av; Thu, 01 Dec 2022 19:01:20 +0100
Message-ID: <948b6cb80a07f71b97fa950a6d15fa3b7db98754.camel@pengutronix.de>
Subject: Re: [PATCH v5 5/7] drm/etnaviv: Add nn_core_count to chip feature
 struct
From: Lucas Stach <l.stach@pengutronix.de>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Thu, 01 Dec 2022 19:01:18 +0100
In-Reply-To: <20221201103026.53234-6-tomeu.vizoso@collabora.com>
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
 <20221201103026.53234-6-tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
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
Cc: italonicola@collabora.com, "moderated list:DRM DRIVERS FOR VIVANTE GPU
 IP" <etnaviv@lists.freedesktop.org>, "open list:DRM DRIVERS FOR VIVANTE GPU
 IP" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Donnerstag, dem 01.12.2022 um 11:30 +0100 schrieb Tomeu Vizoso:
> We will use these for differentiating between GPUs and NPUs, as the
> downstream driver does.
> 
Thanks, patches 5-7 applied to my etnaviv/next branch.

Regards,
Lucas

> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 3 +++
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index 85eddd492774..c8f3ad2031ce 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -50,6 +50,9 @@ struct etnaviv_chip_identity {
>  	/* Number of shader cores. */
>  	u32 shader_core_count;
>  
> +	/* Number of Neural Network cores. */
> +	u32 nn_core_count;
> +
>  	/* Size of the vertex cache. */
>  	u32 vertex_cache_size;
>  
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> index f2fc645c7956..44df273a5aae 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> @@ -16,6 +16,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>  		.register_max = 64,
>  		.thread_count = 128,
>  		.shader_core_count = 1,
> +		.nn_core_count = 0,
>  		.vertex_cache_size = 8,
>  		.vertex_output_buffer_size = 1024,
>  		.pixel_pipes = 1,
> @@ -47,6 +48,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>  		.register_max = 64,
>  		.thread_count = 512,
>  		.shader_core_count = 2,
> +		.nn_core_count = 0,
>  		.vertex_cache_size = 16,
>  		.vertex_output_buffer_size = 1024,
>  		.pixel_pipes = 1,
> @@ -78,6 +80,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>  		.register_max = 64,
>  		.thread_count = 512,
>  		.shader_core_count = 2,
> +		.nn_core_count = 0,
>  		.vertex_cache_size = 16,
>  		.vertex_output_buffer_size = 1024,
>  		.pixel_pipes = 1,
> @@ -109,6 +112,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>  		.register_max = 64,
>  		.thread_count = 1024,
>  		.shader_core_count = 4,
> +		.nn_core_count = 0,
>  		.vertex_cache_size = 16,
>  		.vertex_output_buffer_size = 1024,
>  		.pixel_pipes = 2,


