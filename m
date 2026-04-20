Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BQ/N7yh5mkrzAEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Mon, 20 Apr 2026 23:59:24 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B053434674
	for <lists+etnaviv@lfdr.de>; Mon, 20 Apr 2026 23:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411F010E769;
	Mon, 20 Apr 2026 21:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O1GnK4+K";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7190410E76A
 for <etnaviv@lists.freedesktop.org>; Mon, 20 Apr 2026 21:59:19 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-35d965648a2so3016247a91.0
 for <etnaviv@lists.freedesktop.org>; Mon, 20 Apr 2026 14:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776722359; cv=none;
 d=google.com; s=arc-20240605;
 b=llbhc0+QUrVVv3ZRfxoWZm9GHUJrekHAvUfi4RnjRZJJ4w7uRYFn6Qop3+N/NqdbDS
 4FgkkUxJ/O683uthj17eiUJ9/tGH2kZhKYV5TLZf1WDdSxqaJYNyAULuCr5U7UJgJGRs
 17yEB6y9HW/phYEYmCPIa1Hss+XO+LO0UUb+jI/aYhu49ttIb1uQwMKWVIlq0yJcBFs9
 DnaCnAQK2qOZ2GRkiXSqWFaj2Pz+r6Ovw5d0Znh3mZaS7PzwiLKa0c1FaoInlp7Pt+s3
 o707SAC/mB97FCXjrJYD1XaghtFQTkyVjyj6Vl6PvMOxPycPiAEla/0zQ4kjfU3bEI5R
 L5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=oZHwgC3Xzf8jfkbpQVbDXt2pNcNKRQomh8QKnspAMRk=;
 fh=GIYWI4UIfOWrydubEm1GlsGkx1AhxCUnQoxxFGlk0Ns=;
 b=IvL4fVqxunZf8r0+yAZikx8hDWAPS88qbt3OOzqy/FcgunVg1SrfyeWdUgyzVkJKjn
 pylTTvC+9V9KHdhL0FWePdcByHWhafctPZTCvppcAYTYYXCZmjF/3qt1q6ocfqJqURrc
 MFgtbnnZqD+IpOugf9qqpw7RRb/2aUdfSwo+u2gY0FlMj48HIpjiMSyVl2wbqrDjY4nB
 Hn5vu1Xfb4+Ue6E5lnTBDzjSNrRgNNesC7uY/+XPr2DwtZHsW1r5OX96sqMIWnjTu6VU
 RkDIjyCi3c5xVV5IJz7Ojwo3Kk/Ww/JsifZ7Ye2jhjQWVmoX5PINlxj5Y3ZrVbwEhWqt
 xpbg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776722359; x=1777327159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZHwgC3Xzf8jfkbpQVbDXt2pNcNKRQomh8QKnspAMRk=;
 b=O1GnK4+KT4MUD6FAwIfs3kBD1zgQiw92HK9EPPLT+sCN2V2ImzF0w8aOJmMdMhft04
 BTi8ULB9fvtbZ/doJMJAXVtPTC9sfHuOjQad4MpQ7glEIp5XfunMFq/3B3I3WS8vFl8i
 4oEmsdxURpf1+Pw9cQMxwkPPABPLLozZPDVA1eC5fOTXfj+/+wU8IefZh8ecBzUsmbD6
 frvYvpJajHnEHdgTGjeH9eigQ7+ri2mjHl6W5re85N1iwWG7+IIwIj9tiiFX8I99b3wE
 sLMUKIoitccfa47haY4FH60ZQsxG8uQdlQhnpQQUlFyfOiliPePCDPVVxjHtB73bfMBv
 /nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776722359; x=1777327159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oZHwgC3Xzf8jfkbpQVbDXt2pNcNKRQomh8QKnspAMRk=;
 b=jr/8BV0lHWPSjX8jZeSqasIgBlzpZMa1pHxZXpAE8KFAorJdn935ZeOnVa8f8/RD3d
 vuwac056zhlnC/A8zaeSv6lQ91U3pCGo++JuwnU8dDI1FzDtEOBh+AtMX4n+Ug1janaZ
 3ahpa5vuFtzXGZaO+Fc+FGmvbziLfG7cVZrxzVoh0rhc9OtDfFFztxtU7IjaH87Nh8q6
 FBVOREa+Bv6qZCtCe1yZWi9WAf0/oYPf5lH5HPnHljyCvkHSGGX/sj6Fpjfa68kFJj5f
 BKCmUqMEetSs4IL+HYlxTLTPY8Cxa+M3J6LWKIuPdzrlpHHILCPYbYGj4Bqcena7BncP
 iVWQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8mEWJS1CGurzSXxcxOxNG29SHHCmsW4whUxWArDrA5tdp7PBo0ER4nBVeMIU9VlpXAPyoiM7iw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEP9yMkxCLKmMHjrtHTxSGyz2I717fq6gJhothrioqhrSsibHQ
 VKzozs3q47+Bs47isjS7oZa5oySlngA+XjPRMbDxTmZfFYWPH/VitfmU3d7Bgay2VuL8nQSxwJ8
 VeF56Qx3sa4LCpuTVJyvrIHj9uPHnv8E=
