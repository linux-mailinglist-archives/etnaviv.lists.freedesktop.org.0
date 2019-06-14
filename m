Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A4F45D8E
	for <lists+etnaviv@lfdr.de>; Fri, 14 Jun 2019 15:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27108989A;
	Fri, 14 Jun 2019 13:10:20 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6077489361;
 Fri, 14 Jun 2019 13:06:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p13so2445906wru.10;
 Fri, 14 Jun 2019 06:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=nTZn4SPyaDhTYZFH09HWgAuSrH1KouQZuk7dsEDnlqQ=;
 b=eDHHAf3d3Fi56qDnqbg6BaHg3q2xEEEbyAx9i0ToZEFfONaoZGSObeYvsKEcS62hHx
 V5LiGRLdpxt7Iab0RpFChQzyGk3GE/VwkvsG57LIkJuucZ0mH1t6J70SRx5yH7z0BYXn
 GBGIPcZItwnR2TMqnzQfoRl70ck3HkcVRW2HVT/CwdJT7ZdfIE9VfIb8dK4cOPsUImDP
 l6+88fu5BsYBgOt3juFYzdsSJwhAxvKtBS+sm+BhXAhfNw/jWcjTvCKfZgvp2LPdTPcs
 s9MT3zPSKPl8uhRBQcoexDENEdeKjunxjFu4Q81v5FdVp0Myu3aUdd/1aeu10WxAelNQ
 QfkA==
X-Gm-Message-State: APjAAAUN2ec5buIZUv2GrqudtP2Ukjr2fbVjM3AFR5HWQ94/WQtZ5sRx
 1XWgPbT9qOCyJBAiHiCp+O6B1ldQ
X-Google-Smtp-Source: APXvYqwjBP7EiFJtJl6Gd+2P+l2hqIJIJCystRgVNNoAwdLgZYK4Fqtr/av2vHBXDXXip9t6AMeKWw==
X-Received: by 2002:adf:8044:: with SMTP id 62mr16770652wrk.20.1560517572880; 
 Fri, 14 Jun 2019 06:06:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w2sm1692473wrr.31.2019.06.14.06.06.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 06:06:12 -0700 (PDT)
Subject: Re: [PATCH 3/6] drm/gem: use new ww_mutex_(un)lock_for_each macros
To: Peter Zijlstra <peterz@infradead.org>
References: <20190614124125.124181-1-christian.koenig@amd.com>
 <20190614124125.124181-4-christian.koenig@amd.com>
 <20190614125940.GP3436@hirez.programming.kicks-ass.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6f2084ae-61d5-8cb9-c975-901456eed7e3@gmail.com>
Date: Fri, 14 Jun 2019 15:06:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614125940.GP3436@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 14 Jun 2019 13:10:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=nTZn4SPyaDhTYZFH09HWgAuSrH1KouQZuk7dsEDnlqQ=;
 b=uISqou4LxLmTnnqWGFBqhAPO23d6mu/AW9eI3GyVLhFvndewDRgAq3Z3hihsyOV6nw
 PAyJ22JEJgAhKt/b6bITbIuyIyHqgOdW/xO1MaGFlUV42mE8kBzJFPE/VuMtqupIIs+F
 Yip+tv9YQSVjxWIUyPSxtR5yljKyAR3M3aad7xGy6TnEuuJ5HjTZu7u0UiPuWO/TEu4D
 3bcQfE6QxvixdTHZDw57Z0EUDmb81DbAz9zP28yEOXC4GZ1/A67W23wqJcbeg4voQCxe
 mXp1HY0/EhcGBQArOTP+V+dtGh1JqDezG0AhaJQjojdbC9In9I6u06mtqnFRxe7Dubda
 Mo2Q==
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
Reply-To: christian.koenig@amd.com
Cc: thellstrom@vmware.com, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, eric@anholt.net, christian.gmeiner@gmail.com,
 yuq825@gmail.com, daniel@ffwll.ch, linux+etnaviv@armlinux.org.uk,
 l.stach@pengutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gMTQuMDYuMTkgdW0gMTQ6NTkgc2NocmllYiBQZXRlciBaaWpsc3RyYToKPiBPbiBGcmksIEp1
