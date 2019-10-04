Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732DCD1B7
	for <lists+etnaviv@lfdr.de>; Sun,  6 Oct 2019 13:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B336E3FC;
	Sun,  6 Oct 2019 11:24:47 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B92A6EB98
 for <etnaviv@lists.freedesktop.org>; Fri,  4 Oct 2019 13:59:05 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id a1so13730563ioc.6
 for <etnaviv@lists.freedesktop.org>; Fri, 04 Oct 2019 06:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tEWV9BhBdurpPqvh7FtS6h4jnWtzbMLEuK0kv71xj8c=;
 b=EpNvKF5U6UMSRC69X9PWtF2TbJopbtrxd6QvY3Ns4EY5KkLZcR2w9dLioRyAX08dA3
 7LYiWNFMA8PcmDxf054kFSp4ZPiKfNU7EC1wGqDVo0vCotXSSFGZd+3jVKAajUN07vSr
 ScnlP+aTthLYfbqh6x4xeWYlFnIaMqJIxTqBgh6N2/R7p4zbMss08CAPbNuBixjdvAhy
 5t91U7asIPLZhky4QTGpTGAHLwYA8WuF1MGNbP2H2MZ/Qe+qLV4/HZM0IWSoy86TyTod
 9LErAq8kruGajCipKCpIAFjfeXXBu1mBxD7V9MzBPwMM1v9NnpbEK737FSuWvt1BEv1x
 1RJA==
X-Gm-Message-State: APjAAAUTOoxfXdQbXj2EcD/TmSGUtfQP/LAjjDWO3+YfWbdBzf4Smp+K
 ZhnsKnTHdaFbSHY4lJpPvEE59piyh26BKG1Fevs=
X-Google-Smtp-Source: APXvYqzxOYvd5zFEclXdsUmbY63Ktx5ijrpM0Rt5lg+zvqDaDW540phh1l5LkoN7zsDs7OSoPpDYsQMvJzKy8gQbioY=
X-Received: by 2002:a92:3314:: with SMTP id a20mr15204996ilf.276.1570197544161; 
 Fri, 04 Oct 2019 06:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190926160433.GD32311@linux.ibm.com>
 <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
 <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
 <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
 <20191002073605.GA30433@linux.ibm.com>
 <CAHCN7xL1MkJh44N3W_1+08DHmX__SqnfH6dqUzYzr2Wpg0kQyQ@mail.gmail.com>
 <20191003053451.GA23397@linux.ibm.com>
 <20191003084914.GV25745@shell.armlinux.org.uk>
 <20191003113010.GC23397@linux.ibm.com>
 <20191004092727.GX25745@shell.armlinux.org.uk>
 <bc05540f2aa46cff5d6239faab83446401ba7b5f.camel@pengutronix.de>
