Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1273B1A9CF
	for <lists+etnaviv@lfdr.de>; Mon,  4 Aug 2025 21:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC7610E384;
	Mon,  4 Aug 2025 19:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P7xhTZ6K";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B3410E384
 for <etnaviv@lists.freedesktop.org>; Mon,  4 Aug 2025 19:50:55 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-33226bac198so29399551fa.2
 for <etnaviv@lists.freedesktop.org>; Mon, 04 Aug 2025 12:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754337054; x=1754941854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8r1JnbsPKPiSI6sUR7zenNWtQIz9gnBwelWZyAUKJWY=;
 b=P7xhTZ6K+LvcZwTxEYpEkDVnzra1euoftZ16gGj+FQL2G2kmB9BPmYPNTcyawKHQ40
 kB4GLye0vuDi3ciYTNSFX5eQffjhJNSsMUBLvntl8oUv2/87Qp8Z8KWbtpiK7V3j985T
 YkMgxlZkK2YrFB06bdtAr3/Ij2GIgxWrRcsjki9HzGQ1V3Zu+NBF2JzTTJNPxBOzpW+u
 c5htd7EwzbbioUnAMnO7NVVoUVq6+ZiqdqQvefIA2G7dzt4IevWJNuPvmMpm+JOvfi5F
 KSvMgNPxv8vcgxmP6H3z7G+yWmZjMQc0zYw8gZcDoe0zxneM+7hkIaV//nxpyq0bDKu5
 7BvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754337054; x=1754941854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8r1JnbsPKPiSI6sUR7zenNWtQIz9gnBwelWZyAUKJWY=;
 b=Yb8GBr9k78pLfxnys2qWB/y6I+2BMSYu1ikdvi8Ga5GfPyCpa8Xi4zB1lz3tLb9oHi
 ODJhzuRLZbKbYhRjO3niGeAvN/sLK/+K6hIOlQN9+oc5f0o6ItDxxY0KZG1WX5Ga20uJ
 pwVzfKF50EZKB3mXVkWm6OPPf1flWyEWgrswtBTRQbN7aUNfDMxiBF56n1ZiGsMklN+Y
 08R+Ii3IhZBXuLDhdUcsBQvu+PYzWO6uMbdIGyuR+Pyaxj6v/AnV2OvGGr0D+F3cfoiB
 GMmwWbfHpJFoWuuFhDlvLDat07XZkpbHBDNJTAMlrrOeKoS9nsUqdNZWdjoVmJBHo9WY
 3eIA==
X-Gm-Message-State: AOJu0YylzTPFVKumASJz4DL9I6EDDB/vHHuyqnT8+MJv7siCG0Zq8Xvf
 TnaRHFtEipeD6gb6DwPa2E3W36CuwWCxECcNie5GPY+jofnVuKl2wuo9jh5jAzJUSVHYvdYsMHz
 WWl0O4hoeEmdWtxiqdlMkrEKQk62x5Vg=
X-Gm-Gg: ASbGncv/cOoI/ICwNBeJMaB/SUIhBJSL8+pbyBQOdE6ZhpXjd4mzxvxJayZxOIADlIA
 jViKKr2vSw17zxxkDInMFmnhgv+b1coYfixWEifayoHvxi3iN0mZN60euzIbhbl/F+kHj3gs4Sr
 8kj71ftk0DEoYxAf1YiSdRy0NPjcYVUm2NrrpbTLbIDaRMhHiCSypvFMTYQk/Xe6V+rjc0ZJpUW
 Ctr1EoyvfmUNYhFWdNuatYI23+cNgrBJx8VciBX5r4fKoj++3cAajMMZMeF
X-Google-Smtp-Source: AGHT+IFiLpOBRNDhCms2KZudTnazNFTkozqGz7G2kpg0LjkJIUCZ48gvpMeGyPkhuX77p9kyK95b7JFSpFHJcUgcW6w=
X-Received: by 2002:a2e:b750:0:b0:30b:b956:53c2 with SMTP id
 38308e7fff4ca-33256705f62mr21252211fa.11.1754337053660; Mon, 04 Aug 2025
 12:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <c4e6fa63-22af-4704-8cd8-60695c6a1d9b.6e2e464b-d864-4023-9e6f-7b1f7b7b3187.ecd3e5e5-68d5-465d-8973-f436b71c74fa@emailsignatures365.codetwo.com>
 <c4e6fa63-22af-4704-8cd8-60695c6a1d9b.a45007e2-be76-4ed0-b1ad-172f8b66e281.6ecc422e-3d59-4178-8377-cef24856beea@emailsignatures365.codetwo.com>
 <DBBPR03MB10462C52F7A92D60E5FC55515B723A@DBBPR03MB10462.eurprd03.prod.outlook.com>
 <CAOMZO5CvZoaj+nODZV0vfRK5ucOJ33bCtaZOgGSvciY-AJtGFA@mail.gmail.com>
 <DBBPR03MB1046232B226FA8719CAAFAEE5B723A@DBBPR03MB10462.eurprd03.prod.outlook.com>
In-Reply-To: <DBBPR03MB1046232B226FA8719CAAFAEE5B723A@DBBPR03MB10462.eurprd03.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 4 Aug 2025 16:50:41 -0300
X-Gm-Features: Ac12FXx20kwWG9hBpxkiQxFU6G0i-pxkVjbIpK2bDgX43n7-Wr-pxeFh8CnrMaY
Message-ID: <CAOMZO5AgBWRvPLi-ZvGsD0nGLMD+bO9fDbymjOpfwcU0-x5YRQ@mail.gmail.com>
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

On Mon, Aug 4, 2025 at 12:39=E2=80=AFPM Wagner Andre
<andre.wagner@richard-wolf.com> wrote:
>
> Hi Fabio,
>
> thanks for your fast answer!
> A few hours ago, i just found an old article of you where you  described =
howto do it ;):
>
> https://imxdev.gitlab.io/tutorial/Running_kmscube_with_Etnaviv_on_mx6sabr=
esd_board/
>
> I try to do the setup you described there, but i still got no plan how to=
 port the devicetree i got for my board from the NXP kernel variant to the =
mainline, without causing a bunch of new problems.

The display subsystem representation in the devicetree is different
between the mainline kernel and the NXP kernel.

Try getting the i.MX6 display interface to work with the mainline kernel fi=
rst.

There are many i.MX6-based boards are supported by the mainline
kernel, which you can use as a reference for adapting your devicetree.
