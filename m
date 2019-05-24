Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773EE296A9
	for <lists+etnaviv@lfdr.de>; Fri, 24 May 2019 13:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2361F89E0E;
	Fri, 24 May 2019 11:10:36 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDA189E0E;
 Fri, 24 May 2019 11:10:35 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e13so8263884ljl.11;
 Fri, 24 May 2019 04:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/o548Qv+NOv5yJk8HAV1ChEzjjWFVPtRDB7If3OJPUg=;
 b=gp1XRJoGuYfTra2Mb3TuEazgLNbgeUVc9Ye90jSBdIcRXaa6NY60cCxkTak7bsfkkK
 YubINIukgFb9mZwi4uDJscS3cHrZMiNjSkP+HKvjh1Va7PBePLOf2Rqap2o3ogBE50yg
 KFkK76clEryxcdoi19TjG9mV2/m9byNB74t5wGY6P0z8OICCuPKFWUHCR61+ZoBrnVCd
 UvS5mAOsP/SWLcBNVYBkMjlnBkZ6ZehQffMQntGFQJHCUCc5MHAggT7Yec83GXWUMFdY
 6j525enG7gwVU3oyoOk5u3JMSCqie7f47uk46DWpoeMSoO79kSYiP7zTMJ5gyNbtm2+1
 tJZQ==
X-Gm-Message-State: APjAAAWfgEO4ZlAASyzqxd9UjNRGR0840U5J4ojQItZvcKfCF59Mfrix
 f9eNnaUMLMFtO3/HT1aFyyhbWLDp0GEiMTaSrZlm8iI3
X-Google-Smtp-Source: APXvYqzJI6QDmpfjmFTRlG7dUxl2AKkxU+n6QHbHsJyvqsQmeTDFXj/zfJbfLla5zI4yK8sRa6b/Ky5MR3Bodyyv6r0=
X-Received: by 2002:a2e:818b:: with SMTP id e11mr52186264ljg.82.1558696233455; 
 Fri, 24 May 2019 04:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190524104520.5706-1-christian.gmeiner@gmail.com>
 <20190524104520.5706-2-christian.gmeiner@gmail.com>
In-Reply-To: <20190524104520.5706-2-christian.gmeiner@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 24 May 2019 08:10:34 -0300
Message-ID: <CAOMZO5AHuAFyej62wApPZ+iJ09UhpncWExFBHqONfOJk90DsKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] etnaviv: blt: s/TRUE/true && s/FALSE/false
To: Christian Gmeiner <christian.gmeiner@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/o548Qv+NOv5yJk8HAV1ChEzjjWFVPtRDB7If3OJPUg=;
 b=QT0koUlvCHEaboBFaiSHyTCJbtbfZCKuzOFHN4qrMRAr1Qld4amo64cWuNF0obGetu
 +C9ruU6f4CHkXe53zGdPQC01fJC5JzJ59K9VVzoKFWXsnu0i7TbzesyCy3Lw5jT3Ocdq
 G71ygD1+gWoZoW136HWEOp55z+LzfFuhcBDVgdmLcQOzQrXfSP/x5ph0ENquJtTB5KsT
 eXZ/O+0MaTrJRzDRErn9yJwoN3xVpfyLn7N9UEajJGkpo79KbMFJIJk4K1H/WQCWFHrn
 FCiaP2Jkj0zAwizYcQX+aQumsUwvVkTpZ/PZhJvE8piPji/HelmXI1/sElYB1nz5kJox
 GrQA==
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKT24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgNzo1MiBBTSBDaHJpc3RpYW4g
R21laW5lcgo8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+CgpN
YXliZSB5b3UgY291bGQgcmVtb3ZlIHRoZSAnJiYgcy9GQUxTRS9mYWxzZScgZnJvbSB0aGUgU3Vi
amVjdCBzaW5jZQp5b3UgYXJlIG9ubHkgcmVwbGFjaW5nIHRoZSBUUlVFIG9jY3VycmVuY2VzIGlu
IHRoaXMgcGF0Y2guCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
