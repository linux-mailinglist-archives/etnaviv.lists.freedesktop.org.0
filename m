Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD323425FB
	for <lists+etnaviv@lfdr.de>; Fri, 19 Mar 2021 20:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FEC6EA9A;
	Fri, 19 Mar 2021 19:16:37 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FF36EA9B
 for <etnaviv@lists.freedesktop.org>; Fri, 19 Mar 2021 19:16:36 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b9so10184713wrt.8
 for <etnaviv@lists.freedesktop.org>; Fri, 19 Mar 2021 12:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sfSbjAxCLutq3EQbKsACb8JZ8n+mbDV5OuF+cMaKNb8=;
 b=EZ3xsTpvjtT2iTkFCneXoXl7inkPvn5P1YRYiM38MrJYDgKIosC4/hWpUhcaf+slEW
 LZ1PLLyPTJ922u+q0XjjshX1al1zudoKdd4sg0m690qXwpwRmPaOAt85ZRbSxfuW3tf7
 Z1HRbTIsWcqNUC5V8/h6jWARwj2RXPQKLqhJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sfSbjAxCLutq3EQbKsACb8JZ8n+mbDV5OuF+cMaKNb8=;
 b=V0KGqrO1F9+/j/EpTCxSuIko9WU1ZJQM6OshFimv9A8KV6tcq9eh/mHDwLU/L1HqWt
 96QhmSYpQaV4y7q0AbV5vq0G7cG7wNlOhzWyBtskdSOnLkzL3T5IqpwM2WBfBrGkb4Ql
 ED7WKkbx9uv1G1OATUI0MZIH/VCk0OcmLsT6be+zbfHNMDG+0qHo25SlzmqHeiYIe9cU
 NyM78f0p4gJqvbgGj/O6hCNPudEOWqSKy9rVxWiLJdVWlNWK0GCE0XTjMjdEoeKCvuWg
 0278LLveuG7f0E3Ti3os+HvMB0z9RL45LHZC5Wg+YTHUq7OWgBR3YGDGtvoWPTmHR68S
 Y2kg==
X-Gm-Message-State: AOAM531YtG86Ha3dhTI8rAoES7YsS3u8dnm4qSQXHSmb05xvsyWisBl4
 Bql5zC+tl9wUcNOgWk9SGKRB8w==
X-Google-Smtp-Source: ABdhPJyTLS3ilL7s2EzDPT2zc+xkuwu6pOWld1Rcrp1G7k52acY6v3fM39t4meeqtqgv3SiM3BXbaw==
X-Received: by 2002:a05:6000:223:: with SMTP id l3mr4824239wrz.5.1616181395344; 
 Fri, 19 Mar 2021 12:16:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l21sm7777078wmg.41.2021.03.19.12.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 12:16:34 -0700 (PDT)
Date: Fri, 19 Mar 2021 20:16:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 2/2] drm/etnaviv: User FOLL_LONGTERM in userptr
Message-ID: <YFT4kfzFNh+azuCv@phenom.ffwll.local>
References: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
 <20210301095254.1946084-2-daniel.vetter@ffwll.ch>
 <1aabe37b-d79b-8456-641d-aaf8fe2c330d@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1aabe37b-d79b-8456-641d-aaf8fe2c330d@nvidia.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, etnaviv@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 02:26:01AM -0800, John Hubbard wrote:
> On 3/1/21 01:52, Daniel Vetter wrote:
> > There's no mmu notifier or anything like that, releasing this pin is
> > entirely up to userspace. Hence FOLL_LONGTERM.
> > 
> > No cc: stable for this patch since a lot of the infrastructure around
> > FOLL_LONGETRM (like not allowing it for pages currently sitting in
> 
>   ^FOLL_LONGTERM
> 
> > ZONE_MOVEABLE before they're migrated) is still being worked on. So
> > not big benefits yet.
> 
> Yes. Great write-up, that's very clear, and it's exactly where we're at.
> 
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Both patches pushed to drm-misc-fixes. 2nd one maybe not required there,
but easier due to conflicts.

Thanks for the review.
-Daniel

> 
> 
> thanks,
> -- 
> John Hubbard
> NVIDIA
> 
> > 
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > Cc: etnaviv@lists.freedesktop.org
> > ---
> >   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > index a9e696d05b33..db69f19ab5bc 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > @@ -689,7 +689,8 @@ static int etnaviv_gem_userptr_get_pages(struct etnaviv_gem_object *etnaviv_obj)
> >   		struct page **pages = pvec + pinned;
> >   		ret = pin_user_pages_fast(ptr, num_pages,
> > -					  FOLL_WRITE | FOLL_FORCE, pages);
> > +					  FOLL_WRITE | FOLL_FORCE | FOLL_LONGTERM,
> > +					  pages);
> >   		if (ret < 0) {
> >   			unpin_user_pages(pvec, pinned);
> >   			kvfree(pvec);
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
