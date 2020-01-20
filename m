Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6FE143296
	for <lists+etnaviv@lfdr.de>; Mon, 20 Jan 2020 20:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C236EA87;
	Mon, 20 Jan 2020 19:45:57 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jan 2020 18:52:28 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308696EAF9
 for <etnaviv@lists.freedesktop.org>; Mon, 20 Jan 2020 18:52:28 +0000 (UTC)
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N3bnP-1jbe4v2WtX-010Zhu; Mon, 20 Jan 2020 19:47:22 +0100
Received: by mail-qt1-f177.google.com with SMTP id v25so574701qto.7;
 Mon, 20 Jan 2020 10:47:22 -0800 (PST)
X-Gm-Message-State: APjAAAUSZgky/fFL/nHpg1FH+P/CXK649rnKINZiCKg7xS9hPU/q4xz3
 T09w6StQqGLPgCdJy2sOG+6F3qN/GfEmrYkIeBQ=
X-Google-Smtp-Source: APXvYqycyf0qqu0RCiFareFgGs8N2x/oLdMuYwKyff9Jjl/NAUx9wu9qn31edmJW7IBGpDJDuVlEPTWwYQ2T+6Hwf2g=
X-Received: by 2002:ac8:709a:: with SMTP id y26mr751883qto.304.1579546041415; 
 Mon, 20 Jan 2020 10:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20191213204936.3643476-1-arnd@arndb.de>
 <20191213205417.3871055-4-arnd@arndb.de>
 <20200117154726.GA328525@bogon.m.sigxcpu.org>
 <aaf2f587a61dee42c25805c3fe7916bed4dbd0c3.camel@pengutronix.de>
In-Reply-To: <aaf2f587a61dee42c25805c3fe7916bed4dbd0c3.camel@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Jan 2020 19:47:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3hyDeskg0ix=1+yNihqacZ5rqsXaHbRsBfPt7zFr8EOw@mail.gmail.com>
Message-ID: <CAK8P3a3hyDeskg0ix=1+yNihqacZ5rqsXaHbRsBfPt7zFr8EOw@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] drm/etnaviv: reject timeouts with tv_nsec >=
 NSEC_PER_SEC
