Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B610BCA071
	for <lists+etnaviv@lfdr.de>; Thu,  3 Oct 2019 16:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE4A6EA01;
	Thu,  3 Oct 2019 14:36:04 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6F56E9C4
 for <etnaviv@lists.freedesktop.org>; Thu,  3 Oct 2019 13:18:03 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1iG0zJ-0006F9-Ty; Thu, 03 Oct 2019 15:17:46 +0200
Message-ID: <662abbc0298ebab59919490ccc3d5c093ae35cf7.camel@pengutronix.de>
Subject: Re: [PATCH v2 00/21] Refine memblock API
From: Lucas Stach <l.stach@pengutronix.de>
To: Mike Rapoport <rppt@linux.ibm.com>, Russell King - ARM Linux admin
 <linux@armlinux.org.uk>
Date: Thu, 03 Oct 2019 15:17:36 +0200
In-Reply-To: <20191003113010.GC23397@linux.ibm.com>
References: <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
 <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
 <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
 <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
 <20191002073605.GA30433@linux.ibm.com>
 <CAHCN7xL1MkJh44N3W_1+08DHmX__SqnfH6dqUzYzr2Wpg0kQyQ@mail.gmail.com>
 <20191003053451.GA23397@linux.ibm.com>
 <20191003084914.GV25745@shell.armlinux.org.uk>
 <20191003113010.GC23397@linux.ibm.com>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 03 Oct 2019 14:36:02 +0000
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

