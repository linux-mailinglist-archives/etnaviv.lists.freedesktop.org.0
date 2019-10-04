Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1A0CBBF0
	for <lists+etnaviv@lfdr.de>; Fri,  4 Oct 2019 15:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA056EB84;
	Fri,  4 Oct 2019 13:40:41 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839996EB7B
 for <etnaviv@lists.freedesktop.org>; Fri,  4 Oct 2019 13:23:28 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1iGNWS-0001sz-5V; Fri, 04 Oct 2019 15:21:28 +0200
Message-ID: <bc05540f2aa46cff5d6239faab83446401ba7b5f.camel@pengutronix.de>
Subject: Re: [PATCH v2 00/21] Refine memblock API
From: Lucas Stach <l.stach@pengutronix.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Mike Rapoport
 <rppt@linux.ibm.com>
Date: Fri, 04 Oct 2019 15:21:03 +0200
In-Reply-To: <20191004092727.GX25745@shell.armlinux.org.uk>
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
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 04 Oct 2019 13:40:40 +0000
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
Cc: Adam Ford <aford173@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Fabio Estevam <festevam@gmail.com>,
 Christoph Hellwig <hch@lst.de>, arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgZGVuIDA0LjEwLjIwMTksIDEwOjI3ICswMTAwIHNjaHJpZWIgUnVzc2VsbCBL
