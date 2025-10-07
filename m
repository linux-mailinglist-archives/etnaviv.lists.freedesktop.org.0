Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C53BC25B3
	for <lists+etnaviv@lfdr.de>; Tue, 07 Oct 2025 20:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF12810E0CB;
	Tue,  7 Oct 2025 18:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iq/mehXx";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E3B10E0CB
 for <etnaviv@lists.freedesktop.org>; Tue,  7 Oct 2025 18:17:55 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-339d7c4039aso3267466a91.0
 for <etnaviv@lists.freedesktop.org>; Tue, 07 Oct 2025 11:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759861075; x=1760465875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmDp/Aw0E3OwLSYGEwRzk/6v8UuJLn0IryDDeRAiGVA=;
 b=Iq/mehXxC8yS7+1/S8a1AYsQrqaPa7X14OHV+aXRAbe4Wq4xOd9WkJaLRnjgOzL6z7
 CNgoMcMoixj5VX4ZQtJWEBRrXs6lagK6C3i5+49Yt7MX8oWc9pFYjTQqBTkqCP4dVc9h
 tq0DP1xmrzFp5NWLDFU5avg6fhlqzRAOcsIAmEOEJElgMySVZ4nPrA1aB4q8122c9vGM
 6/7HZXuOLo0WSspUK2k6K4pD56cs30N0pnu4homOD8IOitw94vV86Ral9+qIZdj6aBSF
 AzI6XpzXPrbt50atUDQjiGmpxBgLWsWnqDkRMbXQe3Vr1r0TaWOMAEFrOdfBD2gikyG7
 zEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759861075; x=1760465875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmDp/Aw0E3OwLSYGEwRzk/6v8UuJLn0IryDDeRAiGVA=;
 b=dRwqcFZQTQgTTX+a1YGHzdVjgfqMyRCsK/9xMyas/U6tstK9LT6gksNCQGbraHtV+n
 ++KkUvKzJCpJRji9ZKghRaLC4S4yqVTcM1Or6+mv2eAj+eldXfk9ps8ezngOcoylCFvw
 iBAqO698YtlhuBz5kRr3cvcGUnkgHrOEtpwxGyy+HQ9yXEucS7TPnPL1nUcVduMnOi2h
 RP5EdBgw8zStWkk5uO9UyU5Jg/lGB/9dnjZvt1m7JkoFKvzWx7dphbZfalrJ4o/aMif7
 Z6xbrNS+OgwDFLc6uZ2HSZueVQlZAhbzuqdEJ3EBQICP/r7y/PlrL4rPXXbSa3fPVAsC
 zT1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfZPVN6nfkbMPbv+qP0Q/iPCLKPFgUBTNGKs/ezUytMgHjKHdx2JsWNzjjlU2tU9VEVyLupFsL@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9BTyAsmlaPCxL1naV2IdB3CFhgj/Ex8NjVEqX14ud1tu6RyxY
 yc83GLrXQfWYOoW4DhLEFXgBCaDbGCL8euq/fdvb/WGaDjWrUW2LsOk7Bp1uXujNGYQp05oVNYs
 WD3u2YKV3ptBWL+yhDmwf0V7Q95so1U0=
X-Gm-Gg: ASbGnctN3LuTwujoKbXWoBbHcz8HhCPnH64EpRB4aRI1A1Ae9f/ZNSppXne+F0iFsgz
 siu/WlvyyrKTogRZA4Wl8GD4IpndA7wUIDP0UIrRytc1xwO0F1mHEo6C9i9QJ9jomFN+jC2sRMh
 HBD11AaLerIul89njspUvk3o9VgRG5tzSoAKwTw0FwPvmz1A4jVr93+ODZ0s9MZYkU0Us3bXPnE
 Goq9cc43qD+HuLycOGJeokWyIp7Ms4wNOyfG3sZ
X-Google-Smtp-Source: AGHT+IFuxv15TQp35T9epR6PXiltCvwCB6Y+fLqcLYQeG3+ctehpv/UDyoC9tZc63RwiFLt47wKXYWrMnRX2P1k+bHM=
X-Received: by 2002:a17:90b:33c1:b0:32e:dd8c:dd18 with SMTP id
 98e67ed59e1d1-33b51386478mr616394a91.17.1759861075293; Tue, 07 Oct 2025
 11:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251006203008.986223-2-rs@ti.com>
 <5f015856-4458-4731-b660-627f3f6aed13@ti.com>
 <DDC7FYCGRF9A.3T68CVC1OAEBK@ti.com>
In-Reply-To: <DDC7FYCGRF9A.3T68CVC1OAEBK@ti.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 7 Oct 2025 20:17:43 +0200
X-Gm-Features: AS18NWB675UiTiQ8gHEBiMRWM7vbEUMEtANClf0NOUrWCQnk_KJ49XqvBzsqRCA
Message-ID: <CAH9NwWeku_WfK0XbEJKyZoVKuybGs__gGEdBiSiXqkT+O8kjKw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: force flush on power register ops
To: Randolph Sapp <rs@ti.com>
Cc: "Kumar, Udit" <u-kumar1@ti.com>, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, 
 etnaviv@lists.freedesktop.org, detheridge@ti.com
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

Hi

Am Di., 7. Okt. 2025 um 17:45 Uhr schrieb Randolph Sapp <rs@ti.com>:
>
> On Mon Oct 6, 2025 at 9:05 PM CDT, Udit Kumar wrote:
> >
> > On 10/7/2025 2:00 AM, rs@ti.com wrote:
> >> From: Randolph Sapp <rs@ti.com>
> >>
> >> Force a cache flush on power register operations during etnaviv_hw_res=
et
> >> with two readbacks. I'm not sure if there are any other calls in this
> >> reset sequence that are susceptible, but without these read ops we see
> >
> > "I'm not sure" could be avoided in commit message
> >
> >> occasional failures with etnaviv_hw_reset during boot and after multip=
le
> >> probe/unprobe calls on the am57xx-evm.
> >>
> >> Signed-off-by: Randolph Sapp <rs@ti.com>
> >> ---
> >>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_gpu.c
> >> index cf0d9049bcf1..320be7f66d74 100644
> >> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >> @@ -544,12 +544,14 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *=
gpu)
> >>
> >>              /* disable clock gating */
> >>              gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
> >> +            gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
> >
> > what about updating gpu_write_power function itself.
> >
> > something like
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> > b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h index 31322195b9e4..d273d9f2a1b=
1
> > 100644 --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h +++
> > b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h @@ -194,6 +194,7 @@ static
> > inline u32 gpu_fix_power_address(struct etnaviv_gpu *gpu, u32 reg)
> > static inline void gpu_write_power(struct etnaviv_gpu *gpu, u32 reg, u3=
2
> > data) { writel(data, gpu->mmio + gpu_fix_power_address(gpu, reg)); +
> > readl(gpu->mmio + gpu_fix_power_address(gpu, reg)); }
> >
> > this will take care of all other calls too.
>
> I was hoping the maintainer would suggest such comment. I see that as a 5=
0/50.
> Benefits most cases but then someone could complain about a handful of ba=
ck to
> back operations not needing to be flushed immediately. Prime real estate =
for
> opinions.
>

You sent your email less than 24 hours ago - please give the
maintainer and developers
some time to respond.

I had a quick look at the galcore kernel driver but didn=E2=80=99t find
anything resembling your
workaround. I=E2=80=99m wondering:
a) why we haven=E2=80=99t encountered this issue on other platforms, and
b) what the underlying problem is that you=E2=80=99re trying to address.

Do you observe the same issue when using the binary blob driver stack
on your SoC?

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