X-Gm-Gg: AeBDieta3Gg8uIPanslLy2dEO3ps1weLPGaO/0E3FfXxZhi5db9ReSZ1OIRHAz9jegY
 GRw3Iwn1bnkr7w0itbvw9S1F0vrkfP04FwdMZGms19YHtdqdZw2mzk9cBSoA1nBrtpU5ZOwUKIR
 KS2EzRdqZsNTqSLZ54U2fofH9kKQe7DZFXfcxc3hMKXXcS6NfVDHEMVS7eSJc7QEut3LdLVqL5k
 cfiFEfcSz4wFPQIlIRqCmNkl02qjayotT2N37H8HsWJ/qNKQF9fr78IlbsbweaCEkAd5NKO1vrp
 k1oUO32P0U+aeZqixxpv7oFtYeHBzfD5IiRSs6g5etntPMnz
X-Received: by 2002:a17:90b:3f84:b0:359:1130:1047 with SMTP id
 98e67ed59e1d1-36140468c28mr14794415a91.17.1776722358823; Mon, 20 Apr 2026
 14:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260402193424.2023318-1-mcanal@igalia.com>
 <c277db50-2f06-4e33-a700-23751ddab281@igalia.com>
In-Reply-To: <c277db50-2f06-4e33-a700-23751ddab281@igalia.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 20 Apr 2026 23:59:07 +0200
X-Gm-Features: AQROBzAo17709YwScIPIv4bXTMRHuh16P_cry_7bg3XCI-EzAk_s5u1bKkD4Ppg
Message-ID: <CAH9NwWcZ1B1GN=K7nbD6WFqab_GrnArJj_vasFaZfrHJaUoK+A@mail.gmail.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:airlied@gmail.com,m:simona@ffwll.ch,m:phasta@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:dri-devel@lists.freedesktop.org,m:kernel-dev@igalia.com,m:linux@armlinux.org.uk,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,kernel.org,intel.com,lists.freedesktop.org,igalia.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4B053434674
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ma=C3=ADra

>
> On 02/04/26 16:32, Ma=C3=ADra Canal wrote:
> > When xa_alloc_cyclic() failed in etnaviv_sched_push_job(), the error
> > path skipped drm_sched_entity_push_job(). This is a violation of the DR=
M
> > scheduler contract, as once a job has been armed with drm_sched_job_arm=
(),
> > it must be pushed with drm_sched_entity_push_job(). From the DRM
> > scheduler documentation,
> >
> > """
> > drm_sched_job_arm() is a point of no return since it initializes the
> > fences and their sequence number etc. Once that function has been calle=
d,
> > you *must* submit it with drm_sched_entity_push_job() and cannot simply
> > abort it by calling drm_sched_job_cleanup().
> > """
> >
> > Fix this by splitting the fence ID allocation into two phases: first,
> > alloc an xarray slot before arming the job (which can fail), then fill =
in
> > the actual fence with xa_store() after arming. This way, allocation
> > failures are handled before the job is armed, and once armed, the job i=
s
> > always pushed to the scheduler.
> >
> > This also fixes a double call to drm_sched_job_cleanup(), as both
> > etnaviv_sched_push_job() and its caller would call it on failure.
> >
> > Fixes: 764be12345c3 ("drm/etnaviv: convert user fence tracking to XArra=
y")
> > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>
> Gentle ping
>

Thanks for the patch - looks good. I=E2=80=99ll take care of it over the ne=
xt few days.

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
