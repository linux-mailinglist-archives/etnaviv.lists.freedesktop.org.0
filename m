Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DI/PKDzfUGqU6gIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 14:02:04 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BCA73A7D4
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 14:02:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pw0TG4R+;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539AA10F86B;
	Fri, 10 Jul 2026 12:01:59 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DCD10F882
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 12:01:57 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-ca00f126b7eso462783a12.2
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 05:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783684917; cv=none;
 d=google.com; s=arc-20260327;
 b=Aklv07vLa842CIt5N5PFRqcI4QJKu2sXhpAgcFrLP8/rSfNteg5QtJC3BKPKCXxQ+c
 4hNWXZ06VD/po5mSV0M5wjlSxyb16934WiX2+sC0+tjPKIyQ3eO9TT7rJdQRAcbWExRD
 uxC3yu3vIFUkoP6nNYHXWN2+SPamShtjZPNEPnsuoqZu+J3tmv6mWW2WUEX0vFqfxeZu
 ZZe8ELlHnC7seZuP8o7OPXKjsqMVu8ejksvCb5i/hqHij+m9gYb0ubgk5miE+VTmOPCM
 RHe31dwKDcObaHnzhAlfkEihbyhRH8mSz5hBpnKmfB7KHPfUAwpOXCW7Kis5+EEHs+E/
 V9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zGoLqLOhnoBT5eYxArK45AshFfp+PFQ1oZDYsxbY2CA=;
 fh=6d1g0uNJinksX/aIQT7/xw4OY93hbS8PX+rU51+AmpE=;
 b=h2x/vvV5ZsrePOQavx2O3JhD6aWf2JnC21Q/JEO3FyVDI55fcmwh0bP2CxDAXH5LIq
 UJrbI8v30Y8un9dkQV2pS1avAzYkuvmTHBONnRqpyf/KSN9WS/JGxpXiYeEe2ptHdvQx
 g9AQKPLMxkrupqC/o/VkerroPbk2LQ7hxAc+Lw0RXIE3bJijYW/pxiFPzC+LPYBum1bG
 SM7ORO1o8lbLStf4E/sgoGYwRIHo0SnfRFYrysn3kGEpuqMnj0vkNI48k/ZAirw8vM+i
 tZMfxdgAOiYK9wsuCEmn9UDL/k/MA+XS+j/6mTyYCkuq9aaQ75t0ftkQ2qgPIpq5g8iB
 uIWA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783684917; x=1784289717; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zGoLqLOhnoBT5eYxArK45AshFfp+PFQ1oZDYsxbY2CA=;
 b=pw0TG4R+iWZYzsifuNy6At4JHU3B8Jke8VCkEYcUZ3N0vpZi08JziSu4tMYw+bgATU
 q0LZBNG9lML12Hcmhxs7UOdKy+I9ZMWbcOVYTGcVDf02dfSAEa4VwfYsv4LBYWtsShKz
 e71AKsr2cut+H+GoKpnjYDCSB4M/aneBwpO/hnDsfdPEfFPWN9Nn1yS6Q97L84YPcbKA
 1g4Rd6A/ISH6qqS5XhZNET3oSNCjF/+zM/hHbHwTDqBtGoYn1gXYkZoUb88ISI38NBkV
 ho0m+qezHcI7a4K10C3ta/7Bat696qK2lJeSvkUv7hQEBuPm5dR+Pr140e3Vds+EKk3f
 q4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783684917; x=1784289717;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zGoLqLOhnoBT5eYxArK45AshFfp+PFQ1oZDYsxbY2CA=;
 b=aibemGKTj6PVHLupuMapF6iUVQyhRdK31qolU5PsB+GSl8i3fwPOo/RZsnFcpY/Aug
 2j9EGdrLSdf3zQGiNuK2n6FtsNAwWEctwCzRY7CyRb/bQRyOtTi3ebwsFQtCAOFXlegd
 VhSpBk54Z7HkeuvbOcjXdpx3/IIlEexEnHtpcBda36CRFuWyMkrRGsNb1KJw9BeWQAwq
 Q4Af0hd/GCBbsTE2HdccbJx7RpncrbfVl6AfYo2qLK4gM7HrIhT3H3DSeTeiC7vd/DcE
 ioe9WSsxrSh6p9kpZP+rugkCSUH4LF6Cl66/DTui3Bmopez0d1mA//udEszSCAanXxCX
 wdtg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro/pDYUwYErPtf8z1mpeHKNAgQumgdAgQEZTlySWyKQPttweLPz7bZCoJzM5gKSX4+QFiwvdsfw@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx342Zv3MH6mf3IqzqMx2khgg+f1/b1FLbEM41kImgrlslVvx1E
 H7BeKgdFiZxCaQmBxyDiLhIK0US9+AqRiplgrI8Z3YgL4vfkkMkGi7UDfaZNbsG20xEGoMqXNHR
 DKK5CeVKqr8nRSp0gDDBU1Er2ihL7c6s=
