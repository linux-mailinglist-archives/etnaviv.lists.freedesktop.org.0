Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE922DAF2
	for <lists+etnaviv@lfdr.de>; Wed, 29 May 2019 12:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1576E04B;
	Wed, 29 May 2019 10:38:43 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835636E04B
 for <etnaviv@lists.freedesktop.org>; Wed, 29 May 2019 10:38:41 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hVvyi-0000fh-27; Wed, 29 May 2019 12:38:40 +0200
Message-ID: <1559126320.3651.2.camel@pengutronix.de>
Subject: Re: [PATCH libdrm] etnaviv: drop etna_bo_from_handle symbol
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Wed, 29 May 2019 12:38:40 +0200
In-Reply-To: <20190529100834.32278-1-l.stach@pengutronix.de>
References: <20190529100834.32278-1-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
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
Cc: mesa-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA1LTI5IGF0IDEyOjA4ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBU
aGVyZSBpcyBubyBpbXBsZW1lbnRhdGlvbiBhbmQgYWxzbyBubyB1c2Vycywgc28gdGhlcmUgaXMg
bm8gcG9pbnQKPiBpbiBrZWVwaW5nIGl0IGluIHRoZSBBUEkuCj4gCj4gU2lnbmVkLW9mZi1ieTog
THVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpSZXZpZXdlZC1ieTogUGhpbGlw
cCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KClRoaXMgbWFrZXMgaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wYXRjaC85OTEyMDg5LyBvYnNvbGV0ZS4KCnJlZ2FyZHMKUGhpbGlw
cApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2
IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
