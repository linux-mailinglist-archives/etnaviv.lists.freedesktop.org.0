Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2B6B4932
	for <lists+etnaviv@lfdr.de>; Tue, 17 Sep 2019 10:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB2D6EB57;
	Tue, 17 Sep 2019 08:21:27 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035226E99B
 for <etnaviv@lists.freedesktop.org>; Mon, 16 Sep 2019 14:33:12 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1i9s3n-0003ys-1f; Mon, 16 Sep 2019 16:32:59 +0200
Message-ID: <caf166f465465c61b70ad69d88f0634f1ca2ae64.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] dt-bindings: etnaviv: Add #cooling-cells
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo
 Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Angus Ainslie (Purism)" <angus@akkea.ca>,  etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Date: Mon, 16 Sep 2019 16:32:55 +0200
In-Reply-To: <6e9d761598b2361532146f43161fd05f3eee6545.1568255903.git.agx@sigxcpu.org>
References: <cover.1568255903.git.agx@sigxcpu.org>
 <6e9d761598b2361532146f43161fd05f3eee6545.1568255903.git.agx@sigxcpu.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 17 Sep 2019 08:21:25 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gTWksIDIwMTktMDktMTEgYXQgMTk6NDAgLTA3MDAsIEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+
IEFkZCAjY29vbGluZy1jZWxscyBmb3Igd2hlbiB0aGUgZ3B1IGFjdHMgYXMgYSBjb29saW5nIGRl
dmljZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3Jn
PgoKUmV2aWV3ZWQtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgoKPiAt
LS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9ldG5hdml2L2V0bmF2aXYtZHJt
LnR4dCAgICAgICAgICB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
ZXRuYXZpdi9ldG5hdml2LWRybS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9ldG5hdml2L2V0bmF2aXYtZHJtLnR4dAo+IGluZGV4IDhkZWYxMWIxNmEyNC4u
NjQwNTkyZThhYjJlIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2V0bmF2aXYvZXRuYXZpdi1kcm0udHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvZXRuYXZpdi9ldG5hdml2LWRybS50eHQKPiBA
QCAtMjEsNiArMjEsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICBPcHRpb25hbCBwcm9wZXJ0
aWVzOgo+ICAtIHBvd2VyLWRvbWFpbnM6IGEgcG93ZXIgZG9tYWluIGNvbnN1bWVyIHNwZWNpZmll
ciBhY2NvcmRpbmcgdG8KPiAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93
ZXIvcG93ZXJfZG9tYWluLnR4dAo+ICstICNjb29saW5nLWNlbGxzOiA6IElmIHVzZWQgYXMgYSBj
b29saW5nIGRldmljZSwgbXVzdCBiZSA8Mj4KPiAgCj4gIGV4YW1wbGU6Cj4gIAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxp
c3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
