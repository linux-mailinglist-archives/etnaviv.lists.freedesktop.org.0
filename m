Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B85E143CC8
	for <lists+etnaviv@lfdr.de>; Tue, 21 Jan 2020 13:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D4D6ECB4;
	Tue, 21 Jan 2020 12:27:15 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Tue, 21 Jan 2020 11:51:24 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C731C6EC8B
 for <etnaviv@lists.freedesktop.org>; Tue, 21 Jan 2020 11:51:24 +0000 (UTC)
Received: from mail-qv1-f47.google.com ([209.85.219.47]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N3bGP-1jbM2C1Oy3-010gh6; Tue, 21 Jan 2020 12:46:19 +0100
Received: by mail-qv1-f47.google.com with SMTP id t6so1264325qvs.5;
 Tue, 21 Jan 2020 03:46:19 -0800 (PST)
X-Gm-Message-State: APjAAAWa0naDNBnvQGPFjMNdJUK1v7abzOOixpSwvr01WD6eNeLQpbSh
 Wu4VvAQcojqDaRPLGTn0kM7i//fnIcBoxrCa3hE=
X-Google-Smtp-Source: APXvYqyxZGlIFCBF780+KS/2bkfvq0hP+a0/hThj2asG4RwHxIFlbrU9wtbrUp8O1361oVkawD1TQHBg3rBp7/M4I3g=
X-Received: by 2002:a0c:e7c7:: with SMTP id c7mr4350634qvo.222.1579607178086; 
 Tue, 21 Jan 2020 03:46:18 -0800 (PST)
MIME-Version: 1.0
References: <20191213204936.3643476-1-arnd@arndb.de>
 <20191213205417.3871055-4-arnd@arndb.de>
 <20200117154726.GA328525@bogon.m.sigxcpu.org>
 <aaf2f587a61dee42c25805c3fe7916bed4dbd0c3.camel@pengutronix.de>
 <CAK8P3a3hyDeskg0ix=1+yNihqacZ5rqsXaHbRsBfPt7zFr8EOw@mail.gmail.com>
 <8d86fcb526ee14c7e6c80a787db645192c2c7c33.camel@pengutronix.de>
In-Reply-To: <8d86fcb526ee14c7e6c80a787db645192c2c7c33.camel@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Jan 2020 12:46:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0tKt_ZfAPnPKbaOQ9j3A+kS0LypeGA46epdyQw-knitA@mail.gmail.com>
Message-ID: <CAK8P3a0tKt_ZfAPnPKbaOQ9j3A+kS0LypeGA46epdyQw-knitA@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] drm/etnaviv: reject timeouts with tv_nsec >=
 NSEC_PER_SEC
