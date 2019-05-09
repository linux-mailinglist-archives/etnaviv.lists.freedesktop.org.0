Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8332E18B02
	for <lists+etnaviv@lfdr.de>; Thu,  9 May 2019 15:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E25B89CBA;
	Thu,  9 May 2019 13:53:50 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5713589CBA;
 Thu,  9 May 2019 13:53:49 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id q64so1469533vsd.1;
 Thu, 09 May 2019 06:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sTRPhprztDtbG1fAjoaSZcQBKD6MogAE08NB2uqOx1M=;
 b=hZYRCGwDfgMBrLZMUscOotA/pDTL3LuVw6zasUW2was/SJ6ZN3b7cIZAQ0P2eE/eK/
 fMLeLUVhTx5MAHJOl2q1sAos+y2WN7yF9/xd60zaFMSCjguYH7DQCzZGj9BgePraUB80
 gqB4ccKhuh+cTEJs7ANpSbPIO7prOPBUe9isQNxqLczpKKdl7skIgfvZ6fU9WqQloPLU
 SnfJkAi+DGq6bB0FALZBpYeJZPDG2BYASknVAm7aDVHdH3IWMm0g63tCn+xlSIxUjFTC
 0lwelxwkOn5zRUBQVVdO3R9RWbNZTj5TOeYBral1wxdaByj54dv5dMjju0MCnTGvt/Rh
 DhZA==
X-Gm-Message-State: APjAAAXZpByUJill0zDqk4bjh6ptvr6hiKjPkDbL4mIacBHAQOzVBpgE
 c92K7DtWmMJzmAsIXuOt/AnAf0/wkO9nPf55yR73JCnH7QI=
X-Google-Smtp-Source: APXvYqwW8NWoZAVhPO0bb5usSro0BtkI8m0ObSVk70NHcWohzfpTcM/BLvwrFwucBDKCUJ/1Q0U2+1eQgnoYck2feLM=
X-Received: by 2002:a67:f1c3:: with SMTP id v3mr2335707vsm.88.1557410028366;
 Thu, 09 May 2019 06:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190503100524.23232-1-p.zabel@pengutronix.de>
In-Reply-To: <20190503100524.23232-1-p.zabel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 9 May 2019 15:53:36 +0200
Message-ID: <CAH9NwWc4Dg8Q=rr-1ExhZ25bEJdGtTRExRsUhp9t_GdT08VNLQ@mail.gmail.com>
Subject: Re: [PATCH] etnaviv: fill missing offset in etna_resource_get_handle
To: Philipp Zabel <p.zabel@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=sTRPhprztDtbG1fAjoaSZcQBKD6MogAE08NB2uqOx1M=;
 b=TNv0R2Y4xbaKOSODi/7kBJW5Ovg4hwt0uil9DZk1j2rf8zAHxpfT0qnXiRn0Fsn6tC
 Lw2CBNUhlvWfOgL8mzuA1PJgLKMv1hWmp+Qo9KRxe+IvUCm8Pckkh2yjFFrVhmf1ZCU3
 5PjJ4LAfNlHDfv1vrVcCKoO5ahuE+svul1Gmcy6ByARSikhuhZeNJCAcBJaa836evhb+
 Zh95RZG0vbtwXX6uDc1AdqUDrojJ7kkdlXegLVT6juOwPD1d6kG2e0ojcxPdpNBHWAco
 9K2mLx21lMHIyxU+o4U24tdf+qsd3zETglLrFAtj2d4JBmp04bNG1uiLviVm6b0C8h3W
 NWJg==
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>, graphics@pengutronix.de,
 The etnaviv authors <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gRnIuLCAzLiBNYWkgMjAxOSB1bSAxMjowNSBVaHIgc2NocmllYiBQaGlsaXBwIFphYmVsIDxw
LnphYmVsQHBlbmd1dHJvbml4LmRlPjoKPgo+IFdpdGhvdXQgdGhpcyBnYm1fYm9fZ2V0X29mZnNl
dCgpIGNhbiByZXR1cm4gMCB3aGVyZSBpdCBzaG91bGRuJ3QuCgpSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4KCj4gLS0tCj4gIHNyYy9n
YWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5hdml2X3Jlc291cmNlLmMgfCAxICsKPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvc3JjL2dhbGxpdW0vZHJp
dmVycy9ldG5hdml2L2V0bmF2aXZfcmVzb3VyY2UuYyBiL3NyYy9nYWxsaXVtL2RyaXZlcnMvZXRu
YXZpdi9ldG5hdml2X3Jlc291cmNlLmMKPiBpbmRleCA4MzE3OWQzY2QwODguLmFiNzdhODBjNzJi
MyAxMDA2NDQKPiAtLS0gYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9yZXNv
dXJjZS5jCj4gKysrIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfcmVzb3Vy
Y2UuYwo+IEBAIC02MjIsNiArNjIyLDcgQEAgZXRuYV9yZXNvdXJjZV9nZXRfaGFuZGxlKHN0cnVj
dCBwaXBlX3NjcmVlbiAqcHNjcmVlbiwKPiAgICAgICAgcnNjID0gZXRuYV9yZXNvdXJjZShyc2Mt
PmV4dGVybmFsKTsKPgo+ICAgICBoYW5kbGUtPnN0cmlkZSA9IHJzYy0+bGV2ZWxzWzBdLnN0cmlk
ZTsKPiArICAgaGFuZGxlLT5vZmZzZXQgPSByc2MtPmxldmVsc1swXS5vZmZzZXQ7Cj4gICAgIGhh
bmRsZS0+bW9kaWZpZXIgPSBsYXlvdXRfdG9fbW9kaWZpZXIocnNjLT5sYXlvdXQpOwo+Cj4gICAg
IGlmIChoYW5kbGUtPnR5cGUgPT0gV0lOU1lTX0hBTkRMRV9UWVBFX1NIQVJFRCkgewo+IC0tCj4g
Mi4yMC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGV0bmF2aXYgbWFpbGluZyBsaXN0Cj4gZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXYK
CgoKLS0gCmdyZWV0cwotLQpDaHJpc3RpYW4gR21laW5lciwgTVNjCgpodHRwczovL2NocmlzdGlh
bi1nbWVpbmVyLmluZm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
