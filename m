Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CBBAB0368
	for <lists+etnaviv@lfdr.de>; Thu,  8 May 2025 21:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6124510E012;
	Thu,  8 May 2025 19:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="J8qWSCxt";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65B010E012
 for <etnaviv@lists.freedesktop.org>; Thu,  8 May 2025 19:12:05 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-70a338b1ce5so9419217b3.0
 for <etnaviv@lists.freedesktop.org>; Thu, 08 May 2025 12:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1746731522;
 x=1747336322; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTf3AI95bM3SluiF+bL7cREfN/HXYnAFwT21a0zqJvw=;
 b=J8qWSCxt+9DsUcBeCZ2sTf2i7EpheyZCw6ameEm3+p5Q7wBvJWeyzUSdSAwJVXjO+R
 x3yczkSfCos/HipYbMsK1JWwLfVJ/eBgq6Knw7VK4IPgB93nXyeX5sSEZ+/BWbgdMedQ
 7fHbMWrq2Gq+BPt+ueHUZIys2N6tyTI12t+5eisbToqz0X9dKC2Wq+ffo3tMdxMhW40E
 5NxZiYyugQmApi7QfLLInAm1aUSpoGNDDFxHct7rgsH8RL3nxN6YeMmx2VTvQX5Bt5t4
 bQ4QsuboQyt4pI3tAltQD+F/kJ2KQb1MosrFetnyOO9/lDc2a5rAcQ2iY1W4hc/qZqHs
 HdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746731522; x=1747336322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTf3AI95bM3SluiF+bL7cREfN/HXYnAFwT21a0zqJvw=;
 b=Z1rRX97YHlhAyXJIMPAJht1j+GaPWdwwQlK/yTozmMhfBF0wx1T3Un86i3kM5qIDs5
 D1Ucv/kJUuKANVRg34meijiouAfaXUcQXuz4XZZcZwVI6wWR1flskBZhUCUk+x5eFPL5
 ZDF90M/bmvEUoDWripgT3wv+di7UvC1d8Jfus2MGghVNDhyfGScBjLklnmaNMvB/keUE
 +Th+ECbzQxVv9fYiH+yi16TiP5AcUjeTlsnj7XQ9uGvOrxE20PdXTzZNchN4DgoOcbyK
 Ym8bVfNz+c/j8Jw0fTkmIjH7mfdGsV4fcuCZ7/2f+ucE7sGA0iGyFrrMaiH4dhjcSUCb
 /afQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbjV3fIlLDQji/KNFohkEFJoaJ+Bgxpxw4isrjQlvpqZVaGa6vVNsXRjxxgcQQ3qQOowE43Pru@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3Bro0u3ilxoK5l6SnscOseR0oAvaGLusFlG/RPW35z5D5Uof8
 G1IBdIcZN6KgfEW6GzzG96gObKd0PqvLDAbrr+so5moS6diVWGP6OdIIoR8NQxCq+05Os5ZVX96
 ma4RBYQ==
X-Gm-Gg: ASbGnct8V+nj/5GguWRdIBC+Yp3HskCf16N+qJ7FGV5IELWl1BElleaGrRsGR6R9XJX
 8s6YrqyaSxL2L/z5OQ4poiS1RcDPytE9c69BboDoN1WD7G/cGaIROETFGrKaTxQ+uODwxqdWAm0
 eO77BW23XhwULPyGmuCa0TfcirZE+mpaBaOVyUMR+PP8aYHv/v5kA865ddjYo9EWw20wrwFqryx
 C8DhkB3en9sJNR06FMBLkM2kbC1Ku4Ycdisxc7B2MUtTXQlktTyAJFyyMsqe/qw/+j5XYRvOhq8
 JVfSIY3GmOV5vZoTg/Q7Fg116gJOEeNENXR3opSw7O7HhydHNL3NRNqIGaFdc7Un6jNP7yEi05Z
 HXWuFr82S
X-Google-Smtp-Source: AGHT+IEM/fzzXs1956VU17theM/urtccdrmfKcouqy4HT5UuiysZTr0icphh81TtuH38lZMVic6yww==
X-Received: by 2002:a05:690c:3803:b0:6fb:b37f:2072 with SMTP id
 00721157ae682-70a3fa57232mr8929227b3.22.1746731522048; 
 Thu, 08 May 2025 12:12:02 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-70a3d8be1ecsm1993547b3.50.2025.05.08.12.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 12:12:01 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e740a09eae0so1302017276.1; 
 Thu, 08 May 2025 12:12:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCViVGWQ0r8FAqpv+0GUCpMnrKNtiYNN6iNC33GL2RpSnrcHwSAuMTf0QcKYyiTg83hncV6dBbd5mQ==@lists.freedesktop.org,
 AJvYcCWY8v8xeCQ4osJDCspijC5cUiz5EwcM6GMhriOo7qGwtzKIIrBFo4AbmcivivvtN682inDKlcXTlmg=@lists.freedesktop.org
X-Received: by 2002:a05:6902:210e:b0:e73:2039:10b5 with SMTP id
 3f1490d57ef6-e78fdbe1809mr948464276.5.1746731520724; Thu, 08 May 2025
 12:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
 <20250508145624.4154317-1-tomeu@tomeuvizoso.net>
 <a18f214ab0487a1c562f9e2f7f66ab1345925177.camel@pengutronix.de>
In-Reply-To: <a18f214ab0487a1c562f9e2f7f66ab1345925177.camel@pengutronix.de>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 8 May 2025 21:11:48 +0200
X-Gmail-Original-Message-ID: <CAAObsKDwVB7w0mK3qkJJ-x3sOVxbcM5pbjxJk-106baaiwM=dg@mail.gmail.com>
X-Gm-Features: ATxdqUHU3XaLDR8S2zaGYwUwcL8lv1VNDzcEDTTYilVdMESYY9EBz9Cry6NW0ic
Message-ID: <CAAObsKDwVB7w0mK3qkJJ-x3sOVxbcM5pbjxJk-106baaiwM=dg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: Fix flush sequence logic
To: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, May 8, 2025 at 7:08=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> Am Donnerstag, dem 08.05.2025 um 16:56 +0200 schrieb Tomeu Vizoso:
> > We should be comparing the last submitted sequence number with that of
> > the address space we may be switching to.
> >
> This isn't the relevant change here though: if we switch the address
> space, the comparison is moot, as we do a full flush on AS switch
> anyway. The relevant change is that with the old code we would record
> the flush sequence of the AS we switch away from as the current flush
> sequence, so we might miss a necessary flush on the next submission if
> that one doesn't require a AS switch, but would only flush based on
> sequence mismatch.

Ah, you are right.

> Mind if I rewrite the commit message along those lines while applying?

Sure, no problem.

Thanks,

Tomeu

> Regards,
> Lucas
>
> > Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm=
/etnaviv/etnaviv_buffer.c
> > index b13a17276d07..88385dc3b30d 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> > @@ -347,7 +347,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, =
u32 exec_state,
> >       u32 link_target, link_dwords;
> >       bool switch_context =3D gpu->exec_state !=3D exec_state;
> >       bool switch_mmu_context =3D gpu->mmu_context !=3D mmu_context;
> > -     unsigned int new_flush_seq =3D READ_ONCE(gpu->mmu_context->flush_=
seq);
> > +     unsigned int new_flush_seq =3D READ_ONCE(mmu_context->flush_seq);
> >       bool need_flush =3D switch_mmu_context || gpu->flush_seq !=3D new=
_flush_seq;
> >       bool has_blt =3D !!(gpu->identity.minor_features5 &
> >                         chipMinorFeatures5_BLT_ENGINE);
>
