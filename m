Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0FCC47B45
	for <lists+etnaviv@lfdr.de>; Mon, 10 Nov 2025 16:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3BE10E06F;
	Mon, 10 Nov 2025 15:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="drV8FAAn";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D39310E3EC
 for <etnaviv@lists.freedesktop.org>; Mon, 10 Nov 2025 15:55:07 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b55517e74e3so2772385a12.2
 for <etnaviv@lists.freedesktop.org>; Mon, 10 Nov 2025 07:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762790106; x=1763394906; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6R6wcVAFeAUcZ6mJYKCCW0Bji6CCIjd7Ps1e8q5bT4A=;
 b=drV8FAAnKNTpB+3NlfJd8TsUSa8HR9lZRXMBkrNAzhbe0bBKZRHQR/0oB+gVDgyHmz
 tTagkODH/uVPjAIRP388aSZVk0cpxXvR3enGiRCF9z500Nnuuog18Ql350ylIXo6gVxT
 RNtOJPoY4d9n/7cENNUaLnYg2mFKaGWhQS5q+f5/WtbCLineyjZHx8GnV+vHU1qyahdU
 tEXjBhKTzvynEglL5768+8pbrvV+1tlPJW3Qd1+La1PPhEdaf2EKXGcBbEIbTjwUhjLO
 8MmGmkuAw91Xa5X81m+dNL/DS4F0oaK4Jb2HikaCZoLZFRnlCleGAY2GVFqzgoWPEENh
 UJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762790106; x=1763394906;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6R6wcVAFeAUcZ6mJYKCCW0Bji6CCIjd7Ps1e8q5bT4A=;
 b=QzC28sbu10ZD56DhjfZv/DTU1ArmfIrdiaJ/8I1x7IFr3IetTr/3IOYi3N4MXq7QCt
 L+x6m+IXcDUXGasVL8b8fljoeWS3cCOtxLj5YjWo2FspBabvnRuZlY1oLh7g8z4K6nOd
 aEZzbdaRBykJOfSdsLEU8j61ufyxKqj0Dz4J9SbKcF+Vv5aj2WRr37NYXH4X9LB5lKFj
 IsliLvRRvoz0+I1qk9CkuMFbI8ypACRDTlvOpBuWy6RP0WDXJhoSMFDPUZeFFPIokyKq
 FXgZiUSYdYLAi0sf/TOlVslYuhdJk/Th8MwT3KDop24Dt/5nqMA9UJ8Ds2IO+CQZlwW4
 Dckw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjJlF7d0cp8x5hs8khI98uUvHARajaBRQP1e7KX/Sgih1ZYMOhz3gKp/VDH8mCqVE7eMIqGQlr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp84lxfSUCvTYXoC4C53bTiwlL2aivsbspIS/uP0garadyfz2m
 05vmzatsdt/ifilTNVJdZAfIPJhcv3JggtG9e715Th0HlKjUg/P2Pznuvdz6/TRJKFPc1l8nUYe
 HgpKEN52immv22fY+Nj+hbitIXosQf2o=
X-Gm-Gg: ASbGnctsPFTlcEIV0bPzt7Xm8lDlmCR+7MEC8gt8Id4P+A2mxv5x0jkCk0hDIqKATM9
 KjAc3fc2gSR9qIylaECEFX2Pvqkjyq+b5Yvfe2UFR3iJ2Lw5f3QliOY1Lqzi0oxdW+ZQaMpLP6F
 Jr+vKmsOUawXekbA4vUBm0e67JYilMgEW5AYzfddXbBObWH+1zGEidUWNkmEnvtUDWCYFQjd0+K
 7cxuwK3m2tRAohGAU8yp0D7aGf3a8B9PzaD2XP/HTjPXLwmk/iICM9zGc0=
X-Google-Smtp-Source: AGHT+IHCrQU0UlElplZd+YPzXUqH9miCN+y+iRChbMn/h7fN73CjNrmEf5PFWQKDUy/hBQwfC1VOyq54JxIn8cvEg2E=
X-Received: by 2002:a17:90b:54c3:b0:33e:2334:ef05 with SMTP id
 98e67ed59e1d1-3436cd06506mr9221689a91.28.1762790106437; Mon, 10 Nov 2025
 07:55:06 -0800 (PST)
MIME-Version: 1.0
References: <20250630202703.13844-1-gert.wollny@collabora.com>
 <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251110144625.18653-2-gert.wollny@collabora.com>
In-Reply-To: <20251110144625.18653-2-gert.wollny@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 10 Nov 2025 16:54:54 +0100
X-Gm-Features: AWmQ_bm2wmrOPItOxwhoBd9H4sTLBEoxQE9s611ak2i40wnU7FFtiRLd5trLVSQ
Message-ID: <CAH9NwWcYOfrjbL==PBZ8z-Ta-C9EVQSypovqturj4=ROCfxpqQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/etnaviv: Add command stream definitions
 required for a PPU flop reset
To: gert.wollny@collabora.com
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

>
> From: Gert Wollny <gert.wollny@collabora.com>
>
> v2: move some defines that resided in etnaviv_flop_reset.c
>     into the header as well
>
> v3: fix spacing/tab stops
>
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
