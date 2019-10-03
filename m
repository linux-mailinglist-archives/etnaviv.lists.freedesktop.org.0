Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00683C9A9A
	for <lists+etnaviv@lfdr.de>; Thu,  3 Oct 2019 11:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AE76E980;
	Thu,  3 Oct 2019 09:18:09 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 560 seconds by postgrey-1.36 at gabe;
 Thu, 03 Oct 2019 08:58:56 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAD16E116
 for <etnaviv@lists.freedesktop.org>; Thu,  3 Oct 2019 08:58:56 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:47020)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iFwnY-0005L4-41; Thu, 03 Oct 2019 09:49:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iFwnS-0001bt-8g; Thu, 03 Oct 2019 09:49:14 +0100
Date: Thu, 3 Oct 2019 09:49:14 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
Message-ID: <20191003084914.GV25745@shell.armlinux.org.uk>
References: <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
 <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
 <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
 <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
 <20191002073605.GA30433@linux.ibm.com>
 <CAHCN7xL1MkJh44N3W_1+08DHmX__SqnfH6dqUzYzr2Wpg0kQyQ@mail.gmail.com>
 <20191003053451.GA23397@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003053451.GA23397@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 03 Oct 2019 09:18:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q5TExg+4TQhLrghJSY1icmd2xGrFxJ2aG5hPkzrxoDo=; b=O0iZExLAO4uc+e/CglOD7o1sG
 XdeWeGADcm11wnkviHeLVMjXiFkSMEWsnB1aRuOrg9pdfhW8cxOvVxNDAdjCd5pzB1Y/YnaV0t8gt
 c3d7A++vtECK+gMCtq/WDZ4Jf4kZ5R1nHi+5NSiRPmW6qfzg/qgM1TyywcHJn69oFbwOowhMGxOw6
 ZDq+Bifokb3wN/D2qf+bWxeB7djWt+ji4fUoBA6EIZGgvundyQudFgIZOZ4wm14wWBDRbZMBie4L2
 GrZZhAnjCg/zZPwp6zKGNlvY6rlgE8P7qYeZITFAKoitL+TigifTruIavCHkhzJPLypp60ntvNzBc
 6PbFqSvIw==;
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

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDg6MzQ6NTJBTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiAodHJpbW1lZCB0aGUgQ0MpCj4gCj4gT24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDY6
MTQ6MTFBTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMiwgMjAxOSBh
dCAyOjM2IEFNIE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPiA+
Cj4gPiAKPiA+IEJlZm9yZSB0aGUgcGF0Y2g6Cj4gPiAKPiA+ICMgY2F0IC9zeXMva2VybmVsL2Rl
YnVnL21lbWJsb2NrL21lbW9yeQo+ID4gICAgMDogMHgxMDAwMDAwMC4uMHg4ZmZmZmZmZgo+ID4g
IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvbWVtYmxvY2svcmVzZXJ2ZWQKPiA+ICAgIDA6IDB4MTAw
MDQwMDAuLjB4MTAwMDdmZmYKPiA+ICAgMzQ6IDB4MmZmZmZmODguLjB4M2ZmZmZmZmYKPiA+IAo+
ID4gCj4gPiBBZnRlciB0aGUgcGF0Y2g6Cj4gPiAjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1i
bG9jay9tZW1vcnkKPiA+ICAgIDA6IDB4MTAwMDAwMDAuLjB4OGZmZmZmZmYKPiA+ICMgY2F0IC9z
eXMva2VybmVsL2RlYnVnL21lbWJsb2NrL3Jlc2VydmVkCj4gPiAgICAwOiAweDEwMDA0MDAwLi4w
eDEwMDA3ZmZmCj4gPiAgIDM2OiAweDgwMDAwMDAwLi4weDhmZmZmZmZmCj4gCj4gSSdtIHN0aWxs
IG5vdCBjb252aW5jZWQgdGhhdCB0aGUgbWVtYmxvY2sgcmVmYWN0b3JpbmcgZGlkbid0IHVuY292
ZXJlZCBhbgo+IGlzc3VlIGluIGV0bmF2aXYgZHJpdmVyLgo+IAo+IFdoeSBtb3ZpbmcgdGhlIENN
QSBhcmVhIGZyb20gMHg4MDAwMDAwMCB0byAweDMwMDAwMDAwIG1ha2VzIGl0IGZhaWw/CgpJIHRo
aW5rIHlvdSBoYXZlIHRoYXQgdGhlIHdyb25nIHdheSByb3VuZC4KCj4gQlRXLCB0aGUgY29kZSB0
aGF0IGNvbXBsYWluZWQgYWJvdXQgImNvbW1hbmQgYnVmZmVyIG91dHNpZGUgdmFsaWQgbWVtb3J5
Cj4gd2luZG93IiBoYXMgYmVlbiByZW1vdmVkIGJ5IHRoZSBjb21taXQgMTdlNDY2MGFlM2Q3ICgi
ZHJtL2V0bmF2aXY6Cj4gaW1wbGVtZW50IHBlci1wcm9jZXNzIGFkZHJlc3Mgc3BhY2VzIG9uIE1N
VXYyIikuIAo+IAo+IENvdWxkIGJlIHRoYXQgcmVjZW50IGNoYW5nZXMgdG8gTU1VIG1hbmFnZW1l
bnQgb2YgZXRuYXZpdiByZXNvbHZlIHRoZQo+IGlzc3VlPwoKVGhlIGlNWDYgZG9lcyBub3QgaGF2
ZSBNTVV2MiBoYXJkd2FyZSwgaXQgaGFzIE1NVXYxLiAgV2l0aCBNTVV2MQpoYXJkd2FyZSByZXF1
aXJlcyBjb21tYW5kIGJ1ZmZlcnMgd2l0aGluIHRoZSBmaXJzdCAyR2lCIG9mIHBoeXNpY2FsClJB
TS4KCkkndmUgcmVwb3J0ZWQgdGhlIHByb2JsZW0gcHJldmlvdXNseSBidXQgdGhlcmUgd2FzIG5v
IHJlc29sdXRpb24sCm90aGVyIHRoYW4gcG9pbnRpbmcgdGhlIGJsYW1lIGF0IENNQS4KCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bmUvdGhy
ZWFkLmh0bWwjMjIzNTE2CgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1s
aW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxl
IGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIuMU1icHMgZG93biA2MjJrYnBzIHVwCkFjY29y
ZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJwcyBkb3duIDUwMGticHMgdXAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxp
c3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
