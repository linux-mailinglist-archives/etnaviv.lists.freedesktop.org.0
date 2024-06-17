Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242BB90B741
	for <lists+etnaviv@lfdr.de>; Mon, 17 Jun 2024 19:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADDB10E469;
	Mon, 17 Jun 2024 17:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="fcjJ8Vz3";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFC710E469
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Jun 2024 17:01:19 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6316253dc52so34063097b3.0
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Jun 2024 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1718643679;
 x=1719248479; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ggtgEFWxLY5KzKGMkn+w0yd/JsuWTu5QxX/rhOCIS4Q=;
 b=fcjJ8Vz3ahU0JKn8chv90sMSBrmnq8EeO02djG8UTjnlF0OmAJNDncLcARK/Ks8JFE
 X38bBMA4FAFN4scVtIAuKuolh/1K+gpZY3mNBLaDzDIdn93JzXygjg+Ek3QvdnloZL0t
 DVquB2D1YBqHdlZMPqxtbsL1U4bgb3TlJjkTvLciaper8kIC0Ia7xSumxljooflA8+Cs
 hQlFl6mPfq4ICl1Vxk3SqX3tAwN7t4rZOmKja2TgOqNf76SWGJNij74H1OU3/6pVJqzB
 mtTWWQxVWX3sf1PACTneVWrmg+vyp6sMQyz0tV4/7CvdzEFSmeJbYMWat4Ku7FJva2D/
 MsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718643679; x=1719248479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ggtgEFWxLY5KzKGMkn+w0yd/JsuWTu5QxX/rhOCIS4Q=;
 b=YzbVsAmiKVCMzZqmIoHvoM3WiYezOpUxESGt0A011IAfp4D1p530nmbRGsukPIdA1g
 dgUO5kkP39CG/QaIdtv8oVQSYg23XOp7jJaNCg2tBt7K75lKYONNbjxqj6FWdp7o5Zbk
 TxUJ9MyKAHpauGPQv3ktX0BFPxarMkgDZyB14T12BZVy5UoQFx0XzpD5wCIPisl9752k
 DhrUL1VyynnC7ca1zek+V5kRkdzz/ye70PDxx0ATIZAhLyCp5/DaSAfI4DulfKu0vA2S
 namkBzDLq+yT7KxB0GOTL36Jg6rwkrgWjlNLXsZ6eUeJnscljuXfxEvD7OEpX6pjuG2b
 /zTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNbyg/SbwC5c1uCZ81/UEGekZOt01gKzxTD+YRf1QE11LJtEXjKBOyadZj/2+b9Q4lEm6OSrUycLfIf/bJ2Y6jmZAxFrl8tX4fanGqBg==
X-Gm-Message-State: AOJu0YyPRngiC4U8nWbKaBDnal2F6OJVKfInPraumsozI/8z1vQghbWj
 HycikSxg4RcsQFIxQrR0JIXDV6V0zz5acFsfz9W064alcVBYAp8tItaIUP2ocUsfTPB9KlmsYK1
 +QImT9g==
X-Google-Smtp-Source: AGHT+IFxTZUZM2LQO4aCUWrMQujC1KOSH9h81EQD4K1ZEJG5kbxlc03Q2zw1nTdW8BC93YaV62yjtQ==
X-Received: by 2002:a05:690c:4906:b0:62c:c684:b1e1 with SMTP id
 00721157ae682-63222a51546mr114096517b3.29.1718643678827; 
 Mon, 17 Jun 2024 10:01:18 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-63118e998dasm14540007b3.65.2024.06.17.10.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 10:01:17 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-632980b9c03so29842717b3.2; 
 Mon, 17 Jun 2024 10:01:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUI/wc63ruj8q1vm804f7EjKRy8ozbCsGVFfUKLwPo++SwTTr42ah4QnrpsDlZ9mVxVJuorHN63NT9fgnQ6cJAiqN8FQIYyBvU/AED1lRclVIrTeZI7VZ+TtvjUHmCP/hi5HmsGbD+o86seIA8XSA==
