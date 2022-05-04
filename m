Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B3519966
	for <lists+etnaviv@lfdr.de>; Wed,  4 May 2022 10:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4B010E369;
	Wed,  4 May 2022 08:15:04 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF6510E44F
 for <etnaviv@lists.freedesktop.org>; Wed,  4 May 2022 08:15:03 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id dk23so1395423ejb.8
 for <etnaviv@lists.freedesktop.org>; Wed, 04 May 2022 01:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YU7WdE75mRU+qDqKjlkeSe99cyORSKiV3WMSDIk2Mm4=;
 b=IZKWdZOs/fEpC94JbfhEGGFe6x+OiHyrCqGNjb/R4QeeYFUoV1UxTXTgSdMH6draEN
 1GN2iAFks/LsviNUA8VButsWDIiRacK6EXAiVll5dUmK27EAb8nhCoxaLR1uGM69L3sO
 KXk3IyZqazgI9vW8/jXN/0QcNtJhOP8S6SEIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YU7WdE75mRU+qDqKjlkeSe99cyORSKiV3WMSDIk2Mm4=;
 b=gcSN3qHm5RiqkGgBuc+GKnaOLmjF8DK/sTK5mEjtOj8//Z6+J3dR/9pNoRh5Jd2rUH
 9bZLF/lWu8Oka+I2hRYbBdEOM/Rg7Ie+1UOez9YQYaq0nXw3jLAdNZTUE8f6gLg1Gd6a
 RnvJ9OMqAXWYMZYUCKl14eXRUMM/9uZXHFXkOuRLnSrJvtSC4rcAKrToX3ZwcqdzIjLK
 KHptRAxSBnNAo0+yvK9gqMUwIRRC+QlRdJBj9D0AwL2KW8VaBZEp/FaNyr71+pax2CaC
 mRlH5kpv7QUnCzKPdLvWPO5dk4vn7XVzB4Ke73h6USSP+dCTzsbzxVWO+jL36RkakS1K
 v3iQ==
X-Gm-Message-State: AOAM533suQd9V/JsnuIrewwlzPMMNGPzWcegKXm4kzYRdW1Qo8y8KK3N
 Op+ggb4QVfCJ7XgKe8BfNU8L4je+IL8hvA==
X-Google-Smtp-Source: ABdhPJzGIcq1HCmjeJM+XuvXHW/Whkhb7NvrGuznpZShxCLON1wKywA2lVZ5nMJJk+rFF/TdzNjWPg==
X-Received: by 2002:a17:907:1c01:b0:6f4:2692:e23 with SMTP id
 nc1-20020a1709071c0100b006f426920e23mr16703120ejc.243.1651652101983; 
 Wed, 04 May 2022 01:15:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ia12-20020a170907a06c00b006f3ef214da8sm5486989ejc.14.2022.05.04.01.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 01:15:01 -0700 (PDT)
Date: Wed, 4 May 2022 10:14:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: avoid cleaning up sched_job when submit
 succeeded
Message-ID: <YnI1/0Hw2GB9phaH@phenom.ffwll.local>
References: <20220429191731.2187339-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429191731.2187339-1-l.stach@pengutronix.de>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 09:17:31PM +0200, Lucas Stach wrote:
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
> ---
> Daniel, please apply to the appropriate drm-misc branch to make sure
> this ends up in the same pullrequest as the offending commit.

Apologies on being behind on emails, I just came to the same conclusion.

Except there's one issue, the error path for sync_file_create is after a
successful call to drm_sched_entity_push_job(), so in that case we must
again _not_ call drm_sched_job_cleanup. So we need to change that goto
err_submit_job to goto err_submit_put and maybe add a comment about why.

Can you pls respin?

Thanks, Daniel

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 98bb5c9239de..bf2a400f59c9 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -607,7 +607,8 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
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
