Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE8D2A07FF
	for <lists+etnaviv@lfdr.de>; Fri, 30 Oct 2020 15:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FC86E9C1;
	Fri, 30 Oct 2020 14:35:57 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA1489B0C
 for <etnaviv@lists.freedesktop.org>; Fri, 30 Oct 2020 14:35:56 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kYVVR-0002It-BC; Fri, 30 Oct 2020 15:35:53 +0100
Message-ID: <9fc2ef20a024b77949c7bcd47d37cd3eb7f9050e.camel@pengutronix.de>
Subject: Re: [RFC PATCH 1/2] drm: etnaviv: Add lockdep annotations for
 context lock
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Fri, 30 Oct 2020 15:35:51 +0100
In-Reply-To: <7a0ea85eb081033b96a4a4fe2f0c013cca1dab9e.1603981111.git.agx@sigxcpu.org>
References: <cover.1603981111.git.agx@sigxcpu.org>
 <7a0ea85eb081033b96a4a4fe2f0c013cca1dab9e.1603981111.git.agx@sigxcpu.org>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gRG9ubmVyc3RhZywgZGVuIDI5LjEwLjIwMjAsIDE1OjIwICswMTAwIHNjaHJpZWIgR3VpZG8g
R8O8bnRoZXI6Cj4gZXRuYXZpdl9pb21tdV9maW5kX2lvdmEgaGFzIGl0IHNvIGV0bmF2aXZfaW9t
bXVfaW5zZXJ0X2V4YWN0IGFuZAo+IGxvY2tkZXBfYXNzZXJ0X2hlbGQgc2hvdWxkIGhhdmUgaXQg
YXMgd2VsbC4KClRoaXMgc291bmRzIHJlYXNvbmFibGUgdG8gbWUuIEkndmUgYWRkZWQgdGhpcyBw
YXRjaCB0byBteSBldG5hdml2L25leHQKYnJhbmNoLgoKUmVnYXJkcywKTHVjYXMKCj4gU2lnbmVk
LW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9tbXUuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5j
Cj4gaW5kZXggMzYwN2QzNDhjMjk4Li5jZDU5OWFjMDQ2NjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9l
dG5hdml2L2V0bmF2aXZfbW11LmMKPiBAQCAtMTMxLDYgKzEzMSw4IEBAIHN0YXRpYyB2b2lkIGV0
bmF2aXZfaW9tbXVfcmVtb3ZlX21hcHBpbmcoc3RydWN0IGV0bmF2aXZfaW9tbXVfY29udGV4dCAq
Y29udGV4dCwKPiAgewo+ICAJc3RydWN0IGV0bmF2aXZfZ2VtX29iamVjdCAqZXRuYXZpdl9vYmog
PSBtYXBwaW5nLT5vYmplY3Q7Cj4gIAo+ICsJbG9ja2RlcF9hc3NlcnRfaGVsZCgmY29udGV4dC0+
bG9jayk7Cj4gKwo+ICAJZXRuYXZpdl9pb21tdV91bm1hcChjb250ZXh0LCBtYXBwaW5nLT52cmFt
X25vZGUuc3RhcnQsCj4gIAkJCSAgICBldG5hdml2X29iai0+c2d0LCBldG5hdml2X29iai0+YmFz
ZS5zaXplKTsKPiAgCWRybV9tbV9yZW1vdmVfbm9kZSgmbWFwcGluZy0+dnJhbV9ub2RlKTsKPiBA
QCAtMjIzLDYgKzIyNSw4IEBAIHN0YXRpYyBpbnQgZXRuYXZpdl9pb21tdV9maW5kX2lvdmEoc3Ry
dWN0IGV0bmF2aXZfaW9tbXVfY29udGV4dCAqY29udGV4dCwKPiAgc3RhdGljIGludCBldG5hdml2
X2lvbW11X2luc2VydF9leGFjdChzdHJ1Y3QgZXRuYXZpdl9pb21tdV9jb250ZXh0ICpjb250ZXh0
LAo+ICAJCSAgIHN0cnVjdCBkcm1fbW1fbm9kZSAqbm9kZSwgc2l6ZV90IHNpemUsIHU2NCB2YSkK
PiAgewo+ICsJbG9ja2RlcF9hc3NlcnRfaGVsZCgmY29udGV4dC0+bG9jayk7Cj4gKwo+ICAJcmV0
dXJuIGRybV9tbV9pbnNlcnRfbm9kZV9pbl9yYW5nZSgmY29udGV4dC0+bW0sIG5vZGUsIHNpemUs
IDAsIDAsIHZhLAo+ICAJCQkJCSAgIHZhICsgc2l6ZSwgRFJNX01NX0lOU0VSVF9MT1dFU1QpOwo+
ICB9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5h
dml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXYK
