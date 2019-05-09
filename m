Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21DC18D3C
	for <lists+etnaviv@lfdr.de>; Thu,  9 May 2019 17:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578A589DDD;
	Thu,  9 May 2019 15:44:07 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE9A89DDD;
 Thu,  9 May 2019 15:44:06 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id o10so1686502vsp.12;
 Thu, 09 May 2019 08:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LfRZbgRPvkJWoFmh3/HoelgBx1WN/+Dn9OcsHK9UJYE=;
 b=p54bIVqjfQT/1kjw/naPpiqJbLiG9b0/ueNabg/IMz+micmcKynW6vE68KrAEy91KM
 bRKC8tgblCRQRDL+RLiClrgV9Ypidxzqbq4ADEfD2ATCupSyxCX++gvzmtgL5iXYBcrb
 VD87dqOSdbr91+4Eqc8hkOwfCdupaegJUbys/iWbrXeHCuKQOz9i5oeX009CWOvjXrcf
 J8XXfUepWE0065Vj3mr+rTH1NKWdxUqpKP3tZq/KgbslaFIj1xIDzNQU1deDjLjBTTEC
 IsnXTX7YzGYq80WJzJN/OiTNh1sga4mQimoV3C/3CeFObDOmHCUCnrnUc8xV8Fdxa8ev
 LW7A==
X-Gm-Message-State: APjAAAVypRqNkq0PvpHF70F+mBLuQtzMKNm2EmBNV5Uk3rkGJT1+0ekw
 cM0dZicw2/QDQMTtBmQf4TO036i01N0hNcXldrQ=
X-Google-Smtp-Source: APXvYqzzp4JmdcW+YTuFaL2u1EJDrEsTF5qOX2szNyLWLq7sb3DZGDwXtYClfyY328SR7lezy8/zMOQxbTiamWwmm1o=
X-Received: by 2002:a67:e408:: with SMTP id d8mr2531450vsf.85.1557416645325;
 Thu, 09 May 2019 08:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190503100524.23232-1-p.zabel@pengutronix.de>
 <CAH9NwWc4Dg8Q=rr-1ExhZ25bEJdGtTRExRsUhp9t_GdT08VNLQ@mail.gmail.com>
In-Reply-To: <CAH9NwWc4Dg8Q=rr-1ExhZ25bEJdGtTRExRsUhp9t_GdT08VNLQ@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 9 May 2019 16:43:01 +0100
Message-ID: <CACvgo50MEcfukP+YYAx4ep3XuoitKCusDVoKNWHr3xG3RsbK-A@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH] etnaviv: fill missing offset in
 etna_resource_get_handle
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 ML mesa-stable <mesa-stable@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LfRZbgRPvkJWoFmh3/HoelgBx1WN/+Dn9OcsHK9UJYE=;
 b=EaaIl+e+4nfpTe1Vc09U+8WUQzsM25f+EHC27yIp6IlEAGLGZdxyY3hxVrc2LBskGt
 hcyURGuApv3zes8m08J42YP/uoFOGSIj0JbueAYNLoLZeKjc1hEoTzwpwtfvcVfzAVEb
 z7bBs/b4qb+T+xevrIozZ90Fdy6EEUPlI627f0HojtCOh2FmMufoeCzt3x8ypNiadFob
 3kRuoDY8P5UsgkGQ9C6Wj0lPQGv/wF7mpOv6wR1fgmwsAhQAG2ulq0kpn0Qi5fkfNuTW
 pBEwUfZv0937FUAy4d/HxiV2Y7RJsDhygduFB5WFFmIe89wJjszqhotAyQ9fYh2g3jyQ
 QYDQ==
X-BeenThere: etnaviv@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <etnaviv.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/etnaviv>
List-Post: <mailto:etnaviv@lists.freedesktop.org>
List-Help: <mailto:etnaviv-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=subscribe>
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>, graphics@pengutronix.de,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gVGh1LCA5IE1heSAyMDE5IGF0IDE0OjUzLCBDaHJpc3RpYW4gR21laW5lcgo8Y2hyaXN0aWFu
LmdtZWluZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IEFtIEZyLiwgMy4gTWFpIDIwMTkgdW0gMTI6
MDUgVWhyIHNjaHJpZWIgUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT46Cj4g
Pgo+ID4gV2l0aG91dCB0aGlzIGdibV9ib19nZXRfb2Zmc2V0KCkgY2FuIHJldHVybiAwIHdoZXJl
IGl0IHNob3VsZG4ndC4KPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0
aWFuLmdtZWluZXJAZ21haWwuY29tPgo+Ck5pY2UgY2F0Y2guIFBsZWFzZSBpbmNsdWRlIHRoZSBz
dGFibGUgdGFnIHNvIHdlIGdldCB0aGlzIGluIHRoZSAxOS4wCmFuZCAxOS4xIHNlcmllcy4KClJl
dmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgpDYzog
PG1lc2Etc3RhYmxlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KCi1FbWlsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0
bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
