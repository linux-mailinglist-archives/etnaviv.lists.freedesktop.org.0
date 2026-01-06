Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DE7CF9274
	for <lists+etnaviv@lfdr.de>; Tue, 06 Jan 2026 16:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EABE10E512;
	Tue,  6 Jan 2026 15:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Np9ZRZdd";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D1F10E512
 for <etnaviv@lists.freedesktop.org>; Tue,  6 Jan 2026 15:48:28 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-34c3259da34so1074654a91.2
 for <etnaviv@lists.freedesktop.org>; Tue, 06 Jan 2026 07:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767714508; x=1768319308; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDeWwtGZZ/R+RJWyYvHftoXDDl+9pCPFMRNPnjt8G1g=;
 b=Np9ZRZddjWyMrQQ2/T8243/3HEE2wxTSTlR26c9PxQZycctgQRJ6sF8FzDFxMnyyM6
 LeAdAQJ4wS4rHlFlBcIqkTZNya5wLDpetf+jFYXL4vUv+JK082kCtnP0g/RSovzFYRFX
 VbnMDPqtcwJRXw8EO8gbeLIZYGZtze18zvcWrMzf5mEzA1WWG75ywg+golCEK+Ts+2wG
 uWh3L5ONcgn98pwMABZPu17nbuwYed1F5+ar59WoKOPvHTlsli1PPmMCkts2c5NPATOq
 mTickHwjTHTbHYICF5M1XF2+UiW3SXWVuRT29CnyZxIPULLZqdSVJMJ0jeshJm0LfP9F
 eoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767714508; x=1768319308;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDeWwtGZZ/R+RJWyYvHftoXDDl+9pCPFMRNPnjt8G1g=;
 b=qB7NCmRnwzBhLJqd4BTU+WYt3E11zIotmpL9DRHVOEN9x2ODFMEQeDvOgDoIeyv8Lu
 gd7C24W44bj7n9/qOpCNqx6FIMnyVQUdwcWM/+qfHWKpEodMNC303xhd99XT7bt798xD
 7wnVuzI/LB3mdSe2v4QRHQtygCwr5BwSEwZeOu+O3R2kby9TuSTpsM7uPVjB8mt21ZDk
 GmTF5D2si8sDstudcvK6IypsBV+wFT9fvJR/SBLBRmRg0mQ0LL5x64Bf6HVbr/h/0zKf
 cxC9zt6KtZhc6npjfkbjQQ0kEDZDg72Yh2Xi5YFK1IU8iOhVLiT4zPdL1n1LJs76QwhD
 /VZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBdw41+q6zOlR79iH8BaFy8VzU00dpoFQjU3F2nD168rzVQdAY00fDC/hCc8BOAspP0gxoSxFQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxovDq3cui1JeKghJzGfkGYPGP6K0PRg2X2ObIpH3fFKun2tNH3
 63GyRWH3uZpqXwVsxvKGklEvHV7ilrpo4lm4GDqqy2GRmXfbvgUH61AecL/18KLv22E/9DezdER
 DnkLrvWDfb7vgfYUJMshVMbc155cSWP8=
X-Gm-Gg: AY/fxX4cK8ZcJEHHJ3tRTMJSepxOlsNIz5ECEZGiNZnXhEfnoUANMwLs/d2uEH/3DXJ
 a703AjyuhmGeJ58Ox64vI+1P1hR7R/R0GK9iGKmBnADNlqbW6MX8++UqxawNaFL2iGCtSKkqz9r
 XQ9nET30n4U/zwpIkiK2eJQn1FpoerTxtNdPBlm0J4wbKOgG7DiaE6YBHsKtJc/kxjzL7hmz+3G
 uxtx2yECjuVNT4C5b9w6ilZkrQPf0RHjmDlxzGmphvWjDuQRK5693nOXzTMtxVNT+tPXeAT
X-Google-Smtp-Source: AGHT+IHiaPPGyj/cnpDj8m4HDXquR3Pl7oUuHN0aY5yL41pxEhlepn4C73GOB3o+YxsZXbMciPqziYoixcHsf8WCV5s=
X-Received: by 2002:a17:90b:3e87:b0:34c:ed28:a279 with SMTP id
 98e67ed59e1d1-34f5f291108mr2735224a91.11.1767714508280; Tue, 06 Jan 2026
 07:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251119164624.9297-1-gert.wollny@collabora.com>
 <b307fa5c-ccce-4f4b-bc38-a69c6b9d6095@mailbox.org>
In-Reply-To: <b307fa5c-ccce-4f4b-bc38-a69c6b9d6095@mailbox.org>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 6 Jan 2026 16:48:16 +0100
X-Gm-Features: AQt7F2pXEHeKvFj3Y75tqV0CU6vcwn_KI1rYKFkw609zpE7T3WzeoCdHLYofjGY
Message-ID: <CAH9NwWfZ7VU=2A5oVbN_Qakd3aHmK0kdPyC9PpOZhVCY5DCdJA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] drm/etnaviv: Add support for running a PPU flop
 reset
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: gert.wollny@collabora.com, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel <kernel@dh-electronics.com>
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

>
> On 11/19/25 5:45 PM, gert.wollny@collabora.com wrote:
>
> Hello Gert,
>
> > this is the fifth version of the series to add PPU flop reset.
> >
> > Changes w.r.t. the previous version are:
> >
> >    * Apply all changes suggested by Christian Gmeiner:
> >     - fix a memory leak that would occure when PPU data
> >       initialization fails
> >     - remove unneeded includes
> >     - move includes to the files where they are actuall needed
> >     - fix include style for "linux" headers
> >     - fix typo in error message
> >
> >    * add Reviewed-by tags to the according commits
> For the whole series:
>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org> # STM32MP255C DHCOS DHSBC
>
> Thank you !

Applied to drm-misc-next.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
