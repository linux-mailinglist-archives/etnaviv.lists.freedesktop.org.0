Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3290BB01A85
	for <lists+etnaviv@lfdr.de>; Fri, 11 Jul 2025 13:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF6A8926F;
	Fri, 11 Jul 2025 11:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fl1ORV3K";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26E710E118
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 11:26:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so14796915e9.2
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 04:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752233199; x=1752837999; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N2PVAjumjM6QBebDLC5QW4Rc7DpYox7DcXnPsrpWBK0=;
 b=fl1ORV3KqG3F+fFS9OhhmX1361x+S/QHcMJM61+6oWeJmiEztlbuOB6vbT/0p4JiwG
 apK23AVAruNABPK0d+7F4JS+s28AyaOS5AA+0n9DaJI2Gsgz7mxpTrdOiKOjZKuwFsBX
 Q5jewYosUWUOb4SMO7A3t1k8+9x2QehUAhoa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752233199; x=1752837999;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N2PVAjumjM6QBebDLC5QW4Rc7DpYox7DcXnPsrpWBK0=;
 b=dqzbxSv/PtKlMTfgLPSyyH4vFj1xcGRwjTfw9y7ZwUuuNbVKHwgwVZzniuiEc1T3zU
 82M71azypqA/Vudur1I5SYN2bixnNnS97C5W0iMDHC6mEVKAVL9XKp1lM4aqmBaOmzUK
 I61hNfo5PgeupeJX0DlM4yPkDtBrpbViEdJ/CqFgwf8ySspktPeNYOfVwr8sAEF5XF4K
 xG/sJXm2cZwD1TRuZHL9Pe2SoayzqAdt5nvcgvGSBlb75PBnvcUa5mhg1rLiSopguHxQ
 jn22Lja/wQAbxJLmq35FrBtyikYuxqoqFQ9Aom5bzv1QTeyXFj6J+2CDrzAWAYlUHLGS
 34EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP5AcApRydu7UA+mYsBCcTGuWsRCHkeDPOacjVP6+zW6B7iD1j5sx3WP0JNopfTl7uJ+VdGSZf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCvSc55k2RWOrrL1ZqE+awSH/gJZLuTKOMhWeo13179Rdc3bIx
 0wbja94UMxIqgZQCAG9xNKjoYAZ8uz4V3wkqAM9gvT72gVjXen6f20rX9EOQX5WqyPM=
X-Gm-Gg: ASbGncsqDHkcaUH3oGKQo1OlNyuXUtDBKhd5Uas9G/VeGp8hI3G+5te6T+IjIbIE67i
 tiZZUvOG3KwUxDQMCBMpkrXkTaXFLEYWLKMOhQdhtZM91LJ/AVT8kW/brO7aLvbqWp7Ekk28Uzm
 kZn72i1YORMXAcdD6cFcIC8PpMVnkzp6+MjOftshZ++i0yvS6V4MI/iW0zmmqnfKEaTqJSx3vFq
 RDFib/8gYwCoj/zwAbohbAXxq86+VRhcCNSe9kDFBqFHXboWjbDUmLwq4QFtqfvCdmMNY6+uEG8
 uHTgiCyW2jKjSX2XLocfDWoD/xsLnINhHDvKqokHX+hhEDOCiU/THyj7ynX7YzNBaXpBqyUS5Rl
 IsKcCJEj/v4QA9rUeTC4/D3309q7Ns9kPZmc+7dUdaxg4
X-Google-Smtp-Source: AGHT+IFVi7nm2kebBAJ8+93+5amqUpcfmZWMLm3ginfXIg49P5tt280hta+taQINrMUsHsBQFiNG1w==
X-Received: by 2002:a05:600c:6295:b0:43b:ca39:6c7d with SMTP id
 5b1f17b1804b1-455ebce3f18mr16886065e9.3.1752233198798; 
 Fri, 11 Jul 2025 04:26:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc2464sm4296653f8f.38.2025.07.11.04.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 04:26:38 -0700 (PDT)
