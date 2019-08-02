Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71E80022
	for <lists+etnaviv@lfdr.de>; Fri,  2 Aug 2019 20:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B346EF3A;
	Fri,  2 Aug 2019 18:23:46 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3746E6EF3A;
 Fri,  2 Aug 2019 18:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 81A1EFB03;
 Fri,  2 Aug 2019 20:23:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDBIAJzXWCrI; Fri,  2 Aug 2019 20:23:42 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 0532447323; Fri,  2 Aug 2019 20:23:41 +0200 (CEST)
Date: Fri, 2 Aug 2019 20:23:41 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 2/8] drm/etnaviv: split out cmdbuf mapping into
 address space
Message-ID: <20190802182341.GA10483@bogon.m.sigxcpu.org>
References: <20190705171727.27501-1-l.stach@pengutronix.de>
 <20190705171727.27501-2-l.stach@pengutronix.de>
 <20190802133900.GA3251@bogon.m.sigxcpu.org>
 <1564755713.3090.3.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564755713.3090.3.camel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Christian Gmeiner <christian.gmeiner@gmail.com>,
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGksCk9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDA0OjIxOjUzUE0gKzAyMDAsIFBoaWxpcHAgWmFi
ZWwgd3JvdGU6Cj4gSGkgR3VpZG8sCj4gCj4gT24gRnJpLCAyMDE5LTA4LTAyIGF0IDE1OjM5ICsw
MjAwLCBHdWlkbyBHw7xudGhlciB3cm90ZToKPiA+IEhpIEx1Y2FzLAo+ID4gT24gRnJpLCBKdWwg
MDUsIDIwMTkgYXQgMDc6MTc6MjFQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3JvdGU6Cj4gPiA+IFRo
aXMgYWxsb3dzIHRvIGRlY291cGxlIHRoZSBjbWRidWYgc3ViYWxsb2NhdG9yIGNyZWF0ZSBhbmQg
bWFwcGluZwo+ID4gPiB0aGUgcmVnaW9uIGludG8gdGhlIEdQVSBhZGRyZXNzIHNwYWNlLiBBbGxv
d2luZyBtdWx0aXBsZSBBUyB0byBzaGFyZQo+ID4gPiBhIHNpbmdsZSBjbWRidWYgc3ViYWxsb2Mu
Cj4gPiAKPiA+IENhbiB5b3UgdGVsbCBtZSB3aGVyZSB0aGlzIHdvdWxkIGFwcGx5PyBJIHRyaWVk
IDUuMiBhbmQgbmV4dC0yMDE5MDcyNgo+ID4gd2l0aCBhbmQgd2l0aG91dAo+ID4gCj4gPiAgICBb
UEFUQ0ggMS8yXSBkcm0vZXRuYXZpdjogZml4IGV0bmF2aXZfY21kYnVmX3N1YmFsbG9jX25ldyBy
ZXR1cm4gdmFsdWUKPiAKPiBJIGhhdmUgc3RhY2tlZAo+IAo+IGRybS9ldG5hdml2OiBkcm9wIHVz
ZSBvZiBkcm1QLmgKPiBkcm0vZXRuYXZpdjogVXNlCj4gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jl
c291cmNlKCkKPiBkcm0vZXRuYXZpdjogY2xlYW4gdXAgaW5jbHVkZXMKPiBkcm0vZXRuYXZpdjog
Zml4Cj4gZXRuYXZpdl9jbWRidWZfc3ViYWxsb2NfbmV3IHJldHVybiB2YWx1ZQo+IGRybS9ldG5h
dml2OiByZW1vdmUgdW51c2VkIGZ1bmN0aW9uIGV0bmF2aXZfZ2VtX21hcHBpbmdfcmVmZXJlbmNl
Cj4gZHJtL2V0bmF2aXY6IGR1bXAgb25seSBmYWlsaW5nIHN1Ym1pdAo+IGRybS9ldG5hdml2OiBz
aW1wbGlmeSB1bmJpbmQgY2hlY2tzCj4gCj4gb24gdG9wIG9mIHY1LjMtcjEgYW5kIHRoaXMgcGF0
Y2ggYXBwbGllZCB3aXRoIGEgYml0IG9mIGZ1enouCgpUaGF0IHdvcmtlZCwgdGhhbmtzIQogLS0g
R3VpZG8KCj4gCj4gcmVnYXJkcwo+IFBoaWxpcHAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGV0bmF2aXYgbWFpbGluZyBsaXN0Cj4gZXRuYXZpdkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2V0bmF2aXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5h
dml2
