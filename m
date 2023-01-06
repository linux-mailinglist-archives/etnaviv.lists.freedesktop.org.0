Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EA8660773
	for <lists+etnaviv@lfdr.de>; Fri,  6 Jan 2023 20:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F58110E8D4;
	Fri,  6 Jan 2023 19:54:51 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9DB10E8D4
 for <etnaviv@lists.freedesktop.org>; Fri,  6 Jan 2023 19:54:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r2so2256793wrv.7
 for <etnaviv@lists.freedesktop.org>; Fri, 06 Jan 2023 11:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UdTJkOBXcCkLftLc+pQ5NTN4WFWIGu0wm8XHj4yqSYU=;
 b=AHemXy1MF2QGcr+FcK28C2P3kyG10cenBEPd9yQJhqSb7J6QUGHxFdkXKd9CNEykTA
 BMuLR5/yvb8l4QdJvmx0Epb5bMK5THtuRZIcsNOmUs4VAN2cmuEUWGPBCWqeoZWCvuQs
 CAdio0xzyMNKnJWFsJ2cA2d/abp2t0kIII1b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UdTJkOBXcCkLftLc+pQ5NTN4WFWIGu0wm8XHj4yqSYU=;
 b=y0q/A1/HlcE8ukyV2WZVKmrlu+2ptGwAlNK2Fgtdr+PI+P6oJkV3LPGuVRIBfG6SfE
 l2XF5GkoSEj7yPWzdnvueNA5trGZaSQTj5vXy8NwRhEtp/lPEtZ/Yzz4R36blhhIjN6t
 jbxohgiZZwHVaX/ylXrBeS5a49uYsXt2WqrXKkgY00TsdJL4UD/hESeDKt8qbyKlpjUx
 nx4RjKQWJZ0dG7gqhM5mm3n19ie5hwJ45buyVqpITMuvLlbX3mvndCBHQYfW93LujGr+
 I05jGRplz8I5HXLpsaV1S6qdtWuo5GzVhYdoaxiTAoR6ABGRLLb8pS/mR6ZNThnXYW4v
 Wskg==
X-Gm-Message-State: AFqh2kot1N+vxjNALbzEPq/L9dlpeqoh+Zd7bAKmdc7uWXQJKwRDkUZw
 AG7oSr+XjZhAYPvFy8yGCnibOA==
X-Google-Smtp-Source: AMrXdXvJMFXkKw/BFxl7hm/6TuBNTOklsHNzkYAIGkk6eFaSgZ1kgvPsJmPD31/1sKHiPBwSTU+Kmg==
X-Received: by 2002:adf:f24c:0:b0:250:cbfb:688e with SMTP id
 b12-20020adff24c000000b00250cbfb688emr40295994wrp.42.1673034887979; 
 Fri, 06 Jan 2023 11:54:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adff642000000b002a01e64f7a1sm2052766wrp.88.2023.01.06.11.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 11:54:47 -0800 (PST)
Date: Fri, 6 Jan 2023 20:54:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 5/9] drm/arc: use new debugfs device-centered functions
Message-ID: <Y7h8hBfWZd2Ka4OP@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, noralf@tronnes.org,
 Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Emma Anholt <emma@anholt.net>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Tomi Valkeinen <tomba@kernel.org>
References: <20221226155029.244355-1-mcanal@igalia.com>
 <20221226155029.244355-6-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226155029.244355-6-mcanal@igalia.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Tomi Valkeinen <tomba@kernel.org>, Emma Anholt <emma@anholt.net>,
 Alexey Brodkin <abrodkin@synopsys.com>, Chia-I Wu <olvaffe@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Christian Gmeiner <christian.gmeiner@gmail.com>,
 noralf@tronnes.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 David Airlie <airlied@gmail.com>, Brian Starkey <brian.starkey@arm.com>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Dec 26, 2022 at 12:50:25PM -0300, Ma�ra Canal wrote:
> Replace the use of drm_debugfs_create_files() with the new
> drm_debugfs_add_file() function, which center the debugfs files
> management on the drm_device instead of drm_minor. Moreover, remove the
> debugfs_init hook and add the debugfs files directly on arcpgu_probe(),
> before drm_dev_register().
> 
> Signed-off-by: Ma�ra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/tiny/arcpgu.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
> index 611bbee15071..b074a0b4c7b3 100644
> --- a/drivers/gpu/drm/tiny/arcpgu.c
> +++ b/drivers/gpu/drm/tiny/arcpgu.c
> @@ -338,8 +338,8 @@ static int arcpgu_unload(struct drm_device *drm)
>  #ifdef CONFIG_DEBUG_FS
>  static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
>  {
> -	struct drm_info_node *node = (struct drm_info_node *)m->private;
> -	struct drm_device *drm = node->minor->dev;
> +	struct drm_debugfs_entry *entry = m->private;
> +	struct drm_device *drm = entry->dev;
>  	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
>  	unsigned long clkrate = clk_get_rate(arcpgu->clk);
>  	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
> @@ -348,17 +348,6 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
>  	seq_printf(m, "mode: %lu\n", mode_clock);
>  	return 0;
>  }
> -
> -static struct drm_info_list arcpgu_debugfs_list[] = {
> -	{ "clocks", arcpgu_show_pxlclock, 0 },
> -};
> -
> -static void arcpgu_debugfs_init(struct drm_minor *minor)
> -{
> -	drm_debugfs_create_files(arcpgu_debugfs_list,
> -				 ARRAY_SIZE(arcpgu_debugfs_list),
> -				 minor->debugfs_root, minor);
> -}
>  #endif
>  
>  static const struct drm_driver arcpgu_drm_driver = {
> @@ -371,9 +360,6 @@ static const struct drm_driver arcpgu_drm_driver = {
>  	.patchlevel = 0,
>  	.fops = &arcpgu_drm_ops,
>  	DRM_GEM_DMA_DRIVER_OPS,
> -#ifdef CONFIG_DEBUG_FS
> -	.debugfs_init = arcpgu_debugfs_init,
> -#endif
>  };
>  
>  static int arcpgu_probe(struct platform_device *pdev)
> @@ -390,6 +376,10 @@ static int arcpgu_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +#ifdef CONFIG_DEBUG_FS
> +	drm_debugfs_add_file(&arcpgu->drm, "clocks", arcpgu_show_pxlclock, NULL);
> +#endif

A pure bikeshed, but I think it's cleaner to drop the #ifdef here and
above and mark the potentially unused functions as __maybe_unused.

With or without that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	ret = drm_dev_register(&arcpgu->drm, 0);
>  	if (ret)
>  		goto err_unload;
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
