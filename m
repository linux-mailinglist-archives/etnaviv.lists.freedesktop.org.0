Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB9919843
	for <lists+etnaviv@lfdr.de>; Wed, 26 Jun 2024 21:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F6D10E085;
	Wed, 26 Jun 2024 19:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="mVByQcXX";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A26310E06A
 for <etnaviv@lists.freedesktop.org>; Wed, 26 Jun 2024 19:26:16 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e0341a18a07so287994276.3
 for <etnaviv@lists.freedesktop.org>; Wed, 26 Jun 2024 12:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1719429976; x=1720034776;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GVl4BQ6sqlR4mjMHtG/aBZ04wixynHgTyVj8qKUVA2Q=;
 b=mVByQcXXdbKvZLtFdrJZzHfTkDywAD38afoef1mIwYY4TWo7xlMZFCzMFoqqfQn8yV
 NvCvdDb9pWykrRy+HUcfheKeBUwq94wTE0vte8JqKzWRklQVKi/XOab6PXDra5wcn7ax
 tkvxEZx3WVcCKfT8josSvsK0tDPvtDcbOslLhEKEbaXms6yEqsjii/HAn2Cg9GXradzO
 Tm0JFG1DVIpQjHB0v8iWJ1o/NiqWbY9jfW8ynt7zzn8OZpnNtPL2QK1TrTaR6Ykpt8DJ
 KwGbSaEkVH4h2WEHMF9vePzdRf4tnD3cZHv/l34xAMg/YIKKffM3xAVpSo4rzllQm8UA
 dojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719429976; x=1720034776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GVl4BQ6sqlR4mjMHtG/aBZ04wixynHgTyVj8qKUVA2Q=;
 b=oEr5bOYYswKqG+bkrCdPk2K0EqwjFr+Ktu1sPYzGL9/FuDlmGn9J2heMQxfGMpqCra
 +AoTiWrLh+dyWF3hTObr3rYdEddLgiYvz80ll6dxhkdeEjbZWKuESEhj8pU6IZVQbP+H
 5ONJjuzT4J4deW0JbMHPQmX2yg6F2aByq+osVzFKODwh8VBIEsjfhGqCVTjJOxOqUkUq
 C7n2DHZCPkZwQu57PybtmT5hzQS41WAuoc/4hNqVos6vZS8wmPVQTmf5j45mMY/OgvhL
 NV9F7sNMZWruwRMXNYgd84eKH4wfxsD88AxeblxySq2OWiSoJeLLAE9Y2t+u1458ms07
 rYCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuHebFTWZNso9t8ibB9KTZB+F3ElARae+iwiRfCUcx/i/1vsYiwKCMLlIL/tOBnA/c9wQ0mop0IV+opLOJYgN0AdL1CB8qD2K8TME5rQ==
X-Gm-Message-State: AOJu0YzFU1KcJNpBDbVQHapIwpOHjJX4n4i/B6YtDcrFYZQOUCIJmh+Y
 Z0wlTBaiSac8CDBJXfR6ydkcLMqHBEQlYS0VdoDJkGE2akKMfeukpTJfbI7PxUVMNZVUpjE6GSS
 NoOzP4lHwK34WM78k3N5BOT97LAfLX/LgbbJw1A==
X-Google-Smtp-Source: AGHT+IFt9KNQizJBtwoRXxWdC6bUl1zuw9W0N9wHHiqYCJjNt45BiH7o0/gvXjy2ppmL5ZWgdXc1asVtAQt+LlPdi30=
X-Received: by 2002:a25:b2a3:0:b0:e02:be9e:ba8 with SMTP id
 3f1490d57ef6-e0303ffb60cmr11195525276.44.1719429975867; Wed, 26 Jun 2024
 12:26:15 -0700 (PDT)
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
In-Reply-To: <ZnxVWrFJKbVO8PZ0@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 Jun 2024 20:26:04 +0100
Message-ID: <CAPj87rPnA1eKR_b7gAhDiMZRcVt8xPS9xnsscqVQ_a_qO_tD4A@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Daniel Stone <daniel@fooishbar.org>, Lucas Stach <l.stach@pengutronix.de>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org, 
 Oded Gabbay <ogabbay@kernel.org>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Daniel Stone <daniels@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
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

On Wed, 26 Jun 2024 at 18:52, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Jun 26, 2024 at 11:39:01AM +0100, Daniel Stone wrote:
> > On Wed, 26 Jun 2024 at 09:28, Lucas Stach <l.stach@pengutronix.de> wrote:
> > > So we are kind of stuck here between breaking one or the other use-
> > > case. I'm leaning heavily into the direction of just fixing Mesa, so we
> > > can specify the type of screen we need at creation time to avoid the
> > > renderonly issue, porting this change as far back as reasonably
> > > possible and file old userspace into shit-happens.
> >
> > Yeah, honestly this sounds like the best solution to me too.
>
> Yeah mesa sounds kinda broken here ...
>
> What might work in the kernel is if you publish a fake 3d engine that's
> too new for broken mesa, if that's enough to make it fail to bind? And if
> mesa still happily binds against that, then yeah it's probably too broken
> and we need etnaviv-v2 (as a drm driver uapi name, I think that's what
> mesa filters?) for anything new (including the NN-only ones).
>
> I would still try to avoid that, but just in case someone screams about
> regressions.

It's not just etnaviv, it's literally every Mesa driver which works
with decoupled render/display. So that would be etnaviv-v2,
panfrost-v2, panthor-v2, v3d-v2, powervr-v2, ... albeit those don't
tend to have multiple instances.

Anyway, I'm still leaning towards the answer being: this is not an
etnaviv regression caused by NPU, it's a longstanding generic Mesa
issue for which the answer is to fix the known fragility.

Cheers,
Daniel
