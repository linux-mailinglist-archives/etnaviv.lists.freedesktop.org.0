Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A72CB788
	for <lists+etnaviv@lfdr.de>; Fri,  4 Oct 2019 11:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444E26EB01;
	Fri,  4 Oct 2019 09:43:35 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D711898C7
 for <etnaviv@lists.freedesktop.org>; Fri,  4 Oct 2019 09:27:38 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:47428)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iGJs0-0003Kl-Rk; Fri, 04 Oct 2019 10:27:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iGJrz-0002ep-F3; Fri, 04 Oct 2019 10:27:27 +0100
Date: Fri, 4 Oct 2019 10:27:27 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
Message-ID: <20191004092727.GX25745@shell.armlinux.org.uk>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003113010.GC23397@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 04 Oct 2019 09:43:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JxwVJy5nKMDRo3GZKoi+Bai6N/gF8LVE8Myk8htgmzw=; b=aoVRLD61phEvxW201Bjx+MZZK
 htAud3bMiBmDZOKnPB7tVtondrSlYY0HD/zHfuBbIm8APZM7meDWZrSnH4CfZND9XW0Q8cNOS5nW9
 AuFvEFGRps2c86IoVsX1NdsovxvQ37kkJ+0p1lYD82hw2G2U7zWqUIeyZnTicJo68WGQh1H2rR26c
 OKzTADfAo0i7omi5J/lgHV05BrgudcT/RcceoGr4BjYxnJN/8F3LUr1pHmPMCu+H0TfS3HyewEYkM
 sFbaGofNX5nUv60bfyG0MeG8fljTwoL4Neqohw82DyziUU2Q2oAeOt2kplqARNtaQ6de2fPl17MCG
 PYotUBxKA==;
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
 Christoph Hellwig <hch@lst.de>, arm-soc <linux-arm-kernel@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDI6MzA6MTBQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBPbiBUaHUsIE9jdCAwMywgMjAxOSBhdCAwOTo0OToxNEFNICswMTAwLCBSdXNzZWxs
