Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA402905515
	for <lists+etnaviv@lfdr.de>; Wed, 12 Jun 2024 16:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E4B10E87A;
	Wed, 12 Jun 2024 14:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="b99mHLC+";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBC710E877
 for <etnaviv@lists.freedesktop.org>; Wed, 12 Jun 2024 14:26:17 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-62a2424ed00so68796137b3.1
 for <etnaviv@lists.freedesktop.org>; Wed, 12 Jun 2024 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1718202377;
 x=1718807177; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uNi2Aj5GB0qprr0RlLvPxqzHcZyuu+DlH1zEbI28b0s=;
 b=b99mHLC+jeF+wd6QJEMXhZOGeVg7Y26v+p+6uIpnsqFsIQQz4K9RTPTeR37nlErFyn
 PaRah1eDVJKeXSGfWJusH9HAbtuq9BofuSkwJ16bpBhMGoQHXRyyHYZKxHs1XTx5pTSe
 X2mpVJUvk0LmGM8t6LcZwNAN7dUATR3VKmoBXRLMFH6/jCI5KvzgKGpKX2tfQTd332x/
 BhuMAyjAxOBkbThsECW51U+M1gxeJaflmX1e11ZdCWnLpT/gzndOskgOe1q+RHEH057N
 eDW9mvFNnI+FIYvnxD8HlIYwzf3dVgPMuDkmm+hsZZT0zkoOAMwAvIQZeU9GTzM8LymA
 Vr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718202377; x=1718807177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uNi2Aj5GB0qprr0RlLvPxqzHcZyuu+DlH1zEbI28b0s=;
 b=dHcsiSuc+/O7DQhVyH810jd20dhrNwkt4DDNxpv7omN8W5Z31MPkCyrZrYX0FJg6Kd
 h8SbKX7rRqc6BuDfkGQVBUV4pJPwZDKeAdv10GhR6fkWblUV6Q1tTfYhBfJ+swjwHASB
 /vgEBNxtVhQKh8BdPi3UlEmDz2X1b3n1Si5EMhixTyHeaEvGZ+ErF3/24iXJR9aCuzDm
 SLq4ePMx2qRNhMtbC6qCvoATHE3qlB/GJdrCbkwkja3EyLGux1MNH19Lw+hIeLipsLUy
 eRKx6xQM1nLbJqGk6eAtO+tYpNN84ZQ1ZnE5m1KvX+dVbnnvOMh39mEoa2sjez3xmL2v
 LJGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWODJBEw/IY0BS74cvHiLtihosoakzy73XA/yo3By+1NFDQFUei4mIY7CxUXgseZCLUx14Tn/xo1M5Y1jZvyN7odR4yjomslS4wXe09qw==
X-Gm-Message-State: AOJu0Yzexajt0LoV1zHuY5x3oS6Q9/S+0uwh6CBp3PgTSku51NF9rWdI
 HvshfEJ3gdNS1DC6y5TYW7BfgUHBaE2vutbVMqjlCSxJ/L/lEIrq71xr9V6vVcMPjIYGeufN6iE
 TiMk=
X-Google-Smtp-Source: AGHT+IHi13xqCphKp86ZCAJCq3cZwRxzopcHqSlIxQHx/I9v22GVy1esTRINgsaecazi0Qs3LflL+w==
X-Received: by 2002:a0d:ca01:0:b0:627:7e65:979 with SMTP id
 00721157ae682-62fb902d6f8mr20373157b3.24.1718202375941; 
 Wed, 12 Jun 2024 07:26:15 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-62ccae47960sm23893887b3.81.2024.06.12.07.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 07:26:15 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dfef7b13c98so326674276.0; 
 Wed, 12 Jun 2024 07:26:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUL0twe234SvNNPqgT4rFE0kyK7mApnNv87IaoD3uxr/23nDgNPhAO3Dq/HcqEK3ggEPd9G2SFlHdSn+dLoq1VzHIQJJSF6xzybWiiYM4QrlVvcGkXjdPm/XtExwuKfknH5M5CvSTKTWH6oxatNaQ==
X-Received: by 2002:a25:aa70:0:b0:dfd:dfc3:2825 with SMTP id
 3f1490d57ef6-dfe67065562mr2033623276.36.1718202375106; Wed, 12 Jun 2024
 07:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
 <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
 <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
In-Reply-To: <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 16:26:02 +0200
X-Gmail-Original-Message-ID: <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
Message-ID: <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Daniel Stone <daniel@fooishbar.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Oded Gabbay <ogabbay@kernel.org>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
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

On Mon, May 20, 2024 at 1:19=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> Hi,
>
> On Mon, 20 May 2024 at 08:39, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> > On Fri, May 10, 2024 at 10:34=E2=80=AFAM Lucas Stach <l.stach@pengutron=
ix.de> wrote:
> > > Am Mittwoch, dem 24.04.2024 um 08:37 +0200 schrieb Tomeu Vizoso:
> > > > If we expose a render node for NPUs without rendering capabilities,=
 the
> > > > userspace stack will offer it to compositors and applications for
> > > > rendering, which of course won't work.
> > > >
> > > > Userspace is probably right in not questioning whether a render nod=
e
> > > > might not be capable of supporting rendering, so change it in the k=
ernel
> > > > instead by exposing a /dev/accel node.
> > > >
> > > > Before we bring the device up we don't know whether it is capable o=
f
> > > > rendering or not (depends on the features of its blocks), so first =
try
> > > > to probe a rendering node, and if we find out that there is no rend=
ering
> > > > hardware, abort and retry with an accel node.
> > >
> > > On the other hand we already have precedence of compute only DRM
> > > devices exposing a render node: there are AMD GPUs that don't expose =
a
> > > graphics queue and are thus not able to actually render graphics. Mes=
a
> > > already handles this in part via the PIPE_CAP_GRAPHICS and I think we
> > > should simply extend this to not offer a EGL display on screens witho=
ut
> > > that capability.
> >
> > The problem with this is that the compositors I know don't loop over
> > /dev/dri files, trying to create EGL screens and moving to the next
> > one until they find one that works.
> >
> > They take the first render node (unless a specific one has been
> > configured), and assumes it will be able to render with it.
> >
> > To me it seems as if userspace expects that /dev/dri/renderD* devices
> > can be used for rendering and by breaking this assumption we would be
> > breaking existing software.
>
> Mm, it's sort of backwards from that. Compositors just take a
> non-render DRM node for KMS, then ask GBM+EGL to instantiate a GPU
> which can work with that. When run in headless mode, we don't take
> render nodes directly, but instead just create an EGLDisplay or
> VkPhysicalDevice and work backwards to a render node, rather than
> selecting a render node and going from there.
>
> So from that PoV I don't think it's really that harmful. The only
> complication is in Mesa, where it would see an etnaviv/amdgpu/...
> render node and potentially try to use it as a device. As long as Mesa
> can correctly skip, there should be no userspace API implications.
>
> That being said, I'm not entirely sure what the _benefit_ would be of
> exposing a render node for a device which can't be used by any
> 'traditional' DRM consumers, i.e. GL/Vulkan/winsys.

What I don't understand yet from Lucas proposal is how this isn't
going to break existing userspace.

I mean, even if we find a good way of having userspace skip
non-rendering render nodes, what about existing userspace that isn't
able to do that? Any updates to newer kernels are going to break them.

Regards,

Tomeu
