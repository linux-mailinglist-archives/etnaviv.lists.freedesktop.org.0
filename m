Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC725F68C
	for <lists+etnaviv@lfdr.de>; Thu,  4 Jul 2019 12:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22CE890CD;
	Thu,  4 Jul 2019 10:24:17 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E2F88E88
 for <etnaviv@lists.freedesktop.org>; Thu,  4 Jul 2019 10:24:16 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hiyuU-0007BD-Ph; Thu, 04 Jul 2019 12:24:14 +0200
Message-ID: <1562235854.2321.19.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Use devm_platform_ioremap_resource()
From: Lucas Stach <l.stach@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Date: Thu, 04 Jul 2019 12:24:14 +0200
In-Reply-To: <20190605175702.6545-1-festevam@gmail.com>
References: <20190605175702.6545-1-festevam@gmail.com>
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
Cc: christian.gmeiner@gmail.com, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux+etnaviv@armlinux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIGRlbiAwNS4wNi4yMDE5LCAxNDo1NyAtMDMwMCBzY2hyaWViIEZhYmlvIEVz
dGV2YW06Cj4gVXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvIHNpbXBsaWZ5
IHRoZSBjb2RlIGEgYml0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3Rl
dmFtQGdtYWlsLmNvbT4KClRoYW5rcywgYXBwbGllZC4KClJlZ2FyZHMsCkx1Y2FzCgo+IC0tLQo+
IMKgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyB8IDQgKy0tLQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jCj4gYi9kcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jCj4gaW5kZXggNzJkMDFlODczMTYwLi5hNGZmMWVl
NDFiZmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKPiBAQCAtMTcx
MSw3ICsxNzExLDYgQEAgc3RhdGljIGludCBldG5hdml2X2dwdV9wbGF0Zm9ybV9wcm9iZShzdHJ1
Y3QKPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gwqB7Cj4gwqAJc3RydWN0IGRldmljZSAqZGV2
ID0gJnBkZXYtPmRldjsKPiDCoAlzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdTsKPiAtCXN0cnVjdCBy
ZXNvdXJjZSAqcmVzOwo+IMKgCWludCBlcnI7Cj4gwqAKPiDCoAlncHUgPSBkZXZtX2t6YWxsb2Mo
ZGV2LCBzaXplb2YoKmdwdSksIEdGUF9LRVJORUwpOwo+IEBAIC0xNzIzLDggKzE3MjIsNyBAQCBz
dGF0aWMgaW50IGV0bmF2aXZfZ3B1X3BsYXRmb3JtX3Byb2JlKHN0cnVjdAo+IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiDCoAltdXRleF9pbml0KCZncHUtPmZlbmNlX2xvY2spOwo+IMKgCj4gwqAJ
LyogTWFwIHJlZ2lzdGVyczogKi8KPiAtCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2
LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4gLQlncHUtPm1taW8gPSBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2UoJnBkZXYtPmRldiwgcmVzKTsKPiArCWdwdS0+bW1pbyA9IGRldm1fcGxhdGZvcm1faW9yZW1h
cF9yZXNvdXJjZShwZGV2LCAwKTsKPiDCoAlpZiAoSVNfRVJSKGdwdS0+bW1pbykpCj4gwqAJCXJl
dHVybiBQVFJfRVJSKGdwdS0+bW1pbyk7Cj4gwqAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ldG5hdml2
