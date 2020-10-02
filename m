Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9EE281016
	for <lists+etnaviv@lfdr.de>; Fri,  2 Oct 2020 11:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545E76E919;
	Fri,  2 Oct 2020 09:48:07 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8866E919
 for <etnaviv@lists.freedesktop.org>; Fri,  2 Oct 2020 09:48:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g4so1081219wrs.5
 for <etnaviv@lists.freedesktop.org>; Fri, 02 Oct 2020 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XBKf5rCOPo4NoQKS2bCbn6OHpqMgKghSnuzncLMaEsg=;
 b=NnPhOIiGXFfvJWiXpwMfYCrlYJj3jSqwhM3Fr7FAFgDtN8+LWpUPVsY9CPqHheoz3s
 duOjN3dl7KGdJpPoH/Rn+jfMpp1zUc3mpthUjoLgdoNEYm7Fr4xKD3gS0xfEr0+XOfv6
 XtSRuu65opavt6S+qKQAVPJTls41fPewz/rXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XBKf5rCOPo4NoQKS2bCbn6OHpqMgKghSnuzncLMaEsg=;
 b=NYW6Xdf/IeuMYkUYUdmwIveLPfeCQ+4R6SFQFJYzuiOMapfKqD6ohqjyAyOfQxau8p
 fwIdGgTqUb6xO1nHC6P4lIjGEpA6t50prWu83/BdHfpgxG71RVFBUEd9AKKJCQSS2LGJ
 w+yCI0H8OJ/CvRSiUBfXbphYsiLdvcegv2fEmyTG3X6R8BYNlw/XnOlhx1fBXkIFI8GK
 3P1MGod0bseUIWhD3e3+/PlhqcnkbdItiY/JEne1bFncyXDXPzKUZ8v0s4OsrDarmZex
 E8z8hEG2YRz2I0ZA8O+fkW1CsIEer9lMauEoCGC5HnYfskKWQ6aIse5gFyQlMqEdJ0ES
 7IMg==
X-Gm-Message-State: AOAM532CH4IfMF4xKH+PmTn+zpSd3Xm8aQQ7FdfFhwIB4Xng26fLSS69
 VZono1ZLXok58bqsnCpn/dAyRQ==
X-Google-Smtp-Source: ABdhPJwvtlXjY3abDVfehLG+NbtTw4ENbbSxjUqiw5J1WQgeZzduYuia7fGlp8u2Z6fywLN6MoeKFw==
X-Received: by 2002:adf:fed1:: with SMTP id q17mr1966851wrs.85.1601632084874; 
 Fri, 02 Oct 2020 02:48:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k8sm1015650wrl.42.2020.10.02.02.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 02:48:03 -0700 (PDT)
Date: Fri, 2 Oct 2020 11:48:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/7] drm/vram-helper: Remove invariant parameters from
 internal kmap function
Message-ID: <20201002094800.GG438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929151437.19717-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: luben.tuikov@amd.com, heiko@sntech.de, airlied@linux.ie,
 nouveau@lists.freedesktop.org, linus.walleij@linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 melissa.srw@gmail.com, eric@anholt.net, ray.huang@amd.com, kraxel@redhat.com,
 sam@ravnborg.org, sumit.semwal@linaro.org, emil.velikov@collabora.com,
 robh@kernel.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 lima@lists.freedesktop.org, oleksandr_andrushchenko@epam.com, krzk@kernel.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, kgene@kernel.org,
 bskeggs@redhat.com, linux+etnaviv@armlinux.org.uk,
 spice-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 maarten.lankhorst@linux.intel.com, etnaviv@lists.freedesktop.org,
 mripard@kernel.org, inki.dae@samsung.com, hdegoede@redhat.com,
 christian.gmeiner@gmail.com, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run, apaneers@amd.com,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, tomeu.vizoso@collabora.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, yuq825@gmail.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, linux-media@vger.kernel.org,
 christian.koenig@amd.com, l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 05:14:31PM +0200, Thomas Zimmermann wrote:
> The parameters map and is_iomem are always of the same value. Removed them
> to prepares the function for conversion to struct dma_buf_map.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 3fe4b326e18e..256b346664f2 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -382,16 +382,16 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
>  }
>  EXPORT_SYMBOL(drm_gem_vram_unpin);
>  
> -static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
> -				      bool map, bool *is_iomem)
> +static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo)
>  {
>  	int ret;
>  	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
> +	bool is_iomem;
>  
>  	if (gbo->kmap_use_count > 0)
>  		goto out;
>  
> -	if (kmap->virtual || !map)
> +	if (kmap->virtual)
>  		goto out;
>  
>  	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
> @@ -399,15 +399,10 @@ static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
>  		return ERR_PTR(ret);
>  
>  out:
> -	if (!kmap->virtual) {
> -		if (is_iomem)
> -			*is_iomem = false;
> +	if (!kmap->virtual)
>  		return NULL; /* not mapped; don't increment ref */
> -	}
>  	++gbo->kmap_use_count;
> -	if (is_iomem)
> -		return ttm_kmap_obj_virtual(kmap, is_iomem);
> -	return kmap->virtual;
> +	return ttm_kmap_obj_virtual(kmap, &is_iomem);
>  }
>  
>  static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
> @@ -452,7 +447,7 @@ void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
>  	ret = drm_gem_vram_pin_locked(gbo, 0);
>  	if (ret)
>  		goto err_ttm_bo_unreserve;
> -	base = drm_gem_vram_kmap_locked(gbo, true, NULL);
> +	base = drm_gem_vram_kmap_locked(gbo);
>  	if (IS_ERR(base)) {
>  		ret = PTR_ERR(base);
>  		goto err_drm_gem_vram_unpin_locked;
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
