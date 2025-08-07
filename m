Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C22B1D431
	for <lists+etnaviv@lfdr.de>; Thu,  7 Aug 2025 10:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFBB10E0A4;
	Thu,  7 Aug 2025 08:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RMDjB81C";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378E310E0A4
 for <etnaviv@lists.freedesktop.org>; Thu,  7 Aug 2025 08:18:04 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-32117db952aso707369a91.0
 for <etnaviv@lists.freedesktop.org>; Thu, 07 Aug 2025 01:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754554684; x=1755159484; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dw8ug+LMzmBVHLzIqovkEJblmn/DZTHqcZfHClcLJAw=;
 b=RMDjB81C/DqDA/y2pr60rzGLfP8YX7x1s0O6YrvgA900cj8064qhHCxJPHLUKmljJu
 cBdMp3E3/8kesb5LiA0MGFFyATQN9xd3l/hhSfLWH7Uhe8xNA7HFrw0BixPcoCeMc6iU
 YOfkKg9/q6wloaf97tPZrScx5oEr9AC/cZVWhvBHn3pQfDpEJyc9qGvdh801mUAlDlM6
 IBVtSgRdIFITl1IBbCYeeumvZYC3tn8s0YDrrCIaxVZx5eacBpTtoEK/tYBZP3QQ3X6M
 uyLlG/Pi5vOEts/DK7upErif7WqbSZ8NDY4HvVuVQWpYOhgyADaT8qAJWxIuHFXExlq5
 m9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754554684; x=1755159484;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dw8ug+LMzmBVHLzIqovkEJblmn/DZTHqcZfHClcLJAw=;
 b=o9Ze2mof9ku6TBHhx+ErTVzDmUMOXNmLZnG66+eZuhJ3H4h0dy+B7ZV0oXPKcLDcpc
 GZ7AUlPb3xbS3/LoHSZzxAA9olo1pbTRc4yiRy50Rev1udb0PiZdF1yKsrHAaPgGEIZg
 bC9XMGGe/1aZXSqAlGvYj2SuVUpQQtvik6MCW/qJAn+CwOGnoNTF5mRwuCmhohdC8D0y
 h7Bd/naSx6/sg06udz0VE1E3qaMoeQztcsnEx+BpIeaAqhFblrrTJAWY03zx8UPljNvh
 uBqiJ22SUJXWzL3jQEUEzdlua4InNdbKydGDpDg6M9yiGq0kkl8e1womr6McbahKABVb
 Jt7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGKHq79mkwLISs4JInpekSck24nhpKOdjRwsp9UaW77vfQqxJGVrn4VS5l10l/hKxp2xL+cr+e@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW6MbReNBY9FZqKlGDZBthiCm7HozLsounn5ycUCm35lcaWNAJ
 HJ0eIM8TrBA/oGnkqV4eMBGjQUJHItPVXv3IdbT8tFFGBZpdaPDR7I1s1xZI8RDs719OnFUGzsz
 KM7Gn2mOWVaP+XLv380uRQaAGBotU1cg=
X-Gm-Gg: ASbGncsXB1ATASMnYjpJzKMYSTDlEaYQhxf01UIBkwQCQsAhe9fLwjSzAo97t+z6gQ2
 FnpAmWBm+K9OVf6k0nQ6Nzr+iQVJNgPoAHsY/FtfOzxnjoQwuoMlva71dxs3ilJeTlx7vTKKg7U
 hFUxb8svFJGZ+HXlVMzy6vqMMLYAtXe/qTKfcQuk5A+zDqnnShgX5jGy0uvRUFjd8CCwK0uRrkd
 4xx7ujU1SfNVOy9
X-Google-Smtp-Source: AGHT+IFlZTSr1n/OIGX+/EDCiS0sp4ARQm2CiN5P905L8+/uP6dzPOMKNCSpXynlOVBCJUKyM/vCd8aa0R7m2VSmZEs=
X-Received: by 2002:a17:90b:4a0e:b0:31f:30a6:56ff with SMTP id
 98e67ed59e1d1-32166ca78d0mr8320888a91.19.1754554683498; Thu, 07 Aug 2025
 01:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <c4e6fa63-22af-4704-8cd8-60695c6a1d9b.6e2e464b-d864-4023-9e6f-7b1f7b7b3187.ecd3e5e5-68d5-465d-8973-f436b71c74fa@emailsignatures365.codetwo.com>
 <c4e6fa63-22af-4704-8cd8-60695c6a1d9b.a45007e2-be76-4ed0-b1ad-172f8b66e281.6ecc422e-3d59-4178-8377-cef24856beea@emailsignatures365.codetwo.com>
 <DBBPR03MB10462C52F7A92D60E5FC55515B723A@DBBPR03MB10462.eurprd03.prod.outlook.com>
 <CAOMZO5CvZoaj+nODZV0vfRK5ucOJ33bCtaZOgGSvciY-AJtGFA@mail.gmail.com>
 <DBBPR03MB1046232B226FA8719CAAFAEE5B723A@DBBPR03MB10462.eurprd03.prod.outlook.com>
 <CAOMZO5AgBWRvPLi-ZvGsD0nGLMD+bO9fDbymjOpfwcU0-x5YRQ@mail.gmail.com>
 <DBBPR03MB10462D0932F2045396A2A5E97B72DA@DBBPR03MB10462.eurprd03.prod.outlook.com>
 <CAFXsbZobSt-2wZVLMJKksrpw-PUsibZei_YYOgBOs=hkqHtURQ@mail.gmail.com>
 <DBBPR03MB104620073A4893427E36E6BE6B72CA@DBBPR03MB10462.eurprd03.prod.outlook.com>
In-Reply-To: <DBBPR03MB104620073A4893427E36E6BE6B72CA@DBBPR03MB10462.eurprd03.prod.outlook.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 7 Aug 2025 10:17:51 +0200
X-Gm-Features: Ac12FXyAhB7B9Fa5oHEdn3RWpOq0MRnyNUF9md2FV5q0nAtLikFNOuWe-2giEtA
Message-ID: <CAH9NwWe_hYBsOBjnSdAdSw+E4WwL545qWYc11Da4fQ1FEQiLaQ@mail.gmail.com>
Subject: Re: running etnaviv driver on i.mx6
To: Wagner Andre <andre.wagner@richard-wolf.com>
Cc: Chris Healy <cphealy@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
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

Hi

>
> What do you think, which option is best? What problems are likely if not switching to a later mesa version than 23.2.1? Is the there a coupling between mesa versions and linux kernel (etnaviv driver) versions?
>

mesa provides an implementation of well defined APIs (OpenGL,
OpenGLES, ..) and there are no problems with only updating mesa. I use
this combination on a daily basis during mesa development.
The kernel driver introduces new features in a way that remains
compatible with older mesa versions.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
