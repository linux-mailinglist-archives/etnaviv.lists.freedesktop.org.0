Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79819F6E
	for <lists+etnaviv@lfdr.de>; Fri, 10 May 2019 16:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC9889728;
	Fri, 10 May 2019 14:38:44 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD30289728;
 Fri, 10 May 2019 14:38:42 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id v140so382091vkd.7;
 Fri, 10 May 2019 07:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FfAT48gO9IPA7doTAMfzm3GHMSxbdT3BPi4P8Bbee6g=;
 b=HbHGRAod0oV+CqxJeeM6WgvBIQ+S5+c3X5L55MCgJC2BGY9h832t12PmaWZrFbFH0Z
 K7Qj09cTAkIWofUiT8LLda/oNlGv9NFbSkbbHKtY2hlTac4yYIIiHEtipAx9u0B4xSe2
 wK0eTiEYTjf6Gb6zD5uKdDidXPkb9qSgyLq12ddI8PJCkhuqQNYrtn4T8jgU5u+SY8yl
 pGSMf5uZzY5f/XVquX/AiLcNUYopyu4zNu/DGKybl/PYLWLbOtE78a6pR5E+WKkxNB2M
 lltsTi5IcULzDZ8g2K9w55IOkki8tsrggbf8ozyp3jw1X22JUA1kCm9mOxGkNp0wjmMz
 Gh2w==
X-Gm-Message-State: APjAAAXXJclJO/NKUMi1xy5ALr+IivGo37JkW1cdB5KnCcfkDfxqyiX7
 FcDE0z69gEeQhFlh9l8f/FSEqmG22inwaFxpK5I=
X-Google-Smtp-Source: APXvYqz1Sklvm8T+L2k/yApg5C9n4cz8wt0zlao0viAvSkRQveYbQEArDHpDBO45n86cyuo024zlN8njZQsE7ZH8fqo=
X-Received: by 2002:a1f:f03:: with SMTP id 3mr5232515vkp.2.1557499121862; Fri,
 10 May 2019 07:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190510090915.2739-1-christian.gmeiner@gmail.com>
 <20190510090915.2739-4-christian.gmeiner@gmail.com>
 <CACu1E7EUug0s2PoRLXkTbO=RomyOeS8nEQp8+5B_zxdSE6p1Kw@mail.gmail.com>
