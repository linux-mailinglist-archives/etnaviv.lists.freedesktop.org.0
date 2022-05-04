Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330BE519D81
	for <lists+etnaviv@lfdr.de>; Wed,  4 May 2022 13:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D8D10F635;
	Wed,  4 May 2022 11:00:07 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CFC10F635
 for <etnaviv@lists.freedesktop.org>; Wed,  4 May 2022 11:00:05 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g23so1242172edy.13
 for <etnaviv@lists.freedesktop.org>; Wed, 04 May 2022 04:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Wc6RHzr0L/qMtk9DIPClH8Qs+tCmv91WRmNWnpoTxPs=;
 b=QpoVm4MjwADEeze47wfCHuTkR6RhGC58BqxIFn5RM8XrdBxGJZmznCAJuI5CJqC8fb
 Pgu/rcyGO1yRvB6/YhMRTg1wcZyGL1uPn2CeOqs9kDsgamkRpZMvgUFdndPrU4HGkfGW
 UKjOq26VTM14Jv6cQ++e92obmcnEGrlYHE3MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wc6RHzr0L/qMtk9DIPClH8Qs+tCmv91WRmNWnpoTxPs=;
 b=aQ71bSDXR1m5/WveMgz7LEPbfHNQS+yhoJvzM4VZ3x5rK5GHDohHde9gn4nQRREF+w
 GbkrW7nsY75e6BysMrQZZMAyuZS2FMj1D1UFSvNL2lCKZkyftoZl3UvuUjcNSqDxVnsD
 R2LV3EvZuc1nW1WFndeeRDpZbg7YLpn4hGhxwDzsWnvCm8mN6K5DGCDd+rmg36TqeddK
 OAlfyGdJk5Vh/YDv64Is+4jaDT43ZhC5xFflEdPs8T+VcOvFVra7ixrTGMYJFf/e+t2/
 VxZ0qgHi+hX2zRrI2EXpVwFXtTxC7CBRtzCnnhiDXovRjmGYCo4MyDtGdHyqo4U3PUYP
 UFQA==
X-Gm-Message-State: AOAM531VCOsLyjGYe/LZB/cikKUn99VEr/dRVix76OiAOeqa7H7pmvGM
 tEuIAiqB2QudnR6tr9zmrynoAA==
X-Google-Smtp-Source: ABdhPJzi2MurOWn5tKI4SoIdPHS4QcKxfif76azZfa53/+JndytSqPNzfmFrPFjAsZSsd5TPCdHKdw==
X-Received: by 2002:a05:6402:3593:b0:427:e6d6:9265 with SMTP id
 y19-20020a056402359300b00427e6d69265mr7511963edc.402.1651662003886; 
 Wed, 04 May 2022 04:00:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 de38-20020a1709069be600b006f3ef214dbcsm5565890ejc.34.2022.05.04.04.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:00:03 -0700 (PDT)
Date: Wed, 4 May 2022 13:00:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2] drm/etnaviv: avoid cleaning up sched_job when submit
 succeeded
Message-ID: <YnJcsTv63Nq0VeEj@phenom.ffwll.local>
References: <20220504090229.2506560-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504090229.2506560-1-l.stach@pengutronix.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: kernel@pengutronix.de, Michael Walle <michael@walle.cc>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 11:02:29AM +0200, Lucas Stach wrote:
> While the labels may mislead the casual reader, the tail of the function
> etnaviv_ioctl_gem_submit is always executed, as a lot of the structures
> set up in this function need to be cleaned up regardless of whether the
> submit succeeded or failed.
> 
> An exception is the newly added drm_sched_job_cleanup, which must only
> be called when the submit failed before handing the job to the
> scheduler.
> 
> Fixes: b827c84f5e84 ("drm/etnaviv: Use scheduler dependency handling")
> Reported-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Pushed to drm-misc-next, thanks for your patch to fix my bug :-)
-Daniel

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 98bb5c9239de..1ac916b24891 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -598,7 +598,12 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		sync_file = sync_file_create(submit->out_fence);
>  		if (!sync_file) {
>  			ret = -ENOMEM;
> -			goto err_submit_job;
> +			/*
> +			 * When this late error is hit, the submit has already
> +			 * been handed over to the scheduler. At this point
> +			 * the sched_job must not be cleaned up.
> +			 */
> +			goto err_submit_put;
>  		}
>  		fd_install(out_fence_fd, sync_file->file);
>  	}
> @@ -607,7 +612,8 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	args->fence = submit->out_fence_id;
>  
>  err_submit_job:
> -	drm_sched_job_cleanup(&submit->sched_job);
> +	if (ret)
> +		drm_sched_job_cleanup(&submit->sched_job);
>  err_submit_put:
>  	etnaviv_submit_put(submit);
>  
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
