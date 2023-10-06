Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059EF7BC041
	for <lists+etnaviv@lfdr.de>; Fri,  6 Oct 2023 22:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E8F10E563;
	Fri,  6 Oct 2023 20:24:02 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D383010E568
 for <etnaviv@lists.freedesktop.org>; Fri,  6 Oct 2023 20:23:59 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-27758c8f579so1831612a91.0
 for <etnaviv@lists.freedesktop.org>; Fri, 06 Oct 2023 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696623839; x=1697228639;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yeQqUbIodZOEmRnT0u+h/uvWq4E1WjoaKYarDgehFlU=;
 b=Pw3kzF5BnM1/J+brTVyeexL0CD8xOPCs8n7DfELrERg4+scF8fm9Vf9uokalehrPHH
 HzPnpjhHXSxo4efETYnvsI/qRbHprYF4lgGQFpRc+pMOY094omA5CM7n/cR5JTRV+mD0
 R+YMAavHRzZW+YQWCq2tV7eVcZPMiB9uasz24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696623839; x=1697228639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yeQqUbIodZOEmRnT0u+h/uvWq4E1WjoaKYarDgehFlU=;
 b=mF1dxiJ8gWhfTty0ONzBpvi2mnPEAIN2dR60CIQtltrlYxddQAZxMK02DFfNbycb8n
 VS1UNhiQvbgAxCJoi3mhgGbfB/tgR6ED6K9wUrOEA1C5u77BfCWGuCMyWVeJ3dvDa5Ds
 NtTsXW60QTyp6bPfu6um0LTT6FqxxYGfcmektzvJw0AWKd7lNxSOXRrSoCTN3OoVCjdA
 MGmgbidwvtKVowBtwhZNAXGqpBsZ4Se6ghiReCN0FzVnLJKcETfpcwhEYRBWMZgJzPod
 Bn7slmUeHrfUJchZRosVS27mHRUAuUw6zkaiYZRmbCkH4dpAFFY1Gcbm9GiiaiM061oA
 wvDQ==
X-Gm-Message-State: AOJu0YxV9h3qlE3a1DbIOc93ndOLw+NHtHcIGo0MUKC2Lh0aP0rZ+9Vv
 Sl9e7nissRS6iZEwsjyjAxO15Q==
X-Google-Smtp-Source: AGHT+IHEr5nv1cWEM1Y3LbpIOqHG/Lj+SrRUHy4wA915uDKNkG765B0Y8Pm/6H1gh2Qpt05VCVwqjA==
X-Received: by 2002:a17:90a:a085:b0:276:e14a:4991 with SMTP id
 r5-20020a17090aa08500b00276e14a4991mr8929179pjp.2.1696623839216; 
 Fri, 06 Oct 2023 13:23:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c10d00b001bc68602e54sm4343643pli.142.2023.10.06.13.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 13:23:58 -0700 (PDT)
Date: Fri, 6 Oct 2023 13:23:56 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2] drm/etnaviv: refactor deprecated strncpy
Message-ID: <202310061323.05B262D@keescook>
References: <20230918-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v2-1-8ae12071c138@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v2-1-8ae12071c138@google.com>
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

On Mon, Sep 18, 2023 at 01:34:08PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy_pad` due to the fact that it
> guarantees NUL-termination on the destination buffer whilst maintaining
> the NUL-padding behavior that strncpy provides.

Friend ping. Who can pick this change up?

Thanks!

-Kees

> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Cc: Bo YU <tsu.yubo@gmail.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Changes in v2:
> - use strscpy_pad (thanks Kees)
> - Link to v1: https://lore.kernel.org/r/20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v1-1-3adc2d9bfc52@google.com
> ---
> Similar to [2] which was never picked up. Let's prefer strscpy_pad to strlcpy, though
> 
> [2]: https://lore.kernel.org/all/20190328080918.9290-1-tsu.yubo@gmail.com/
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index bafdfe49c1d8..dc9dea664a28 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -511,7 +511,7 @@ int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
>  
>  	domain->id = domain->iter;
>  	domain->nr_signals = dom->nr_signals;
> -	strncpy(domain->name, dom->name, sizeof(domain->name));
> +	strscpy_pad(domain->name, dom->name, sizeof(domain->name));
>  
>  	domain->iter++;
>  	if (domain->iter == nr_domains)
> @@ -540,7 +540,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
>  	sig = &dom->signal[signal->iter];
>  
>  	signal->id = signal->iter;
> -	strncpy(signal->name, sig->name, sizeof(signal->name));
> +	strscpy_pad(signal->name, sig->name, sizeof(signal->name));
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