To: Lucas Stach <l.stach@pengutronix.de>
X-Provags-ID: V03:K1:FjJXgVKlhYG1ZwQ1NszrOLZVGwaTQ6J91jozvbT2YZ9SifSGiP3
 zzwTn/rZhGBPEP4EbNSlKZ9rJkqMfW33S3K4mlVZljIo2I1K2Fvsv44vh2bssMfbOQvEyZv
 qmIiXN+CVDdjSxupN1cpV3/M0HPDsIN8ExpaxN2izkfHLXtZ+gU6gBePp0AVj+JBjA9NOS5
 oaVHPU+z4A45PKDC/RxUA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n3z9YNz8U7Q=:PODKxHHaLhF8aGph8a4ltF
 6DEiAZgMluSeXKsrqFCxVKN/jhIqHF9tkaLvTjz4zZ4/XzzvZLpEiSjyJlLASn4aYD/CHv/9z
 H1Q+v5duiUbngbFJmdmAoHmkzcchR7+vwAVJ926GL3yFOyWtD/NV3y6iUJKn+Qh5OQ3WHqJhj
 iZ/XA4cnShq4yKfK6F3YR7I5jpgZB1fEG+57XI1h1mIqPk5NW1FtEal4EWZmJHeMvalYwyso5
 NP0CEJHd0/p+FDOfpACzqVFu1cVL9L88ezbUttHYUXyzXNU+AUR6VOZh2NKQZAkZMLeTZnzAe
 KvwbzhXC1d4FGYk4EeTBGXNVOOeg3lnUgglMbCOn3U6vYLujscOKe4+eTputhiqmJHS46B1dB
 uAs/gVeIbikFIYPE7gyWCf+ImvjGROLYYtlkU+H9ecU2QQ/tCUz+pr2C92AorBlMMrbS1W43B
 XrD3+pCmw52Hp2fcJ8g1bMsnA159/hcVrktboIEHejUVjgdQ9fvE8TyLKd/RlplE6raGlkM2C
 6wl4rxg6oQyFbzE+UCqVSXnirQDUvV3DVr5oeKksSyjTZD/kgeM/uwwTaRJjoM0R9fXjVCIoW
 wu5mUt2omjjqQvr6Qe62gDSU28VAv09Nb2rBjK+OqmmxfsiOasdxMwby1Y27bl4JsVJmd/6a8
 K0La0WrB4+BL3lqLHa3vvvsptSUCjL/mUAq97lQFQaW4ZVnx3AGgsJuedI7mZNEBrU320unoo
 8RpeDsHa2oTn6/hBazc8eK3x2TgbFFXvc2OeZgfpThZQCjxYKMgLMT75xFgWFHLLOCa4vg+ff
 /IGwngnpV2ffa6+foPV3CMadh3MWmDPWpEbJLYFvojKvc7YWUq2cv3o7yQph66sEUBs2tJksl
 OnYzAlplvkZLxNPBcoFw==
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

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgNjo0OCBQTSBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5n
dXRyb25peC5kZT4gd3JvdGU6Cj4gT24gRnIsIDIwMjAtMDEtMTcgYXQgMTY6NDcgKzAxMDAsIEd1
aWRvIEfDvG50aGVyIHdyb3RlOgo+ID4KPiA+IFRoaXMgYnJlYWtzIHJlbmRlcmluZyBoZXJlIG9u
IGFybTY0L2djNzAwMCBkdWUgdG8KPiA+Cj4gPiBpb2N0bCg2LCBEUk1fSU9DVExfRVROQVZJVl9H
RU1fQ1BVX1BSRVAgb3IgRFJNX0lPQ1RMX01TTV9HRU1fQ1BVX1BSRVAsIDB4ZmZmZmY3ODg4Njgw
KSA9IC0xIEVJTlZBTCAoSW52YWxpZCBhcmd1bWVudCkKPiA+IGlvY3RsKDYsIERSTV9JT0NUTF9F
VE5BVklWX0dFTV9DUFVfRklOSSBvciBEUk1fSU9DVExfUVhMX0NMSUVOVENBUCwgMHhmZmZmZjc4
ODg1ZTApID0gMAo+ID4gaW9jdGwoNiwgRFJNX0lPQ1RMX0VUTkFWSVZfR0VNX0NQVV9QUkVQIG9y
IERSTV9JT0NUTF9NU01fR0VNX0NQVV9QUkVQLCAweGZmZmZmNzg4ODY4MCkgPSAtMSBFSU5WQUwg
KEludmFsaWQgYXJndW1lbnQpCj4gPiBpb2N0bCg2LCBEUk1fSU9DVExfRVROQVZJVl9HRU1fQ1BV
X0ZJTkkgb3IgRFJNX0lPQ1RMX1FYTF9DTElFTlRDQVAsIDB4ZmZmZmY3ODg4NWUwKSA9IDAKPiA+
IGlvY3RsKDYsIERSTV9JT0NUTF9FVE5BVklWX0dFTV9DUFVfUFJFUCBvciBEUk1fSU9DVExfTVNN
X0dFTV9DUFVfUFJFUCwgMHhmZmZmZjc4ODg2ODApID0gLTEgRUlOVkFMIChJbnZhbGlkIGFyZ3Vt
ZW50KQo+ID4gaW9jdGwoNiwgRFJNX0lPQ1RMX0VUTkFWSVZfR0VNX0NQVV9GSU5JIG9yIERSTV9J
T0NUTF9RWExfQ0xJRU5UQ0FQLCAweGZmZmZmNzg4ODVlMCkgPSAwCj4gPgo+ID4gVGhpcyBpcyBk
dWUgdG8KPiA+Cj4gPiAgICAgZ2V0X2Fic190aW1lb3V0KCZyZXEudGltZW91dCwgNTAwMDAwMDAw
MCk7Cj4gPgo+ID4gaW4gZXRuYV9ib19jcHVfcHJlcCB3aGljaCBjYW4gZXhjZWVkIE5TRUNfUEVS
X1NFQy4KPiA+Cj4gPiBTaG91bGQgaSBzZW5kIGEgcGF0Y2ggdG8gcmV2ZXJ0IHRoYXQgY2hhbmdl
IHNpbmNlIGl0IGJyZWFrcyBleGlzdGluZyB1c2Vyc3BhY2U/Cj4KPiBObyBuZWVkIHRvIHJldmVy
dC4gVGhpcyBwYXRjaCBoYXMgbm90IGJlZW4gYXBwbGllZCB0byB0aGUgZXRuYXZpdiB0cmVlCj4g
eWV0LCBJIGd1ZXNzIGl0J3MganVzdCBpbiBvbmUgb2YgQXJuZHMgYnJhbmNoZXMgZmVlZGluZyBp
bnRvIC1uZXh0Lgo+Cj4gVGhhdCBwYXJ0IG9mIHVzZXJzcGFjZSBpcyBwcmV0dHkgZHVtYiwgYXMg
aXQgbWlzc2VzIHRvIHJlbm9ybWFsaXplCj4gdHZfbnNlYyB3aGVuIGl0IG92ZXJmbG93cyB0aGUg
c2Vjb25kIGJvdW5kYXJ5LiBTbyBpZiB3aGF0IEkgc2VlIGlzCj4gY29ycmVjdCBpdCBzaG91bGQg
YmUgZW5vdWdoIHRvIGFsbG93IDIgKiBOU0VDX1BFUl9TRUMsIHdoaWNoIHNob3VsZAo+IGJvdGgg
cmVqZWN0IGJyb2tlbiBsYXJnZSB0aW1lb3V0IGFuZCBrZWVwIGV4aXN0aW5nIHVzZXJzcGFjZSB3
b3JraW5nLgoKQWgsIHNvIGl0J3MgbmV2ZXIgbW9yZSB0aGFuIDIgYmlsbGlvbiBuYW5vc2Vjb25k
cyBpbiBrbm93biB1c2VyIHNwYWNlPwpJIGNhbiBkZWZpbml0ZWx5IGNoYW5nZSBteSBwYXRjaCAo
YWN0dWFsbHkgYWRkIG9uZSBvbiB0b3ApIHRvIGFsbG93IHRoYXQKYW5kIGhhbmRsZSBpdCBhcyBi
ZWZvcmUsIG9yIGFsdGVybmF0aXZlbHkgYWNjZXB0IGFueSA2NC1iaXQgbmFub3NlY29uZCB2YWx1
ZQphcyBhcm02NCBhbHJlYWR5IGRpZCwgYnV0IG1ha2UgaXQgbGVzcyBpbmVmZmljaWVudCB0byBo
YW5kbGUuCgogICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2
aXYK
