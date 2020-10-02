Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313EA281A6C
	for <lists+etnaviv@lfdr.de>; Fri,  2 Oct 2020 20:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE566E9B1;
	Fri,  2 Oct 2020 18:05:07 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEE36E9B2
 for <etnaviv@lists.freedesktop.org>; Fri,  2 Oct 2020 18:05:06 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k15so2751237wrn.10
 for <etnaviv@lists.freedesktop.org>; Fri, 02 Oct 2020 11:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nAsVSdK/7E/mt3Oq7A35InRFZW35+phEzXg0tEKoM3E=;
 b=RoyUTHTN+MQaWVa1oL+ggEUiHJrt0jXB9juJNkrZmpVPsnzyomqBSiw9aTb98u4ct8
 4gbNx0B18lhFeinSoQ5/Lf/Is46husNbuW9r2SIYlaiPK/bXtSzrymO+4wWzaa+BZGKB
 Ka6gAP8r0jtntAFfHsdOUll3NCZPa58Wf2iq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nAsVSdK/7E/mt3Oq7A35InRFZW35+phEzXg0tEKoM3E=;
 b=qG55de0+xtnjb23KUwR5Fc2TFCntMcWvLZgMsW5CDhD5Xuy+fL0mNtwBxB4nX4IB8L
 lYbA2ziodZGquT0LUHQPjtsOn3wdc2L0aSW6Uo3O20pli+GblNZqsmIIeYAsndns3AYu
 xEfJn6L3XOVNH9gQ2kWdnjpjjHlJhNhoNGorUR586LfyUA1dzNsc7DLj9xVqQ0nDBm3g
 l/qvtTqCnQmm8meq1ykdEron4oh5rBc685BIT+ca0O7ODpzrXAsGgKvLY6dCzVtDs+6R
 47cafZwURsTrpE2pxGqbIMLM9ayVYE1SGtqPXRhFjeGNR2M13BLpNGRTzbFsrdJRmBwZ
 7OIQ==
X-Gm-Message-State: AOAM533Uu5WHBdkzPkDGi0tfC7APkLkmq1C3eLkv4m2ilNHPhF7wG3nv
 aqVjGFU9nPCRl7wv2Zpc6/20ww==
X-Google-Smtp-Source: ABdhPJz81eHAkz0Pqdl3fYidIh3cTsK0B1hmHy8AkNXaM5ryIfRr9H9pfts0XTgN4zmYd73luhZ50Q==
X-Received: by 2002:a5d:52ca:: with SMTP id r10mr4133433wrv.195.1601661904725; 
 Fri, 02 Oct 2020 11:05:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c16sm2793734wrx.31.2020.10.02.11.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:05:03 -0700 (PDT)
Date: Fri, 2 Oct 2020 20:05:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 6/7] drm/fb_helper: Support framebuffers in I/O memory
Message-ID: <20201002180500.GM438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929151437.19717-7-tzimmermann@suse.de>
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

