Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A648F47385
	for <lists+etnaviv@lfdr.de>; Sun, 16 Jun 2019 09:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5FC8925C;
	Sun, 16 Jun 2019 07:07:36 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7623188E7E
 for <etnaviv@lists.freedesktop.org>; Fri, 14 Jun 2019 20:30:46 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k21so5242180edq.3
 for <etnaviv@lists.freedesktop.org>; Fri, 14 Jun 2019 13:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=KN+MMrJdiVIVfoSWWn55ZRF9gbRyuAu71YCJdRQFpRk=;
 b=FtP24BELaD1XyNi4Ll0dtu1I4bOsP2SlI7ybKBDSUO5sT3gLGuWbx87FdlI1dh5J4c
 1u09K+fT6LJWjR2nwTM3lF90dA4wj86j1OFqEln213UAzQA4YhrW797MwOU8ZXNmH1AG
 ONHhF6GRxiMLwjcoZU0XOFGOYgABErjeTEeWJ24B25B6w6uD71CMnNXJNdyvGZi3cS9E
 2fmMv4wQ/Jtty3202GuP0Kdwss4bMVs8HKybcXanqCzG5tn4fb11XuRw0PPddtCs32Pj
 2/D9r8Dny+QtLz9pZ4hrScrBy62xCbrJ9nb+6TCewHhWu0n+rGYmTswMXr3uCpF+yZP0
 k77g==
X-Gm-Message-State: APjAAAU6dRL3JP4u8mbgLMfjTFiCoQfYG+1Yth26TP80R5P6SP7/NEJP
 Aiy97MSDUJ8iTFXYBYyNLgN4CA==
X-Google-Smtp-Source: APXvYqzs5TtIkPYbwFylQmX4JfL716O72INnTisyVLZpVam1/N8EkPIy/YAYosSNlQ0xCI+3ngip/A==
X-Received: by 2002:a17:906:63c1:: with SMTP id
 u1mr83393976ejk.173.1560544244991; 
 Fri, 14 Jun 2019 13:30:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 17sm1184399edu.21.2019.06.14.13.30.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:30:43 -0700 (PDT)
Date: Fri, 14 Jun 2019 22:30:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 3/6] drm/gem: use new ww_mutex_(un)lock_for_each macros
Message-ID: <20190614203040.GE23020@phenom.ffwll.local>
Mail-Followup-To: christian.koenig@amd.com,
 Peter Zijlstra <peterz@infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Qiang Yu <yuq825@gmail.com>, "Anholt, Eric" <eric@anholt.net>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 lima@lists.freedesktop.org
References: <20190614124125.124181-1-christian.koenig@amd.com>
 <20190614124125.124181-4-christian.koenig@amd.com>
 <20190614131916.GQ3436@hirez.programming.kicks-ass.net>
 <20190614152242.GC23020@phenom.ffwll.local>
 <094da0f7-a0f0-9ed4-d2da-8c6e6d165380@gmail.com>
 <CAKMK7uFcDCJ9sozny1RqqRATwcK39doZNq+NZekvrzuO63ap-Q@mail.gmail.com>
 <d97212dc-367c-28e9-6961-9b99110a4d2e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d97212dc-367c-28e9-6961-9b99110a4d2e@gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 16 Jun 2019 07:07:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=KN+MMrJdiVIVfoSWWn55ZRF9gbRyuAu71YCJdRQFpRk=;
 b=VWM2vYLhPQHrafSrDQJFyDSau+89Xxt/kk+glA2qwPxZ29ccExYoJtEyKzVb7qHMSq
 OF07IqqDGmEAfuCzoUagcSNT4jOb7KzHyf8utimEHOAZIrVJ73/igURZAId4d4hwLd/8
 YpNRjV2z2ylXops4uWCelR0CmBXYmQqv0uhJA=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, lima@lists.freedesktop.org,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>, "Anholt,
 Eric" <eric@anholt.net>, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Qiang Yu <yuq825@gmail.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDg6NTE6MTFQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAxNC4wNi4xOSB1bSAyMDoyNCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4g
