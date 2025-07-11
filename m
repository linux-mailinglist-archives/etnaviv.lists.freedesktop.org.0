Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4FB023D6
	for <lists+etnaviv@lfdr.de>; Fri, 11 Jul 2025 20:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC5D10EAC5;
	Fri, 11 Jul 2025 18:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OaODnWna";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5CE10EABF
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 18:37:49 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-607cf70b00aso4612920a12.2
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 11:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752259068; x=1752863868;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NqSyi099qnjScevbzt/A0T/7PehrNF3qhUlbAV32+2s=;
 b=OaODnWnaN5CivgXgPSCd+ru572xlTwIy1fnSyrok3/qU/LfTy4StEXm7i2NaHknrjA
 CzLhtXATAiii6rnVk1K5zkBvQiAFuhTcPT31gLvwFE9bX29w6Zb8bOFscL8ZRpJc+AlD
 11D3GhOe/osO7pg8BJzsIJzIpNHRVO9gXUoVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752259068; x=1752863868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NqSyi099qnjScevbzt/A0T/7PehrNF3qhUlbAV32+2s=;
 b=tXqCk7ycSDRD3Y7HTaxkd2RgnMqeY6EkRsSXbN6Zuomjb919zs4nIipsSCjovumiM7
 ySt0WgIrb9KEJlOnxwc+aqSB6o7xZIIPV9sUYcbFkPglt0yASE3zBkAkXBGhTUfNxJwm
 KDp7+UshKe2HMMwl8lUgTn9R0bUqc7WmUFRgGyD8P/HkWs9vUBOed8KaQBtbQaypeSEd
 ViIFdL1uvCtUuxWy7b8RAjaqfFLfd+yBtUpJ6uDxcG2jEMQuJRvA4D0QNKz1gGJfrSNw
 ISxgXpKsgOeN/LfuBbEwhaz3bR1TYE+iIYQNxBLH43UqjOajt3QocyWSjQem0vIiSB7U
 oxVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8Qi57X/9pzxppQe7JX4YXQ+FaFXNjyg/ATolYs3P5mYoWcIYxrFhFQyBss3XaT3I/Hrbdltf5@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5t57qBQWL+8MwCFZ0OXL/c3KspqYgrmmlT25QS7FBvr5PLbw3
 e6HlSorGChPjbRO4+tHy58C18P1Eci284Uw5/8WXIRbEK2cBrNYG9gnvnYOsW48yyYZJr7skMl+
 ROcUpj8n9iQ==
X-Gm-Gg: ASbGncvT/513c3xA5waagSoGz5ZCYsghYBa15bAwyuKVrFa2Sy5cvnyaV8yZZQqWNe4
 WeXseSQd31yGslKps/cWn358e4Oyn/hpAv6FlAtCEkguZEoqyNt7tC1Ojqe86FKasmf6Y57wKCi
 JkZNMTvggEEvS6DJwxGzrG7CA+RNpVH48jtIIq36sqScOOg1vUpSwHjtVE0XmttgJEj0Gw6cF7u
 /5T1/AfKLUDrT6DESeSCGXDyDjs51VC1N4HTnbweD+zkk7WDQIgcljWPJwZ6QNpJHZuKdeY9SVz
 G5Vaz1Jrg3mKV9WclUKJAG/s9qxT738iRqdjlJCRdXXy/x/SlR5Pvql+5DSFAmnGKUwjKI77Zv3
 2jvOextjNr5R5nEimp3wmDK3/n3YmPWKQQ5Rm1Imm4j9zF05PnqhWgomTfHg1L6EXw1yVb/k2
X-Google-Smtp-Source: AGHT+IEgp2tivvxZNMn75vMdNX9chfElxrZ+NQzMc1Tv1yDLyVatK3r9kcL7weNfTsFMlrSqUN4IZw==
X-Received: by 2002:aa7:db90:0:b0:60f:ea89:5128 with SMTP id
 4fb4d7f45d1cf-611e85082b0mr3284153a12.34.1752259067698; 
 Fri, 11 Jul 2025 11:37:47 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c9542fe5sm2484536a12.35.2025.07.11.11.37.46
 for <etnaviv@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 11:37:47 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-607cf70b00aso4612874a12.2
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 11:37:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUYQ9M11XjUQdJ8sWaPwwpd9OCnkFAAuW0IJr/NBSpkKOgonsm59DbiUWKh58lQKwS8+KmYqN7x@lists.freedesktop.org
X-Received: by 2002:a05:6402:1d4e:b0:607:5af9:19b6 with SMTP id
 4fb4d7f45d1cf-611e7c107efmr3549154a12.15.1752259066540; Fri, 11 Jul 2025
 11:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
 <CAHk-=wif6u3C4gk7BtR1M+0SvHruXZ7xycP5oDdg-SF1D=ELqQ@mail.gmail.com>
In-Reply-To: <CAHk-=wif6u3C4gk7BtR1M+0SvHruXZ7xycP5oDdg-SF1D=ELqQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 11:37:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Fbiii2K9fgmoAgoJYoLuRyWfOZhh57FmREE15RbiUg@mail.gmail.com>
X-Gm-Features: Ac12FXz4IEMNfmtixe8DP0mDcYY7Ge-_C9kKvhQh3DPD6bVXdbf7Bxr8kqE2eLE
Message-ID: <CAHk-=wi3Fbiii2K9fgmoAgoJYoLuRyWfOZhh57FmREE15RbiUg@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, l.stach@pengutronix.de, 
 linux+etnaviv@armlinux.org.uk, kraxel@redhat.com, christian.gmeiner@gmail.com, 
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org, olvaffe@gmail.com, 
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
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

On Fri, 11 Jul 2025 at 10:35, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'm hoping the login time timeout / hang ends up being due to a known
> netlink regression, and it just happened to look like a drm issue
> because it exposes itself as a hang at the first graphical login
>
> A netlink regression *might* fit the pattern, in that it might just
> cause first login dependency issues and resulting timeouts.

Well, considering the random timing behavior of this bug, it's hard to
be really sure, but two boots with the alleged "fix" for the netlink
issue made the behavior worse, so it does look like my problems on
this machine were a combination of the drm refcounting issue and the
netlink thing.

I guess I'll have to do a lot more rebooting to be sure, since the
hangs and timeouts have been so random. But the netlink "fixes" did
give me a hang that was very different from the previous ones I've
seen, so I think the drm code is off the hook on this one.

                 Linus
