Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4489B03EE3
	for <lists+etnaviv@lfdr.de>; Mon, 14 Jul 2025 14:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755B810E492;
	Mon, 14 Jul 2025 12:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hMmxChMM";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8168C10E48E
 for <etnaviv@lists.freedesktop.org>; Mon, 14 Jul 2025 12:39:43 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso3300637f8f.1
 for <etnaviv@lists.freedesktop.org>; Mon, 14 Jul 2025 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752496782; x=1753101582; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XErAJu/6i7g4EFf9vKNbP+OcUQZQKENL92ttAjzjYEU=;
 b=hMmxChMMCbhPzyyuptZxZaXBxuD0tslMaJRY0Nm5C9cA3kgSMkuENLgAisV6yeVXfz
 JnJ7Kx35V86OdutNWKu4gLg/cohNlpFRCIVFDsl8tJwwhnQTVY0PBF8jdRwYjjcxEvco
 5pV2j8FaqZlfj/CAfxZ2ELmtQ7o9aP2BrwJDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752496782; x=1753101582;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XErAJu/6i7g4EFf9vKNbP+OcUQZQKENL92ttAjzjYEU=;
 b=c1F8f0UHU5c4v0Evw1a7GZts3RzIf8ByuCnnEri5O/zzOvjLQ0qYBpn7m+MMQdvOHy
 aMXkyY2TQ9Ae8qCsNNeNrfnBPftbqOBCRbjv/bZCRZWI6m8yhUHhDR9aH6ADCrp27fKA
 UKmaLQaNmNgr1gAp0lTRNwEXHF+a3Z94JifhHHc/3+4Y0AZTA4MkCLcTNDsgGKXKQEH7
 82aj1KaD3G09w/xiB97/9fS+qMof2HC+WPs7sn53NBdeFIuqg37Xa1KtPmNxtELf9fO/
 RWQ8NbUuG+Wb88eup8f0miuaKG8Z1zhSXc2XkIrxetahnCh5x8mEu/9E06TWPwjGyplt
 brjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsKQjyVZ13G9fPLUkZqY+dU4AtAXQv8XpRNJslw16uZ07f9HuoAwdpU1EtPsA9+uQBcBZdGcmu@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1cqzpImIg560VGTDIcTEJSzlsqDRLKWbfBQaDEIJyxpGlENuD
 iR4RYMuxzEn9CnHo1L7mnQG/K20WeTQfdNUKen1UkbyCHQdUUd/9oZt1pZ04cYC55mU=
X-Gm-Gg: ASbGncvDzzgUN00nDzA98dZX8oUaw+4gxVzg56mBQBo2UJJRnLYpBUIaQdPoLGrU5zk
 wzoUO66lJcm3E3qcvXSqYNJbuCHXyvB7WzGa6GwD8BCaYOL9LXRAPyhEXPJ5QtxyK4nHU5DgeDu
 Jp7W+HDU83hy9qAf4SrRqdl0A9ahvVzgsXms/xHI3SFsBfQpxdFDzblgXaUJTqZK43xBQ6UaGpg
 zSFte9ksctc5TZzmR03DwqujUN/9nvyKsRmk0U4oj3WEPS/MiVNVJ+thhLMcc6Vb0g4FxTdDybl
 ZS5xBXGtpiWKjKTZIQGkBhB4LJjXDgb2cq1yIEQD0My3Id+Xv9OOeTjiyB/qbjzveBEVGc/x1SC
 7/Swc4Eac3dubh9p659DG1jiBL3sRoxJD4ekMy6zFp95k
X-Google-Smtp-Source: AGHT+IG6tSn1rFwzUvQrU3dFhdLGnz5/j4mh9qiCr0au1QUPGoiO9awMtbUHlEtASqVdx2HXNSxeBQ==
X-Received: by 2002:a05:6000:25f6:b0:3a5:2875:f985 with SMTP id
 ffacd0b85a97d-3b5f18ffd7bmr10766504f8f.59.1752496781706; 
 Mon, 14 Jul 2025 05:39:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26938sm12188789f8f.89.2025.07.14.05.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 05:39:41 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:39:39 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com,
 torvalds@linux-foundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, kraxel@redhat.com,
 christian.gmeiner@gmail.com, dmitry.osipenko@collabora.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