In-Reply-To: <bc05540f2aa46cff5d6239faab83446401ba7b5f.camel@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 4 Oct 2019 08:58:52 -0500
Message-ID: <CAHCN7xKgoMBxzwC03obFsoXS18yYHcikNaKFU40J=hYo_yUVDw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
To: Lucas Stach <l.stach@pengutronix.de>
X-Mailman-Approved-At: Sun, 06 Oct 2019 11:24:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tEWV9BhBdurpPqvh7FtS6h4jnWtzbMLEuK0kv71xj8c=;
 b=aJiWydjKnntivyzs2i2J3vj6LJmpwv4UabJT55mvn74jjjR/yXPzbUnTg+M1rbIM7m
 Ut//ecuCcDZiLZSr141Qhu22YtpFN/0/THkYoffjgnUxUKsQ6a2H0HKnWiddV1wlO/Ga
 eavLiC9O5RfnvzaBH367+z8FYp5XWsG1xi20xXCJaMYeDTylPW9vGJnQhYNcXjwtASjX
 jCXTK0gyKIoQpkN0j57KIMdSWJjGTr1yW67an3hYju7XMl+EGY/ADHcI/orgHGs8Llp7
 cDwIzSMGhHbYRHSU2p/n1FP2dYKFX5FaLgTa5QmHY7s8cgDlqMigbnII4hV8c3sfgSkR
 CbEw==
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Fabio Estevam <festevam@gmail.com>, Christoph Hellwig <hch@lst.de>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCA4OjIzIEFNIEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1
dHJvbml4LmRlPiB3cm90ZToKPgo+IEFtIEZyZWl0YWcsIGRlbiAwNC4xMC4yMDE5LCAxMDoyNyAr
MDEwMCBzY2hyaWViIFJ1c3NlbGwgS2luZyAtIEFSTQo+IExpbnV4IGFkbWluOgo+ID4gT24gVGh1
LCBPY3QgMDMsIDIwMTkgYXQgMDI6MzA6MTBQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3cm90ZToK
PiA+ID4gT24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDk6NDk6MTRBTSArMDEwMCwgUnVzc2VsbCBL
aW5nIC0gQVJNIExpbnV4Cj4gPiA+IGFkbWluIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgT2N0IDAz
LCAyMDE5IGF0IDA4OjM0OjUyQU0gKzAzMDAsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiA+ID4g
PiAodHJpbW1lZCB0aGUgQ0MpCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gV2VkLCBPY3QgMDIsIDIw
MTkgYXQgMDY6MTQ6MTFBTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBX
ZWQsIE9jdCAyLCAyMDE5IGF0IDI6MzYgQU0gTWlrZSBSYXBvcG9ydCA8Cj4gPiA+ID4gPiA+IHJw
cHRAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEJlZm9yZSB0
aGUgcGF0Y2g6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVn
L21lbWJsb2NrL21lbW9yeQo+ID4gPiA+ID4gPiAgICAwOiAweDEwMDAwMDAwLi4weDhmZmZmZmZm
Cj4gPiA+ID4gPiA+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVnL21lbWJsb2NrL3Jlc2VydmVkCj4g
PiA+ID4gPiA+ICAgIDA6IDB4MTAwMDQwMDAuLjB4MTAwMDdmZmYKPiA+ID4gPiA+ID4gICAzNDog
MHgyZmZmZmY4OC4uMHgzZmZmZmZmZgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBBZnRlciB0aGUgcGF0Y2g6Cj4gPiA+ID4gPiA+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVnL21l
bWJsb2NrL21lbW9yeQo+ID4gPiA+ID4gPiAgICAwOiAweDEwMDAwMDAwLi4weDhmZmZmZmZmCj4g
PiA+ID4gPiA+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVnL21lbWJsb2NrL3Jlc2VydmVkCj4gPiA+
ID4gPiA+ICAgIDA6IDB4MTAwMDQwMDAuLjB4MTAwMDdmZmYKPiA+ID4gPiA+ID4gICAzNjogMHg4
MDAwMDAwMC4uMHg4ZmZmZmZmZgo+ID4gPiA+ID4KPiA+ID4gPiA+IEknbSBzdGlsbCBub3QgY29u
dmluY2VkIHRoYXQgdGhlIG1lbWJsb2NrIHJlZmFjdG9yaW5nIGRpZG4ndAo+ID4gPiA+ID4gdW5j
b3ZlcmVkIGFuCj4gPiA+ID4gPiBpc3N1ZSBpbiBldG5hdml2IGRyaXZlci4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBXaHkgbW92aW5nIHRoZSBDTUEgYXJlYSBmcm9tIDB4ODAwMDAwMDAgdG8gMHgzMDAw
MDAwMCBtYWtlcyBpdAo+ID4gPiA+ID4gZmFpbD8KPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsgeW91
IGhhdmUgdGhhdCB0aGUgd3Jvbmcgd2F5IHJvdW5kLgo+ID4gPgo+ID4gPiBJJ20gcmVseWluZyBv
biBBZGFtJ3MgcmVwb3J0cyBvZiB3b3JraW5nIGFuZCBub24td29ya2luZyB2ZXJzaW9ucy4KPiA+
ID4gQWNjb3JkaW5nIHRvIHRoYXQgZXRuYXZpdiB3b3JrcyB3aGVuIENNQSBhcmVhIGlzIGF0IDB4
ODAwMDAwMDAgYW5kCj4gPiA+IGRvZXMgbm90Cj4gPiA+IHdvcmsgd2hlbiBpdCBpcyBhdCAweDMw
MDAwMDAwLgo+ID4gPgo+ID4gPiBIZSBhbHNvIHNlbnQgbG9ncyBhIGZldyBkYXlzIGFnbyBbMV0s
IHRoZXkgYWxzbyBjb25maXJtIHRoYXQuCj4gPiA+Cj4gPiA+IFsxXQo+ID4gPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1tbS9DQUhDTjd4SkV2UzJTaT1NK0JZdHora1kwTTROeG1xRGpp
WDlOd3E2XzNHR0JoM3lnPXdAbWFpbC5nbWFpbC5jb20vCj4gPgo+ID4gU29ycnksIHllcywgeW91
J3JlIHJpZ2h0LiAgU3RpbGwsIEkndmUgcmVwb3J0ZWQgdGhpcyBzYW1lIHJlZ3Jlc3Npb24KPiA+
IGEgd2hpbGUgYmFjaywgYW5kIGl0J3MgbmV2ZXIgZ29uZSBhd2F5Lgo+ID4KPiA+ID4gPiA+IEJU
VywgdGhlIGNvZGUgdGhhdCBjb21wbGFpbmVkIGFib3V0ICJjb21tYW5kIGJ1ZmZlciBvdXRzaWRl
Cj4gPiA+ID4gPiB2YWxpZCBtZW1vcnkKPiA+ID4gPiA+IHdpbmRvdyIgaGFzIGJlZW4gcmVtb3Zl
ZCBieSB0aGUgY29tbWl0IDE3ZTQ2NjBhZTNkNwo+ID4gPiA+ID4gKCJkcm0vZXRuYXZpdjoKPiA+
ID4gPiA+IGltcGxlbWVudCBwZXItcHJvY2VzcyBhZGRyZXNzIHNwYWNlcyBvbiBNTVV2MiIpLgo+
ID4gPiA+ID4KPiA+ID4gPiA+IENvdWxkIGJlIHRoYXQgcmVjZW50IGNoYW5nZXMgdG8gTU1VIG1h
bmFnZW1lbnQgb2YgZXRuYXZpdgo+ID4gPiA+ID4gcmVzb2x2ZSB0aGUKPiA+ID4gPiA+IGlzc3Vl
Pwo+ID4gPiA+Cj4gPiA+ID4gVGhlIGlNWDYgZG9lcyBub3QgaGF2ZSBNTVV2MiBoYXJkd2FyZSwg
aXQgaGFzIE1NVXYxLiAgV2l0aCBNTVV2MQo+ID4gPiA+IGhhcmR3YXJlIHJlcXVpcmVzIGNvbW1h
bmQgYnVmZmVycyB3aXRoaW4gdGhlIGZpcnN0IDJHaUIgb2YKPiA+ID4gPiBwaHlzaWNhbAo+ID4g
PiA+IFJBTS4KPiA+ID4KPiA+ID4gSSd2ZSBtZW50aW9uZWQgdGhhdCBwYXRjaCBiZWNhdXNlIGl0
IHJlbW92ZWQgdGhlIGNoZWNrIGZvciBjbWRidWYKPiA+ID4gYWRkcmVzcwo+ID4gPiBmb3IgTU1V
djE6Cj4gPiA+Cj4gPiA+IEBAIC03ODUsMTUgKzc2OCw3IEBAIGludCBldG5hdml2X2dwdV9pbml0
KHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUEFHRV9TSVpFKTsKPiA+ID4gICAgICAgICBpZiAocmV0KSB7Cj4gPiA+ICAgICAg
ICAgICAgICAgICBkZXZfZXJyKGdwdS0+ZGV2LCAiY291bGQgbm90IGNyZWF0ZSBjb21tYW5kCj4g
PiA+IGJ1ZmZlclxuIik7Cj4gPiA+IC0gICAgICAgICAgICAgICBnb3RvIHVubWFwX3N1YmFsbG9j
Owo+ID4gPiAtICAgICAgIH0KPiA+ID4gLQo+ID4gPiAtICAgICAgIGlmICghKGdwdS0+aWRlbnRp
dHkubWlub3JfZmVhdHVyZXMxICYKPiA+ID4gY2hpcE1pbm9yRmVhdHVyZXMxX01NVV9WRVJTSU9O
KSAmJgo+ID4gPiAtICAgICAgICAgICBldG5hdml2X2NtZGJ1Zl9nZXRfdmEoJmdwdS0+YnVmZmVy
LCAmZ3B1LQo+ID4gPiA+Y21kYnVmX21hcHBpbmcpID4gMHg4MDAwMDAwMCkgewo+ID4gPiAtICAg
ICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+ID4gLSAgICAgICAgICAgICAgIGRldl9lcnIo
Z3B1LT5kZXYsCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICJjb21tYW5kIGJ1ZmZlciBv
dXRzaWRlIHZhbGlkIG1lbW9yeQo+ID4gPiB3aW5kb3dcbiIpOwo+ID4gPiAtICAgICAgICAgICAg
ICAgZ290byBmcmVlX2J1ZmZlcjsKPiA+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZmFpbDsKPiA+
ID4gICAgICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAgICAgLyogU2V0dXAgZXZlbnQgbWFuYWdlbWVu
dCAqLwo+ID4gPgo+ID4gPgo+ID4gPiBJIHJlYWxseSBkb24ndCBrbm93IGhvdyBldG5hdml2IHdv
cmtzLCBzbyBJIGhvcGVkIHRoYXQgcGVvcGxlIHdobwo+ID4gPiB1bmRlcnN0YW5kIGl0IHdvdWxk
IGhlbHAuCj4gPgo+ID4gRnJvbSB3aGF0IEkgY2FuIHNlZSwgcmVtb3ZpbmcgdGhhdCBjaGVjayBp
cyBhIGNvbXBsZXRlbHkgaW5zYW5lIHRoaW5nCj4gPiB0byBkbywgYW5kIEkgbm90ZSB0aGF0IHRo
ZXNlIGNoYW5nZXMgYXJlIF9ub3RfIGRlc2NyaWJlZCBpbiB0aGUKPiA+IGNvbW1pdAo+ID4gbWVz
c2FnZS4gIFRoZSBwcm9ibGVtIHdhcyBrbm93biBhYm91dCBfYmVmb3JlXyAoSnVuZSAyMikgdGhl
IHBhdGNoCj4gPiB3YXMKPiA+IGNyZWF0ZWQgKEp1bHkgNSkuCj4gPgo+ID4gTHVjYXMsIHBsZWFz
ZSBjYW4geW91IGV4cGxhaW4gd2h5IHJlbW92aW5nIHRoZSBhYm92ZSBjaGVjaywgd2hpY2ggaXMK
PiA+IHdlbGwga25vd24gdG8gY29ycmVjdGx5IHRyaWdnZXIgb24gdmFyaW91cyBwbGF0Zm9ybXMg
dG8gcHJldmVudAo+ID4gaW5jb3JyZWN0IEdQVSBiZWhhdmlvdXIsIGlzIHNhZmU/Cj4KPiBJdCBp
c24ndC4gSXQncyBhIHByZXR0eSBiaWcgb3ZlcnNpZ2h0IGluIHRoaXMgY29tbWl0IHRvIHJlbW92
ZSB0aGlzCj4gY2hlY2suIEl0IGNhbid0IGJlIGRvbmUgYXQgdGhlIHNhbWUgc3BvdCBpbiB0aGUg
Y29kZSBhbnltb3JlLCBhcyB3ZQo+IGRvbid0IGhhdmUgYSBtYXBwaW5nIGNvbnRleHQgYXQgdGhp
cyB0aW1lIGFueW1vcmUsIGJ1dCBpdCBzaG91bGQgaGF2ZQo+IG1vdmVkIGludG8gZXRuYXZpdl9p
b21tdV9jb250ZXh0X2luaXQoKS4gSSdsbCBzZW5kIGEgcGF0Y2ggdG8gZml4IHRoaXMKPiB1cC4K
CklmIHlvdSBDQyBtZSwgSSB3aWxsIHRlc3QgaXQgYW5kIHJlcG9ydCBteSBmaW5kaW5ncy4KCmFk
YW0KCj4KPiBSZWdhcmRzLAo+IEx1Y2FzCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ldG5hdml2
