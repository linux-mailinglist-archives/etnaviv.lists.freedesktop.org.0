Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A2D9539
	for <lists+etnaviv@lfdr.de>; Wed, 16 Oct 2019 17:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057216E99E;
	Wed, 16 Oct 2019 15:15:01 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F12D6E0CD
 for <etnaviv@lists.freedesktop.org>; Sat, 12 Oct 2019 21:31:10 +0000 (UTC)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2863A20700;
 Sat, 12 Oct 2019 21:31:06 +0000 (UTC)
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] mm: memblock: do not enforce current limit for memblock_phys*
 family
Date: Sun, 13 Oct 2019 00:31:01 +0300
Message-Id: <1570915861-17633-1-git-send-email-rppt@kernel.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 16 Oct 2019 15:15:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570915870;
 bh=OHyj5bDPQVGUT3OAq33STpc0n0zo2JvrtJXGizaQcDY=;
 h=From:To:Cc:Subject:Date:From;
 b=vu47EcJeCFg9jYw+oumKYKxLlJhGtj+LBscpj0cCbgcfqWendWjFUBnPb9d7UXyU8
 fozUFlb1gn+IEfL0TkG5M9th+YM1wqEDBdX2xjWVXFis+BaWkID414k8OGXdcLV0sd
 z1fL/pyGWzYUI4MjFbxiEEIq3qPcDEc/7TTmhbR0=
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Fabio Estevam <festevam@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Adam Ford <aford173@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVW50aWwgY29tbWl0IDky
ZDEyZjk1NDRiNyAoIm1lbWJsb2NrOiByZWZhY3RvciBpbnRlcm5hbCBhbGxvY2F0aW9uCmZ1bmN0
aW9ucyIpIHRoZSBtYXhpbWFsIGFkZHJlc3MgZm9yIG1lbWJsb2NrIGFsbG9jYXRpb25zIHdhcyBm
b3JjZWQgdG8KbWVtYmxvY2suY3VycmVudF9saW1pdCBvbmx5IGZvciB0aGUgYWxsb2NhdGlvbiBm
dW5jdGlvbnMgcmV0dXJuaW5nIHZpcnR1YWwKYWRkcmVzcy4gVGhlIGNoYW5nZXMgaW50cm9kdWNl
ZCBieSB0aGF0IGNvbW1pdCBtb3ZlZCB0aGUgbGltaXQgZW5mb3JjZW1lbnQKaW50byB0aGUgYWxs
b2NhdGlvbiBjb3JlIGFuZCBhcyBhIHJlc3VsdCB0aGUgYWxsb2NhdGlvbiBmdW5jdGlvbnMgcmV0
dXJuaW5nCnBoeXNpY2FsIGFkZHJlc3MgYWxzbyBzdGFydGVkIHRvIGxpbWl0IGFsbG9jYXRpb25z
IHRvCm1lbWJsb2NrLmN1cnJlbnRfbGltaXQuCgpUaGlzIGNhdXNlZCBicmVha2FnZSBvZiBldG5h
dml2IEdQVSBkcml2ZXI6CgpbICAgIDMuNjgyMzQ3XSBldG5hdml2IGV0bmF2aXY6IGJvdW5kIDEz
MDAwMC5ncHUgKG9wcyBncHVfb3BzKQpbICAgIDMuNjg4NjY5XSBldG5hdml2IGV0bmF2aXY6IGJv
dW5kIDEzNDAwMC5ncHUgKG9wcyBncHVfb3BzKQpbICAgIDMuNjk1MDk5XSBldG5hdml2IGV0bmF2
aXY6IGJvdW5kIDIyMDQwMDAuZ3B1IChvcHMgZ3B1X29wcykKWyAgICAzLjcwMDgwMF0gZXRuYXZp
di1ncHUgMTMwMDAwLmdwdTogbW9kZWw6IEdDMjAwMCwgcmV2aXNpb246IDUxMDgKWyAgICAzLjcy
MzAxM10gZXRuYXZpdi1ncHUgMTMwMDAwLmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxp
ZAptZW1vcnkgd2luZG93ClsgICAgMy43MzEzMDhdIGV0bmF2aXYtZ3B1IDEzNDAwMC5ncHU6IG1v
ZGVsOiBHQzMyMCwgcmV2aXNpb246IDUwMDcKWyAgICAzLjc1MjQzN10gZXRuYXZpdi1ncHUgMTM0
MDAwLmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAptZW1vcnkgd2luZG93ClsgICAg
My43NjA1ODNdIGV0bmF2aXYtZ3B1IDIyMDQwMDAuZ3B1OiBtb2RlbDogR0MzNTUsIHJldmlzaW9u
OiAxMjE1ClsgICAgMy43NjY3NjZdIGV0bmF2aXYtZ3B1IDIyMDQwMDAuZ3B1OiBJZ25vcmluZyBH
UFUgd2l0aCBWRyBhbmQgRkUyLjAKClJlc3RvcmUgdGhlIGJlaGF2aW91ciBvZiBtZW1ibG9ja19w
aHlzKiBmYW1pbHkgc28gdGhhdCB0aGVzZSBmdW5jdGlvbnMgd2lsbApub3QgZW5mb3JjZSBtZW1i
bG9jay5jdXJyZW50X2xpbWl0LgoKRml4ZXM6IDkyZDEyZjk1NDRiNyAoIm1lbWJsb2NrOiByZWZh
Y3RvciBpbnRlcm5hbCBhbGxvY2F0aW9uIGZ1bmN0aW9ucyIpClJlcG9ydGVkLWJ5OiBBZGFtIEZv
cmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdt
YWlsLmNvbT4gI2lteDZxLWxvZ2ljcGQKU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBw
dEBsaW51eC5pYm0uY29tPgotLS0KIG1tL21lbWJsb2NrLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9t
ZW1ibG9jay5jIGIvbW0vbWVtYmxvY2suYwppbmRleCA3ZDRmNjFhLi5jNGIxNmNhIDEwMDY0NAot
LS0gYS9tbS9tZW1ibG9jay5jCisrKyBiL21tL21lbWJsb2NrLmMKQEAgLTEzNTYsOSArMTM1Niw2
IEBAIHN0YXRpYyBwaHlzX2FkZHJfdCBfX2luaXQgbWVtYmxvY2tfYWxsb2NfcmFuZ2VfbmlkKHBo
eXNfYWRkcl90IHNpemUsCiAJCWFsaWduID0gU01QX0NBQ0hFX0JZVEVTOwogCX0KIAotCWlmIChl
bmQgPiBtZW1ibG9jay5jdXJyZW50X2xpbWl0KQotCQllbmQgPSBtZW1ibG9jay5jdXJyZW50X2xp
bWl0OwotCiBhZ2FpbjoKIAlmb3VuZCA9IG1lbWJsb2NrX2ZpbmRfaW5fcmFuZ2Vfbm9kZShzaXpl
LCBhbGlnbiwgc3RhcnQsIGVuZCwgbmlkLAogCQkJCQkgICAgZmxhZ3MpOwpAQCAtMTQ2OSw2ICsx
NDY2LDkgQEAgc3RhdGljIHZvaWQgKiBfX2luaXQgbWVtYmxvY2tfYWxsb2NfaW50ZXJuYWwoCiAJ
aWYgKFdBUk5fT05fT05DRShzbGFiX2lzX2F2YWlsYWJsZSgpKSkKIAkJcmV0dXJuIGt6YWxsb2Nf
bm9kZShzaXplLCBHRlBfTk9XQUlULCBuaWQpOwogCisJaWYgKG1heF9hZGRyID4gbWVtYmxvY2su
Y3VycmVudF9saW1pdCkKKwkJbWF4X2FkZHIgPSBtZW1ibG9jay5jdXJyZW50X2xpbWl0OworCiAJ
YWxsb2MgPSBtZW1ibG9ja19hbGxvY19yYW5nZV9uaWQoc2l6ZSwgYWxpZ24sIG1pbl9hZGRyLCBt
YXhfYWRkciwgbmlkKTsKIAogCS8qIHJldHJ5IGFsbG9jYXRpb24gd2l0aG91dCBsb3dlciBsaW1p
dCAqLwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
