Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6FC7A14CD
	for <lists+etnaviv@lfdr.de>; Fri, 15 Sep 2023 06:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A4010E075;
	Fri, 15 Sep 2023 04:33:28 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1713910E079
 for <etnaviv@lists.freedesktop.org>; Fri, 15 Sep 2023 04:33:26 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68fc1bbc94eso1449209b3a.3
 for <etnaviv@lists.freedesktop.org>; Thu, 14 Sep 2023 21:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694752406; x=1695357206;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ortdfDKvpNIzeJx8TZszObBou7irHmSbSFxDLFsiIb8=;
 b=TG1vEn+XkHxnqpMzEUy6rWonTVQgdExRLzzEnQBUTt6eE6dV+7jCG+tVFWjdmqVB9x
 zuAYO7fcWN1LOMxuJzvrCCT7kgsB9Zc3AkQbjCSUfYNTZ8k277xnXdntaHmlIJUIrhnl
 OqFSHXfhY3S7nIsY1sUvxpD7MZRbYay1aPLFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694752406; x=1695357206;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ortdfDKvpNIzeJx8TZszObBou7irHmSbSFxDLFsiIb8=;
 b=CaPRq++1pQWMSugBzKpty/FT26IH/cKBaJkL+DDxitbIvO8JBWBS/cVPXuVEoYEN4R
 t47OYUrmwyhGeSkpZZ9iA6dCepM5seflbDQr7NMdRPjrv81wDddnZNXaE/p8UVjXnFL3
 j36a1KkN/zBiOj+O2Er3Ysul2nvN0rj33C3C347rqzYb7/otm7HbAsFOoc7QtNm3bpcd
 YwJdY7Z3z8BO6rDYYDlSN+FTn0sYKmWVth8kPlTLwhaLH4sNTRXxDkEKy5K1DBXRvW6B
 iB20c5Sj9KzEBGXMHvcOAitS1m//+9I0EnR3+UZWEQ583rkuaWEBhYTlcFEc+Q5rekcf
 Hgbw==
X-Gm-Message-State: AOJu0YzmTEToljuO+WsP17RKiXCA1a0yNyyV8zNA/4sC/opcYEENG25s
 3EwqWr7OjSTeCTsDCWp9dBVdJQ==
X-Google-Smtp-Source: AGHT+IGzXgg9/OWEiL8KkvNzLUOYOIZOZmk5y/PBBVeZQiwFgRA29dMIvxF6haF9oKiYXTr2yUlD5A==
X-Received: by 2002:a05:6a20:7d8c:b0:131:c760:2a0b with SMTP id
 v12-20020a056a207d8c00b00131c7602a0bmr967771pzj.52.1694752406562; 
 Thu, 14 Sep 2023 21:33:26 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b001bdc209b9a0sm2400126plo.201.2023.09.14.21.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 21:33:26 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:33:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] drm/etnaviv: refactor deprecated strncpy
Message-ID: <202309142133.F7FBDD9@keescook>
References: <20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v1-1-3adc2d9bfc52@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v1-1-3adc2d9bfc52@google.com>
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
Cc: Bo YU <tsu.yubo@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-hardening@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 06:20:01PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it guarantees
> NUL-termination on the destination buffer.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Cc: Bo YU <tsu.yubo@gmail.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Similar to [1] which was never picked up. Let's prefer strscpy to strlcpy, though
> 
> [1]: https://lore.kernel.org/all/20190328080918.9290-1-tsu.yubo@gmail.com/
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index bafdfe49c1d8..9e7bebcf24eb 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -511,7 +511,7 @@ int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
>  
>  	domain->id = domain->iter;
>  	domain->nr_signals = dom->nr_signals;
> -	strncpy(domain->name, dom->name, sizeof(domain->name));
> +	strscpy(domain->name, dom->name, sizeof(domain->name));

It looks like this is passing through an ioctl(). Let's use
strscpy_pad(0 instead...

-Kees

>  
>  	domain->iter++;
>  	if (domain->iter == nr_domains)
> @@ -540,7 +540,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
>  	sig = &dom->signal[signal->iter];
>  
>  	signal->id = signal->iter;
> -	strncpy(signal->name, sig->name, sizeof(signal->name));
> +	strscpy(signal->name, sig->name, sizeof(signal->name));
>  
>  	signal->iter++;
>  	if (signal->iter == dom->nr_signals)
> 
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-dd095491dfde
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
