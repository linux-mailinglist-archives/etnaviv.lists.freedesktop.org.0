Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2178F6B
	for <lists+etnaviv@lfdr.de>; Mon, 29 Jul 2019 17:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310AF89FDB;
	Mon, 29 Jul 2019 15:35:16 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA15589FDB
 for <etnaviv@lists.freedesktop.org>; Mon, 29 Jul 2019 15:35:14 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hs7g9-0002kQ-6K; Mon, 29 Jul 2019 17:35:13 +0200
Message-ID: <1564414511.7633.9.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/8] drm/etnaviv: rework MMU handling
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Mon, 29 Jul 2019 17:35:11 +0200
In-Reply-To: <20190705171727.27501-5-l.stach@pengutronix.de>
References: <20190705171727.27501-1-l.stach@pengutronix.de>
 <20190705171727.27501-5-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA3LTA1IGF0IDE5OjE3ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBU
aGlzIHJld29ya3MgdGhlIE1NVSBoYW5kbGluZyB0byBtYWtlIGl0IHBvc3NpYmxlIHRvIGhhdmUg
bXVsdGlwbGUgTU1VIGNvbnRleHRzLgo+IEEgY29udGV4dCBpcyBiYXNpY2FsbHkgb25lIGluc3Rh
bmNlIG9mIEdQVSBwYWdlIHRhYmxlcy4gQ3VycmVudGx5IHdlIGhhdmUgb25lCj4gc2V0IG9mIHBh
Z2UgdGFibGVzIHBlciBHUFUsIHdoaWNoIGlzbid0IGFsbCB0aGF0IGNsZXZlciwgYXMgaXQgaGFz
IHRoZQo+IGZvbGxvd2luZyB0d28gY29uc2VxdWVuY2VzOgo+IAo+IDEuIEFsbCBHUFUgY2xpZW50
cyAoYWthIHByb2Nlc3NlcykgYXJlIHNoYXJpbmcgdGhlIHNhbWUgcGFnZXRhYmxlcywgd2hpY2gg
bWVhbnMKPiB0aGVyZSBpcyBubyBpc29sYXRpb24gYmV0d2VlbiBjbGllbnRzLCBidXQgb25seSBi
ZXR3ZWVuIEdQVSBhc3NpZ25lZCBtZW1vcnkKPiBzcGFjZXMgYW5kIHRoZSByZXN0IG9mIHRoZSBz
eXN0ZW0uIEJldHRlciB0aGFuIG5vdGhpbmcsIGJ1dCBhbHNvIG5vdCBncmVhdC4KPiAKPiAyLiBD
bGllbnRzIG9wZXJhdGluZyBvbiB0aGUgc2FtZSBzZXQgb2YgYnVmZmVycyB3aXRoIGRpZmZlcmVu
dCBldG5hdml2IEdQVQo+IGNvcmVzLCBlLmcuIGEgd29ya2xvYWQgdXNpbmcgYm90aCB0aGUgMkQg
YW5kIDNEIEdQVSwgbmVlZCB0byBtYXAgdGhlIHVzZWQKPiBidWZmZXJzIGludG8gdGhlIHBhZ2V0
YWJsZSBzZXRzIG9mIGVhY2ggdXNlZCBHUFUuCj4gCj4gVGhpcyBwYXRjaCByZXdvcmtzIGFsbCB0
aGUgTU1VIGhhbmRsaW5nIHRvIGludHJvZHVjZSB0aGUgYWJzdHJhY3Rpb24gb2YgdGhlCj4gTU1V
IGNvbnRleHQuIEEgY29udGV4dCBjYW4gYmUgc2hhcmVkIGFjcm9zcyBkaWZmZXJlbnQgR1BVIGNv
cmVzLCBhcyBsb25nIGFzCj4gdGhleSBoYXZlIGNvbXBhdGlibGUgTU1VIGltcGxlbWVudGF0aW9u
cywgd2hpY2ggaXMgdGhlIGNhc2UgZm9yIGFsbCBzeXN0ZW1zCj4gd2l0aCBWaXZhbnRlIEdQVXMg
c2VlbiBpbiB0aGUgd2lsZC4KPiAKPiBBcyBNTVV2MSBpcyBub3QgYWJsZSB0byBjaGFuZ2UgcGFn
ZXRhYmxlcyBvbiB0aGUgZmx5LCB3aXRob3V0IGEKPiAic3RvcCB0aGUgd29ybGQiIG9wZXJhdGlv
biwgd2hpY2ggc3RvcHMgR1BVLCBjaGFuZ2VzIHBhZ2V0YWJsZXMgdmlhIENQVQo+IGludGVyYWN0
aW9uLCByZXN0YXJ0cyBHUFUsIHRoZSBpbXBsZW1lbnRhdGlvbiBpbnRyb2R1Y2VzIGEgc2hhcmVk
IGNvbnRleHQgb24KPiBNTVV2MSwgd2hpY2ggaXMgcmV0dXJuZWQgd2hlbmV2ZXIgdGhlcmUgaXMg
YSByZXF1ZXN0IGZvciBhIG5ldyBjb250ZXh0Lgo+IAo+IFRoaXMgcGF0Y2ggYXNzaWducyBhIE1N
VSBjb250ZXh0IHRvIGVhY2ggR1BVLCBzbyBvbiBNTVV2MiBzeXN0ZW1zIHRoZXJlIGlzCj4gc3Rp
bGwgb25lIHNldCBvZiBwYWdldGFibGVzIHBlciBHUFUsIGJ1dCBkdWUgdG8gdGhlIHNoYXJlZCBj
b250ZXh0IE1NVXYxCj4gc3lzdGVtcyBzZWUgYSBjaGFuZ2UgaW4gYmVoYXZpb3IgYXMgbm93IGEg
c2luZ2xlIHBhZ2V0YWJsZSBzZXQgaXMgdXNlZAo+IGFjcm9zcyBhbGwgR1BVIGNvcmVzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2J1ZmZlci5jICAgfCAgIDggKy0K
PiAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9jbWRidWYuYyAgIHwgICA4ICstCj4g
IGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfY21kYnVmLmggICB8ICAgNiArLQo+ICBk
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5oICAgICAgfCAgIDQgKy0KPiAgZHJp
dmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kdW1wLmMgICAgIHwgICAyICstCj4gIGRyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMgICAgICB8ICAxNCArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5oICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyAgICAgIHwgIDIwICstCj4gIGRyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmggICAgICB8ICAgMyArLQo+ICBkcml2ZXJzL2dwdS9k
cm0vZXRuYXZpdi9ldG5hdml2X2lvbW11LmMgICAgfCAxNTEgKysrKysrLS0tLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXUuaCAgICB8ICAyMCAtLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2lvbW11X3YyLmMgfCAyNjQgKysrKysrKysrLS0tLS0t
LS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmMgICAgICB8IDI2
NCArKysrKysrKysrKysrLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZp
dl9tbXUuaCAgICAgIHwgIDg4ICsrKysrLS0KPiAgMTQgZmlsZXMgY2hhbmdlZCwgNDQxIGluc2Vy
dGlvbnMoKyksIDQxMyBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXUuaAo+IApbLi4uXQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRu
YXZpdi9ldG5hdml2X2dlbS5jCj4gQEAgLTIyMywxMiArMjIzLDEyIEBAIGludCBldG5hdml2X2dl
bV9tbWFwX29mZnNldChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdTY0ICpvZmZzZXQpCj4g
IAo+ICBzdGF0aWMgc3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICoKPiAgZXRuYXZpdl9nZW1f
Z2V0X3ZyYW1fbWFwcGluZyhzdHJ1Y3QgZXRuYXZpdl9nZW1fb2JqZWN0ICpvYmosCj4gLQkJCSAg
ICAgc3RydWN0IGV0bmF2aXZfaW9tbXUgKm1tdSkKPiArCQkJICAgICBzdHJ1Y3QgZXRuYXZpdl9p
b21tdV9jb250ZXh0ICpjb250ZXh0KQo+ICB7Cj4gIAlzdHJ1Y3QgZXRuYXZpdl92cmFtX21hcHBp
bmcgKm1hcHBpbmc7Cj4gIAo+ICAJbGlzdF9mb3JfZWFjaF9lbnRyeShtYXBwaW5nLCAmb2JqLT52
cmFtX2xpc3QsIG9ial9ub2RlKSB7Cj4gLQkJaWYgKG1hcHBpbmctPm1tdSA9PSBtbXUpCj4gKwkJ
aWYgKG1hcHBpbmctPmNvbnRleHQgPT0gY29udGV4dCkKPiAgCQkJcmV0dXJuIG1hcHBpbmc7Cj4g
IAl9Cj4gIAo+IEBAIC0yNjYsNyArMjY2LDcgQEAgc3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5n
ICpldG5hdml2X2dlbV9tYXBwaW5nX2dldCgKPiAgCQkgKi8KPiAgCQlpZiAobWFwcGluZy0+dXNl
ID09IDApIHsKPiAgCQkJbXV0ZXhfbG9jaygmZ3B1LT5tbXUtPmxvY2spOwo+IC0JCQlpZiAobWFw
cGluZy0+bW11ID09IGdwdS0+bW11KQo+ICsJCQlpZiAobWFwcGluZy0+Y29udGV4dCA9PSBncHUt
Pm1tdSkKCklzIHRoZXJlIGEgcmVhc29uIHRoYXQgbW11IHBhcmFtZXRlcnMgYW5kIG1hcHBpbmct
Pm1tdSBhcmUgcmVuYW1lZCB0bwpjb250ZXh0LCBidXQgZ3B1LT5tbXUgaXMgbm90PwoKQ291bGQg
YmUgcmVuYW1lZCB0byBncHUtPm1tdV9jb250ZXh0IGZvciBjb25zaXN0ZW5jeS4KClsuLi5dCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgYi9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jCj4gaW5kZXggN2IzOTZhYzVkYmE1Li5h
NTNmZWNkMTdmYTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZp
dl9ncHUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKWy4u
Ll0KPiBAQCAtMTY4NCwxMSArMTY5MCwxMSBAQCBzdGF0aWMgdm9pZCBldG5hdml2X2dwdV91bmJp
bmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCj4gIAlpZiAoZ3B1
LT5pbml0aWFsaXplZCkgewo+ICAJCWV0bmF2aXZfY21kYnVmX2ZyZWUoJmdwdS0+YnVmZmVyKTsK
PiAgCQlldG5hdml2X2NtZGJ1Zl9zdWJhbGxvY191bm1hcChncHUtPm1tdSwgJmdwdS0+Y21kYnVm
X21hcHBpbmcpOwo+IC0JCWV0bmF2aXZfaW9tbXVfZGVzdHJveShncHUtPm1tdSk7Cj4gKwkJZXRu
YXZpdl9pb21tdV9jb250ZXh0X3B1dChncHUtPm1tdSk7Cj4gKwkJZXRuYXZpdl9pb21tdV9nbG9i
YWxfZmluaShncHUpOwo+ICAJCWdwdS0+aW5pdGlhbGl6ZWQgPSBmYWxzZTsKPiAgCX0KPiAgCj4g
LQoKVGhpcyBzaG91bGQgYmUgZml4ZWQgaW4gYSBwcmV2aW91cyBwYXRjaC4KClsuLi5dCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5jCj4gaW5kZXggMzM0OGQ5OTYyMTc3Li5jZjQ5
ZjBlMmUxY2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9t
bXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmMKWy4uLl0K
PiBAQCAtMzkxLDIxICszNjksMTA3IEBAIHZvaWQgZXRuYXZpdl9pb21tdV9wdXRfc3ViYWxsb2Nf
dmEoc3RydWN0IGV0bmF2aXZfaW9tbXUgKm1tdSwKPiAgCj4gIAltYXBwaW5nLT51c2UgPSAwOwo+
ICAKPiAtCWlmIChtbXUtPnZlcnNpb24gPT0gRVROQVZJVl9JT01NVV9WMSkKPiArCWlmIChjb250
ZXh0LT5nbG9iYWwtPnZlcnNpb24gPT0gRVROQVZJVl9JT01NVV9WMSkKPiAgCQlyZXR1cm47Cj4g
IAo+IC0JbXV0ZXhfbG9jaygmbW11LT5sb2NrKTsKPiAtCWV0bmF2aXZfZG9tYWluX3VubWFwKG1t
dS0+ZG9tYWluLCBub2RlLT5zdGFydCwgbm9kZS0+c2l6ZSk7Cj4gKwltdXRleF9sb2NrKCZjb250
ZXh0LT5sb2NrKTsKPiArCWV0bmF2aXZfY29udGV4dF91bm1hcChjb250ZXh0LCBub2RlLT5zdGFy
dCwgbm9kZS0+c2l6ZSk7Cj4gIAlkcm1fbW1fcmVtb3ZlX25vZGUobm9kZSk7Cj4gLQltdXRleF91
bmxvY2soJm1tdS0+bG9jayk7Cj4gKwltdXRleF91bmxvY2soJmNvbnRleHQtPmxvY2spOwo+ICt9
Cj4gKwo+ICtzaXplX3QgZXRuYXZpdl9pb21tdV9kdW1wX3NpemUoc3RydWN0IGV0bmF2aXZfaW9t
bXVfY29udGV4dCAqY29udGV4dCkKPiArewo+ICsJcmV0dXJuIGNvbnRleHQtPmdsb2JhbC0+b3Bz
LT5kdW1wX3NpemUoY29udGV4dCk7Cj4gIH0KPiAgCj4gLXNpemVfdCBldG5hdml2X2lvbW11X2R1
bXBfc2l6ZShzdHJ1Y3QgZXRuYXZpdl9pb21tdSAqaW9tbXUpCj4gK3ZvaWQgZXRuYXZpdl9pb21t
dV9kdW1wKHN0cnVjdCBldG5hdml2X2lvbW11X2NvbnRleHQgKmNvbnRleHQsIHZvaWQgKmJ1ZikK
PiAgewo+IC0JcmV0dXJuIGlvbW11LT5kb21haW4tPm9wcy0+ZHVtcF9zaXplKGlvbW11LT5kb21h
aW4pOwo+ICsJY29udGV4dC0+Z2xvYmFsLT5vcHMtPmR1bXAoY29udGV4dCwgYnVmKTsKPiAgfQo+
ICAKPiAtdm9pZCBldG5hdml2X2lvbW11X2R1bXAoc3RydWN0IGV0bmF2aXZfaW9tbXUgKmlvbW11
LCB2b2lkICpidWYpCj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgZXRuYXZpdl9pb21tdV9vcHMgZXRu
YXZpdl9pb21tdXYxX29wczsKPiArZXh0ZXJuIGNvbnN0IHN0cnVjdCBldG5hdml2X2lvbW11X29w
cyBldG5hdml2X2lvbW11djJfb3BzOwoKVGhlc2Ugc2hvdWxkIGJlIG1vdmVkIGludG8gYSBoZWFk
ZXIgdGhhdCBpcyBhbHNvIGluY2x1ZGVkIHdoZXJlIHRoZSBvcHMKYXJlIGRlZmluZWQuCgpBcGFy
dCBmcm9tIHRoaXMsClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJv
bml4LmRlPgoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZXRuYXZpdg==
