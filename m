Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F019F78
	for <lists+etnaviv@lfdr.de>; Fri, 10 May 2019 16:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C6D89B99;
	Fri, 10 May 2019 14:43:29 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFFA89B99;
 Fri, 10 May 2019 14:43:28 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 203so4664577oid.13;
 Fri, 10 May 2019 07:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q9yD+L6B6SJoXSVjsBbpn+1wGUbdqWiRk+Ig2z/InVg=;
 b=WcSQoKLcaE7wNT6FAHrh7HVY0oRto0QPHerQuBZWu1EnfzAV1wL4TObj4/xkLWIKcc
 ByIbSkbGP3zAngheff6MstpoGVIji6ARDnB8rQrBL41pwBUUuQdlNFLA4e0U6efRF1Tb
 3EYyH0/holUsRdV32kXYToZpr6XKLdIB6+WunuVbyBkRzQAVZCvb8o1S+Vwhd95AlR9+
 tH0L0enQkqVD67QiOVXkftdr/AcaGEnPSA8YpUX1U9UwltHRRDGwfHc1YVV/d/YT+xW/
 cZmwlANc0LRbycA9thUjMyznRXOzFq8HQAdO6j+NH2hXD2m3BvsfvfboodpajRgCcsJ4
 aKmg==
X-Gm-Message-State: APjAAAW0tLJw+9xMMoEqA6fsHa6glO5/IO5i52WTWUTb9Cb/87CIoYBx
 XS4VVX3xj77+kl4KGbusFU/kSCx7lvftIJN1rHs=
X-Google-Smtp-Source: APXvYqzrDq7L8PGZ5qlve80Kkd3+oVQA7Hy/IyqJbABssWT7zxZj8v775tPpTwaUFfXw9dW/oLvTEvb/1S+SAOwerpw=
X-Received: by 2002:aca:fc86:: with SMTP id a128mr5478408oii.36.1557499407866; 
 Fri, 10 May 2019 07:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190510090915.2739-1-christian.gmeiner@gmail.com>
 <20190510090915.2739-4-christian.gmeiner@gmail.com>
 <CACu1E7EUug0s2PoRLXkTbO=RomyOeS8nEQp8+5B_zxdSE6p1Kw@mail.gmail.com>
