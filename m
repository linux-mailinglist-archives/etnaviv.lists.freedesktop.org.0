Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D1A91BBC0
	for <lists+etnaviv@lfdr.de>; Fri, 28 Jun 2024 11:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC1E10E235;
	Fri, 28 Jun 2024 09:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="sOpW4zjt";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4DD10E20F
 for <etnaviv@lists.freedesktop.org>; Fri, 28 Jun 2024 09:43:36 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-645808a3294so3385017b3.3
 for <etnaviv@lists.freedesktop.org>; Fri, 28 Jun 2024 02:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1719567815;
 x=1720172615; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8qzmRAVdcytlDvjKg3zIzhlsAspcHn166tJNqg286RQ=;
 b=sOpW4zjte/EU33GbmLLf70vEhM2ZSWaxlLNNwtm4RLddQG7GRSEG5ZMC8kFGEI+9kd
 /o44/19LmFiDFbuRTAD8QyVzBimOHOUUiGXO9BjF58pZ+WmpqsHi4Xg81N9FuFhojH99
 kAtp7tCNCCAtENmALu3VuIguXFtt15ZIXKRYxNqw6tfR4YQNwfLKnIrGy8OWAx4v8shv
 BSJM03H4gavAT+Rba2XmYXLhZISUs821ToT+sSh5n84Vw5R434sNI/5Z9Vt3ru7113Sj
 JBzR4/Cs3VPb7eWPrf1i9pzHsUDEwrhNj7VKcS3c1NTEymslh8s6JBo/NjgXyzcawxPu
 D97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719567815; x=1720172615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8qzmRAVdcytlDvjKg3zIzhlsAspcHn166tJNqg286RQ=;
 b=PUJOps/XDg/kKITNZkBAkOMUH3mQP59ynsUFzdURpklZpHT4Se0n7yombZyrNvExAw
 nuWiCfKqXl3GKribvoQnDRnxanldbi7rAHOYsnEct/z43+U3wcNaE/n7hrHswlyJWtXq
 nnEKpshJhgffcjvPuwBn+EXqUL3Bgsxd9tyklz2xTiUs5ibjtiYG57wBNLyTK2JmcZgI
 kEz5mmy+sbT2A5NKkjSbKKbQ0cV+uZrKkQSOX5l0FBXvb37KqSKc/BOLYQ8ARcUdO+0T
 EbZJFA5xgVNbg+LPIniOBQvCamkMIJe+wEcRrJ82vW4A2n2ROi2ebZmZ/OkGbX6PEPJX
 OItw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrOG4Jg50C7Di8RP/1GaKqRwG/oTe/YUCITFu4L/JTmrtcG7i5uk9glBRPeSMh8s486IauYXT8p4n4QD552Zy70j8uZig+Xm2o+t0Frg==
X-Gm-Message-State: AOJu0Yzj3IUpz86Z2SxUYKYlff4fr8W+SBMNe/djXDU9/d1XJVSYhNyM
 o6ljEq6ML64xmoJ8VrCbNLdOv9nWCmf9s5I25RJ3q7L3vVSsy4wFIRziyUUsmAOKB5FrsdaFUpE
 Q7sg=
X-Google-Smtp-Source: AGHT+IGowEhPYNp+j/wnMUTZSR7ogC4H26rRfJlyOs+e1ift48yG3aBC1sTTVBfzreXfG3bx1LLC7g==
X-Received: by 2002:a0d:fd85:0:b0:61a:ed1e:ecd with SMTP id
 00721157ae682-64341e147c8mr151453237b3.50.1719567815117; 
 Fri, 28 Jun 2024 02:43:35 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-64a9a23bad1sm2761897b3.31.2024.06.28.02.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:43:34 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e02c4983bfaso363207276.2; 
 Fri, 28 Jun 2024 02:43:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVzWP7vemF5BK9B95/zm7esjJdrgaPbRXEEwyPwNMVt7GhBvxJ3l2xohtoUAPxMsvwDtk6eruPYgKzZKfaha6WtXm70LAp2J1vyPXUZxdCQ1jLPHts+NYyiH12rp89N4rKgT7KcxyJIqwLQg8nBtg==
X-Received: by 2002:a25:b183:0:b0:e03:5edd:99b5 with SMTP id
 3f1490d57ef6-e035edd9b77mr753201276.4.1719567813979; Fri, 28 Jun 2024
 02:43:33 -0700 (PDT)
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
In-Reply-To: <CAPj87rPnA1eKR_b7gAhDiMZRcVt8xPS9xnsscqVQ_a_qO_tD4A@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 28 Jun 2024 11:43:23 +0200
X-Gmail-Original-Message-ID: <CAAObsKATM0hQ=XTzTTucArBzSnVEu-CfdkUU4c6UVHd1+G5-gw@mail.gmail.com>
Message-ID: <CAAObsKATM0hQ=XTzTTucArBzSnVEu-CfdkUU4c6UVHd1+G5-gw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Daniel Stone <daniel@fooishbar.org>
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

On Wed, Jun 26, 2024 at 9:26=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> On Wed, 26 Jun 2024 at 18:52, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Jun 26, 2024 at 11:39:01AM +0100, Daniel Stone wrote:
> > > On Wed, 26 Jun 2024 at 09:28, Lucas Stach <l.stach@pengutronix.de> wr=
ote:
> > > > So we are kind of stuck here between breaking one or the other use-
> > > > case. I'm leaning heavily into the direction of just fixing Mesa, s=
o we
> > > > can specify the type of screen we need at creation time to avoid th=
e
> > > > renderonly issue, porting this change as far back as reasonably
> > > > possible and file old userspace into shit-happens.
> > >
> > > Yeah, honestly this sounds like the best solution to me too.
> >
> > Yeah mesa sounds kinda broken here ...
> >
> > What might work in the kernel is if you publish a fake 3d engine that's
> > too new for broken mesa, if that's enough to make it fail to bind? And =
if
> > mesa still happily binds against that, then yeah it's probably too brok=
en
> > and we need etnaviv-v2 (as a drm driver uapi name, I think that's what
> > mesa filters?) for anything new (including the NN-only ones).
> >
> > I would still try to avoid that, but just in case someone screams about
> > regressions.

Thanks everybody for chiming in.

> It's not just etnaviv, it's literally every Mesa driver which works
> with decoupled render/display. So that would be etnaviv-v2,
> panfrost-v2, panthor-v2, v3d-v2, powervr-v2, ... albeit those don't
> tend to have multiple instances.

TBH, I think VeriSilicon is the only IP vendor that has recycled a
render-only IP into a compute-only IP.

That is why I liked the approach of conditionally creating an accel
node, as it neatly reflects that reality.

> Anyway, I'm still leaning towards the answer being: this is not an
> etnaviv regression caused by NPU, it's a longstanding generic Mesa
> issue for which the answer is to fix the known fragility.

My understanding of the consensus so far is that Mesa should be fixed
so that Gallium drivers can fail at screen init if the device doesn't
support some new usage flags that we would be adding.

If for some reason that doesn't work, we would be looking at having
etnaviv use a different kind of driver name, such as etnaviv-npu or
etnaviv-compute.

Did I get it right?

Thanks,

Tomeu
