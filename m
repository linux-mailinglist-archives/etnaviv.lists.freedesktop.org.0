Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3CD3C64E3
	for <lists+etnaviv@lfdr.de>; Mon, 12 Jul 2021 22:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C90689E5B;
	Mon, 12 Jul 2021 20:22:53 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9767689E5B
 for <etnaviv@lists.freedesktop.org>; Mon, 12 Jul 2021 20:22:51 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id b13so31072413ybk.4
 for <etnaviv@lists.freedesktop.org>; Mon, 12 Jul 2021 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a3t8M9p1Xm1DbJhl1g0NI4nr029zZMFUcrN6YRFecnc=;
 b=fvieSNTAu0QOO6Kgbsr4CMsCMbnxljtbkFs749HKPLwSgK6LFrB2/sSXxXxPEbXsYJ
 z+5kxgh90Zt5bn2SqS/SoUg10IyqffUs/dYT861u++JBLu4krWCMS5xoB1UQ5zIKt1gV
 ygViuUifqM/ZQSPMiEjxkDXkBrvLsEgrl2NXRw2XO7eRgRi6bTfBmxArAUIoXc4cyJmk
 6NgCzRhmnDVTpalVxtk+LEutBcNDYazZpsWTIGp4mJXfMnexW3K+jls+LmH+ms7T12BP
 pautDNXemHkvMsYm5uJwTq5CGpcc8Jwfw0RRFnhHqhaTNEqrFRWsB9PehyrS2FQOB3Nv
 EBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3t8M9p1Xm1DbJhl1g0NI4nr029zZMFUcrN6YRFecnc=;
 b=hYlwGOCkSWHZBMOmASEdYMceYS0NER7G4T1N2Gi+upxQqYbZTG1oJAcwuACDtCbois
 Yo42pYmcjhTqqWXoX0OwizLsERy9EHkZ60C34Llrn06GSKT+9yVnX6pBB0LeSE9paccr
 RVBdhtD9mscITe6dL9e3llefEi2qkQaOR9rafEVcsdLEmcMWPf0xAxCUE4UPe4IeQsyV
 lFEmBS39LjpG7Md39cinnhNtojFlr1Ym0gOkNBJt7CEaOAfjl4EuzI819wVfwFexXrq1
 Ef7v18AT7XI96YPAEuHzSreWypEXeVTMyQCeloA+ssbJb27Cao7Cyk5otQCmL7MRRqeP
 BSHA==
X-Gm-Message-State: AOAM532aDggusOvQIBDR9WwLOgO9Q2iJ5jC1lvYt6BJw5vur5uzNZudP
 UZTHVUs3a3u16QBQzAqKGaWovKRD/ErQFBafoOOdpg==
X-Google-Smtp-Source: ABdhPJx2wuE9Pm+zYEWPkhe410Q70juC3Q6Ib1mH/wyNMBjZa35BDO2FxwK8XexNYfq4Pv5l+XWIEuKMnYscXjN4aZE=
X-Received: by 2002:a25:38d4:: with SMTP id f203mr1045399yba.45.1626121370668; 
 Mon, 12 Jul 2021 13:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20210712175352.802687-2-daniel.vetter@ffwll.ch>
From: Emma Anholt <emma@anholt.net>
Date: Mon, 12 Jul 2021 13:22:39 -0700
Message-ID: <CADaigPXPpiEfMOZ+h=H6e_brdK-1n0Aax34oWTaiJaDjM=EsfA@mail.gmail.com>
Subject: Re: [PATCH v4 01/18] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Adam Borowski <kilobyte@angband.pl>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>,
 lima@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Sonny Jiang <sonny.jiang@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Nick Terrell <terrelln@fb.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 1:01 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> This is a very confusingly named function, because not just does it
> init an object, it arms it and provides a point of no return for
> pushing a job into the scheduler. It would be nice if that's a bit
> clearer in the interface.
>
> But the real reason is that I want to push the dependency tracking
> helpers into the scheduler code, and that means drm_sched_job_init
> must be called a lot earlier, without arming the job.
>
> v2:
> - don't change .gitignore (Steven)
> - don't forget v3d (Emma)
>
> v3: Emma noticed that I leak the memory allocated in
> drm_sched_job_init if we bail out before the point of no return in
> subsequent driver patches. To be able to fix this change
> drm_sched_job_cleanup() so it can handle being called both before and
> after drm_sched_job_arm().
>
> Also improve the kerneldoc for this.
>
> v4:
> - Fix the drm_sched_job_cleanup logic, I inverted the booleans, as
>   usual (Melissa)
>
> - Christian pointed out that drm_sched_entity_select_rq() also needs
>   to be moved into drm_sched_job_arm, which made me realize that the
>   job->id definitely needs to be moved too.
>
>   Shuffle things to fit between job_init and job_arm.
>
> v5:
> Reshuffle the split between init/arm once more, amdgpu abuses
> drm_sched.ready to signal gpu reset failures. Also document this
> somewhat. (Christian)

Ack from me for the changes I was Cced on.
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
