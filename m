Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F12797C1
	for <lists+etnaviv@lfdr.de>; Sat, 26 Sep 2020 10:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581516E16F;
	Sat, 26 Sep 2020 08:08:49 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A036E08A
 for <etnaviv@lists.freedesktop.org>; Fri, 25 Sep 2020 18:57:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z4so4809065wrr.4
 for <etnaviv@lists.freedesktop.org>; Fri, 25 Sep 2020 11:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kt10/F2kcNigvJv3MHb/KIAmOU9k1DQ04CJDICU2o4s=;
 b=QTx6r5IlMJgqdfwJqok4Oloopf1e2dZXk3B0aDmwbL6ioYYkzCGrMSpDnP8j6NNV3l
 yBz4zT5KFJwmp5I9Db949916H/gFIZcgBe/1kzt/5tyHir7LeNSMfejEwXrKPMEOLkyg
 j1kARuv3rn07sUE3TxMaZtRIYj7ioUiQOKjyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kt10/F2kcNigvJv3MHb/KIAmOU9k1DQ04CJDICU2o4s=;
 b=EpQlv3rpPJxfJp4vWPr6ZsB/3UFSMqaap4LDtiuHRRLLhPXSeaese9/0UNuNmXiL1P
 9HUeZILUOUqZw2pJiBr8jm63NSesZ5ScBjpkT5EcU9r/COe8IBkocibr3KnG3+4z2xT/
 1aC6zf8RQ4BpxU+ANyyFhUTWGqlDinJ81ykQO7zVtmyu7v3+STj4Nqf4QSik0YKoSzoz
 f7U575i8h+IPM6fwWDKwRnojZQb/PpuUp4VGlC7dlxTsMbVZ9YlBYRYjStQCm53Iv0Xn
 ArEMHLK4v/Xf9DxyXAFOgi1ePoqB9Hq73oOLg+UMzJXjP+hzmoWT+YBEiP0zhZ047Dt6
 ikbw==
X-Gm-Message-State: AOAM533BCKGglEMMjWgl7hofhasZknWdQt6x2BAL1PLqc057TKuy8zKF
 ANBeXqF/oNABzusc1xnK0s5uew==
X-Google-Smtp-Source: ABdhPJwlnbyLQnA0JGmqU4U9R8tlABeEj0Cg/d1CLNatanhXkzrWE7eBAspLFZGWY/+anA8OvMidfQ==
X-Received: by 2002:adf:f5c1:: with SMTP id k1mr6445083wrp.271.1601060242019; 
 Fri, 25 Sep 2020 11:57:22 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com.
 [34.76.131.216])
 by smtp.gmail.com with ESMTPSA id p1sm25001wma.0.2020.09.25.11.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 11:57:21 -0700 (PDT)
Date: Fri, 25 Sep 2020 18:57:19 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
Message-ID: <20200925185719.GD3607091@chromium.org>
References: <20200925115601.23955-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925115601.23955-1-tzimmermann@suse.de>
X-Mailman-Approved-At: Sat, 26 Sep 2020 08:08:48 +0000
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
Cc: christian.koenig@amd.com, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, kraxel@redhat.com,
 benjamin.gaignard@linaro.org, sam@ravnborg.org, sumit.semwal@linaro.org,
 m.szyprowski@samsung.com, arnd@arndb.de, corbet@lwn.net,
 linux-doc@vger.kernel.org, jonathanh@nvidia.com, matthew.auld@intel.com,
 linux+etnaviv@armlinux.org.uk, labbott@redhat.com, linux-media@vger.kernel.org,
 pawel@osciak.com, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, etnaviv@lists.freedesktop.org,
 jani.nikula@linux.intel.com, linaro-mm-sig@lists.linaro.org,
 christian.gmeiner@gmail.com, thomas.hellstrom@intel.com,
 john.stultz@linaro.org, mripard@kernel.org, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
 lmark@codeaurora.org, afd@ti.com, kyungmin.park@samsung.com, daniel@ffwll.ch,
 robin.murphy@arm.com, Brian.Starkey@arm.com, l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Sep 25, 2020 at 01:55:57PM +0200, Thomas Zimmermann wrote:
> Dma-buf provides vmap() and vunmap() for retriving and releasing mappings
> of dma-buf memory in kernel address space. The functions operate with plain
> addresses and the assumption is that the memory can be accessed with load
> and store operations. This is not the case on some architectures (e.g.,
> sparc64) where I/O memory can only be accessed with dedicated instructions.
> 
> This patchset introduces struct dma_buf_map, which contains the address of
> a buffer and a flag that tells whether system- or I/O-memory instructions
> are required.
> 
> Some background: updating the DRM framebuffer console on sparc64 makes the
> kernel panic. This is because the framebuffer memory cannot be accessed with
> system-memory instructions. We currently employ a workaround in DRM to
> address this specific problem. [1]
> 
> To resolve the problem, we'd like to address it at the most common point,
> which is the dma-buf framework. The dma-buf mapping ideally knows if I/O
> instructions are required and exports this information to it's users. The
> new structure struct dma_buf_map stores the buffer address and a flag that
> signals I/O memory. Affected users of the buffer (e.g., drivers, frameworks)
> can then access the memory accordingly.
> 
> This patchset only introduces struct dma_buf_map, and updates struct dma_buf
> and it's interfaces. Further patches can update dma-buf users. For example,
> there's a prototype patchset for DRM that fixes the framebuffer problem. [2]
> 
> Further work: TTM, one of DRM's memory managers, already exports an
> is_iomem flag of its own. It could later be switched over to exporting struct
> dma_buf_map, thus simplifying some code. Several DRM drivers expect their
> fbdev console to operate on I/O memory. These could possibly be switched over
> to the generic fbdev emulation, as soon as the generic code uses struct
> dma_buf_map.
> 
> v3:
> 	* update fastrpc driver (kernel test robot)
> 	* expand documentation (Daniel)
> 	* move documentation into separate patch
> v2:
> 	* always clear map parameter in dma_buf_vmap() (Daniel)
> 	* include dma-buf-heaps and i915 selftests (kernel test robot)
> 	* initialize cma_obj before using it in drm_gem_cma_free_object()
> 	  (kernel test robot)
> 
> [1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg.org/
> [2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmermann@suse.de/
> 
> Thomas Zimmermann (4):
>   dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
>   dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
>   dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
>   dma-buf: Document struct dma_buf_map
> 
>  Documentation/driver-api/dma-buf.rst          |   9 +
>  drivers/dma-buf/dma-buf.c                     |  42 ++--
>  drivers/dma-buf/heaps/heap-helpers.c          |  10 +-
>  drivers/gpu/drm/drm_gem_cma_helper.c          |  20 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 +-
>  drivers/gpu/drm/drm_prime.c                   |  15 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 +-
>  .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |  14 +-
>  drivers/gpu/drm/tegra/gem.c                   |  23 ++-
>  .../common/videobuf2/videobuf2-dma-contig.c   |  17 +-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  19 +-
>  .../common/videobuf2/videobuf2-vmalloc.c      |  21 +-
>  drivers/misc/fastrpc.c                        |   6 +-
>  include/drm/drm_prime.h                       |   5 +-
>  include/linux/dma-buf-map.h                   | 193 ++++++++++++++++++
>  include/linux/dma-buf.h                       |  11 +-
>  18 files changed, 372 insertions(+), 94 deletions(-)
>  create mode 100644 include/linux/dma-buf-map.h

For drivers/media/common/videobuf2 changes:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
