Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3645D2DA01
	for <lists+etnaviv@lfdr.de>; Wed, 29 May 2019 12:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA4189CE0;
	Wed, 29 May 2019 10:08:36 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FF26E0CC
 for <etnaviv@lists.freedesktop.org>; Wed, 29 May 2019 10:08:35 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hVvVa-0004gP-7i; Wed, 29 May 2019 12:08:34 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH libdrm] etnaviv: drop etna_bo_from_handle symbol
Date: Wed, 29 May 2019 12:08:34 +0200
Message-Id: <20190529100834.32278-1-l.stach@pengutronix.de>
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
Cc: mesa-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gaW1wbGVtZW50YXRpb24gYW5kIGFsc28gbm8gdXNlcnMsIHNvIHRoZXJlIGlz
IG5vIHBvaW50CmluIGtlZXBpbmcgaXQgaW4gdGhlIEFQSS4KClNpZ25lZC1vZmYtYnk6IEx1Y2Fz
IFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgotLS0KIGV0bmF2aXYvZXRuYXZpdi1zeW1i
b2wtY2hlY2sgfCAxIC0KIGV0bmF2aXYvZXRuYXZpdl9kcm1pZi5oICAgICAgfCAyIC0tCiAyIGZp
bGVzIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZXRuYXZpdi9ldG5hdml2
LXN5bWJvbC1jaGVjayBiL2V0bmF2aXYvZXRuYXZpdi1zeW1ib2wtY2hlY2sKaW5kZXggMGUyMDMw
ZTQ2NzJmLi45NjU4NzAyMzYxMTEgMTAwNzU1Ci0tLSBhL2V0bmF2aXYvZXRuYXZpdi1zeW1ib2wt
Y2hlY2sKKysrIGIvZXRuYXZpdi9ldG5hdml2LXN5bWJvbC1jaGVjawpAQCAtMjMsNyArMjMsNiBA
QCBldG5hX3BpcGVfZGVsCiBldG5hX3BpcGVfd2FpdAogZXRuYV9waXBlX3dhaXRfbnMKIGV0bmFf
Ym9fbmV3Ci1ldG5hX2JvX2Zyb21faGFuZGxlCiBldG5hX2JvX2Zyb21fbmFtZQogZXRuYV9ib19m
cm9tX2RtYWJ1ZgogZXRuYV9ib19yZWYKZGlmZiAtLWdpdCBhL2V0bmF2aXYvZXRuYXZpdl9kcm1p
Zi5oIGIvZXRuYXZpdi9ldG5hdml2X2RybWlmLmgKaW5kZXggODc3MDRhY2QzNDY5Li4xOThiYjQy
OWFkYTIgMTAwNjQ0Ci0tLSBhL2V0bmF2aXYvZXRuYXZpdl9kcm1pZi5oCisrKyBiL2V0bmF2aXYv
ZXRuYXZpdl9kcm1pZi5oCkBAIC0xMTIsOCArMTEyLDYgQEAgaW50IGV0bmFfcGlwZV93YWl0X25z
KHN0cnVjdCBldG5hX3BpcGUgKnBpcGUsIHVpbnQzMl90IHRpbWVzdGFtcCwgdWludDY0X3QgbnMp
OwogCiBzdHJ1Y3QgZXRuYV9ibyAqZXRuYV9ib19uZXcoc3RydWN0IGV0bmFfZGV2aWNlICpkZXYs
CiAJCXVpbnQzMl90IHNpemUsIHVpbnQzMl90IGZsYWdzKTsKLXN0cnVjdCBldG5hX2JvICpldG5h
X2JvX2Zyb21faGFuZGxlKHN0cnVjdCBldG5hX2RldmljZSAqZGV2LAotCQl1aW50MzJfdCBoYW5k
bGUsIHVpbnQzMl90IHNpemUpOwogc3RydWN0IGV0bmFfYm8gKmV0bmFfYm9fZnJvbV9uYW1lKHN0
cnVjdCBldG5hX2RldmljZSAqZGV2LCB1aW50MzJfdCBuYW1lKTsKIHN0cnVjdCBldG5hX2JvICpl
dG5hX2JvX2Zyb21fZG1hYnVmKHN0cnVjdCBldG5hX2RldmljZSAqZGV2LCBpbnQgZmQpOwogc3Ry
dWN0IGV0bmFfYm8gKmV0bmFfYm9fcmVmKHN0cnVjdCBldG5hX2JvICpibyk7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYg
bWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
