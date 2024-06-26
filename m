Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FC3918A55
	for <lists+etnaviv@lfdr.de>; Wed, 26 Jun 2024 19:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4199910E977;
	Wed, 26 Jun 2024 17:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="dNjg84e2";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E15310E977
 for <etnaviv@lists.freedesktop.org>; Wed, 26 Jun 2024 17:49:23 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-424a4bc95f3so2210005e9.0
 for <etnaviv@lists.freedesktop.org>; Wed, 26 Jun 2024 10:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719424161; x=1720028961; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sX7Zj9l5V8x3qQly+roBBZUclWmvPtx7Y0rt4ZV8Wcw=;
 b=dNjg84e2/6bnyNeYIPfRRcy3v1XPi0p5HQ1yPT47mp8Z3EzA79gQgcbKBGRN/8Wrsk
 nuP8lRABsIfavzh3tmO0v8FSlDE+fuSez4qNsZU60hZhFbDJxHauaKlPZzawpQwreXtc
 YNVGkdxhJzto3fDJvJDJe465YoNahJaekrhA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719424161; x=1720028961;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sX7Zj9l5V8x3qQly+roBBZUclWmvPtx7Y0rt4ZV8Wcw=;
 b=XvxyFy3uE4eKS1MLHJQ2L1+je5YtW3cId/31rgX/nuDtaarujSVGuZ6rhgQ1ffZFS3
 Ub4Z1dqYnfFTXAlulI9PZKRamnRoUrik5GGF/L3x270dPLucJMAUmwgx5NYi11Opu0xD
 iIZIOwHg4rxSgdD33I+1c0MQ/CeCgz5xcISc8DUyifB3FHwYteO6KJJwblYRYdu15A8b
 +KDfrTSPZhPwL/pJxFg4VzOapJDZhiR2jE5MCg2zQ4BulLI8tOqvcs44AhaxT9UN3HXD
 msd5gKml2g018jr7LRxlrAsfT6BlVwn9jf0gIcnA3xHoI5NB9WOVU26OP3SD8OcTuw11
 JsJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrpkUIeV39KI91KsTnuxw8Fzks/tHM+tF2wLqJYr+bEY8MjfkxBxv34yhGvlH5STmXhAcjBxbilBRqXL4Q7eTw1i2MVfGKQFD3wy8XDg==
X-Gm-Message-State: AOJu0Yx/pd+QfDASSWxwmK5zN8eUF0Hd0NGr4c2RvylrLZCw6vlBlw93
 f6IRuOwmujchYp/QmOOIJPbwrLFYjYHJ7MotIfIA8MVfk0x1sLUZJcx077pUBbg=
X-Google-Smtp-Source: AGHT+IFr3ZABZiy03lqUeRPhYzyS7ggrE9v3MW97jwVlfg/GFjNRcktMFhWpPbw+eCxkNBqIbjZUYA==
X-Received: by 2002:a5d:457a:0:b0:366:e496:1caa with SMTP id
 ffacd0b85a97d-366e4961e22mr6278822f8f.5.1719424161485; 
 Wed, 26 Jun 2024 10:49:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a2f8268sm16355746f8f.79.2024.06.26.10.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 10:49:21 -0700 (PDT)
Date: Wed, 26 Jun 2024 19:49:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-kernel@vger.kernel.org,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
Message-ID: <ZnxUn312E5c79jKh@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Oded Gabbay <ogabbay@kernel.org>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-kernel@vger.kernel.org,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <8c55dba5-6308-685e-13da-e728197d8101@quicinc.com>
 <CAAObsKD4-k7Ya4Mi=vEPaC9DucbnVGDO5SaEUt-_o2_Bg+_FgA@mail.gmail.com>
 <CAAObsKCm49y-nUph=m9c+-eG37SaGKG93-1etwOQab4f5MXxOg@mail.gmail.com>
 <20240509144118.baib2pftmpk5nikr@GABBAY.>
 <ZnvCsJfdZdLvw1ZN@phenom.ffwll.local>
 <kzk46s2hqrbipehnqhcx47q5mtkdjc3oeeobr2jwinw2ch3pra@37xuwtyakeus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kzk46s2hqrbipehnqhcx47q5mtkdjc3oeeobr2jwinw2ch3pra@37xuwtyakeus>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Wed, Jun 26, 2024 at 11:42:24AM +0300, Dmitry Baryshkov wrote:
> On Wed, Jun 26, 2024 at 09:26:40AM GMT, Daniel Vetter wrote:
> > On Thu, May 09, 2024 at 05:41:18PM +0300, Oded Gabbay wrote:
> > > On Thu, May 09, 2024 at 03:53:01PM +0200, Tomeu Vizoso wrote:
> > > > Oded, Dave,
> > > > 
> > > > Do you have an opinion on this?
> > > > 
> > > > Thanks,
> > > > 
> > > > Tomeu
> > > Hi Tomeu,
> > > 
> > > Sorry for not replying earlier, I was down with Covid (again...).
> > > 
> > > To your question, I don't have an objection to what you are
> > > suggesting. My personal view of accel is that it is an integral part of 
> > > DRM and therefore, if there is an *existing* drm driver that wants to 
> > > create an accel node, I'm not against it. 
> > 
> > Yeah, there's a continum from "clearly 3d gpu" to "compute AI
> > accelerator", with everything possible in-between shipping somewhere.
> > Collaboration is the important part, hair-splitting on where exactly the
> > driver should be is kinda secondary. I mean beyond "don't put a pure 3d
> > driver into accel or vice versa" of course :-)
> > 
> > > There is the question of why you want to expose an accel node, and
> > > here I would like to hear Dave's and Sima's opinion on your suggested
> > > solution as it may affect the direction of other drm drivers.
> > 
> > So existing userspace that blindly assumes that any render node will give
> > it useful 3d acceleration, then that's broken already.
> > 
> > - kernel with new driver support but old mesa without that driver already
> >   gives you that, even for a pure 3d chip.
> > 
> > - intel (and I think also amd) have pure compute chips without 3d, so this
> >   issue already exists
> > 
> > Same for the other directions, 3d gpus have variable amounts of compute
> > chips nowadays.
> > 
> > That leaves imo just the pragmatic choice, and if we need to complicate
> > the init flow of the kernel driver just for a different charnode major,
> > then I don't really see the point.
> > 
> > And if we do see the point in this, I think the right approach would be if
> > we split the init flow further into allocating the drm_device, and then in
> > a 2nd step either allocate the accel or render uapi stuff as needed. The
> > DRIVER_FOO flags just aren't super flexible for this kinda of stuff and
> > have a bit a midlayer taste to them.
> 
> Being able to defer render allocation would be extremely useful for MSM
> too as it's not currently possible to mask the driver_features during
> drm_dev_init()

Eh I think less driver_features and more explicit (like
drm_mode_config_init() instead of also having to set DRIVER_MODESET) stuff
would be better in general. But they keep popping up, because it's an easy
hack to get things going. Over the years I've managed to remove a lot of
them tough.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
