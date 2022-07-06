Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27A456CB7A
	for <lists+etnaviv@lfdr.de>; Sat,  9 Jul 2022 23:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A2E11B942;
	Sat,  9 Jul 2022 21:00:54 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9446112E65
 for <etnaviv@lists.freedesktop.org>; Wed,  6 Jul 2022 18:31:59 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31caffa4a45so77056237b3.3
 for <etnaviv@lists.freedesktop.org>; Wed, 06 Jul 2022 11:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JqBcZVmZY62+uZaaDsEVHApvk4BPtabj2ze/xYSIKPM=;
 b=dEPL46gwLY9Xnxeq7C4mX9Slt3nXB1pC1jn5H0CL9VX9G2i8J6+ylsbX1Mgg2ERRjp
 vlPsgCqXtBs1XZnGQqilXjd5GePb2UO5C6pmc+JN1fk6Wqr+Ol6n1+ETMDRdz1MbpBtX
 se7qXtyj0/MrUfsRscQXaxQREgk3/B/JhYx7GEriklH1gVdocFajhWPIjV+pRV1sOL1M
 55HKrnvRjLHyI7UjeoWg73/+uxDsaFlG8k/XgUulVf0AGvgOOL2cjp6zctn+FPub2yuT
 6Sa9SruHspQVXX5hrICktogXVFwx0I513/4Z7w3NV8jfaVdf3t2TkUdWgnHZFmwAAFKa
 XZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JqBcZVmZY62+uZaaDsEVHApvk4BPtabj2ze/xYSIKPM=;
 b=wTspPaApKn/JhFwmXyfaOCrGeqwYyIf9l76uzZnHDTwlAqcPkjNeqfJz236hov6GHP
 PGk3OY3Nfw5uHhkOyEjgedzuYed2HN5A3TMe0pEl/9XU/uWvjK7z5hmx7aGrqwkNBerZ
 766jZvhUA6bwzNkkzOuJvzB7RuWuBDqikiFxSx8SCvUzLNFqMP/mJRImRsjciVeJnU3r
 k+HqLI5kAuyFBw4C24otEswSDf8pv9/tCs6cxJEecOzfuk8Cc0YvsOPbTV37LCXcuHx8
 cF7qqFWNp+yqA9p+A4pHsXqXbYkMWldsK7ONkVztnlVlbZtjoIXTjcpgQPC6+hVyprFP
 i2Xg==
X-Gm-Message-State: AJIora9mytyJU4h/ue6lNLGyM+1/UtXIL6mC4d/3LCaOKWiryG+BExd6
 3Ks1tq2X0gVQNmhcEuP/jcxvyJVLxNv2Np46W8mV/A==
X-Google-Smtp-Source: AGRyM1vStpSFCTvQoOkYY9pCw67PR2KX2//2Tg5M4w73NRNk7nScyntoWxARzbefU6wlbYJu8sZsAQDLLqSTcibHrBs=
X-Received: by 2002:a81:4f95:0:b0:31c:9817:90e5 with SMTP id
 d143-20020a814f95000000b0031c981790e5mr20142591ywb.280.1657132318960; Wed, 06
 Jul 2022 11:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220706182924.2563058-1-tjmercier@google.com>
In-Reply-To: <20220706182924.2563058-1-tjmercier@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 6 Jul 2022 11:31:48 -0700
Message-ID: <CABdmKX2vtT04iPp-BZHRu0DAyXQpLvrtSc4eahNgUVxx+K4Tqg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Remove duplicate call to
 drm_gem_free_mmap_offset
To: "T.J. Mercier" <tjmercier@google.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 09 Jul 2022 21:00:52 +0000
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, Jul 6, 2022 at 11:29 AM T.J. Mercier <tjmercier@google.com> wrote:
>
> The docs explicitly say the drm_gem_object_release function already calls this,
> and this does not appear to be a prerequisite for the call to
> etnaviv_gem_ops.release.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index cc386f8a7116..ecb828e4e156 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -504,7 +504,6 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
>                 kfree(mapping);
>         }
>
> -       drm_gem_free_mmap_offset(obj);
>         etnaviv_obj->ops->release(etnaviv_obj);
>         drm_gem_object_release(obj);
>
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>

I don't have a device to test this with, but I believe this is correct
based on inspecting the code and the drm_gem_free_mmap_offset function
docs.
