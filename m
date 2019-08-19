Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D19BEEF
	for <lists+etnaviv@lfdr.de>; Sat, 24 Aug 2019 19:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B959D6E0D9;
	Sat, 24 Aug 2019 17:02:48 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 921 seconds by postgrey-1.36 at gabe;
 Mon, 19 Aug 2019 06:29:09 UTC
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423B588E7E
 for <etnaviv@lists.freedesktop.org>; Mon, 19 Aug 2019 06:29:09 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B9C35382D04232DAEC32;
 Mon, 19 Aug 2019 14:13:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Mon, 19 Aug 2019 14:13:34 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm/etnaviv: fix missing unlock on error in
 etnaviv_iommuv1_context_alloc()
Date: Mon, 19 Aug 2019 06:17:33 +0000
Message-ID: <20190819061733.50023-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 24 Aug 2019 17:02:47 +0000
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
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QWRkIHRoZSBtaXNzaW5nIHVubG9jayBiZWZvcmUgcmV0dXJuIGZyb20gZnVuY3Rpb24gZXRuYXZp
dl9pb21tdXYxX2NvbnRleHRfYWxsb2MoKQppbiB0aGUgZXJyb3IgaGFuZGxpbmcgY2FzZS4KCkZp
eGVzOiAyN2I2NzI3OGUwMDcgKCJkcm0vZXRuYXZpdjogcmV3b3JrIE1NVSBoYW5kbGluZyIpClNp
Z25lZC1vZmYtYnk6IFdlaSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXUuYyB8IDQgKysrLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfaW9tbXUuYwppbmRleCBhYWM4ZGJmM2VhNTYuLjFhN2M4OWE2N2JlYSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9pb21tdS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXUuYwpAQCAtMTQwLDggKzE0MCwxMCBA
QCBldG5hdml2X2lvbW11djFfY29udGV4dF9hbGxvYyhzdHJ1Y3QgZXRuYXZpdl9pb21tdV9nbG9i
YWwgKmdsb2JhbCkKIAl9CiAKIAl2MV9jb250ZXh0ID0ga3phbGxvYyhzaXplb2YoKnYxX2NvbnRl
eHQpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXYxX2NvbnRleHQpCisJaWYgKCF2MV9jb250ZXh0KSB7
CisJCW11dGV4X3VubG9jaygmZ2xvYmFsLT5sb2NrKTsKIAkJcmV0dXJuIE5VTEw7CisJfQogCiAJ
djFfY29udGV4dC0+cGd0YWJsZV9jcHUgPSBkbWFfYWxsb2Nfd2MoZ2xvYmFsLT5kZXYsIFBUX1NJ
WkUsCiAJCQkJCSAgICAgICAmdjFfY29udGV4dC0+cGd0YWJsZV9kbWEsCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0
CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
