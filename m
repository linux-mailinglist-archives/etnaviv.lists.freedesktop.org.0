Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A274A29EDE1
	for <lists+etnaviv@lfdr.de>; Thu, 29 Oct 2020 15:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684436ECDA;
	Thu, 29 Oct 2020 14:08:22 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB296ECDA
 for <etnaviv@lists.freedesktop.org>; Thu, 29 Oct 2020 14:08:21 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id z23so3323720oic.1
 for <etnaviv@lists.freedesktop.org>; Thu, 29 Oct 2020 07:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b3viM6FArN4vEzgqlLv0meqKLay2dHnFuhXkpIrujT0=;
 b=BYe4t0uxSSRQje1vD3AB9FQZl8AaSvq5PLnzR2KlEBG+6U7IT/JOW7bG7XMnTjWm7J
 HQq+Y6WRRCPzeBeB8h1k5bO4/TE00OGHugQFlpJ0ZZEVRkT1n6lh55mLDTxS6KhQCorF
 f9UTvzJJEC2LOUL4njaLwqbytZpc7a6lwiLzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b3viM6FArN4vEzgqlLv0meqKLay2dHnFuhXkpIrujT0=;
 b=NWgeCrWxjbxB98g7dzDi3HYT9jKlIx1RtjwdxhSHDUT2Z4VeQIQPEc2LC78jUfwifz
 AegqYgRZaZGLft8foCZUpQMbDKZf1ql1hkK8ptBst8NGQ6+kKjT9ziBdATt5wWdShdRH
 PHn0D3Mhh6XDLuLL7GNXn9/Wb0uKBgXX5EpHaa0O5yxS5R9zWzeCrnMMiU4+hSR5ZgmO
 kq4VG9CukziNXFtux49K98ygB7JJZPtAptOqUhNEdenGwvIG9Q1mN6x5Sf+FZn7MBHe1
 2a8gezCG4NT0Wacum9pbMmFpf+IJjRhVbpX9z4r3vO3RrZ/4hyuCpMWuGOi0Zt2FTj/x
 Cbtg==
X-Gm-Message-State: AOAM532mhbsjDNodoAKETv0wgfULEMWy9baayZucnmEsxM5AI6SFar6r
 aGi0ZBgLh8qZDKOnTLYlIQqh5WumyVbH2DXIFHwPig==
X-Google-Smtp-Source: ABdhPJzbHzH1H94iJJG5bHbee6aqJWlWmSYp7KNDlv65cD1Dhy9lpFHCZ8+Ub27oESBO9NHfBVDZ84hG4hOejFsld+s=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr9580oig.128.1603980500668;
 Thu, 29 Oct 2020 07:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603979517.git.agx@sigxcpu.org>