QW0gRG9ubmVyc3RhZywgZGVuIDAzLjEwLjIwMTksIDE0OjMwICswMzAwIHNjaHJpZWIgTWlrZSBS
YXBvcG9ydDoKPiBPbiBUaHUsIE9jdCAwMywgMjAxOSBhdCAwOTo0OToxNEFNICswMTAwLCBSdXNz
ZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4gd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAwMywgMjAx
OSBhdCAwODozNDo1MkFNICswMzAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gPiAodHJpbW1l
ZCB0aGUgQ0MpCj4gPiA+IAo+ID4gPiBPbiBXZWQsIE9jdCAwMiwgMjAxOSBhdCAwNjoxNDoxMUFN
IC0wNTAwLCBBZGFtIEZvcmQgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBPY3QgMiwgMjAxOSBhdCAy
OjM2IEFNIE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPiA+ID4g
Cj4gPiA+ID4gQmVmb3JlIHRoZSBwYXRjaDoKPiA+ID4gPiAKPiA+ID4gPiAjIGNhdCAvc3lzL2tl
cm5lbC9kZWJ1Zy9tZW1ibG9jay9tZW1vcnkKPiA+ID4gPiAgICAwOiAweDEwMDAwMDAwLi4weDhm
ZmZmZmZmCj4gPiA+ID4gIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvbWVtYmxvY2svcmVzZXJ2ZWQK
PiA+ID4gPiAgICAwOiAweDEwMDA0MDAwLi4weDEwMDA3ZmZmCj4gPiA+ID4gICAzNDogMHgyZmZm
ZmY4OC4uMHgzZmZmZmZmZgo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IEFmdGVyIHRoZSBwYXRj
aDoKPiA+ID4gPiAjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1ibG9jay9tZW1vcnkKPiA+ID4g
PiAgICAwOiAweDEwMDAwMDAwLi4weDhmZmZmZmZmCj4gPiA+ID4gIyBjYXQgL3N5cy9rZXJuZWwv
ZGVidWcvbWVtYmxvY2svcmVzZXJ2ZWQKPiA+ID4gPiAgICAwOiAweDEwMDA0MDAwLi4weDEwMDA3
ZmZmCj4gPiA+ID4gICAzNjogMHg4MDAwMDAwMC4uMHg4ZmZmZmZmZgo+ID4gPiAKPiA+ID4gSSdt
IHN0aWxsIG5vdCBjb252aW5jZWQgdGhhdCB0aGUgbWVtYmxvY2sgcmVmYWN0b3JpbmcgZGlkbid0
IHVuY292ZXJlZCBhbgo+ID4gPiBpc3N1ZSBpbiBldG5hdml2IGRyaXZlci4KPiA+ID4gCj4gPiA+
IFdoeSBtb3ZpbmcgdGhlIENNQSBhcmVhIGZyb20gMHg4MDAwMDAwMCB0byAweDMwMDAwMDAwIG1h
a2VzIGl0IGZhaWw/Cj4gPiAKPiA+IEkgdGhpbmsgeW91IGhhdmUgdGhhdCB0aGUgd3Jvbmcgd2F5
IHJvdW5kLgo+IAo+IEknbSByZWx5aW5nIG9uIEFkYW0ncyByZXBvcnRzIG9mIHdvcmtpbmcgYW5k
IG5vbi13b3JraW5nIHZlcnNpb25zLgo+IEFjY29yZGluZyB0byB0aGF0IGV0bmF2aXYgd29ya3Mg
d2hlbiBDTUEgYXJlYSBpcyBhdCAweDgwMDAwMDAwIGFuZCBkb2VzIG5vdAo+IHdvcmsgd2hlbiBp
dCBpcyBhdCAweDMwMDAwMDAwLgo+IAo+IEhlIGFsc28gc2VudCBsb2dzIGEgZmV3IGRheXMgYWdv
IFsxXSwgdGhleSBhbHNvIGNvbmZpcm0gdGhhdC4KPiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbW0vQ0FIQ043eEpFdlMyU2k9TStCWXR6K2tZME00TnhtcURqaVg5TndxNl8z
R0dCaDN5Zz13QG1haWwuZ21haWwuY29tLwoKVG8gY2xhcmlmeTogRXRuYXZpdiBuZWVkcyB0byBr
bm93IHdoZXJlIHRoZSBDTUEgYXJlYSBpcyBpbiBvcmRlciB0bwptb3ZlIGEgYXBlcnR1cmUgd2lu
ZG93IHRvIGNvdmVyIHRoZSBDTUEgYXJlYSBzbyB0aGUgY29tbWFuZCBidWZmZXJzCmFsbG9jYXRl
ZCBpbiBjb250aWcgbWVtb3J5IGNhbiBiZSBtYXBwZWQgdGhyb3VnaCB0aGlzIGFwZXJ0dXJlLiBO
b3cgdGhlCmlzc3VlIGlzIHRoYXQgdGhlcmUgaXMgY3VycmVudGx5IHRoZXJlIGlzIG5vIGdvb2Qg
QVBJIGZvciBhIGRyaXZlciB0bwprbm93IHdoZXJlIHRoZSBDTUEgYXJlYSBpcyBsb2NhdGVkLCBz
byB3ZSBhcmUgdHJ5aW5nIHRvIGluZmVyIHRoaXMgZnJvbQpkbWFfZ2V0X3JlcXVpcmVkX21hc2su
IFVuZm9ydHVuYXRlbHkgdGhpcyBjYW4gb3ZlcnNob290IHRoZSByZWFsIERSQU0KYXJlYSBieSBh
IGJpdCwgc28gY29tYmluZWQgd2l0aCB0aGUgZml4ZWQgMkdCIHNpemUgb2YgdGhlIEdQVSBhcGVy
dHVyZQp0aGlzIG1lYW5zIHdlIGFyZSBubyBsb25nZXIgYWJsZSB0byBtYXAgdGhlIGNvbW1hbmQg
YnVmZmVycyB0aHJvdWdoIHRoZQpyZXF1aXJlZCBhcGVydHVyZSBpZiB0aGUgQ01BIGFyZWEgbW92
ZXMgdG9vIGZhciBkb3duIGluIHRoZSBwaHlzaWNhbAptZW1vcnkuCgpJdCdzIHJlYWxseSBhIGJh
ZCBpbnRlcmFjdGlvbiBiZXR3ZWVuIGV0bmF2aXYgYW5kIENNQSBhcmVhIHBsYWNlbWVudCwKZHVl
IHRvIGluc3VmZmljaWVudCBBUElzIHRvIGNvbW11bmljYXRlIHNvbWUgY3J1Y2lhbCBpbmZvcm1h
dGlvbi4gVGhlcmUKaXMgbm90aGluZyBpbiB0aGUgZXRuYXZpdiBkcml2ZXIgb3IgdGhlIGhhcmR3
YXJlIHdoaWNoIHJlcXVpcmVzIHRoZSBDTUEKYXJlYSB0byBiZSBhdCBhIGNlcnRhaW4gcGxhY2Us
IHdlIGp1c3QgbmVlZCB0byBrbm93IHdoZXJlIGl0IGlzIGxvY2F0ZWQKZXhhY3RseS4gU28gbXkg
dHJ5IGF0IGZpeGluZyB0aGlzIFsxXSB3YXMgYnkgYWRkaW5nIGEgQVBJIHRvIGdldCB0aGUKcmVx
dWlyZWQgaW5mb3JtYXRpb24sIGJ1dCB0aGUgZmlyc3QgYXR0ZW1wdCB3YXMgc2hvdCBkb3duIGFu
ZCBJIGhhZG4ndApoYWQgdGltZSB0byBmb2xsb3cgdXAgb24gdGhpcyB5ZXQuCgpSZWdhcmRzLApM
dWNhcwoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA5NjY3NjcvCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBt
YWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
