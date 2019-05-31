Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33666311EF
	for <lists+etnaviv@lfdr.de>; Fri, 31 May 2019 18:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B230889237;
	Fri, 31 May 2019 16:05:15 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B0F8967F
 for <etnaviv@lists.freedesktop.org>; Fri, 31 May 2019 16:05:14 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hWk1p-0004G9-0y; Fri, 31 May 2019 18:05:13 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] etnaviv: fix some pm query issues
Date: Fri, 31 May 2019 18:05:12 +0200
Message-Id: <20190531160513.7072-1-l.stach@pengutronix.de>
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
Cc: mesa-dev@lists.freedesktop.org, graphics@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

VGhlIG9mZnNldHMgdG8gcmVhZCB0aGUgcXVlcnkgcmVzdWx0cyB3ZXJlIG9mZi1ieS1vbmUsIHdo
aWNoIGNhdXNlcyB0aGUKY291bnRlcnMgdG8gcmVwb3J0IGJvZ3VzIGluY3JlYXNpbmcgdmFsdWVz
LgoKQWxzbyB0aGUgY291bnRlciByZXN1bHQgaXMgdTMyLCBzbyB3ZSBuZWVkIHRvIGluaXRpYWxp
emUgdGhlIHF1ZXJ5IHR5cGUKdG8gcmVmbGVjdCB0aGF0LgoKU2lnbmVkLW9mZi1ieTogTHVjYXMg
U3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Ci0tLQpUaGlzIG9ubHkgZml4ZXMgdGhlIG9i
dmlvdXMgaXNzdWVzLiBJIHN0aWxsIGJlbGlldmUgdGhlcmUgYXJlIHNvbWUKR1BVL0NQVSBzeW5j
aHJvbml6YXRpb24gaXNzdWVzIGluIHRoaXMgY29kZSwgdGhhdCBuZWVkIHRvIGJlIGZpeGVkCnNl
cGFyYXRlbHkuCi0tLQogc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfcXVlcnlf
cG0uYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2
aXZfcXVlcnlfcG0uYyBiL3NyYy9nYWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5hdml2X3F1ZXJ5
X3BtLmMKaW5kZXggYWRlMGI5NzkwYzI4Li5jNjNlZDgzMDQ5MTkgMTAwNjQ0Ci0tLSBhL3NyYy9n
YWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5hdml2X3F1ZXJ5X3BtLmMKKysrIGIvc3JjL2dhbGxp
dW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfcXVlcnlfcG0uYwpAQCAtNDg1LDkgKzQ4NSw5IEBA
IGV0bmFfcG1fcXVlcnlfZ2V0KHN0cnVjdCBldG5hX2NtZF9zdHJlYW0gKnN0cmVhbSwgc3RydWN0
IGV0bmFfcXVlcnkgKnEsCiAgICBhc3NlcnQoZmxhZ3MpOwogCiAgICBpZiAoZmxhZ3MgPT0gRVRO
QV9QTV9QUk9DRVNTX1BSRSkKLSAgICAgIG9mZnNldCA9IDI7CisgICAgICBvZmZzZXQgPSAxOwog
ICAgZWxzZQotICAgICAgb2Zmc2V0ID0gMzsKKyAgICAgIG9mZnNldCA9IDI7CiAKICAgIHN0cnVj
dCBldG5hX3BlcmYgcCA9IHsKICAgICAgIC5mbGFncyA9IGZsYWdzLApAQCAtNjM5LDYgKzYzOSwx
MCBAQCBldG5hX3BtX2dldF9kcml2ZXJfcXVlcnlfaW5mbyhzdHJ1Y3QgcGlwZV9zY3JlZW4gKnBz
Y3JlZW4sIHVuc2lnbmVkIGluZGV4LAogICAgaW5mby0+bmFtZSA9IHF1ZXJ5X2NvbmZpZ1tpXS5u
YW1lOwogICAgaW5mby0+cXVlcnlfdHlwZSA9IHF1ZXJ5X2NvbmZpZ1tpXS50eXBlOwogICAgaW5m
by0+Z3JvdXBfaWQgPSBxdWVyeV9jb25maWdbaV0uZ3JvdXBfaWQ7CisgICBpbmZvLT50eXBlID0g
UElQRV9EUklWRVJfUVVFUllfVFlQRV9VSU5UOworICAgaW5mby0+cmVzdWx0X3R5cGUgPSBQSVBF
X0RSSVZFUl9RVUVSWV9SRVNVTFRfVFlQRV9BVkVSQUdFOworICAgaW5mby0+bWF4X3ZhbHVlLnUz
MiA9IDA7CisgICBpbmZvLT5mbGFncyA9IDA7CiAKICAgIHJldHVybiAxOwogfQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2
IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
