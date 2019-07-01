Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3695B834
	for <lists+etnaviv@lfdr.de>; Mon,  1 Jul 2019 11:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D343F897B4;
	Mon,  1 Jul 2019 09:42:31 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B617897B4
 for <etnaviv@lists.freedesktop.org>; Mon,  1 Jul 2019 09:42:31 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hhspQ-0002Uq-UN; Mon, 01 Jul 2019 11:42:28 +0200
Message-ID: <1561974148.2321.1.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-fixes for 5.2-rc8/final
From: Lucas Stach <l.stach@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 01 Jul 2019 11:42:28 +0200
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLCBoaSBEYXZlLAoKcGxlYXNlIHB1bGwgaW4gdGhpcyBmaXgsIHdoaWNoIGZpeGVz
IGEga2VybmVsIG51bGxwdHIgZGVyZWYgb24gbW9kdWxlCnVubG9hZCB3aGVuIGFueSBldG5hdml2
IEdQVSBmYWlsZWQgdG8gaW5pdGlhbGl6ZSBwcm9wZXJseS4KClJlZ2FyZHMsCkx1Y2FzCgpUaGUg
Zm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGExODgzMzljYTVhMzk2YWNjNTg4ZTU4NTFl
ZDdlMTlmNjZiMGViZDk6CgogIExpbnV4IDUuMi1yYzEgKDIwMTktMDUtMTkgMTU6NDc6MDkgLTA3
MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgaHR0cHM6Ly9n
aXQucGVuZ3V0cm9uaXguZGUvZ2l0L2xzdC9saW51eCBldG5hdml2L2ZpeGVzCgpmb3IgeW91IHRv
IGZldGNoIGNoYW5nZXMgdXAgdG8gYmUxMzJlMTM3NWMxZmZmZTQ4ODAxMjk2Mjc5MDc5ZjhhNTlh
OWVkMzoKCiAgZHJtL2V0bmF2aXY6IGFkZCBtaXNzaW5nIGZhaWx1cmUgcGF0aCB0byBkZXN0cm95
IHN1YmFsbG9jICgyMDE5LTA2LTI4IDEwOjU5OjQ0ICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpMdWNhcyBTdGFj
aCAoMSk6CiAgICAgIGRybS9ldG5hdml2OiBhZGQgbWlzc2luZyBmYWlsdXJlIHBhdGggdG8gZGVz
dHJveSBzdWJhbGxvYwoKIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgfCA3
ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYg
bWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
