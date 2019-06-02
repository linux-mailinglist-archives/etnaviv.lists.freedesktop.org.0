Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C123532326
	for <lists+etnaviv@lfdr.de>; Sun,  2 Jun 2019 13:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D17E89415;
	Sun,  2 Jun 2019 11:31:06 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388E189415;
 Sun,  2 Jun 2019 11:31:05 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id c24so9542865vsp.7;
 Sun, 02 Jun 2019 04:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uAF8bnPWYeixIessT/7Py+9Vj4BqLV5x5PG2PaaUktU=;
 b=fN2/7kt1qP8ligJP+mqKVGPv2b1LeOSCc9C5WA2hNynw76JGpaRWdiA25h0BMDL755
 Tcegv4Zi91Q6xzDPwEfIq+nFQc1Scaj3mtb/mgSkAYaWIT+jmka5dAdj4/KRf6RPckGO
 xLiDt/lO4WebqYR4wGCOL+QclN+K90DSMRHmJODb1UhJaQAfT3tHMRsm5jDTS/CmZD81
 n+h+okAE4mJSjCE5OctS/CrwPSZ8Rm29LGV8ELi+BpVbPdY3T8r0PI/DGEuBm5puqKfV
 vZJs6ksJdyjlDS/zRQpeEeE1GESuUlb4QQV4+Ddya5Gb+cuudqTImUavC/5T+vZWeBdE
 u57A==
X-Gm-Message-State: APjAAAUcx3lFjDsVZFT2cdiOpgYlXQx1pkQ0QiKbiJ/Sv+rqyYbESLST
 XyM83RiYGNM6mCHUnia1WBkWsfZO8z0w/NAlg5g=
X-Google-Smtp-Source: APXvYqzBwWEctoakK6Li0nqMmduhwtgQJmXeKztEr7hnYMy8Xns38y9xiQXWJ1EAxdMt5kcMRaDbxPl+VESnj12gR2g=
X-Received: by 2002:a67:790d:: with SMTP id u13mr1929412vsc.86.1559474558237; 
 Sun, 02 Jun 2019 04:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190531160513.7072-1-l.stach@pengutronix.de>
