Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 974512DB49
	for <lists+etnaviv@lfdr.de>; Wed, 29 May 2019 13:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8F36E25D;
	Wed, 29 May 2019 11:00:20 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79D16E04B
 for <etnaviv@lists.freedesktop.org>; Wed, 29 May 2019 10:43:27 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hVw3A-00016K-Ch; Wed, 29 May 2019 12:43:16 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>, Yue Hu <huyue2@yulong.com>,
 =?UTF-8?q?Micha=C5=82=20Nazarewicz?= <mina86@mina86.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dmitry Vyukov <dvyukov@google.com>
Subject: [PATCH 2/2] drm/etnaviv: use CMA area to compute linear window offset
 if possible
Date: Wed, 29 May 2019 12:43:12 +0200
Message-Id: <20190529104312.27835-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529104312.27835-1-l.stach@pengutronix.de>
References: <20190529104312.27835-1-l.stach@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 29 May 2019 11:00:19 +0000
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
Cc: kernel@pengutronix.de, linux-mm@kvack.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

VGhlIGRtYV9yZXF1aXJlZF9tYXNrIG1pZ2h0IG92ZXJlc3RpbWF0ZSB0aGUgbWVtb3J5IHNpemUs
IG9yIG1pZ2h0IG5vdCBtYXRjaAp1cCB3aXRoIHRoZSBDTUEgYXJlYSBwbGFjZW1lbnQgZm9yIG90
aGVyIHJlYXNvbnMuIEdldCB0aGUgaW5mb3JtYXRpb24gYWJvdXQKQ01BIGFyZWEgcGxhY2VtZW50
IGRpcmVjdGx5IGZyb20gQ01BIHdoZXJlIGl0IGlzIGF2YWlsYWJsZSwgYnV0IGtlZXAgdGhlCmRt
YV9yZXF1aXJlZF9tYXNrIGFzIGFuIGFwcHJveGltYXRlIGZhbGxiYWNrIGZvciBhcmNoaXRlY3R1
cmVzIHdoZXJlIENNQSBpcwpub3QgYXZhaWxhYmxlLgoKU2lnbmVkLW9mZi1ieTogTHVjYXMgU3Rh
Y2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYv
ZXRuYXZpdl9ncHUuYyB8IDE1ICsrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
Z3B1LmMKaW5kZXggNzJkMDFlODczMTYwLi5iMTQ0ZjFiYmJiM2MgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9ncHUuYwpAQCAtNCw3ICs0LDkgQEAKICAqLwogCiAjaW5jbHVkZSA8bGlu
dXgvY2xrLmg+CisjaW5jbHVkZSA8bGludXgvY21hLmg+CiAjaW5jbHVkZSA8bGludXgvY29tcG9u
ZW50Lmg+CisjaW5jbHVkZSA8bGludXgvZG1hLWNvbnRpZ3VvdXMuaD4KICNpbmNsdWRlIDxsaW51
eC9kbWEtZmVuY2UuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPgogI2luY2x1ZGUg
PGxpbnV4L29mX2RldmljZS5oPgpAQCAtNzI0LDExICs3MjYsMTggQEAgaW50IGV0bmF2aXZfZ3B1
X2luaXQoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpCiAJICovCiAJaWYgKCEoZ3B1LT5pZGVudGl0
eS5mZWF0dXJlcyAmIGNoaXBGZWF0dXJlc19QSVBFXzNEKSB8fAogCSAgICAoZ3B1LT5pZGVudGl0
eS5taW5vcl9mZWF0dXJlczAgJiBjaGlwTWlub3JGZWF0dXJlczBfTUMyMCkpIHsKLQkJdTMyIGRt
YV9tYXNrID0gKHUzMilkbWFfZ2V0X3JlcXVpcmVkX21hc2soZ3B1LT5kZXYpOwotCQlpZiAoZG1h
X21hc2sgPCBQSFlTX09GRlNFVCArIFNaXzJHKQorCQlzdHJ1Y3QgY21hICpjbWEgPSBkZXZfZ2V0
X2NtYV9hcmVhKGdwdS0+ZGV2KTsKKwkJcGh5c19hZGRyX3QgZW5kX21hc2s7CisKKwkJaWYgKGNt
YSkKKwkJCWVuZF9tYXNrID0gY21hX2dldF9iYXNlKGNtYSkgLSAxICsgY21hX2dldF9zaXplKGNt
YSk7CisJCWVsc2UKKwkJCWVuZF9tYXNrID0gZG1hX2dldF9yZXF1aXJlZF9tYXNrKGdwdS0+ZGV2
KTsKKworCQlpZiAoZW5kX21hc2sgPCBQSFlTX09GRlNFVCArIFNaXzJHKQogCQkJZ3B1LT5tZW1v
cnlfYmFzZSA9IFBIWVNfT0ZGU0VUOwogCQllbHNlCi0JCQlncHUtPm1lbW9yeV9iYXNlID0gZG1h
X21hc2sgLSBTWl8yRyArIDE7CisJCQlncHUtPm1lbW9yeV9iYXNlID0gZW5kX21hc2sgLSBTWl8y
RyArIDE7CiAJfSBlbHNlIGlmIChQSFlTX09GRlNFVCA+PSBTWl8yRykgewogCQlkZXZfaW5mbyhn
cHUtPmRldiwgIk5lZWQgdG8gbW92ZSBsaW5lYXIgd2luZG93IG9uIE1DMS4wLCBkaXNhYmxpbmcg
VFNcbiIpOwogCQlncHUtPm1lbW9yeV9iYXNlID0gUEhZU19PRkZTRVQ7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFp
bGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
