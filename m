Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F53BE87A
	for <lists+etnaviv@lfdr.de>; Wed,  7 Jul 2021 14:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201D96E145;
	Wed,  7 Jul 2021 12:59:37 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952876E145
 for <etnaviv@lists.freedesktop.org>; Wed,  7 Jul 2021 12:59:35 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso2093581otu.10
 for <etnaviv@lists.freedesktop.org>; Wed, 07 Jul 2021 05:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m59d9ORc3BGDOhV1FAf5OsBFXSlNAZnrmh3j+A+iFMk=;
 b=C7qZmC58PValGd6zVfe9nYKEDySn5TyDnaITf1E3mqRHqgxRfQH+FHEl1BVr9mOvmB
 HAKwhFka8ggKKA1E1NTj/t5eTmy/y00l/4LilcM8k7nHKu3QGJrqtwn2declyzKcrMOd
 bnctUxrK/BhnJ7zXeU5boKIMvy5McKtt0+DIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m59d9ORc3BGDOhV1FAf5OsBFXSlNAZnrmh3j+A+iFMk=;
 b=omECCifL/twesgMuNofj3NJTtJ7ZP6YCUEu2FT6gFBF1tloUWCPp/rKYnZJxRVvPgP
 8+xq2TQ0MV76bbEvDQQ4wFJt3oYCmUzwN4njJCeNmeRTV3PyLusNSe8EBCmXMuCwkb73
 kZEs3uCtcWxiuzVeeOq9aoOxtegPZ7kUJ0mfJrH4q16RNF4yUSJuTm6IsHKOtZ+4n0yZ
 KuWHXramWet3jT0VfZ1fdKg4m2wQ1D97cUyYwRjL13j8hi/9jPtHszV89vsfKtJYczyE
 /6IfX09mgRSSvYzltt7NPvup2ixaMsSNsTIimRvaDq8VrY+ksg1TNfdmCeLJ5hzZI8LA
 Wzuw==
X-Gm-Message-State: AOAM530lEAY+8MGzOgJhzCd/jP4HQf5AEPnAVlxP8EEYoUiGj7eiEYDE
 GsyxS7tcoEIZ9K2BM+7eWvDSKNxumtRnDN+0NtQTxQ==
X-Google-Smtp-Source: ABdhPJyjAByij8Qk1CaDtaAMVqMJcGOHCXcP0XGXMmNceuB4WtJwYBmD6499PDDwlc4Te15IKPi/UV6xPsjZ/qWkgTs=
X-Received: by 2002:a05:6830:1f19:: with SMTP id
 u25mr15935040otg.303.1625662774882; 
 Wed, 07 Jul 2021 05:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
 <20210706101209.3034092-4-daniel.vetter@ffwll.ch>
 <7ae23a2b1a4aec4e57881e0d88a7d046fe17bfda.camel@pengutronix.de>
 <CAKMK7uFHnet_rTHmBqsVPNcdWaJ=7nwiS3zHisiGOjBHPt=Qmg@mail.gmail.com>
 <fcb56f349052fda3997bfc90fd34537858051f44.camel@pengutronix.de>
In-Reply-To: <fcb56f349052fda3997bfc90fd34537858051f44.camel@pengutronix.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 7 Jul 2021 14:59:23 +0200
Message-ID: <CAKMK7uF2CMk4_FGuLriKLPnz81QUQC6mJ9GXi3Wbxh6diG7Nbg@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/etnaviv: Don't break exclusive fence ordering
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, Jul 7, 2021 at 2:31 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Mittwoch, dem 07.07.2021 um 13:37 +0200 schrieb Daniel Vetter:
> > On Wed, Jul 7, 2021 at 10:54 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > >
> > > Hi Daniel,
> > >
> > > I'm feeling like I miss a ton of context here, so some maybe dumb
> > > questions/remarks below.
> > >
> > > Am Dienstag, dem 06.07.2021 um 12:12 +0200 schrieb Daniel Vetter:
> > > > There's only one exclusive slot, and we must not break the ordering.
> > > >
> > > > A better fix would be to us a dma_fence_chain or _array like e.g.
> > > > amdgpu now uses, but it probably makes sense to lift this into
> > > > dma-resv.c code as a proper concept, so that drivers don't have to
> > > > hack up their own solution each on their own. Hence go with the simple
> > > > fix for now.
> > > >
> > > > Another option is the fence import ioctl from Jason:
> > > >
> > > > https://lore.kernel.org/dri-devel/20210610210925.642582-7-jason@jlekstrand.net/
> > >
> > > Sorry, but why is the fence import ioctl a alternative to the fix
> > > proposed in this patch?
> >
> > It's not an alternative to fixing the issue here, it's an alternative
> > to trying to fix this here without adding more dependencies. Depends a
> > bit what exactly you want to do, I just linked this for the bigger
> > picture.
> >
> I appreciate the bigger picture, it just makes it harder to follow what
> is going on in this exact commit when trying to match up the code
> change with the commit message. I would have expected this link to only
> be part of the cover letter explaining the series, instead of being
> part of the commit message.