In-Reply-To: <20190531160513.7072-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 2 Jun 2019 13:22:41 +0200
Message-ID: <CAH9NwWdX3AgJR6yjanvfPrNK_qytaONU2-pJModxnUuzQCiujQ@mail.gmail.com>
Subject: Re: [PATCH] etnaviv: fix some pm query issues
To: Lucas Stach <l.stach@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uAF8bnPWYeixIessT/7Py+9Vj4BqLV5x5PG2PaaUktU=;
 b=drOHprqoEq38Ixx24TPsWPj3DvM8ksqiQdPhjGz7VtG0LCfUGgFYG0eAn2CVhOvEUc
 mS/YxNl3uu0/v0IhRGRFEUImBvpmUe5p8IQ4GLeVE4qwuRQ1/tuVwcfXEyId96PYFE+e
 Z4VuYdPV6BjKHu42W6PWZ/PNtrO7jySBi5PxNT3oPnVO25Lu2h0cNLPXK+PceeDmbi4e
 pe9M4iihGreOdR5u+GFi6EcduPRZAIDmhdoK1h1IsE/NCvan9VwyCWFSKJ7WKAUurOO+
 wWx5hQi0p6N38JCTNIYLfBHQ1FutxRJeJD7/lqIQfCSy8P6xSqAY82mm1ygYmAlZbC6N
 I2Qw==
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
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gRnIuLCAzMS4gTWFpIDIwMTkgdW0gMTg6MDUgVWhyIHNjaHJpZWIgTHVjYXMgU3RhY2ggPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+Ogo+Cj4gVGhlIG9mZnNldHMgdG8gcmVhZCB0aGUgcXVlcnkg
cmVzdWx0cyB3ZXJlIG9mZi1ieS1vbmUsIHdoaWNoIGNhdXNlcyB0aGUKPiBjb3VudGVycyB0byBy
ZXBvcnQgYm9ndXMgaW5jcmVhc2luZyB2YWx1ZXMuCj4KPiBBbHNvIHRoZSBjb3VudGVyIHJlc3Vs
dCBpcyB1MzIsIHNvIHdlIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGUgcXVlcnkgdHlwZQo+IHRvIHJl
ZmxlY3QgdGhhdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1
dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21l
aW5lckBnbWFpbC5jb20+Cgo+IC0tLQo+IFRoaXMgb25seSBmaXhlcyB0aGUgb2J2aW91cyBpc3N1
ZXMuIEkgc3RpbGwgYmVsaWV2ZSB0aGVyZSBhcmUgc29tZQo+IEdQVS9DUFUgc3luY2hyb25pemF0
aW9uIGlzc3VlcyBpbiB0aGlzIGNvZGUsIHRoYXQgbmVlZCB0byBiZSBmaXhlZAo+IHNlcGFyYXRl
bHkuCgpXaGF0IGlzIHlvdXIgY3VycmVudCB0ZXN0IGZvciBzeW5jaHJvbml6YXRpb24gY29ycmVj
dG5lc3M/Cgo+IC0tLQo+ICBzcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9xdWVy
eV9wbS5jIHwgOCArKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvZXRuYXZp
di9ldG5hdml2X3F1ZXJ5X3BtLmMgYi9zcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZp
dl9xdWVyeV9wbS5jCj4gaW5kZXggYWRlMGI5NzkwYzI4Li5jNjNlZDgzMDQ5MTkgMTAwNjQ0Cj4g
LS0tIGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfcXVlcnlfcG0uYwo+ICsr
KyBiL3NyYy9nYWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5hdml2X3F1ZXJ5X3BtLmMKPiBAQCAt
NDg1LDkgKzQ4NSw5IEBAIGV0bmFfcG1fcXVlcnlfZ2V0KHN0cnVjdCBldG5hX2NtZF9zdHJlYW0g
KnN0cmVhbSwgc3RydWN0IGV0bmFfcXVlcnkgKnEsCj4gICAgIGFzc2VydChmbGFncyk7Cj4KPiAg
ICAgaWYgKGZsYWdzID09IEVUTkFfUE1fUFJPQ0VTU19QUkUpCj4gLSAgICAgIG9mZnNldCA9IDI7
Cj4gKyAgICAgIG9mZnNldCA9IDE7Cj4gICAgIGVsc2UKPiAtICAgICAgb2Zmc2V0ID0gMzsKPiAr
ICAgICAgb2Zmc2V0ID0gMjsKPgo+ICAgICBzdHJ1Y3QgZXRuYV9wZXJmIHAgPSB7Cj4gICAgICAg
IC5mbGFncyA9IGZsYWdzLAo+IEBAIC02MzksNiArNjM5LDEwIEBAIGV0bmFfcG1fZ2V0X2RyaXZl
cl9xdWVyeV9pbmZvKHN0cnVjdCBwaXBlX3NjcmVlbiAqcHNjcmVlbiwgdW5zaWduZWQgaW5kZXgs
Cj4gICAgIGluZm8tPm5hbWUgPSBxdWVyeV9jb25maWdbaV0ubmFtZTsKPiAgICAgaW5mby0+cXVl
cnlfdHlwZSA9IHF1ZXJ5X2NvbmZpZ1tpXS50eXBlOwo+ICAgICBpbmZvLT5ncm91cF9pZCA9IHF1
ZXJ5X2NvbmZpZ1tpXS5ncm91cF9pZDsKPiArICAgaW5mby0+dHlwZSA9IFBJUEVfRFJJVkVSX1FV
RVJZX1RZUEVfVUlOVDsKPiArICAgaW5mby0+cmVzdWx0X3R5cGUgPSBQSVBFX0RSSVZFUl9RVUVS
WV9SRVNVTFRfVFlQRV9BVkVSQUdFOwo+ICsgICBpbmZvLT5tYXhfdmFsdWUudTMyID0gMDsKPiAr
ICAgaW5mby0+ZmxhZ3MgPSAwOwo+Cj4gICAgIHJldHVybiAxOwo+ICB9Cj4gLS0KPiAyLjIwLjEK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZXRu
YXZpdiBtYWlsaW5nIGxpc3QKPiBldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdgoKCgotLSAK
Z3JlZXRzCi0tCkNocmlzdGlhbiBHbWVpbmVyLCBNU2MKCmh0dHBzOi8vY2hyaXN0aWFuLWdtZWlu
ZXIuaW5mbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpl
dG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