X-Received: by 2002:a25:2e4e:0:b0:dfa:ccb2:b18 with SMTP id
 3f1490d57ef6-dff153422ddmr9460718276.6.1718643677298; Mon, 17 Jun 2024
 10:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
 <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
 <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
 <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
In-Reply-To: <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 17 Jun 2024 19:01:05 +0200
X-Gmail-Original-Message-ID: <CAAObsKAt563VNzDcF4rGkWPcxBPzKcq=Hj5RY6K20FWR43nvUQ@mail.gmail.com>
Message-ID: <CAAObsKAt563VNzDcF4rGkWPcxBPzKcq=Hj5RY6K20FWR43nvUQ@mail.gmail.com>
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

Hi Lucas,

Do you have any idea on how not to break userspace if we expose a render no=
de?

Cheers,

Tomeu

On Wed, Jun 12, 2024 at 4:26=E2=80=AFPM Tomeu Vizoso <tomeu@tomeuvizoso.net=
> wrote:
>
> On Mon, May 20, 2024 at 1:19=E2=80=AFPM Daniel Stone <daniel@fooishbar.or=
g> wrote:
> >
> > Hi,
> >
> > On Mon, 20 May 2024 at 08:39, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrot=
e:
> > > On Fri, May 10, 2024 at 10:34=E2=80=AFAM Lucas Stach <l.stach@pengutr=
onix.de> wrote:
> > > > Am Mittwoch, dem 24.04.2024 um 08:37 +0200 schrieb Tomeu Vizoso:
> > > > > If we expose a render node for NPUs without rendering capabilitie=
s, the
> > > > > userspace stack will offer it to compositors and applications for
> > > > > rendering, which of course won't work.
> > > > >
> > > > > Userspace is probably right in not questioning whether a render n=
ode
> > > > > might not be capable of supporting rendering, so change it in the=
 kernel
> > > > > instead by exposing a /dev/accel node.
> > > > >
> > > > > Before we bring the device up we don't know whether it is capable=
 of
> > > > > rendering or not (depends on the features of its blocks), so firs=
t try
> > > > > to probe a rendering node, and if we find out that there is no re=
ndering
> > > > > hardware, abort and retry with an accel node.
> > > >
> > > > On the other hand we already have precedence of compute only DRM
> > > > devices exposing a render node: there are AMD GPUs that don't expos=
e a
> > > > graphics queue and are thus not able to actually render graphics. M=
esa
> > > > already handles this in part via the PIPE_CAP_GRAPHICS and I think =
we
> > > > should simply extend this to not offer a EGL display on screens wit=
hout
> > > > that capability.
> > >
> > > The problem with this is that the compositors I know don't loop over
> > > /dev/dri files, trying to create EGL screens and moving to the next
> > > one until they find one that works.
> > >
> > > They take the first render node (unless a specific one has been
> > > configured), and assumes it will be able to render with it.
> > >
> > > To me it seems as if userspace expects that /dev/dri/renderD* devices
> > > can be used for rendering and by breaking this assumption we would be
> > > breaking existing software.
> >
> > Mm, it's sort of backwards from that. Compositors just take a
> > non-render DRM node for KMS, then ask GBM+EGL to instantiate a GPU
> > which can work with that. When run in headless mode, we don't take
> > render nodes directly, but instead just create an EGLDisplay or
> > VkPhysicalDevice and work backwards to a render node, rather than
> > selecting a render node and going from there.
> >
> > So from that PoV I don't think it's really that harmful. The only
> > complication is in Mesa, where it would see an etnaviv/amdgpu/...
> > render node and potentially try to use it as a device. As long as Mesa
> > can correctly skip, there should be no userspace API implications.
> >
> > That being said, I'm not entirely sure what the _benefit_ would be of
> > exposing a render node for a device which can't be used by any
> > 'traditional' DRM consumers, i.e. GL/Vulkan/winsys.
>
> What I don't understand yet from Lucas proposal is how this isn't
> going to break existing userspace.
>
> I mean, even if we find a good way of having userspace skip
> non-rendering render nodes, what about existing userspace that isn't
> able to do that? Any updates to newer kernels are going to break them.
>
> Regards,
>
> Tomeu