I wanted to list all the better fix options in the commit message so
that you have the full context.

> > > >
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > > Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> > > > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > > > Cc: etnaviv@lists.freedesktop.org
> > > > ---
> > > >  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++++---
> > > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > > index 92478a50a580..5c4fed2b7c6a 100644
> > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > > > @@ -178,18 +178,20 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
> > > >       for (i = 0; i < submit->nr_bos; i++) {
> > > >               struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
> > > >               struct dma_resv *robj = bo->obj->base.resv;
> > > > +             bool write = bo->flags & ETNA_SUBMIT_BO_WRITE;
> > > >
> > > > -             if (!(bo->flags & ETNA_SUBMIT_BO_WRITE)) {
> > > > +             if (!(write)) {
> > >
> > > No parenthesis around the write needed.
> > >
> > > >                       ret = dma_resv_reserve_shared(robj, 1);
> > > >                       if (ret)
> > > >                               return ret;
> > > >               }
> > > >
> > > > -             if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
> > > > +             /* exclusive fences must be ordered */
> > >
> > > I feel like this comment isn't really helpful. It might tell you all
> > > you need to know if you just paged in all the context around dma_resv
> > > and the dependency graph, but it's not more than noise to me right now.
> > >
> > > I guess the comment should answer the question against what the
> > > exclusive fence we are going to add needs to be ordered and why it
> > > isn't safe to skip implicit sync in that case.
> >
> > The full-length comment is the doc patch, which is last in the series.
> > Essentially the rule is that your not allowed to drop fences on the
> > floor (which you do if you just set a new write fence and not take any
> > of the existing fences as dependencies), at least for shared buffers.
> > But since it's easier to be consistent I think it's best if we do this
> > just across the board.
> >
> > Like the commit message explains, there's a few ways to fix this:
> > - just treat it as implicit synced
> > - chain the fences together - that way you don't sync, but also
> > there's no fence that's being lost. This is what amdgpu does, and also
> > what the new import ioctl does.
> >
> > 2nd option is a lot more involved, and since all the dma-resv stuff is
> > a bit under discussion, I went with the most minimal thing possible.
>
> Thanks for the confirmation, that was as much as I figured from the doc
> patch as well. So with that in mind I would expect this comment to read
> something like this:
> "Adding a new exclusive fence drops all previous fences from the
> dma_resv. To avoid violating the signalling order we err on the side of
> over-synchronizing by waiting for the existing fences, even if
> userspace asked us to ignore them."

Thanks for the suggestion, I've applied that to all the 3 patches for
msm/etnaviv and i915.

I hope with that added there's enough context in the commit message
that at least the gist is understandable without full context down the
road.
-Daniel

>
> Regards,
> Lucas
>
> > -Daniel
> >
> > >
> > > Regards,
> > > Lucas
> > > > +             if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT && !write)
> > > >                       continue;
> > > >
> > > >               ret = drm_sched_job_await_implicit(&submit->sched_job, &bo->obj->base,
> > > > -                                                bo->flags & ETNA_SUBMIT_BO_WRITE);
> > > > +                                                write);
> > > >               if (ret)
> > > >                       return ret;
> > > >       }
> > >
> > >
> >
> >
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
