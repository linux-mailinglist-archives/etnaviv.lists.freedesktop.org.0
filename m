Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A850CB789
	for <lists+etnaviv@lfdr.de>; Fri,  4 Oct 2019 11:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DF06EB02;
	Fri,  4 Oct 2019 09:43:36 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8836E313
 for <etnaviv@lists.freedesktop.org>; Fri,  4 Oct 2019 09:12:34 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51566)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iGJdL-0003GJ-Mr; Fri, 04 Oct 2019 10:12:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iGJdG-0002eU-9X; Fri, 04 Oct 2019 10:12:14 +0100
Date: Fri, 4 Oct 2019 10:12:14 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
Message-ID: <20191004091214.GW25745@shell.armlinux.org.uk>
References: <20190926160433.GD32311@linux.ibm.com>
 <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
 <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
 <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
 <20191002073605.GA30433@linux.ibm.com>
 <CAHCN7xL1MkJh44N3W_1+08DHmX__SqnfH6dqUzYzr2Wpg0kQyQ@mail.gmail.com>
 <20191003053451.GA23397@linux.ibm.com>
 <20191003084914.GV25745@shell.armlinux.org.uk>
 <CAFXsbZrLkjsda8oM4SG6LOpfu7a=vwJ7eGM-FL8dzCKb0yzy5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFXsbZrLkjsda8oM4SG6LOpfu7a=vwJ7eGM-FL8dzCKb0yzy5w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 04 Oct 2019 09:43:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qtILDKeXE+NCWyeY17J+cqlMaH7cJ64zwiZoTKzK//c=; b=UxFVRJC5SVp6RefPuhEn6OkIb
 ZoCa7/ug258G0mGIdFg3KwWzhohmWmqewT5hV4i/PEddZI7ERhiLfwJ2vOUqMohrz2GnwYTr//+nn
 9ySEqyKpm1VlmQJJikR8lJJBWk+V5rD5yoDDdOXQ1dnQVDEdbWjo6/f4yOkl35aF+cbuvQFvXriQT
 wOVHlRINtBS5/mwtcxdSQfS6oDjE8jE/gxqW/LR5rkcMAmhIA63kq/ct61ue6pIrvW8PSFlEfjhgz
 WgHQi6WayK1YcbHfrOsoIDd11aSLdOrn4ZCYqt0r/4TcOJTYNhMe+C7hbBNbrfifDGsMXHix4xc3v
 HSsqSLyFg==;
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Adam Ford <aford173@gmail.com>,
 Christoph Hellwig <hch@lst.de>, arm-soc <linux-arm-kernel@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDc6NDY6MDZBTSAtMDcwMCwgQ2hyaXMgSGVhbHkgd3Jv
dGU6Cj4gPgo+ID4gVGhlIGlNWDYgZG9lcyBub3QgaGF2ZSBNTVV2MiBoYXJkd2FyZSwgaXQgaGFz
IE1NVXYxLiAgV2l0aCBNTVV2MQo+ID4gaGFyZHdhcmUgcmVxdWlyZXMgY29tbWFuZCBidWZmZXJz
IHdpdGhpbiB0aGUgZmlyc3QgMkdpQiBvZiBwaHlzaWNhbAo+ID4gUkFNLgo+ID4KPiBJIHRob3Vn
aHQgdGhhdCB0aGUgaS5NWDZxIGhhcyB0aGUgTU1VdjEgYW5kIEdDMjAwMCBHUFUgd2hpbGUgdGhl
Cj4gaS5NWDZxcCBoYXMgdGhlIE1NVXYyIGFuZCBHQzMwMDA/ICBNZWFuaW5nIHRoZSBpLk1YNiBo
YXMgYm90aCBNTVV2MQo+IGFuZCBNTVV2MiBkZXBlbmRpbmcgb24gd2hpY2ggaS5NWDYgcGFydCB3
ZSBhcmUgdGFsa2luZyBhYm91dC4KClRoZSByZXBvcnQgc2F5cyBpTVg2USB3aXRoIEdDMjAwMCAt
IHdoaWNoIGlzIHdoYXQgSSB3YXMgcmVmZXJyaW5nIHRvCmhlcmUuICBJJ20gbm90IGF3YXJlIG9m
IHdoYXQgdGhlIGxhdGVyIFNvQ3MgdXNlLCBzaW5jZSBJJ3ZlIG5ldmVyIHVzZWQKdGhlbS4KClRo
YW5rcy4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51
ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBz
dWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNw
ZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2V0bmF2aXY=
