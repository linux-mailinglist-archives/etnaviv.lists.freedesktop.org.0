Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF62E91C526
	for <lists+etnaviv@lfdr.de>; Fri, 28 Jun 2024 19:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E4E10ECDA;
	Fri, 28 Jun 2024 17:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="NjSr7qyl";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF88710ECDD
 for <etnaviv@lists.freedesktop.org>; Fri, 28 Jun 2024 17:47:15 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ee59cffe01so179891fa.0
 for <etnaviv@lists.freedesktop.org>; Fri, 28 Jun 2024 10:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719596834; x=1720201634; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oXawiii30SbY22A0WpPOSynPJrUU92tc5F+sXUGGBi4=;
 b=NjSr7qylZ4XnOnIwYvYui7eh+bHqdA4oVskHksQqhAvMNJMlh+TbEVr1gMKmTSqjBg
 jdTxBLL5e9H812ZwiWVaEvYDYDd72qoOnJY1lRSyPSrriG1tRQdEXGAFtcni0iCdrHQN
 Mz13H/a1GeWmV8PkYIuaO3AprSherlq81LL4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719596834; x=1720201634;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oXawiii30SbY22A0WpPOSynPJrUU92tc5F+sXUGGBi4=;
 b=slhhcaanGVo6GOtWtkmlyz95FT4sCiJn6zVBHEXpiRc3oHJntfqAltbG1RNbIlsz1i
 Fx/PtJG6E+rEJgdSY4Px7Cs9C84hTF++V3uSrP1cdB5ty8IRMovFmJuYQdTkUmE1jd7h
 YRNUSGKoZElVIjRxVhb88l3FnIOtFKnhHRLOGed7IGXPSVyOMY2fTXqbovfV+Mvi28wJ
 UyyZ75Yjs19pWi4SKJJMlQr8qEksiV1V36uLaJR5MC13bIX2RcQAJ9vGtdXkCDIOSL/A
 ONwk+xikbU7s5KnRTKY8gjHfQc7sAiDK917VbqRiIQVqQ/8D3ZT2DcbO8Qq7WQRxT0TX
 fExg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo7Q9AXKJDd9X07fhKgseFNonsoko1Ze82XmtXUIn1UdspiHSHSS+ZOByyDk6Vfe/UU3auAPkbDwM8evMdU1v2ORQ9lY4d5HSob0lCDA==
X-Gm-Message-State: AOJu0Yzkd/wpvwdJ6z1Ecg9E3bY+BH7UZ9A9nhkcae9iagvRzUP6OgaM
 CnNAnTMVma9MI7qITnnldEKihVOubTTbzgm2Mbck3oukB6uHXfF66P9379SvWMM=
X-Google-Smtp-Source: AGHT+IFupNHWZXb+QLKkwFqtsw/yyqnuJNIOBgzzTmWF8Qysi7dT/74C6TF8L4BTTqPJeAphNz+eXQ==
X-Received: by 2002:a2e:b0d6:0:b0:2ec:4399:9bfc with SMTP id
 38308e7fff4ca-2ec55fe3a56mr117145931fa.0.1719596833481; 
 Fri, 28 Jun 2024 10:47:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b09a073sm44514485e9.32.2024.06.28.10.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 10:47:12 -0700 (PDT)
Date: Fri, 28 Jun 2024 19:47:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
Message-ID: <Zn73Hr14DUHfhDz6@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
References: <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
 <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
 <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
 <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
 <CAAObsKAt563VNzDcF4rGkWPcxBPzKcq=Hj5RY6K20FWR43nvUQ@mail.gmail.com>
 <ZnvDJVeT3rz-hnv9@phenom.ffwll.local>
 <7cee6b78bc2375d9b014f9671b0d72ae65eba73c.camel@pengutronix.de>
 <CAPj87rPB=N2vJ-5C7xXORYstK3=TpX+jZ7mCr7oxY2wpXeaTTQ@mail.gmail.com>
 <ZnxVWrFJKbVO8PZ0@phenom.ffwll.local>
 <CAPj87rPnA1eKR_b7gAhDiMZRcVt8xPS9xnsscqVQ_a_qO_tD4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rPnA1eKR_b7gAhDiMZRcVt8xPS9xnsscqVQ_a_qO_tD4A@mail.gmail.com>
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

On Wed, Jun 26, 2024 at 08:26:04PM +0100, Daniel Stone wrote:
> On Wed, 26 Jun 2024 at 18:52, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Jun 26, 2024 at 11:39:01AM +0100, Daniel Stone wrote:
> > > On Wed, 26 Jun 2024 at 09:28, Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > So we are kind of stuck here between breaking one or the other use-
> > > > case. I'm leaning heavily into the direction of just fixing Mesa, so we
> > > > can specify the type of screen we need at creation time to avoid the
> > > > renderonly issue, porting this change as far back as reasonably
> > > > possible and file old userspace into shit-happens.
> > >
> > > Yeah, honestly this sounds like the best solution to me too.
> >
> > Yeah mesa sounds kinda broken here ...
> >
> > What might work in the kernel is if you publish a fake 3d engine that's
> > too new for broken mesa, if that's enough to make it fail to bind? And if
> > mesa still happily binds against that, then yeah it's probably too broken
> > and we need etnaviv-v2 (as a drm driver uapi name, I think that's what
> > mesa filters?) for anything new (including the NN-only ones).
> >
> > I would still try to avoid that, but just in case someone screams about
> > regressions.
> 
> It's not just etnaviv, it's literally every Mesa driver which works
> with decoupled render/display. So that would be etnaviv-v2,
> panfrost-v2, panthor-v2, v3d-v2, powervr-v2, ... albeit those don't
> tend to have multiple instances.

So essentially mesa just burns&crashes when old mesa runs on a newer
kernel with support for a chip that mesa doesn't know about?

> Anyway, I'm still leaning towards the answer being: this is not an
> etnaviv regression caused by NPU, it's a longstanding generic Mesa
> issue for which the answer is to fix the known fragility.

If the above is correct, then yes I think we should just fix mesa. Feels
like the breakage is too obviously there, and that's all we'll do unless
the screaming gets too loud.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