On Tue, Sep 29, 2020 at 05:14:36PM +0200, Thomas Zimmermann wrote:
> At least sparc64 requires I/O-specific access to framebuffers. This
> patch updates the fbdev console accordingly.
> 
> For drivers with direct access to the framebuffer memory, the callback
> functions in struct fb_ops test for the type of memory and call the rsp
> fb_sys_ of fb_cfb_ functions.
> 
> For drivers that employ a shadow buffer, fbdev's blit function retrieves
> the framebuffer address as struct dma_buf_map, and uses dma_buf_map
> interfaces to access the buffer.
> 
> The bochs driver on sparc64 uses a workaround to flag the framebuffer as
> I/O memory and avoid a HW exception. With the introduction of struct
> dma_buf_map, this is not required any longer. The patch removes the rsp
> code from both, bochs and fbdev.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/bochs/bochs_kms.c |   1 -
>  drivers/gpu/drm/drm_fb_helper.c   | 217 ++++++++++++++++++++++++++++--
>  include/drm/drm_mode_config.h     |  12 --
>  include/linux/dma-buf-map.h       |  72 ++++++++--
>  4 files changed, 265 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index 13d0d04c4457..853081d186d5 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -151,7 +151,6 @@ int bochs_kms_init(struct bochs_device *bochs)
>  	bochs->dev->mode_config.preferred_depth = 24;
>  	bochs->dev->mode_config.prefer_shadow = 0;
>  	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
> -	bochs->dev->mode_config.fbdev_use_iomem = true;
>  	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
>  
>  	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 343a292f2c7c..f345a314a437 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -388,24 +388,22 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
>  }
>  
>  static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> -					  struct drm_clip_rect *clip)
> +					  struct drm_clip_rect *clip,
> +					  struct dma_buf_map *dst)
>  {
>  	struct drm_framebuffer *fb = fb_helper->fb;
>  	unsigned int cpp = fb->format->cpp[0];
>  	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
>  	void *src = fb_helper->fbdev->screen_buffer + offset;
> -	void *dst = fb_helper->buffer->map.vaddr + offset;
>  	size_t len = (clip->x2 - clip->x1) * cpp;
>  	unsigned int y;
>  
> -	for (y = clip->y1; y < clip->y2; y++) {
> -		if (!fb_helper->dev->mode_config.fbdev_use_iomem)
> -			memcpy(dst, src, len);
> -		else
> -			memcpy_toio((void __iomem *)dst, src, len);
> +	dma_buf_map_incr(dst, offset); /* go to first pixel within clip rect */
>  
> +	for (y = clip->y1; y < clip->y2; y++) {
> +		dma_buf_map_memcpy_to(dst, src, len);
> +		dma_buf_map_incr(dst, fb->pitches[0]);
>  		src += fb->pitches[0];
> -		dst += fb->pitches[0];
>  	}
>  }
>  
> @@ -433,8 +431,9 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
>  			ret = drm_client_buffer_vmap(helper->buffer, &map);
>  			if (ret)
>  				return;
> -			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
> +			drm_fb_helper_dirty_blit_real(helper, &clip_copy, &map);
>  		}
> +
>  		if (helper->fb->funcs->dirty)
>  			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
>  						 &clip_copy, 1);
> @@ -771,6 +770,136 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
>  }
>  EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
>  
> +static ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
> +				      size_t count, loff_t *ppos)
> +{
> +	unsigned long p = *ppos;
> +	u8 *dst;
> +	u8 __iomem *src;
> +	int c, err = 0;
> +	unsigned long total_size;
> +	unsigned long alloc_size;
> +	ssize_t ret = 0;
> +
> +	if (info->state != FBINFO_STATE_RUNNING)
> +		return -EPERM;
> +
> +	total_size = info->screen_size;
> +
> +	if (total_size == 0)
> +		total_size = info->fix.smem_len;
> +
> +	if (p >= total_size)
> +		return 0;
> +
> +	if (count >= total_size)
> +		count = total_size;
> +
> +	if (count + p > total_size)
> +		count = total_size - p;
> +
> +	src = (u8 __iomem *)(info->screen_base + p);
> +
> +	alloc_size = min(count, PAGE_SIZE);
> +
> +	dst = kmalloc(alloc_size, GFP_KERNEL);
> +	if (!dst)
> +		return -ENOMEM;
> +
> +	while (count) {
> +		c = min(count, alloc_size);
> +
> +		memcpy_fromio(dst, src, c);
> +		if (copy_to_user(buf, dst, c)) {
> +			err = -EFAULT;
> +			break;
> +		}
> +
> +		src += c;
> +		*ppos += c;
> +		buf += c;
> +		ret += c;
> +		count -= c;
> +	}
> +
> +	kfree(dst);
> +
> +	if (err)
> +		return err;
> +
> +	return ret;
> +}
> +
> +static ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
> +				       size_t count, loff_t *ppos)
> +{
> +	unsigned long p = *ppos;
> +	u8 *src;
> +	u8 __iomem *dst;
> +	int c, err = 0;
> +	unsigned long total_size;
> +	unsigned long alloc_size;
> +	ssize_t ret = 0;
> +
> +	if (info->state != FBINFO_STATE_RUNNING)
> +		return -EPERM;
> +
> +	total_size = info->screen_size;
> +
> +	if (total_size == 0)
> +		total_size = info->fix.smem_len;
> +
> +	if (p > total_size)
> +		return -EFBIG;
> +
> +	if (count > total_size) {
> +		err = -EFBIG;
> +		count = total_size;
> +	}
> +
> +	if (count + p > total_size) {
> +		/*
> +		 * The framebuffer is too small. We do the
> +		 * copy operation, but return an error code
> +		 * afterwards. Taken from fbdev.
> +		 */
> +		if (!err)
> +			err = -ENOSPC;
> +		count = total_size - p;
> +	}
> +
> +	alloc_size = min(count, PAGE_SIZE);
> +
> +	src = kmalloc(alloc_size, GFP_KERNEL);
> +	if (!src)
> +		return -ENOMEM;
> +
> +	dst = (u8 __iomem *)(info->screen_base + p);
> +
> +	while (count) {
> +		c = min(count, alloc_size);
> +
> +		if (copy_from_user(src, buf, c)) {
> +			err = -EFAULT;
> +			break;
> +		}
> +		memcpy_toio(dst, src, c);
> +
> +		dst += c;
> +		*ppos += c;
> +		buf += c;
> +		ret += c;
> +		count -= c;
> +	}
> +
> +	kfree(src);
> +
> +	if (err)
> +		return err;
> +
> +	return ret;
> +}
> +
>  /**
>   * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
>   * @info: fbdev registered by the helper
> @@ -2043,6 +2172,66 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  		return -ENODEV;
>  }
>  
> +static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
> +				 size_t count, loff_t *ppos)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> +
> +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> +		return drm_fb_helper_sys_read(info, buf, count, ppos);
> +	else
> +		return drm_fb_helper_cfb_read(info, buf, count, ppos);
> +}
> +
> +static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
> +				  size_t count, loff_t *ppos)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> +
> +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> +		return drm_fb_helper_sys_write(info, buf, count, ppos);
> +	else
> +		return drm_fb_helper_cfb_write(info, buf, count, ppos);
> +}
> +
> +static void drm_fbdev_fb_fillrect(struct fb_info *info,
> +				  const struct fb_fillrect *rect)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> +
> +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> +		drm_fb_helper_sys_fillrect(info, rect);
> +	else
> +		drm_fb_helper_cfb_fillrect(info, rect);
> +}
> +
> +static void drm_fbdev_fb_copyarea(struct fb_info *info,
> +				  const struct fb_copyarea *area)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> +
> +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> +		drm_fb_helper_sys_copyarea(info, area);
> +	else
> +		drm_fb_helper_cfb_copyarea(info, area);
> +}
> +
> +static void drm_fbdev_fb_imageblit(struct fb_info *info,
> +				   const struct fb_image *image)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> +
> +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> +		drm_fb_helper_sys_imageblit(info, image);
> +	else
> +		drm_fb_helper_cfb_imageblit(info, image);
> +}

I think a todo to make the new generic functions the real ones, and
drivers not using the sys/cfb ones anymore would be a good addition.

> +
>  static const struct fb_ops drm_fbdev_fb_ops = {
>  	.owner		= THIS_MODULE,
>  	DRM_FB_HELPER_DEFAULT_OPS,
> @@ -2050,11 +2239,11 @@ static const struct fb_ops drm_fbdev_fb_ops = {
>  	.fb_release	= drm_fbdev_fb_release,
>  	.fb_destroy	= drm_fbdev_fb_destroy,
>  	.fb_mmap	= drm_fbdev_fb_mmap,
> -	.fb_read	= drm_fb_helper_sys_read,
> -	.fb_write	= drm_fb_helper_sys_write,
> -	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> -	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> -	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> +	.fb_read	= drm_fbdev_fb_read,
> +	.fb_write	= drm_fbdev_fb_write,
> +	.fb_fillrect	= drm_fbdev_fb_fillrect,
> +	.fb_copyarea	= drm_fbdev_fb_copyarea,
> +	.fb_imageblit	= drm_fbdev_fb_imageblit,
>  };
>  
>  static struct fb_deferred_io drm_fbdev_defio = {
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 5ffbb4ed5b35..ab424ddd7665 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -877,18 +877,6 @@ struct drm_mode_config {
>  	 */
>  	bool prefer_shadow_fbdev;
>  
> -	/**
> -	 * @fbdev_use_iomem:
> -	 *
> -	 * Set to true if framebuffer reside in iomem.
> -	 * When set to true memcpy_toio() is used when copying the framebuffer in
> -	 * drm_fb_helper.drm_fb_helper_dirty_blit_real().
> -	 *
> -	 * FIXME: This should be replaced with a per-mapping is_iomem
> -	 * flag (like ttm does), and then used everywhere in fbdev code.
> -	 */
> -	bool fbdev_use_iomem;
> -
>  	/**
>  	 * @quirk_addfb_prefer_xbgr_30bpp:
>  	 *
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h

I think the below should be split out as a prep patch.

> index 2e8bbecb5091..6ca0f304dda2 100644
> --- a/include/linux/dma-buf-map.h
> +++ b/include/linux/dma-buf-map.h
> @@ -32,6 +32,14 @@
>   * accessing the buffer. Use the returned instance and the helper functions
>   * to access the buffer's memory in the correct way.
>   *
> + * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
> + * actually independent from the dma-buf infrastructure. When sharing buffers
> + * among devices, drivers have to know the location of the memory to access
> + * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
> + * solves this problem for dma-buf and its users. If other drivers or
> + * sub-systems require similar functionality, the type could be generalized
> + * and moved to a more prominent header file.
> + *
>   * Open-coding access to :c:type:`struct dma_buf_map <dma_buf_map>` is
>   * considered bad style. Rather then accessing its fields directly, use one
>   * of the provided helper functions, or implement your own. For example,
> @@ -51,6 +59,14 @@
>   *
>   *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>   *
> + * Instances of struct dma_buf_map do not have to be cleaned up, but
> + * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
> + * always refer to system memory.
> + *
> + * .. code-block:: c
> + *
> + *	dma_buf_map_clear(&map);
> + *
>   * Test if a mapping is valid with either dma_buf_map_is_set() or
>   * dma_buf_map_is_null().
>   *
> @@ -73,17 +89,19 @@
>   *	if (dma_buf_map_is_equal(&sys_map, &io_map))
>   *		// always false
>   *
> - * Instances of struct dma_buf_map do not have to be cleaned up, but
> - * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
> - * always refer to system memory.
> + * A set up instance of struct dma_buf_map can be used to access or manipulate
> + * the buffer memory. Depending on the location of the memory, the provided
> + * helpers will pick the correct operations. Data can be copied into the memory
> + * with dma_buf_map_memcpy_to(). The address can be manipulated with
> + * dma_buf_map_incr().
>   *
> - * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
> - * actually independent from the dma-buf infrastructure. When sharing buffers
> - * among devices, drivers have to know the location of the memory to access
> - * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
> - * solves this problem for dma-buf and its users. If other drivers or
> - * sub-systems require similar functionality, the type could be generalized
> - * and moved to a more prominent header file.
> + * .. code-block:: c
> + *
> + *	const void *src = ...; // source buffer
> + *	size_t len = ...; // length of src
> + *
> + *	dma_buf_map_memcpy_to(&map, src, len);
> + *	dma_buf_map_incr(&map, len); // go to first byte after the memcpy
>   */
>  
>  /**
> @@ -210,4 +228,38 @@ static inline void dma_buf_map_clear(struct dma_buf_map *map)
>  	}
>  }
>  
> +/**
> + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> + * @dst:	The dma-buf mapping structure
> + * @src:	The source buffer
> + * @len:	The number of byte in src
> + *
> + * Copies data into a dma-buf mapping. The source buffer is in system
> + * memory. Depending on the buffer's location, the helper picks the correct
> + * method of accessing the memory.
> + */
> +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
> +{
> +	if (dst->is_iomem)
> +		memcpy_toio(dst->vaddr_iomem, src, len);
> +	else
> +		memcpy(dst->vaddr, src, len);
> +}
> +
> +/**
> + * dma_buf_map_incr - Increments the address stored in a dma-buf mapping
> + * @map:	The dma-buf mapping structure
> + * @incr:	The number of bytes to increment
> + *
> + * Increments the address stored in a dma-buf mapping. Depending on the
> + * buffer's location, the correct value will be updated.
> + */
> +static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
> +{
> +	if (map->is_iomem)
> +		map->vaddr_iomem += incr;
> +	else
> +		map->vaddr += incr;
> +}
> +
>  #endif /* __DMA_BUF_MAP_H__ */
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
