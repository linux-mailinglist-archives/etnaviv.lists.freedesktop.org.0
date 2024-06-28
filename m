Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C3991BBF7
	for <lists+etnaviv@lfdr.de>; Fri, 28 Jun 2024 11:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D3410E235;
	Fri, 28 Jun 2024 09:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="bMbKAWbq";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1933B10E235
 for <etnaviv@lists.freedesktop.org>; Fri, 28 Jun 2024 09:54:34 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-706aab1b7ffso367680b3a.1
 for <etnaviv@lists.freedesktop.org>; Fri, 28 Jun 2024 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1719568473; x=1720173273;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9yd5IeywhU3UMB+zoN0GXyMJftk0239YPKabyLj6sg=;
 b=bMbKAWbqXnlMd0ijGg9PYBUH6rvGn93pAiXGdBNNPS3ynrrzCiOGDkYu/Xsek4RzSP
 Vw2p2CzrpFRm9LS/T/9ZmZCuRh2B/8Oao2RulIneofloVPUYQVWyUQ2f49GY7SGGCy0K
 fgGmmW9HXxrtgCkXPMorQyhtnW/d9q0GJ64XR1aHO7F+znoOiDYStwfPLccvnG9L6cxS
 n+85WgtWTCXr2fd7f3vgaoulrfl2RVWuKE3il8Iy7zme2FI0ytEZc3ly6d8nfVM7tSQE
 9zvGpgV+RIVDBwdPNWowyiSMmLwMMCjPyS5VKq043Wq4KCjquMHoe4YR5n73cNKYWN4j
 ecXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719568473; x=1720173273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i9yd5IeywhU3UMB+zoN0GXyMJftk0239YPKabyLj6sg=;
 b=wZftjXJfjD3gYPzoGjIgFDNRsz1FORfSHPn6dUyNngLheM2On76BE6DQQfGSeRjNgV
 1Dchb6OM/9xMsx4VBH6m4F4ioyfVVhmgaZW9/scrAmUhhADCdhzWWsuvdbv05HFbEbrA
 8qn4mj95k4WCqccfbOvbjLkBcwdXx21rcdal1rUR3anoHbjcouLWzs8z2BJuVXqGrRFn
 OA4Xp0J11auDJ5cr82vmOJBc810szuHCIykZOQlUOOyvHNn1nO4vHehO13ThBvFaDPun
 slULSMLW2LhEhC9r8781EvrLlYbvlTJfkc8XntpBoB5/LY0hlufB23gKZSFogrSrcucH
 gZtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhlmCpr/ZkZ1XkvIrz8PD1ab5LzToLLyKn6J3GjktWX+D/HWTafIEdGY9munfsJT6KfAq2OwkzHsp+m1qFM0MA/KSiaQV7GiqvebPaFw==
X-Gm-Message-State: AOJu0Yw5OluEKgbQ6XAb1TniT245aCC+UlM43t05+CK7IlNjI3bhfUjg
 TBAue8fe5S2u/6m1e8wvfSusO4yKXKogeUG3gLdJAEAszB9+DCCevlj4YHgjp6he8CBhieL7r5Q
 jsmnQH4FdDck9y4lBwCamGSZsHWxl48Ce9Dp8fzkSalK4iU6in5k=
X-Google-Smtp-Source: AGHT+IGvcAEX02VPxewqLgLB68oUm1hCavQ9Ot+w2MXu96wdn0wBsvfW3v6NAE8XWNNpFNolk3LKsB/HSTb26oji3wM=
X-Received: by 2002:a05:6a20:3556:b0:1bd:1a36:321b with SMTP id
 adf61e73a8af0-1bd1a363345mr9391899637.60.1719568473476; Fri, 28 Jun 2024
 02:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
 <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
 <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
 <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
 <CAAObsKAt563VNzDcF4rGkWPcxBPzKcq=Hj5RY6K20FWR43nvUQ@mail.gmail.com>
 <ZnvDJVeT3rz-hnv9@phenom.ffwll.local>
 <7cee6b78bc2375d9b014f9671b0d72ae65eba73c.camel@pengutronix.de>
 <CAPj87rPB=N2vJ-5C7xXORYstK3=TpX+jZ7mCr7oxY2wpXeaTTQ@mail.gmail.com>
 <ZnxVWrFJKbVO8PZ0@phenom.ffwll.local>
 <CAPj87rPnA1eKR_b7gAhDiMZRcVt8xPS9xnsscqVQ_a_qO_tD4A@mail.gmail.com>
 <CAAObsKATM0hQ=XTzTTucArBzSnVEu-CfdkUU4c6UVHd1+G5-gw@mail.gmail.com>
In-Reply-To: <CAAObsKATM0hQ=XTzTTucArBzSnVEu-CfdkUU4c6UVHd1+G5-gw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Jun 2024 10:54:20 +0100
Message-ID: <CAPj87rNtzrMjL6tFfDG9-yMAiomi+PxwL0eXW3RYDaJs+knhbw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Lucas Stach <l.stach@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Oded Gabbay <ogabbay@kernel.org>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Daniel Stone <daniels@collabora.com>, Daniel Vetter <daniel@ffwll.ch>
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

On Fri, 28 Jun 2024 at 10:43, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> On Wed, Jun 26, 2024 at 9:26=E2=80=AFPM Daniel Stone <daniel@fooishbar.or=
g> wrote:
> > It's not just etnaviv, it's literally every Mesa driver which works
> > with decoupled render/display. So that would be etnaviv-v2,
> > panfrost-v2, panthor-v2, v3d-v2, powervr-v2, ... albeit those don't
> > tend to have multiple instances.
>
> TBH, I think VeriSilicon is the only IP vendor that has recycled a
> render-only IP into a compute-only IP.
>
> That is why I liked the approach of conditionally creating an accel
> node, as it neatly reflects that reality.
>
> > Anyway, I'm still leaning towards the answer being: this is not an
> > etnaviv regression caused by NPU, it's a longstanding generic Mesa
> > issue for which the answer is to fix the known fragility.
>
> My understanding of the consensus so far is that Mesa should be fixed
> so that Gallium drivers can fail at screen init if the device doesn't
> support some new usage flags that we would be adding.
>
> If for some reason that doesn't work, we would be looking at having
> etnaviv use a different kind of driver name, such as etnaviv-npu or
> etnaviv-compute.
>
> Did I get it right?

Yep, wfm. :)

Cheers,
Daniel