Message-ID: <aHT6i723ffg2_m2v@phenom.ffwll.local>
References: <20250711093744.120962-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711093744.120962-1-tzimmermann@suse.de>
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

On Fri, Jul 11, 2025 at 11:35:15AM +0200, Thomas Zimmermann wrote:
> Revert the use of drm_gem_object.dma_buf back to .import_attach->dmabuf
> in the affected places. Also revert any fixes on top. Separates references
> to imported and exported DMA bufs within a GEM object; as before.
> 
> Using the dma_buf as the one authoritative field for the DMA buf turns
> out to be fragile. The GEM object's dma_buf pointer can be NULL if
> userspace releases the GEM handle too early. Sima mentioned that the fix
> in commit 5307dce878d4 ("drm/gem: Acquire references on GEM handles for
> framebuffers") is conceptionally broken. Linus still notices boot-up
> hangs that might be related.
> 
> Reverting the whole thing is the only sensible action here.
> 
> Tested on virtio; and amdgpu, simpledrm plus udl for dma-buf sharing.
> 
> Thomas Zimmermann (9):
>   Revert "drm/framebuffer: Acquire internal references on GEM handles"
>   Revert "drm/gem: Acquire references on GEM handles for framebuffers"

Ok, I think all the below we should still apply for -fixes, because
fundamentally gem_bo->dma_buf is not invariant over the lifetime of the
buffer, while gem_bo->import_attach.dmabuf is. And so we blow up.

For display drivers the handle_count reference mostly papers over the
issues, but even display drivers are allowed to keep internal references
to the underlying gem bo for longer. So there could be a bunch of really
tricky bugs lurking.

For render drivers it's even clearer, they don't have framebuffers as
objects, so there the fb handle_count references does not help.

I'm not opposed to trying to unify these fields for imported dma_buf, but
currently they're just not. Hence all the reverts.

The patches also need Fixes: and as needed, cc: stable added for merging.
With that and the above text as additional justification added:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Also we'd need to chase down any addiotional conversions that have only
landed in -next meanwhile of course.

₣or the handle_count patches I'm less sure. I don't think they're
justified for fixing the gem_bo->dma_buf NULL pointer issues, but they do
probably help with the GETFB/2 confusion Christian has pointed out.
Personally my preference is:
1. Apply the two reverts.
2. Create an igt testcase for the GETFB confusion
3. Figure out what the right fix for that is, which might or might not be
the handle_count reference of drm_fb.

But with my maintainer hat on I don't mind about the exact path, as long
as we get there somehow. If you decide to do land the reverts, they also
have my:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima

>   Revert "drm/virtio: Use dma_buf from GEM object instance"
>   Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
>   Revert "drm/etnaviv: Use dma_buf from GEM object instance"
>   Revert "drm/prime: Use dma_buf from GEM object instance"
>   Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
>   Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
>   Revert "drm/gem-dma: Use dma_buf from GEM object instance"
> 
>  drivers/gpu/drm/drm_framebuffer.c            | 31 +---------
>  drivers/gpu/drm/drm_gem.c                    | 64 +++-----------------
>  drivers/gpu/drm/drm_gem_dma_helper.c         |  2 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c |  8 ++-
>  drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +-
>  drivers/gpu/drm/drm_internal.h               |  2 -
>  drivers/gpu/drm/drm_prime.c                  |  8 ++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  4 +-
>  drivers/gpu/drm/virtio/virtgpu_prime.c       |  5 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          |  6 +-
>  include/drm/drm_framebuffer.h                |  7 ---
>  11 files changed, 35 insertions(+), 106 deletions(-)
> 
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
