Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761D12B36
	for <lists+etnaviv@lfdr.de>; Fri,  3 May 2019 12:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B358981D;
	Fri,  3 May 2019 10:05:32 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9F189548
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2019 10:05:31 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hMV4L-00040v-HW; Fri, 03 May 2019 12:05:29 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: mesa-dev@lists.freedesktop.org
Subject: [PATCH] etnaviv: fill missing offset in etna_resource_get_handle
Date: Fri,  3 May 2019 12:05:24 +0200
Message-Id: <20190503100524.23232-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: graphics@pengutronix.de, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

V2l0aG91dCB0aGlzIGdibV9ib19nZXRfb2Zmc2V0KCkgY2FuIHJldHVybiAwIHdoZXJlIGl0IHNo
b3VsZG4ndC4KLS0tCiBzcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9yZXNvdXJj
ZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9z
cmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9yZXNvdXJjZS5jIGIvc3JjL2dhbGxp
dW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfcmVzb3VyY2UuYwppbmRleCA4MzE3OWQzY2QwODgu
LmFiNzdhODBjNzJiMyAxMDA2NDQKLS0tIGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0
bmF2aXZfcmVzb3VyY2UuYworKysgYi9zcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZp
dl9yZXNvdXJjZS5jCkBAIC02MjIsNiArNjIyLDcgQEAgZXRuYV9yZXNvdXJjZV9nZXRfaGFuZGxl
KHN0cnVjdCBwaXBlX3NjcmVlbiAqcHNjcmVlbiwKICAgICAgIHJzYyA9IGV0bmFfcmVzb3VyY2Uo
cnNjLT5leHRlcm5hbCk7CiAKICAgIGhhbmRsZS0+c3RyaWRlID0gcnNjLT5sZXZlbHNbMF0uc3Ry
aWRlOworICAgaGFuZGxlLT5vZmZzZXQgPSByc2MtPmxldmVsc1swXS5vZmZzZXQ7CiAgICBoYW5k
bGUtPm1vZGlmaWVyID0gbGF5b3V0X3RvX21vZGlmaWVyKHJzYy0+bGF5b3V0KTsKIAogICAgaWYg
KGhhbmRsZS0+dHlwZSA9PSBXSU5TWVNfSEFORExFX1RZUEVfU0hBUkVEKSB7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYg
bWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