PiAKPiA+IE9uIEZyaSwgSnVuIDE0LCAyMDE5IGF0IDg6MTAgUE0gQ2hyaXN0aWFuIEvDtm5pZyA8
Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBbU05JUF0KPiA+
ID4gV1dfTVVURVhfTE9DS19CRUdJTigpCj4gPiA+IAo+ID4gPiBsb2NrKGxydV9sb2NrKTsKPiA+
ID4gCj4gPiA+IHdoaWxlIChibyA9IGxpc3RfZmlyc3QobHJ1KSkgewo+ID4gPiAJaWYgKGtyZWZf
Z2V0X3VubGVzc196ZXJvKGJvKSkgewo+ID4gPiAJCXVubG9jayhscnVfbG9jayk7Cj4gPiA+IAkJ
V1dfTVVURVhfTE9DSyhiby0+d3dfbXV0ZXgpOwo+ID4gPiAJCWxvY2sobHJ1X2xvY2spOwo+ID4g
PiAJfSBlbHNlIHsKPiA+ID4gCQkvKiBibyBpcyBnZXR0aW5nIGZyZWVkLCBzdGVhbCBpdCBmcm9t
IHRoZSBmcmVlaW5nIHByb2Nlc3MKPiA+ID4gCQkgKiBvciBqdXN0IGlnbm9yZSAqLwo+ID4gPiAJ
fQo+ID4gPiB9Cj4gPiA+IHVubG9jayhscnVfbG9jaykKPiA+ID4gCj4gPiA+IFdXX01VVEVYX0xP
Q0tfRU5EOwo+IAo+IEFoLCBub3cgSSBrbm93IHdoYXQgeW91IG1lYW4uIEFuZCBOTywgdGhhdCBh
cHByb2FjaCBkb2Vzbid0IHdvcmsuCj4gCj4gU2VlIGZvciB0aGUgY29ycmVjdCB3d19tdXRleCBk
YW5jZSB3ZSBuZWVkIHRvIHVzZSB0aGUgaXRlcmF0b3IgbXVsdGlwbGUKPiB0aW1lcy4KPiAKPiBP
bmNlIHRvIGdpdmUgdXMgdGhlIEJPcyB3aGljaCBuZWVkcyB0byBiZSBsb2NrZWQgYW5kIGFub3Ro
ZXIgdGltZSB0byBnaXZlIHVzCj4gdGhlIEJPcyB3aGljaCBuZWVkcyB0byBiZSB1bmxvY2tlZCBp
biBjYXNlIG9mIGEgY29udGVudGlvbi4KPiAKPiBUaGF0IHdvbid0IHdvcmsgd2l0aCB0aGUgYXBw
cm9hY2ggeW91IHN1Z2dlc3QgaGVyZS4KCkEgcmlnaHQsIGRyYXQuCgpNYXliZSBnaXZlIHVwIG9u
IHRoZSBpZGVhIHRvIG1ha2UgdGhpcyB3b3JrIGZvciB3d19tdXRleCBpbiBnZW5lcmFsLCBhbmQK
anVzdCBmb3IgZHJtX2dlbV9idWZmZXJfb2JqZWN0PyBJJ20ganVzdCBhYm91dCB0byBzZW5kIG91
dCBhIHBhdGNoIHNlcmllcwp3aGljaCBtYWtlcyBzdXJlIHRoYXQgYSBsb3QgbW9yZSBkcml2ZXJz
IHNldCBnZW1fYm8ucmVzdiBjb3JyZWN0bHkgKGl0CndpbGwgYWxpYXMgd2l0aCB0dG1fYm8ucmVz
diBmb3IgdHRtIGRyaXZlcnMgb2ZjKS4gVGhlbiB3ZSBjb3VsZCBhZGQgYQpsaXN0X2hlYWQgdG8g
Z2VtX2JvICh3b24ndCByZWFsbHkgbWF0dGVyLCBidXQgbm90IHNvbWV0aGluZyB3ZSBjYW4gZG8g
d2l0aAp3d19tdXRleCByZWFsbHkpLCBzbyB0aGF0IHRoZSB1bmxvY2sgd2Fsa2luZyBkb2Vzbid0
IG5lZWQgdG8gcmV1c2UgdGhlCnNhbWUgaXRlcmF0b3IuIFRoYXQgc2hvdWxkIHdvcmsgSSB0aGlu
ayAuLi4KCkFsc28sIGl0IHdvdWxkIGFsbW9zdCBjb3ZlciBldmVyeXRoaW5nIHlvdSB3YW50IHRv
IGRvLiBGb3IgdHRtIHdlJ2QgbmVlZAp0byBtYWtlIHR0bV9ibyBhIHN1YmNsYXNzIG9mIGdlbV9i
byAoYW5kIG1heWJlIG5vdCBpbml0aWFsaXplIHRoYXQKZW1iZWRkZWQgZ2VtX2JvIGZvciB2bXdn
ZnggYW5kIHNoYWRvdyBibyBhbmQgZHJpdmVyIGludGVybmFsIHN0dWZmKS4KCkp1c3Qgc29tZSBp
ZGVhcywgc2luY2UgY29weXBhc3RpbmcgdGhlIHd3X211dGV4IGRhbmNlIGludG8gYWxsIGRyaXZl
cnMgaXMKaW5kZWVkIG5vdCBncmVhdC4KLURhbmllbAoKPiAKPiBSZWdhcmRzLAo+IENocmlzdGlh
bi4KPiAKPiA+IAo+ID4gCj4gPiBBbHNvIEkgdGhpbmsgaWYgd2UgYWxsb3cgdGhpcyB3ZSBjb3Vs
ZCBwZXJoYXBzIHVzZSB0aGlzIHRvIGltcGxlbWVudCB0aGUKPiA+IG1vZGVzZXQgbWFjcm9zIHRv
by4KPiA+IC1EYW5pZWwKPiA+IAo+ID4gCj4gPiAKPiA+IAo+ID4gPiA+IFRoaXMgaXMga2luZGEg
d2hhdCB3ZSB3ZW50IHdpdGggZm9yIG1vZGVzZXQgbG9ja3Mgd2l0aAo+ID4gPiA+IERSTV9NT0RF
U0VUX0xPQ0tfQUxMX0JFR0lOL0VORCwgeW91IGNhbiBncmFiIG1vcmUgbG9ja3MgaW4gYmV0d2Vl
biB0aGUKPiA+ID4gPiBwYWlyIGF0IGxlYXN0LiBCdXQgaXQncyBhIGxvdCBtb3JlIGxpbWl0ZWQg
dXNlLWNhc2VzLCBtYXliZSB0b28gZnJhZ2lsZSBhbgo+ID4gPiA+IGlkZWEgZm9yIHd3X211dGV4
IGluIGZ1bGwgZ2VuZXJhbGl0eS4KPiA+ID4gPiAKPiA+ID4gPiBOb3QgZ29pbmcgdG8gdHlwZSB0
aGlzIG91dCBiZWNhdXNlIHRvbyBtdWNoIHcvZSBtb2RlIGhlcmUgYWxyZWFkeSwgYnV0IEkKPiA+
ID4gPiBjYW4gZ2l2ZSBpdCBhIHN0YWIgbmV4dCB3ZWVrLgo+ID4gPiA+IC1EYW5pZWwKPiA+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCj4gPiAKPiA+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZXRuYXZpdg==
