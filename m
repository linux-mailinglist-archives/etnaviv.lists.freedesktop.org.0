Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1446F7916
	for <lists+etnaviv@lfdr.de>; Mon, 11 Nov 2019 17:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBF96E24E;
	Mon, 11 Nov 2019 16:47:33 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 314 seconds by postgrey-1.36 at gabe;
 Mon, 11 Nov 2019 16:31:13 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353176E94C
 for <etnaviv@lists.freedesktop.org>; Mon, 11 Nov 2019 16:31:12 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MORR2-1iGX0h2h7G-00PwVX; Mon, 11 Nov 2019 17:25:53 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 1/2] drm/etnaviv: reject timeouts with tv_nsec >= NSEC_PER_SEC
Date: Mon, 11 Nov 2019 17:25:31 +0100
Message-Id: <20191111162547.2221524-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y9yDrcxX3JXaAKVSf2Wk0UqIhlycN6gZyle2jPk/xT9EE6YMi9D
 7ymITaQ7apv6xrtn0JzSfzsgJB9I6691k3NAhZROfyW9sb573cpSp1BArGRozUJ7yf1BahM
 n/iqnEfl6KDsP8LVgANAzfDxR4X/WyOKAK5s0v5Ld/9s1SATJqUXjo4weaeUxCyiqTwRkbu
 GAzwQeVhb9Mm+uAWzRSiQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Oa5rrij3Eoc=:N6romkfBSjcZLjeAZvObsg
 C/7Pff3UsYQL3M2/1iCQTsjOvwrp9czmx0n3LFCsl/z/2vmGJrdeiTdfverdiufBCYAU7UGtK
 UNu9HB/Eu45RY2Sv5sWJue+e9yD0LzMCEX1ry/IiGAIuXWDbQRx9xmSFSSxRToEinq5syuS2l
 0e4w2ID5RP17lzaDtEM6wai6CDKk5q5uTOifKf8dB+6cItIEZ0YbYNUGpjYhPgtJX0GQZgtes
 ViM+pAG9mWuESa/OD4hGn0E5/uJJdBgjESpppxewd7vZvZ8Mzlsw/G7B/DDVl4MgH0B4bCjOJ
 bS8R7r/W0lRnAx5FsJnbD6ct4HN6FTJPRVsH9PSDo0vKyDbUTcn96X+Zf3Be/a5iop/JEpwvE
 VjlIXVt1VjR5LpAzJTjW9z66JypYdrmjzFDmuFq+kLBKUx0H2R45PF2mNJBh+7j4SOT+4CzzJ
 qHUeaKs/0IWcJCBh30Dr4Yc1boJoprpfF/FnqW35hqlO6P9u0d23/DkUcmMpmsi8IW32VFvcy
 JeK8S9PE1rH1HuM6DEUyALwIrMeIQydFmeYNWsZal2o51pGfLHLBP5N+Dy35xF/uzhnZL/yDB
 YKPR8rPSqax3iYxFR/pc1C7vM4Ohb5ZgwYNV7T/gL5PZFutVC+o7icPJuV2igJmtkT0Ga+wHb
 v5J+u1bASfKtH/y4hiRXTIgow+vNKzIO27bpFF2kJU+ZW1xachXAY51VUi/rdIy64K1pQw0Cc
 ua0PRcgEWYhRzmMPMG5awfBJ0y8shhz3mQCXqpCdRzNVHE4WHn80tfe8+HOrGoAA1nRGw1DeG
 6jgbIEr+A5lhd0e5bU0aWBwCtmArCLuh3YikZ14R94P2P1m93QpL7vDKHKmOwhkQ1Tc+fSINx
 UQjUcrO2koL9P0HFnHfw==
X-Mailman-Approved-At: Mon, 11 Nov 2019 16:47:32 +0000
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 y2038@lists.linaro.org, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

TW9zdCBrZXJuZWwgaW50ZXJmYWNlcyB0aGF0IHRha2UgYSB0aW1lc3BlYyByZXF1aXJlIG5vcm1h
bGl6ZWQKcmVwcmVzZW50YXRpb24gd2l0aCB0dl9uc2VjIGJldHdlZW4gMCBhbmQgTlNFQ19QRVJf
U0VDLgoKUGFzc2luZyB2YWx1ZXMgbGFyZ2VyIHRoYW4gMHgxMDAwMDAwMDB1bGwgZnVydGhlciBi
ZWhhdmVzIGRpZmZlcmVudGx5Cm9uIDMyLWJpdCBhbmQgNjQtYml0IGtlcm5lbHMsIGFuZCBjYW4g
Y2F1c2UgdGhlIGxhdHRlciB0byBzcGVuZCBhIGxvbmcKdGltZSBjb3VudGluZyBzZWNvbmRzIGlu
IHRpbWVzcGVjNjRfc3ViKCkvc2V0X25vcm1hbGl6ZWRfdGltZXNwZWM2NCgpLgoKUmVqZWN0IHRo
b3NlIGxhcmdlIHZhbHVlcyBhdCB0aGUgdXNlciBpbnRlcmZhY2UgdG8gZW5mb3JjZSBzYW5lIGFu
ZApwb3J0YWJsZSBiZWhhdmlvci4KClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYyB8IDkg
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9l
dG5hdml2L2V0bmF2aXZfZHJ2LmMKaW5kZXggMWY5YzAxYmU0MGQ3Li45NWQ3MmRjMDAyODAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYwpAQCAtMjk3LDYgKzI5Nyw5IEBAIHN0
YXRpYyBpbnQgZXRuYXZpdl9pb2N0bF9nZW1fY3B1X3ByZXAoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdm9pZCAqZGF0YSwKIAlpZiAoYXJncy0+b3AgJiB+KEVUTkFfUFJFUF9SRUFEIHwgRVROQV9Q
UkVQX1dSSVRFIHwgRVROQV9QUkVQX05PU1lOQykpCiAJCXJldHVybiAtRUlOVkFMOwogCisJaWYg
KGFyZ3MtPnRpbWVvdXQudHZfbnNlYyA+IE5TRUNfUEVSX1NFQykKKwkJcmV0dXJuIC1FSU5WQUw7
CisKIAlvYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZSwgYXJncy0+aGFuZGxlKTsKIAlp
ZiAoIW9iaikKIAkJcmV0dXJuIC1FTk9FTlQ7CkBAIC0zNjAsNiArMzYzLDkgQEAgc3RhdGljIGlu
dCBldG5hdml2X2lvY3RsX3dhaXRfZmVuY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwKIAlpZiAoYXJncy0+ZmxhZ3MgJiB+KEVUTkFfV0FJVF9OT05CTE9DSykpCiAJCXJldHVy
biAtRUlOVkFMOwogCisJaWYgKGFyZ3MtPnRpbWVvdXQudHZfbnNlYyA+IE5TRUNfUEVSX1NFQykK
KwkJcmV0dXJuIC1FSU5WQUw7CisKIAlpZiAoYXJncy0+cGlwZSA+PSBFVE5BX01BWF9QSVBFUykK
IAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAgLTQxMSw2ICs0MTcsOSBAQCBzdGF0aWMgaW50IGV0bmF2
aXZfaW9jdGxfZ2VtX3dhaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlp
ZiAoYXJncy0+ZmxhZ3MgJiB+KEVUTkFfV0FJVF9OT05CTE9DSykpCiAJCXJldHVybiAtRUlOVkFM
OwogCisJaWYgKGFyZ3MtPnRpbWVvdXQudHZfbnNlYyA+IE5TRUNfUEVSX1NFQykKKwkJcmV0dXJu
IC1FSU5WQUw7CisKIAlpZiAoYXJncy0+cGlwZSA+PSBFVE5BX01BWF9QSVBFUykKIAkJcmV0dXJu
IC1FSU5WQUw7CiAKLS0gCjIuMjAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9l
dG5hdml2
