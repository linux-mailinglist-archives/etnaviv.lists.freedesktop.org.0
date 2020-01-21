Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA7143CC7
	for <lists+etnaviv@lfdr.de>; Tue, 21 Jan 2020 13:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35196ECB5;
	Tue, 21 Jan 2020 12:27:15 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0747C6EC44
 for <etnaviv@lists.freedesktop.org>; Tue, 21 Jan 2020 10:22:04 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1itqfZ-0004jX-IB; Tue, 21 Jan 2020 11:22:01 +0100
Message-ID: <8d86fcb526ee14c7e6c80a787db645192c2c7c33.camel@pengutronix.de>
Subject: Re: [PATCH v2 13/24] drm/etnaviv: reject timeouts with tv_nsec >=
 NSEC_PER_SEC
From: Lucas Stach <l.stach@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Jan 2020 11:21:56 +0100
In-Reply-To: <CAK8P3a3hyDeskg0ix=1+yNihqacZ5rqsXaHbRsBfPt7zFr8EOw@mail.gmail.com>
References: <20191213204936.3643476-1-arnd@arndb.de>
 <20191213205417.3871055-4-arnd@arndb.de>
 <20200117154726.GA328525@bogon.m.sigxcpu.org>
 <aaf2f587a61dee42c25805c3fe7916bed4dbd0c3.camel@pengutronix.de>
 <CAK8P3a3hyDeskg0ix=1+yNihqacZ5rqsXaHbRsBfPt7zFr8EOw@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 21 Jan 2020 12:27:14 +0000
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
Cc: Daniel Vetter <daniel@ffwll.ch>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gTW8sIDIwMjAtMDEtMjAgYXQgMTk6NDcgKzAxMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4g
T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgNjo0OCBQTSBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5n
dXRyb25peC5kZT4gd3JvdGU6Cj4gPiBPbiBGciwgMjAyMC0wMS0xNyBhdCAxNjo0NyArMDEwMCwg
R3VpZG8gR8O8bnRoZXIgd3JvdGU6Cj4gPiA+IFRoaXMgYnJlYWtzIHJlbmRlcmluZyBoZXJlIG9u
IGFybTY0L2djNzAwMCBkdWUgdG8KPiA+ID4gCj4gPiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5B
VklWX0dFTV9DUFVfUFJFUCBvciBEUk1fSU9DVExfTVNNX0dFTV9DUFVfUFJFUCwgMHhmZmZmZjc4
ODg2ODApID0gLTEgRUlOVkFMIChJbnZhbGlkIGFyZ3VtZW50KQo+ID4gPiBpb2N0bCg2LCBEUk1f
SU9DVExfRVROQVZJVl9HRU1fQ1BVX0ZJTkkgb3IgRFJNX0lPQ1RMX1FYTF9DTElFTlRDQVAsIDB4
ZmZmZmY3ODg4NWUwKSA9IDAKPiA+ID4gaW9jdGwoNiwgRFJNX0lPQ1RMX0VUTkFWSVZfR0VNX0NQ
VV9QUkVQIG9yIERSTV9JT0NUTF9NU01fR0VNX0NQVV9QUkVQLCAweGZmZmZmNzg4ODY4MCkgPSAt
MSBFSU5WQUwgKEludmFsaWQgYXJndW1lbnQpCj4gPiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5B
VklWX0dFTV9DUFVfRklOSSBvciBEUk1fSU9DVExfUVhMX0NMSUVOVENBUCwgMHhmZmZmZjc4ODg1
ZTApID0gMAo+ID4gPiBpb2N0bCg2LCBEUk1fSU9DVExfRVROQVZJVl9HRU1fQ1BVX1BSRVAgb3Ig
RFJNX0lPQ1RMX01TTV9HRU1fQ1BVX1BSRVAsIDB4ZmZmZmY3ODg4NjgwKSA9IC0xIEVJTlZBTCAo
SW52YWxpZCBhcmd1bWVudCkKPiA+ID4gaW9jdGwoNiwgRFJNX0lPQ1RMX0VUTkFWSVZfR0VNX0NQ
VV9GSU5JIG9yIERSTV9JT0NUTF9RWExfQ0xJRU5UQ0FQLCAweGZmZmZmNzg4ODVlMCkgPSAwCj4g
PiA+IAo+ID4gPiBUaGlzIGlzIGR1ZSB0bwo+ID4gPiAKPiA+ID4gICAgIGdldF9hYnNfdGltZW91
dCgmcmVxLnRpbWVvdXQsIDUwMDAwMDAwMDApOwo+ID4gPiAKPiA+ID4gaW4gZXRuYV9ib19jcHVf
cHJlcCB3aGljaCBjYW4gZXhjZWVkIE5TRUNfUEVSX1NFQy4KPiA+ID4gCj4gPiA+IFNob3VsZCBp
IHNlbmQgYSBwYXRjaCB0byByZXZlcnQgdGhhdCBjaGFuZ2Ugc2luY2UgaXQgYnJlYWtzIGV4aXN0
aW5nIHVzZXJzcGFjZT8KPiA+IAo+ID4gTm8gbmVlZCB0byByZXZlcnQuIFRoaXMgcGF0Y2ggaGFz
IG5vdCBiZWVuIGFwcGxpZWQgdG8gdGhlIGV0bmF2aXYgdHJlZQo+ID4geWV0LCBJIGd1ZXNzIGl0
J3MganVzdCBpbiBvbmUgb2YgQXJuZHMgYnJhbmNoZXMgZmVlZGluZyBpbnRvIC1uZXh0Lgo+ID4g
Cj4gPiBUaGF0IHBhcnQgb2YgdXNlcnNwYWNlIGlzIHByZXR0eSBkdW1iLCBhcyBpdCBtaXNzZXMg
dG8gcmVub3JtYWxpemUKPiA+IHR2X25zZWMgd2hlbiBpdCBvdmVyZmxvd3MgdGhlIHNlY29uZCBi
b3VuZGFyeS4gU28gaWYgd2hhdCBJIHNlZSBpcwo+ID4gY29ycmVjdCBpdCBzaG91bGQgYmUgZW5v
dWdoIHRvIGFsbG93IDIgKiBOU0VDX1BFUl9TRUMsIHdoaWNoIHNob3VsZAo+ID4gYm90aCByZWpl
Y3QgYnJva2VuIGxhcmdlIHRpbWVvdXQgYW5kIGtlZXAgZXhpc3RpbmcgdXNlcnNwYWNlIHdvcmtp
bmcuCj4gCj4gQWgsIHNvIGl0J3MgbmV2ZXIgbW9yZSB0aGFuIDIgYmlsbGlvbiBuYW5vc2Vjb25k
cyBpbiBrbm93biB1c2VyIHNwYWNlPwo+IEkgY2FuIGRlZmluaXRlbHkgY2hhbmdlIG15IHBhdGNo
IChhY3R1YWxseSBhZGQgb25lIG9uIHRvcCkgdG8gYWxsb3cgdGhhdAo+IGFuZCBoYW5kbGUgaXQg
YXMgYmVmb3JlLCBvciBhbHRlcm5hdGl2ZWx5IGFjY2VwdCBhbnkgNjQtYml0IG5hbm9zZWNvbmQg
dmFsdWUKPiBhcyBhcm02NCBhbHJlYWR5IGRpZCwgYnV0IG1ha2UgaXQgbGVzcyBpbmVmZmljaWVu
dCB0byBoYW5kbGUuCgpTbyB0aGUgYnJva2VuIHVzZXJzcGFjZSBjb2RlIGxvb2tzIGxpa2UgdGhp
czoKCnN0YXRpYyBpbmxpbmUgdm9pZCBnZXRfYWJzX3RpbWVvdXQoc3RydWN0IGRybV9ldG5hdml2
X3RpbWVzcGVjICp0diwgdWludDY0X3QgbnMpCnsKICAgICAgICBzdHJ1Y3QgdGltZXNwZWMgdDsK
ICAgICAgICB1aW50MzJfdCBzID0gbnMgLyAxMDAwMDAwMDAwOwogICAgICAgIGNsb2NrX2dldHRp
bWUoQ0xPQ0tfTU9OT1RPTklDLCAmdCk7CiAgICAgICAgdHYtPnR2X3NlYyA9IHQudHZfc2VjICsg
czsKICAgICAgICB0di0+dHZfbnNlYyA9IHQudHZfbnNlYyArIG5zIC0gKHMgKiAxMDAwMDAwMDAw
KTsKfQoKV2hpY2ggbWVhbnMgaXQgX3RyaWVzXyB0byBkbyB0aGUgcmlnaHQgdGhpbmcgYnkgcHV0
dGluZyB0aGUgYmlsbGlvbgpwYXJ0IGludG8gdGhlIHR2X3NlYyBtZW1iZXIgYW5kIG9ubHkgdGhl
IHJlbWFpbmluZyBucyBwYXJ0IGlzIGFkZGVkIHRvCnR2X25zZWMsIGJ1dCB0aGVuIGl0IGZhaWxz
IHRvIHByb3BhZ2F0ZSBhIHR2X25zZWMgb3ZlcmZsb3cgb3ZlcgpOU0VDX1BFUl9TRUMgaW50byB0
dl9zZWMuCgpXaGljaCBtZWFucyB0aGUgdHZfbnNlYyBzaG91bGQgbmV2ZXIgYmUgbW9yZSB0aGFu
IDIgKiBOU0VDX1BFUl9TRUMgaW4Ka25vd24gdXNlcnNwYWNlLiBJIHdvdWxkIHByZWZlciBpZiB3
ZSBjb3VsZCBtYWtlIHRoZSBpbnRlcmZhY2UgYXMKc3RyaWN0IGFzIHBvc3NpYmxlIChpLmUuIG5v
IGFyYml0cmFyeSBsYXJnZSBudW1iZXJzIGluIHR2X25zZWMpLCB3aGlsZQprZWVwaW5nIHRoaXMg
c3BlY2lmaWMgY29ybmVyIGNhc2Ugd29ya2luZy4KClJlZ2FyZHMsCkx1Y2FzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlz
dApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXYK
