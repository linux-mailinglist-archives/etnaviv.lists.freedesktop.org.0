Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 018BD3BE6AD
	for <lists+etnaviv@lfdr.de>; Wed,  7 Jul 2021 12:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A503D6E0C6;
	Wed,  7 Jul 2021 10:52:36 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D106B6E0C4
 for <etnaviv@lists.freedesktop.org>; Wed,  7 Jul 2021 10:52:34 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1m15AK-0007KA-CP; Wed, 07 Jul 2021 12:52:28 +0200
Message-ID: <099ef9f1cd1b865afd9cb8849d5485776ad1b868.camel@pengutronix.de>
Subject: Re: [PATCH AUTOSEL 5.13 001/189] drm/etnaviv: fix NULL check before
 some freeing functions is not needed
From: Lucas Stach <l.stach@pengutronix.de>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Wed, 07 Jul 2021 12:52:25 +0200
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
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
Cc: Tian Tao <tiantao6@hisilicon.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gRGllbnN0YWcsIGRlbSAwNi4wNy4yMDIxIHVtIDA3OjExIC0wNDAwIHNjaHJpZWIgU2FzaGEg
TGV2aW46Cj4gRnJvbTogVGlhbiBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+Cj4gCj4gWyBV
cHN0cmVhbSBjb21taXQgN2Q2MTRhYjJmMjA1MDNlZDg3NjYzNjNkNDFmODYwNzMzNzU3MWFkZiBd
Cj4gCj4gZml4ZWQgdGhlIGJlbG93IHdhcm5pbmc6Cj4gZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYv
ZXRuYXZpdl9nZW1fcHJpbWUuYzo4NDoyLTg6IFdBUk5JTkc6IE5VTEwgY2hlY2sKPiBiZWZvcmUg
c29tZSBmcmVlaW5nIGZ1bmN0aW9ucyBpcyBub3QgbmVlZGVkLgoKV2hpbGUgdGhlIHN1YmplY3Qg
Y29udGFpbnMgImZpeCIgdGhpcyBvbmx5IHJlbW92ZXMgYSBkdXBsaWNhdGVkIE5VTEwKY2hlY2ss
IHNvIHRoZSBjb2RlIGlzIGNvcnJlY3QgYmVmb3JlIGFuZCBhZnRlciB0aGlzIGNoYW5nZS4KSXMg
dGhpcyByZWFsbHkgc3RhYmxlIG1hdGVyaWFsPyBEb2Vzbid0IHRoaXMganVzdCBhZGQgY29tbWl0
IG5vaXNlIHRvCnRoZSBzdGFibGUga2VybmVscz8KClJlZ2FyZHMsCkx1Y2FzCgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPgo+IEFja2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gU2lnbmVkLW9mZi1ieTog
U2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2dlbV9wcmltZS5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9nZW1fcHJpbWUuYwo+IGluZGV4IGIzOTBkZDRkNjBiNy4uZDc0MWIxZDczNWY3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtX3ByaW1l
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9wcmltZS5jCj4g
QEAgLTgwLDggKzgwLDcgQEAgc3RhdGljIHZvaWQgZXRuYXZpdl9nZW1fcHJpbWVfcmVsZWFzZShz
dHJ1Y3QgZXRuYXZpdl9nZW1fb2JqZWN0ICpldG5hdml2X29iaikKPiAgCS8qIERvbid0IGRyb3Ag
dGhlIHBhZ2VzIGZvciBpbXBvcnRlZCBkbWFidWYsIGFzIHRoZXkgYXJlIG5vdAo+ICAJICogb3Vy
cywganVzdCBmcmVlIHRoZSBhcnJheSB3ZSBhbGxvY2F0ZWQ6Cj4gIAkgKi8KPiAtCWlmIChldG5h
dml2X29iai0+cGFnZXMpCj4gLQkJa3ZmcmVlKGV0bmF2aXZfb2JqLT5wYWdlcyk7Cj4gKwlrdmZy
ZWUoZXRuYXZpdl9vYmotPnBhZ2VzKTsKPiAgCj4gIAlkcm1fcHJpbWVfZ2VtX2Rlc3Ryb3koJmV0
bmF2aXZfb2JqLT5iYXNlLCBldG5hdml2X29iai0+c2d0KTsKPiAgfQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0
bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZXRuYXZpdgo=
