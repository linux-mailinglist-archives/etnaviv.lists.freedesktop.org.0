Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D78873BCCBA
	for <lists+etnaviv@lfdr.de>; Tue,  6 Jul 2021 13:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686C66E239;
	Tue,  6 Jul 2021 11:18:30 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A37A6E235;
 Tue,  6 Jul 2021 11:18:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E91261CC8;
 Tue,  6 Jul 2021 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570309;
 bh=LfGM5sFaMdk8HgCqOUksC356f/Tvj0fPbKK+2H6H4OY=;
 h=From:To:Cc:Subject:Date:From;
 b=Ps/+4GQxSz0L7IPE3f/sgCsYbqO7y3lckoNg0GaOJfvZZr3ynPoZasBErR+vjVXLk
 ncyANhyLFeW0lhP9Hka2Ek4Ss9L+Viu+r1E9Ln4SUTCXb8oYeleB87uDmnfp9ETAgA
 LPuf03RcJ9zRQWYYA4OvawCAyrkoKjqQVXT2GnMevj+XDNXzhI/FHgeYn+fZzfczh4
 G3rRyZVbjRlMI3GoduYdbgtnzksL1WIT/hmL6Ldwhijn8m1KcKJwgMWkPF50X1aL64
 dg2LWAVIAUPnati3Eg1hTT7iYYR5ry6WKg5MMd+WYrkVVTQiO3UBJOgsYvKYVnVc4S
 tSbN4Cml02UPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 001/160] drm/etnaviv: fix NULL check before some
 freeing functions is not needed
Date: Tue,  6 Jul 2021 07:15:47 -0400
Message-Id: <20210706111827.2060499-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: etnaviv@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <etnaviv.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/etnaviv>
List-Post: <mailto:etnaviv@lists.freedesktop.org>
List-Help: <mailto:etnaviv-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tian Tao <tiantao6@hisilicon.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

RnJvbTogVGlhbiBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCA3ZDYxNGFiMmYyMDUwM2VkODc2NjM2M2Q0MWY4NjA3MzM3NTcxYWRmIF0KCmZpeGVkIHRoZSBi
ZWxvdyB3YXJuaW5nOgpkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9wcmltZS5j
Ojg0OjItODogV0FSTklORzogTlVMTCBjaGVjawpiZWZvcmUgc29tZSBmcmVlaW5nIGZ1bmN0aW9u
cyBpcyBub3QgbmVlZGVkLgoKU2lnbmVkLW9mZi1ieTogVGlhbiBUYW8gPHRpYW50YW82QGhpc2ls
aWNvbi5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRl
PgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fcHJpbWUuYyB8IDMgKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZ2VtX3ByaW1lLmMKaW5kZXggYjM5MGRkNGQ2MGI3Li5kNzQxYjFk
NzM1ZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtX3By
aW1lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fcHJpbWUuYwpA
QCAtODAsOCArODAsNyBAQCBzdGF0aWMgdm9pZCBldG5hdml2X2dlbV9wcmltZV9yZWxlYXNlKHN0
cnVjdCBldG5hdml2X2dlbV9vYmplY3QgKmV0bmF2aXZfb2JqKQogCS8qIERvbid0IGRyb3AgdGhl
IHBhZ2VzIGZvciBpbXBvcnRlZCBkbWFidWYsIGFzIHRoZXkgYXJlIG5vdAogCSAqIG91cnMsIGp1
c3QgZnJlZSB0aGUgYXJyYXkgd2UgYWxsb2NhdGVkOgogCSAqLwotCWlmIChldG5hdml2X29iai0+
cGFnZXMpCi0JCWt2ZnJlZShldG5hdml2X29iai0+cGFnZXMpOworCWt2ZnJlZShldG5hdml2X29i
ai0+cGFnZXMpOwogCiAJZHJtX3ByaW1lX2dlbV9kZXN0cm95KCZldG5hdml2X29iai0+YmFzZSwg
ZXRuYXZpdl9vYmotPnNndCk7CiB9Ci0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZXRuYXZpdgo=
