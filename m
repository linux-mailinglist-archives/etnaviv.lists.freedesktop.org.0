Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D134A1309E
	for <lists+etnaviv@lfdr.de>; Fri,  3 May 2019 16:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5466D6E7D4;
	Fri,  3 May 2019 14:42:22 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FCF6E7D4
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2019 14:42:20 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hMZOF-0003MX-6s; Fri, 03 May 2019 16:42:19 +0200
Message-ID: <1556894539.2590.23.camel@pengutronix.de>
Subject: Re: [PATCH] etnaviv: fill missing offset in etna_resource_get_handle
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, mesa-dev@lists.freedesktop.org
Date: Fri, 03 May 2019 16:42:19 +0200
In-Reply-To: <20190503100524.23232-1-p.zabel@pengutronix.de>
References: <20190503100524.23232-1-p.zabel@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u1 
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
Cc: graphics@pengutronix.de, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgZGVuIDAzLjA1LjIwMTksIDEyOjA1ICswMjAwIHNjaHJpZWIgUGhpbGlwcCBa
YWJlbDoKPiBXaXRob3V0IHRoaXMgZ2JtX2JvX2dldF9vZmZzZXQoKSBjYW4gcmV0dXJuIDAgd2hl
cmUgaXQgc2hvdWxkbid0LgoKUmV2aWV3ZWQtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1
dHJvbml4LmRlPgoKPiAtLS0KPiDCoHNyYy9nYWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5hdml2
X3Jlc291cmNlLmMgfCAxICsKPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+
IGRpZmYgLS1naXQgYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9yZXNvdXJj
ZS5jIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfcmVzb3VyY2UuYwo+IGlu
ZGV4IDgzMTc5ZDNjZDA4OC4uYWI3N2E4MGM3MmIzIDEwMDY0NAo+IC0tLSBhL3NyYy9nYWxsaXVt
L2RyaXZlcnMvZXRuYXZpdi9ldG5hdml2X3Jlc291cmNlLmMKPiArKysgYi9zcmMvZ2FsbGl1bS9k
cml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9yZXNvdXJjZS5jCj4gQEAgLTYyMiw2ICs2MjIsNyBAQCBl
dG5hX3Jlc291cmNlX2dldF9oYW5kbGUoc3RydWN0IHBpcGVfc2NyZWVuICpwc2NyZWVuLAo+IMKg
wqDCoMKgwqDCoMKgcnNjID0gZXRuYV9yZXNvdXJjZShyc2MtPmV4dGVybmFsKTsKPiDCoAo+IMKg
wqDCoMKgaGFuZGxlLT5zdHJpZGUgPSByc2MtPmxldmVsc1swXS5zdHJpZGU7Cj4gK8KgwqDCoGhh
bmRsZS0+b2Zmc2V0ID0gcnNjLT5sZXZlbHNbMF0ub2Zmc2V0Owo+IMKgwqDCoMKgaGFuZGxlLT5t
b2RpZmllciA9IGxheW91dF90b19tb2RpZmllcihyc2MtPmxheW91dCk7Cj4gwqAKPiDCoMKgwqDC
oGlmIChoYW5kbGUtPnR5cGUgPT0gV0lOU1lTX0hBTkRMRV9UWVBFX1NIQVJFRCkgewpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcg
bGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
