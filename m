Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D579B122C7A
	for <lists+etnaviv@lfdr.de>; Tue, 17 Dec 2019 14:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1BC6E9D9;
	Tue, 17 Dec 2019 13:03:59 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073066E9D9
 for <etnaviv@lists.freedesktop.org>; Tue, 17 Dec 2019 13:03:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q6so11177317wro.9
 for <etnaviv@lists.freedesktop.org>; Tue, 17 Dec 2019 05:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IHnJrf0xr4GkiU9EG7qAISx/xlW1Z6IKARMSAFJUrRY=;
 b=c4bmJsPBhVaHWowhDxkqGljmbRgrA0c7j7l9GHbCqtJcUWM2ebvS0m2BVaJiwUPNEd
 TO9bNOkzYdY6hQ1AMUWWdPl23ZA10VLcGTUhX25WWogZru3HrETQVvBuI6vjFI5De3TL
 +ucEkMFFGERo31L7ZE83xSMgEdFSUiqBQ5+xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IHnJrf0xr4GkiU9EG7qAISx/xlW1Z6IKARMSAFJUrRY=;
 b=XwXCLszzZ85EHlk7mCzzNhhXHsAq3nMTBeAdA3uUw0LetiQ3eatXIlxsl3NZBDUGab
 /W+pFfJEBt9UYlOl8cKlWNMhljRKBwXc67WqEmsiYADoHX9aqs0GGa+P7+mqzsggkWFh
 mNgkqkpbnzIevYjpLKZDUNpHAO4lEV+vev0uMk3b8wtV0K/EwRKdzk62ZQ5RNAE366Ye
 UCQJuPCq4L18Po+FUxwdtDyz2Kk4g1GDHFreA/ZyhuRjJ+oO6i1BACh5KBOdEg54RP1E
 H4Amx+K0pboV5/2UaCZ3v61JiZMS+VvE5sWdZqcFgv/Vb1pw1q3Jkac3rYFPdJk+TJBC
 5esA==
X-Gm-Message-State: APjAAAWbYsts3/kTFeJ2baPG0Q310VNhc+YINl0iEJAgRenMWPKnbrPa
 fDyGcTdy27mEZnDUmBDGgnG7pA==
X-Google-Smtp-Source: APXvYqxU7mUWVdsCXbM+7MtCe6/C54613B4kG6HyrQf8kBYGUDMftSeVuWWjhXm5MkVZ7LmyazVpvw==
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr36427315wre.156.1576587836476; 
 Tue, 17 Dec 2019 05:03:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id a1sm25334146wrr.80.2019.12.17.05.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 05:03:55 -0800 (PST)
Date: Tue, 17 Dec 2019 14:03:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Use dma_resv locking wrappers
Message-ID: <20191217130353.GW624164@phenom.ffwll.local>
References: <20191125094356.161941-2-daniel.vetter@ffwll.ch>
 <20191214000927.1616384-1-daniel.vetter@ffwll.ch>
 <9c16bae9e83c0878215586595b5ca16b3d5e8810.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c16bae9e83c0878215586595b5ca16b3d5e8810.camel@pengutronix.de>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
 DRI Development <dri-devel@lists.freedesktop.org>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 04:14:34PM +0100, Lucas Stach wrote:
> On Sa, 2019-12-14 at 01:09 +0100, Daniel Vetter wrote:
> > I'll add more fancy logic to them soon, so everyone really has to use
> > them. Plus they already provide some nice additional debug
> > infrastructure on top of direct ww_mutex usage for the fences tracked
> > by dma_resv.
> > 
> > v2: Fix the lost _interruptible (Michael)
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > Cc: etnaviv@lists.freedesktop.org
> > Cc: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
> 
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> 
> If you want to stack other stuff on top of this before the next merge
> window feel free to take it through drm-misc. Otherwise I'm going to
> pick it up with the next sweep.

I expect a fair amount of stacking in the dma-buf area in the near future
, so applied all (except the i915 one, that's already superseeded with
i915 specific work) to drm-misc-next.

Thanks for review.
-Daniel

> 
> Regards,
> Lucas
> 
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > index aa3e4c3b063a..3b0afa156d92 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > @@ -113,7 +113,7 @@ static void submit_unlock_object(struct etnaviv_gem_submit *submit, int i)
> >  	if (submit->bos[i].flags & BO_LOCKED) {
> >  		struct drm_gem_object *obj = &submit->bos[i].obj->base;
> >  
> > -		ww_mutex_unlock(&obj->resv->lock);
> > +		dma_resv_unlock(obj->resv);
> >  		submit->bos[i].flags &= ~BO_LOCKED;
> >  	}
> >  }
> > @@ -133,8 +133,7 @@ static int submit_lock_objects(struct etnaviv_gem_submit *submit,
> >  		contended = i;
> >  
> >  		if (!(submit->bos[i].flags & BO_LOCKED)) {
> > -			ret = ww_mutex_lock_interruptible(&obj->resv->lock,
> > -							  ticket);
> > +			ret = dma_resv_lock_interruptible(obj->resv, ticket);
> >  			if (ret == -EALREADY)
> >  				DRM_ERROR("BO at index %u already on submit list\n",
> >  					  i);
> > @@ -161,8 +160,7 @@ static int submit_lock_objects(struct etnaviv_gem_submit *submit,
> >  		obj = &submit->bos[contended].obj->base;
> >  
> >  		/* we lost out in a seqno race, lock and retry.. */
> > -		ret = ww_mutex_lock_slow_interruptible(&obj->resv->lock,
> > -						       ticket);
> > +		ret = dma_resv_lock_slow_interruptible(obj->resv, ticket);
> >  		if (!ret) {
> >  			submit->bos[contended].flags |= BO_LOCKED;
> >  			slow_locked = contended;
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