IEtpbmcgLSBBUk0gTGludXggYWRtaW4gd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAwMywgMjAxOSBh
dCAwODozNDo1MkFNICswMzAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gPiAodHJpbW1lZCB0
aGUgQ0MpCj4gPiA+IAo+ID4gPiBPbiBXZWQsIE9jdCAwMiwgMjAxOSBhdCAwNjoxNDoxMUFNIC0w
NTAwLCBBZGFtIEZvcmQgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBPY3QgMiwgMjAxOSBhdCAyOjM2
IEFNIE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+
ID4gPiA+IAo+ID4gPiA+IEJlZm9yZSB0aGUgcGF0Y2g6Cj4gPiA+ID4gCj4gPiA+ID4gIyBjYXQg
L3N5cy9rZXJuZWwvZGVidWcvbWVtYmxvY2svbWVtb3J5Cj4gPiA+ID4gICAgMDogMHgxMDAwMDAw
MC4uMHg4ZmZmZmZmZgo+ID4gPiA+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVnL21lbWJsb2NrL3Jl
c2VydmVkCj4gPiA+ID4gICAgMDogMHgxMDAwNDAwMC4uMHgxMDAwN2ZmZgo+ID4gPiA+ICAgMzQ6
IDB4MmZmZmZmODguLjB4M2ZmZmZmZmYKPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBBZnRlciB0
aGUgcGF0Y2g6Cj4gPiA+ID4gIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvbWVtYmxvY2svbWVtb3J5
Cj4gPiA+ID4gICAgMDogMHgxMDAwMDAwMC4uMHg4ZmZmZmZmZgo+ID4gPiA+ICMgY2F0IC9zeXMv
a2VybmVsL2RlYnVnL21lbWJsb2NrL3Jlc2VydmVkCj4gPiA+ID4gICAgMDogMHgxMDAwNDAwMC4u
MHgxMDAwN2ZmZgo+ID4gPiA+ICAgMzY6IDB4ODAwMDAwMDAuLjB4OGZmZmZmZmYKPiA+ID4gCj4g
PiA+IEknbSBzdGlsbCBub3QgY29udmluY2VkIHRoYXQgdGhlIG1lbWJsb2NrIHJlZmFjdG9yaW5n
IGRpZG4ndCB1bmNvdmVyZWQgYW4KPiA+ID4gaXNzdWUgaW4gZXRuYXZpdiBkcml2ZXIuCj4gPiA+
IAo+ID4gPiBXaHkgbW92aW5nIHRoZSBDTUEgYXJlYSBmcm9tIDB4ODAwMDAwMDAgdG8gMHgzMDAw
MDAwMCBtYWtlcyBpdCBmYWlsPwo+ID4gCj4gPiBJIHRoaW5rIHlvdSBoYXZlIHRoYXQgdGhlIHdy
b25nIHdheSByb3VuZC4KPiAKPiBJJ20gcmVseWluZyBvbiBBZGFtJ3MgcmVwb3J0cyBvZiB3b3Jr
aW5nIGFuZCBub24td29ya2luZyB2ZXJzaW9ucy4KPiBBY2NvcmRpbmcgdG8gdGhhdCBldG5hdml2
IHdvcmtzIHdoZW4gQ01BIGFyZWEgaXMgYXQgMHg4MDAwMDAwMCBhbmQgZG9lcyBub3QKPiB3b3Jr
IHdoZW4gaXQgaXMgYXQgMHgzMDAwMDAwMC4KPiAKPiBIZSBhbHNvIHNlbnQgbG9ncyBhIGZldyBk
YXlzIGFnbyBbMV0sIHRoZXkgYWxzbyBjb25maXJtIHRoYXQuCj4gCj4gWzFdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LW1tL0NBSENON3hKRXZTMlNpPU0rQll0eitrWTBNNE54bXFEamlY
OU53cTZfM0dHQmgzeWc9d0BtYWlsLmdtYWlsLmNvbS8KClNvcnJ5LCB5ZXMsIHlvdSdyZSByaWdo
dC4gIFN0aWxsLCBJJ3ZlIHJlcG9ydGVkIHRoaXMgc2FtZSByZWdyZXNzaW9uCmEgd2hpbGUgYmFj
aywgYW5kIGl0J3MgbmV2ZXIgZ29uZSBhd2F5LgoKPiA+ID4gQlRXLCB0aGUgY29kZSB0aGF0IGNv
bXBsYWluZWQgYWJvdXQgImNvbW1hbmQgYnVmZmVyIG91dHNpZGUgdmFsaWQgbWVtb3J5Cj4gPiA+
IHdpbmRvdyIgaGFzIGJlZW4gcmVtb3ZlZCBieSB0aGUgY29tbWl0IDE3ZTQ2NjBhZTNkNyAoImRy
bS9ldG5hdml2Ogo+ID4gPiBpbXBsZW1lbnQgcGVyLXByb2Nlc3MgYWRkcmVzcyBzcGFjZXMgb24g
TU1VdjIiKS4gCj4gPiA+IAo+ID4gPiBDb3VsZCBiZSB0aGF0IHJlY2VudCBjaGFuZ2VzIHRvIE1N
VSBtYW5hZ2VtZW50IG9mIGV0bmF2aXYgcmVzb2x2ZSB0aGUKPiA+ID4gaXNzdWU/Cj4gPiAKPiA+
IFRoZSBpTVg2IGRvZXMgbm90IGhhdmUgTU1VdjIgaGFyZHdhcmUsIGl0IGhhcyBNTVV2MS4gIFdp
dGggTU1VdjEKPiA+IGhhcmR3YXJlIHJlcXVpcmVzIGNvbW1hbmQgYnVmZmVycyB3aXRoaW4gdGhl
IGZpcnN0IDJHaUIgb2YgcGh5c2ljYWwKPiA+IFJBTS4KPiAKPiBJJ3ZlIG1lbnRpb25lZCB0aGF0
IHBhdGNoIGJlY2F1c2UgaXQgcmVtb3ZlZCB0aGUgY2hlY2sgZm9yIGNtZGJ1ZiBhZGRyZXNzCj4g
Zm9yIE1NVXYxOgo+IAo+IEBAIC03ODUsMTUgKzc2OCw3IEBAIGludCBldG5hdml2X2dwdV9pbml0
KHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBQQUdFX1NJWkUpOwo+ICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICBk
ZXZfZXJyKGdwdS0+ZGV2LCAiY291bGQgbm90IGNyZWF0ZSBjb21tYW5kIGJ1ZmZlclxuIik7Cj4g
LSAgICAgICAgICAgICAgIGdvdG8gdW5tYXBfc3ViYWxsb2M7Cj4gLSAgICAgICB9Cj4gLQo+IC0g
ICAgICAgaWYgKCEoZ3B1LT5pZGVudGl0eS5taW5vcl9mZWF0dXJlczEgJiBjaGlwTWlub3JGZWF0
dXJlczFfTU1VX1ZFUlNJT04pICYmCj4gLSAgICAgICAgICAgZXRuYXZpdl9jbWRidWZfZ2V0X3Zh
KCZncHUtPmJ1ZmZlciwgJmdwdS0+Y21kYnVmX21hcHBpbmcpID4gMHg4MDAwMDAwMCkgewo+IC0g
ICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGdw
dS0+ZGV2LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICJjb21tYW5kIGJ1ZmZlciBvdXRzaWRl
IHZhbGlkIG1lbW9yeSB3aW5kb3dcbiIpOwo+IC0gICAgICAgICAgICAgICBnb3RvIGZyZWVfYnVm
ZmVyOwo+ICsgICAgICAgICAgICAgICBnb3RvIGZhaWw7Cj4gICAgICAgICB9Cj4gIAo+ICAgICAg
ICAgLyogU2V0dXAgZXZlbnQgbWFuYWdlbWVudCAqLwo+IAo+IAo+IEkgcmVhbGx5IGRvbid0IGtu
b3cgaG93IGV0bmF2aXYgd29ya3MsIHNvIEkgaG9wZWQgdGhhdCBwZW9wbGUgd2hvCj4gdW5kZXJz
dGFuZCBpdCB3b3VsZCBoZWxwLgoKRnJvbSB3aGF0IEkgY2FuIHNlZSwgcmVtb3ZpbmcgdGhhdCBj
aGVjayBpcyBhIGNvbXBsZXRlbHkgaW5zYW5lIHRoaW5nCnRvIGRvLCBhbmQgSSBub3RlIHRoYXQg
dGhlc2UgY2hhbmdlcyBhcmUgX25vdF8gZGVzY3JpYmVkIGluIHRoZSBjb21taXQKbWVzc2FnZS4g
IFRoZSBwcm9ibGVtIHdhcyBrbm93biBhYm91dCBfYmVmb3JlXyAoSnVuZSAyMikgdGhlIHBhdGNo
IHdhcwpjcmVhdGVkIChKdWx5IDUpLgoKTHVjYXMsIHBsZWFzZSBjYW4geW91IGV4cGxhaW4gd2h5
IHJlbW92aW5nIHRoZSBhYm92ZSBjaGVjaywgd2hpY2ggaXMKd2VsbCBrbm93biB0byBjb3JyZWN0
bHkgdHJpZ2dlciBvbiB2YXJpb3VzIHBsYXRmb3JtcyB0byBwcmV2ZW50CmluY29ycmVjdCBHUFUg
YmVoYXZpb3VyLCBpcyBzYWZlPwoKVGhhbmtzLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0
cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFu
ZCBmb3IgMC44bWlsZSBsaW5lIGluIHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIy
a2JwcyB1cApBY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBz
IHVwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2
aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
