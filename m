Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF0584B4
	for <lists+etnaviv@lfdr.de>; Thu, 27 Jun 2019 16:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533296E032;
	Thu, 27 Jun 2019 14:44:41 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019BD6E032
 for <etnaviv@lists.freedesktop.org>; Thu, 27 Jun 2019 14:44:39 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hgVde-0007Bw-Hv; Thu, 27 Jun 2019 16:44:38 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: [PATCH] drm/etnaviv: add missing failure path to destroy suballoc
Date: Thu, 27 Jun 2019 16:44:38 +0200
Message-Id: <20190627144438.2016-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

V2hlbiBzb21ldGhpbmcgZ29lcyB3cm9uZyBpbiB0aGUgR1BVIGluaXQgYWZ0ZXIgdGhlIGNtZGJ1
ZiBzdWJhbGxvY2F0b3IKaGFzIGJlZW4gY29uc3RydWN0ZWQsIHdlIGZhaWwgdG8gZGVzdG9yeSBp
dCBwcm9wZXJseS4gVGhpcyBjYXVzZXMgaGF2b2sKbGF0ZXIgd2hlbiB0aGUgR1BVIGlzIHVuYm91
bmQgZHVlIHRvIGEgbW9kdWxlIHVubG9hZCBvciBzaW1pbGFyLgoKU2lnbmVkLW9mZi1ieTogTHVj
YXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9ncHUuYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRu
YXZpdi9ldG5hdml2X2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUu
YwppbmRleCA3MmQwMWU4NzMxNjAuLjU0MThhMWE4N2IyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X2dwdS5jCkBAIC03NjAsNyArNzYwLDcgQEAgaW50IGV0bmF2aXZfZ3B1X2luaXQo
c3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpCiAJaWYgKElTX0VSUihncHUtPmNtZGJ1Zl9zdWJhbGxv
YykpIHsKIAkJZGV2X2VycihncHUtPmRldiwgIkZhaWxlZCB0byBjcmVhdGUgY21kYnVmIHN1YmFs
bG9jYXRvclxuIik7CiAJCXJldCA9IFBUUl9FUlIoZ3B1LT5jbWRidWZfc3ViYWxsb2MpOwotCQln
b3RvIGZhaWw7CisJCWdvdG8gZGVzdHJveV9pb21tdTsKIAl9CiAKIAkvKiBDcmVhdGUgYnVmZmVy
OiAqLwpAQCAtNzY4LDcgKzc2OCw3IEBAIGludCBldG5hdml2X2dwdV9pbml0KHN0cnVjdCBldG5h
dml2X2dwdSAqZ3B1KQogCQkJCSAgUEFHRV9TSVpFKTsKIAlpZiAocmV0KSB7CiAJCWRldl9lcnIo
Z3B1LT5kZXYsICJjb3VsZCBub3QgY3JlYXRlIGNvbW1hbmQgYnVmZmVyXG4iKTsKLQkJZ290byBk
ZXN0cm95X2lvbW11OworCQlnb3RvIGRlc3Ryb3lfc3ViYWxsb2M7CiAJfQogCiAJaWYgKGdwdS0+
bW11LT52ZXJzaW9uID09IEVUTkFWSVZfSU9NTVVfVjEgJiYKQEAgLTgwMCw2ICs4MDAsOSBAQCBp
bnQgZXRuYXZpdl9ncHVfaW5pdChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKIGZyZWVfYnVmZmVy
OgogCWV0bmF2aXZfY21kYnVmX2ZyZWUoJmdwdS0+YnVmZmVyKTsKIAlncHUtPmJ1ZmZlci5zdWJh
bGxvYyA9IE5VTEw7CitkZXN0cm95X3N1YmFsbG9jOgorCWV0bmF2aXZfY21kYnVmX3N1YmFsbG9j
X2Rlc3Ryb3koZ3B1LT5jbWRidWZfc3ViYWxsb2MpOworCWdwdS0+Y21kYnVmX3N1YmFsbG9jID0g
TlVMTDsKIGRlc3Ryb3lfaW9tbXU6CiAJZXRuYXZpdl9pb21tdV9kZXN0cm95KGdwdS0+bW11KTsK
IAlncHUtPm1tdSA9IE5VTEw7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZXRuYXZpdg==
