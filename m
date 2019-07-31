Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BBE7BC9C
	for <lists+etnaviv@lfdr.de>; Wed, 31 Jul 2019 11:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0627389388;
	Wed, 31 Jul 2019 09:07:51 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80B789388
 for <etnaviv@lists.freedesktop.org>; Wed, 31 Jul 2019 09:07:48 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hskaH-0002Ol-Fa; Wed, 31 Jul 2019 11:07:45 +0200
Message-ID: <1564564065.7267.12.camel@pengutronix.de>
Subject: Re: [Mesa-dev]  Mesa 19.2.0 release plan
From: Lucas Stach <l.stach@pengutronix.de>
To: Emil Velikov <emil.l.velikov@gmail.com>, 
 mesa-announce@lists.freedesktop.org, ML mesa-dev
 <mesa-dev@lists.freedesktop.org>
Date: Wed, 31 Jul 2019 11:07:45 +0200
In-Reply-To: <CACvgo51xr+xcgbVbEKfuty4XfBFQvmquGZ2MZAvhgwC55Vaf+A@mail.gmail.com>
References: <CACvgo51xr+xcgbVbEKfuty4XfBFQvmquGZ2MZAvhgwC55Vaf+A@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
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

SGkgRW1pbCwKCkFtIE1pdHR3b2NoLCBkZW4gMzEuMDcuMjAxOSwgMDk6MzcgKzAxMDAgc2Nocmll
YiBFbWlsIFZlbGlrb3Y6Cj4gSGkgYWxsLAo+IAo+IEhlcmUgaXMgdGhlIHRlbnRhdGl2ZSByZWxl
YXNlIHBsYW4gZm9yIDE5LjIuMC4KPiAKPiBBcyBtYW55IG9mIHlvdSBhcmUgd2VsbCBhd2FyZSwg
aXQncyB0aW1lIHRvIHRoZSBuZXh0IGJyYW5jaCBwb2ludC4KPiBUaGUgY2FsZW5kYXIgaXMgYWxy
ZWFkeSB1cGRhdGVkLCBzbyB0aGVzZSBhcmUgdGhlIHRlbnRhdGl2ZSBkYXRlczoKPiAKPiDCoEF1
ZyAwNiAyMDE5IC0gRmVhdHVyZSBmcmVlemUvUmVsZWFzZSBjYW5kaWRhdGUgMQo+IMKgQXVnIDEz
IDIwMTkgLSBSZWxlYXNlIGNhbmRpZGF0ZSAyCj4gwqBBdWcgMjAgMjAxOSAtIFJlbGVhc2UgY2Fu
ZGlkYXRlIDMKPiDCoEF1ZyAyNyAyMDE5IC0gUmVsZWFzZSBjYW5kaWRhdGUgNC9maW5hbCByZWxl
YXNlCj4gCj4gVGhpcyBnaXZlcyB1cyBhcm91bmQgMSB3ZWVrIHVudGlsIHRoZSBicmFuY2ggcG9p
bnQuCj4gCj4gTm90ZTogSW4gdGhlIHNwaXJpdCBvZiBrZWVwaW5nIHRoaW5ncyBjbGVhcmVyIGFu
ZCBtb3JlIHRyYW5zcGFyZW50LCB3ZQo+IHdpbGwgYmUga2VlcGluZyB0cmFjayBvZiBhbnkgZmVh
dHVyZXMgcGxhbm5lZCBmb3IgdGhlIHJlbGVhc2UgaW4KPiBCdWd6aWxsYSBbMV0uCj4gCj4gRG8g
YWRkIGEgc2VwYXJhdGUgIkRlcGVuZHMgb24iIGZvciBlYWNoIHdvcmsgeW91IGhhdmUgcGxhbm5l
ZC4KPiBBbHRlcm5hdGl2ZWx5IHlvdSBjYW4gcmVwbHkgdG8gdGhpcyBlbWFpbCBhbmQgSSdsbCBh
ZGQgdGhlbSBmb3IgeW91Lgo+IAo+IFsxXSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3No
b3dfYnVnLmNnaT9pZD0xMTEyNjUKClRoZSBldG5hdml2IHRlYW0gd291bGQgbGlrZSB0byBsYW5k
IHRoZSBleHBlcmltZW50YWwgTklSIGNvbXBpbGVyIFsxXQphbmQgYSBnb29kIGJ1bmNoIG9mIGZp
eGVzIGZvciBtdWx0aXRocmVhZGluZyBpc3N1ZXMgWzJdIGJlZm9yZSB0aGUKYnJhbmNoaW5nLgoK
UmVnYXJkcywKTHVjYXMKClsxXSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9t
ZXNhL21lcmdlX3JlcXVlc3RzLzE0OTcKWzJdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9tZXNhL21lc2EvbWVyZ2VfcmVxdWVzdHMvMTE5MApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2V0bmF2aXY=
