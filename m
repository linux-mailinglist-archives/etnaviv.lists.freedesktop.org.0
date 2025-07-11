Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C65DB01962
	for <lists+etnaviv@lfdr.de>; Fri, 11 Jul 2025 12:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF5C10EA19;
	Fri, 11 Jul 2025 10:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="VRpov6S0";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC7510EA18
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 10:08:29 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-454cc6e987dso7457515e9.0
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 03:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752228508; x=1752833308; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tgqCaEUcHReYwP1+eVs6TgGyIVC7fVlC12ysVvFBg1c=;
 b=VRpov6S0moOxncl3ORnKAk1SDGBhs0pbd9O5u0iR2dur8k4Jar/21/BpbNzrMC3KKU
 9YU64j8pqK7Jr5jDy++3PGTa/zQUDn2fwQrQKZrTI44++IGjwzw+ftMXil+2ckxVqyPF
 1hj9Vq38Fx1z8iJ+HsA0WZ73BzzLLFDZlZKl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752228508; x=1752833308;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tgqCaEUcHReYwP1+eVs6TgGyIVC7fVlC12ysVvFBg1c=;
 b=AUWFF+ptXxvkjTWnHbCvtcM1Y2AkfY6JMuSyITfe10grj/ItkxUrZTGcT9Vwo/ghlZ
 C3vKrial7ZxtiiensFVfydumPaDd6VcouSQ9B9IMyA+upNRVVnqMSS6fr400y823P158
 1WBrY4fwVlG7TS705w5zi3JhHjRiRJiBIFfaN5ODMo3Z5ekjlqchYdJNjhTcEPQQAaed
 XqMziRnkEpNUUEfLxja6NKgdSwmWIgtCjInjZVgQ2VejMat6Eac9O6EQdOtoFqBa1j0s
 cO4YVLNy1p/HpOBZCceZTHJUf6QztbKBhITMrRVmJ35pV7fAppax/Xm2/VlzrRn7tjjM
 N5HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMEd0dwE3zaGqd7/33BKh3iiOT2ypwMh8mfEN4cR2k1uW3J8fZnlwxqPwnvBXNY3KK0dxEOIh6@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7uYW8SXBch3QzIRT/g1mA2qL4+WnLl8J+Lupipbz4L5jZqBJH
 jwQoEJ15O6ftFspztFCcLwnZOG7iTmk5W7Fj4EXQhermdpk8U0x06M4oVJOgI8Uylyo=
X-Gm-Gg: ASbGnctM+pwxU781sqTxS6UwyC2tRu7/5elKf+Tt9zdeM3EDPFP9ppzzW/YA1PDRcS7
 NWz+5KiZVTJZ0ZFF+iAn3ncDbqPDwepWMtgVUccwXbkbjsH9Jr04gBvFks/PThe1Lh3aHF3V0Uu
 HyeP1/mi31HewdiEbWx8xx0kzyUYQS7m8OX2EHBZ08/1DPEyGH/5gk2AhvV8Hb7xmwm+86c0/yF
 Mp0Qoa2HEdRs8pVqgjWIf8lD0OdBZ09gC3uBBfMPBSDPhsA/1ncQ3VjfH5xhL6rND2KrVubFEXo
 Kx4+47ud5H4nzy7PDnJqxiXVner0B6sspH+3+6pb65q2uyMe39Ij7kiurwjLRUyF3mJbUPofNA9
 lgZPBR0oOBmuB7S2CEx8Ea7s6GJMowudOQA==
X-Google-Smtp-Source: AGHT+IFhCZJ47IcyOYT/ucI3ECEF+Ab1sZvRV6pgr8844GO4AhYos7iyzZjZjDJLFfEkY94fWChkcA==
X-Received: by 2002:a05:600c:a31b:b0:455:efd7:17dc with SMTP id
 5b1f17b1804b1-455efd7194cmr5606095e9.11.1752228507556; 
 Fri, 11 Jul 2025 03:08:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5f32ed100sm1238699f8f.0.2025.07.11.03.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:08:27 -0700 (PDT)
Date: Fri, 11 Jul 2025 12:08:25 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com,
 torvalds@linux-foundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, kraxel@redhat.com,
 christian.gmeiner@gmail.com, dmitry.osipenko@collabora.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/9] Revert "drm/gem: Acquire references on GEM handles
 for framebuffers"
Message-ID: <aHDimRgOz3VPMw0I@phenom.ffwll.local>
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <20250711093744.120962-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711093744.120962-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Fri, Jul 11, 2025 at 11:35:17AM +0200, Thomas Zimmermann wrote:
> This reverts commit 5307dce878d4126e1b375587318955bd019c3741.
> 
> We're going to revert the dma-buf handle back to separating dma_buf
> and import_attach->dmabuf in struct drm_gem_object. Hence revert this
> fix for it.

I think we should add my reasons from the private thread here why I think
this is conceptually wrong:

