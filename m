Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMN9KjjE+Wk0DgMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 05 May 2026 12:19:36 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E5A4CAEF4
	for <lists+etnaviv@lfdr.de>; Tue, 05 May 2026 12:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E4410EA5E;
	Tue,  5 May 2026 10:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MrkBoILX";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C9810EA64
 for <etnaviv@lists.freedesktop.org>; Tue,  5 May 2026 10:19:33 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-c798fc1a28cso1729979a12.3
 for <etnaviv@lists.freedesktop.org>; Tue, 05 May 2026 03:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777976373; cv=none;
 d=google.com; s=arc-20240605;
 b=gZ9D/qPwXUKLKk6pg1oHgtCLoHJ7iUo5hicB1Y7tPaZUfJFJcbQUKlrBlrWLVxsd66
 1fQRABHQdiBaqHx4cMYWnOjLfqZ4vA1Vknzkr16MrfJR2plAeUQ/vnRbPrlmb/Rhz1ka
 QnvajijVPympxdXsqB84kDZXM6rjjIT1ItOKjXtfAQ+K2NIVYCepyHIcgAsCD7hOYR7m
 QwoHXAFQ7pQPGm02p5+WkphplxLd5t/IcF4ZQDAFSkquFW3Hks+r/rNOjkFMsssvjigl
 q+07PCA9GaCOkLZh0KnNQ7OQkSTYcnllIHXSJDW288L5iWjrGSiE6soU2xzf4HHRU42+
 pUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8JlOH3AnXsv8zCj3JKynCL7GH8Oym+OmPIIHWYj93HI=;
 fh=5ok5ZCKr2drO2GL/97pydW+NGS1/t6tKwD/xLWDqd0M=;
 b=aK+8WdMhi5WA/DFllMfGvY9RtpoxLkqYCtVjUFqQTaVT6ZYcPS8q8CZFIOCYcZHKe2
 Kb/vspq/z9Wy1saa25+kFVlDx2dGjxp2l0VP7zKO4DZVlqKuz2OE7RGVqFD+9h0ifrfr
 lDuTEtkirQKKagcZcVp6RYuc52X8UZ7MuV4pLoWrc+Jt3vL/yl6HfLYJVtbCrH8ZVZd8
 5cQ/lGB0c194tIOx6vwl6qDcm+wIjpIl+6HUsZiS5e/0AWPIzUpZc99PYSM/4DyeMiIJ
 pif4Fcje8ALbw6ixtGtB9VdDrr49UT16sVE6kcNPjFIlySThttI+Vla9kFA5xyeYdCOE
 vX8A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777976373; x=1778581173; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8JlOH3AnXsv8zCj3JKynCL7GH8Oym+OmPIIHWYj93HI=;
 b=MrkBoILXhlIiCreQMraeVH6IFRW9cjN4qeBCQ4lLMB9YaApocto4qbTu05X6LRH6nr
 tji44fGI06dnQpt8C/eY4Xkh7M2+Js9UkB2yD4LZh2qCglCkWStpBOty0czkKyMCUDGD
 McLnZ6LkxVKbwfSPbb82jINv1R7H86rhtq27OVU03JOubnkyFWc685dFv2aOoMx5mfaL
 QdztFdXbsboJE4imnr/b2N4CVy4BVImeJyqLmvENYRZjyVfItyX6fH8dn9HjNj32BCIl
 /mB2zD/CvQsfd2eEqQENqsAwHbzZ3gw9qIk5PI5m5PoiivCp3wjNbPO2+o+E15yJJf6W
 npLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777976373; x=1778581173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8JlOH3AnXsv8zCj3JKynCL7GH8Oym+OmPIIHWYj93HI=;
 b=UwhpdEGAGRbhHQmGYH4SywQO9m7TL6PefJYj3txRwvNa4LL+pR3G8G+S7A8PeIadRM
 96/CN70XpADjCTB8FupJKf/Bqz51LLeQcTAvXGrq+dmcrlalhgMZgboVAo+UkjSEE18u
 9bS4KXmYingcddxO4NyVCO1MnaQfoOdScClAKubxlSrsyMaLXi5uTSEr5QT/MfHnjme1
 h5oPaylqcA8SAUhvq+PTzk/Trh7ginbH+3g761Jlzb/VvOjYtYIP0tmEf4RYxkuXnbcb
 iYUe+Scd4TyyXKxyJQg4bJ7EfiWrQZ2K8vPZ9+UMZsVxbF2Ojnrfce/rUfSeAP47GsVa
 tGlQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/BdaW0Ft36XzsVw4sZtgODt6fPvQOI2ZaNitgr33IzYY1fa539Ez7KKL1j0V6Fjz8FNI1bZagp@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoqjLF+t+9Mfbqz8wuhc+AoIqif34L2gFbErGIzNW4chMfFzFd
 jKRIBDDEEKcPILOhkKjr68yu0JyNwM79ryAnIdKx0qSZlkWkmz/k1u2jQHxs4X9ZJMsX15ON7tw
 SA62jsxGPLldDoyHni45PNs7HfYoxN7s=
