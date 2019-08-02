Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9037FBF7
	for <lists+etnaviv@lfdr.de>; Fri,  2 Aug 2019 16:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5176EE7B;
	Fri,  2 Aug 2019 14:21:56 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEA16EE79
 for <etnaviv@lists.freedesktop.org>; Fri,  2 Aug 2019 14:21:55 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1htYRN-0004bn-Of; Fri, 02 Aug 2019 16:21:53 +0200
Message-ID: <1564755713.3090.3.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/8] drm/etnaviv: split out cmdbuf mapping into
 address space
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Lucas Stach
 <l.stach@pengutronix.de>
Date: Fri, 02 Aug 2019 16:21:53 +0200
In-Reply-To: <20190802133900.GA3251@bogon.m.sigxcpu.org>
References: <20190705171727.27501-1-l.stach@pengutronix.de>
 <20190705171727.27501-2-l.stach@pengutronix.de>
 <20190802133900.GA3251@bogon.m.sigxcpu.org>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Christian Gmeiner <christian.gmeiner@gmail.com>,
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgR3VpZG8sCgpPbiBGcmksIDIwMTktMDgtMDIgYXQgMTU6MzkgKzAyMDAsIEd1aWRvIEfDvG50
aGVyIHdyb3RlOgo+IEhpIEx1Y2FzLAo+IE9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDA3OjE3OjIx
UE0gKzAyMDAsIEx1Y2FzIFN0YWNoIHdyb3RlOgo+ID4gVGhpcyBhbGxvd3MgdG8gZGVjb3VwbGUg
dGhlIGNtZGJ1ZiBzdWJhbGxvY2F0b3IgY3JlYXRlIGFuZCBtYXBwaW5nCj4gPiB0aGUgcmVnaW9u
IGludG8gdGhlIEdQVSBhZGRyZXNzIHNwYWNlLiBBbGxvd2luZyBtdWx0aXBsZSBBUyB0byBzaGFy
ZQo+ID4gYSBzaW5nbGUgY21kYnVmIHN1YmFsbG9jLgo+IAo+IENhbiB5b3UgdGVsbCBtZSB3aGVy
ZSB0aGlzIHdvdWxkIGFwcGx5PyBJIHRyaWVkIDUuMiBhbmQgbmV4dC0yMDE5MDcyNgo+IHdpdGgg
YW5kIHdpdGhvdXQKPiAKPiAgICBbUEFUQ0ggMS8yXSBkcm0vZXRuYXZpdjogZml4IGV0bmF2aXZf
Y21kYnVmX3N1YmFsbG9jX25ldyByZXR1cm4gdmFsdWUKCkkgaGF2ZSBzdGFja2VkCgpkcm0vZXRu
YXZpdjogZHJvcCB1c2Ugb2YgZHJtUC5oCmRybS9ldG5hdml2OiBVc2UKZGV2bV9wbGF0Zm9ybV9p
b3JlbWFwX3Jlc291cmNlKCkKZHJtL2V0bmF2aXY6IGNsZWFuIHVwIGluY2x1ZGVzCmRybS9ldG5h
dml2OiBmaXgKZXRuYXZpdl9jbWRidWZfc3ViYWxsb2NfbmV3IHJldHVybiB2YWx1ZQpkcm0vZXRu
YXZpdjogcmVtb3ZlIHVudXNlZCBmdW5jdGlvbiBldG5hdml2X2dlbV9tYXBwaW5nX3JlZmVyZW5j
ZQpkcm0vZXRuYXZpdjogZHVtcCBvbmx5IGZhaWxpbmcgc3VibWl0CmRybS9ldG5hdml2OiBzaW1w
bGlmeSB1bmJpbmQgY2hlY2tzCgpvbiB0b3Agb2YgdjUuMy1yMSBhbmQgdGhpcyBwYXRjaCBhcHBs
aWVkIHdpdGggYSBiaXQgb2YgZnV6ei4KCnJlZ2FyZHMKUGhpbGlwcApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5h
dml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
