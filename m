Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ACD2744A1
	for <lists+etnaviv@lfdr.de>; Tue, 22 Sep 2020 16:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7716E894;
	Tue, 22 Sep 2020 14:45:38 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A9E6E48E
 for <etnaviv@lists.freedesktop.org>; Fri, 18 Sep 2020 08:32:26 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id n25so4395798ljj.4
 for <etnaviv@lists.freedesktop.org>; Fri, 18 Sep 2020 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w66Tq3M5Jv+dNDw02sW2Tkz4nD4jpprbI+woSmcafcU=;
 b=JTjYIxSWD1+WCEkFoVdIJYTdxgpTUDEhCbSHp9PCxP1BP5+i31lH1smhIsHl6yADs2
 qsP0TQtfuxOhldW92XNclrotrrFV4fR5LWrQHolT6lCm2SYDScFnCGbuQUVndsotr6wU
 j3OToQ1v5J7c/6DYlyYMpNx+dIW4kvcSPvAuKoEKWesQnb70EqS4z8KSxEu3k2jIUMzD
 wg2eOQHxyoJQTopZpHDRXhEvxZH+i1EcNrIwrRbizdDKi52Czwh0jk6X0E4ySwApHUm1
 PLKSOHyX8n/v4JxF9x7LfThGIZlmfkHCyCg/NMWoIjk+j/YSW37M3weKLkp7xnTLvNtO
 CstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w66Tq3M5Jv+dNDw02sW2Tkz4nD4jpprbI+woSmcafcU=;
 b=uSiI3HQkuNlxajmlq7oaBaCCaEuO4uTQF3QKfSeyDngz6wazb5smDFGMAumD+iGnAI
 wMpf475uutOJrl4C1TPUOGQk/IgGrW7PdJBATOVoDeLC+cq67Tj2g7mX9L2+GiXWjMxw
 dsL8K4Xan+p82IzljEOLV4tq4Z/05s/+EXaxSOUO7jZsa6SJ01you3yamDNJERuYQURn
 V2aUg0Y8Sou7ejm5tJBegRqEJv01h1EhIHczzFcZp1Vruk7sdYlWsVnHFSea8/zloNBZ
 3KDrDPbYoXsU3CkO4fQwnvn8no1ht4mZiAgDL+5GM1GS29xR7znyov+2GFz8SfUZvvy6
 zRDg==
X-Gm-Message-State: AOAM531QTGD4eRJcH2UO7E9t2dlpG+wxLDiOyq4u5SNTh+IDYbbHgzaD
 tMFzWjhiWbHOkECrWkVmje5nLKfe8XodjXClIJmBmg==
X-Google-Smtp-Source: ABdhPJyQMlwb2QvzUphB9dKx4ikJo1Xr5baZSctpwqcXUKodxQKjBvpLueugGJmTcc5HR/Bao0+/pa1BGErKqWf9wxw=
X-Received: by 2002:a2e:9496:: with SMTP id c22mr10460561ljh.249.1600417944360; 
 Fri, 18 Sep 2020 01:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <CAO_48GGUiVbWBWdzDYWAH2N9Lp2AU+-78BcYyi-3+LXHM74JQA@mail.gmail.com>
In-Reply-To: <CAO_48GGUiVbWBWdzDYWAH2N9Lp2AU+-78BcYyi-3+LXHM74JQA@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 18 Sep 2020 14:02:13 +0530
Message-ID: <CAO_48GFU0w-rOG1cwpdoK5mEJeUe=uH6FFzYV_5xEcpjjq11NA@mail.gmail.com>
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Approved-At: Tue, 22 Sep 2020 14:45:35 +0000
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
Cc: Christian Koenig <christian.koenig@amd.com>, Dave Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 mark.cave-ayland@ilande.co.uk,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 sparclinux@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, jonathanh@nvidia.com,
 matthew.auld@intel.com, Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Pawel Osciak <pawel@osciak.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 etnaviv@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, thomas.hellstrom@intel.com,
 Maxime Ripard <mripard@kernel.org>, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, "David S . Miller" <davem@davemloft.net>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, 18 Sep 2020 at 11:36, Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> Hello Thomas,
>
> On Mon, 14 Sep 2020 at 16:55, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Dma-buf provides vmap() and vunmap() for retrieving and releasing mappings
> > of dma-buf memory in kernel address space. The functions operate with plain
> > addresses and the assumption is that the memory can be accessed with load
> > and store operations. This is not the case on some architectures (e.g.,
> > sparc64) where I/O memory can only be accessed with dedicated instructions.
> >
> > This patchset introduces struct dma_buf_map, which contains the address of
> > a buffer and a flag that tells whether system- or I/O-memory instructions
> > are required.
>
> Thank you for the patchset - it is a really nice, clean bit to add!
> >
> > Some background: updating the DRM framebuffer console on sparc64 makes the
> > kernel panic. This is because the framebuffer memory cannot be accessed with
> > system-memory instructions. We currently employ a workaround in DRM to
> > address this specific problem. [1]
> >
> > To resolve the problem, we'd like to address it at the most common point,
> > which is the dma-buf framework. The dma-buf mapping ideally knows if I/O
> > instructions are required and exports this information to it's users. The
> > new structure struct dma_buf_map stores the buffer address and a flag that
> > signals I/O memory. Affected users of the buffer (e.g., drivers, frameworks)
> > can then access the memory accordingly.
> >
> > This patchset only introduces struct dma_buf_map, and updates struct dma_buf
> > and it's interfaces. Further patches can update dma-buf users. For example,
> > there's a prototype patchset for DRM that fixes the framebuffer problem. [2]
> >
> > Further work: TTM, one of DRM's memory managers, already exports an
> > is_iomem flag of its own. It could later be switched over to exporting struct
> > dma_buf_map, thus simplifying some code. Several DRM drivers expect their
> > fbdev console to operate on I/O memory. These could possibly be switched over
> > to the generic fbdev emulation, as soon as the generic code uses struct
> > dma_buf_map.
> >
> > [1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg.org/
> > [2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmermann@suse.de/
> >
> > Thomas Zimmermann (3):
> >   dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
> >   dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
> >   dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
>
> FWIW, for the series, please feel free to add my
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Of course, once the errors found by kernel test robot are fixed :).
>
> >
> >  Documentation/driver-api/dma-buf.rst          |   3 +
> >  drivers/dma-buf/dma-buf.c                     |  40 +++---
> >  drivers/gpu/drm/drm_gem_cma_helper.c          |  16 ++-
> >  drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 ++-
> >  drivers/gpu/drm/drm_prime.c                   |  14 +-
> >  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
> >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 ++-
> >  drivers/gpu/drm/tegra/gem.c                   |  23 ++--
> >  .../common/videobuf2/videobuf2-dma-contig.c   |  17 ++-
> >  .../media/common/videobuf2/videobuf2-dma-sg.c |  19 ++-
> >  .../common/videobuf2/videobuf2-vmalloc.c      |  21 ++-
> >  include/drm/drm_prime.h                       |   5 +-
> >  include/linux/dma-buf-map.h                   | 126 ++++++++++++++++++
> >  include/linux/dma-buf.h                       |  11 +-
> >  15 files changed, 274 insertions(+), 82 deletions(-)
> >  create mode 100644 include/linux/dma-buf-map.h
> >
> > --
> > 2.28.0
> >
>
> Best,
> Sumit.

Best,
Sumit.
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