X-Gm-Gg: AeBDievDZXJhcegYdlsRb0Al068w6R/us0rFjOjXFE2I4gzXxL4COCP4kT7rWItkFDE
 hNGKwrIOI5ZwN+eQlpBC0uhuituJyicYpkmquY3c/PEtrw6pteGL0MwrH5HMfseRR0V2b3f3y8/
 tMPTW2fy0j7bLgQsPO2mw2zGEPPRSW3w0RVJPMOgRpTfQADMT7dPGEHu03aD9KM/nR3lPmNMzZC
 R1VF+gzkJqGKax2N7mpoq/m00XbCt/LbN7jWKj4AJgFRV178p7HO5jkZTDb2DD6ljhiLfV8ZQ5l
 KhrAp5ctyJ8sA0kZzyhGiqRCvNFWFurP3/dbMlB8+OVZDmIn
X-Received: by 2002:a05:6a20:a107:b0:3a3:17f8:bedd with SMTP id
 adf61e73a8af0-3aa3b42682amr2901722637.17.1777976372798; Tue, 05 May 2026
 03:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260320010757.32158-1-rosenp@gmail.com>
In-Reply-To: <20260320010757.32158-1-rosenp@gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 5 May 2026 12:19:19 +0200
X-Gm-Features: AVHnY4LrSdA-TVd0rOf78tt1qEgtyjaB-8s2ysBkKThqZkZIY7rx-9HrQrJ2k5o
Message-ID: <CAH9NwWfcpyEGGG_=h4xKVw0xcLVn1hPWKrZo-rQ9x9rQio4r8w@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: use kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: 11E5A4CAEF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:dri-devel@lists.freedesktop.org,m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:linux@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]

Hi

Am Fr., 20. M=C3=A4rz 2026 um 02:08 Uhr schrieb Rosen Penev <rosenp@gmail.c=
om>:
>
> A local helper was developed previously for struct_size.
>
> kzalloc_flex can be used now.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h        | 12 ------------
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  3 +--
>  2 files changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etna=
viv/etnaviv_drv.h
> index 20dad16fd554..55a9e745604d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -93,18 +93,6 @@ void etnaviv_gem_describe_objects(struct etnaviv_drm_p=
rivate *priv,
>  #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
>  #define VERB(fmt, ...) if (0) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
>
> -/*
> - * Return the storage size of a structure with a variable length array.
> - * The array is nelem elements of elem_size, where the base structure
> - * is defined by base.  If the size overflows size_t, return zero.
> - */
> -static inline size_t size_vstruct(size_t nelem, size_t elem_size, size_t=
 base)
> -{
> -       if (elem_size && nelem > (SIZE_MAX - base) / elem_size)
> -               return 0;
> -       return base + nelem * elem_size;
> -}
> -
>  /*
>   * Etnaviv timeouts are specified wrt CLOCK_MONOTONIC, not jiffies.
>   * We need to calculate the timeout in terms of number of jiffies
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/d=
rm/etnaviv/etnaviv_gem_submit.c
> index fbf693addd74..1a77a09b3377 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -32,9 +32,8 @@ static struct etnaviv_gem_submit *submit_create(struct =
drm_device *dev,
>                 struct etnaviv_gpu *gpu, size_t nr_bos, size_t nr_pmrs)
>  {
>         struct etnaviv_gem_submit *submit;
> -       size_t sz =3D size_vstruct(nr_bos, sizeof(submit->bos[0]), sizeof=
(*submit));
>
> -       submit =3D kzalloc(sz, GFP_KERNEL);
> +       submit =3D kzalloc_flex(*submit, bos, nr_bos);
>         if (!submit)
>                 return NULL;
>
> --
> 2.53.0
>

Thanks for the patch - applied to drm-misc-next.

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
