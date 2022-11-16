Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D862BA16
	for <lists+etnaviv@lfdr.de>; Wed, 16 Nov 2022 11:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DD010E477;
	Wed, 16 Nov 2022 10:51:08 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEE610E478
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Nov 2022 10:51:01 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s12so25922550edd.5
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Nov 2022 02:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMt8HjKxItO2J6bIbRsCvEdSlAZpP8uC48lcisou+nI=;
 b=eLnGvKK+w1XqLxzowLTo19VxBdUCyRC3jZCwBMpKaUWXXlLi4fs0Axmuul/wRN/I3k
 Ls2daX/AS8NBqlkGiJqqxb0gEFzgn6n0a6+XnpTDtipAc3J5NayuL7HDBO33beS0D75x
 K2gRZhVXeM0+lA+7zcbmJS/RVo1YdOeZ/sxms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NMt8HjKxItO2J6bIbRsCvEdSlAZpP8uC48lcisou+nI=;
 b=1SDXtUzDRky/bZo4HYVgcPo05x951XcbCKDcIVivdy9GWpBXUC7AHtsjawyrHqXNfz
 NDlUxa8O2Op9JdBTAaCPaeZlotMeKB3bd4pd3zhTs0bxHS5Uw1gFtzUhdjHSY6aKBwGL
 6laoySN+3cs+KVfuXRoTVrerGVIZwzSazSsCkw0MtEaTShq1TOIRTRP7qA7f+XZhANK2
 BvFLfQPdarOEsUn+y6BxW9dgQBjhXNgdJpE1HdqQl2uJmcEN/gDvaLnIA0/wFr/j2q23
 k6LC3A4XIbDMnIMgBaH8Pc9ZqV+rix1OpoqHpCuR3lbmaMVWUQOj0qnifubQEbpRJpzm
 0L1g==
X-Gm-Message-State: ANoB5pn3pxCa7e7lwRQ2C8m65++jrj5Y9E0lbzqtPspObZPyKezDzHVw
 7/Gy7lGhBXENrDEWA0LWUWVkDw==
X-Google-Smtp-Source: AA0mqf4Z9KF9DYfdJQdqGvbtRloYOPQXnN3MkKcJxdOs80iDic7Ysg9e6qfGKtqJuC+1emfUPfQ+gw==
X-Received: by 2002:a50:ff04:0:b0:462:709:9f7b with SMTP id
 a4-20020a50ff04000000b0046207099f7bmr19331341edu.263.1668595860175; 
 Wed, 16 Nov 2022 02:51:00 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s6-20020a170906bc4600b007aed2057eaesm6056420ejv.161.2022.11.16.02.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 02:50:59 -0800 (PST)
Date: Wed, 16 Nov 2022 11:50:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH mm-unstable v1 17/20] drm/exynos: remove FOLL_FORCE usage
Message-ID: <Y3TAkWy/xXfX1cIv@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Matthew Wilcox <willy@infradead.org>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Muchun Song <songmuchun@bytedance.com>,
 Shuah Khan <shuah@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Oded Gabbay <ogabbay@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-18-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116102659.70287-18-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
 David Airlie <airlied@gmail.com>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 11:26:56AM +0100, David Hildenbrand wrote:
> FOLL_FORCE is really only for ptrace access. As we unpin the pinned pages
> using unpin_user_pages_dirty_lock(true), the assumption is that all these
> pages are writable.
> 
> FOLL_FORCE in this case seems to be a legacy leftover. Let's just remove
> it.
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Plus ack for merging through the appropriate non-drm tree.
-Daniel

> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 471fd6c8135f..e19c2ceb3759 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -477,7 +477,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
>  	}
>  
>  	ret = pin_user_pages_fast(start, npages,
> -				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> +				  FOLL_WRITE | FOLL_LONGTERM,
>  				  g2d_userptr->pages);
>  	if (ret != npages) {
>  		DRM_DEV_ERROR(g2d->dev,
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