biAxNCwgMjAxOSBhdCAwMjo0MToyMlBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
PiBVc2UgdGhlIHByb3ZpZGVkIG1hY3JvcyBpbnN0ZWFkIG9mIGltcGxlbWVudGluZyBkZWFkbG9j
ayBoYW5kbGluZyBvbiBvdXIgb3duLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtLmMgfCA0OSArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW0uYwo+PiBpbmRleCA1MGRlMTM4Yzg5ZTAuLjZlNDYyM2QzYmVlMiAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbS5jCj4+IEBAIC0xMzA3LDUxICsxMzA3LDI2IEBAIGludAo+PiAgIGRybV9nZW1f
bG9ja19yZXNlcnZhdGlvbnMoc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqb2JqcywgaW50IGNvdW50
LAo+PiAgIAkJCSAgc3RydWN0IHd3X2FjcXVpcmVfY3R4ICphY3F1aXJlX2N0eCkKPj4gICB7Cj4+
IC0JaW50IGNvbnRlbmRlZCA9IC0xOwo+PiArCXN0cnVjdCB3d19tdXRleCAqY29udGVuZGVkOwo+
PiAgIAlpbnQgaSwgcmV0Owo+PiAgIAo+PiAgIAl3d19hY3F1aXJlX2luaXQoYWNxdWlyZV9jdHgs
ICZyZXNlcnZhdGlvbl93d19jbGFzcyk7Cj4+ICAgCj4+IC1yZXRyeToKPj4gLQlpZiAoY29udGVu
ZGVkICE9IC0xKSB7Cj4+IC0JCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gb2Jqc1tjb250
ZW5kZWRdOwo+PiAtCj4+IC0JCXJldCA9IHd3X211dGV4X2xvY2tfc2xvd19pbnRlcnJ1cHRpYmxl
KCZvYmotPnJlc3YtPmxvY2ssCj4+IC0JCQkJCQkgICAgICAgYWNxdWlyZV9jdHgpOwo+PiAtCQlp
ZiAocmV0KSB7Cj4+IC0JCQl3d19hY3F1aXJlX2RvbmUoYWNxdWlyZV9jdHgpOwo+PiAtCQkJcmV0
dXJuIHJldDsKPj4gLQkJfQo+PiAtCX0KPj4gLQo+PiAtCWZvciAoaSA9IDA7IGkgPCBjb3VudDsg
aSsrKSB7Cj4+IC0JCWlmIChpID09IGNvbnRlbmRlZCkKPj4gLQkJCWNvbnRpbnVlOwo+PiAtCj4+
IC0JCXJldCA9IHd3X211dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmb2Jqc1tpXS0+cmVzdi0+bG9j
aywKPj4gLQkJCQkJCSAgYWNxdWlyZV9jdHgpOwo+PiAtCQlpZiAocmV0KSB7Cj4+IC0JCQlpbnQg
ajsKPj4gLQo+PiAtCQkJZm9yIChqID0gMDsgaiA8IGk7IGorKykKPj4gLQkJCQl3d19tdXRleF91
bmxvY2soJm9ianNbal0tPnJlc3YtPmxvY2spOwo+PiAtCj4+IC0JCQlpZiAoY29udGVuZGVkICE9
IC0xICYmIGNvbnRlbmRlZCA+PSBpKQo+PiAtCQkJCXd3X211dGV4X3VubG9jaygmb2Jqc1tjb250
ZW5kZWRdLT5yZXN2LT5sb2NrKTsKPj4gLQo+PiAtCQkJaWYgKHJldCA9PSAtRURFQURMSykgewo+
PiAtCQkJCWNvbnRlbmRlZCA9IGk7Cj4+IC0JCQkJZ290byByZXRyeTsKPiByZXRyeSBoZXJlLCBz
dGFydHMgdGhlIHdob2xlIGxvY2tpbmcgbG9vcC4KPgo+PiAtCQkJfQo+PiAtCj4+IC0JCQl3d19h
Y3F1aXJlX2RvbmUoYWNxdWlyZV9jdHgpOwo+PiAtCQkJcmV0dXJuIHJldDsKPj4gLQkJfQo+PiAt
CX0KPiArI2RlZmluZSB3d19tdXRleF91bmxvY2tfZm9yX2VhY2gobG9vcCwgcG9zLCBjb250ZW5k
ZWQpIFwKPiArICAgICAgIGlmICghSVNfRVJSKGNvbnRlbmRlZCkpIHsgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiArICAgICAgICAgICAgICAgaWYgKGNvbnRlbmRlZCkgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgICAgICAgICB3d19tdXRleF91bmxvY2soY29u
dGVuZGVkKTsgICAgIFwKPiArICAgICAgICAgICAgICAgY29udGVuZGVkID0gKHBvcyk7ICAgICAg
ICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgbG9vcCB7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoY29udGVu
ZGVkID09IChwb3MpKSAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOyAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgICAgICAgICB3d19t
dXRleF91bmxvY2socG9zKTsgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgfSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIH0KPiArCj4KPiArI2Rl
ZmluZSB3d19tdXRleF9sb2NrX2Zvcl9lYWNoKGxvb3AsIHBvcywgY29udGVuZGVkLCByZXQsIGlu
dHIsIGN0eCkgICBcCj4gKyAgICAgICBmb3IgKGNvbnRlbmRlZCA9IEVSUl9QVFIoLUVOT0VOVCk7
ICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICBfX2xhYmVs
X18gcmVsb2NrLCBuZXh0OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAg
ICAgICAgICAgICAgcmV0ID0gLUVOT0VOVDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIGlmIChjb250ZW5kZWQgPT0gRVJSX1BUUigt
RU5PRU5UKSkgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGNvbnRlbmRlZCA9IE5VTEw7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAg
ICAgICAgICAgICAgZWxzZSBpZiAoY29udGVuZGVkID09IEVSUl9QVFIoLUVERUFETEspKSAgICAg
ICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGVuZGVkID0gKHBvcyk7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICBlbHNlICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIGxvb3AgeyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGlmIChjb250ZW5kZWQgPT0gKHBvcykpIHsgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRlbmRlZCA9IE5VTEw7ICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgICAgICAg
IH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArcmVs
b2NrOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAhKGlu
dHIpID8gd3dfbXV0ZXhfbG9jayhwb3MsIGN0eCkgOiAgICAgICBcCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB3d19tdXRleF9sb2NrX2ludGVycnVwdGlibGUocG9zLCBjdHgpOyAg
XAo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQgPT0gLUVERUFETEspIHsgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHd3
X211dGV4X3VubG9ja19mb3JfZWFjaChsb29wLCBwb3MsICAgICBcCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGVuZGVkKTsgICAg
XAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGVuZGVkID0gRVJSX1BUUigt
RURFQURMSyk7ICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gcmVsb2NrOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4KPiB3aGlsZSByZWxvY2sg
aGVyZSBjb250aW51ZXMgd2hlcmUgaXQgbGVmdCBvZiBhbmQgZG9lc24ndCByZXN0YXJ0IEBsb29w
Lgo+IE9yIGFtIEkgcmVhZGluZyB0aGlzIG1vbnN0cm9zaXR5IHRoZSB3cm9uZyB3YXk/Cgpjb250
ZW5kZWQgPSBFUlJfUFRSKC1FREVBRExLKSBtYWtlcyBzdXJlIHRoYXQgdGhlIHdob2xlIGxvb3Ag
aXMgCnJlc3RhcnRlZCBhZnRlciByZXRyeWluZyB0byBhY3F1aXJlIHRoZSBsb2NrLgoKU2VlIHRo
ZSAiaWYiIGFib3ZlICJsb29wIi4KCkNocmlzdGlhbi4KCj4KPiArICAgICAgICAgICAgICAgICAg
ICAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ICtuZXh0OiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
KyAgICAgICAgICAgICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ICsgICAgICAgfSksIHJldCAhPSAtRU5PRU5UOykKPiArCj4KPj4g
Kwl3d19tdXRleF9sb2NrX2Zvcl9lYWNoKGZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSwKPj4g
KwkJCSAgICAgICAmb2Jqc1tpXS0+cmVzdi0+bG9jaywgY29udGVuZGVkLCByZXQsIHRydWUsCj4+
ICsJCQkgICAgICAgYWNxdWlyZV9jdHgpCj4+ICsJCWlmIChyZXQpCj4+ICsJCQlnb3RvIGVycm9y
Owo+PiAgIAo+PiAgIAl3d19hY3F1aXJlX2RvbmUoYWNxdWlyZV9jdHgpOwo+PiAgIAo+PiAgIAly
ZXR1cm4gMDsKPj4gKwo+PiArZXJyb3I6Cj4+ICsJd3dfbXV0ZXhfdW5sb2NrX2Zvcl9lYWNoKGZv
ciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSwKPj4gKwkJCQkgJm9ianNbaV0tPnJlc3YtPmxvY2ss
IGNvbnRlbmRlZCk7Cj4+ICsJd3dfYWNxdWlyZV9kb25lKGFjcXVpcmVfY3R4KTsKPj4gKwlyZXR1
cm4gcmV0Owo+PiAgIH0KPj4gICBFWFBPUlRfU1lNQk9MKGRybV9nZW1fbG9ja19yZXNlcnZhdGlv
bnMpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRu
YXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
