Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CC28BD04
	for <lists+etnaviv@lfdr.de>; Tue, 13 Aug 2019 17:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FE56E182;
	Tue, 13 Aug 2019 15:27:05 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233246E182;
 Tue, 13 Aug 2019 15:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 5101DFB03;
 Tue, 13 Aug 2019 17:27:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQai2YFlbS6w; Tue, 13 Aug 2019 17:27:00 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 76684416CC; Tue, 13 Aug 2019 17:27:00 +0200 (CEST)
Date: Tue, 13 Aug 2019 17:27:00 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 4/8] drm/etnaviv: replace MMU flush marker with flush
 sequence
Message-ID: <20190813152700.GB22471@bogon.m.sigxcpu.org>
References: <20190705171727.27501-1-l.stach@pengutronix.de>
 <20190705171727.27501-4-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705171727.27501-4-l.stach@pengutronix.de>
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
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGksCk9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDA3OjE3OjIzUE0gKzAyMDAsIEx1Y2FzIFN0YWNo
IHdyb3RlOgo+IElmIGEgTU1VIGlzIHNoYXJlZCBiZXR3ZWVuIG11bHRpcGxlIEdQVXMsIGFsbCBv
ZiB0aGVtIG5lZWQgdG8gZmx1c2ggdGhlaXIKPiBUTEJzLCBzbyBhIHNpbmdsZSBtYXJrZXIgdGhh
dCBnZXRzIHJlc2V0IG9uIHRoZSBmaXJzdCBmbHVzaCB3b24ndCBkby4KPiBSZXBsYWNlIHRoZSBm
bHVzaCBtYXJrZXIgd2l0aCBhIHNlcXVlbmNlIG51bWJlciwgc28gdGhhdCBpdCdzIHBvc3NpYmxl
IHRvCj4gY2hlY2sgaWYgdGhlIFRMQiBpcyBpbiBzeW5jIHdpdGggdGhlIGN1cnJlbnQgcGFnZSB0
YWJsZSBzdGF0ZSBmb3IgZWFjaCBHUFUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2gg
PGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpSZXZpZXdlZC1ieTogR3VpZG8gR8O8bnRoZXIgPGFn
eEBzaWd4Y3B1Lm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
YnVmZmVyLmMgfCA5ICsrKysrLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2
X2dwdS5oICAgIHwgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmMg
ICAgfCA2ICsrKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21tdS5oICAg
IHwgMiArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfYnVm
ZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2J1ZmZlci5jCj4gaW5kZXgg
NjQwMGE4OGNkNzc4Li41MzJkYjc3NjI0ZGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9idWZmZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2
L2V0bmF2aXZfYnVmZmVyLmMKPiBAQCAtMzE1LDYgKzMxNSw3IEBAIHZvaWQgZXRuYXZpdl9idWZm
ZXJfcXVldWUoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUsIHUzMiBleGVjX3N0YXRlLAo+ICAJdTMy
IHJldHVybl90YXJnZXQsIHJldHVybl9kd29yZHM7Cj4gIAl1MzIgbGlua190YXJnZXQsIGxpbmtf
ZHdvcmRzOwo+ICAJYm9vbCBzd2l0Y2hfY29udGV4dCA9IGdwdS0+ZXhlY19zdGF0ZSAhPSBleGVj
X3N0YXRlOwo+ICsJYm9vbCBuZWVkX2ZsdXNoID0gZ3B1LT5mbHVzaF9zZXEgIT0gZ3B1LT5tbXUt
PmZsdXNoX3NlcTsKPiAgCj4gIAlsb2NrZGVwX2Fzc2VydF9oZWxkKCZncHUtPmxvY2spOwo+ICAK
PiBAQCAtMzI5LDE0ICszMzAsMTQgQEAgdm9pZCBldG5hdml2X2J1ZmZlcl9xdWV1ZShzdHJ1Y3Qg
ZXRuYXZpdl9ncHUgKmdwdSwgdTMyIGV4ZWNfc3RhdGUsCj4gIAkgKiBuZWVkIHRvIGFwcGVuZCBh
IG1tdSBmbHVzaCBsb2FkIHN0YXRlLCBmb2xsb3dlZCBieSBhIG5ldwo+ICAJICogbGluayB0byB0
aGlzIGJ1ZmZlciAtIGEgdG90YWwgb2YgZm91ciBhZGRpdGlvbmFsIHdvcmRzLgo+ICAJICovCj4g
LQlpZiAoZ3B1LT5tbXUtPm5lZWRfZmx1c2ggfHwgc3dpdGNoX2NvbnRleHQpIHsKPiArCWlmIChu
ZWVkX2ZsdXNoIHx8IHN3aXRjaF9jb250ZXh0KSB7Cj4gIAkJdTMyIHRhcmdldCwgZXh0cmFfZHdv
cmRzOwo+ICAKPiAgCQkvKiBsaW5rIGNvbW1hbmQgKi8KPiAgCQlleHRyYV9kd29yZHMgPSAxOwo+
ICAKPiAgCQkvKiBmbHVzaCBjb21tYW5kICovCj4gLQkJaWYgKGdwdS0+bW11LT5uZWVkX2ZsdXNo
KSB7Cj4gKwkJaWYgKG5lZWRfZmx1c2gpIHsKPiAgCQkJaWYgKGdwdS0+bW11LT52ZXJzaW9uID09
IEVUTkFWSVZfSU9NTVVfVjEpCj4gIAkJCQlleHRyYV9kd29yZHMgKz0gMTsKPiAgCQkJZWxzZQo+
IEBAIC0zNDksNyArMzUwLDcgQEAgdm9pZCBldG5hdml2X2J1ZmZlcl9xdWV1ZShzdHJ1Y3QgZXRu
YXZpdl9ncHUgKmdwdSwgdTMyIGV4ZWNfc3RhdGUsCj4gIAo+ICAJCXRhcmdldCA9IGV0bmF2aXZf
YnVmZmVyX3Jlc2VydmUoZ3B1LCBidWZmZXIsIGV4dHJhX2R3b3Jkcyk7Cj4gIAo+IC0JCWlmIChn
cHUtPm1tdS0+bmVlZF9mbHVzaCkgewo+ICsJCWlmIChuZWVkX2ZsdXNoKSB7Cj4gIAkJCS8qIEFk
ZCB0aGUgTU1VIGZsdXNoICovCj4gIAkJCWlmIChncHUtPm1tdS0+dmVyc2lvbiA9PSBFVE5BVklW
X0lPTU1VX1YxKSB7Cj4gIAkJCQlDTURfTE9BRF9TVEFURShidWZmZXIsIFZJVlNfR0xfRkxVU0hf
TU1VLAo+IEBAIC0zNjksNyArMzcwLDcgQEAgdm9pZCBldG5hdml2X2J1ZmZlcl9xdWV1ZShzdHJ1
Y3QgZXRuYXZpdl9ncHUgKmdwdSwgdTMyIGV4ZWNfc3RhdGUsCj4gIAkJCQkJU1lOQ19SRUNJUElF
TlRfUEUpOwo+ICAJCQl9Cj4gIAo+IC0JCQlncHUtPm1tdS0+bmVlZF9mbHVzaCA9IGZhbHNlOwo+
ICsJCQlncHUtPmZsdXNoX3NlcSA9IGdwdS0+bW11LT5mbHVzaF9zZXE7Cj4gIAkJfQo+ICAKPiAg
CQlpZiAoc3dpdGNoX2NvbnRleHQpIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9ncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1
LmgKPiBpbmRleCA5MzNjOGQwMTZmMTEuLjk2MzgwOTQyY2Q4YyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9ncHUuaAo+IEBAIC0xMzcsNiArMTM3LDcgQEAgc3RydWN0IGV0bmF2
aXZfZ3B1IHsKPiAgCWludCBpcnE7Cj4gIAo+ICAJc3RydWN0IGV0bmF2aXZfaW9tbXUgKm1tdTsK
PiArCXVuc2lnbmVkIGludCBmbHVzaF9zZXE7Cj4gIAo+ICAJLyogUG93ZXIgQ29udHJvbDogKi8K
PiAgCXN0cnVjdCBjbGsgKmNsa19idXM7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9l
dG5hdml2L2V0bmF2aXZfbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X21t
dS5jCj4gaW5kZXggZGQ4MTM3NjcyNGQ3Li4zMzQ4ZDk5NjIxNzcgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfbW11LmMKPiBAQCAtMjYzLDcgKzI2Myw3IEBAIGludCBldG5hdml2
X2lvbW11X21hcF9nZW0oc3RydWN0IGV0bmF2aXZfaW9tbXUgKm1tdSwKPiAgCX0KPiAgCj4gIAls
aXN0X2FkZF90YWlsKCZtYXBwaW5nLT5tbXVfbm9kZSwgJm1tdS0+bWFwcGluZ3MpOwo+IC0JbW11
LT5uZWVkX2ZsdXNoID0gdHJ1ZTsKPiArCW1tdS0+Zmx1c2hfc2VxKys7Cj4gIHVubG9jazoKPiAg
CW11dGV4X3VubG9jaygmbW11LT5sb2NrKTsKPiAgCj4gQEAgLTI4Miw3ICsyODIsNyBAQCB2b2lk
IGV0bmF2aXZfaW9tbXVfdW5tYXBfZ2VtKHN0cnVjdCBldG5hdml2X2lvbW11ICptbXUsCj4gIAkJ
ZXRuYXZpdl9pb21tdV9yZW1vdmVfbWFwcGluZyhtbXUsIG1hcHBpbmcpOwo+ICAKPiAgCWxpc3Rf
ZGVsKCZtYXBwaW5nLT5tbXVfbm9kZSk7Cj4gLQltbXUtPm5lZWRfZmx1c2ggPSB0cnVlOwo+ICsJ
bW11LT5mbHVzaF9zZXErKzsKPiAgCW11dGV4X3VubG9jaygmbW11LT5sb2NrKTsKPiAgfQo+ICAK
PiBAQCAtMzcxLDcgKzM3MSw3IEBAIGludCBldG5hdml2X2lvbW11X2dldF9zdWJhbGxvY192YShz
dHJ1Y3QgZXRuYXZpdl9pb21tdSAqbW11LAo+ICAJCX0KPiAgCj4gIAkJbGlzdF9hZGRfdGFpbCgm
bWFwcGluZy0+bW11X25vZGUsICZtbXUtPm1hcHBpbmdzKTsKPiAtCQltbXUtPm5lZWRfZmx1c2gg
PSB0cnVlOwo+ICsJCW1tdS0+Zmx1c2hfc2VxKys7Cj4gIAl9Cj4gIAo+ICAJbWFwcGluZy0+dXNl
ID0gMTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9tbXUu
aCBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfbW11LmgKPiBpbmRleCBmZTFjOWQ2
YjkzMzQuLjM0YWZlMjVkZjljYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X21tdS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9t
bXUuaAo+IEBAIC00OCw3ICs0OCw3IEBAIHN0cnVjdCBldG5hdml2X2lvbW11IHsKPiAgCXN0cnVj
dCBtdXRleCBsb2NrOwo+ICAJc3RydWN0IGxpc3RfaGVhZCBtYXBwaW5nczsKPiAgCXN0cnVjdCBk
cm1fbW0gbW07Cj4gLQlib29sIG5lZWRfZmx1c2g7Cj4gKwl1bnNpZ25lZCBpbnQgZmx1c2hfc2Vx
Owo+ICB9Owo+ICAKPiAgc3RydWN0IGV0bmF2aXZfZ2VtX29iamVjdDsKPiAtLSAKPiAyLjIwLjEK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGV0
bmF2aXYgbWFpbGluZyBsaXN0Cj4gZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXYKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5n
IGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
