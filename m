Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80151EA1CD
	for <lists+etnaviv@lfdr.de>; Wed, 30 Oct 2019 17:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D716EAD2;
	Wed, 30 Oct 2019 16:32:02 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740836EACC
 for <etnaviv@lists.freedesktop.org>; Wed, 30 Oct 2019 16:32:00 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1iPqt4-0002YS-FY; Wed, 30 Oct 2019 17:31:58 +0100
Message-ID: <b0d640267662e3ce5e0089d0afedc1baba55058d.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-fixes for 5.4
From: Lucas Stach <l.stach@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Oct 2019 17:31:57 +0100
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgaGkgRGFuaWVsLAoKYSBmZXcgc21hbGwgZml4ZXMgZm9yIHRoZSBldG5hdml2IGRy
aXZlci4KCk9uZSBtZW1vcnkgY29ycnVwdGlvbiBmaXggaW4gdGhlIE1NVXYyIEdQVSBjb3JlZHVt
cCBjb2RlLCBhIGRlYWRsb2NrCmZpeCBhbHNvIGluIHRoZSBjb3JlZHVtcCBjb2RlIGFuZCByZWlu
dHJvZHVjdGlvbiBvZiBhIGhlbHBmdWwgbWVzc2FnZSwKd2hpY2ggZ290IGRyb3BwZWQgYnkgYWNj
aWRlbnQgaW4gdGhpcyBjeWNsZS4KClJlZ2FyZHMsCkx1Y2FzCgpUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IDU0ZWNiOGY3MDI4YzVlYjNkNzQwYmI4MmIwZjFkOTBmMmRmNjNjNWM6
CgogIExpbnV4IDUuNC1yYzEgKDIwMTktMDktMzAgMTA6MzU6NDAgLTA3MDApCgphcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgaHR0cHM6Ly9naXQucGVuZ3V0cm9uaXgu
ZGUvZ2l0L2xzdC9saW51eCBldG5hdml2L2ZpeGVzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gYTJmMTBkNGEzMDY5ZmVlNjY2ZGFiMjBmYWI1NDU4NzU3YmExZjIyZDoKCiAgZHJtL2V0
bmF2aXY6IGZpeCBkdW1waW5nIG9mIGlvbW11djIgKDIwMTktMTAtMjkgMTg6MTI6MjQgKzAxMDAp
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCkNocmlzdGlhbiBHbWVpbmVyICgxKToKICAgICAgZHJtL2V0bmF2aXY6IGZpeCBk
dW1waW5nIG9mIGlvbW11djIKCkx1Y2FzIFN0YWNoICgyKToKICAgICAgZHJtL2V0bmF2aXY6IGZp
eCBkZWFkbG9jayBpbiBHUFUgY29yZWR1bXAKICAgICAgZHJtL2V0bmF2aXY6IHJlaW5zdGF0ZSBN
TVV2MSBjb21tYW5kIGJ1ZmZlciB3aW5kb3cgY2hlY2sKCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X2R1bXAuYyAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X2lvbW11X3YyLmMgfCAgNiArKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0
bmF2aXZfbW11LmMgICAgICB8IDE3ICsrKysrKysrKysrKysrLS0tCiAzIGZpbGVzIGNoYW5nZWQs
IDIwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2V0bmF2aXY=
