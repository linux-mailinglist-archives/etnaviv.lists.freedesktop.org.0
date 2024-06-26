Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19700918B5E
	for <lists+etnaviv@lfdr.de>; Wed, 26 Jun 2024 19:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986D010E978;
	Wed, 26 Jun 2024 17:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ioW4T2fz";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD44610E97E
 for <etnaviv@lists.freedesktop.org>; Wed, 26 Jun 2024 17:52:30 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3673fac1926so1835f8f.1
 for <etnaviv@lists.freedesktop.org>; Wed, 26 Jun 2024 10:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719424349; x=1720029149; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t8h+d1YS2lRYJVmm9UX7UTK0tKF7jVIiE4l199Xa8oo=;
 b=ioW4T2fzr/rw78aXmawB9t3M+BR4+hATJV2kdptGJk4UBkoroIpiycVF7mtbgX9Zhj
 x5MMPxQ8aQt7UVOJXWh2sd7ImeKJ9T2X6KR1J4kLgdDGn+gI1P6xKaLFsv4n7hENIP5H
 BVvWAV44Bk47IBXkx7xA3F7q6D0zfNpnNfA9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719424349; x=1720029149;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t8h+d1YS2lRYJVmm9UX7UTK0tKF7jVIiE4l199Xa8oo=;
 b=IVpYM8+BiD6tw5HSTfeLws66w00FVr826WkD4fP3gTFJLhWnWGs4hJmnJgAn92pxnZ
 OHx6QIEe8Buk7480UFlem+UCtMr2V89Z4OB56ju/kYHl+sk/WMJdjdWvg8hAASE3FTN9
 vmJG8/TM+SKysE2WNuOMCed7FLWKzmJV2Ckl2G02sapvRVV7S/W032B5n7irZKnauSTT
 trL65MxJhQbnYSj5AsEYoM2uMZH7YKcKrTowXXPT7/W06pedOhPrsJpTzkuPEWeGLEfq
 6FK+3HHdCgo9agKMXH6GgYesejlDBlcOyVghJYNwtO4KhxccCemRaq4QXHAuU6W9jbWp
 dEfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8/eEggnRBWVfE7rEBy6JS/ySBtPmVF369+VUzr57dRvX5zUbES2GijB7+601IVfJvbDXSTYaonNOFG98qaXUbX4rNHfe8YhRPoaB+DQ==
X-Gm-Message-State: AOJu0YywGPLPxn8ly738l6vlZuaypDY8fY3NSktT8sc37FpJ8JNf8hSx
 a5GYwBhDIEJKCRw5kBXlh9bFSqeF2TMsNWbjFEGHCcFJJfOEeHWF3i+fPEEe4Co=
X-Google-Smtp-Source: AGHT+IHziMriFU1IvsOiXYNLoJqYCMel+vAaYctnt6KK80gYjPlmHIUg0ZT4GOMRpR+pse+fG/yFGw==
X-Received: by 2002:a05:600c:470f:b0:422:78c:82f6 with SMTP id
 5b1f17b1804b1-42487ef1ef5mr100585725e9.3.1719424348980; 
 Wed, 26 Jun 2024 10:52:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3670c4c1fb4sm3988958f8f.76.2024.06.26.10.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 10:52:28 -0700 (PDT)
Date: Wed, 26 Jun 2024 19:52:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
Message-ID: <ZnxVWrFJKbVO8PZ0@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
 <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
 <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
 <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
 <CAAObsKAt563VNzDcF4rGkWPcxBPzKcq=Hj5RY6K20FWR43nvUQ@mail.gmail.com>
 <ZnvDJVeT3rz-hnv9@phenom.ffwll.local>
 <7cee6b78bc2375d9b014f9671b0d72ae65eba73c.camel@pengutronix.de>
 <CAPj87rPB=N2vJ-5C7xXORYstK3=TpX+jZ7mCr7oxY2wpXeaTTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rPB=N2vJ-5C7xXORYstK3=TpX+jZ7mCr7oxY2wpXeaTTQ@mail.gmail.com>
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

On Wed, Jun 26, 2024 at 11:39:01AM +0100, Daniel Stone wrote:
> Hi,
> 
> On Wed, 26 Jun 2024 at 09:28, Lucas Stach <l.stach@pengutronix.de> wrote:
> > Mesa doesn't cope right now. Mostly because of the renderonly thing
> > where we magically need to match render devices to otherwise render
> > incapable KMS devices. The way this matching works is that the
> > renderonly code tries to open a screen on a rendernode and if that
> > succeeds we treat it as the matching render device.
> >
> > The core of the issue is that we have no way of specifying which kind
> > of screen we need at that point, i.e. if the screen should have 3D
> > render capabilities or if compute-only or even NN-accel-only would be
> > okay. So we can't fail screen creation if there is no 3D engine, as
> > this would break the teflon case, which needs a screen for the NN
> > accel, but once we successfully create a screen reanderonly might treat
> > the thing as a rendering device.
> > So we are kind of stuck here between breaking one or the other use-
> > case. I'm leaning heavily into the direction of just fixing Mesa, so we
> > can specify the type of screen we need at creation time to avoid the
> > renderonly issue, porting this change as far back as reasonably
> > possible and file old userspace into shit-happens.
> 
> Yeah, honestly this sounds like the best solution to me too.

Yeah mesa sounds kinda broken here ...

What might work in the kernel is if you publish a fake 3d engine that's
too new for broken mesa, if that's enough to make it fail to bind? And if
mesa still happily binds against that, then yeah it's probably too broken
and we need etnaviv-v2 (as a drm driver uapi name, I think that's what
mesa filters?) for anything new (including the NN-only ones).

I would still try to avoid that, but just in case someone screams about
regressions.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