In-Reply-To: <CACu1E7EUug0s2PoRLXkTbO=RomyOeS8nEQp8+5B_zxdSE6p1Kw@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 10 May 2019 16:43:16 +0200
Message-ID: <CACu1E7ERAAe4CkW827N44iSFCBMvus6aSTc7a6CaBBD4k8XXXg@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC PATCH 03/17] eir: add live ranges pass
To: Christian Gmeiner <christian.gmeiner@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Q9yD+L6B6SJoXSVjsBbpn+1wGUbdqWiRk+Ig2z/InVg=;
 b=NJHb+b9o1LRoa/FwGadOdANTQkSYqs4bl3Pj9hn7mKjwr4VV4iCHi36fBQAUlx9vdf
 RJXIsd62aVeitydaDwgYD+Dza/uAIAqNwuxcqvkjuuBWip6mOxYQcX1pTo906osiWWdc
 7EESLmVX7BGs2mCrBS7198KN7mCAd8hQU1aThiARWkIHrVucav5su85QgsIKb+IKaXpI
 9KuNSmxT3urNSwmVh+J+t7yFmv1F89oa4pi7XlODKpwuQVNDX5QVW+M3fiMIdl9oeL/a
 HaLGbBEH9rAETRcv/gUodkFoXIv1N11qA3ACE20BWNw0eku8dLYIZMaLwvHmPrgZaibs
 45Dg==
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 cphealy@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMTE6NDcgQU0gQ29ubm9yIEFiYm90dCA8Y3dhYmJvdHQw
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+IFRoaXMgd2F5IG9mIHJlcHJlc2VudGluZyBsaXZlbmVz
cywgYW5kIHRoZW4gdXNpbmcgYSBjb2xvcmluZyByZWdpc3Rlcgo+IGFsbG9jYXRvciwgaXMgYSBj
b21tb24gYW50aS1wYXR0ZXJuIGluIE1lc2EsIHRoYXQgd2FzIGluaXRpYWxseSBjb3BpZWQKPiBm
cm9tIGk5NjUgd2hpY2ggZGF0ZXMgYmFjayB0byBiZWZvcmUgd2Uga25ldyBhbnkgYmV0dGVyLiBJ
IHJlYWxseQo+IGRvbid0IHdhbnQgdG8gc2VlIGl0IHNwcmVhZCB0byB5ZXQgYW5vdGhlciBkcml2
ZXIgOiguCj4KPiBSZXByZXNlbnRpbmcgbGl2ZSByYW5nZXMgbGlrZSB0aGlzIGlzIGltcHJlY2lz
ZS4gSWYgSSBoYXZlIGEgcHJvZ3JhbSBsaWtlIHRoaXM6Cj4KPiBmb28gPSAuLi4KPiBpZiAoLi4u
KSB7Cj4gICAgYmFyID0gLi4uCj4gICAgLi4uID0gYmFyOyAvKiBsYXN0IHVzZSBvZiAiYmFyIiAq
Lwo+IH0KPiAuLi4gPSBmb287CgpXaG9vcHMsIHRoYXQgc2hvdWxkIGFjdHVhbGx5IHJlYWQ6Cgpm
b28gPSAuLi4KaWYgKC4uLikgewogICBiYXIgPSAuLi4KICAgLi4uID0gYmFyOyAvKiBsYXN0IHVz
ZSBvZiAiYmFyIiAqLwp9IGVsc2UgewogICAuLi4gPSBmb287Cn0KCj4KPiBUaGVuIGl0IHdpbGwg
c2F5IHRoYXQgZm9vIGFuZCBiYXIgaW50ZXJmZXJlLCBldmVuIHdoZW4gdGhleSBkb24ndC4KPgo+
IE5vdywgdGhpcyBhcHByb3hpbWF0aW9uIGRvZXMgbWFrZSB0aGluZ3MgYSBiaXQgc2ltcGxlci4g
QnV0LCBpdCB0dXJucwo+IG91dCB0aGF0IGlmIHlvdSdyZSB3aWxsaW5nIHRvIG1ha2UgaXQsIHRo
ZW4gdGhlIGludGVyZmVyZW5jZSBncmFwaCBpcwo+IHRyaXZpYWxseSBjb2xvcmFibGUgdmlhIGEg
c2ltcGxlIGxpbmVhci10aW1lIGFsZ29yaXRobS4gVGhpcyBpcyB0aGUKPiBiYXNpcyBvZiAibGlu
ZWFyLXNjYW4iIHJlZ2lzdGVyIGFsbG9jYXRvcnMsIGluY2x1ZGluZyB0aGUgb25lIGluIExMVk0u
Cj4gSWYgeW91IHdhbnQgdG8gZ28gZG93biB0aGlzIHJvdXRlLCB5b3UgY2FuLCBidXQgdGhpcyBo
eWJyaWQgaXMganVzdAo+IHVzZWxlc3MgYXMgaXQgZ2l2ZXMgeW91IHRoZSB3b3JzdCBvZiBib3Ro
IHdvcmxkcy4KPgo+IElmIHlvdSB3YW50IHRvIHByb3Blcmx5IGJ1aWxkIHVwIHRoZSBpbnRlcmZl
cmVuY2UgZ3JhcGgsIGl0J3MgYWN0dWFsbHkKPiBub3QgdGhhdCBoYXJkLiBBZnRlciBkb2luZyB0
aGUgaW50ZXItYmFzaWMtYmxvY2sgbGl2ZW5lc3MgYW5hbHlzaXMsCj4gZm9yIGVhY2ggYmxvY2ss
IHlvdSBpbml0aWFsaXplIGEgYml0c2V0IHRvIHRoZSBsaXZlLW91dCBiaXRzZXQuIFRoZW4KPiB5
b3Ugd2FsayB0aGUgYmxvY2sgYmFja3dhcmRzLCB1cGRhdGluZyBpdCBhdCBlYWNoIGluc3RydWN0
aW9uIGV4YWN0bHkKPiBhcyBpbiBsaXZlbmVzcyBhbmFseXNpcywgc28gdGhhdCBpdCBhbHdheXMg
cmVwcmVzZW50cyB0aGUgbGl2ZQo+IHJlZ2lzdGVycyBiZWZvcmUgZWFjaCBpbnN0cnVjdGlvbi4g
VGhlbiB5b3UgYWRkIGludGVyZmVyZW5jZXMgYmV0d2Vlbgo+IGFsbCBvZiB0aGUgbGl2ZSByZWdp
c3RlcnMgYW5kIHRoZSByZWdpc3RlcihzKSBkZWZpbmVkIGF0IHRoZQo+IGluc3RydWN0aW9uLgo+
Cj4gT25lIGxhc3QgcGl0ZmFsbCBJJ2xsIG1lbnRpb24gaXMgdGhhdCBpbiB0aGUgcmVhbCB3b3Js
ZCwgeW91J2xsIGFsc28KPiBuZWVkIHRvIHVzZSByZWFjaGFiaWxpdHkuIElmIHlvdSBoYXZlIHNv
bWV0aGluZyBsaWtlCj4KPiBpZiAoLi4uKQo+ICAgIGZvbyA9IC4uLiAvKiBvbmx5IGRlZmluaXRp
b24gb2YgImZvbyIgKi8KPgo+IC4uLiA9IGZvbzsKPgo+IHdoZXJlIGZvbyBpcyBvbmx5IHBhcnRp
YWxseSBkZWZpbmVkLCB0aGVuIHRoZSBsaXZlbmVzcyBvZiBmb28gd2lsbAo+ICJsZWFrIiB0aHJv
dWdoIHRoZSBpZi4gVG8gZml4IHRoaXMgeW91IG5lZWQgdG8gY29uc2lkZXIgd2hhdCdzIGNhbGxl
ZAo+ICJyZWFjaGFiaWxpdHksIiBpLmUuIHNvbWV0aGluZyBpcyBvbmx5IGxpdmUgaWYsIGluIGFk
ZGl0aW9uIHRvCj4gcG90ZW50aWFsbHkgYmVpbmcgdXNlZCBzb21ldGltZSBsYXRlciwgaXQgaXMg
cmVhY2hhYmxlIChwb3RlbnRpYWxseQo+IGRlZmluZWQgc29tZXRpbWUgZWFybGllcikuIFJlYWNo
YWJpbGl0eSBhbmFseXNpcyBpcyBleGFjdGx5IGxpa2UKPiBsaXZlbmVzcyBhbmFseXNpcywgYnV0
IGV2ZXJ5dGhpbmcgaXMgYmFja3dhcmRzLiBpOTY1IGRvZXMgdGhpcwo+IHByb3Blcmx5IG5vd2Fk
YXlzLCBhbmQgdGhlIGNoYW5nZSBoYWQgYSBodWdlIGVmZmVjdCBvbiBzcGlsbGluZy9SQS4KPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1h
aWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
