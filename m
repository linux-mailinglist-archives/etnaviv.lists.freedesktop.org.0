Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP/PFpAVuGl/YwEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Mon, 16 Mar 2026 15:37:04 +0100
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05A629B816
	for <lists+etnaviv@lfdr.de>; Mon, 16 Mar 2026 15:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FB110E4D2;
	Mon, 16 Mar 2026 14:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdSvCNSF";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A79F10E121
 for <etnaviv@lists.freedesktop.org>; Sun,  8 Mar 2026 12:59:45 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-439c6fc2910so3184355f8f.0
 for <etnaviv@lists.freedesktop.org>; Sun, 08 Mar 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772974784; x=1773579584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pCcvTZODN6sqyoYdkdvVRxc4wALvjVCgUO6jSwYiCpc=;
 b=SdSvCNSF5HGbmIbCZrjV+nwxT6tVijagxjQxR0yglPgMDd1ld5kMTerHpV077gwPOK
 B+CAi/ePiknVvI4XqaDlsrC8l89IBjmSUmfdXFzP1NzIoKtqLUAFpB4rjhZvsg1Iaj4H
 RZsGD/FSUrDFEpFeV5bL9xEGNQvtYk1jeMz4pUD2uERxnzOCnP4iYEeSvR7h9O83aGE5
 TtlR5xmthFgMnSIzsMOY4woawZ4wquKMYFDmF0lgjCtpJat72AZhxifr3xsWEAdPCwc3
 hcRGc67WmTWYxzVy6ATX23FPruYu8LqdjtmSmjB+SXRVNmNoNHQ8OPcG3dpRxJ7705EY
 UsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772974784; x=1773579584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pCcvTZODN6sqyoYdkdvVRxc4wALvjVCgUO6jSwYiCpc=;
 b=gERHSIIaafoymUiX6CzBXUDYCQo11ZSBaGy3DA5EjRoHjApnF4nZGMO8hMLZ4nsY3C
 XLgsf/wQVrxKdKqB7r18J2VlLMt1WuKlKBHVtFwwFsdtuh/bLcUqxKywvVkGENAMUB3g
 ismVgR8vYHMGYAnmNbbe2NWWQZTkTLWa8S09NDYgOb8X/90+Ts9i0HQR1KEQ6BUyAWFJ
 nK3iQ4UJogkwgk1sjKy1BKe3qEkZuqs5bdMSKk6tm1vHseuV2wzzyMBf+JkMeJW7s1vZ
 WYILHwsz/W2HHhIihxBXyBdHTJj+IZfMHKm1/VBpS6UXV5LjeJ70mbD5+MMBh7w/cyHQ
 ak2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaFxc7CFK9PepZdDVKY4kCfob7a+u4MVThv7kNVG6dNPrOasfcUpzJDL9rXoXtw26u5bhQAJ91@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgbKbMoqcFYxecGnTU34eL/1u8WVXeFbzRxXPBDiwmPsyxhcEZ
 fK9AT9+5+8Bi0f4O0GyBgs+Tn2fZX+bOsOQw3S5KjSfh91UeJlj7PQ5M
X-Gm-Gg: ATEYQzxk/FR8MnChV5+AQFmqb2Ba0tQPAcmfh+CrslndLSwF1bZmDeAmba69seulvVm
 uItugwQV6tQR1KwuMDHoAnIuxsciZ/x95IPjMIxGAZOK6XIT5RgMcK3KRoJdiqEeAwsA62tceuU
 QC2m5EkJS/7Fx6oVsErz/9WC2Zaug5waZA5NDh8wxYvo7GcF1rYY9lJnhU3mMyEms3e0YFwHJKm
 SeEOEfbhJcZBw9Fs1tjSGZXDvwxXaDRMaaNuS7xA29agqR63uAywVSZUiirAogf4+yJzB/aD/4s
 R4xMcABLLfbadeCH30V7bXq8emAubctuEf4k/2/e1ueG0HAkjQLzYeSHEafr/L6Tj80D2ovhSCH
 HJ5NzZ/DVOFbDY6Wy69RarOUV7H6Ho2Q4hXOEgoU3gpMllXyqTP7lstH21t42BbhVqogjgul44F
 Jc7p6Ma5cX+u+gLTUuUmnuYOZsIHkQNKaIWOxWrls6QeZPKQuRkmTsCoH2w2zQYhTiu38ZuHQ0h
 NW4AAydpW8=
X-Received: by 2002:a05:6000:2911:b0:439:beee:43aa with SMTP id
 ffacd0b85a97d-439da351b41mr14651067f8f.16.1772974783363; 
 Sun, 08 Mar 2026 05:59:43 -0700 (PDT)
Received: from timur-hyperion.localnet (5E1B97DE.dsl.pool.telekom.hu.
 [94.27.151.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8dbb3sm16332342f8f.4.2026.03.08.05.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 05:59:42 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: events@lists.x.org, xorg-devel@lists.x.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org,
 xorg@lists.freedesktop.org
Cc: Mark Filion <mark.filion@collabora.com>
Subject: Re: Reminder: Deadline to renew X.Org memberships for 2026 is March
 16.
Date: Sun, 08 Mar 2026 13:59:41 +0100
Message-ID: <5818436.IbC2pHGDlb@timur-hyperion>
In-Reply-To: <77e280436ec5b54973a11303dd0446e9f3ab2ba1.camel@collabora.com>
References: <0070f3dd-a521-40ee-b6e7-8b1f82e48b66@amd.com>
 <77e280436ec5b54973a11303dd0446e9f3ab2ba1.camel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Mon, 16 Mar 2026 14:37:01 +0000
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
X-Spamd-Result: default: False [0.99 / 15.00];
	DATE_IN_PAST(1.00)[193];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:events@lists.x.org,m:xorg-devel@lists.x.org,m:wayland-devel@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:mesa-dev@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:libre-soc-dev@lists.libre-soc.org,m:elections@x.org,m:members@x.org,m:xorg@lists.freedesktop.org,m:mark.filion@collabora.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.987];
	TAGGED_RCPT(0.00)[etnaviv];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,x.org:email,x.org:url]
X-Rspamd-Queue-Id: B05A629B816
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This seems to be not working. I am not getting the confirmation email (yes,=
 I=20
checked the spam folder and it isn't there either).

Is this a known issue?

Thanks,
Tim

On Wednesday, March 4, 2026 5:12:37=E2=80=AFPM Central European Standard Ti=
me Mark=20
=46ilion wrote:
> Hi everyone,
>=20
> Just a friendly reminder that the deadline to renew X.Org memberships
> for 2026 is March 16.
>=20
> Membership renewal ensures you maintain your voting rights in the
> upcoming foundation elections, but also helps strengthen the foundation
> by giving it more credibility.
>=20
> https://members.x.org/
>=20
> Thank you for your continued support of the X.Org Foundation.
>=20
> Best,
>=20
> Mark
>=20
> On Wed, 2026-02-04 at 16:22 -0500, Harry Wentland wrote:
> > Hi all,
> >=20
> > it's a new year and with that a new X.Org Board of Directors
> > election. Please take the time to log in to members.x.org
> > and renew your membership for the new period or sign up for
> > the first time.
> >=20
> > These board members' periods will end this year:
> > - Mark Filion
> > - Erik Faye-Lund
> > - Simon Ser
> > - Neal Gompa
> >=20
> > The election dates will be as follows:
> >     Nomination period Start: Mon February 9th
> >     Nomination period End: Mon March 9th
> >     Publication of Candidates & start of Candidate QA: Mon March 16th
> >     Deadline of X.Org membership application or renewal: Mon March
> > 16th
> >     Election Planned Start: Mon March 23rd
> >     Election Planned End: Mon April 13th
> >=20
> > If you have questions or encounter issues don't hesitate
> > to reach out the Elections Committee at elections@x.org.
> >=20
> > Best Regards,
> > Harry