aW5nIC0gQVJNCkxpbnV4IGFkbWluOgo+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDAyOjMwOjEw
UE0gKzAzMDAsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAwMywgMjAxOSBh
dCAwOTo0OToxNEFNICswMTAwLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXgKPiA+IGFkbWluIHdy
b3RlOgo+ID4gPiBPbiBUaHUsIE9jdCAwMywgMjAxOSBhdCAwODozNDo1MkFNICswMzAwLCBNaWtl
IFJhcG9wb3J0IHdyb3RlOgo+ID4gPiA+ICh0cmltbWVkIHRoZSBDQykKPiA+ID4gPiAKPiA+ID4g
PiBPbiBXZWQsIE9jdCAwMiwgMjAxOSBhdCAwNjoxNDoxMUFNIC0wNTAwLCBBZGFtIEZvcmQgd3Jv
dGU6Cj4gPiA+ID4gPiBPbiBXZWQsIE9jdCAyLCAyMDE5IGF0IDI6MzYgQU0gTWlrZSBSYXBvcG9y
dCA8Cj4gPiA+ID4gPiBycHB0QGxpbnV4LmlibS5jb20+IHdyb3RlOgo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBCZWZvcmUgdGhlIHBhdGNoOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAjIGNhdCAvc3lzL2tl
cm5lbC9kZWJ1Zy9tZW1ibG9jay9tZW1vcnkKPiA+ID4gPiA+ICAgIDA6IDB4MTAwMDAwMDAuLjB4
OGZmZmZmZmYKPiA+ID4gPiA+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVnL21lbWJsb2NrL3Jlc2Vy
dmVkCj4gPiA+ID4gPiAgICAwOiAweDEwMDA0MDAwLi4weDEwMDA3ZmZmCj4gPiA+ID4gPiAgIDM0
OiAweDJmZmZmZjg4Li4weDNmZmZmZmZmCj4gPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4g
QWZ0ZXIgdGhlIHBhdGNoOgo+ID4gPiA+ID4gIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvbWVtYmxv
Y2svbWVtb3J5Cj4gPiA+ID4gPiAgICAwOiAweDEwMDAwMDAwLi4weDhmZmZmZmZmCj4gPiA+ID4g
PiAjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1ibG9jay9yZXNlcnZlZAo+ID4gPiA+ID4gICAg
MDogMHgxMDAwNDAwMC4uMHgxMDAwN2ZmZgo+ID4gPiA+ID4gICAzNjogMHg4MDAwMDAwMC4uMHg4
ZmZmZmZmZgo+ID4gPiA+IAo+ID4gPiA+IEknbSBzdGlsbCBub3QgY29udmluY2VkIHRoYXQgdGhl
IG1lbWJsb2NrIHJlZmFjdG9yaW5nIGRpZG4ndAo+ID4gPiA+IHVuY292ZXJlZCBhbgo+ID4gPiA+
IGlzc3VlIGluIGV0bmF2aXYgZHJpdmVyLgo+ID4gPiA+IAo+ID4gPiA+IFdoeSBtb3ZpbmcgdGhl
IENNQSBhcmVhIGZyb20gMHg4MDAwMDAwMCB0byAweDMwMDAwMDAwIG1ha2VzIGl0Cj4gPiA+ID4g
ZmFpbD8KPiA+ID4gCj4gPiA+IEkgdGhpbmsgeW91IGhhdmUgdGhhdCB0aGUgd3Jvbmcgd2F5IHJv
dW5kLgo+ID4gCj4gPiBJJ20gcmVseWluZyBvbiBBZGFtJ3MgcmVwb3J0cyBvZiB3b3JraW5nIGFu
ZCBub24td29ya2luZyB2ZXJzaW9ucy4KPiA+IEFjY29yZGluZyB0byB0aGF0IGV0bmF2aXYgd29y
a3Mgd2hlbiBDTUEgYXJlYSBpcyBhdCAweDgwMDAwMDAwIGFuZAo+ID4gZG9lcyBub3QKPiA+IHdv
cmsgd2hlbiBpdCBpcyBhdCAweDMwMDAwMDAwLgo+ID4gCj4gPiBIZSBhbHNvIHNlbnQgbG9ncyBh
IGZldyBkYXlzIGFnbyBbMV0sIHRoZXkgYWxzbyBjb25maXJtIHRoYXQuCj4gPiAKPiA+IFsxXSAK
PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tL0NBSENON3hKRXZTMlNpPU0rQll0
eitrWTBNNE54bXFEamlYOU53cTZfM0dHQmgzeWc9d0BtYWlsLmdtYWlsLmNvbS8KPiAKPiBTb3Jy
eSwgeWVzLCB5b3UncmUgcmlnaHQuICBTdGlsbCwgSSd2ZSByZXBvcnRlZCB0aGlzIHNhbWUgcmVn
cmVzc2lvbgo+IGEgd2hpbGUgYmFjaywgYW5kIGl0J3MgbmV2ZXIgZ29uZSBhd2F5Lgo+IAo+ID4g
PiA+IEJUVywgdGhlIGNvZGUgdGhhdCBjb21wbGFpbmVkIGFib3V0ICJjb21tYW5kIGJ1ZmZlciBv
dXRzaWRlCj4gPiA+ID4gdmFsaWQgbWVtb3J5Cj4gPiA+ID4gd2luZG93IiBoYXMgYmVlbiByZW1v
dmVkIGJ5IHRoZSBjb21taXQgMTdlNDY2MGFlM2Q3Cj4gPiA+ID4gKCJkcm0vZXRuYXZpdjoKPiA+
ID4gPiBpbXBsZW1lbnQgcGVyLXByb2Nlc3MgYWRkcmVzcyBzcGFjZXMgb24gTU1VdjIiKS4gCj4g
PiA+ID4gCj4gPiA+ID4gQ291bGQgYmUgdGhhdCByZWNlbnQgY2hhbmdlcyB0byBNTVUgbWFuYWdl
bWVudCBvZiBldG5hdml2Cj4gPiA+ID4gcmVzb2x2ZSB0aGUKPiA+ID4gPiBpc3N1ZT8KPiA+ID4g
Cj4gPiA+IFRoZSBpTVg2IGRvZXMgbm90IGhhdmUgTU1VdjIgaGFyZHdhcmUsIGl0IGhhcyBNTVV2
MS4gIFdpdGggTU1VdjEKPiA+ID4gaGFyZHdhcmUgcmVxdWlyZXMgY29tbWFuZCBidWZmZXJzIHdp
dGhpbiB0aGUgZmlyc3QgMkdpQiBvZgo+ID4gPiBwaHlzaWNhbAo+ID4gPiBSQU0uCj4gPiAKPiA+
IEkndmUgbWVudGlvbmVkIHRoYXQgcGF0Y2ggYmVjYXVzZSBpdCByZW1vdmVkIHRoZSBjaGVjayBm
b3IgY21kYnVmCj4gPiBhZGRyZXNzCj4gPiBmb3IgTU1VdjE6Cj4gPiAKPiA+IEBAIC03ODUsMTUg
Kzc2OCw3IEBAIGludCBldG5hdml2X2dwdV9pbml0KHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfU0laRSk7Cj4gPiAgICAg
ICAgIGlmIChyZXQpIHsKPiA+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGdwdS0+ZGV2LCAiY291
bGQgbm90IGNyZWF0ZSBjb21tYW5kCj4gPiBidWZmZXJcbiIpOwo+ID4gLSAgICAgICAgICAgICAg
IGdvdG8gdW5tYXBfc3ViYWxsb2M7Cj4gPiAtICAgICAgIH0KPiA+IC0KPiA+IC0gICAgICAgaWYg
KCEoZ3B1LT5pZGVudGl0eS5taW5vcl9mZWF0dXJlczEgJgo+ID4gY2hpcE1pbm9yRmVhdHVyZXMx
X01NVV9WRVJTSU9OKSAmJgo+ID4gLSAgICAgICAgICAgZXRuYXZpdl9jbWRidWZfZ2V0X3ZhKCZn
cHUtPmJ1ZmZlciwgJmdwdS0KPiA+ID5jbWRidWZfbWFwcGluZykgPiAweDgwMDAwMDAwKSB7Cj4g
PiAtICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+IC0gICAgICAgICAgICAgICBkZXZf
ZXJyKGdwdS0+ZGV2LAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgImNvbW1hbmQgYnVmZmVy
IG91dHNpZGUgdmFsaWQgbWVtb3J5Cj4gPiB3aW5kb3dcbiIpOwo+ID4gLSAgICAgICAgICAgICAg
IGdvdG8gZnJlZV9idWZmZXI7Cj4gPiArICAgICAgICAgICAgICAgZ290byBmYWlsOwo+ID4gICAg
ICAgICB9Cj4gPiAgCj4gPiAgICAgICAgIC8qIFNldHVwIGV2ZW50IG1hbmFnZW1lbnQgKi8KPiA+
IAo+ID4gCj4gPiBJIHJlYWxseSBkb24ndCBrbm93IGhvdyBldG5hdml2IHdvcmtzLCBzbyBJIGhv
cGVkIHRoYXQgcGVvcGxlIHdobwo+ID4gdW5kZXJzdGFuZCBpdCB3b3VsZCBoZWxwLgo+IAo+IEZy
b20gd2hhdCBJIGNhbiBzZWUsIHJlbW92aW5nIHRoYXQgY2hlY2sgaXMgYSBjb21wbGV0ZWx5IGlu
c2FuZSB0aGluZwo+IHRvIGRvLCBhbmQgSSBub3RlIHRoYXQgdGhlc2UgY2hhbmdlcyBhcmUgX25v
dF8gZGVzY3JpYmVkIGluIHRoZQo+IGNvbW1pdAo+IG1lc3NhZ2UuICBUaGUgcHJvYmxlbSB3YXMg
a25vd24gYWJvdXQgX2JlZm9yZV8gKEp1bmUgMjIpIHRoZSBwYXRjaAo+IHdhcwo+IGNyZWF0ZWQg
KEp1bHkgNSkuCj4gCj4gTHVjYXMsIHBsZWFzZSBjYW4geW91IGV4cGxhaW4gd2h5IHJlbW92aW5n
IHRoZSBhYm92ZSBjaGVjaywgd2hpY2ggaXMKPiB3ZWxsIGtub3duIHRvIGNvcnJlY3RseSB0cmln
Z2VyIG9uIHZhcmlvdXMgcGxhdGZvcm1zIHRvIHByZXZlbnQKPiBpbmNvcnJlY3QgR1BVIGJlaGF2
aW91ciwgaXMgc2FmZT8KCkl0IGlzbid0LiBJdCdzIGEgcHJldHR5IGJpZyBvdmVyc2lnaHQgaW4g
dGhpcyBjb21taXQgdG8gcmVtb3ZlIHRoaXMKY2hlY2suIEl0IGNhbid0IGJlIGRvbmUgYXQgdGhl
IHNhbWUgc3BvdCBpbiB0aGUgY29kZSBhbnltb3JlLCBhcyB3ZQpkb24ndCBoYXZlIGEgbWFwcGlu
ZyBjb250ZXh0IGF0IHRoaXMgdGltZSBhbnltb3JlLCBidXQgaXQgc2hvdWxkIGhhdmUKbW92ZWQg
aW50byBldG5hdml2X2lvbW11X2NvbnRleHRfaW5pdCgpLiBJJ2xsIHNlbmQgYSBwYXRjaCB0byBm
aXggdGhpcwp1cC4KClJlZ2FyZHMsCkx1Y2FzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2V0bmF2aXY=
