Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E682B059
	for <lists+etnaviv@lfdr.de>; Mon, 27 May 2019 10:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC948977A;
	Mon, 27 May 2019 08:38:32 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE50E89948
 for <etnaviv@lists.freedesktop.org>; Mon, 27 May 2019 08:38:31 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hVB9J-0000fM-UQ; Mon, 27 May 2019 10:38:29 +0200
Message-ID: <1558946309.4039.0.camel@pengutronix.de>
Subject: Re: [Mesa-dev] [PATCH] etnaviv: rs: choose clear format based on
 block size
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 mesa-dev@lists.freedesktop.org
Date: Mon, 27 May 2019 10:38:29 +0200
In-Reply-To: <20190526190651.369-1-christian.gmeiner@gmail.com>
References: <20190526190651.369-1-christian.gmeiner@gmail.com>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gU29ubnRhZywgZGVuIDI2LjA1LjIwMTksIDIxOjA2ICswMjAwIHNjaHJpZWIgQ2hyaXN0aWFu
IEdtZWluZXI6Cj4gRml4ZXMgZm9sbG93aW5nIHBpZ2xpdCBhbmQgZG9lcyBub3QgaW50cm9kdWNl
IGFueSByZWdyZXNzaW9ucy4KPiDCoCBzcGVjQGV4dF9wYWNrZWRfZGVwdGhfc3RlbmNpbEBmYm8t
ZGVwdGgtZ2xfZGVwdGgyNF9zdGVuY2lsOC1ibGl0Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBM
dWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KCj4gLS0tCj4gwqBzcmMvZ2FsbGl1
bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9ycy5jIHwgMTQgKysrKysrKysrKysrKy0KPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5hdml2X3JzLmMgYi9zcmMvZ2Fs
bGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9ycy5jCj4gaW5kZXggZTY0YmFiZmRkMGEuLjhj
ODVmMzI5Zjc2IDEwMDY0NAo+IC0tLSBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5h
dml2X3JzLmMKPiArKysgYi9zcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9ycy5j
Cj4gQEAgLTI1NCw3ICsyNTQsMTkgQEAgZXRuYV9yc19nZW5fY2xlYXJfc3VyZmFjZShzdHJ1Y3Qg
ZXRuYV9jb250ZXh0ICpjdHgsIHN0cnVjdCBldG5hX3N1cmZhY2UgKnN1cmYsCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdWludDMyX3QgY2xl
YXJfdmFsdWUpCj4gwqB7Cj4gwqDCoMKgwqBzdHJ1Y3QgZXRuYV9yZXNvdXJjZSAqZHN0ID0gZXRu
YV9yZXNvdXJjZShzdXJmLT5iYXNlLnRleHR1cmUpOwo+IC3CoMKgwqB1aW50MzJfdCBmb3JtYXQg
PSB0cmFuc2xhdGVfcnNfZm9ybWF0KHN1cmYtPmJhc2UuZm9ybWF0KTsKPiArwqDCoMKgdWludDMy
X3QgZm9ybWF0Owo+ICsKPiArwqDCoMKgc3dpdGNoICh1dGlsX2Zvcm1hdF9nZXRfYmxvY2tzaXpl
Yml0cyhzdXJmLT5iYXNlLmZvcm1hdCkpIHsKPiArwqDCoMKgY2FzZSAxNjoKPiArwqDCoMKgwqDC
oMKgZm9ybWF0ID0gUlNfRk9STUFUX0E0UjRHNEI0Owo+ICvCoMKgwqDCoMKgwqBicmVhazsKPiAr
wqDCoMKgY2FzZSAzMjoKPiArwqDCoMKgwqDCoMKgZm9ybWF0ID0gUlNfRk9STUFUX0E4UjhHOEI4
Owo+ICvCoMKgwqDCoMKgwqBicmVhazsKPiArwqDCoMKgZGVmYXVsdDoKPiArwqDCoMKgwqDCoMKg
Zm9ybWF0ID0gRVROQV9OT19NQVRDSDsKPiArwqDCoMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDCoH0K
PiDCoAo+IMKgwqDCoMKgaWYgKGZvcm1hdCA9PSBFVE5BX05PX01BVENIKSB7Cj4gwqDCoMKgwqDC
oMKgwqBCVUcoImV0bmFfcnNfZ2VuX2NsZWFyX3N1cmZhY2U6IFVuaGFuZGxlZCBjbGVhciBmbXQg
JXMiLCB1dGlsX2Zvcm1hdF9uYW1lKHN1cmYtPmJhc2UuZm9ybWF0KSk7Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0
bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
