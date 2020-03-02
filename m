Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D215217639C
	for <lists+etnaviv@lfdr.de>; Mon,  2 Mar 2020 20:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CF86E7E5;
	Mon,  2 Mar 2020 19:13:44 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E61A6E44E;
 Mon,  2 Mar 2020 19:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 5D92BFB02;
 Mon,  2 Mar 2020 20:13:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3cX07bvLwRke; Mon,  2 Mar 2020 20:13:38 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 8D62340237; Mon,  2 Mar 2020 20:13:36 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] drm/etnaviv: Update idle bits
Date: Mon,  2 Mar 2020 20:13:33 +0100
Message-Id: <29414e54218e74b92342cfebcfbee69ac31546ef.1583176306.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1583176306.git.agx@sigxcpu.org>
References: <cover.1583176306.git.agx@sigxcpu.org>
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

VXBkYXRlIHRoZSBzdGF0ZSBISSBhbmQgY29tbW9uIGhlYWRlciBmcm9tIHJubmRiIGNvbW1pdApj
b21taXQgMTkyODBhOTVhIChybm5kYjogVXBkYXRlIGlkbGUgYml0cykKClNpZ25lZC1vZmYtYnk6
IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvc3RhdGVfaGkueG1sLmggfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9zdGF0ZV9oaS54
bWwuaCBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L3N0YXRlX2hpLnhtbC5oCmluZGV4IDQxZDhk
YTJiNmY0Zi4uOGZlNDU5ODM5NWYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9zdGF0ZV9oaS54bWwuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9zdGF0ZV9oaS54
bWwuaApAQCAtODEsNiArODEsMTMgQEAgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgogI2RlZmlu
ZSBWSVZTX0hJX0lETEVfU1RBVEVfSU0JCQkJCTB4MDAwMDAyMDAKICNkZWZpbmUgVklWU19ISV9J
RExFX1NUQVRFX0ZQCQkJCQkweDAwMDAwNDAwCiAjZGVmaW5lIFZJVlNfSElfSURMRV9TVEFURV9U
UwkJCQkJMHgwMDAwMDgwMAorI2RlZmluZSBWSVZTX0hJX0lETEVfU1RBVEVfQkwJCQkJCTB4MDAw
MDEwMDAKKyNkZWZpbmUgVklWU19ISV9JRExFX1NUQVRFX0FTWU5DRkUJCQkJMHgwMDAwMjAwMAor
I2RlZmluZSBWSVZTX0hJX0lETEVfU1RBVEVfTUMJCQkJCTB4MDAwMDQwMDAKKyNkZWZpbmUgVklW
U19ISV9JRExFX1NUQVRFX1BQQQkJCQkJMHgwMDAwODAwMAorI2RlZmluZSBWSVZTX0hJX0lETEVf
U1RBVEVfV0QJCQkJCTB4MDAwMTAwMDAKKyNkZWZpbmUgVklWU19ISV9JRExFX1NUQVRFX05OCQkJ
CQkweDAwMDIwMDAwCisjZGVmaW5lIFZJVlNfSElfSURMRV9TVEFURV9UUAkJCQkJMHgwMDA0MDAw
MAogI2RlZmluZSBWSVZTX0hJX0lETEVfU1RBVEVfQVhJX0xQCQkJCTB4ODAwMDAwMDAKIAogI2Rl
ZmluZSBWSVZTX0hJX0FYSV9DT05GSUcJCQkJCTB4MDAwMDAwMDgKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5n
IGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2Cg==
