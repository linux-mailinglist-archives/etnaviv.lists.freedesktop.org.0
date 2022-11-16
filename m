Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094662B667
	for <lists+etnaviv@lfdr.de>; Wed, 16 Nov 2022 10:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2170F10E455;
	Wed, 16 Nov 2022 09:23:48 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A30F10E456
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Nov 2022 09:23:42 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bj12so42499455ejb.13
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Nov 2022 01:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O+eqPV8vIGufDZLwgcLWiNp6N33prs1BioCONp18mzg=;
 b=CujKVXoeHew0QZ4oBuVDL3NCmrZqiSy+hpProanhiYFYiwk+LbNk7du4vCUiIk/oFJ
 7tPoGWQb1F2s0ZGtoJ+PB4D4gq7/t+pYQQ0MIzkzYB+ZmaZlj1N+97BbP9Uj+1d2kwYd
 SNiULWnUQuWHV195GLTeZSHspEUz+obTCrPt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+eqPV8vIGufDZLwgcLWiNp6N33prs1BioCONp18mzg=;
 b=Pn6EKvKtiti10ODy6uP1hghVKNrAWcZE2IjAkHKBq5uvwPOHtKSEWoTsBJZqdlSGmy
 MBWyytEknVIoDwvayoKvcrSeIuMYom+/YGINCQtPJgBmNUiUkacOoBlAAOuV4Krb0fNJ
 nL0tIHDgOYlme0BeppoCqhJWKGGJxy2f+5dC6trmtB5fctmtfvKzAXSvcftJ60aF9PHo
 zUgHMMXZhl1wQm2OSM6McMPrq2nHSGmIhBWAAD2W3gis40bMwO/yeYNEijdVxqITkpbd
 qLounf33/y+stkLi2J0TO155ZU00jd9/iQVy0lT4X57QXJ/+zMLzZF32tXPvKVLFAtjb
 rq7g==
X-Gm-Message-State: ANoB5pnWnGV9kadqi7uT7Z8BnsQQO+naq+4orRQmRO9CRNho3mpvVUoi
 hj/DyAiLDtp4SPyRLR8tMo3R7g==
X-Google-Smtp-Source: AA0mqf4E3+fNumHZzbrbwb4uT/OreZh9KLbtz6LJXYT6l4Ogo+ELPSgrTLmgDzEhvtGB5Cfll+f5VQ==
X-Received: by 2002:a17:907:8b0a:b0:78d:99f2:a94e with SMTP id
 sz10-20020a1709078b0a00b0078d99f2a94emr17151990ejc.232.1668590621377; 
 Wed, 16 Nov 2022 01:23:41 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 w12-20020a056402128c00b0046730154ccbsm7266268edv.42.2022.11.16.01.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 01:23:40 -0800 (PST)
Date: Wed, 16 Nov 2022 10:23:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: switch to PFN mappings
Message-ID: <Y3SsG0eW1HFZIOb/@phenom.ffwll.local>
References: <20220909092044.3441775-1-l.stach@pengutronix.de>
 <a105ba6089f77f1c3b8310b06815cb733eb7841c.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a105ba6089f77f1c3b8310b06815cb733eb7841c.camel@pengutronix.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 10:17:02AM +0100, Lucas Stach wrote:
> Am Freitag, dem 09.09.2022 um 11:20 +0200 schrieb Lucas Stach:
> > There is no reason to use page based mappings, as the established
> > mappings are special driver mappings anyways and should not be
> > handled like normal pages.
> > 
> > Be consistent with what other drivers do and use raw PFN based
> > mappings.
> 
> Anyone up for reviewing this? Basically it moves etnaviv closer to what
> all the other DRM drivers are doing.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Note that since you've had VM_IO before it was already VM_SPECIAL, so
outside of etnaviv (for stuff like get_user_pages/userptr) there's not
really a difference. But it's nice to be a tad more consistent, since page
mapping + VM_IO really doesn't make that much sense :-)
-Daniel

> 
> Regards,
> Lucas
> 
> > 
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > index d45bf0368339..68e4446a94ad 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > @@ -130,7 +130,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
> >  {
> >  	pgprot_t vm_page_prot;
> >  
> > -	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
> > +	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
> >  
> >  	vm_page_prot = vm_get_page_prot(vma->vm_flags);
> >  
> > @@ -165,7 +165,8 @@ static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
> >  	struct vm_area_struct *vma = vmf->vma;
> >  	struct drm_gem_object *obj = vma->vm_private_data;
> >  	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
> > -	struct page **pages, *page;
> > +	struct page **pages;
> > +	unsigned long pfn;
> >  	pgoff_t pgoff;
> >  	int err;
> >  
> > @@ -189,12 +190,12 @@ static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
> >  	/* We don't use vmf->pgoff since that has the fake offset: */
> >  	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> >  
> > -	page = pages[pgoff];
> > +	pfn = page_to_pfn(pages[pgoff]);
> >  
> >  	VERB("Inserting %p pfn %lx, pa %lx", (void *)vmf->address,
> > -	     page_to_pfn(page), page_to_pfn(page) << PAGE_SHIFT);
> > +	     pfn, pfn << PAGE_SHIFT);
> >  
> > -	return vmf_insert_page(vma, vmf->address, page);
> > +	return vmf_insert_pfn(vma, vmf->address, pfn);
> >  }
> >  
> >  int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset)
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