handle_count is an uapi reference, and should have nothing to do with the
lifetime and consistency of the underlying gem_bo. And for imported bo the
link to the dma-buf really should be invariant, and hence
drm_gem_object_get/put() enough. The fact that this patch seems to have
helped at least in some cases indicates that our assumption that we can
replace gem_bo->import_attach.dmabuf with gem_bo->dma_buf was wrong,
because pretty obviously the latter can become NULL while the gem_bo is
still alive. Which means this was conceptually wrong and at best helped
hide a race condition somewhere.

This means that unlike the claim in the reverted commit that 1a148af06000
("drm/gem-shmem: Use dma_buf from GEM object instance") started triggering
an existing condition the much more likely explanation is that it
introduced the regression itself. And hence we need to revert this entire
chain of commits.

I'll also add all the Fixes: lines as needed when merging these to
drm-fixes, since some of the patches reverted in this series have landed
in 6.15 already.

I plan to merge them all to drm-fixes once intel-gfx-ci has approved it
all.

Thanks, Sima

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem.c                    | 44 ++------------------
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++---
>  drivers/gpu/drm/drm_internal.h               |  2 -
>  3 files changed, 11 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 3a99e4a5d303..db44c40e307f 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -213,35 +213,6 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
>  }
>  EXPORT_SYMBOL(drm_gem_private_object_fini);
>  
> -static void drm_gem_object_handle_get(struct drm_gem_object *obj)
> -{
> -	struct drm_device *dev = obj->dev;
> -
> -	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
> -
> -	if (obj->handle_count++ == 0)
> -		drm_gem_object_get(obj);
> -}
> -
> -/**
> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
> - * @obj: GEM object
> - *
> - * Acquires a reference on the GEM buffer object's handle. Required
> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
> - * to release the reference.
> - */
> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
> -{
> -	struct drm_device *dev = obj->dev;
> -
> -	guard(mutex)(&dev->object_name_lock);
> -
> -	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
> -	drm_gem_object_handle_get(obj);
> -}
> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
> -
>  /**
>   * drm_gem_object_handle_free - release resources bound to userspace handles
>   * @obj: GEM object to clean up.
> @@ -272,14 +243,8 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>  	}
>  }
>  
> -/**
> - * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
> - * @obj: GEM object
> - *
> - * Releases a reference on the GEM buffer object's handle. Possibly releases
> - * the GEM buffer object and associated dma-buf objects.
> - */
> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> +static void
> +drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  {
>  	struct drm_device *dev = obj->dev;
>  	bool final = false;
> @@ -304,7 +269,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  	if (final)
>  		drm_gem_object_put(obj);
>  }
> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>  
>  /*
>   * Called at device or object close to release the file's
> @@ -429,8 +393,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>  	int ret;
>  
>  	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
> -
> -	drm_gem_object_handle_get(obj);
> +	if (obj->handle_count++ == 0)
> +		drm_gem_object_get(obj);
>  
>  	/*
>  	 * Get the user-visible handle using idr.  Preload and perform
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index c60d0044d036..618ce725cd75 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>  	unsigned int i;
>  
>  	for (i = 0; i < fb->format->num_planes; i++)
> -		drm_gem_object_handle_put_unlocked(fb->obj[i]);
> +		drm_gem_object_put(fb->obj[i]);
>  
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
> @@ -183,10 +183,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  		if (!objs[i]) {
>  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>  			ret = -ENOENT;
> -			goto err_gem_object_handle_put_unlocked;
> +			goto err_gem_object_put;
>  		}
> -		drm_gem_object_handle_get_unlocked(objs[i]);
> -		drm_gem_object_put(objs[i]);
>  
>  		min_size = (height - 1) * mode_cmd->pitches[i]
>  			 + drm_format_info_min_pitch(info, i, width)
> @@ -196,22 +194,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			drm_dbg_kms(dev,
>  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>  				    objs[i]->size, min_size, i);
> -			drm_gem_object_handle_put_unlocked(objs[i]);
> +			drm_gem_object_put(objs[i]);
>  			ret = -EINVAL;
> -			goto err_gem_object_handle_put_unlocked;
> +			goto err_gem_object_put;
>  		}
>  	}
>  
>  	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>  	if (ret)
> -		goto err_gem_object_handle_put_unlocked;
> +		goto err_gem_object_put;
>  
>  	return 0;
>  
> -err_gem_object_handle_put_unlocked:
> +err_gem_object_put:
>  	while (i > 0) {
>  		--i;
> -		drm_gem_object_handle_put_unlocked(objs[i]);
> +		drm_gem_object_put(objs[i]);
>  	}
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index f921cc73f8b8..9078504e789c 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -161,8 +161,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>  
>  /* drm_gem.c */
>  int drm_gem_init(struct drm_device *dev);
> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			       struct drm_gem_object *obj,
>  			       u32 *handlep);
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
