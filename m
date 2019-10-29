Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F306FE8DE7
	for <lists+etnaviv@lfdr.de>; Tue, 29 Oct 2019 18:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC43B6E525;
	Tue, 29 Oct 2019 17:18:28 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617836E503
 for <etnaviv@lists.freedesktop.org>; Tue, 29 Oct 2019 17:18:27 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1iPV8S-0004kH-TS; Tue, 29 Oct 2019 18:18:24 +0100
Message-ID: <6026247c6700516988111c77a8e951e03d09e96e.camel@pengutronix.de>
Subject: Re: [PATCH] etnaviv: fix dumping of iommuv2
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Tue, 29 Oct 2019 18:18:21 +0100
In-Reply-To: <20191025103919.128171-1-christian.gmeiner@gmail.com>
References: <20191025103919.128171-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKT24gRnIsIDIwMTktMTAtMjUgYXQgMTI6MzkgKzAyMDAsIENocmlzdGlh
biBHbWVpbmVyIHdyb3RlOgo+IGV0bmF2aXZfaW9tbXV2Ml9kdW1wX3NpemUoLi4pIHJldHVybnMg
dGhlIG51bWJlciBvZiBQVEUgKiBTWl80SyBidXQgZXRuYXZpdl9pb21tdXYyX2R1bXAoLi4pCj4g
aW5jcmVtZW50cyBidWYgcG9pbnRlciBldmVuIGlmIHRoZXJlIGlzIG5vIFBURS4gVGhpcyByZXN1
bHRzIGluIGEgYmFkIGJ1ZiBwb2ludGVyIHdoaWNoIGdldHMKPiB1c2VkIGZvciBtZW1jcHkoLi4p
Lgo+IAo+IFsgIDI2NC40MDg0NzRdIDg8LS0tIGN1dCBoZXJlIC0tLQo+IFsgIDI2NC40MTIwNDhd
IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVz
cyBmMWEyYzI2OAo+IFsgIDI2NC40MTkzMjFdIHBnZCA9IGU1ODQ2MDA0Cj4gWyAgMjY0LjQyMjA2
OV0gW2YxYTJjMjY4XSAqcGdkPTAwMDAwMDAwCj4gWyAgMjY0LjQyNTcwMl0gSW50ZXJuYWwgZXJy
b3I6IE9vcHM6IDgwNSBbIzFdIFNNUCBBUk0KPiBbICAyNjQuNDMwNTIwXSBNb2R1bGVzIGxpbmtl
ZCBpbjoKPiBbICAyNjQuNDMzNjE2XSBDUFU6IDIgUElEOiAxMzAgQ29tbToga3dvcmtlci8yOjIg
VGFpbnRlZDogRyAgICAgICAgVyAgICAgICAgIDUuNC4wLXJjNCAjMTAKPiBbICAyNjQuNDQxNjQz
XSBIYXJkd2FyZSBuYW1lOiBGcmVlc2NhbGUgaS5NWDYgUXVhZC9EdWFsTGl0ZSAoRGV2aWNlIFRy
ZWUpCj4gWyAgMjY0LjQ0ODIyN10gV29ya3F1ZXVlOiBldmVudHMgZHJtX3NjaGVkX2pvYl90aW1l
ZG91dAo+IFsgIDI2NC40NTMyMzddIFBDIGlzIGF0IG1lbWNweSsweDUwLzB4MzMwCj4gWyAgMjY0
LjQ1NzAxMl0gTFIgaXMgYXQgMHgyCj4gWyAgMjY0LjQ1OTU3Ml0gcGMgOiBbPGMwYzA0NjUwPl0g
ICAgbHIgOiBbPDAwMDAwMDAyPl0gICAgcHNyOiAyMDBmMDAxMwo+IFsgIDI2NC40NjU4NjNdIHNw
IDogZWM5NmZlNjQgIGlwIDogMDAwMDAwMDIgIGZwIDogMDAwMDAxNDAKPiBbICAyNjQuNDcxMTEy
XSByMTA6IDAwMDAzMDAwICByOSA6IGVjNjg4MDQwICByOCA6IDAwMDAwMDAyCj4gWyAgMjY0LjQ3
NjM2NF0gcjcgOiAwMDAwMDAwMiAgcjYgOiAwMDAwMDAwMiAgcjUgOiAwMDAwMDAwMiAgcjQgOiAw
MDAwMDAwMgo+IFsgIDI2NC40ODI5MTddIHIzIDogMDAwMDAwMDIgIHIyIDogMDAwMDBmNjAgIHIx
IDogZjE2MmEwMjAgIHIwIDogZjFhMmMyNjgKPiBbICAyNjQuNDg5NDcyXSBGbGFnczogbnpDdiAg
SVJRcyBvbiAgRklRcyBvbiAgTW9kZSBTVkNfMzIgIElTQSBBUk0gIFNlZ21lbnQgbm9uZQo+IFsg
IDI2NC40OTY2MzVdIENvbnRyb2w6IDEwYzUzODdkICBUYWJsZTogM2QyNjgwNGEgIERBQzogMDAw
MDAwNTEKPiBbICAyNjQuNTAyNDA3XSBQcm9jZXNzIGt3b3JrZXIvMjoyIChwaWQ6IDEzMCwgc3Rh
Y2sgbGltaXQgPSAweGU4ZjY5ZjNkKQo+IFsgIDI2NC41MDg3ODZdIFN0YWNrOiAoMHhlYzk2ZmU2
NCB0byAweGVjOTcwMDAwKQo+IFsgIDI2NC41MTMxODBdIGZlNjA6ICAgICAgICAgIGYxNjIyMDAw
IGYxNjIyMThjIGYxNjJjMDAwIDQxNGU1NDQ1IGYxYTJjMjY4IDAwMDAwZmZjIGMwNjU1YThjCj4g
WyAgMjY0LjUyMTM5NF0gZmU4MDogMDAwMDAwMDAgMDAwMDAxMmEgZjE2MmMyNjggYzA2NGZkNzgg
YzA2NTczNTAgYzAxODdmNjQgMDAwMDAwMDEgMDAwMDAwMDAKPiBbICAyNjQuNTI5NjA2XSBmZWEw
OiBlZDBmOWMwMCAwMDAwMDAwMSAwMDAwMDAwMiA0MzVkNTg3ZCBlYzY4ODE0MCBlYzY4ODEwMCBl
ZDBmOWMwMCBlYzY4ODA0MAo+IFsgIDI2NC41Mzc4MThdIGZlYzA6IGVkMGY5YzAwIGMxMzA4YjI4
IGVjOTZmZjFjIGMxM2U1NWIwIGMxM2U0MWM4IGMwNjU3MzU4IGVjNjg4MjYwIGVkMGY5YzE4Cj4g
WyAgMjY0LjU0NjAyOV0gZmVlMDogZWM2ODgxMDAgYzA2NDEyNzggZWM2ODgyNjAgZWMyZjYxODAg
ZWUxYmE3MDAgZWUxYmRhMDAgYzEzMDhiMjggYzAxNDliOTgKPiBbICAyNjQuNTU0MjQwXSBmZjAw
OiAwMDAwMDAwMSAwMDAwMDAwMCBjMDE0OWFlNCBjMGMyMWZiMCAwMDAwMDAwMCAwMDAwMDAwMCBj
MDE0YTE5NCBjMWE0YmUzNAo+IFsgIDI2NC41NjI0NTJdIGZmMjA6IGMxODcwNzQwIDAwMDAwMDAw
IGMxMDE1Mzg0IDQzNWQ1ODdkIGZmZmZlMDAwIGVjMmY2MTgwIGVjMmY2MTk0IGVlMWJhNzAwCj4g
WyAgMjY0LjU3MDY2M10gZmY0MDogMDAwMDAwMDggZWUxYmE3MzQgYzEzMDU5MDAgZWUxYmE3MDAg
ZmZmZmUwMDAgYzAxNGEwZTQgZWM5NTM3YTQgYzBjMjhlNjQKPiBbICAyNjQuNTc4ODc0XSBmZjYw
OiBlYzk2ZTAwMCAwMDAwMDAwMCBlYzJiZTc4MCBlYzJmOTljMCBlYzk2ZTAwMCBlYzJmNjE4MCBj
MDE0YTBiOCBlYzEzZmU5MAo+IFsgIDI2NC41ODcwODZdIGZmODA6IGVjMmJlN2I4IGMwMTUyODkw
IGVjOTZlMDAwIGVjMmY5OWMwIGMwMTUyNzUwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwCj4g
WyAgMjY0LjU5NTI5Nl0gZmZhMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgYzAxMDEwYjQg
MDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAKPiBbICAyNjQuNjAzNTA2XSBmZmMw
OiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAwMAo+IFsgIDI2NC42MTE3MTZdIGZmZTA6IDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDEzIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwCj4g
WyAgMjY0LjYxOTk0NF0gWzxjMGMwNDY1MD5dIChtZW1jcHkpIGZyb20gWzxjMDY1NWE4Yz5dIChl
dG5hdml2X2lvbW11djJfZHVtcCsweDU4LzB4NjApCj4gWyAgMjY0LjYyNzczOF0gWzxjMDY1NWE4
Yz5dIChldG5hdml2X2lvbW11djJfZHVtcCkgZnJvbSBbPGMwNjRmZDc4Pl0gKGV0bmF2aXZfY29y
ZV9kdW1wKzB4MTQwLzB4NDVjKQo+IFsgIDI2NC42MzY2NThdIFs8YzA2NGZkNzg+XSAoZXRuYXZp
dl9jb3JlX2R1bXApIGZyb20gWzxjMDY1NzM1OD5dIChldG5hdml2X3NjaGVkX3RpbWVkb3V0X2pv
YisweDhjLzB4YjgpCj4gWyAgMjY0LjY0NTkyM10gWzxjMDY1NzM1OD5dIChldG5hdml2X3NjaGVk
X3RpbWVkb3V0X2pvYikgZnJvbSBbPGMwNjQxMjc4Pl0gKGRybV9zY2hlZF9qb2JfdGltZWRvdXQr
MHgzOC8weDg4KQo+IFsgIDI2NC42NTU2MzFdIFs8YzA2NDEyNzg+XSAoZHJtX3NjaGVkX2pvYl90
aW1lZG91dCkgZnJvbSBbPGMwMTQ5Yjk4Pl0gKHByb2Nlc3Nfb25lX3dvcmsrMHgyYzQvMHg3ZTQp
Cj4gWyAgMjY0LjY2NDYzM10gWzxjMDE0OWI5OD5dIChwcm9jZXNzX29uZV93b3JrKSBmcm9tIFs8
YzAxNGEwZTQ+XSAod29ya2VyX3RocmVhZCsweDJjLzB4NTljKQo+IFsgIDI2NC42NzI3NjVdIFs8
YzAxNGEwZTQ+XSAod29ya2VyX3RocmVhZCkgZnJvbSBbPGMwMTUyODkwPl0gKGt0aHJlYWQrMHgx
NDAvMHgxNTgpCj4gWyAgMjY0LjY4MDIwMF0gWzxjMDE1Mjg5MD5dIChrdGhyZWFkKSBmcm9tIFs8
YzAxMDEwYjQ+XSAocmV0X2Zyb21fZm9yaysweDE0LzB4MjApCj4gWyAgMjY0LjY4NzQ0OF0gRXhj
ZXB0aW9uIHN0YWNrKDB4ZWM5NmZmYjAgdG8gMHhlYzk2ZmZmOCkKPiBbICAyNjQuNjkyNTMwXSBm
ZmEwOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwMDAwMDAwMCAwMDAwMDAw
MCAwMDAwMDAwMCAwMDAwMDAwMAo+IFsgIDI2NC43MDA3NDFdIGZmYzA6IDAwMDAwMDAwIDAwMDAw
MDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAw
Cj4gWyAgMjY0LjcwODk0OV0gZmZlMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwMTMgMDAwMDAwMDAKPiBbICAyNjQuNzE1NTk5XSBDb2RlOiBmNWQxZjA1YyBmNWQx
ZjA3YyBlOGIxNTFmOCBlMjUyMjAyMCAoZThhMDUxZjgpCj4gWyAgMjY0LjcyMTcyN10gLS0tWyBl
bmQgdHJhY2UgOGFmY2Q3OWU5ZTI3MjViMyBdLS0tCgpDb2RlIGNoYW5nZSBpcyBmaW5lLCBidXQg
dGhlIGNvbW1pdCBtZXNzYWdlIGhhcyBhIGxvdCBvZiBsaW5lcyBvdmVyIDgwCmNoYXJhY3RlcnMg
YW5kIGdlbmVyYWxseSB0aGUga2VybmVsIHRyYWNlIGlzIG1vc3RseSBub2lzZS4gSSB0cmltbWVk
IGl0Cm91dCBhbmQgYXBwbGllZCBpdCB0byBteSBmaXhlcyBicmFuY2guIElmIHlvdSBkb24ndCBh
Z3JlZSB3aXRoIG15CmNoYW5nZXMsIHBsZWFzZSBzaG91dCBub3cgYXMgSSdtIHBsYW5uaW5nIG9u
IHNlbmRpbmcgdGhlIGZpeGVzIHB1bGwKdG9tb3Jyb3cuCgpSZWdhcmRzLApMdWNhcwogCj4gRml4
ZXM6IGFmYjdiM2IxZGViNCAoImRybS9ldG5hdml2OiBpbXBsZW1lbnQgSU9NTVV2MiB0cmFuc2xh
dGlvbiIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2lvbW11X3YyLmMgfCA2ICsrKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2lvbW11X3YyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2lvbW11X3YyLmMKPiBpbmRleCAwNDMxMTFhMWQ2MGMu
LmY4YmY0ODhlOWQ3MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2lvbW11X3YyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2lv
bW11X3YyLmMKPiBAQCAtMTU1LDkgKzE1NSwxMSBAQCBzdGF0aWMgdm9pZCBldG5hdml2X2lvbW11
djJfZHVtcChzdHJ1Y3QgZXRuYXZpdl9pb21tdV9jb250ZXh0ICpjb250ZXh0LCB2b2lkICpidQo+
ICAKPiAgCW1lbWNweShidWYsIHYyX2NvbnRleHQtPm10bGJfY3B1LCBTWl80Syk7Cj4gIAlidWYg
Kz0gU1pfNEs7Cj4gLQlmb3IgKGkgPSAwOyBpIDwgTU1VdjJfTUFYX1NUTEJfRU5UUklFUzsgaSsr
LCBidWYgKz0gU1pfNEspCj4gLQkJaWYgKHYyX2NvbnRleHQtPm10bGJfY3B1W2ldICYgTU1VdjJf
UFRFX1BSRVNFTlQpCj4gKwlmb3IgKGkgPSAwOyBpIDwgTU1VdjJfTUFYX1NUTEJfRU5UUklFUzsg
aSsrKQo+ICsJCWlmICh2Ml9jb250ZXh0LT5tdGxiX2NwdVtpXSAmIE1NVXYyX1BURV9QUkVTRU5U
KSB7Cj4gIAkJCW1lbWNweShidWYsIHYyX2NvbnRleHQtPnN0bGJfY3B1W2ldLCBTWl80Syk7Cj4g
KwkJCWJ1ZiArPSBTWl80SzsKPiArCQl9Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIGV0bmF2aXZf
aW9tbXV2Ml9yZXN0b3JlX25vbnNlYyhzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBs
aXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