X-Gm-Gg: AfdE7clvoMchyiUHXmsd/7+6thet2y9B7OWVlGPRDE9sGpAtHQxM8XWN7vCpnZc6RxW
 mBcLpMVez+UOlU23z1GvFhHzg9eQT0IJIOdkrRx399HUq7I/jU1aac6TKa0lUEBW6rRzrGF1IGC
 lXoW9qOsrKa399DpMG8t+dHf2RCPbH+DmsxEJ7k5QCW2IqbNh/7z3uRfjMXVdJVMZfWKgLvcu88
 2Ba5ZPogfQPwx2aezjlxrGPUqkn9JwgM4Sm48OLPJrJ7UTiCLKxJhFIm8Gxo+H1ghYcm1n4kyIz
 cYoyC/Wmv25O+ia5uBQ/C3jyXc4=
X-Received: by 2002:a05:6a20:2d14:b0:3c0:9c19:6597 with SMTP id
 adf61e73a8af0-3c0bd1a1d7dmr13959642637.63.1783684914765; Fri, 10 Jul 2026
 05:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260710-etnaviv-reset-notification-v2-0-90cfebcf22a2@igalia.com>
 <20260710-etnaviv-reset-notification-v2-2-90cfebcf22a2@igalia.com>
 <fded212b216f1f4d3afa7465ae64aa9b96b80288.camel@pengutronix.de>
In-Reply-To: <fded212b216f1f4d3afa7465ae64aa9b96b80288.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 10 Jul 2026 14:01:43 +0200
X-Gm-Features: AVVi8Ce0a6nv3oNDODzd3-WVwFjHf2yhuy7WRab1u9h0eEE57KHHpX4UY0QWoJ0
Message-ID: <CAH9NwWd7bvzOYrvdiU65qGjwdNjxPdjpiYO2POkQcjmc1kTQSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/etnaviv: Add GPU reset counters
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, Christian Gmeiner <cgmeiner@igalia.com>
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel-dev@igalia.com,m:cgmeiner@igalia.com,m:linux@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,igalia.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,igalia.com:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73BCA73A7D4

Hi Lucas,

> >
> > The OpenGL and Vulkan robustness extensions let an application detect a
> > GPU reset and check if its own context caused it, so the application can
> > drop the broken context and build a new one. The kernel knows both
> > facts, but etnaviv has no way to report them to userspace.
> >
> > Add two counters and a RESET_QUERY ioctl that returns both in one call:
> > a per-GPU counter that counts every reset of that GPU, and a per-context
> > counter that only counts the resets this context was guilty of.
> > Userspace compares the counters with saved values: if the context
> > counter moved the context was guilty, if only the GPU counter moved the
> > context was an innocent victim.
> >
> > The GPU counter is per GPU core and not per device, so a hang on one
> > pipe does not look like an innocent reset to contexts that only use
> > another pipe.
> >
> > Bump the driver minor version so userspace can detect the feature.
> >
> > Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c   | 27 ++++++++++++++++++++++++++-
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.h   |  1 +
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.h   |  2 ++
> >  drivers/gpu/drm/etnaviv/etnaviv_sched.c |  3 +++
> >  include/uapi/drm/etnaviv_drm.h          | 19 ++++++++++++++++++-
> >  5 files changed, 50 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > index a27ed014fb4e..a48698463fc1 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > @@ -296,6 +296,30 @@ static int etnaviv_ioctl_get_param(struct drm_device *dev, void *data,
> >       return etnaviv_gpu_get_param(gpu, args->param, &args->value);
> >  }
> >
> > +static int etnaviv_ioctl_reset_query(struct drm_device *dev, void *data,
> > +             struct drm_file *file)
> > +{
> > +     struct etnaviv_drm_private *priv = dev->dev_private;
> > +     struct etnaviv_file_private *ctx = file->driver_priv;
> > +     struct drm_etnaviv_reset_query *args = data;
> > +     struct etnaviv_gpu *gpu;
> > +
> > +     if (args->flags)
> > +             return -EINVAL;
> > +
> > +     if (args->pipe >= ETNA_MAX_PIPES)
> > +             return -EINVAL;
> > +
> > +     gpu = priv->gpu[args->pipe];
> > +     if (!gpu)
> > +             return -ENXIO;
> > +
> > +     args->global_reset_counter = gpu->reset_counter;
> > +     args->context_reset_counter = ctx->reset_counter;
>
> Reading those values still has the chance to race with the timeout
> handler updating the values. Failure mode would be timeout handler
> running up until update of the global reset counter, then the readout
> passing back both values to userspace, timeout handler updating the
> context reset counter. Userspace would see a innocent context reset due
> to only the global counter moving, while in reality it was guilty
> context reset.
>
> I guess the easiest way to ensure atomic updates of both values would
> be to take the gpu mutex here and across the update of both values.
>

Right, that window exists and it reports exactly the wrong thing to
the guilty context. I now take the gpu lock across both increments in
the timeout handler and across the readout here, so the query can
never see the global counter move without the context counter.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
