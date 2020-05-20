Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD64F1DB799
	for <lists+etnaviv@lfdr.de>; Wed, 20 May 2020 17:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BCB6E860;
	Wed, 20 May 2020 15:00:32 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3C46E860
 for <etnaviv@lists.freedesktop.org>; Wed, 20 May 2020 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kh884d4MFcKuORRz816KMV8dO7B8Es83ozqJwyPkb8c=; b=W/GiWN27p9dRMGWMr8W20V/nw
 kR/6qr096WJ6EgZOnD2TzcxyjCmfJswhTMwzqvxNTfWpUOo4+pguoI6QNQLtQA4xzAT1rOecK1Dwh
 de7t4z9cv5okphkvafq5qIZQEnFgZGrSBp13ruqO8yGWpN9cT5OW/eRQmnCDIH/LrBhtI2u4QpcLa
 WQiZxmoR/Qzs1j06UKRTshY9HOm1KBLZTHp23bY9JLQyfyaLlTs0O/kwd/wY2eNc0CyoRagytgXQA
 KHiculwJgpPzi5aq1e5FyhkQ3qEl72igrqVWSSfy0ckRHRDE5cuws/m10kUUfB8dNFbi6znfen29W
 8MjPLOXwg==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:42714)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1jbQCl-00004q-G9; Wed, 20 May 2020 16:00:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1jbQCi-0007Rg-2e; Wed, 20 May 2020 16:00:20 +0100
Date: Wed, 20 May 2020 16:00:20 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/etnaviv: Don't ignore errors on getting clocks
Message-ID: <20200520150019.GN1551@shell.armlinux.org.uk>
References: <20200513150007.1315395-1-lkundrak@v3.sk>
 <20200513150007.1315395-3-lkundrak@v3.sk>
 <CAOMZO5B582=tZ_YBCyVYFtGh=z5hZKFxP7XoUHEmH3jZsk2uYQ@mail.gmail.com>
 <CAOMZO5BdiXCVXs+8jP7PoRvgKd1sxCu4KhjvJBvL=Qig2WOs4g@mail.gmail.com>
 <1e15be39906034a95b86c026e060ed9866586d94.camel@pengutronix.de>
 <20200514082755.GN1551@shell.armlinux.org.uk>
 <ab384507b90474b0030d8ce64fdcfe868b52c3cb.camel@pengutronix.de>
 <20200514085307.GO1551@shell.armlinux.org.uk>
 <20200520133824.GK1695525@furthur.local>
 <ebcfc9843b57c5611b2106a3fe3553efb48734f0.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebcfc9843b57c5611b2106a3fe3553efb48734f0.camel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjAsIDIwMjAgYXQgMDQ6MDQ6MzlQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gQW0gTWl0dHdvY2gsIGRlbiAyMC4wNS4yMDIwLCAxNTozOCArMDIwMCBzY2hyaWViIEx1
