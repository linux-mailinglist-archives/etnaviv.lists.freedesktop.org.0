Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7F9ECA9C
	for <lists+etnaviv@lfdr.de>; Wed, 11 Dec 2024 11:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF56910EAFD;
	Wed, 11 Dec 2024 10:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=thalesgroup.com header.i=@thalesgroup.com header.b="KrAmvRom";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2024 11:29:24 UTC
Received: from esa.hc1631-21.eu.iphmx.com (esa.hc1631-21.eu.iphmx.com
 [23.90.122.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FCC10E392;
 Tue, 10 Dec 2024 11:29:24 +0000 (UTC)
X-CSE-ConnectionGUID: mm7L2xXGS1+UGL18Rl/nPg==
X-CSE-MsgGUID: E7Wxi3t/RLCauSB9w7/CxA==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com;
 dkim=pass (signature verified)
 header.i=@thalesgroup.com
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="23725432"
X-IronPort-AV: E=Sophos;i="6.12,222,1728943200"; d="scan'208";a="23725432"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
 t=1733829733; h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S/YyVtQLmdpqtckWDaMwxN5YP/o6z8wN877vJhlVBSc=;
 b=KrAmvRomPlRQnCK57Dkrs1fOjWjLeb4vFWD0FW8xNT5EjCXSnOCvZAuh
 JhKy/ulGhC616Ia1Hi1yEcVrAymIxKWbjOveXPqaa1xFOpgUZJwbERIyO
 7REs+pOl/k1mWWwymzMSCMcqq15dl6zwn8SDqUIptnQuNrTeAQ24yck7f
 38vWP1fETBWr5gJHMBxTmXBMaEEDwLJoOHYMDFXzopHiaqpDfPaW2Ipzz
 g8PVdo7G1ahr28T1PZWooP45qOKkE4DJQ/LDCgZ5MkHQQJVwJUWZmtG/+
 DDOJOOWEqATepgkKa9QD1QY/l0Di1djdwGEXXSndTLHyZa8WnkCG1OKiF g==;
X-CSE-ConnectionGUID: H6/gb1exQX+LT9k2sSNn1w==
X-CSE-MsgGUID: bM4NmUq8QgyxpYlWhowH+Q==
X-CSE-ConnectionGUID: +tPwVq7oSFinuG1Qbri6SQ==
X-CSE-MsgGUID: oJ4zsBYOQbqr69Pc1YqBYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="36849826"
X-IronPort-AV: E=Sophos;i="6.12,222,1728943200"; d="scan'208";a="36849826"
From: LENAIN Simon <simon.lenain@thalesgroup.com>
To: Lucas Stach <l.stach@pengutronix.de>, LECOINTRE Philippe
 <philippe.lecointre@thalesgroup.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "BARBEAU
 Etienne" <etienne.barbeau@thalesgroup.com>, LEJEUNE Sebastien
 <sebastien.lejeune@thalesgroup.com>
Subject: RE: [PATCH v3] drm/etnaviv: add optional reset support
Thread-Topic: [PATCH v3] drm/etnaviv: add optional reset support
Thread-Index: AdtIAAvrmB6eEfCxSuiZypoaKXF8JgCGZ06AADbStYA=
Date: Tue, 10 Dec 2024 11:22:11 +0000
Message-ID: <bb25f10e701946b1bc44c9eaae8426d6@thalesgroup.com>
References: <afcb562602e54c969964a608e3b6494a@thalesgroup.com>
 <3fa8279a44649ed9a893e88f1a9c562349a9d393.camel@pengutronix.de>
In-Reply-To: <3fa8279a44649ed9a893e88f1a9c562349a9d393.camel@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-nodisclaimer: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Dec 2024 10:49:26 +0000
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgTHVjYXMsDQoNCj4gLS0tLS1NZXNzYWdlIGQnb3JpZ2luZS0tLS0tDQo+IERlwqA6IEx1Y2Fz
IFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPg0KPiBFbnZvecOpwqA6IGx1bmRpIDkgZMOp
Y2VtYnJlIDIwMjQgMTE6MDcNCj4gw4DCoDogTEVDT0lOVFJFIFBoaWxpcHBlIDxwaGlsaXBwZS5s
ZWNvaW50cmVAdGhhbGVzZ3JvdXAuY29tPjsgUnVzc2VsbCBLaW5nDQo+IDxsaW51eCtldG5hdml2
QGFybWxpbnV4Lm9yZy51az47IENocmlzdGlhbiBHbWVpbmVyDQo+IDxjaHJpc3RpYW4uZ21laW5l
ckBnbWFpbC5jb20+DQo+IENjwqA6IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBT
aW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+Ow0KPiBldG5hdml2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtDQo+IGtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IExFTkFJTiBTaW1vbiA8c2ltb24ubGVuYWluQHRoYWxlc2dyb3Vw
LmNvbT47DQo+IEJBUkJFQVUgRXRpZW5uZSA8ZXRpZW5uZS5iYXJiZWF1QHRoYWxlc2dyb3VwLmNv
bT47IExFSkVVTkUgU2ViYXN0aWVuDQo+IDxzZWJhc3RpZW4ubGVqZXVuZUB0aGFsZXNncm91cC5j
b20+DQo+IE9iamV0wqA6IFJlOiBbUEFUQ0ggdjNdIGRybS9ldG5hdml2OiBhZGQgb3B0aW9uYWwg
cmVzZXQgc3VwcG9ydA0KPiANCj4gSGkgUGhpbGlwcGUsDQo+IA0KPiBBbSBGcmVpdGFnLCBkZW0g
MDYuMTIuMjAyNCB1bSAxNzowMCArMDAwMCBzY2hyaWViIExFQ09JTlRSRSBQaGlsaXBwZToNCj4g
PiBBZGQgb3B0aW9uYWwgcmVzZXQgc3VwcG9ydCB3aGljaCBpcyBtZW50aW9uZWQgaW4gdml2YW50
ZSxnYy55YW1sIHRvDQo+ID4gYWxsb3cgdGhlIGRyaXZlciB0byB3b3JrIG9uIFNvQ3Mgd2hvc2Ug
cmVzZXQgc2lnbmFsIGlzIGFzc2VydGVkIGJ5DQo+ID4gZGVmYXVsdA0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogUGhpbGlwcGUgTGVjb2ludHJlIDxwaGlsaXBwZS5sZWNvaW50cmVAdGhhbGVzZ3Jv
dXAuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBTaW1vbiBMZW5haW4gPHNpbW9uLmxlbmFpbkB0aGFs
ZXNncm91cC5jb20+DQo+IA0KPiBVcHN0cmVhbSB1c3VhbGx5IGRvZXNuJ3QgcHV0IG11Y2ggd2Vp
Z2h0IG9uIHN1Y2ggaW50ZXJuYWwgcmV2aWV3cy4gTm8NCj4gaGFybSBoZXJlLCBhcyB0aGUgcGF0
Y2ggaXMgc2ltcGxlIGVub3VnaCBhbmQgSSBkbyByZXZpZXcgaXQgYmVmb3JlIGFwcGx5aW5nLg0K
PiBKdXN0IGFzIGEgaGludCBmb3IgdGhlIGZ1dHVyZTogaWYgeW91IHdhbnQgbWFpbnRhaW5lcnMg
dG8gdGFrZSBzdWNoIHJldmlld3MgaW50bw0KPiBhY2NvdW50IGZvciBzcGVlZGluZyB1cCB0aGUg
YWRvcHRpb24gb2YgYSBwYXRjaCwgZG8gdGhlIHJldmlldyBvbiB0aGUgcHVibGljDQo+IG1haWxp
bmcgbGlzdHMuDQo+IA0KDQpEbyB5b3UgdGhpbmsgYW4gIkFja2VkLWJ5OiIgaXMgYmV0dGVyIGZv
ciBvdXIgaW50ZXJuYWwgcmV2aWV3ID8NClJlZ2FyZHMsDQpTaW1vbg0KDQo+ID4gLS0tDQo+ID4g
djM6DQo+ID4gLSBSZXdvcmsgdG8gbWF0Y2ggaW5pdGlhbCBmZWVkYmFjaw0KPiA+IC0tLQ0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jIHwgMzcNCj4gPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9n
cHUuaCB8DQo+ID4gMSArDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1
LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMNCj4gPiBpbmRl
eCAyZDRjMTEyY2UwMzMuLjE5NjFlYmFjMzE1YSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9ncHUuYw0KPiA+IEBAIC0xMyw2ICsxMyw3IEBADQo+ID4gICNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRp
bWUuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPg0KPiA+ICsj
aW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3RoZXJtYWwuaD4N
Cj4gPg0KPiA+ICAjaW5jbHVkZSAiZXRuYXZpdl9jbWRidWYuaCINCj4gPiBAQCAtMTcyLDYgKzE3
MywyNSBAQCBpbnQgZXRuYXZpdl9ncHVfZ2V0X3BhcmFtKHN0cnVjdCBldG5hdml2X2dwdQ0KPiAq
Z3B1LCB1MzIgcGFyYW0sIHU2NCAqdmFsdWUpDQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+
DQo+ID4gK3N0YXRpYyBpbnQgZXRuYXZpdl9ncHVfcmVzZXRfZGVhc3NlcnQoc3RydWN0IGV0bmF2
aXZfZ3B1ICpncHUpIHsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJLyogMzIgY29yZSBj
bG9jayBjeWNsZXMgKHNsb3dlc3QgY2xvY2spIHJlcXVpcmVkIGJlZm9yZSBkZWFzc2VydGlvbiAq
Lw0KPiA+ICsJLyogMSBtaWNyb3NlY29uZCBtaWdodCBtYXRjaCBhbGwgaW1wbGVtZW50YXRpb25z
IHdpdGhvdXQNCj4gY29tcHV0YXRpb24NCj4gPiArKi8NCj4gDQo+IEkgbWlzc2VkIHRvIG1lbnRp
b24gdGhpcyBiZWZvcmUsIGFzIEkgd2FzIGZvY3VzZWQgb24gdGhlIHRlY2huaWNhbA0KPiBzaWRl
OiB0aGlzIGlzIG5vdCB0aGUgbXVsdGlsaW5lIGNvbW1lbnQgc3R5bGUgdXNlZCBpbiB0aGUga2Vy
bmVsL2V0bmF2aXYuDQo+IFBsZWFzZSB1c2UgdGhlIHNhbWUgc3R5bGUgYXMgYWxyZWFkeSBmb3Vu
ZCBpbiB0aGlzIGZpbGUuDQo+IA0KPiA+ICsJdXNsZWVwX3JhbmdlKDEsIDIpOw0KPiA+ICsNCj4g
PiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoZ3B1LT5yc3QpOw0KPiA+ICsJaWYgKHJl
dCkNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArCS8qIDEyOCBjb3JlIGNsb2NrIGN5
Y2xlcyAoc2xvd2VzdCBjbG9jaykgcmVxdWlyZWQgYmVmb3JlIGFueSBhY3Rpdml0eQ0KPiBvbiBB
SEIgKi8NCj4gPiArCS8qIDEgbWljcm9zZWNvbmQgbWlnaHQgbWF0Y2ggYWxsIGltcGxlbWVudGF0
aW9ucyB3aXRob3V0DQo+IGNvbXB1dGF0aW9uICovDQo+ID4gKwl1c2xlZXBfcmFuZ2UoMSwgMik7
DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBpbmxp
bmUgYm9vbCBldG5hdml2X2lzX21vZGVsX3JldihzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwgdTMy
DQo+ID4gbW9kZWwsIHUzMiByZXZpc2lvbikgIHsNCj4gPiAgCXJldHVybiBncHUtPmlkZW50aXR5
Lm1vZGVsID09IG1vZGVsICYmIEBAIC03OTksNiArODE5LDEyIEBAIGludA0KPiA+IGV0bmF2aXZf
Z3B1X2luaXQoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpDQo+ID4gIAkJZ290byBwbV9wdXQ7DQo+
ID4gIAl9DQo+ID4NCj4gPiArCXJldCA9IGV0bmF2aXZfZ3B1X3Jlc2V0X2RlYXNzZXJ0KGdwdSk7
DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJZGV2X2VycihncHUtPmRldiwgIkdQVSByZXNldCBk
ZWFzc2VydCBmYWlsZWRcbiIpOw0KPiA+ICsJCWdvdG8gZmFpbDsNCj4gPiArCX0NCj4gPiArDQo+
ID4gIAlldG5hdml2X2h3X2lkZW50aWZ5KGdwdSk7DQo+ID4NCj4gPiAgCWlmIChncHUtPmlkZW50
aXR5Lm1vZGVsID09IDApIHsNCj4gPiBAQCAtMTg2MCw2ICsxODg2LDE3IEBAIHN0YXRpYyBpbnQg
ZXRuYXZpdl9ncHVfcGxhdGZvcm1fcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gPiAgCWlmIChJU19FUlIoZ3B1LT5tbWlvKSkNCj4gPiAgCQlyZXR1cm4gUFRSX0VSUihn
cHUtPm1taW8pOw0KPiA+DQo+ID4gKw0KPiA+ICsJLyogR2V0IFJlc2V0OiAqLw0KPiA+ICsJZ3B1
LT5yc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2ZSgmcGRldi0N
Cj4gPmRldiwgTlVMTCk7DQo+ID4gKwlpZiAoSVNfRVJSKGdwdS0+cnN0KSkNCj4gPiArCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoZ3B1LT5yc3QpLA0KPiA+ICsJCQkJICAgICAi
ZmFpbGVkIHRvIGdldCByZXNldFxuIik7DQo+ID4gKw0KPiA+ICsJZXJyID0gcmVzZXRfY29udHJv
bF9hc3NlcnQoZ3B1LT5yc3QpOw0KPiA+ICsJaWYgKGVycikNCj4gPiArCQlyZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIGVyciwgImZhaWxlZCB0byBhc3NlcnQgcmVzZXRcbiIpOw0KPiA+ICsNCj4g
PiAgCS8qIEdldCBJbnRlcnJ1cHQ6ICovDQo+ID4gIAlncHUtPmlycSA9IHBsYXRmb3JtX2dldF9p
cnEocGRldiwgMCk7DQo+ID4gIAlpZiAoZ3B1LT5pcnEgPCAwKQ0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5oDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vZXRuYXZpdi9ldG5hdml2X2dwdS5oDQo+ID4gaW5kZXggNGQ4YTdkNDhhZGUzLi4wOTg1ZWE1
NDhiODIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9n
cHUuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmgNCj4g
PiBAQCAtMTU4LDYgKzE1OCw3IEBAIHN0cnVjdCBldG5hdml2X2dwdSB7DQo+ID4gIAlzdHJ1Y3Qg
Y2xrICpjbGtfcmVnOw0KPiA+ICAJc3RydWN0IGNsayAqY2xrX2NvcmU7DQo+ID4gIAlzdHJ1Y3Qg
Y2xrICpjbGtfc2hhZGVyOw0KPiA+ICsJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdDsNCj4gDQo+
IFRoaXMgbmVlZHMgYSBmb3J3YXJkIGRlY2xhcmF0aW9uIG9mIHN0cnVjdCByZXNldF9jb250cm9s
IGluIHRoZSBoZWFkZXIsIHRvDQo+IGF2b2lkIGJ1aWxkIGZhaWx1cmVzIGlmIGhlYWRlcnMgYXJl
IGluY2x1ZGVkIGluIGEgZGlmZmVyZW50IG9yZGVyLg0KPiBQbGVhc2UgcHV0IHRoZW0gcmlnaHQg
bmV4dCB0byB0aGUgZXhpc3Rpbmcgb25lcyBmb3IgcmVndWxhdG9yIGFuZCBjbGsuDQo+IA0KPiBP
dGhlciB0aGFuIHRoYXQsIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuDQo+IA0KPiBSZWdhcmRzLA0K
PiBMdWNhcw0KPiANCj4gPg0KPiA+ICAJdW5zaWduZWQgaW50IGZyZXFfc2NhbGU7DQo+ID4gIAl1
bnNpZ25lZCBpbnQgZmVfd2FpdGN5Y2xlczsNCg0K