Date: Fri, 11 Jul 2025 13:26:36 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, torvalds@linux-foundation.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 kraxel@redhat.com, christian.gmeiner@gmail.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
Message-ID: <aHD07IF9Y7lntOLo@phenom.ffwll.local>
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <bd14fdec-7e75-477c-a241-bac67f93d210@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd14fdec-7e75-477c-a241-bac67f93d210@amd.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Fri, Jul 11, 2025 at 12:32:02PM +0200, Christian König wrote:
> On 11.07.25 11:35, Thomas Zimmermann wrote:
> > Revert the use of drm_gem_object.dma_buf back to .import_attach->dmabuf
> > in the affected places. Also revert any fixes on top. Separates references
> > to imported and exported DMA bufs within a GEM object; as before.
> > 
> > Using the dma_buf as the one authoritative field for the DMA buf turns
> > out to be fragile. The GEM object's dma_buf pointer can be NULL if
> > userspace releases the GEM handle too early. Sima mentioned that the fix
> > in commit 5307dce878d4 ("drm/gem: Acquire references on GEM handles for
> > framebuffers") is conceptionally broken. Linus still notices boot-up
> > hangs that might be related.
> 
> Did I missed that response? What exactly is the issue?

Sorry, private thread from Linus that he's hit the regression, applied the
fix, which was apparently not enough. Then applied the revert of "drm/gem:
Acquire references on GEM handles for framebuffers", which worked better,
but still resulted in not-before-seen issues somehow. At that point I
figured it's best we backtrack because we seem to have a history of not
really understanding this anymore collectively. Thomas also found yet
another related regression around drm_prime in -next, so this looks way
too messy to me for late -rc.

The regressions left over after the bugfix from Thomas that's in
drm-misc-fixes is some silent hangs at login, without any traces anywhere
what got stuck.

We don't yet have feedback from Linus whether the revert more approach
here helps.

> > Reverting the whole thing is the only sensible action here.
> 
> Feel free to add Acked-by: Christian König <christian.koenig@amd.com> to the entire series.

Thanks, I'll apply it to drm-fixes directly assuming intel-gfx-ci
approves.

Note that I'm not fundamentally opposed to the concepts here, at least the
usage count extensions of handle_count seems not entirely off. But it does
look very questionable to fix the patches that switched from
->import_attach.dmabuf to ->dma_buf, and it's simply too late in the -rc
for more big games.

Cheers, Sima

> 
> Regards,
> Christian.
> 
> > 
> > Tested on virtio; and amdgpu, simpledrm plus udl for dma-buf sharing.
> > 
> > Thomas Zimmermann (9):
> >   Revert "drm/framebuffer: Acquire internal references on GEM handles"
> >   Revert "drm/gem: Acquire references on GEM handles for framebuffers"
> >   Revert "drm/virtio: Use dma_buf from GEM object instance"
> >   Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
> >   Revert "drm/etnaviv: Use dma_buf from GEM object instance"
> >   Revert "drm/prime: Use dma_buf from GEM object instance"
> >   Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
> >   Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
> >   Revert "drm/gem-dma: Use dma_buf from GEM object instance"
> > 
> >  drivers/gpu/drm/drm_framebuffer.c            | 31 +---------
> >  drivers/gpu/drm/drm_gem.c                    | 64 +++-----------------
> >  drivers/gpu/drm/drm_gem_dma_helper.c         |  2 +-
> >  drivers/gpu/drm/drm_gem_framebuffer_helper.c |  8 ++-
> >  drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +-
> >  drivers/gpu/drm/drm_internal.h               |  2 -
> >  drivers/gpu/drm/drm_prime.c                  |  8 ++-
> >  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  4 +-
> >  drivers/gpu/drm/virtio/virtgpu_prime.c       |  5 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          |  6 +-
> >  include/drm/drm_framebuffer.h                |  7 ---
> >  11 files changed, 35 insertions(+), 106 deletions(-)
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
