Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21C8B1A519
	for <lists+etnaviv@lfdr.de>; Mon,  4 Aug 2025 16:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B48610E370;
	Mon,  4 Aug 2025 14:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NX+XiBbJ";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BF110E224
 for <etnaviv@lists.freedesktop.org>; Mon,  4 Aug 2025 14:39:29 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-55b85413019so4607134e87.0
 for <etnaviv@lists.freedesktop.org>; Mon, 04 Aug 2025 07:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754318368; x=1754923168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UbeDCZN6QYW7UKsg38m3nWO1/3yHq8QFDAmiE/GLres=;
 b=NX+XiBbJohts0FAM4K7sq9CgWnUi6B1ZIApLEbzpfZLILCJjWM53pdJPDVG7uEWY7v
 mRbQNWI6m3f1+Y3TLyK4Fy0n9qzttwOrPl+tPmOc3rYiLFfBoqVWQbw++iWdkjsk9o/N
 BMJT5EAz7ZGkRDqujabLa43Gq1FUgaouOMYpc+E+PrVsLzLzA08TiaFd5o3bhANV+l2o
 FHVPX/22hMZalh6bjDzWwgXJ2bSjFDzSakBolwhZ2WgFdHiMGB+w8u+bnCVZ4I4+jOFn
 eaMqs0Ipdc64WjP6U5jWj8yTEn3hLMozB+myNVlWN/aw0Yjdu3FwieNYE0BMyT5iBAOR
 fF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754318368; x=1754923168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UbeDCZN6QYW7UKsg38m3nWO1/3yHq8QFDAmiE/GLres=;
 b=JVfjiTSIVVyoPEvZ8rKi1KhON3y3RlrAxCdxOaJvSZt6ryOdpKr11z+7mSau9tFbi7
 R67qDSOe5BM3NZQLLHyRpH4n5IvYgjfXMz55Fhk3MeK1t1RTuo/10CPN499OI23wMBdM
 rsSdMtlEvNqtGiBTjjHHSSe7skPNd4aMZNoNSfgzCR7RELQqYhUhWWERCOZfnKlqTsj3
 oDyWY09phPRs4qq2+kHKXti3SZSmeA4GsOU89dA7zZY8LSFV8Hc/wnuMJTt50On0Guy+
 h/GeU+HyO51rlNCxnLryprlV4wfLi/0TY2/6y8/A30DQEE1Le+uzHVB5ZbJwBC6nGkYq
 ldJw==
X-Gm-Message-State: AOJu0YzgYKlsN0/kf8V+xuqn/YoH28SXPnqyUiERmHnlNhav+qlkeG0w
 qemvHlMcxWZYUfwamJ/qhKyg9th8NHY7opp35BKRU7AZAfW0O47MKmMzmNd8yazwpqW8pbQYyQf
 bz0MrrTnswS+bCDca1YYWxoPB83v9Rdg=
X-Gm-Gg: ASbGnct5rVMhEMs1o2SduuPY71I5MTK+ydnMknLMHsYsMvH1bOVRYPbW+7frjx2D8px
 CcIgaJRfrMk9cvDZKOS1ObjI+PtzINiH98dbe8AiBCgkBUzfH0joF1bYlYfrJZaSXNMxUYCzpNo
 E310jprFLB5RRYOD+vLAigM5T3uWKfyRf3b67cQrrzQy24aS5xK8MtOYFNezUIcVGjsDKqwnk/d
 u8on0cOkxhs1Tu/wfOJMOzx6LFz3NDbn2HFOA==
X-Google-Smtp-Source: AGHT+IFCTK4yAnCIt1O3IH7IvKfOlK+bRmNFRhOS5+JbNzBWQFZv0JRtBhX05VPmpYe/hooX+PQEtoMHrk5UI7A5T1s=
X-Received: by 2002:a05:6512:3c9f:b0:55b:93c1:47dd with SMTP id
 2adb3069b0e04-55b97abd534mr3215527e87.10.1754318367501; Mon, 04 Aug 2025
 07:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <c4e6fa63-22af-4704-8cd8-60695c6a1d9b.6e2e464b-d864-4023-9e6f-7b1f7b7b3187.ecd3e5e5-68d5-465d-8973-f436b71c74fa@emailsignatures365.codetwo.com>
 <c4e6fa63-22af-4704-8cd8-60695c6a1d9b.a45007e2-be76-4ed0-b1ad-172f8b66e281.6ecc422e-3d59-4178-8377-cef24856beea@emailsignatures365.codetwo.com>
 <DBBPR03MB10462C52F7A92D60E5FC55515B723A@DBBPR03MB10462.eurprd03.prod.outlook.com>
In-Reply-To: <DBBPR03MB10462C52F7A92D60E5FC55515B723A@DBBPR03MB10462.eurprd03.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 4 Aug 2025 11:39:15 -0300
X-Gm-Features: Ac12FXykduY7C_1Q7RbQ12Elp56w6gQ8_dYQ5IURFvoxHgaFEOY7dMe5d4CWDhY
Message-ID: <CAOMZO5CvZoaj+nODZV0vfRK5ucOJ33bCtaZOgGSvciY-AJtGFA@mail.gmail.com>
Subject: Re: running etnaviv driver on i.mx6
To: Wagner Andre <andre.wagner@richard-wolf.com>
Cc: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
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

Hi Andre,

On Mon, Aug 4, 2025 at 8:11=E2=80=AFAM Wagner Andre
<andre.wagner@richard-wolf.com> wrote:
>
> Hello everyone,
>
> I try to run a run an (qt) app accelerated by the upstream etnaviv driver=
 on an i.MX6 DL based SBC, but I just cannot get it working...
>
> What I did so far:
>
> I patched the imx-drm back from NXP version (since its adapted to their c=
losed source galcore driver) to vanilla version, which should work with etn=
aviv. Dmesg shows also "Initialized etnaviv 1.3.0 20151214 for etnaviv on m=
inor 0" and "  Initialized imx-drm 1.0.0 20120507 for display-subsystem on =
minor 1". So I expect both kernel drivers to work.
> I installed a Ubuntu 22.04 with a slightly modified NXP Linux kernel in v=
ersion 5.15.148 and used from Ubuntu 22.04 mesa in version 23.2.1

It's better not to use the NXP kernel at all if you want to use Etnaviv.

Just use a mainline kernel from kernel.org with the
imx_v6_v7_defconfig, boot it, and the Etnaviv driver will be loaded by
default.

You can then try to run the 'kmscube' application to confirm that the
driver is functional.
