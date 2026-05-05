Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHwfKEC/+WkmDAMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 05 May 2026 11:58:24 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FAD4CA42D
	for <lists+etnaviv@lfdr.de>; Tue, 05 May 2026 11:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFE810EA2F;
	Tue,  5 May 2026 09:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nur+LkGx";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7154A10EA30
 for <etnaviv@lists.freedesktop.org>; Tue,  5 May 2026 09:58:21 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-c80227b1f6cso755674a12.1
 for <etnaviv@lists.freedesktop.org>; Tue, 05 May 2026 02:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777975101; cv=none;
 d=google.com; s=arc-20240605;
 b=HSrFmCjRf6yazMeWM5K5zwRiKGmvU4NCeJBrpLy5g4h3XEkknA2XMBfparDL4+UBwi
 Dpi1604PtsvY1S5KqqtfwUgMmXFa4MgEPGWgEu7X2D8bVjOUgHMNAetV2OqhhDjJhP2K
 K4vsc1XA5TGkdsWtp4bRu+bRPdTcwx2zv66RYjPPaxYeM/3KcS9JGfJTEzfwXxq3aG0Y
 wkYiPmDM6FDD4qyaq8F0bURP8aJ/MC12jWUw9wR51q28FnfSRWC6MduwT3123HR+UI5J
 Zp5ByEu28DdCXffqgKioY1WBIYLU9WiuFkHPvEdqInLZOpHyzNa1MLXN67y0oUC4LouG
 u1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UrxUJHBBr7SJTAlV762fNk/m6IwtaONncgY9rtS10fk=;
 fh=Bk5v1MvUxugz/FSftnU2RqTGgG1MmeZfGr3JrlSA6uM=;
 b=I9fPrZpjys+G2tG18kbwx3uBHY/h0hsY7jLWoHGB401dc+ML9XpLjl9kYdq9V8Re/Q
 Uf/paFyBMDLB52r2Wk1O5Qgbafs7gPgDDe7x1IxAbKhrwAB8tlyMmlJjhZXB9j1vkwS1
 437sngzY9gy39o4gaE+JxFTFKf19caxwTW9c5jdnqEMoOmbuI5oFqf+hJnuLrvJ6c/Eq
 rzckHdMoGWC3pdfMsl5D7nrqGGqbWyRKJBRK6xU2+3849Yw2YzQBpwQcHYYv0ugwMR7L
 M6g9i3RjWKESjjiH5awLF9/KTd3ukCrX40yKIQxyDqcPkapn3OmjH8E4fVPYvTNAvCoC
 WD7A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777975101; x=1778579901; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UrxUJHBBr7SJTAlV762fNk/m6IwtaONncgY9rtS10fk=;
 b=Nur+LkGxPA+miYLxf516Mbx/s/iOeWsxnVryZz2DYtxjtCLwT59TYK6l5kCBi/sw9n
 l1FfUjT1Z1RLz/PgAjKon0GBTDf4+kgzpr/cP5Xy5BPQVZhZO7gth5l0J7z+OuOisN3y
 vgjNbEjRx902fMHj6MJm1T80nxIH2x6MAAGQ+xMJOTSnV3KKZKFLRvp1G6KK2F/vKcMD
 QUGhl+FH44TLjibgZfNYdY/uOgRpDLgjtMIQGBEmtTupOyI0+aBcEIwEU7SoMSlOiO/x
 WdLC61e/fQ2U9VDsk2Xt03D3/px3l+nqBxfFJV+ztYwtwXvjd/bMtkUDxjTJL2zUJFeC
 iFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777975101; x=1778579901;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UrxUJHBBr7SJTAlV762fNk/m6IwtaONncgY9rtS10fk=;
 b=C1+4KfLRDEdC9XE/Z6WovF0jEh1hKwG5s3pEuaO8yLeuQZywXCA1N4/GS9G15q6tLN
 ryq53OH1bU8yJURXtGg/SbkY5kV7opv2GYpASAtNV2nK8YtLuKthM6a0d7VpNtlBSWJX
 7Djg824b1wFDc6YSm/lU0/vMPdB47vl6S9/fox9A6yHaRAjQA8vcWZ2M4V3Fy6gMvsLg
 TvSNhg0LhMAMso99L/k+ZZledx1anFCrO2764xo7l/+KEwEhqHHwP23kJ8x/908ddcRj
 a9lH1f4ip2yq8AsovrtloGthKcTdD+7LN+lFsV9QdAhT83Fq7mbGRynYJbd3YMViP6gC
 Hb6Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/BslKsowpsmiE/+/+xgyYEnDTT1Ns5F5VY3RsbHACDlXkfR7tfBdL2k4inCaNcCT2dteS+0AUv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXTvSFVKBkQbTl9znNXmqgJwlxlMq3axSiqZB0Qwf/as2o5e3q
 8swrEL6Lm5C6Y5ShNserDDYvGAmx9ygQti0zTobnbLv31XuiaJDNLr/apK505/XaDEDfOPiWMOZ
 fwMu79zrEmsMWZ4d7RO7tPFqiFkkXPSY=
