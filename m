Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52AF81411
	for <lists+etnaviv@lfdr.de>; Mon,  5 Aug 2019 10:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BB389BF5;
	Mon,  5 Aug 2019 08:21:58 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D94B89BF5
 for <etnaviv@lists.freedesktop.org>; Mon,  5 Aug 2019 08:21:57 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1huYFf-0005Mp-Va; Mon, 05 Aug 2019 10:21:55 +0200
Message-ID: <1564993315.3056.2.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/etnaviv: allow to request specific virtual
 address for gem mapping
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Mon, 05 Aug 2019 10:21:55 +0200
In-Reply-To: <20190802172953.4586-3-l.stach@pengutronix.de>
References: <20190802172953.4586-1-l.stach@pengutronix.de>
 <20190802172953.4586-3-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA4LTAyIGF0IDE5OjI5ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBB
bGxvdyB0aGUgbWFwcGluZyBjb2RlIHRvIHJlcXVlc3QgYSBzcGVjaWZpYyB2aXJ0dWFsIGFkZHJl
c3MgZm9yIHRoZSBnZW0KPiBtYXBwaW5nLiBJZiB0aGUgdmlydHVhbCBhZGRyZXNzIGlzIHplcm8g
d2UgZmFsbCBiYWNrIHRvIHRoZSBvbGQgbW9kZSBvZgo+IGFsbG9jYXRpbmcgYSB2aXJ0dWFsIGFk
ZHJlc3MgZm9yIHRoZSBtYXBwaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxs
LnN0YWNoQHBlbmd1dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFi
ZWxAcGVuZ3V0cm9uaXguZGU+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2dlbS5jIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0u
aCB8ICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmMgfCAxNiAr
KysrKysrKysrKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11Lmgg
fCAgMiArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4gClsuLi5dCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5jCj4gaW5kZXgg
OTljMjAwOTQyOTVjLi5jMzQ0ZGRlMmZhMDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0
bmF2aXZfbW11LmMKPiBAQCAtMjIwLDkgKzIyMCwxNiBAQCBzdGF0aWMgaW50IGV0bmF2aXZfaW9t
bXVfZmluZF9pb3ZhKHN0cnVjdCBldG5hdml2X2lvbW11X2NvbnRleHQgKmNvbnRleHQsCj4gIAly
ZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IGV0bmF2aXZfaW9tbXVfaW5zZXJ0X2V4
YWN0KHN0cnVjdCBldG5hdml2X2lvbW11X2NvbnRleHQgKmNvbnRleHQsCj4gKwkJICAgc3RydWN0
IGRybV9tbV9ub2RlICpub2RlLCBzaXplX3Qgc2l6ZSwgdTY0IHZhKQo+ICt7Cj4gKwlyZXR1cm4g
ZHJtX21tX2luc2VydF9ub2RlX2luX3JhbmdlKCZjb250ZXh0LT5tbSwgbm9kZSwgc2l6ZSwgMCwg
MCwgdmEsCj4gKwkJCQkJICAgdmEgKyBzaXplLCBEUk1fTU1fSU5TRVJUX0xPVyk7CgpXZSBhcmUg
b25seSBsb29raW5nIGZvciBhbiBleGFjdCBtYXRjaCwgdGhpcyBjb3VsZCB1c2UKRFJNX01NX0lO
U0VSVF9MT1dFU1QuCgpyZWdhcmRzClBoaWxpcHAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ldG5hdml2
