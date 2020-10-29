Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8753029EE0F
	for <lists+etnaviv@lfdr.de>; Thu, 29 Oct 2020 15:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1F76ECC5;
	Thu, 29 Oct 2020 14:21:41 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056BC6ECC5
 for <etnaviv@lists.freedesktop.org>; Thu, 29 Oct 2020 14:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 9BF0BFB03;
 Thu, 29 Oct 2020 15:21:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIiNAjulvq7a; Thu, 29 Oct 2020 15:21:37 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id F304144637; Thu, 29 Oct 2020 15:21:36 +0100 (CET)
Date: Thu, 29 Oct 2020 15:21:36 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 0/2] drm: etnaviv: Unmap gems on gem_close
Message-ID: <20201029142136.GA316994@bogon.m.sigxcpu.org>
References: <cover.1603979517.git.agx@sigxcpu.org>
 <CAKMK7uF2By1SwE+FOyM2i7cOtFzzJ9wrHh_yDntG7cyNt0tJUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uF2By1SwE+FOyM2i7cOtFzzJ9wrHh_yDntG7cyNt0tJUg@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi,
On Thu, Oct 29, 2020 at 03:08:09PM +0100, Daniel Vetter wrote:
> On Thu, Oct 29, 2020 at 2:54 PM Guido G=FCnther <agx@sigxcpu.org> wrote:
> >
> > This is meant as a RFC since i'm not sure if this is the right
> > way to fix the problem:
> >
> > So far the unmap from gpu address space only happened when dropping the
> > last ref in gem_free_object_unlocked, however that is skipped if there's
> > still multiple handles to the same GEM object.
> >
> > Since userspace (here mesa) in the case of softpin hands back the memory
> > region to the pool of available GPU virtual memory closing the handle
> > via DRM_IOCTL_GEM_CLOSE this can lead to etnaviv_iommu_insert_exact
> > failing later since userspace thinks the vaddr is available while the
> > kernel thinks it isn't making the submit fail like
> >
> >      [E] submit failed: -14 (No space left on device) (etna_cmd_stream_=
flush:244)
> >
> > Fix this by unmapping the memory via the .gem_close_object callback.
> >
> > The patch is against 5.9 and will need to be redone for drm-misc-next d=
ue to
> > the conversion to GEM object functions but i'm happy to do that it look=
s like
> > the right approach.
> >
> > I can trigger the problem when plugging/unplugging a DP screen driven b=
y DCSS
> > while DSI is driven by mxsfb. It preferably happens with 4k since this
> > allocates bigger chunks.
> >
> > I also folded in a commit checking for the context->lock in
> > etnaviv_iommu_insert_exact and etnaviv_iommu_remove_mapping too to make=
 it
> > match etnaviv_iommu_find_iova.
> >
> > Guido G=FCnther (2):
> >   drm: etnaviv: Add lockdep annotations for context lock
> >   drm: etnaviv: Unmap gems on gem_close
> =

> Can you pls resubmit with dri-devel on cc? This is kinda a general
> problem of letting userspace manage the gpu VA.

Sure, done.
 -- Guido

> -Daniel
> =

> >
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c |  1 +
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.h |  1 +
> >  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 32 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/etnaviv/etnaviv_mmu.c |  4 ++++
> >  4 files changed, 38 insertions(+)
> >
> > --
> > 2.28.0
> >
> =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> etnaviv mailing list
> etnaviv@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/etnaviv
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
