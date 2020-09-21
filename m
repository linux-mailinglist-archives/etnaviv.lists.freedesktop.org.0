Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677682744A2
	for <lists+etnaviv@lfdr.de>; Tue, 22 Sep 2020 16:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16906E888;
	Tue, 22 Sep 2020 14:45:46 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08716E353
 for <etnaviv@lists.freedesktop.org>; Mon, 21 Sep 2020 14:28:21 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w1so13043007edr.3
 for <etnaviv@lists.freedesktop.org>; Mon, 21 Sep 2020 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VzVFv87gEs+DoQS8yQmlQI7hV0/JZ6iyGje6mT9KAwE=;
 b=r4E87SE8cRmNC5/QVPBZTvtY0WwQCAYq610H3TrqushG0vNVlKdRr1yDB+OGvjsEsh
 S3FMPazSyqly4DhCb4U7Daasb48nWMYCRokGTGWWDWr9Lzd6KgGSzsSL2bf8JN8hSUUg
 fRzGoMda0izTxUfQ1oDoraADyOixRpShNlZWwVuWp+90kzwtm6dXywXfCJwfHNYTDPPC
 BRvwUcCNbRJRVtNCA8XAXeWeF7BEiteuUSc0wY4jwhVuicLkHdBYv1A9LX7rLKMIuKyJ
 4unfy8WbdjnYnXrOLoUKtowSivIVSvfiJ9L/35cPYAO2P/1sV7m+awpIj8vkbInTptyh
 hePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VzVFv87gEs+DoQS8yQmlQI7hV0/JZ6iyGje6mT9KAwE=;
 b=bLYMgjh3xmOx/8naf46q/qvyE5mhF/3QrL5i7f67DhOLCn1Y67hfWICa8JinGGz1jH
 Mcd+wzc8HIoQP6iZ/pbjDJ6TqIxZNiQWCFk8r0So9nA7FIJCN5pKpejqtNnk4o/KS5u2
 TPs1vjZHN0jJjGF6E/vOWpX04sqfg3MQu+ajiPHkmbxTenqsO9HFnG0j2RaprFvEzu66
 mwO7jAISMLYWFIxXHKMkCVwBA7I/XHBywZ0uCkGFU0ciBMI8mLwXMpP7+9CS7M3bJTGH
 QkHGNdK0TLQ9ZU6o1AT/LR3I4RxdOkjoP2SU6L/Ny0p/EDFLvtW8MN3dQANxVXYOvyx3
 IYyw==
X-Gm-Message-State: AOAM530tK+ZuuB0NSuOFQlfgtKMMryQnjWk00d4TnD9J+Ebzfe5llap5
 +UdZ7Y53R1HLKuW+uPwHy8TXWWQjUzeS64JSIQ3u9w==
X-Google-Smtp-Source: ABdhPJxzM6EYIqImTXX3nZVDlcUVt4Reycl0v4NuDxz6VB7H68kqhbvAzdwYiX9PD8RD0OTNupjfeVlIQGuz17LfGtQ=
X-Received: by 2002:aa7:d747:: with SMTP id a7mr51024393eds.304.1600698500267; 
 Mon, 21 Sep 2020 07:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <4eaa69879014a406424b9702dd6574a305f4c98e.camel@igalia.com>
In-Reply-To: <4eaa69879014a406424b9702dd6574a305f4c98e.camel@igalia.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 21 Sep 2020 09:28:09 -0500
Message-ID: <CAOFGe97CpYKkNC3N=2kxCnFSSw5sQuQCEdkKGudCEL6em3YTGA@mail.gmail.com>
Subject: Re: [Mesa-dev] XDC 2020 feedback and comments
To: =?UTF-8?Q?Samuel_Iglesias_Gons=C3=A1lvez?= <siglesias@igalia.com>
X-Mailman-Approved-At: Tue, 22 Sep 2020 14:45:44 +0000
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
Cc: "xorg-devel@lists.freedesktop.org" <xorg-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "board@foundation.x.org" <board@foundation.x.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "events@lists.x.org" <events@lists.x.org>,
 "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Rmlyc3Qgb2ZmLCBJIHRoaW5rIHlvdSBhbGwgZGlkIGEgZmFudGFzdGljIGpvYi4gIEkgZmVsdCB0
