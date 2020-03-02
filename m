Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF20A176397
	for <lists+etnaviv@lfdr.de>; Mon,  2 Mar 2020 20:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7536D6E7E6;
	Mon,  2 Mar 2020 19:13:43 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4E96E44E;
 Mon,  2 Mar 2020 19:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6B447FB08;
 Mon,  2 Mar 2020 20:13:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lt_4OpfdEgK8; Mon,  2 Mar 2020 20:13:37 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 76A544048B; Mon,  2 Mar 2020 20:13:36 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] drm/etnaviv: Ignore MC bit when checking for runtime
 suspend
Date: Mon,  2 Mar 2020 20:13:31 +0100
Message-Id: <cover.1583176306.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QXQgbGVhc3QgR0M3MDAwIGZhaWxzIHRvIGVudGVyIHJ1bnRpbWUgc3VzcGVuZCBmb3IgbG9uZyBw
ZXJpb2RzIG9mIHRpbWUgc2luY2UKdGhlIE1DIGJlY29tZXMgYnVzeSBhZ2FpbiBldmVuIHdoZW4g
dGhlIEZFIGlzIGlkbGUuIFRoZSByZXN0IG9mIHRoZSBzZXJpZXMKbWFrZXMgZGV0ZWN0aW5nIHNp
bWlsYXIgaXNzdWVzIGVhc2llciB0byBkZWJ1ZyBpbiB0aGUgZnV0dXJlIGJ5IGNoZWNraW5nCmFs
bCBrbm93biBiaXRzIGluIGRlYnVnZnMgYW5kIGFsc28gd2FybmluZyBpbiB0aGUgRUJVU1kgY2Fz
ZS4KClRlc3RlZCBvbiBHQzcwMDAgd2l0aCBhIHJlZHVjZWQgcnVudGltZSBkZWxheSBvZiA1MG1z
LiBQYXRjaGVzIGFyZQphZ2FpbnN0IG5leHQtMjAyMDAyMjYuCgpUaGFua3MgdG8gTHVjYXMgU3Rh
Y2ggZm9yIHBvaW50aW5nIG1lIGluIHRoZSByaWdodCBkaXJlY3Rpb24uCgpHdWlkbyBHw7xudGhl
ciAoNSk6CiAgZHJtL2V0bmF2aXY6IEZpeCB0eXBvIGluIGNvbW1lbnQKICBkcm0vZXRuYXZpdjog
VXBkYXRlIGlkbGUgYml0cwogIGRybS9ldG5hdml2OiBDb25zaWRlciBhbGwga3dub3duIGlkbGUg
Yml0cyBpbiBkZWJ1Z2ZzCiAgZHJtL2V0bmF2aXY6IElnbm9yZSBNQyB3aGVuIGNoZWNraW5nIHJ1
bnRpbWUgc3VzcGVuZCBpZGxlbmVzcwogIGRybS9ldG5hdml2OiBXYXJuIHdoZW4gR1BVIGRvZXNu
J3QgaWRsZSBmYXN0IGVub3VnaAoKIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1
LmMgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L3N0YXRlX2hpLnhtbC5oIHwgIDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZp
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ldG5hdml2Cg==
