Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CCAAA342
	for <lists+etnaviv@lfdr.de>; Thu,  5 Sep 2019 14:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4070D6E0B8;
	Thu,  5 Sep 2019 12:32:56 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8656E0B6
 for <etnaviv@lists.freedesktop.org>; Thu,  5 Sep 2019 12:32:54 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1i5qwW-0002vv-Jf; Thu, 05 Sep 2019 14:32:52 +0200
Message-ID: <4ae00cfb47c8e6fffca5dbb45ae9370cd4e5eaf4.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next-fixes for 5.4
From: Lucas Stach <l.stach@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 05 Sep 2019 14:32:52 +0200
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLCBoaSBEYXZlLAoKYSBzaW5nbGUgZml4IGZvciBhIGVycm9yIHBhdGggaXNzdWUg
aW4gdGhlIG5ld2x5IGludHJvZHVjZWQgcGVyLXByb2Nlc3MgCmFkZHJlc3Mgc3BhY2UgY29kZS4K
ClJlZ2FyZHMsCkx1Y2FzCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDU3OGQy
MzQyZWM3MDJlNWZiOGE3Nzk4M2ZhYmIzNzU0YWUzZTk2NjA6CgogIE1lcmdlIHRhZyAnZHJtLW5l
eHQtNS40LTIwMTktMDgtMjMnIG9mIGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVm
L2xpbnV4IGludG8gZHJtLW5leHQgKDIwMTktMDgtMjcgMTc6MjI6MTUgKzEwMDApCgphcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgaHR0cHM6Ly9naXQucGVuZ3V0cm9u
aXguZGUvZ2l0L2xzdC9saW51eCBldG5hdml2L25leHQKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdl
cyB1cCB0byBkYmNjNTc0YTRiZmFkODEwY2U2ZTExOGYzY2YzMjdjN2I2ZTdjODk3OgoKICBkcm0v
ZXRuYXZpdjogZml4IG1pc3NpbmcgdW5sb2NrIG9uIGVycm9yIGluIGV0bmF2aXZfaW9tbXV2MV9j
b250ZXh0X2FsbG9jKCkgKDIwMTktMDktMDIgMTI6NDg6NTUgKzAyMDApCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCldlaSBZ
b25nanVuICgxKToKICAgICAgZHJtL2V0bmF2aXY6IGZpeCBtaXNzaW5nIHVubG9jayBvbiBlcnJv
ciBpbiBldG5hdml2X2lvbW11djFfY29udGV4dF9hbGxvYygpCgogZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9pb21tdS5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0
bmF2aXY=