X-Gm-Gg: AeBDieuDzawY1HMR/tk2hMXl9wYF+UWYRztZxyjoARQS32YG3LX+eidPB2hwbdXZmA9
 NdpP/+3ee4QHI+3jqdGmC6Dp7Q6IWhAAZMl6eU+1ngLvWVPWMXhzUZxTW1uZwmmfQRd+BNO4jwP
 qM8jIx78usuBMeMmk+nPOT0CCe5E/8sGPOHmKj0LKnKwW4NcxJRr4s54cTwM4GX7Y1wQdEo+xuK
 rZtwNamjT4GQgk8+rk+w75npOgS4TsFz0M8rMjm+p9bSb5uE8+DswiuOOzrNMtbeBXzXw+9zffV
 4L3TUF2uL5zmxbu6bX2j9+BVKeOaaujyJOSQDAtztDDkS1oF
X-Received: by 2002:a05:6a21:e098:b0:3a2:d629:16a2 with SMTP id
 adf61e73a8af0-3a7f1a1df2amr12918590637.10.1777975100827; Tue, 05 May 2026
 02:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260402193424.2023318-1-mcanal@igalia.com>
 <c277db50-2f06-4e33-a700-23751ddab281@igalia.com>
 <CAH9NwWcZ1B1GN=K7nbD6WFqab_GrnArJj_vasFaZfrHJaUoK+A@mail.gmail.com>
 <6ff5b398-a5cc-4548-8260-5babff255beb@igalia.com>
In-Reply-To: <6ff5b398-a5cc-4548-8260-5babff255beb@igalia.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 5 May 2026 11:58:09 +0200
X-Gm-Features: AVHnY4K6NAu8oJooU1Flcnb9q498959JW2xJWJ-EqZsxd2Vt148-Lj0qjUpzQL0
Message-ID: <CAH9NwWdJqtv-b0NjngBvUhUG6wpSSgYiX_cj3DvxdwDvLKLiOA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Fix armed job not being pushed to the DRM
 scheduler
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Stanner <phasta@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 kernel-dev@igalia.com
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
X-Rspamd-Queue-Id: 09FAD4CA42D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:airlied@gmail.com,m:simona@ffwll.ch,m:phasta@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:dri-devel@lists.freedesktop.org,m:kernel-dev@igalia.com,m:linux@armlinux.org.uk,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,kernel.org,intel.com,lists.freedesktop.org,igalia.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]

Hi Ma=C3=ADra

> >
> >>
> >> On 02/04/26 16:32, Ma=C3=ADra Canal wrote:
> >>> When xa_alloc_cyclic() failed in etnaviv_sched_push_job(), the error
> >>> path skipped drm_sched_entity_push_job(). This is a violation of the =
DRM
> >>> scheduler contract, as once a job has been armed with drm_sched_job_a=
rm(),
> >>> it must be pushed with drm_sched_entity_push_job(). From the DRM
> >>> scheduler documentation,
> >>>
> >>> """
> >>> drm_sched_job_arm() is a point of no return since it initializes the
> >>> fences and their sequence number etc. Once that function has been cal=
led,
> >>> you *must* submit it with drm_sched_entity_push_job() and cannot simp=
ly
> >>> abort it by calling drm_sched_job_cleanup().
> >>> """
> >>>
> >>> Fix this by splitting the fence ID allocation into two phases: first,
> >>> alloc an xarray slot before arming the job (which can fail), then fil=
l in
> >>> the actual fence with xa_store() after arming. This way, allocation
> >>> failures are handled before the job is armed, and once armed, the job=
 is
> >>> always pushed to the scheduler.
> >>>
> >>> This also fixes a double call to drm_sched_job_cleanup(), as both
> >>> etnaviv_sched_push_job() and its caller would call it on failure.
> >>>
> >>> Fixes: 764be12345c3 ("drm/etnaviv: convert user fence tracking to XAr=
ray")
> >>> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >>
> >> Gentle ping
> >>
> >
> > Thanks for the patch - looks good. I=E2=80=99ll take care of it over th=
e next few days.
>
> Any update?
>

Applied to drm-misc-fixes.

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
