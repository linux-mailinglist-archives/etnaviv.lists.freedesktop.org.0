Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0594327FFA
	for <lists+etnaviv@lfdr.de>; Mon,  1 Mar 2021 14:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9A26E038;
	Mon,  1 Mar 2021 13:50:30 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B3B6E03A
 for <etnaviv@lists.freedesktop.org>; Mon,  1 Mar 2021 13:50:29 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id r19so16499146otk.2
 for <etnaviv@lists.freedesktop.org>; Mon, 01 Mar 2021 05:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nIffz32e7kAOtkoqIqyEDBNP7zhp7pvgm4BWl6oF0S8=;
 b=eCJ4C0VGRnEZ990nEBnOBVfx9ul4Sc6XuIfeNBVbtmIr+Pb11XDnOaQoSPwJEoBHlk
 nUMsX9TtmdTqJU3CY/Ou2OE31tHS7QLfRACm4dKhWsAE+2MPd9/6XfELsiv3leNhKXxg
 gfhLZ9KI8aJjE91mzlK5SEI+j070Od0w163uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nIffz32e7kAOtkoqIqyEDBNP7zhp7pvgm4BWl6oF0S8=;
 b=r2w0hBRlEIoYtFaVKgrR7N2fs9uk1qlVfHRjZ1npCzEI8f2Y99PyhFaeTChvbi6qMh
 46Aillin5VpcEcZvWSFYSmaDVfmYOadpstwnv4WhXdQxIpvfxXKvehFiMo9+acd8p77H
 +NSmS88DSpAX5PJzgJQ1QYc33IM7zpHkyzg62j8Mi6iASemOJcO9E0QppOrUnnpzbhD8
 Ot96FmEJVJG1AcAfho1kIod1fi7tmzqRLClHfKXub+qajmKd+hb98pfwFr4eJ7SFUayq
 uORukxm7YrMhGDf/xf6hgb28mUbzPgRwYYS1YWuhLoM19FanAL3KOeJ8OUB110QoQ96H
 qfQg==
X-Gm-Message-State: AOAM5324w4BFH901FhLtqUjy5RkOjkM8L3yQz6rratHSJx4fqk4QVGw7
 ml0d2l1zaYbwZvh9ZfvXd45th1tr+5NFZHEa3hoRPA==
X-Google-Smtp-Source: ABdhPJyTfgJWCRHmfoKEzGOlCqbPjKj+k/wx+ukdGtunHsAPt9GgA7MxTewb9hMPYCOBWZ4NwQUfHEjPJHt95+iowO4=
X-Received: by 2002:a9d:6481:: with SMTP id g1mr3764106otl.303.1614606628709; 
 Mon, 01 Mar 2021 05:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
 <f0e85747e101a9078f1e1d158f1eea29a9f31684.camel@pengutronix.de>
In-Reply-To: <f0e85747e101a9078f1e1d158f1eea29a9f31684.camel@pengutronix.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 1 Mar 2021 14:50:17 +0100
Message-ID: <CAKMK7uHqHTVnnhwrS9SWgcqTR4DDJkftm5Ru2fYb1h8m2v9XMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/etnaviv: Use FOLL_FORCE for userptr
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: John Hubbard <jhubbard@nvidia.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Mar 1, 2021 at 11:28 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Montag, dem 01.03.2021 um 10:52 +0100 schrieb Daniel Vetter:
> > Nothing checks userptr.ro except this call to pup_fast, which means
> > there's nothing actually preventing userspace from writing to this.
> > Which means you can just read-only mmap any file you want, userptr it
> > and then write to it with the gpu. Not good.
>
> I agree about the "not good" part.
>
> > The right way to handle this is FOLL_WRITE | FOLL_FORCE, which will
> > break any COW mappings and update tracking for MAY_WRITE mappings so
> > there's no exploit and the vm isn't confused about what's going on.
> > For any legit use case there's no difference from what userspace can
> > observe and do.
>
> This however seems pretty heavy handed. Does this mean we do a full COW
> cycle of the userpages on BO creation? This most likely kills a lot of
> the performance benefits that one might seek by using userptr. If
> that's the case I might still take this patch for stable, but then we
> should rather just disallow writable GPU mappings to this BO.

That's not what's happening. If the mmap is writeable already (like
any malloc'ed area, and anything you might vacuum up with Xshm), then
FOLL_FORCE does nothing. The difference only happens when the current
mmap region (or some of the pte at least) is read-only. Then:
- for MAP_SHARED with the VM_MAYWRITE flag set, we simply adjust some
book-keeping (no copying of pages), so that the core mm doesn't get
confused about the potentially changed pages contents due to gpu
writes. Without this you could corrupt fs state (e.g. when the fs
checksums file contents or does in-place mmap and stuff like that).
- for MAP_PRIVATE we force the CoW. Just don't do userptr on these,
really, it doesn't make much sense anyway. And note again, if the
mapping is currently writeable, then there's no copying going on, this
is only when the mmap/pte is currently read-only. This is the "let's
overwrite libc.so" attack vector :-)

So really in practice nothing should happen here aside from plugging
the "not good" part. Note that on recent kernels the CoW breaking on
fork() happens irrespective of FOLL_FORCE or not once you have the
mapping established. So if you do a lot of userptr on MAP_PRIVATE
already and applications are using fork(), then you're already
suffering big time (since 5.10 or so iirc, John probably knows the
exact commit without looking).
-Daniel

> Regards,
> Lucas
>
> >
> > Cc: stable@vger.kernel.org
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > Cc: etnaviv@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > index 6d38c5c17f23..a9e696d05b33 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > @@ -689,7 +689,7 @@ static int etnaviv_gem_userptr_get_pages(struct etnaviv_gem_object *etnaviv_obj)
> >               struct page **pages = pvec + pinned;
> >
> >
> >
> >
> >
> >
> >
> >
> >               ret = pin_user_pages_fast(ptr, num_pages,
> > -                                       !userptr->ro ? FOLL_WRITE : 0, pages);
> > +                                       FOLL_WRITE | FOLL_FORCE, pages);
> >               if (ret < 0) {
> >                       unpin_user_pages(pvec, pinned);
> >                       kvfree(pvec);
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
