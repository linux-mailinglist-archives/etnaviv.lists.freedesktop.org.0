Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFDE143295
	for <lists+etnaviv@lfdr.de>; Mon, 20 Jan 2020 20:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532E86EA7E;
	Mon, 20 Jan 2020 19:45:57 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66116EAAC
 for <etnaviv@lists.freedesktop.org>; Mon, 20 Jan 2020 17:48:02 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1itb9b-0004hc-84; Mon, 20 Jan 2020 18:47:59 +0100
Message-ID: <aaf2f587a61dee42c25805c3fe7916bed4dbd0c3.camel@pengutronix.de>
Subject: Re: [PATCH v2 13/24] drm/etnaviv: reject timeouts with tv_nsec >=
 NSEC_PER_SEC
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Arnd Bergmann
 <arnd@arndb.de>
Date: Mon, 20 Jan 2020 18:47:56 +0100
In-Reply-To: <20200117154726.GA328525@bogon.m.sigxcpu.org>
References: <20191213204936.3643476-1-arnd@arndb.de>
 <20191213205417.3871055-4-arnd@arndb.de>
 <20200117154726.GA328525@bogon.m.sigxcpu.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
X-Mailman-Approved-At: Mon, 20 Jan 2020 19:45:56 +0000
X-BeenThere: etnaviv@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <etnaviv.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/etnaviv>
List-Post: <mailto:etnaviv@lists.freedesktop.org>
List-Help: <mailto:etnaviv-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Vetter <daniel@ffwll.ch>, y2038@lists.linaro.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gRnIsIDIwMjAtMDEtMTcgYXQgMTY6NDcgKzAxMDAsIEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+
IEhpLAo+IE9uIEZyaSwgRGVjIDEzLCAyMDE5IGF0IDA5OjUzOjQxUE0gKzAxMDAsIEFybmQgQmVy
Z21hbm4gd3JvdGU6Cj4gPiBNb3N0IGtlcm5lbCBpbnRlcmZhY2VzIHRoYXQgdGFrZSBhIHRpbWVz
cGVjIHJlcXVpcmUgbm9ybWFsaXplZAo+ID4gcmVwcmVzZW50YXRpb24gd2l0aCB0dl9uc2VjIGJl
dHdlZW4gMCBhbmQgTlNFQ19QRVJfU0VDLgo+ID4gCj4gPiBQYXNzaW5nIHZhbHVlcyBsYXJnZXIg
dGhhbiAweDEwMDAwMDAwMHVsbCBmdXJ0aGVyIGJlaGF2ZXMgZGlmZmVyZW50bHkKPiA+IG9uIDMy
LWJpdCBhbmQgNjQtYml0IGtlcm5lbHMsIGFuZCBjYW4gY2F1c2UgdGhlIGxhdHRlciB0byBzcGVu
ZCBhIGxvbmcKPiA+IHRpbWUgY291bnRpbmcgc2Vjb25kcyBpbiB0aW1lc3BlYzY0X3N1YigpL3Nl
dF9ub3JtYWxpemVkX3RpbWVzcGVjNjQoKS4KPiA+IAo+ID4gUmVqZWN0IHRob3NlIGxhcmdlIHZh
bHVlcyBhdCB0aGUgdXNlciBpbnRlcmZhY2UgdG8gZW5mb3JjZSBzYW5lIGFuZAo+ID4gcG9ydGFi
bGUgYmVoYXZpb3IuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Ry
di5jIHwgOSArKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYwo+ID4gaW5kZXggMWY5YzAx
YmU0MGQ3Li45NWQ3MmRjMDAyODAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRu
YXZpdi9ldG5hdml2X2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2Rydi5jCj4gPiBAQCAtMjk3LDYgKzI5Nyw5IEBAIHN0YXRpYyBpbnQgZXRuYXZpdl9pb2N0
bF9nZW1fY3B1X3ByZXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+ICAJ
aWYgKGFyZ3MtPm9wICYgfihFVE5BX1BSRVBfUkVBRCB8IEVUTkFfUFJFUF9XUklURSB8IEVUTkFf
UFJFUF9OT1NZTkMpKQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gPiAgCj4gPiArCWlmIChhcmdz
LT50aW1lb3V0LnR2X25zZWMgPiBOU0VDX1BFUl9TRUMpCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsK
PiA+ICsKPiA+ICAJb2JqID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGUsIGFyZ3MtPmhhbmRs
ZSk7Cj4gPiAgCWlmICghb2JqKQo+ID4gIAkJcmV0dXJuIC1FTk9FTlQ7Cj4gPiBAQCAtMzYwLDYg
KzM2Myw5IEBAIHN0YXRpYyBpbnQgZXRuYXZpdl9pb2N0bF93YWl0X2ZlbmNlKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gPiAgCWlmIChhcmdzLT5mbGFncyAmIH4oRVROQV9X
QUlUX05PTkJMT0NLKSkKPiA+ICAJCXJldHVybiAtRUlOVkFMOwo+ID4gIAo+ID4gKwlpZiAoYXJn
cy0+dGltZW91dC50dl9uc2VjID4gTlNFQ19QRVJfU0VDKQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7
Cj4gPiArCj4gPiAgCWlmIChhcmdzLT5waXBlID49IEVUTkFfTUFYX1BJUEVTKQo+ID4gIAkJcmV0
dXJuIC1FSU5WQUw7Cj4gPiAgCj4gPiBAQCAtNDExLDYgKzQxNyw5IEBAIHN0YXRpYyBpbnQgZXRu
YXZpdl9pb2N0bF9nZW1fd2FpdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+
ID4gIAlpZiAoYXJncy0+ZmxhZ3MgJiB+KEVUTkFfV0FJVF9OT05CTE9DSykpCj4gPiAgCQlyZXR1
cm4gLUVJTlZBTDsKPiA+ICAKPiA+ICsJaWYgKGFyZ3MtPnRpbWVvdXQudHZfbnNlYyA+IE5TRUNf
UEVSX1NFQykKPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gIAlpZiAoYXJncy0+cGlw
ZSA+PSBFVE5BX01BWF9QSVBFUykKPiA+ICAJCXJldHVybiAtRUlOVkFMOwo+ID4gCj4gCj4gVGhp
cyBicmVha3MgcmVuZGVyaW5nIGhlcmUgb24gYXJtNjQvZ2M3MDAwIGR1ZSB0bwo+IAo+IGlvY3Rs
KDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfUFJFUCBvciBEUk1fSU9DVExfTVNNX0dFTV9D
UFVfUFJFUCwgMHhmZmZmZjc4ODg2ODApID0gLTEgRUlOVkFMIChJbnZhbGlkIGFyZ3VtZW50KQo+
IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfRklOSSBvciBEUk1fSU9DVExfUVhM
X0NMSUVOVENBUCwgMHhmZmZmZjc4ODg1ZTApID0gMAo+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5B
VklWX0dFTV9DUFVfUFJFUCBvciBEUk1fSU9DVExfTVNNX0dFTV9DUFVfUFJFUCwgMHhmZmZmZjc4
ODg2ODApID0gLTEgRUlOVkFMIChJbnZhbGlkIGFyZ3VtZW50KQo+IGlvY3RsKDYsIERSTV9JT0NU
TF9FVE5BVklWX0dFTV9DUFVfRklOSSBvciBEUk1fSU9DVExfUVhMX0NMSUVOVENBUCwgMHhmZmZm
Zjc4ODg1ZTApID0gMAo+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfUFJFUCBv
ciBEUk1fSU9DVExfTVNNX0dFTV9DUFVfUFJFUCwgMHhmZmZmZjc4ODg2ODApID0gLTEgRUlOVkFM
IChJbnZhbGlkIGFyZ3VtZW50KQo+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVf
RklOSSBvciBEUk1fSU9DVExfUVhMX0NMSUVOVENBUCwgMHhmZmZmZjc4ODg1ZTApID0gMAo+IAo+
IFRoaXMgaXMgZHVlIHRvCj4gCj4gICAgIGdldF9hYnNfdGltZW91dCgmcmVxLnRpbWVvdXQsIDUw
MDAwMDAwMDApOwo+IAo+IGluIGV0bmFfYm9fY3B1X3ByZXAgd2hpY2ggY2FuIGV4Y2VlZCBOU0VD
X1BFUl9TRUMuCj4gCj4gU2hvdWxkIGkgc2VuZCBhIHBhdGNoIHRvIHJldmVydCB0aGF0IGNoYW5n
ZSBzaW5jZSBpdCBicmVha3MgZXhpc3RpbmcgdXNlcnNwYWNlPwoKTm8gbmVlZCB0byByZXZlcnQu
IFRoaXMgcGF0Y2ggaGFzIG5vdCBiZWVuIGFwcGxpZWQgdG8gdGhlIGV0bmF2aXYgdHJlZQp5ZXQs
IEkgZ3Vlc3MgaXQncyBqdXN0IGluIG9uZSBvZiBBcm5kcyBicmFuY2hlcyBmZWVkaW5nIGludG8g
LW5leHQuCgpUaGF0IHBhcnQgb2YgdXNlcnNwYWNlIGlzIHByZXR0eSBkdW1iLCBhcyBpdCBtaXNz
ZXMgdG8gcmVub3JtYWxpemUKdHZfbnNlYyB3aGVuIGl0IG92ZXJmbG93cyB0aGUgc2Vjb25kIGJv
dW5kYXJ5LiBTbyBpZiB3aGF0IEkgc2VlIGlzCmNvcnJlY3QgaXQgc2hvdWxkIGJlIGVub3VnaCB0
byBhbGxvdyAyICogTlNFQ19QRVJfU0VDLCB3aGljaCBzaG91bGQKYm90aCByZWplY3QgYnJva2Vu
IGxhcmdlIHRpbWVvdXQgYW5kIGtlZXAgZXhpc3RpbmcgdXNlcnNwYWNlIHdvcmtpbmcuCgpSZWdh
cmRzLApMdWNhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2Cg==