In-Reply-To: <CACu1E7EUug0s2PoRLXkTbO=RomyOeS8nEQp8+5B_zxdSE6p1Kw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 10 May 2019 10:38:30 -0400
Message-ID: <CAKb7UvhONmzo4mraA2J_C0UN4sDNfZeEzdbCedKic1R-DPnVDg@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC PATCH 03/17] eir: add live ranges pass
To: Connor Abbott <cwabbott0@gmail.com>
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgNTo0NyBBTSBDb25ub3IgQWJib3R0IDxjd2FiYm90dDBA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0IDExOjA5IEFNIENo
cmlzdGlhbiBHbWVpbmVyCj4gPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVy
QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHNyYy9ldG5hdml2L2NvbXBpbGVyL2Vpci5oICAgICAg
ICAgICAgICAgICAgICB8ICAgMyArCj4gPiAgc3JjL2V0bmF2aXYvY29tcGlsZXIvZWlyX2xpdmVf
dmFyaWFibGVzLmMgICAgIHwgMjU4ICsrKysrKysrKysrKysrKysrKwo+ID4gIHNyYy9ldG5hdml2
L2NvbXBpbGVyL21lc29uLmJ1aWxkICAgICAgICAgICAgICB8ICAgMSArCj4gPiAgLi4uL2NvbXBp
bGVyL3Rlc3RzL2Vpcl9saXZlX3ZhcmlhYmxlcy5jcHAgICAgIHwgMTYyICsrKysrKysrKysrCj4g
PiAgc3JjL2V0bmF2aXYvY29tcGlsZXIvdGVzdHMvbWVzb24uYnVpbGQgICAgICAgIHwgIDExICsK
PiA+ICA1IGZpbGVzIGNoYW5nZWQsIDQzNSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHNyYy9ldG5hdml2L2NvbXBpbGVyL2Vpcl9saXZlX3ZhcmlhYmxlcy5jCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHNyYy9ldG5hdml2L2NvbXBpbGVyL3Rlc3RzL2Vpcl9saXZlX3Zhcmlh
Ymxlcy5jcHAKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvc3JjL2V0bmF2aXYvY29tcGlsZXIvZWlyLmgg
Yi9zcmMvZXRuYXZpdi9jb21waWxlci9laXIuaAo+ID4gaW5kZXggYTA1YjEyZGU5NGIuLjM4YzZh
ZjRlMDdlIDEwMDY0NAo+ID4gLS0tIGEvc3JjL2V0bmF2aXYvY29tcGlsZXIvZWlyLmgKPiA+ICsr
KyBiL3NyYy9ldG5hdml2L2NvbXBpbGVyL2Vpci5oCj4gPiBAQCAtMTUxLDYgKzE1MSw5IEBAIHN0
cnVjdCBlaXIKPiA+ICAgICAvKiBrZWVwIHRyYWNrIG9mIG51bWJlciBvZiBhbGxvY2F0ZWQgdW5p
Zm9ybXMgKi8KPiA+ICAgICBzdHJ1Y3QgdXRpbF9keW5hcnJheSB1bmlmb3JtX2FsbG9jOwo+ID4g
ICAgIHVuc2lnbmVkIHVuaWZvcm1fb2Zmc2V0Owo+ID4gKwo+ID4gKyAgIC8qIExpdmUgcmFuZ2Vz
IG9mIHRlbXAgcmVnaXN0ZXJzICovCj4gPiArICAgaW50ICp0ZW1wX3N0YXJ0LCAqdGVtcF9lbmQ7
Cj4KPiBUaGlzIHdheSBvZiByZXByZXNlbnRpbmcgbGl2ZW5lc3MsIGFuZCB0aGVuIHVzaW5nIGEg
Y29sb3JpbmcgcmVnaXN0ZXIKPiBhbGxvY2F0b3IsIGlzIGEgY29tbW9uIGFudGktcGF0dGVybiBp
biBNZXNhLCB0aGF0IHdhcyBpbml0aWFsbHkgY29waWVkCj4gZnJvbSBpOTY1IHdoaWNoIGRhdGVz
IGJhY2sgdG8gYmVmb3JlIHdlIGtuZXcgYW55IGJldHRlci4gSSByZWFsbHkKPiBkb24ndCB3YW50
IHRvIHNlZSBpdCBzcHJlYWQgdG8geWV0IGFub3RoZXIgZHJpdmVyIDooLgo+Cj4gUmVwcmVzZW50
aW5nIGxpdmUgcmFuZ2VzIGxpa2UgdGhpcyBpcyBpbXByZWNpc2UuIElmIEkgaGF2ZSBhIHByb2dy
YW0gbGlrZSB0aGlzOgo+Cj4gZm9vID0gLi4uCj4gaWYgKC4uLikgewo+ICAgIGJhciA9IC4uLgo+
ICAgIC4uLiA9IGJhcjsgLyogbGFzdCB1c2Ugb2YgImJhciIgKi8KPiB9Cj4gLi4uID0gZm9vOwo+
Cj4gVGhlbiBpdCB3aWxsIHNheSB0aGF0IGZvbyBhbmQgYmFyIGludGVyZmVyZSwgZXZlbiB3aGVu
IHRoZXkgZG9uJ3QuCj4KPiBOb3csIHRoaXMgYXBwcm94aW1hdGlvbiBkb2VzIG1ha2UgdGhpbmdz
IGEgYml0IHNpbXBsZXIuIEJ1dCwgaXQgdHVybnMKPiBvdXQgdGhhdCBpZiB5b3UncmUgd2lsbGlu
ZyB0byBtYWtlIGl0LCB0aGVuIHRoZSBpbnRlcmZlcmVuY2UgZ3JhcGggaXMKPiB0cml2aWFsbHkg
Y29sb3JhYmxlIHZpYSBhIHNpbXBsZSBsaW5lYXItdGltZSBhbGdvcml0aG0uIFRoaXMgaXMgdGhl
Cj4gYmFzaXMgb2YgImxpbmVhci1zY2FuIiByZWdpc3RlciBhbGxvY2F0b3JzLCBpbmNsdWRpbmcg
dGhlIG9uZSBpbiBMTFZNLgo+IElmIHlvdSB3YW50IHRvIGdvIGRvd24gdGhpcyByb3V0ZSwgeW91
IGNhbiwgYnV0IHRoaXMgaHlicmlkIGlzIGp1c3QKPiB1c2VsZXNzIGFzIGl0IGdpdmVzIHlvdSB0
aGUgd29yc3Qgb2YgYm90aCB3b3JsZHMuCj4KPiBJZiB5b3Ugd2FudCB0byBwcm9wZXJseSBidWls
ZCB1cCB0aGUgaW50ZXJmZXJlbmNlIGdyYXBoLCBpdCdzIGFjdHVhbGx5Cj4gbm90IHRoYXQgaGFy
ZC4gQWZ0ZXIgZG9pbmcgdGhlIGludGVyLWJhc2ljLWJsb2NrIGxpdmVuZXNzIGFuYWx5c2lzLAo+
IGZvciBlYWNoIGJsb2NrLCB5b3UgaW5pdGlhbGl6ZSBhIGJpdHNldCB0byB0aGUgbGl2ZS1vdXQg
Yml0c2V0LiBUaGVuCj4geW91IHdhbGsgdGhlIGJsb2NrIGJhY2t3YXJkcywgdXBkYXRpbmcgaXQg
YXQgZWFjaCBpbnN0cnVjdGlvbiBleGFjdGx5Cj4gYXMgaW4gbGl2ZW5lc3MgYW5hbHlzaXMsIHNv
IHRoYXQgaXQgYWx3YXlzIHJlcHJlc2VudHMgdGhlIGxpdmUKPiByZWdpc3RlcnMgYmVmb3JlIGVh
Y2ggaW5zdHJ1Y3Rpb24uIFRoZW4geW91IGFkZCBpbnRlcmZlcmVuY2VzIGJldHdlZW4KPiBhbGwg
b2YgdGhlIGxpdmUgcmVnaXN0ZXJzIGFuZCB0aGUgcmVnaXN0ZXIocykgZGVmaW5lZCBhdCB0aGUK
PiBpbnN0cnVjdGlvbi4KPgo+IE9uZSBsYXN0IHBpdGZhbGwgSSdsbCBtZW50aW9uIGlzIHRoYXQg
aW4gdGhlIHJlYWwgd29ybGQsIHlvdSdsbCBhbHNvCj4gbmVlZCB0byB1c2UgcmVhY2hhYmlsaXR5
LiBJZiB5b3UgaGF2ZSBzb21ldGhpbmcgbGlrZQo+Cj4gaWYgKC4uLikKPiAgICBmb28gPSAuLi4g
Lyogb25seSBkZWZpbml0aW9uIG9mICJmb28iICovCj4KPiAuLi4gPSBmb287Cj4KPiB3aGVyZSBm
b28gaXMgb25seSBwYXJ0aWFsbHkgZGVmaW5lZCwgdGhlbiB0aGUgbGl2ZW5lc3Mgb2YgZm9vIHdp
bGwKPiAibGVhayIgdGhyb3VnaCB0aGUgaWYuIFRvIGZpeCB0aGlzIHlvdSBuZWVkIHRvIGNvbnNp
ZGVyIHdoYXQncyBjYWxsZWQKPiAicmVhY2hhYmlsaXR5LCIgaS5lLiBzb21ldGhpbmcgaXMgb25s
eSBsaXZlIGlmLCBpbiBhZGRpdGlvbiB0bwo+IHBvdGVudGlhbGx5IGJlaW5nIHVzZWQgc29tZXRp
bWUgbGF0ZXIsIGl0IGlzIHJlYWNoYWJsZSAocG90ZW50aWFsbHkKPiBkZWZpbmVkIHNvbWV0aW1l
IGVhcmxpZXIpLiBSZWFjaGFiaWxpdHkgYW5hbHlzaXMgaXMgZXhhY3RseSBsaWtlCj4gbGl2ZW5l
c3MgYW5hbHlzaXMsIGJ1dCBldmVyeXRoaW5nIGlzIGJhY2t3YXJkcy4gaTk2NSBkb2VzIHRoaXMK
PiBwcm9wZXJseSBub3dhZGF5cywgYW5kIHRoZSBjaGFuZ2UgaGFkIGEgaHVnZSBlZmZlY3Qgb24g
c3BpbGxpbmcvUkEuCgpPbmUgbW9yZSB3b3JkIG9uIHRoZSByZWFjaGFiaWxpdHkgdGhpbmcuLi4g
d2F0Y2ggb3V0IGZvciBjb2RlIGxpa2UKCndoaWxlKCkgewogIHVzZShmb28pOwogIGlmICgpCiAg
ICBmb28gPSBiYXI7CiAgbW9yZSBjb2RlIHRoYXQgZG9lc24ndCB1c2UgZm9vCn0KCkluIFNTQSwg
dGhpcyBiZWNvbWVzIGxpa2UKCmZvbzEgPSB1bmRlZgp3aGlsZSgpIHsKICBmb28gPSBwaGkoZm9v
MSwgZm9vMikKICB1c2UoZm9vKQogIGlmICgpCiAgICBmb28yID0gYmFyCiAgbW9yZSBjb2RlIHRo
YXQgZG9lc24ndCB1c2UgZm9vMgp9CgpBbmQgc28geW91IGhhdmUgdG8gZXh0ZW5kIHRoZSBsaXZl
IHJhbmdlIG9mIGZvbzIgdW50aWwgdGhlIGVuZCBvZiB0aGUKbG9vcC4gVGhpcyBiZWNvbWVzIGV2
ZW4gbW9yZSBmdW4gd2l0aCB2YXJpb3VzIG5lc3RlZCBjb250cm9sIGZsb3cKc2NlbmFyaW9zLiAo
SSBoYXZlbid0IHJldmlld2VkIHdoZXRoZXIgdGhpcyBzZXJpZXMgaGFuZGxlcyB0aGlzIHNvcnQK
b2YgdGhpbmcgYXBwcm9wcmlhdGVseSwgYnV0IENvbm5vcidzIGNvbW1lbnQgcmVtaW5kZWQgbWUg
b2YgaXQuKQoKICAtaWxpYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
