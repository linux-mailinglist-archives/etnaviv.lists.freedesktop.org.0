Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3578D93D0
	for <lists+etnaviv@lfdr.de>; Wed, 16 Oct 2019 16:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2716E994;
	Wed, 16 Oct 2019 14:27:19 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6826E992
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Oct 2019 14:27:18 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1iKkGi-0002DO-Ib; Wed, 16 Oct 2019 16:27:16 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 2/2] drm/etnaviv: reinstate MMUv1 command buffer window check
Date: Wed, 16 Oct 2019 16:27:16 +0200
Message-Id: <20191016142716.10168-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191016142716.10168-1-l.stach@pengutronix.de>
References: <20191016142716.10168-1-l.stach@pengutronix.de>
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

VGhlIHN3aXRjaCB0byBwZXItcHJvY2VzcyBhZGRyZXNzIHNwYWNlcyBlcnJvbmVvdXNseSBkcm9w
cGVkIHRoZSBjaGVjawp3aGljaCB2YWxpZGF0ZWQgdGhhdCB0aGUgY29tbWFuZCBidWZmZXIgaXMg
bWFwcGVkIHRocm91Z2ggdGhlIGxpbmVhcgphcHBlcnR1cmUgYXMgcmVxdWlyZWQgYnkgdGhlIGhh
cmR3YXJlLiBUaGlzIHR1cm5lZCBhIHN5c3RlbQptaXNjb25maWd1cmF0aW9uIHdpdGggYSBoZWxw
ZnVsIGVycm9yIG1lc3NhZ2UgaW50byBhIHZlcnkgaGFyZCB0bwpkZWJ1ZyBpc3N1ZS4gUmVpbnN0
YXRlIHRoZSBjaGVjayBhdCB0aGUgYXBwcm9wcmlhdGUgbG9jYXRpb24uCgpGaXhlczogMTdlNDY2
MGFlM2Q3IChkcm0vZXRuYXZpdjogaW1wbGVtZW50IHBlci1wcm9jZXNzIGFkZHJlc3Mgc3BhY2Vz
IG9uIE1NVXYyKQpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25p
eC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5jIHwgMTcgKysr
KysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5jCmluZGV4IDM1ZWJhZTZh
MWJlNy4uMzYwN2QzNDhjMjk4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X21tdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmMK
QEAgLTMyOCwxMiArMzI4LDIzIEBAIGV0bmF2aXZfaW9tbXVfY29udGV4dF9pbml0KHN0cnVjdCBl
dG5hdml2X2lvbW11X2dsb2JhbCAqZ2xvYmFsLAogCiAJcmV0ID0gZXRuYXZpdl9jbWRidWZfc3Vi
YWxsb2NfbWFwKHN1YmFsbG9jLCBjdHgsICZjdHgtPmNtZGJ1Zl9tYXBwaW5nLAogCQkJCQkgIGds
b2JhbC0+bWVtb3J5X2Jhc2UpOwotCWlmIChyZXQpIHsKLQkJZ2xvYmFsLT5vcHMtPmZyZWUoY3R4
KTsKLQkJcmV0dXJuIE5VTEw7CisJaWYgKHJldCkKKwkJZ290byBvdXRfZnJlZTsKKworCWlmIChn
bG9iYWwtPnZlcnNpb24gPT0gRVROQVZJVl9JT01NVV9WMSAmJgorCSAgICBjdHgtPmNtZGJ1Zl9t
YXBwaW5nLmlvdmEgPiAweDgwMDAwMDAwKSB7CisJCWRldl9lcnIoZ2xvYmFsLT5kZXYsCisJCSAg
ICAgICAgImNvbW1hbmQgYnVmZmVyIG91dHNpZGUgdmFsaWQgbWVtb3J5IHdpbmRvd1xuIik7CisJ
CWdvdG8gb3V0X3VubWFwOwogCX0KIAogCXJldHVybiBjdHg7CisKK291dF91bm1hcDoKKwlldG5h
dml2X2NtZGJ1Zl9zdWJhbGxvY191bm1hcChjdHgsICZjdHgtPmNtZGJ1Zl9tYXBwaW5nKTsKK291
dF9mcmVlOgorCWdsb2JhbC0+b3BzLT5mcmVlKGN0eCk7CisJcmV0dXJuIE5VTEw7CiB9CiAKIHZv
aWQgZXRuYXZpdl9pb21tdV9yZXN0b3JlKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1LAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5h
dml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