Ym9taXIgUmludGVsOgo+ID4gWWVzLiBUaGlzIG1lYW5zIHRoYXQgaW4gZmFjdCAiY29yZSIgaXMg
dGhlIG9ubHkgcmVxdWlyZWQgY2xvY2sgZm9yIGFsbAo+ID4gaW1wbGVtZW50YXRpb25zIG9mIHZp
dmFudGUsZ2MgYW5kIHRoZSBjb21tb24gYmluZGluZyBuZWVkcyB0byBiZSB1cGRhdGVkCj4gPiB0
byByZWZsZWN0IHRoYXQuIEknbGwgZm9sbG93IHdpdGggYSBwYXRjaCB0aGF0IGRvZXMgdGhhdCwg
dW5sZXNzIHRoZXJlCj4gPiBhcmUgc3Ryb25nIG9iamVjdGlvbnMuCj4gPiAKPiA+IElmIHRoZXJl
IGFyZSBpbXBsZW1lbnRhdGlvbnMgdGhhdCByZXF1aXJlIGRpZmZlcmVudCBjbG9jayBpbnB1dHMs
IHRoZW4gdGhleQo+ID4gbmVlZCB0byB1c2UgYWRkaXRpb25hbCBjb21wYXRpYmxlIHN0cmluZyBm
b3IgdGhlIHBhcnRpY3VsYXIgZmxhdm9yIGFuZCB0aGUKPiA+IGJpbmRpbmcgc2hvdWxkIGhhdmUg
Y29uZGl0aW9uYWxzIGZvciB0aGVtLiBTb21ldGhpbmcgbGlrZSB0aGlzOgo+ID4gCj4gPiAgIGlm
Ogo+ID4gICAgIHByb3BlcnRpZXM6Cj4gPiAgICAgICBjb21wYXRpYmxlOgo+ID4gICAgICAgICBj
b250YWluczoKPiA+ICAgICAgICAgICBjb25zdDogZnNsLGlteDZzeC1ncHUKPiA+ICAgdGhlbjoK
PiA+ICAgICBwcm9wZXJ0aWVzOgo+ID4gICAgICAgY2xvY2tzOgo+ID4gICAgICAgICBtaW5JdGVt
czogNAo+IAo+IFRoZSBEVCBiaW5kaW5nIG9mIGEgZGV2aWNlIHNob3VsZCBkZXNjcmliZSB0aGUg
aGFyZHdhcmUgb2YgdGhlIGRldmljZSwKPiBub3QgdGhlIHNwZWNpZmljIGludGVncmF0aW9uIGlu
dG8gYSBTb0MuIE5vdyBpdCdzIGEgYml0IGhhcmQgdG8gbWFrZQo+IGFueSBkZWZpbml0ZSBzdGF0
ZW1lbnRzIGFib3V0IHRoZSBWaXZhbnRlIEdDIEdQVSBtb2R1bGUgaXRzZWxmLCBhcyBtb3N0Cj4g
b2YgdGhlIGluZm9ybWF0aW9uIHdlIGhhdmUgaXMgZnJvbSByZXZlcnNlIGVuZ2luZWVyaW5nLiBJ
dCdzIHByZXR0eQo+IGNsZWFyIHRob3VnaCB0aGF0IHRoZSBHUFUgbW9kdWxlIGhhcyBhdCBsZWFz
dCAyIGNsb2NrIGlucHV0czogYXhpIGFuZAo+IGNvcmUsIGFzIHRoZXJlIGlzIGEgZmVhdHVyZSBi
aXQgdGhhdCB0ZWxscyB1cyBpZiBpdCdzIG9rYXkgdG8gZ2F0ZSB0aGUKPiBheGkgY2xvY2sgaW5k
ZXBlbmRlbnRseSBmcm9tIGNvcmUuIAo+IAo+IEknbSBub3QgMTAwJSBzdXJlIGFib3V0IHRoZSBv
bGRlciBjb3JlcyBhcyBmb3VuZCBpbiBEb3ZlLCBidXQgYWxsIHRoZQo+IG1vcmUgcmVjZW50IGNv
cmVzIGFsbG93IHRvIGNsb2NrIHRoZSBzaGFkZXIgcGFydGl0aW9uIGluZGVwZW5kZW50bHkgb2YK
PiB0aGUgY29yZSBwYXJ0aXRpb24sIHNvIHRoYXQncyBhbm90aGVyIGNsb2NrIGlucHV0Lgo+IAo+
IE5vdyB3aGVuIGl0IGNvbWVzIHRvIGEgU29DIGludGVncmF0aW9uLCBpdCdzIHRvdGFsbHkgZmlu
ZSB0byBoYXZlIGFsbAo+IHRob3NlIEdQVSBtb2R1bGUgY2xvY2sgaW5wdXRzIGZlZCBmcm9tIHRo
ZSBzYW1lIGNsb2NrIHNvdXJjZSBhbmQgYmVoaW5kCj4gYSBzaGFyZWQgZ2F0ZSBtYXliZS4gQnV0
IHRoYXQgZG9lc24ndCBjaGFuZ2UgdGhlIGNsb2NrIGlucHV0cyBmcm9tIHRoZQo+IGRldmljZSBw
ZXJzcGVjdGl2ZSwgaXQncyBzdGlsbCAzIGluZGVwZW5kZW50IGNsb2NrIGlucHV0cywgd2hpY2gg
dGhlbgo+IGp1c3QgcG9pbnQgdG8gdGhlIHNhbWUgY2xvY2sgc291cmNlIGluIHRoZSBEVC4KPiAK
PiBpbXg2c3guZHRzaSBpcyBldmVuIGEgcHJlY2VkZW50IG9mIHN1Y2ggYSBzZXR1cDogYWxsIG1v
ZHVsZSBjbG9jawo+IGlucHV0cyBhcmUgZmVkIGJ5IGEgY29tbW9uIGNsb2NrIGFuZCBzaGFyZSBh
IHNpbmdsZSBnYXRlLgoKSXQncyB2ZXJ5IGdvb2QgdG8gc3RhbmQgb24gYSBwZWRpc3RhbCwgYW5k
IHRyeSB0byBkaWN0YXRlIHdoYXQgeW91CndhbnQsIGJ1dCB3aGF0IHlvdSB3YW50IGlzIG5vdCBh
bHdheXMgcG9zc2libGUsIGFuZCB0aGF0IGlzIHRoZSBjYXNlCmhlcmUuICBZb3UgaGF2ZSBtYWRl
IHlvdXIgaWRlYSBvZiBob3cgeW91IHNlZSB0aGUgaGFyZHdhcmUgcXVpdGUKcGxhaW4uCgpHZXR0
aW5nIGJhY2sgdG8gcmVhbGl0eSwgYWdhaW4sIHdoYXQgd2Uga25vdyBpcyB0aGF0IHRoZXJlIGlz
IG9uZQpjbG9jayBmb3IgdGhlIEdDNjAwIG9uIERvdmUsIHNpbmNlIGFyZSByZWdpc3RlciBzZXR0
aW5ncyB0byBjb250cm9sCnRoYXQgY2xvY2suCgpXaGF0IHdlIGFsc28ga25vdyBpcyB0aGF0IHRo
ZXJlIGlzIGFuIEFIQiBjbG9jaywgYnV0IGhvdyB0aGF0IHJlbGF0ZXMKdG8gdGhlIHJlc3Qgb2Yg
dGhlIHN5c3RlbSwgd2UgaGF2ZSBubyBkb2N1bWVudGF0aW9uLiAgSXQgaXMgdGhhdCBpcwp1c2Vk
IGZvciB0aGUgQUhCIGJ1cywgd2hpY2ggaW5jaWRlbnRhbGx5IGluY2x1ZGVzIHRoZSBHQzYwMCBm
b3IgYWNjZXNzCnRvIGl0cyByZWdpc3RlciBzZXQuIEkgZG9uJ3QgcmVtZW1iZXIgd2hldGhlciBB
SEIgcGVyaXBoZXJhbHMgcmVxdWlyZQp0aGUgY2xvY2sgb3Igbm90LCB0aGF0IGlzIHNvbWV0aGlu
ZyB0aGF0IHdvdWxkIG5lZWQgdG8gYmUgY2hlY2tlZC4KSWYgdGhleSBkbywgdGhlbiBpdCBzZWVt
cyB0aGF0IGNsb2NrIGlzIG1pc3NpbmcgZnJvbSB0aGUgYmluZGluZy4KClRoZW4gdGhlcmUncyBh
IGRlc2NyaXB0aW9uIG9mIHRoZSBBWEkgaW50ZXJmYWNlIHRvIHRoZSBHQzYwMCB3aGljaAptZW50
aW9ucyBubyBjbG9jayAoc2VlIDEwLjcuMiBiZWxvdykuICBJdCBoYXMgYSBjbG9jaywgYnV0IHdo
YXQgdGhhdApjbG9jayBpcywgYW5kIGhvdyBpdCByZWxhdGVzIHRvIHRoZSByZXN0IG9mIHRoZSBz
eXN0ZW0gaXMgbm90IGNsZWFybHkKc3BlY2lmaWVkLgoKU28sIGFnYWluLCB3aGF0IHlvdSdyZSBi
YXNpY2FsbHkgYXNraW5nIGZvciBpcyBmb3Igc29tZW9uZSB0byBndWVzcwphbmQgdGhyb3cgc29t
ZSBmaWN0aWNpb3VzIG1vZGVsIGludG8gRFQuCgpObywgaWYgaXQncyBub3Qga25vd24sIHRoZW4g
d2Ugc2hvdWxkIG5vdCBiZSBndWVzc2luZyBhbmQgdGhyb3dpbmcKcmFuZG9tIGdhcmJhZ2UgaW50
byBhIFNvQyBEVCBkZXNjcmlwdGlvbiAtIG9uY2UgaXQncyBpbiB0aGUgRFQKZGVzY3JpcHRpb24s
IGl0IGhhcyB0byBiZSBzdXBwb3J0ZWQgZ29pbmcgZm9yd2FyZCwgYW5kIGlmIGl0J3MgbGF0ZXIK
Zm91bmQgdG8gYmUgaW5jb3JyZWN0LCB0aGVuIHdlIGhhdmUgYSBwcm9ibGVtLgoKU28sIEkgZG9u
J3Qgc2VlIGhvdyBEb3ZlIGNhbiBtZWV0IHlvdXIgcmVxdWlyZW1lbnRzLCBhbmQgSSB0aGluayB5
b3UKaGF2ZSB0byBjb21wcm9taXNlIG9uIHRoaXMsIGFuZCBqdXN0IGFjY2VwdCB0aGF0IERvdmUg
b25seSBoYXMgb25lCmtub3duIGNsb2NrLgoKSWYgeW91IHdhbnQgdG8gY29udGludWUgYmVpbmcg
cGVkYW50aWMgYWJvdXQgdGhpcywgdGhlbiBpbiBvcmRlciB0bwpzdXBwb3J0IHRoYXQgcGVkYW50
eSwgd2UgbmVlZCB0byBhZGQgYW4gQUhCIGNsb2NrIHRvIGFsbCBWaXZhbnRlIEdDCmRlc2NyaXB0
aW9ucyBhcyB3ZWxsIHNpbmNlIHRoZSBBSEIgaW50ZXJmYWNlIHJlcXVpcmVzIGl0IC0gdGhlcmUg
aXQKaXMgY2FsbGVkIEhDTEsgaW4gdGhlIEFIQiBzcGVjcy4gIEhlcmUgaXMgdGhlIGV4dHJhY3Qg
ZnJvbSB0aGUgRG92ZQpkb2N1bWVudGF0aW9uIGZvciB0aGUgQUhCIGludGVyZmFjZToKCjEwLjcu
MSAgICAgICAgICAgICAgQUhCIEludGVyZmFjZQogICAgICAgICAgICAgICAgICAgIFRoZSBtYWlu
IGZlYXR1cmVzIG9mIHRoZSBBSEIgaW50ZXJmYWNlIGFyZToKICAgICAgICAgICAgICAgICAgICBu
ICAgIDI1NmsgYWRkcmVzc2FibGUgcmVnaXN0ZXIgc3BhY2UKICAgICAgICAgICAgICAgICAgICBu
ICAgIDMyLWJpdCBhY2Nlc3NlcyBvbmx5IChubyBidXJzdHMpCiAgICAgICAgICAgICAgICAgICAg
biAgICAzMi1iaXQgZGF0YSBidXMKICAgICAgICAgICAgICAgICAgICBuICAgIEVycm9yIHJlc3Bv
bnNlIGZvciBpbGxlZ2FsIGFjY2Vzc2VzCiAgICAgICAgICAgICAgICAgICAgbiAgICBBc3luY2hy
b25vdXMgaW50ZXJmYWNlIHRvIHRoZSBHcmFwaGljcyBDb3JlCiAgICAgICAgICAgICAgICAgICAg
biAgICBJbnRlcnJ1cHQgc3VwcG9ydAogICAgICAgICAgICAgICAgICAgIFRoZSBpbnRlcmZhY2Ug
dXNlcyBhIHNlcGFyYXRlIGNsb2NrIHRoYXQgaXMgc2xvd2VyCiAgICAgICAgICAgICAgICAgICAg
dGhhbiB0aGUgQVhJIEJ1cyBjbG9jaywgdGh1cyBhbGxvd2luZyBhIG1vcmUKICAgICAgICAgICAg
ICAgICAgICByZWxheGVkIGxvZ2ljIGRlc2lnbi4gQmVjYXVzZSB0aGUgQ29yZSBjbG9jayBpcwog
ICAgICAgICAgICAgICAgICAgIGRpZmZlcmVudCBmcm9tIHRoZSBpbnRlcmZhY2UgY2xvY2ssIGRl
c2lnbiB3aXRoaW4KICAgICAgICAgICAgICAgICAgICB0aGUgR1BVIENvcmUgZW5zdXJlcyB0aGF0
IGluY29taW5nIGFuZCBvdXRnb2luZwogICAgICAgICAgICAgICAgICAgIGRhdGEgYXJlIGhhbmRs
ZWQgcHJvcGVybHkgd2hlbiB0aGV5IGNyb3NzIGNsb2NrCiAgICAgICAgICAgICAgICAgICAgYm91
bmRhcmllcy4KICAgICAgICAgICAgICAgICAgICBUaGUgR1BVIGJsb2NrIG9jY3VwaWVzIDI1NiBL
QiAoNjRrIDMyLWJpdCB3b3Jkcykgb2YKICAgICAgICAgICAgICAgICAgICB0aGUgc3lzdGVtIGFk
ZHJlc3Mgc3BhY2UuIEFuIEFIQiBFUlJPUiByZXNwb25zZSBpcwogICAgICAgICAgICAgICAgICAg
IHJldHVybmVkIGlmIGFuIGlsbGVnYWwgYWNjZXNzIGlzIGRldGVjdGVkLiBPbmx5CiAgICAgICAg
ICAgICAgICAgICAgMzItYml0IHJlYWRzIGFuZCB3cml0ZXMgYXJlIHBlcm1pdHRlZC4KCjEwLjcu
MiAgICAgICAgICAgICAgQVhJIEludGVyZmFjZQogICAgICAgICAgICAgICAgICAgIFRoZSBtYWlu
IGZlYXR1cmVzIG9mIHRoZSBBWEkgaW50ZXJmYWNlIGFyZToKICAgICAgICAgICAgICAgICAgICBu
ICAgIDY0LWJpdCBpbmRlcGVuZGVudCByZWFkIGFuZCB3cml0ZSBkYXRhIGJ1c2VzCiAgICAgICAg
ICAgICAgICAgICAgbiAgICBNdWx0aXBsZSBCdXJzdCBsZW5ndGggKDggYnl0ZXMsIDE2IGJ5dGVz
LAogICAgICAgICAgICAgICAgICAgICAgICAgMzIgYnl0ZXMsIG9yIDY0IGJ5dGVzKQogICAgICAg
ICAgICAgICAgICAgIG4gICAgSGlnaC1wZXJmb3JtYW5jZSBvdXQtb2Ytb3JkZXIgLyAxNiBtdWx0
aXBsZQogICAgICAgICAgICAgICAgICAgICAgICAgb3V0c3RhbmRpbmcgYWNjZXNzZXMKICAgICAg
ICAgICAgICAgICAgICBuICAgIFN1cHBvcnRzIG91dC1vZi1vcmRlciByZXR1cm4gZGF0YSBmb3IK
ICAgICAgICAgICAgICAgICAgICAgICAgIGRpZmZlcmVudCBjbGllbnRzCiAgICAgICAgICAgICAg
ICAgICAgbiAgICBBc3luY2hyb25vdXMgaW50ZXJmYWNlIHRvIHRoZSBncmFwaGljcyBjb3JlCiAg
ICAgICAgICAgICAgICAgICAgVGhlIEFYSSBJbnRlcmZhY2UgaW5jbHVkZWQgaW4gdGhlIGdyYXBo
aWNzIEdQVSBpcwogICAgICAgICAgICAgICAgICAgIHVzZWQgdG8gcmV0cmlldmUgZGF0YSBmcm9t
IHRoZSBtZW1vcnkgYXR0YWNoZWQgdG8KICAgICAgICAgICAgICAgICAgICB0aGUgQVhJIEludGVy
Y29ubmVjdC4KICAgICAgICAgICAgICAgICAgICBUaGUgcG9zc2libGUgZ3JhcGhpY3MgY2xpZW50
cyB1c2luZyB0aGUgQVhJIHRvIGZldGNoCiAgICAgICAgICAgICAgICAgICAgZGF0YSBhcmU6CiAg
ICAgICAgICAgICAgICAgICAgbiAgIERNQSAodG8gZmV0Y2ggY29tbWFuZHMsIHN0YXRlcywgaW5k
ZXggYW5kCiAgICAgICAgICAgICAgICAgICAgICAgIHZlcnRleCBkYXRhKQogICAgICAgICAgICAg
ICAgICAgIG4gICBSYXN0ZXJpemVyCiAgICAgICAgICAgICAgICAgICAgbiAgIFRleHR1cmUgZW5n
aW5lIChmb3IgcmVhZGluZyBvZiB0ZXh0dXJlIGRhdGEpCiAgICAgICAgICAgICAgICAgICAgbiAg
IFBpeGVsIGVuZ2luZSAoZm9yIHJlYWRpbmcgYW5kIHdyaXRpbmcgb2YgWiBhbmQKICAgICAgICAg
ICAgICAgICAgICAgICAgY29sb3IgYnVmZmVyKQoKTm93LCBhcyBmYXIgYXMgY2xvY2tpbmcgZ29l
czoKCjQuMyAgICAgICAgICAgICAgICAgICBDbG9ja2luZwo0LjMuMSAgICAgICAgICAgICAgICAg
Q2xvY2sgRG9tYWlucwogICAgICAgICAgICAgICAgICAgICAgVGhlIDg4QVA1MTAgaGFzIG9uZSBQ
TEwgZm9yIHRoZSBDUFUgYW5kIEREUiBNZW1vcnkKICAgICAgICAgICAgICAgICAgICAgIENvbnRy
b2xsZXIsIGFuZCBhIENvcmUgUExMIHRoYXQgZ2VuZXJhdGVzIHRoZSBBWEksCiAgICAgICAgICAg
ICAgICAgICAgICBNYnVzLCBhbmQgaW50ZXJuYWwgY2xvY2tzLgogICAgICAgICAgICAgICAgICAg
ICAgVGhlIENQVSBhbmQgRERSIE1lbW9yeSBDb250cm9sbGVyIG9wZXJhdGUKICAgICAgICAgICAg
ICAgICAgICAgIHN5bmNocm9ub3VzbHkgYXQgYSByYXRpbyBvZiBOOjEgKE49MS4uMTApLCA1OjIg
b3IgNzoyLgogICAgICAgICAgICAgICAgICAgICAgVGhlIEdQVSwgVk1ldGHilqAsIGFuZCBEaXNw
bGF5IGNvbnRyb2xsZXIgb3BlcmF0ZSBpbgogICAgICAgICAgICAgICAgICAgICAgdGhlIEFYSSBi
dXMgY2xvY2sgZG9tYWluLCB3aGljaCBpcyBhc3luY2hyb25vdXMgdG8KICAgICAgICAgICAgICAg
ICAgICAgIHRoZSBDUFUgY2xvY2sgZG9tYWluLiBUaGUgc3luY2hyb25pemF0aW9uIGJldHdlZW4K
ICAgICAgICAgICAgICAgICAgICAgIHRoZSBBWEkgYW5kIENQVSBjbG9jayBkb21haW5zIGlzIGlt
cGxlbWVudGVkIGJ5IHRoZQogICAgICAgICAgICAgICAgICAgICAgTWVtb3J5IENvbnRyb2xsZXIg
QnJpZGdlIChNQ0IpLiBUaGUgTWJ1cyBpcyBjbG9ja2VkCiAgICAgICAgICAgICAgICAgICAgICBh
dCBUY2xrLCB3aGljaCBpcyBhc3luY2hyb25vdXMgdG8gdGhlIEFYSSBjbG9jawogICAgICAgICAg
ICAgICAgICAgICAgZG9tYWluLiBTeW5jaHJvbml6YXRpb24gYmV0d2VlbiB0aGUgTWJ1cyBhbmQg
dGhlIEFYSQogICAgICAgICAgICAgICAgICAgICAgY2xvY2sgZG9tYWlucyBpcyBhY2NvbXBsaXNo
ZWQgYnkgdGhlIFVwc3RyZWFtIGJyaWRnZQogICAgICAgICAgICAgICAgICAgICAgYW5kIHRoZSBE
b3duc3RyZWFtIGJyaWRnZS4KNC4zLjIgICAgICAgICAgICAgICAgIENvcmUgUExMIENsb2NrIFRy
ZWUKICAgICAgICAgICAgICAgICAgICAgIFRoZSBHUFUsIFZNZXRh4pagLCBhbmQgRGlzcGxheSBD
b250cm9sbGVyIGRlcml2ZSB0aGUKICAgICAgICAgICAgICAgICAgICAgIG9wZXJhdGluZyBjbG9j
ayBmcm9tIHRoZSBDb3JlIFBMTCB0aHJvdWdoIHRoZQogICAgICAgICAgICAgICAgICAgICAgZGVk
aWNhdGVkIFBMTCBjbG9jayBkaXZpZGVycywgYW5kIGFyZSBhc3luY2hyb25vdXMKICAgICAgICAg
ICAgICAgICAgICAgIHRvIHRoZSBBWEkgaW50ZXJjb25uZWN0IGJ1cyBjbG9jay4gVGhlIGNsb2Nr
CiAgICAgICAgICAgICAgICAgICAgICB0cmVlIGlzIGRlcGljdGVkIGluIEZpZ3VyZSA1LgoKICAg
ICAgICAgICAgICAgICAgICAgIEZpZ3VyZSA0OiBBWEkgVW5pdHMgQ2xvY2sgVHJlZQoKICAgICAg
ICAgICAgICAgICAgICAgIDxkaWFncmFtIG9mIENvcmUtUExMIGZlZWRpbmcgdGhlIGRpc3BsYXkg
Y29udHJvbGxlciwKICAgICAgICAgICAgICAgICAgICAgICBWTWV0YSBhbmQgR1BVIGNsb2Nrcywg
dGhyb3VnaCBkaXZpZGVycywgd2hpY2ggYXJlCiAgICAgICAgICAgICAgICAgICAgICAgbm90IHRo
ZSBBWEkgY2xvY2sgYnV0IHRoZSBmdW5jdGlvbmFsIGNsb2NrcyBmb3IgdGhlc2UKICAgICAgICAg
ICAgICAgICAgICAgICBwZXJpcGhlcmFscy4gTm8gbWVudGlvbiBvZiBob3cgdGhlIEFYSSBjbG9j
ayBpcwogICAgICAgICAgICAgICAgICAgICAgIGRlcml2ZWQuPgoKRmlndXJlIDUgaXMgc29tZXRo
aW5nIGVudGlyZWx5IGRpZmZlcmVudCwgc28gSSBzdXNwZWN0IHRoZXkgbWVhbiBmaWd1cmUKNCB0
aGVyZS4KClNvLCBhcyBJIHNheSwgeW91J3JlIGJhc2ljYWxseSBhc2tpbmcgZm9yIHNvbWVvbmUg
dG8gbWFrZSBzb21ldGhpbmcgdXAKdG8gc3VpdCB5b3VyIHJlcXVpcmVtZW50cyBhbmQgdGhyb3cg
dGhhdCBpbnRvIERULgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGlu
dXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRDIGZvciAwLjhtIChlc3QuIDE3NjJtKSBs
aW5lIGluIHN1YnVyYmlhOiBzeW5jIGF0IDEzLjFNYnBzIGRvd24gNDI0a2JwcyB1cApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcg
bGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXYK
