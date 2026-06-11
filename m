Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Y4eFR+cKmo6tgMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 11 Jun 2026 13:29:35 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA33967152D
	for <lists+etnaviv@lfdr.de>; Thu, 11 Jun 2026 13:29:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SkeFMjMu;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFD310EE94;
	Thu, 11 Jun 2026 11:29:32 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC1A10EE94
 for <etnaviv@lists.freedesktop.org>; Thu, 11 Jun 2026 11:29:30 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2bf125989f2so59071865ad.3
 for <etnaviv@lists.freedesktop.org>; Thu, 11 Jun 2026 04:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781177370; cv=none;
 d=google.com; s=arc-20240605;
 b=XsW0ldE+GXG3B0bkAuwEVUlNxZA5NUZMeWN8tbrOdtFLY8hdiL1vd0kwUSPje1up01
 glv/aEGkUL7633yqZQZ5GdVN+6fGw6qfQFaF34erm+BMgwrfOWcm7mR+0Wj5Qh1ePwHi
 nWgB+Mp6rAic8xTNm7XlXWf/ZNkMf9k4njOUfcV+D6uVME8HjuPkd0ZILpvWYCjBoGLM
 90708kxuX0ByrOeXhkZRiogWvu6d03RZ87W7nZmO79kde/2RZb47JOBUT0OdCZf7juYI
 1P8x85dOeRO5cidwMXbI6UZarblvKfEE85pItOgB+s2lo4NQV148MDc8BZ+lakmxfBmy
 a+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jg92tmAO+k66o2B5Of/8Nf2qLZy8ghLQqXh25wAN8Mg=;
 fh=3sR+htzj5JU8tYSY94qAg0LoapgLJYUhYEUesL6hgRY=;
 b=IDRa17SaoRXk6vj4+DTDzqZb1v7vC1xw2POaNGQUVN+3Ojx6IoBQHh/s04vml7kwza
 G03rplXXejoOC1BmpiNYb4Qc/M0Riw/dSRlbnRx9VzTtLmTh0gEbpaqt+u/A5EkblVEe
 coAt/mxpHkADsXB2VuHM8KZWclTEAWVZZXJlJS1NqbWq8ueW+/D/LAVTUgEPYOPICwjb
 0jAZb3z3MR4jQkFofpR3mbxeSkBtMvBliignjlp48NCX68Rc351myVyrKV+M4hLW9fAm
 YWT7+FyFSGmp7JPpVX/HcC9R6SKLjgcyme8aaaN3rl1aK4Z0u/zPostwHm5WWj5IpiCq
 SB1A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781177370; x=1781782170; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jg92tmAO+k66o2B5Of/8Nf2qLZy8ghLQqXh25wAN8Mg=;
 b=SkeFMjMuU/mKg/3Q90wIRfZDkRl6qkC5b10ojvr5n/HfO4W1RBY6WpRN8iAkTm6Ixc
 J257l37b57I/L+eJT977Q5PDSxDaK0g6ci7Kizegn/0ryWlAkmeGpnZZcOhWkjNIEVAf
 eOOf1ZZEyuvgOkbVRojCynycc8hrXGG2wtmcCR3WgqQngpT0l7hERbMDD3cnsJ7W8WYF
 AvMGe6FPzDpjHPMuiydi4pnqfvTBvZDZYL2FChh54HehaoXMypd8zSk+ZB3m9+Q1Pame
 44gHIGLPWKisFGdsRAZx9+X51XCrTLN6B2e8PlpzwEHEI7bcnQAWBENLP6hjoR1ZtrVu
 3oOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781177370; x=1781782170;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jg92tmAO+k66o2B5Of/8Nf2qLZy8ghLQqXh25wAN8Mg=;
 b=SjgKQeRt5L7jZHkUNTbypudQ7iLsy3Z1qAhkqkAKk+OrG+EvGkei7NeqlntI5sy13x
 o7lZsnBvisjWnNlPIt6zLQl66lejOJ9sj+ynl7kgYIAkDYKAm8KTsZyRNvaoNgZG4jb5
 LZvjnRjSiJR9WQi82NQTCCYx0R+GK/RkjTOEq4WhwA/RbNPzB9WS+jrmD5NLsXy04FVX
 spOidwrC8uP1D8/Z5Q7ta2RN63e15EAjZl3QvVSIrvNaRtgR7yaC56NqTxmH173geiSf
 1vTKwFBdh1GJrEr5iiY3sORv79F2oU5F8OsPfH8OGIyrM8w8rQ/sPo96kiCQtA5t0rto
 xK0w==
X-Gm-Message-State: AOJu0Yxg0es+izKuBZ+3diMvQoB/IUn5CAGolORqNKszEo1RgIPTm1R5
 jEUUclhRfeOAYKXekVx33EG3n09CPdZma4VuIsXiQZvnBdce7auVr2iptuw6MZuvhB7abhwEcAw
 mseVk8jjZQd+CFjC6qtP47Uxg17Ldwrs=
X-Gm-Gg: Acq92OGxe5BompcQkOWTGxxOh8DeHtUfyF0jWERUQAhpzNQCjk1c1kaOTo8AzyuB2hL
 yF14CjhYn7UOCWhtJ6l9l3uLHcG6/zP64rLphF6kly5UdKrgNc2HN/hP7w6RleCld5EQc+76lPY
 ABZRV25Vo9Zq/h7RGoSx4ga5SvZLO8YsqIJ+o2WP8m3x4DSk6dHBp8t8Nph10gWKQTTs+r6b9hh
 soip7YQ+yUenTNMqGSQV5t/kIoxj3Gaz/+RAIBCRyVXz+iU+UDLwz/OI+AV9aJP6TCiFiU97ASg
 DUFjGZ3q6YK490K7LnhCr0OLHBEAXfzx/3yVPJLoAzNOXDl/
X-Received: by 2002:a17:902:e744:b0:2bf:195d:21d2 with SMTP id
 d9443c01a7336-2c2f0c1b5b4mr27995025ad.16.1781177370098; Thu, 11 Jun 2026
 04:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260511085148.652256-1-l.stach@pengutronix.de>
In-Reply-To: <20260511085148.652256-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 11 Jun 2026 13:29:18 +0200
X-Gm-Features: AVVi8CfXfPcPU-CTPeK8vvYAg_xZHsziIqIT6JmDi8jRSfhyqrhMYiFsNLWMSuo
Message-ID: <CAH9NwWdZEzosaWGBWtb9QOCwr=mCsJKmLxCXe1dq0qZ98GgfWg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/etnaviv: check all modules for idle after reset
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:l.stach@pengutronix.de,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[etnaviv];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA33967152D

>
> While the FE is an important part of the GPU, which needs to be idle
> after reset, all other modules should be idle after a proper reset.
> Check all present modules for being idle to determine wether the
> reset was successful.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index a891d4f1f843..34fff36af450 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -585,9 +585,9 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
>                 /* read idle register. */
>                 idle = gpu_read(gpu, VIVS_HI_IDLE_STATE);
>
> -               /* try resetting again if FE is not idle */
> -               if ((idle & VIVS_HI_IDLE_STATE_FE) == 0) {
> -                       dev_dbg(gpu->dev, "FE is not idle\n");
> +               /* try resetting again if any module is not idle */
> +               if ((idle & gpu->idle_mask) != gpu->idle_mask) {
> +                       dev_dbg(gpu->dev, "GPU modules not idle\n");
>                         continue;
>                 }
>
> --
> 2.47.3
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