In-Reply-To: <cover.1603979517.git.agx@sigxcpu.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 29 Oct 2020 15:08:09 +0100
Message-ID: <CAKMK7uF2By1SwE+FOyM2i7cOtFzzJ9wrHh_yDntG7cyNt0tJUg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] drm: etnaviv: Unmap gems on gem_close
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMjo1NCBQTSBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hj
cHUub3JnPiB3cm90ZToKPgo+IFRoaXMgaXMgbWVhbnQgYXMgYSBSRkMgc2luY2UgaSdtIG5vdCBz
dXJlIGlmIHRoaXMgaXMgdGhlIHJpZ2h0Cj4gd2F5IHRvIGZpeCB0aGUgcHJvYmxlbToKPgo+IFNv
IGZhciB0aGUgdW5tYXAgZnJvbSBncHUgYWRkcmVzcyBzcGFjZSBvbmx5IGhhcHBlbmVkIHdoZW4g
ZHJvcHBpbmcgdGhlCj4gbGFzdCByZWYgaW4gZ2VtX2ZyZWVfb2JqZWN0X3VubG9ja2VkLCBob3dl
dmVyIHRoYXQgaXMgc2tpcHBlZCBpZiB0aGVyZSdzCj4gc3RpbGwgbXVsdGlwbGUgaGFuZGxlcyB0
byB0aGUgc2FtZSBHRU0gb2JqZWN0Lgo+Cj4gU2luY2UgdXNlcnNwYWNlIChoZXJlIG1lc2EpIGlu
IHRoZSBjYXNlIG9mIHNvZnRwaW4gaGFuZHMgYmFjayB0aGUgbWVtb3J5Cj4gcmVnaW9uIHRvIHRo
ZSBwb29sIG9mIGF2YWlsYWJsZSBHUFUgdmlydHVhbCBtZW1vcnkgY2xvc2luZyB0aGUgaGFuZGxl
Cj4gdmlhIERSTV9JT0NUTF9HRU1fQ0xPU0UgdGhpcyBjYW4gbGVhZCB0byBldG5hdml2X2lvbW11
X2luc2VydF9leGFjdAo+IGZhaWxpbmcgbGF0ZXIgc2luY2UgdXNlcnNwYWNlIHRoaW5rcyB0aGUg
dmFkZHIgaXMgYXZhaWxhYmxlIHdoaWxlIHRoZQo+IGtlcm5lbCB0aGlua3MgaXQgaXNuJ3QgbWFr
aW5nIHRoZSBzdWJtaXQgZmFpbCBsaWtlCj4KPiAgICAgIFtFXSBzdWJtaXQgZmFpbGVkOiAtMTQg
KE5vIHNwYWNlIGxlZnQgb24gZGV2aWNlKSAoZXRuYV9jbWRfc3RyZWFtX2ZsdXNoOjI0NCkKPgo+
IEZpeCB0aGlzIGJ5IHVubWFwcGluZyB0aGUgbWVtb3J5IHZpYSB0aGUgLmdlbV9jbG9zZV9vYmpl
Y3QgY2FsbGJhY2suCj4KPiBUaGUgcGF0Y2ggaXMgYWdhaW5zdCA1LjkgYW5kIHdpbGwgbmVlZCB0
byBiZSByZWRvbmUgZm9yIGRybS1taXNjLW5leHQgZHVlIHRvCj4gdGhlIGNvbnZlcnNpb24gdG8g
R0VNIG9iamVjdCBmdW5jdGlvbnMgYnV0IGknbSBoYXBweSB0byBkbyB0aGF0IGl0IGxvb2tzIGxp
a2UKPiB0aGUgcmlnaHQgYXBwcm9hY2guCj4KPiBJIGNhbiB0cmlnZ2VyIHRoZSBwcm9ibGVtIHdo
ZW4gcGx1Z2dpbmcvdW5wbHVnZ2luZyBhIERQIHNjcmVlbiBkcml2ZW4gYnkgRENTUwo+IHdoaWxl
IERTSSBpcyBkcml2ZW4gYnkgbXhzZmIuIEl0IHByZWZlcmFibHkgaGFwcGVucyB3aXRoIDRrIHNp
bmNlIHRoaXMKPiBhbGxvY2F0ZXMgYmlnZ2VyIGNodW5rcy4KPgo+IEkgYWxzbyBmb2xkZWQgaW4g
YSBjb21taXQgY2hlY2tpbmcgZm9yIHRoZSBjb250ZXh0LT5sb2NrIGluCj4gZXRuYXZpdl9pb21t
dV9pbnNlcnRfZXhhY3QgYW5kIGV0bmF2aXZfaW9tbXVfcmVtb3ZlX21hcHBpbmcgdG9vIHRvIG1h
a2UgaXQKPiBtYXRjaCBldG5hdml2X2lvbW11X2ZpbmRfaW92YS4KPgo+IEd1aWRvIEfDvG50aGVy
ICgyKToKPiAgIGRybTogZXRuYXZpdjogQWRkIGxvY2tkZXAgYW5ub3RhdGlvbnMgZm9yIGNvbnRl
eHQgbG9jawo+ICAgZHJtOiBldG5hdml2OiBVbm1hcCBnZW1zIG9uIGdlbV9jbG9zZQoKQ2FuIHlv
dSBwbHMgcmVzdWJtaXQgd2l0aCBkcmktZGV2ZWwgb24gY2M/IFRoaXMgaXMga2luZGEgYSBnZW5l
cmFsCnByb2JsZW0gb2YgbGV0dGluZyB1c2Vyc3BhY2UgbWFuYWdlIHRoZSBncHUgVkEuCi1EYW5p
ZWwKCj4KPiAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYyB8ICAxICsKPiAg
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuaCB8ICAxICsKPiAgZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5jIHwgIDQgKysrKwo+
ICA0IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKPgo+IC0tCj4gMi4yOC4wCj4KCgot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
Cg==