To: Lucas Stach <l.stach@pengutronix.de>
X-Provags-ID: V03:K1:7cCfG2I6unPcykExA0eqGhnxq3kI8O7GEPYxwEe4m0+U+J5oK/c
 Ih/SDYWYAkHN/g2GTL6b02UWOOSR+VEJriLqsKoTsYJ52+WgOb+hKHCEFrnga8Mton3z+Qj
 pkxoKV1bLskDuw6DVDnY4lbJ1ooUVIeeC4UKDucBoro5wVYWM8DRoQ2x5zExya0exZ4Lq1C
 TBuHpiXgZ1jupKl/3q7YQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jj9Hz3Sk2WI=:vkK1v33bFmkdgmV9yZ+duh
 LaHVq20iKjHKgY1ooUO6XS1hxCHAQmyfjGzdhFUo+08E+bvR3m0KVsUr5gpVm7z7gava/y4vO
 CpMLxHVSD5rPMXsoIGgbgFOoAP8MZw07St0A5aTSyqvXjSK7BcNWc+pevYG7Y1yluTVrbFWrG
 lJuLPltGiVdZ7SuYmLIYUbpJzK4LPbieOid0JgudI/F3Po42CqSjatYUvw/5MoKYFShNAZLYd
 NfazY+5y8o9JqtZixcdVMJgvmNlI9J3t0ri8HukKx27zsPhIn632Vsgr4OcSk8vgaR/y0WNFB
 yhitO8YF+4Iemc3zGWmfvYNKW2HWZkQ+IIc6uuSzsSrp5LACiu5Fgyk++vRWYEg3R0DaeHzvO
 x2kjQj+lgNEsmfMdrdoXTc5j6/6dsIvFv/Y9mdKH0KJ13A8MP+rwM6GgLmH3OOOhsyFRyKDhg
 EnGdSSYkk+dzmG2OOKad6w4r6vexwBs19hrZyM2eHk7iZN9Yrwbux5EwCoOzA0gF5/pccvMZE
 vFtu3sDoMAIUnTLP1WnWZiXAwxMroJoqm5B/hO227aOFd+ZXCFj/8KR7yow1cjgdcjByEhqRt
 RcxXwLvoo6iiZdA4YLLsuoSP9WIdI3/04A974abQcfeYZK49swCM1mcbwzmsq2tt/pEB7BRMs
 MaY5kwL7xhC5/Xxt6dmO5xoa3yZmdwNMLzzRgcHRPVYktTJRZxdFDbCVO9YvhnoE8Tyndnpl2
 RldifYVB1KWPv7zuJgn/g76iqzYv7ioYvnt+WHJWWQt/WeGx02aMUQObGVufs1ERDmN64lRh3
 ve184AhQHWhYGqaSLe/nXcTF3Iw5yPbXcp1bAOvL3FYlpM2L4GYvfr9YVfZlwoOY7j+N8vo3a
 u92HHCtc5XFw5t021QwA==
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
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
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

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMTE6MjIgQU0gTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVu
Z3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gTW8sIDIwMjAtMDEtMjAgYXQgMTk6NDcgKzAxMDAs
IEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAyMCwgMjAyMCBhdCA2OjQ4IFBN
IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+ID4gT24gRnIs
IDIwMjAtMDEtMTcgYXQgMTY6NDcgKzAxMDAsIEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+ID4gPiA+
IFRoaXMgYnJlYWtzIHJlbmRlcmluZyBoZXJlIG9uIGFybTY0L2djNzAwMCBkdWUgdG8KPiA+ID4g
Pgo+ID4gPiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfUFJFUCBvciBEUk1f
SU9DVExfTVNNX0dFTV9DUFVfUFJFUCwgMHhmZmZmZjc4ODg2ODApID0gLTEgRUlOVkFMIChJbnZh
bGlkIGFyZ3VtZW50KQo+ID4gPiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVf
RklOSSBvciBEUk1fSU9DVExfUVhMX0NMSUVOVENBUCwgMHhmZmZmZjc4ODg1ZTApID0gMAo+ID4g
PiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfUFJFUCBvciBEUk1fSU9DVExf
TVNNX0dFTV9DUFVfUFJFUCwgMHhmZmZmZjc4ODg2ODApID0gLTEgRUlOVkFMIChJbnZhbGlkIGFy
Z3VtZW50KQo+ID4gPiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfRklOSSBv
ciBEUk1fSU9DVExfUVhMX0NMSUVOVENBUCwgMHhmZmZmZjc4ODg1ZTApID0gMAo+ID4gPiA+IGlv
Y3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfUFJFUCBvciBEUk1fSU9DVExfTVNNX0dF
TV9DUFVfUFJFUCwgMHhmZmZmZjc4ODg2ODApID0gLTEgRUlOVkFMIChJbnZhbGlkIGFyZ3VtZW50
KQo+ID4gPiA+IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfRklOSSBvciBEUk1f
SU9DVExfUVhMX0NMSUVOVENBUCwgMHhmZmZmZjc4ODg1ZTApID0gMAo+ID4gPiA+Cj4gPiA+ID4g
VGhpcyBpcyBkdWUgdG8KPiA+ID4gPgo+ID4gPiA+ICAgICBnZXRfYWJzX3RpbWVvdXQoJnJlcS50
aW1lb3V0LCA1MDAwMDAwMDAwKTsKPiA+ID4gPgo+ID4gPiA+IGluIGV0bmFfYm9fY3B1X3ByZXAg
d2hpY2ggY2FuIGV4Y2VlZCBOU0VDX1BFUl9TRUMuCj4gPiA+ID4KPiA+ID4gPiBTaG91bGQgaSBz
ZW5kIGEgcGF0Y2ggdG8gcmV2ZXJ0IHRoYXQgY2hhbmdlIHNpbmNlIGl0IGJyZWFrcyBleGlzdGlu
ZyB1c2Vyc3BhY2U/Cj4gPiA+Cj4gPiA+IE5vIG5lZWQgdG8gcmV2ZXJ0LiBUaGlzIHBhdGNoIGhh
cyBub3QgYmVlbiBhcHBsaWVkIHRvIHRoZSBldG5hdml2IHRyZWUKPiA+ID4geWV0LCBJIGd1ZXNz
IGl0J3MganVzdCBpbiBvbmUgb2YgQXJuZHMgYnJhbmNoZXMgZmVlZGluZyBpbnRvIC1uZXh0Lgo+
ID4gPgo+ID4gPiBUaGF0IHBhcnQgb2YgdXNlcnNwYWNlIGlzIHByZXR0eSBkdW1iLCBhcyBpdCBt
aXNzZXMgdG8gcmVub3JtYWxpemUKPiA+ID4gdHZfbnNlYyB3aGVuIGl0IG92ZXJmbG93cyB0aGUg
c2Vjb25kIGJvdW5kYXJ5LiBTbyBpZiB3aGF0IEkgc2VlIGlzCj4gPiA+IGNvcnJlY3QgaXQgc2hv
dWxkIGJlIGVub3VnaCB0byBhbGxvdyAyICogTlNFQ19QRVJfU0VDLCB3aGljaCBzaG91bGQKPiA+
ID4gYm90aCByZWplY3QgYnJva2VuIGxhcmdlIHRpbWVvdXQgYW5kIGtlZXAgZXhpc3RpbmcgdXNl
cnNwYWNlIHdvcmtpbmcuCj4gPgo+ID4gQWgsIHNvIGl0J3MgbmV2ZXIgbW9yZSB0aGFuIDIgYmls
bGlvbiBuYW5vc2Vjb25kcyBpbiBrbm93biB1c2VyIHNwYWNlPwo+ID4gSSBjYW4gZGVmaW5pdGVs
eSBjaGFuZ2UgbXkgcGF0Y2ggKGFjdHVhbGx5IGFkZCBvbmUgb24gdG9wKSB0byBhbGxvdyB0aGF0
Cj4gPiBhbmQgaGFuZGxlIGl0IGFzIGJlZm9yZSwgb3IgYWx0ZXJuYXRpdmVseSBhY2NlcHQgYW55
IDY0LWJpdCBuYW5vc2Vjb25kIHZhbHVlCj4gPiBhcyBhcm02NCBhbHJlYWR5IGRpZCwgYnV0IG1h
a2UgaXQgbGVzcyBpbmVmZmljaWVudCB0byBoYW5kbGUuCj4KPiBTbyB0aGUgYnJva2VuIHVzZXJz
cGFjZSBjb2RlIGxvb2tzIGxpa2UgdGhpczoKPgo+IHN0YXRpYyBpbmxpbmUgdm9pZCBnZXRfYWJz
X3RpbWVvdXQoc3RydWN0IGRybV9ldG5hdml2X3RpbWVzcGVjICp0diwgdWludDY0X3QgbnMpCj4g
ewo+ICAgICAgICAgc3RydWN0IHRpbWVzcGVjIHQ7Cj4gICAgICAgICB1aW50MzJfdCBzID0gbnMg
LyAxMDAwMDAwMDAwOwo+ICAgICAgICAgY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsICZ0
KTsKPiAgICAgICAgIHR2LT50dl9zZWMgPSB0LnR2X3NlYyArIHM7Cj4gICAgICAgICB0di0+dHZf
bnNlYyA9IHQudHZfbnNlYyArIG5zIC0gKHMgKiAxMDAwMDAwMDAwKTsKPiB9Cj4KPiBXaGljaCBt
ZWFucyBpdCBfdHJpZXNfIHRvIGRvIHRoZSByaWdodCB0aGluZyBieSBwdXR0aW5nIHRoZSBiaWxs
aW9uCj4gcGFydCBpbnRvIHRoZSB0dl9zZWMgbWVtYmVyIGFuZCBvbmx5IHRoZSByZW1haW5pbmcg
bnMgcGFydCBpcyBhZGRlZCB0bwo+IHR2X25zZWMsIGJ1dCB0aGVuIGl0IGZhaWxzIHRvIHByb3Bh
Z2F0ZSBhIHR2X25zZWMgb3ZlcmZsb3cgb3Zlcgo+IE5TRUNfUEVSX1NFQyBpbnRvIHR2X3NlYy4K
Pgo+IFdoaWNoIG1lYW5zIHRoZSB0dl9uc2VjIHNob3VsZCBuZXZlciBiZSBtb3JlIHRoYW4gMiAq
IE5TRUNfUEVSX1NFQyBpbgo+IGtub3duIHVzZXJzcGFjZS4gSSB3b3VsZCBwcmVmZXIgaWYgd2Ug
Y291bGQgbWFrZSB0aGUgaW50ZXJmYWNlIGFzCj4gc3RyaWN0IGFzIHBvc3NpYmxlIChpLmUuIG5v
IGFyYml0cmFyeSBsYXJnZSBudW1iZXJzIGluIHR2X25zZWMpLCB3aGlsZQo+IGtlZXBpbmcgdGhp
cyBzcGVjaWZpYyBjb3JuZXIgY2FzZSB3b3JraW5nLgoKSSd2ZSBhZGRlZCBhIHBhdGNoIG9uIHRv
cCBvZiBteSAyMDM4IGJyYW5jaCwgcGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoYXQuCgogICAgICBB
cm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2
aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdgo=
