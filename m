Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFD487941
	for <lists+etnaviv@lfdr.de>; Fri,  9 Aug 2019 14:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C79A892F1;
	Fri,  9 Aug 2019 12:04:27 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455E889209
 for <etnaviv@lists.freedesktop.org>; Fri,  9 Aug 2019 12:04:26 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hw3dA-00055N-DU; Fri, 09 Aug 2019 14:04:24 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH v3 7/8] drm/etnaviv: provide MMU context to
 etnaviv_gem_mapping_get
Date: Fri,  9 Aug 2019 14:04:23 +0200
Message-Id: <20190809120424.32679-7-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809120424.32679-1-l.stach@pengutronix.de>
References: <20190809120424.32679-1-l.stach@pengutronix.de>
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

SW4gcHJlcGFyYXRpb24gdG8gaGF2aW5nIGEgY29udGV4dCBwZXIgcHJvY2VzcywgZXRuYXZpdl9n
ZW1fbWFwcGluZ19nZXQKc2hvdWxkIG5vdCB1c2UgdGhlIGN1cnJlbnQgR1BVIGNvbnRleHQsIGJ1
dCBuZWVkcyB0byBiZSB0b2xkIHdoaWNoCmNvbnRleHQgdG8gdXNlLgoKU2lnbmVkLW9mZi1ieTog
THVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+ClJldmlld2VkLWJ5OiBQaGlsaXBw
IFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfZ2VtLmMgICAgICAgIHwgMjIgKysrKysrKysrKysrLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmggICAgICAgIHwgIDMgKystCiBkcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYyB8ICAzICsrLQogMyBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9nZW0uYwppbmRleCAwY2NjM2M0ZGZmYzQuLjA0YzgxNzBmNzZjZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jCkBAIC0yNDgsNyArMjQ4LDggQEAgdm9p
ZCBldG5hdml2X2dlbV9tYXBwaW5nX3VucmVmZXJlbmNlKHN0cnVjdCBldG5hdml2X3ZyYW1fbWFw
cGluZyAqbWFwcGluZykKIH0KIAogc3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICpldG5hdml2
X2dlbV9tYXBwaW5nX2dldCgKLQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGV0
bmF2aXZfZ3B1ICpncHUpCisJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBldG5h
dml2X2dwdSAqZ3B1LAorCXN0cnVjdCBldG5hdml2X2lvbW11X2NvbnRleHQgKm1tdV9jb250ZXh0
KQogewogCXN0cnVjdCBldG5hdml2X2dlbV9vYmplY3QgKmV0bmF2aXZfb2JqID0gdG9fZXRuYXZp
dl9ibyhvYmopOwogCXN0cnVjdCBldG5hdml2X3ZyYW1fbWFwcGluZyAqbWFwcGluZzsKQEAgLTI1
Niw3ICsyNTcsNyBAQCBzdHJ1Y3QgZXRuYXZpdl92cmFtX21hcHBpbmcgKmV0bmF2aXZfZ2VtX21h
cHBpbmdfZ2V0KAogCWludCByZXQgPSAwOwogCiAJbXV0ZXhfbG9jaygmZXRuYXZpdl9vYmotPmxv
Y2spOwotCW1hcHBpbmcgPSBldG5hdml2X2dlbV9nZXRfdnJhbV9tYXBwaW5nKGV0bmF2aXZfb2Jq
LCBncHUtPm1tdV9jb250ZXh0KTsKKwltYXBwaW5nID0gZXRuYXZpdl9nZW1fZ2V0X3ZyYW1fbWFw
cGluZyhldG5hdml2X29iaiwgbW11X2NvbnRleHQpOwogCWlmIChtYXBwaW5nKSB7CiAJCS8qCiAJ
CSAqIEhvbGRpbmcgdGhlIG9iamVjdCBsb2NrIHByZXZlbnRzIHRoZSB1c2UgY291bnQgY2hhbmdp
bmcKQEAgLTI2NSwxMiArMjY2LDEyIEBAIHN0cnVjdCBldG5hdml2X3ZyYW1fbWFwcGluZyAqZXRu
YXZpdl9nZW1fbWFwcGluZ19nZXQoCiAJCSAqIHRoZSBNTVUgb3ducyB0aGlzIG1hcHBpbmcgdG8g
Y2xvc2UgdGhpcyByYWNlLgogCQkgKi8KIAkJaWYgKG1hcHBpbmctPnVzZSA9PSAwKSB7Ci0JCQlt
dXRleF9sb2NrKCZncHUtPm1tdV9jb250ZXh0LT5sb2NrKTsKLQkJCWlmIChtYXBwaW5nLT5jb250
ZXh0ID09IGdwdS0+bW11X2NvbnRleHQpCisJCQltdXRleF9sb2NrKCZtbXVfY29udGV4dC0+bG9j
ayk7CisJCQlpZiAobWFwcGluZy0+Y29udGV4dCA9PSBtbXVfY29udGV4dCkKIAkJCQltYXBwaW5n
LT51c2UgKz0gMTsKIAkJCWVsc2UKIAkJCQltYXBwaW5nID0gTlVMTDsKLQkJCW11dGV4X3VubG9j
aygmZ3B1LT5tbXVfY29udGV4dC0+bG9jayk7CisJCQltdXRleF91bmxvY2soJm1tdV9jb250ZXh0
LT5sb2NrKTsKIAkJCWlmIChtYXBwaW5nKQogCQkJCWdvdG8gb3V0OwogCQl9IGVsc2UgewpAQCAt
MzAzLDExICszMDQsMTIgQEAgc3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICpldG5hdml2X2dl
bV9tYXBwaW5nX2dldCgKIAkJbGlzdF9kZWwoJm1hcHBpbmctPm9ial9ub2RlKTsKIAl9CiAKLQlt
YXBwaW5nLT5jb250ZXh0ID0gZ3B1LT5tbXVfY29udGV4dDsKKwlldG5hdml2X2lvbW11X2NvbnRl
eHRfZ2V0KG1tdV9jb250ZXh0KTsKKwltYXBwaW5nLT5jb250ZXh0ID0gbW11X2NvbnRleHQ7CiAJ
bWFwcGluZy0+dXNlID0gMTsKIAotCXJldCA9IGV0bmF2aXZfaW9tbXVfbWFwX2dlbShncHUtPm1t
dV9jb250ZXh0LCBldG5hdml2X29iaiwKLQkJCQkgICAgZ3B1LT5tZW1vcnlfYmFzZSwgbWFwcGlu
Zyk7CisJcmV0ID0gZXRuYXZpdl9pb21tdV9tYXBfZ2VtKG1tdV9jb250ZXh0LCBldG5hdml2X29i
aiwgZ3B1LT5tZW1vcnlfYmFzZSwKKwkJCQkgICAgbWFwcGluZyk7CiAJaWYgKHJldCA8IDApCiAJ
CWtmcmVlKG1hcHBpbmcpOwogCWVsc2UKQEAgLTUyOSw4ICs1MzEsMTAgQEAgdm9pZCBldG5hdml2
X2dlbV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKIAogCQlXQVJOX09O
KG1hcHBpbmctPnVzZSk7CiAKLQkJaWYgKGNvbnRleHQpCisJCWlmIChjb250ZXh0KSB7CiAJCQll
dG5hdml2X2lvbW11X3VubWFwX2dlbShjb250ZXh0LCBtYXBwaW5nKTsKKwkJCWV0bmF2aXZfaW9t
bXVfY29udGV4dF9wdXQoY29udGV4dCk7CisJCX0KIAogCQlsaXN0X2RlbCgmbWFwcGluZy0+b2Jq
X25vZGUpOwogCQlrZnJlZShtYXBwaW5nKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9l
dG5hdml2L2V0bmF2aXZfZ2VtLmggYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dl
bS5oCmluZGV4IDVhMDA0ZDVlNGVhYS4uZjM0MjU2MGI1OTM4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfZ2VtLmgKQEAgLTExOSw3ICsxMTksOCBAQCBzdHJ1Y3QgcGFnZSAqKmV0bmF2
aXZfZ2VtX2dldF9wYWdlcyhzdHJ1Y3QgZXRuYXZpdl9nZW1fb2JqZWN0ICpvYmopOwogdm9pZCBl
dG5hdml2X2dlbV9wdXRfcGFnZXMoc3RydWN0IGV0bmF2aXZfZ2VtX29iamVjdCAqb2JqKTsKIAog
c3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICpldG5hdml2X2dlbV9tYXBwaW5nX2dldCgKLQlz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpOworCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwKKwlzdHJ1
Y3QgZXRuYXZpdl9pb21tdV9jb250ZXh0ICptbXVfY29udGV4dCk7CiB2b2lkIGV0bmF2aXZfZ2Vt
X21hcHBpbmdfdW5yZWZlcmVuY2Uoc3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICptYXBwaW5n
KTsKIAogI2VuZGlmIC8qIF9fRVROQVZJVl9HRU1fSF9fICovCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9l
dG5hdml2L2V0bmF2aXZfZ2VtX3N1Ym1pdC5jCmluZGV4IDNmNGY2YWIzODhkZS4uNzkyOWQyNThk
YWY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJt
aXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYwpA
QCAtMjI0LDcgKzIyNCw4IEBAIHN0YXRpYyBpbnQgc3VibWl0X3Bpbl9vYmplY3RzKHN0cnVjdCBl
dG5hdml2X2dlbV9zdWJtaXQgKnN1Ym1pdCkKIAkJc3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5n
ICptYXBwaW5nOwogCiAJCW1hcHBpbmcgPSBldG5hdml2X2dlbV9tYXBwaW5nX2dldCgmZXRuYXZp
dl9vYmotPmJhc2UsCi0JCQkJCQkgIHN1Ym1pdC0+Z3B1KTsKKwkJCQkJCSAgc3VibWl0LT5ncHUs
CisJCQkJCQkgIHN1Ym1pdC0+Z3B1LT5tbXVfY29udGV4dCk7CiAJCWlmIChJU19FUlIobWFwcGlu
ZykpIHsKIAkJCXJldCA9IFBUUl9FUlIobWFwcGluZyk7CiAJCQlicmVhazsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBt
YWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