aGF0IHRoaW5ncwpyYW4gdmVyeSBzbW9vdGhseSBhbmQsIGFzIGZhciBhcyB0aGUgdGFsa3MgdGhl
bXNlbHZlcyBnbywgSSB0aGluayBpdAp3ZW50IGFsbW9zdCBhcyBzbW9vdGhseSBhcyBhbiBpbi1w
ZXJzb24gWERDLiAgSSdtIHJlYWxseSBxdWl0ZQppbXByZXNzZWQuICBJIGRvIGhhdmUgYSBjb3Vw
bGUgcGllY2VzIG9mIG1vcmUgbnVhbmNlZCBmZWVkYmFjazoKCiAxLiBJIHRoaW5rIHdlIHdlcmUg
bWF5YmUgYSBiaXQgdG9vIHNjYXJlZCBvZiBvdmVybG9hZGluZyBqaXRzaS4KSGF2aW5nIG1vcmUg
cGVvcGxlIGluIHRoZSBpbnN0YW5jZSBmb3IgcXVlc3Rpb25zIG1pZ2h0IGhhdmUgbWFkZSB0aGF0
CnBvcnRpb24gZ28gYmV0dGVyLiAgQXMgaXQgd2FzLCB0aGVyZSB3YXMgb25seSBvbmUgb3IgdHdv
IHRhbGtzIHRoYXQKaGFkIGFueSBsaXZlIHF1ZXN0aW9ucy4gIFRoYXQgc2FpZCwgdGhlcmUgYXJl
IGEgZmV3IGFkdmFudGFnZXMgdG8KaGF2aW5nIHRoaW5ncyBmdW5uZWxlZCB0aHJvdWdoIElSQywg
dGhlIG1vc3Qgb2J2aW91cyBvZiB3aGljaCBiZWluZwp0aGF0IHBlb3BsZSBjYW4gYXNrIHRoZWly
IHF1ZXN0aW9uIG1pZC10YWxrIGFuZCBoYXZlIGl0IGhhbmRsZWQgYXQgdGhlCmVuZCBpbnN0ZWFk
IG9mIGhhdmluZyB0byByZW1lbWJlciBpdCBmb3IgMjAgbWludXRlcy4KCiAyLiBJIHJlYWxseSBt
aXNzIHRoZSBoYWxsd2F5IHRyYWNrLiAgT24gVGh1cnNkYXksIGFmdGVyIHRoZQpjb25mZXJlbmNl
LCBCYXMsIENvbm5vciwgYW5kIEkgdXNlZCBqaXRzaSB0byBoYXZlIGEgY2hhdCBhYm91dApyYXkt
dHJhY2luZy4gIFRoYXQgd2FzIHJlYWxseSBmdW4gYW5kIEkgd2lzaCBJJ2QgZG9uZSBzb21ldGhp
bmcgbGlrZQp0aGF0IGV2ZXJ5IGRheSBvZiBYREMuICBNYXliZSBpdCdzIG15IG93biBmYXVsdCBm
b3Igbm90IHNldHRpbmcgdXAKc2FpZCBjaGF0cyBidXQgSSB0aGluayBpdCBjb3VsZCBoYXZlIGJl
ZW4gbWFkZSBtb3JlIGFjY2Vzc2libGUgKEkgaGFkCm5vIGlkZWEgaG93IHRvIGZvcmsgb2ZmIGEg
aml0c2kgaW5zdGFuY2UpIGFuZC9vciBlbmNvdXJhZ2VkIHNvbWVob3cuCgotLUphc29uCgpPbiBN
b24sIFNlcCAyMSwgMjAyMCBhdCAzOjA3IEFNIFNhbXVlbCBJZ2xlc2lhcyBHb25zw6FsdmV6Cjxz
aWdsZXNpYXNAaWdhbGlhLmNvbT4gd3JvdGU6Cj4KPiBIaSBhbGwsCj4KPiBIdWdlIHRoYW5rcyBh
Z2FpbiB0byB0aGUgZW50aXJlIHRlYW0gZnJvbSBJbnRlbCwgZm9yIHRoZWlyIGdyZWF0IHdvcmsK
PiBvcmdhbml6aW5nIFhEQyAyMDIwLCBvdXIgZmlyc3QgdmlydHVhbCBjb25mZXJlbmNlIQo+Cj4g
QXMgdXN1YWwgd2UncmUgbG9va2luZyBmb3IgZmVlZGJhY2sgb24gYm90aCBYREMgaXRzZWxmLCBh
bmQgdGhlIENGUAo+IHByb2Nlc3MgYW5kIHByb2dyYW0gc2VsZWN0aW9uLiBCb3RoIGFib3V0IHdo
YXQgd2FzIGdyZWF0IGFuZCBzaG91bGQgYmUKPiBrZXB0IGZvciBuZXh0IHllYXIncyBlZGl0aW9u
LCBhbmQgd2hlcmUgdGhlcmUncyByb29tIGZvciBpbXByb3ZlbWVudC4KPgo+IFRoZSBib2FyZCBk
b2VzIGtlZXAgc29tZSBub3RlcywgZm9yIHRob3NlIGludGVyZXN0ZWQgaW4gd2hhdCB3ZSBoYXZl
Cj4gYWxyZWFkeToKPgo+IC0gWERDIG5vdGVzIGZvciBwcm9zcGVjdGl2ZSBvcmdhbml6ZXJzOgo+
IGh0dHBzOi8vd3d3Lngub3JnL3dpa2kvRXZlbnRzL1JGUC8KPgo+IC0gQ0ZQIG5vdGVzOiBodHRw
czovL3d3dy54Lm9yZy93aWtpL0V2ZW50cy9QYXBlcnNDb21taXR0ZWUvCj4KPiBJZiB5b3Ugd2Fu
dCB0byBzZW5kIGluIHlvdXIgY29tbWVudHMgaW4gcHJpdmF0ZSwgcGxlYXNlIHNlbmQgdGhlbSB0
bwo+IHRoZSBYLm9yZyBGb3VuZGF0aW9uIGJvYXJkOiBib2FyZEBmb3VuZGF0aW9uLngub3JnCj4K
PiBDaGVlcnMsCj4KPiBTYW0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IG1lc2EtZGV2IG1haWxpbmcgbGlzdAo+IG1lc2EtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbWVzYS1kZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2Cg==
