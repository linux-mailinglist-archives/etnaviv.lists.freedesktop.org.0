Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BE9342F26
	for <lists+etnaviv@lfdr.de>; Sat, 20 Mar 2021 20:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F406E0D0;
	Sat, 20 Mar 2021 19:11:20 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C586E0AD
 for <etnaviv@lists.freedesktop.org>; Sat, 20 Mar 2021 19:11:18 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id n8so8597133oie.10
 for <etnaviv@lists.freedesktop.org>; Sat, 20 Mar 2021 12:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qBgmrVULpez7UO3BJU9FJWKaArChzRp0hxsw7bxfXc4=;
 b=NGt5U8aOeAjKCDjg+KQ1yXjaZu3O2diMK7Ow3+klyk21mCKUVbd3uEimbucuM/kj+O
 ro+nkhFvbRRYxofpvZuqHSsnbU7G8jKuQlIdhbO2ffsEdw95jNKT++H8dDcvpnU7xOUK
 OqzRc4/rY9vI1XioYjsuW3NilyLqejfRDJ2rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qBgmrVULpez7UO3BJU9FJWKaArChzRp0hxsw7bxfXc4=;
 b=ho4u2iixCdnRhEvBFwk6SrFchq0oo08gnxO5J7zIV/uhir+y9vPb4W7uvm3NBu/I7M
 rMx8V0MwIdY8BMGBD5jg7OzJi+gvMGgW5az9JxrmcjMbYXNue2Rxq96GwaeUdaIc9EkX
 fV3aZ91bsucoxfWUxcrII0njNxdMo8hyJLe1oqpN9FCiw1VoYt/pifzzm5CxtOG4jx6p
 F4OxhjG09szx2kTE4g3iqizPifuKXXY0F0b05vSD5GjtW4ROpUigZjT+6y0MpFWSuxUM
 gzaj9i3ccFkDET2QHsxgNPQtSpxVDIvnRklUxT+NK+/ScrFDtmXD1dDj6fhllxwa1sDC
 vQ4Q==
X-Gm-Message-State: AOAM5309GmXUB+V40C7TynsdyN4e25atTmsCKfEvVEim3id9lj53aKcT
 z/Kmw7SwsUg5I//085LRx/kLhodYMPhWB6zMCn01yg==
X-Google-Smtp-Source: ABdhPJygqoXty9bMa/ZXnCb0eKUA7dAP/hj5TGwwHmLYrVisGkZ6rNv0CxGBE9GmQpW4KhpK0zqZ6enphrHSMYbY/3Q=
X-Received: by 2002:aca:4188:: with SMTP id o130mr4955360oia.101.1616267478225; 
 Sat, 20 Mar 2021 12:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210319190607.2903545-1-l.stach@pengutronix.de>
 <CAH9NwWdOSiWTNpyzxXHasjcNrhOtK3Su66kaQsGA_kz7AUp53A@mail.gmail.com>
In-Reply-To: <CAH9NwWdOSiWTNpyzxXHasjcNrhOtK3Su66kaQsGA_kz7AUp53A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 20 Mar 2021 20:11:07 +0100
Message-ID: <CAKMK7uH-X6KzxfrMLgzhhYdoceLgygtKvzZWbFt+ZztY_BCC5A@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add Vivante TS modifiers
To: Christian Gmeiner <christian.gmeiner@gmail.com>
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 patchwork-lst@pengutronix.de,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXIgMjAsIDIwMjEgYXQgMTA6MjggQU0gQ2hyaXN0aWFuIEdtZWluZXIKPGNocmlz
dGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBMdWNhcwo+Cj4gQW0gRnIuLCAx
OS4gTcOkcnogMjAyMSB1bSAyMDowNiBVaHIgc2NocmllYiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBw
ZW5ndXRyb25peC5kZT46Cj4gPgo+ID4gVml2YW50ZSBUUyAodGlsZS1zdGF0dXMpIGJ1ZmZlciBt
b2RpZmllcnMuIFRoZXkgY2FuIGJlIGNvbWJpbmVkIHdpdGggYWxsIG9mCj4gPiB0aGUgVml2YW50
ZSBjb2xvciBidWZmZXIgdGlsaW5nIG1vZGlmaWVycywgc28gdGhleSBhcmUga2luZCBvZiBhIG1v
ZGlmaWVyCj4gPiBtb2RpZmllci4gSWYgYSBUUyBtb2RpZmllciBpcyBwcmVzZW50IHdlIGhhdmUg
YSBhZGRpdGlvbmFsIHBsYW5lIGZvciB0aGUKPiA+IFRTIGJ1ZmZlciBhbmQgdGhlIG1vZGlmaWVy
IGRlZmluZXMgdGhlIGxheW91dCBvZiB0aGlzIFRTIGJ1ZmZlci4KPiA+Cj4KPiBJIGFtIHVuc3Vy
ZSB3aHkgeW91IHdhbnQgdG8gaGF2ZSB0aGUgVFMgbW9kaWZpZXJzIGluIGRybV9mb3VyY2MuaC4g
Q2FuCj4geW91IHNoYXJlIHNvbWUgaW5zaWdodCBvbiB0aGlzPwoKSXQncyB0aGUgb2ZmaWNpYWwg
cmVnaXN0cnkgZm9yIGRybV9mb3VyY2MgY29kZXMgYW5kIGRybSBtb2RpZmllcnMuCldoZXRoZXIg
dGhlIGtlcm5lbCBldmVyIHVzZXMgaXQgb3Igbm90IGRvZXNuJ3QgbWF0dGVyLgotRGFuaWVsCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXYK
