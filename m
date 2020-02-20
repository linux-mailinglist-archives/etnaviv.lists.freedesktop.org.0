Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243B0166391
	for <lists+etnaviv@lfdr.de>; Thu, 20 Feb 2020 17:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19EB6EDE8;
	Thu, 20 Feb 2020 16:56:41 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 351 seconds by postgrey-1.36 at gabe;
 Thu, 20 Feb 2020 12:58:47 UTC
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509326E8DD
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Feb 2020 12:58:47 +0000 (UTC)
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 2F8AA67A6E3
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Feb 2020 13:58:45 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 20 Feb
 2020 13:58:44 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Thu, 20 Feb 2020 13:58:44 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Subject: Re: Etnaviv issues on i.MX8M-Mini
Thread-Topic: Etnaviv issues on i.MX8M-Mini
Thread-Index: AQHV5+yplA/1sTzXA027Bdn9yaxznqgj+lkA
Date: Thu, 20 Feb 2020 12:58:44 +0000
Message-ID: <64852af3-cf18-8041-158f-51466f99301a@kontron.de>
References: <2704d3bd-5563-8951-58f7-75a906782754@kontron.de>
In-Reply-To: <2704d3bd-5563-8951-58f7-75a906782754@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <771C47DB3C9CC441B25922DEC46BC9FC@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 2F8AA67A6E3.AC34E
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: etnaviv@lists.freedesktop.org
X-Spam-Status: No
X-Mailman-Approved-At: Thu, 20 Feb 2020 16:56:39 +0000
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

T24gMjAuMDIuMjAgMTM6NTIsIEZyaWVkZXIgU2NocmVtcGYgd3JvdGU6DQo+IEhpLA0KPiANCj4g
YWNjb3JkaW5nIHRvIHRoZSBkb2N1bWVudHMsIHRoZSBpLk1YOE0tTWluaSBmZWF0dXJlcyBhIEdD
MzIwIGFuZCBhIA0KPiBHQ05hbm9VbHRyYS4gSSB0cmllZCB0byBydW4gdGhlIGV0bmF2aXYgZHJp
dmVycyBhbmQgdGhlIGZvbGxvd2luZyBHUFVzIA0KPiBhcmUgZGV0ZWN0ZWQ6DQo+IA0KPiAgwqDC
oMKgwqBldG5hdml2LWdwdSAzODAwMDAwMC5ncHU6IG1vZGVsOiBHQzYwMCwgcmV2aXNpb246IDQ2
NTMNCj4gIMKgwqDCoMKgZXRuYXZpdi1ncHUgMzgwMDgwMDAuZ3B1OiBtb2RlbDogR0M1MjAsIHJl
dmlzaW9uOiA1MzQxDQoNClNvcnJ5LCBmb3Jnb3QgdG8gbWVudGlvbiB0aGF0IEknbSBydW5uaW5n
IExpbnV4IDUuNC4NCg0KPiANCj4gUnVubmluZyBzb21lIGRlbW9zIGFuZCB0ZXN0cyB3aXRoIG1l
c2EgMTkuMS42IG1vc3QgdGhpbmdzIHNlZW0gdG8gd29yay4gDQo+IFN0aWxsIEkgY3VycmVudGx5
IGhhdmUgdHdvIGlzc3Vlcywgd2hpbGUgdGhlIGZpcnN0IG9uZSBpcyBraW5kIG9mIGEgDQo+IHNo
b3ctc3RvcHBlciBhbmQgdGhlIHNlY29uZCBvbmUgaXMgbm90IHJlYWxseSBpbXBvcnRhbnQgYXMg
aXQgc2VlbXMgdG8gDQo+IGFmZmVjdCBzaGFkZXJzIG9ubHkuDQo+IA0KPiAxLiBXaGVuIHJ1bm5p
bmcgYW55IFF0UXVpY2sgYXBwbGljYXRpb25zLCBhbGwgdHJhbnNmb3JtYXRpb25zIGxpa2UgDQo+
IG1vdmluZyBlbGVtZW50cyBhcmUgcmVhbGx5IGplcmt5IGFuZCBub3Qgc21vb3RoIGF0IGFsbCBh
cyBpdCBzaG91bGQgYmUuIA0KPiBBbnkgaWRlYXMgd2hhdCB0aGUgcmVhc29uIGNvdWxkIGJlLCBv
ciBob3cgdG8gZ2V0IG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgDQo+IHRoaXMgcHJvYmxlbT8NCj4g
DQo+IDIuIFdpdGggc29tZSBkZW1vcyAoZS5nLiB3aXRoICdnbG1hcmsyLWVzMi1kcm0gLWIgdGVy
cmFpbicpIEkgZ2V0Og0KPiANCj4gIMKgwqDCoMKgZXJyb3I6IGNvbXBpbGUgZmFpbGVkIQ0KPiAg
wqDCoMKgwqBldG5hX2RyYXdfdmJvOjIyMjogY29tcGlsZWQgc2hhZGVycyBhcmUgbm90IG9rYXkN
Cj4gDQo+IENhbiB0aGlzIGJlIGZpeGVkIHNvbWVob3csIG9yIGlzIHRoaXMgZHVlIHRvIHRoZSBs
aW1pdGF0aW9ucyBvZiB0aGUgR1BVPw0KPiANCj4gVGhhbmtzLA0KPiBGcmllZGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBs
aXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdgo=
