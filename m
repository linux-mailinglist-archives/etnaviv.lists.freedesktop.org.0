Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C7B8C9C0D
	for <lists+etnaviv@lfdr.de>; Mon, 20 May 2024 13:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED5A10E66C;
	Mon, 20 May 2024 11:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="tIBE99c0";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4336410E66D
 for <etnaviv@lists.freedesktop.org>; Mon, 20 May 2024 11:19:53 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7948b7e4e5dso24640385a.1
 for <etnaviv@lists.freedesktop.org>; Mon, 20 May 2024 04:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1716203992; x=1716808792;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XcAkCrUUp3v82N3Nes852/6WDKEZVaV70AZavoqjXfU=;
 b=tIBE99c0OQAqdzgBpgMjP0SzuD1sMFk0iD16aTE+yv/hWk24FeB66HbCAdyV21KDa7
 3uCXoI0dPZOOYzBYavOnYB1CDagTipKqXvt07M6gGCaNEHnuBKxpm7T8mUikPj4YfMP4
 ncJ9sWrcb5dDPbflFVSFu99dx5YFzsIYTlMTMPdAl1pLQwQ6GCdLngguLfgDO42mZeHK
 5MMzwQKfOgHhHQm+d9Gn6D4J1+E5kBl5unYf/HgzTUmtnhJ42ozgxj0UE1NAIsAZ9flw
 OLeur/skzEWTwd4V/hxZxet+EKxp0ifbiZE1Y9UIFvlPzY1zjK5KaSC0Si+SMTxX+WjQ
 Eq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716203992; x=1716808792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XcAkCrUUp3v82N3Nes852/6WDKEZVaV70AZavoqjXfU=;
 b=gGshfPneYcEBZJzTcHHg+zB9j3UHYPuKBnq/XqiO2b8RjoWIX/pAn0vCGDQO20X7sy
 YfRX6lzum6asZqdmUfCGtYWAdA0/xYxsbMVrPHic4mdpGQjOWa04GNFAgheLF5uMhgkD
 vk85OvbFibzOo90/32Mri7UgYXcU7SyiM54WYbXTIKlrTbsj22QT++mn9dHIt4RWxCix
 NsErbqQB17g2Qu9Upia0M1P61u8NuSz0rmuFVFaE95gDPXh97w+2v7tzd/AMpkyVO2Zr
 OXkV8072VV32pYvqZJ7M97qLQ3mTyJWUktsx2nsBfxDUDi8dxIgR7L9mjlR1DM8whYru
 EuuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKr7XtqHfvMpKLeECBTJBPGomli3FgRvXc74wp9QVkuoVOjLW8XLoTys7qZyYATE8IXSSA3kiNHOVJr0EouPMZOZaSc4FkaV9njrTogg==
X-Gm-Message-State: AOJu0YyXcWgKacG0TtW5089l6AGoleRaiAq3znYxZYh/Wvsl1OzLMQZf
 FJnGaaxsKShiFjAqmIQDZ4BQvmJoaTi2ZpbWhrRn9BBV6b3SiS/l3tz5xcajhFWcUvOXDDrSHIh
 3ReZB4fqEhpEz5im+T0sZZx8XxnkOTXWxhxDK5A==
X-Google-Smtp-Source: AGHT+IF9QqTZAJOGL9hX5enwhsws06RKb4rc6h3DEa//4Gpj+yXe03WFhBY5czWR0TmSy2w5QCwMYSbalfMBsJ2uDWE=
X-Received: by 2002:a05:620a:56d2:b0:790:c017:89e2 with SMTP id
 af79cd13be357-792c7577a26mr3027043685a.16.1716203991836; Mon, 20 May 2024
 04:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
 <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
In-Reply-To: <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 20 May 2024 12:19:40 +0100
Message-ID: <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
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

Hi,

On Mon, 20 May 2024 at 08:39, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> On Fri, May 10, 2024 at 10:34=E2=80=AFAM Lucas Stach <l.stach@pengutronix=
.de> wrote:
> > Am Mittwoch, dem 24.04.2024 um 08:37 +0200 schrieb Tomeu Vizoso:
> > > If we expose a render node for NPUs without rendering capabilities, t=
he
> > > userspace stack will offer it to compositors and applications for
> > > rendering, which of course won't work.
> > >
> > > Userspace is probably right in not questioning whether a render node
> > > might not be capable of supporting rendering, so change it in the ker=
nel
> > > instead by exposing a /dev/accel node.
> > >
> > > Before we bring the device up we don't know whether it is capable of
> > > rendering or not (depends on the features of its blocks), so first tr=
y
> > > to probe a rendering node, and if we find out that there is no render=
ing
> > > hardware, abort and retry with an accel node.
> >
> > On the other hand we already have precedence of compute only DRM
> > devices exposing a render node: there are AMD GPUs that don't expose a
> > graphics queue and are thus not able to actually render graphics. Mesa
> > already handles this in part via the PIPE_CAP_GRAPHICS and I think we
> > should simply extend this to not offer a EGL display on screens without
> > that capability.
>
> The problem with this is that the compositors I know don't loop over
> /dev/dri files, trying to create EGL screens and moving to the next
> one until they find one that works.
>
> They take the first render node (unless a specific one has been
> configured), and assumes it will be able to render with it.
>
> To me it seems as if userspace expects that /dev/dri/renderD* devices
> can be used for rendering and by breaking this assumption we would be
> breaking existing software.

Mm, it's sort of backwards from that. Compositors just take a
non-render DRM node for KMS, then ask GBM+EGL to instantiate a GPU
which can work with that. When run in headless mode, we don't take
render nodes directly, but instead just create an EGLDisplay or
VkPhysicalDevice and work backwards to a render node, rather than
selecting a render node and going from there.

So from that PoV I don't think it's really that harmful. The only
complication is in Mesa, where it would see an etnaviv/amdgpu/...
render node and potentially try to use it as a device. As long as Mesa
can correctly skip, there should be no userspace API implications.

That being said, I'm not entirely sure what the _benefit_ would be of
exposing a render node for a device which can't be used by any
'traditional' DRM consumers, i.e. GL/Vulkan/winsys.

Cheers,
Daniel
