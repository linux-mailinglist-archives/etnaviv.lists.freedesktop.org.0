Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9D8140D
	for <lists+etnaviv@lfdr.de>; Mon,  5 Aug 2019 10:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457BB89BF5;
	Mon,  5 Aug 2019 08:20:58 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477FA89B60
 for <etnaviv@lists.freedesktop.org>; Mon,  5 Aug 2019 08:20:56 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1huYEg-0005Gn-G1; Mon, 05 Aug 2019 10:20:54 +0200
Message-ID: <1564993253.3056.1.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/etnaviv: skip command stream validation on PPAS
 capable GPUs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Mon, 05 Aug 2019 10:20:53 +0200
In-Reply-To: <20190802172953.4586-2-l.stach@pengutronix.de>
References: <20190802172953.4586-1-l.stach@pengutronix.de>
 <20190802172953.4586-2-l.stach@pengutronix.de>
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

T24gRnJpLCAyMDE5LTA4LTAyIGF0IDE5OjI5ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBX
aXRoIHBlci1wcm9jZXNzIGFkZHJlc3Mgc3BhY2VzIGluIHBsYWNlLCBhIHJvZ3VlIHByb2Nlc3Mg
c3VibWl0dGluZwo+IGJvZ3VzIGNvbW1hbmQgc3RyZWFtcyBjYW4gb25seSBodXJ0IGl0c2VsZi4g
VGhlcmUgaXMgbm8gbmVlZCB0bwo+IHZhbGlkYXRlIHRoZSBjb21tYW5kIHN0cmVhbSBiZWZvcmUg
ZXhlY3V0aW9uIGFueW1vcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3Rh
Y2hAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfZ2VtX3N1Ym1pdC5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X2dlbV9zdWJtaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
Z2VtX3N1Ym1pdC5jCj4gaW5kZXggMjdhMTRhMjcwYTU1Li42MjdjODBlZDYzZDggMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fc3VibWl0LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYwo+IEBAIC01MTcs
NyArNTE3LDggQEAgaW50IGV0bmF2aXZfaW9jdGxfZ2VtX3N1Ym1pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGVycl9zdWJtaXRfb2Jq
ZWN0czsKPiAgCj4gLQlpZiAoIWV0bmF2aXZfY21kX3ZhbGlkYXRlX29uZShncHUsIHN0cmVhbSwg
YXJncy0+c3RyZWFtX3NpemUgLyA0LAo+ICsJaWYgKChwcml2LT5tbXVfZ2xvYmFsLT52ZXJzaW9u
ICE9IEVUTkFWSVZfSU9NTVVfVjIpICYmCj4gKwkgICAgIWV0bmF2aXZfY21kX3ZhbGlkYXRlX29u
ZShncHUsIHN0cmVhbSwgYXJncy0+c3RyZWFtX3NpemUgLyA0LAo+ICAJCQkJICAgICAgcmVsb2Nz
LCBhcmdzLT5ucl9yZWxvY3MpKSB7Cj4gIAkJcmV0ID0gLUVJTlZBTDsKPiAgCQlnb3RvIGVycl9z
dWJtaXRfb2JqZWN0czsKCgpSZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4KCnJlZ2FyZHMKUGhpbGlwcApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2V0bmF2aXY=
