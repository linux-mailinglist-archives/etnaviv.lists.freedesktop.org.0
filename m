Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B9A177566
	for <lists+etnaviv@lfdr.de>; Tue,  3 Mar 2020 12:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E346E1D2;
	Tue,  3 Mar 2020 11:43:19 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9EF6E1D2;
 Tue,  3 Mar 2020 11:43:17 +0000 (UTC)
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id DD1BC67A6F2;
 Tue,  3 Mar 2020 12:43:14 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 3 Mar 2020
 12:43:14 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Tue, 3 Mar 2020 12:43:14 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: =?utf-8?B?R3VpZG8gR8O8bnRoZXI=?= <agx@sigxcpu.org>, Lucas Stach
 <l.stach@pengutronix.de>
Subject: Re: Etnaviv issues on i.MX8M-Mini
Thread-Topic: Etnaviv issues on i.MX8M-Mini
Thread-Index: AQHV5+yplA/1sTzXA027Bdn9yaxznqgkQ0YAgAASYYCAAAlEgIAFurcAgAAChwCAAAR5gIAABF6AgAFhcICAAgymAIAABmKAgAAC9ICAB2CtgIABxCIA
Date: Tue, 3 Mar 2020 11:43:14 +0000
Message-ID: <365dc72c-2e61-720a-4580-4047fc7dc630@kontron.de>
References: <CAFXsbZp9kW555gm+8Cz+oQVRNSzVzzQO2rM5YqzitCd6T7KN6Q@mail.gmail.com>
 <bcc3af77-07c5-fbc7-ad20-d070c5ab1ce8@kontron.de>
 <CAFXsbZqNQMi+-tPE22oMTHqb+8vEOy+v8cLfUMmhqs7S5RLoqg@mail.gmail.com>
 <d1c98cb7-c75f-d8ca-9541-3c118d371a57@kontron.de>
 <38c7cdc27213697b50517ce103a9d38120f84bd3.camel@pengutronix.de>
 <f3a0bd17-83f5-4afa-e9a6-3eac411d34ff@kontron.de>
 <ca594143751e94a2cf519e03915faa23a91c2836.camel@pengutronix.de>
 <41b4070d-8db8-112c-6c57-f50af00b1604@kontron.de>
 <47cc398f-565a-5725-eb93-66870dfbdc0c@kontron.de>
 <8234253d725e665a4ef0f231c587e32cd4261a55.camel@pengutronix.de>
 <20200226160509.GA71919@bogon.m.sigxcpu.org>
 <8cc6fed1-f438-75f2-a090-eca8e21db769@kontron.de>
In-Reply-To: <8cc6fed1-f438-75f2-a090-eca8e21db769@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <9AFF0D18505B5147BDED50618BCD5802@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: DD1BC67A6F2.A2D92
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: agx@sigxcpu.org, cphealy@gmail.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 l.stach@pengutronix.de
X-Spam-Status: No
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gMDIuMDMuMjAgMDk6NDQsIEZyaWVkZXIgU2NocmVtcGYgd3JvdGU6DQo+IE9uIDI2LjAyLjIw
IDE3OjA1LCBHdWlkbyBHw7xudGhlciB3cm90ZToNCj4+IE9uIFdlZCwgRmViIDI2LCAyMDIwIGF0
IDA0OjU0OjM1UE0gKzAxMDAsIEx1Y2FzIFN0YWNoIHdyb3RlOg0KPj4+IE9uIE1pLCAyMDIwLTAy
LTI2IGF0IDE1OjMxICswMDAwLCBTY2hyZW1wZiBGcmllZGVyIHdyb3RlOg0KPj4+PiBPbiAyNS4w
Mi4yMCAwOToxMywgRnJpZWRlciBTY2hyZW1wZiB3cm90ZToNCj4+Pj4+IEhpIEx1Y2FzLA0KPj4+
Pj4NCj4+Pj4+IE9uIDI0LjAyLjIwIDEyOjA4LCBMdWNhcyBTdGFjaCB3cm90ZToNCj4+Pj4+PiBP
biBNbywgMjAyMC0wMi0yNCBhdCAxMDo1MyArMDAwMCwgU2NocmVtcGYgRnJpZWRlciB3cm90ZToN
Cj4+Pj4+Pj4gSGkgTHVjYXMsDQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9uIDI0LjAyLjIwIDExOjM3LCBM
dWNhcyBTdGFjaCB3cm90ZToNCj4+Pj4+Pj4+IEhpIEZyaWVkZXIsDQo+Pj4+Pj4+Pg0KPj4+Pj4+
Pj4gT24gTW8sIDIwMjAtMDItMjQgYXQgMTA6MjggKzAwMDAsIFNjaHJlbXBmIEZyaWVkZXIgd3Jv
dGU6DQo+Pj4+Pj4+Pj4gT24gMjAuMDIuMjAgMTk6NTgsIENocmlzIEhlYWx5IHdyb3RlOg0KPj4+
Pj4+Pj4+PiBGb3IgdGhlIGplcmtleSB0cmFuc2l0aW9ucywgY2FuIHlvdSBkZXRlcm1pbmUgaWYg
dGhpcyBpcyBhIA0KPj4+Pj4+Pj4+PiBzeW1wdG9tIG9mDQo+Pj4+Pj4+Pj4+IGEgbG93IGZyYW1l
cmF0ZSBvciBkcm9wcGVkIGZyYW1lcyBvciBzb21ldGhpbmcgZWxzZT8NCj4+Pj4+Pj4+Pj4NCj4+
Pj4+Pj4+Pj4gUGVyaGFwcyB5b3UgY2FuIHN0YXJ0IHlvdXIgYXBwIHdpdGgNCj4+Pj4+Pj4+Pj4g
IkdBTExJVU1fSFVEPWZwcyxjcHUsZHJhdy1jYWxscyxmcmFtZXRpbWUiLsKgIFRoaXMgbWF5IGdp
dmUgc29tZQ0KPj4+Pj4+Pj4+PiBjbHVlcy4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IFRoZSBmcmFt
ZXJhdGUgc2VlbXMgb2suIEkgZ2V0IHNvbWV0aGluZyBiZXR3ZWVuIDUwIGFuZCA3MCBGUFMuDQo+
Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBJIGhhdmUgYSBRdCBkZW1vIGFwcCB3aXRoIGEgbWVudSBhbmQg
YW4gYW5pbWF0ZWQgJ2JhbGwnIHRoYXQgbW92ZXMNCj4+Pj4+Pj4+PiBhY3Jvc3MgdGhlIHNjcmVl
bi4gV2hlbiB0aGUgbWVudSBpcyB2aXNpYmxlLCB0aGUgYmFsbCBtb3ZlbWVudCBpcw0KPj4+Pj4+
Pj4+IHJlYWxseQ0KPj4+Pj4+Pj4+IGplcmt5IChiYWxsIHNlZW1zIHRvICdqdW1wIGJhY2sgYW5k
IGZvcnRoJyBpbnN0ZWFkIG9mIG1vdmluZw0KPj4+Pj4+Pj4+IGxpbmVhcmx5KS4NCj4+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4+IEFzIHNvb24gYXMgSSBoaWRlIHRoZSBtZW51IGFuZCBzaG93IHRoZSBhbmlt
YXRpb24gZnVsbHNjcmVlbiwgdGhlDQo+Pj4+Pj4+Pj4gbW92ZW1lbnRzIGFyZSBwZXJmZWN0bHkg
c21vb3RoLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gUnVubmluZyB0aGUgc2FtZSBhcHAgd2l0aCBz
b2Z0d2FyZSByZW5kZXJpbmcsIGV2ZXJ5dGhpbmcgbG9va3MNCj4+Pj4+Pj4+PiBnb29kLCB0b28u
DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBObyBpZGVhIHdoYXQgdGhhdCBtZWFucywgdGhvdWdoLiBJ
IHByb2JhYmx5IG5lZWQgdG8gbG9vayBhdCB0aGUNCj4+Pj4+Pj4+PiBjb2RlIG9mDQo+Pj4+Pj4+
Pj4gdGhlIGFwcCBhbmQgZG8gc29tZSBtb3JlIGV4cGVyaW1lbnRzIHRvIGdldCBhIGJldHRlciBp
ZGVhIG9mIHdoYXQNCj4+Pj4+Pj4+PiBtaWdodA0KPj4+Pj4+Pj4+IGNhdXNlIHRoZSBkaXN0b3J0
aW9uLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gVW5sZXNzIHNvbWUgb2YgdGhlIGdyYXBoaWNzIGV4
cGVydHMgaGVyZSBhbHJlYWR5IGhhdmUgYW4gaWRlYSANCj4+Pj4+Pj4+PiBvZiB3aGF0DQo+Pj4+
Pj4+Pj4gY2FuIGNhdXNlIGFuZC9vciBob3cgdG8gZGVidWcgc3VjaCBhbiBpc3N1ZSE/DQo+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4gV2hpY2ggZHJpdmVyIGlzIHVzZWQgZm9yIHRoZSBkaXNwbGF5IHNpZGU/
IEl0IHNlZW1zIGxpa2UgdGhlIA0KPj4+Pj4+Pj4gZGlzcGxheQ0KPj4+Pj4+Pj4gc2lkZSBkb2Vz
bid0IHByb3Blcmx5IGhhbmRsZSB0aGUgZG1hIGZlbmNlcyB1c2VkIHRvIHN5bmNocm9uaXplIA0K
Pj4+Pj4+Pj4gc2Nhbm91dA0KPj4+Pj4+Pj4gYW5kIHJlbmRlcmluZy4NCj4+Pj4+Pj4NCj4+Pj4+
Pj4gSSBwb3J0ZWQvcGlja2VkIHRoZSBkcml2ZXJzIGZvciB0aGUgTENESUYgYW5kIERTSSBjb250
cm9sbGVycyBmcm9tDQo+Pj4+Pj4+IGRldmVsb3BtZW50IGJyYW5jaCBvZiB0aGUgNS40LWJhc2Vk
IHZlbmRvciBrZXJuZWwgWzFdIHRvIG91ciBvd24NCj4+Pj4+Pj4gdjUuNC1iYXNlZCBrZXJuZWwg
WzJdLiBTbyBpdCBpcyBxdWl0ZSBwcm9iYWJsZSwgdGhhdCBzb21ldGhpbmcgDQo+Pj4+Pj4+IGNv
dWxkIGJlDQo+Pj4+Pj4+IHdyb25nIGhlcmUuDQo+Pj4+Pj4NCj4+Pj4+PiBQbGVhc2UganVzdCB1
c2UgRFJNX01YU0ZCIGZvciB0aGUgZGlzcGxheSBzaWRlLCBpbnN0ZWFkIG9mIHRoZQ0KPj4+Pj4+
IGRvd25zdHJlYW0gZHJpdmVyLg0KPj4+Pj4NCj4+Pj4+IEhtLCBnb29kIGlkZWEuIEkgc29tZWhv
dyBmb3Jnb3QgYWJvdXQgdGhlIGZhY3QsIHRoYXQgdGhlcmUgaXMgYW4NCj4+Pj4+IHVwc3RyZWFt
IGRyaXZlciBmb3IgdGhlIExDRElGIGNvbnRyb2xsZXIuIE9uIGZpcnN0IHRyeSBJIGNvdWxkbid0
IA0KPj4+Pj4gZ2V0IGl0DQo+Pj4+PiB0byBydW4gb24gdGhlIGkuTVg4TU0sIGJ1dCBJIHN1c3Bl
Y3QgdGhhdCdzIGR1ZSB0byBzb21lIHJlc2V0LA0KPj4+Pj4gcG93ZXItZG9tYWluIG9yIGNsb2Nr
IHNldHVwLCB0aGF0IGlzIG1pc3NpbmcgdXBzdHJlYW0uIEkgd2lsbCBzZWUgaWYgSQ0KPj4+Pj4g
Y2FuIGdldCBhbnkgZnVydGhlciB3aXRoIHRoaXMuDQo+Pj4+DQo+Pj4+IFNvIEkgaGFkIGEgY2xv
c2VyIGxvb2sgYW5kIHdoaWxlIHRoZSBEUk1fTVhTRkIgbG9va3Mgb2sgb24gaXRzIG93biwgSQ0K
Pj4+PiBoYXZlIHNvbWUgcHJvYmxlbSB3aXRoIHRoZSByZXN0IG9mIHRoZSBpLk1YOE1NIGRpc3Bs
YXkgc3Vic3lzdGVtLg0KPj4+Pg0KPj4+PiBUaGUgdmVuZG9yIHN0YWNrLCB0aGF0IEknbSBjdXJy
ZW50bHkgdXNpbmcgaW50ZWdyYXRlcyBpbnRvIHRoZSBpbXgtZHJtDQo+Pj4+IG1hc3Rlci9jb3Jl
IGRyaXZlciBbMV0gdGhhdCBiaW5kcyBhbGwgdGhlIGNvbXBvbmVudHMgb2YgdGhlIGRpc3BsYXkN
Cj4+Pj4gc3Vic3lzdGVtLCBzdWNoIGFzIHRoZSBMQ0RJRiBkcml2ZXIgYW5kIHRoZSBpbnRlZ3Jh
dGVkIFNFQ19EU0lNIERTSSANCj4+Pj4gYnJpZGdlLg0KPj4+Pg0KPj4+PiBBbmQgYmVjYXVzZSBv
ZiBteSBsYWNrIG9mIERSTSBza2lsbHMsIEkgaGF2ZSBubyBpZGVhIGhvdyB0byBnZXQgdGhlDQo+
Pj4+IERSTV9NWFNGQiBkcml2ZXIgdG8gYmluZCB0byB0aGUgaW14LWRybSBjb3JlLCBpbnN0ZWFk
IG9mIHJ1bm5pbmcNCj4+Pj4gc2VwYXJhdGVseSBhbmQgY29ubmVjdGluZyBkaXJlY3RseSB0byBz
b21lIHBhbmVsIGFzIGl0IGlzIGRvbmUgZm9yDQo+Pj4+IGkuTVgyMy8yOCBhbmQgaS5NWDZTWC9V
TC4NCj4+Pg0KPj4+IEl0J3MgYSBzZXBhcmF0ZSBoYXJkd2FyZSBhbmQgaXQncyBhIHByZXR0eSBt
YWpvciBkZXNpZ24gaXNzdWUgb2YgdGhlDQo+Pj4gZG93bnN0cmVhbSBkcml2ZXIgdGhhdCBpdCBp
bnRlZ3JhdGVzIGludG8gaW14LWRybS4gWW91IGRvbid0IHdhbnQgdGhpcw0KPj4+IHdpdGggdGhl
IHVwc3RyZWFtIGRyaXZlci4NCj4+Pg0KPj4+IE1heWJlIEd1aWRvIChDQ2VkKSBjYW4gZ2l2ZSB5
b3Ugc29tZSBjbHVlcywgYXMgYXBwYXJlbnRseSBoZSBpcyB1c2luZw0KPj4+IHRoZSBtYWlubGlu
ZSBlTENESUYgZHJpdmVyICsgc29tZSBwYXRjaGVzIHRvIGRyaXZlIHRoZSBEU0kgZGlzcGxheSBw
YXRoDQo+Pj4gb24gaS5NWDhNUS4gQSBsb3Qgb2YgdGhpcyB3aWxsIHByb2JhYmx5IGJlIHRyYW5z
ZmVyYWJsZSB0byB0aGUgaS5NWDhNTQ0KPj4+IGRpc3BsYXkgcGF0aC4NCj4+DQo+PiBOZXdlciBt
eHNmYiBzdXBwb3J0cyBhdHRhY2hpbmcgYSBicmlkZ2Ugc28gaWYgeW91IG1ha2UgeW91ciBEU0kg
aG9zdA0KPj4gY29udHJvbGxlciBkcml2ZXIgYSBEU0kgYnJpZGdlIG14c2ZiIGNhbiBkcml2ZSBp
dDoNCj4+DQo+PiAgICAgICANCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvZ3B1L2RybS9teHNm
Yi9teHNmYl9kcnYuYyNuMjY4IA0KPj4NCj4+DQo+PiB0aGlzIHNob3VsZCBiZSBzaW1pbGFyIHRv
IHdoYXQgd2FzIGRvbmUgZm9yIHRoZSBpbXg4bXEgaGVyZSAoaW14OG1tDQo+PiB1c2VycyBhIGRp
ZmZlcmVudCBpcCBjb3JlIHRob3VnaCk6DQo+Pg0KPj4gICAgICAgDQo+PiBodHRwczovL3NvdXJj
ZS5wdXJpLnNtL2d1aWRvLmd1bnRoZXIvbGludXgtaW14OC9jb21taXRzL2ZvcndhcmQtdXBzdHJl
YW0vbmV4dC0yMDIwMDIxNy9teHNmYitud2wvdjktd2lwIA0KPj4NCj4+DQo+PiBUaGVyZSdzIGFs
c28gc29tZSBhZGRpdGlvbmFsIG14c2ZiIHBhdGNoZXMgYnkgUm9iZXJ0IGZsb2F0aW5nIGFyb3Vu
ZA0KPj4gd2hpY2ggYXJlbid0IG1haW5saW5lIHlldCB3aGljaCB0aGUgYWJvdmUgYnJhbmNoIGFs
c28gaGFzLg0KPj4NCj4+IFdoaWNoIHJlbWluZHMgbWUgdGhhdCBpIG5lZWQgdG8gcHJlcGFyZSBh
bmQgc2VuZCBvdXQgYSB2OS4NCj4gDQo+IFRoYW5rcyBMdWNhcyBhbmQgR3VpZG8gZm9yIHBvaW50
aW5nIG91dCB0aGUgZGV0YWlscyENCj4gSXQncyB2ZXJ5IHVuZm9ydHVuYXRlIHRoYXQgaS5NWDhN
USBhbmQgaS5NWDhNTSBkb24ndCBzaGFyZSB0aGUgc2FtZSBEU0kgDQo+IGlwIGNvcmUuDQo+IEl0
IHNlZW1zIGxpa2UgSSBuZWVkIHRvIHRyeSBjb21pbmcgdXAgd2l0aCBhIGJyaWRnZSBkcml2ZXIg
Zm9yIHRoZSANCj4gU2Ftc3VuZyBEU0lNIERTSSBjb250cm9sbGVyIGZvciBhIHByb3BlciB1cHN0
cmVhbSBzb2x1dGlvbi4NCg0KU29ycnkgdG8gYm90aGVyIHlvdSB3aXRoIG9uZSBtb3JlIHF1ZXN0
aW9uIGZyb20gYSBEUk0gbmV3YmllLg0KDQpJJ20gY3VycmVudGx5IGxvb2tpbmcgYXQgR3VpZG8n
cyBjb2RlIGZvciB0aGUgTldMIERTSSBicmlkZ2UgYW5kIHRyeWluZyANCnRvIGNvbnZlcnQgdGhl
IE5YUCBTRUMgRFNJTSBob3N0IGRyaXZlciB0byBhIGJyaWRnZSBkcml2ZXIuDQoNClRoZSBOV0wg
ZHJpdmVyIHVzZXMgbWlwaV9kc2lfaG9zdF9yZWdpc3RlcigpLCB3aGljaCBzZWFyY2hlcyBmb3Ig
YSANCm91dHB1dCAocGFuZWwpIGNoaWxkIG5vZGUgdW5kZXIgdGhlIERTSSBicmlkZ2UncyBub2Rl
IFsxXSBhcyBkZXNjcmliZWQgDQppbiB0aGUgYmluZGluZ3MgZXhhbXBsZSBbMl0uDQoNCkhvdyBp
cyB0aGlzIHN1cHBvc2VkIHRvIHdvcmsgaW4gYSBzZXR1cCB3aXRoIGFub3RoZXIgYnJpZGdlIGFm
dGVyIHRoZSANCkRTSSBicmlkZ2UsIHdoZXJlIHRoYXQgYnJpZGdlIGlzIG5vdCBhIGNoaWxkIG5v
ZGUgb2YgdGhlIERTSSBicmlkZ2UsIGJ1dCANCm9ubHkgY29ubmVjdGVkIHZpYSB0aGUgRFNJIGJy
aWRnZXMgb3V0cHV0IHBvcnQ/IEZvciBleGFtcGxlIEkgaGF2ZSBhIA0KRFNJLT5MVkRTIGJyaWRn
ZSwgdGhhdCBpcyBhdHRhY2hlZCB0byBhbiBJMkMgcG9ydC4NCg0KWzFdIA0KaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX21p
cGlfZHNpLmMjTDI4NA0KDQpbMl0gDQpodHRwczovL3NvdXJjZS5wdXJpLnNtL2d1aWRvLmd1bnRo
ZXIvbGludXgtaW14OC9ibG9iL2ZvcndhcmQtdXBzdHJlYW0vbmV4dC0yMDIwMDIyNi9teHNmYitu
d2wvdjktd2lwL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9ud2wtZHNpLnlhbWwjTDE3Mw0KDQpUaGFua3MsDQpGcmllZGVyCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2
aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZXRuYXZpdgo=
