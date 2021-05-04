Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C937271F
	for <lists+etnaviv@lfdr.de>; Tue,  4 May 2021 10:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3D16EAA7;
	Tue,  4 May 2021 08:22:29 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5575A6EAA7
 for <etnaviv@lists.freedesktop.org>; Tue,  4 May 2021 08:22:28 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ldqK1-0002Mk-UK; Tue, 04 May 2021 10:22:25 +0200
Message-ID: <01197fdac2c5b5546f189a2f3156fe24da2b9e6e.camel@pengutronix.de>
Subject: Re: i.MX8MM Etnaviv Bus Error mit 4GB RAM
From: Lucas Stach <l.stach@pengutronix.de>
To: Frieder Schrempf <frieder.schrempf@kontron.de>, 
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Date: Tue, 04 May 2021 10:22:25 +0200
In-Reply-To: <27902169-35c8-b4b1-b12b-17f8ad8531a2@kontron.de>
References: <27902169-35c8-b4b1-b12b-17f8ad8531a2@kontron.de>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgRnJpZWRlciwKCkFtIERpZW5zdGFnLCBkZW0gMDQuMDUuMjAyMSB1bSAwOToxMyArMDIwMCBz
Y2hyaWViIEZyaWVkZXIgU2NocmVtcGY6Cj4gSGksCj4gCj4gSSdtIHNlZWluZyB0aGUgZm9sbG93
aW5nIG1lc3NhZ2VzIG9uIGEgc3lzdGVtIHdpdGggaS5NWDhNTSB3aXRoIDRHQiBvZiAKPiBSQU0u
IFdoZW4gSSBsaW1pdCB0aGUgUkFNIHRvIDNHQiAobWVtPTNHKSBpdCBkb2Vzbid0IGhhcHBlbiBh
bnltb3JlLgo+IAo+IMKgwqDCoGV0bmF2aXYtZ3B1IDM4MDAwMDAwLmdwdTogQVhJIGJ1cyBlcnJv
cgo+IMKgwqDCoGV0bmF2aXYtZ3B1IDM4MDAwMDAwLmdwdTogTU1VIGZhdWx0IHN0YXR1cyAweDAw
MDAwMDAwCj4gwqDCoMKgZXRuYXZpdi1ncHUgMzgwMDAwMDAuZ3B1OiByZWNvdmVyIGh1bmcgR1BV
IQo+IAo+IElzIHRoaXMgc29tZXRoaW5nIHRoYXQgbmVlZHMgdG8gYmUgZml4ZWQgb24gRXRuYXZp
di1sZXZlbCBvciBvbiAKPiBTb0MtbGV2ZWw/IEFuZCBob3cgY291bGQgYSBzb2x1dGlvbiBsb29r
IGxpa2U/CgpUaGlzIGlzIGEgcGxhdGZvcm0gbGV2ZWwgaXNzdWUuIEkndmUgQ0MnZWQgeW91IG9u
IHR3byBwYXRjaGVzIEkganVzdApzZW50IG91dCB0aGF0IHNob3VsZCBmaXggdGhpcyBpc3N1ZS4K
ClJlZ2FyZHMsCkx1Y2FzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXYK
