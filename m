Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F9E928536
	for <lists+etnaviv@lfdr.de>; Fri,  5 Jul 2024 11:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6587A10E2BE;
	Fri,  5 Jul 2024 09:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="gIiB9lxm";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B3410E256
 for <etnaviv@lists.freedesktop.org>; Fri,  5 Jul 2024 09:35:59 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-424ab8c2d95so1775815e9.2
 for <etnaviv@lists.freedesktop.org>; Fri, 05 Jul 2024 02:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720172158; x=1720776958; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dBUFvDpvHws1+38lCVonXjN1+56jsPy73A6BdHXEQaE=;
 b=gIiB9lxmkHpnfRTDbDc8i3K2jOsviSA/FB9HPgtDdlTVDM1rKbI3pfhLNvWlElzCcW
 aOxPR9aQKhQ0jEVp1EVfznqeaAu/TNSBAc91ic/VHc87MXxGNPUip87AtBimiRT+C9vH
 O4Vor7lSyogj1SUZTWDUGiEokTABDzru48vSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720172158; x=1720776958;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dBUFvDpvHws1+38lCVonXjN1+56jsPy73A6BdHXEQaE=;
 b=pPTGF8MUnM4bceDyo3cRwSVQYuM1fKPrOLUuUDMPmad1bdAr1kV6joGD1ryBONrhWD
 e/beVHjXy7POlhf0E1+PpxNsMatJcA0XWY7SEUUA5ySg4tzHKUFXWHCkam+27kNMgAPV
 JHJGVSupLZqnb4YqWGkwBnxEQ6ToQpFcqYx4D0c8FG2UgnxFjnqDMCt1qQnH5Rul5GM4
 IyisxNpfmPhXgkQk09ZVPfrhojYaMLwoJL5WOCECgzGGNJr02QfCm5jjHPWJaaOXTTk7
 2l+HzfMhq+kcf0AuMB9VJMx3xH6tj6FQR2EMn8d/eNuh/eSb2dAFfk43aeiPoTQrgzXg
 6T4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSVg9aXZMfbwfHnwZQtiZCe68rp1rLKtL3ytbsUVvjfh211HcM6Dd9EWN7m+RLrjF5ByW61JGA/sbP239KoqGiH/I4v9JqEseJcX7VOw==
X-Gm-Message-State: AOJu0YzxhIJydHMMGKf0fHuAWbfSiM80DcSnXFM4Pt4O+dyVMvHRfPtd
 Xq+HVJzmEKMV1GllKPUObWdkbyW6pTkyZOC4r5G+gmAVXpcScqPTgDDrXhi8I6Q=
X-Google-Smtp-Source: AGHT+IF1U3VVJyBuISR8oRiHyyYRdUxDCRgdG6O4xNr7MkNJU4FSPfz4FqVqgmp21/EAMd9/tA/OUQ==
X-Received: by 2002:a05:600c:1ca0:b0:425:73b8:cc4d with SMTP id
 5b1f17b1804b1-4264a3d7fadmr28422745e9.1.1720172157972; 
 Fri, 05 Jul 2024 02:35:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2ca5casm54243095e9.32.2024.07.05.02.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:35:57 -0700 (PDT)
Date: Fri, 5 Jul 2024 11:35:55 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [GIT PULL] etnaviv-next for 6.11
Message-ID: <Zoe-e6VZOAj_eRrp@phenom.ffwll.local>
References: <e8b91e2f18e6eaa722569dd21f559009064b1730.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b91e2f18e6eaa722569dd21f559009064b1730.camel@pengutronix.de>
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

On Fri, Jun 28, 2024 at 12:39:33PM +0200, Lucas Stach wrote:
> Hi Dave, hi Sima,
> 
> please pull the following changes for the next merge window. Mostly
> fixes, but as they concern new hardware support there's no need to rush
> them into the current -rc.
> 
> Regards,
> Lucas
> 
> The following changes since commit e67572cd2204894179d89bd7b984072f19313b03:
> 
>   Linux 6.9-rc6 (2024-04-28 13:47:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.pengutronix.de/git/lst/linux tags/drm-etnaviv-next-2024-06-28
> 
> for you to fetch changes up to 704d3d60fec451f37706368d9d3e320322978986:
> 
>   drm/etnaviv: don't block scheduler when GPU is still active (2024-06-26 15:33:25 +0200)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> - fix i.MX8MP NPU clock gating
> - workaround FE register cdc issues on some cores
> - fix DMA sync handling for cached buffers
> - fix job timeout handling
> - keep TS enabled on MMUv2 cores for improved performance
> 
> ----------------------------------------------------------------
> Derek Foreman (1):
>       drm/etnaviv: Read some FE registers twice
> 
> Krzysztof Kozlowski (1):
>       drm/etnaviv: drop driver owner assignment
> 
> Lucas Stach (5):
>       drm/etnaviv: don't disable TS on MMUv2 core when moving the linear window
>       drm/etnaviv: switch devcoredump allocations to GFP_NOWAIT
>       drm/etnaviv: fix DMA direction handling for cached RW buffers
>       drm/etnaviv: reduce number of ktime_get calls in IRQ handler
>       drm/etnaviv: don't block scheduler when GPU is still active
> 
> Philipp Zabel (3):
>       drm/etnaviv: Update hardware headers from rnndb
>       drm/etnaviv: Turn etnaviv_is_model_rev() into a function
>       drm/etnaviv: Disable SH_EU clock gating on VIPNano-Si+
> 
>  drivers/gpu/drm/etnaviv/cmdstream.xml.h |  52 +++++++++++++++++++++++--
>  drivers/gpu/drm/etnaviv/common.xml.h    |  12 +++---
>  drivers/gpu/drm/etnaviv/etnaviv_dump.c  |   5 +--
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c   |   6 ++-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c   |  83 ++++++++++++++++++++++------------------
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h   |   8 ++++
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c |   9 ++---
>  drivers/gpu/drm/etnaviv/state.xml.h     | 103 ++++++++++++++++++++++++++++++++++++++++++--------
>  drivers/gpu/drm/etnaviv/state_blt.xml.h |  22 +++++------
>  drivers/gpu/drm/etnaviv/state_hi.xml.h  |  30 +++++++++------
>  10 files changed, 238 insertions(+), 92 deletions(-)
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
