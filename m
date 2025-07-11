Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56985B0268A
	for <lists+etnaviv@lfdr.de>; Fri, 11 Jul 2025 23:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEED810EAC7;
	Fri, 11 Jul 2025 21:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="X1OUWwSy";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C17410E2E7
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 21:52:49 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso18154775e9.2
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 14:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752270768; x=1752875568; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q8RRcJnGL7VYeTaYAkj6SgjU8fJ+4S8aRG1AWN+AY7A=;
 b=X1OUWwSyufA3fpUSnkqFCJWyc5iBenFP9M79ihfjmowtT9ZLvCLahCGG9kRR1BDzIV
 Zw5sIex8TAhMgN/XchllgWkTxe4BJSv/R7FCX+HuqdpWxGPXL0IBMAOlzcPOo86A/amM
 tfXVQZdSnU9FkEb1plNmM7A9t4rOa2JxejYjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752270768; x=1752875568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q8RRcJnGL7VYeTaYAkj6SgjU8fJ+4S8aRG1AWN+AY7A=;
 b=bJxPNtB9oTHeY0GJ6YtWmUK0doRVJqePJAZpvPbTqCsWNeE+JhLoF+BmwsqNx7nDSx
 R2SBVavtZ/GAe1XElprLRTY+CGcdSMpdyDV2h9IGQrnY6vZ4I0vJnTjGDQ52fUpRLG5W
 xEctpwhBV0P8dNbU4kVMx6Uv1dAfkSiKlfVLS7zPi0DJA9MUgrb4dhRDqIen7+cieygh
 rcbxuITOfJJke9tq/LB4RmKOjafonRKIgiKty3Zdem14uZL9CtsDLeLo7NWhQaXuIPve
 Qc4LW95lyixvBfSZNdsdJAgLK3Z9ylhHKUY5G6DzDf0wfGdy2CHhAvf6WShHOmOD5ibu
 ODCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZIP33M/sQAmP5IVSChVjjpdVTRfVfhbkMY8uQa5blqFgBJP2KSKuhtWlXixKmv4zM1RIeH71b@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyefpH30PMkFkxMsPuLUIRSpNSJe0KFa+MaTTGBboY7SA0+JTjp
 3OTfkx0fJ9/Hx5xxaYp4OBcIsJO/P5wZCIBV6fqhOf4HuT4wVP938HOIU8Y8GkTASUs=
X-Gm-Gg: ASbGnctmhN2I8mLehRdHSHICspSBDKtDT3U5Ygnoqy5V6iUBgsq3t3eFCzbTM6vQGiO
 k7qbP+rrZycwYRYYod7ryr6xTA3sxMpHEm9l3A9z/WYcPB5R/LlBKd31JaXqJIlSNTEK/48IX4U
 2OXG/aIl0OICoZjRBWVBMx0h5WD/3N884EgaU0T71PMIRC3ZS3vN/ih4yuB2LFu29ntR5IT5+cI
 tHmXArCCsj+58V+JE/YfmKS/clYhb0kcMD7EX7zePfoUAXDwdzVR8mEqyLg8OJa7eloj3io5deX
 avDUWbbEUfwHRoSq3j4BAGehwz5IzyDRp9GyUZbkt32pazSFGe8xvbq7tlyZM0vk8n/nj0qDcQa
 lHEz6VcYDv4hBoVNZ8vSrf1RsZyVWaBCBUQ==
X-Google-Smtp-Source: AGHT+IFN19WMRiUUdCkB96tSscJeaW1XzTJqoWGFT70YkkmatxtYFIYZq8faZzHYKBK1l+DS/8d3rw==
X-Received: by 2002:a05:600c:c0c1:b0:455:ed0f:e8ec with SMTP id
 5b1f17b1804b1-455ed0fec5dmr32188645e9.9.1752270767429; 
 Fri, 11 Jul 2025 14:52:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e1e8cfsm5387021f8f.80.2025.07.11.14.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 14:52:46 -0700 (PDT)
Date: Fri, 11 Jul 2025 23:52:44 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, christian.koenig@amd.com,
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
Message-ID: <aHGHrNVtupuOHODi@phenom.ffwll.local>
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
 <CAHk-=wif6u3C4gk7BtR1M+0SvHruXZ7xycP5oDdg-SF1D=ELqQ@mail.gmail.com>
 <CAHk-=wi3Fbiii2K9fgmoAgoJYoLuRyWfOZhh57FmREE15RbiUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi3Fbiii2K9fgmoAgoJYoLuRyWfOZhh57FmREE15RbiUg@mail.gmail.com>
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

On Fri, Jul 11, 2025 at 11:37:30AM -0700, Linus Torvalds wrote:
> On Fri, 11 Jul 2025 at 10:35, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I'm hoping the login time timeout / hang ends up being due to a known
> > netlink regression, and it just happened to look like a drm issue
> > because it exposes itself as a hang at the first graphical login
> >
> > A netlink regression *might* fit the pattern, in that it might just
> > cause first login dependency issues and resulting timeouts.
> 
> Well, considering the random timing behavior of this bug, it's hard to
> be really sure, but two boots with the alleged "fix" for the netlink
> issue made the behavior worse, so it does look like my problems on
> this machine were a combination of the drm refcounting issue and the
> netlink thing.
> 
> I guess I'll have to do a lot more rebooting to be sure, since the
> hangs and timeouts have been so random. But the netlink "fixes" did
> give me a hang that was very different from the previous ones I've
> seen, so I think the drm code is off the hook on this one.

Ok sounds good, I won't include the drm reverts then. I do think the
change from ->import_attach.dmabuf to ->dma_buf is still suspect, and the
handle_count reference change for fb won't cover all the other places this
might blow up (just less likely since the most common multi-gpu use-cases
are sharing render buffers to a display driver). But better we take
another week to really think this through before rushing things.

The handle_count changes do look reasonable to me too, but for an entirely
different bug around bo import/export. And I think we'll want a testcase
for that to make sure, and evaluate options properly.

But now I'll just type the pr summary and then w/e for me.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
