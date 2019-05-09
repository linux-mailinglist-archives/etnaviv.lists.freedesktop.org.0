Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D65518640
	for <lists+etnaviv@lfdr.de>; Thu,  9 May 2019 09:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F033897C5;
	Thu,  9 May 2019 07:38:14 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F0C897C5;
 Thu,  9 May 2019 07:38:13 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id r62so794137vsc.9;
 Thu, 09 May 2019 00:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=X9seXLEMxlNnS6S3aHJeECu3lZ+tQD68b35cdb/PU7o=;
 b=Cp8TSpwalbIMoEspxUWTFpyVWCnSzrPs1zEyYTu7ABCtSQJ6oHFfDM8Wopc78qVqiJ
 mdCYbq7943tTnpQCjqfHy3jYBSS474eaktme+vXZ9gjjOyg43GhO8SXQHmA0F0K/8Foi
 kUKaqaxfDenhbH4YZbuXzoAWUTkYoJaEDGCRjHYan+oCxGZG5HlzViS+85IUHaE7ZWa1
 UM293wfCy+yUuzB8aLL2IJiKN8C22uPG860Wg4eYwInDncLf0sIVbxJzDh6skIPUZ4fn
 6o4eoX/QzhQztr25tjIoAU+XJpfbHQgS94LPcL1T1k7Tka8kU5HOnemxR1aGlXRuTNqG
 e7GA==
X-Gm-Message-State: APjAAAWFKWB2yBgvW8ND5qbohdP4P4A3SCJ+PzAm2SMhOM2x9Hhps39/
 l0yc5ajJEMNzwhmGphMX+uC9T7U8iUbLJRI49fQklt1V0vU=
X-Google-Smtp-Source: APXvYqyeN7WRmN9Essg3IbW3RWN6GpTFKPWhWlrN9iWrxbmwpMhD7z8FCjEUCJ/JmXUcAVzmQGYz2HLuB5c89UY7bdE=
X-Received: by 2002:a67:f34d:: with SMTP id p13mr819517vsm.95.1557387492140;
 Thu, 09 May 2019 00:38:12 -0700 (PDT)
MIME-Version: 1.0
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 9 May 2019 09:38:01 +0200
Message-ID: <CAH9NwWceSgGOYLvngSaGSTFh4rqkaSDppOWZwMfxvdUqN-JPxg@mail.gmail.com>
Subject: [MR] etnaviv: add low level ISA library
To: ML mesa-dev <mesa-dev@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=X9seXLEMxlNnS6S3aHJeECu3lZ+tQD68b35cdb/PU7o=;
 b=gA+0GAUWAJvBD+XcQeGWOejmUOESbvPhCpDJOzpHr0cdJuCicm4gt5tsIe4aO0hbL8
 M7I19VgJmg+sTUDRH0GxznvdcU4dEaYLGdJtsSeYzH17m/vYmDM2XyXOgPpr0rwEvQHp
 rd/C5CTfvC3rBWuraoXMDfFltggXP0rH4SF/63c/Jy6iIUzMt6I2FOunG7bUPqiBxSEm
 Lki0uDu+FDWB8NMkyCGgI4AbsR3lTTxEvbezqtRBvY5inC/KeoEY0ig7pQkc8z3Q6ctO
 FKiDGoEgqUqljQ1FcbQ1+rQEMhOdAauhkMYH0w87Z8ovmU1HfySQoJtHMVYZTyr36Xng
 muhQ==
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

VGhpcyBNUiBhZGRzIGEgbG93IGxldmVsIElTQSBsaWJyYXJ5IGNvbnRhaW5pbmcgQVBJcyBmb3Ig
YXNtLCBkaWFzbQphbmQgbWV0YSBpbmZvcm1hdGlvbi4gT25lIGJlbmVmaXQgb2YgbW92aW5nIGFs
bCB0aGlzIHN0dWZmIG91dCBvZiB0aGUKZ2FsbGl1bSBkcml2ZXIgaXMgdGhhdCBpdCBvcGVucyB0
aGUgZG9vciBmb3IgdnVsa2FuLiBVbml0IHRlc3RzIGFyZQppbmNsdWRlZCBhbmQgdGhlIGN1cnJl
bnQgZXRuYXZpdiBkaXNhc20gZ2V0cyByZXBsYWNlZCB3aXRoIHRoZSBuZXcKb25lLgoKaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS9tZXJnZV9yZXF1ZXN0cy84NDgKLS0g
CmdyZWV0cwotLQpDaHJpc3RpYW4gR21laW5lciwgTVNjCgpodHRwczovL2NocmlzdGlhbi1nbWVp
bmVyLmluZm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
