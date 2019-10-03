Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 880ADC9AA1
	for <lists+etnaviv@lfdr.de>; Thu,  3 Oct 2019 11:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC366E988;
	Thu,  3 Oct 2019 09:18:11 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5D789A4A
 for <etnaviv@lists.freedesktop.org>; Thu,  3 Oct 2019 05:35:03 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x935Vdd1025225
 for <etnaviv@lists.freedesktop.org>; Thu, 3 Oct 2019 01:35:01 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vd87ebt79-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <etnaviv@lists.freedesktop.org>; Thu, 03 Oct 2019 01:35:01 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <etnaviv@lists.freedesktop.org> from <rppt@linux.ibm.com>;
 Thu, 3 Oct 2019 06:35:00 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 3 Oct 2019 06:34:55 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x935YPRR34603498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 05:34:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA6CD11C04A;
 Thu,  3 Oct 2019 05:34:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B844211C050;
 Thu,  3 Oct 2019 05:34:53 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.8.153])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Oct 2019 05:34:53 +0000 (GMT)
Date: Thu, 3 Oct 2019 08:34:52 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
References: <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
 <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
 <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
 <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
 <20191002073605.GA30433@linux.ibm.com>
 <CAHCN7xL1MkJh44N3W_1+08DHmX__SqnfH6dqUzYzr2Wpg0kQyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCN7xL1MkJh44N3W_1+08DHmX__SqnfH6dqUzYzr2Wpg0kQyQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19100305-0016-0000-0000-000002B38CC0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100305-0017-0000-0000-00003314947D
Message-Id: <20191003053451.GA23397@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030053
X-Mailman-Approved-At: Thu, 03 Oct 2019 09:18:09 +0000
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
 Russell King <linux@armlinux.org.uk>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, Fabio Estevam <festevam@gmail.com>,
 Christoph Hellwig <hch@lst.de>, arm-soc <linux-arm-kernel@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

KHRyaW1tZWQgdGhlIENDKQoKT24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDY6MTQ6MTFBTSAtMDUw
MCwgQWRhbSBGb3JkIHdyb3RlOgo+IE9uIFdlZCwgT2N0IDIsIDIwMTkgYXQgMjozNiBBTSBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+IHdyb3RlOgo+ID4KPiAKPiBCZWZvcmUgdGhl
IHBhdGNoOgo+IAo+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVnL21lbWJsb2NrL21lbW9yeQo+ICAg
IDA6IDB4MTAwMDAwMDAuLjB4OGZmZmZmZmYKPiAjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1i
bG9jay9yZXNlcnZlZAo+ICAgIDA6IDB4MTAwMDQwMDAuLjB4MTAwMDdmZmYKPiAgIDM0OiAweDJm
ZmZmZjg4Li4weDNmZmZmZmZmCj4gCj4gCj4gQWZ0ZXIgdGhlIHBhdGNoOgo+ICMgY2F0IC9zeXMv
a2VybmVsL2RlYnVnL21lbWJsb2NrL21lbW9yeQo+ICAgIDA6IDB4MTAwMDAwMDAuLjB4OGZmZmZm
ZmYKPiAjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1ibG9jay9yZXNlcnZlZAo+ICAgIDA6IDB4
MTAwMDQwMDAuLjB4MTAwMDdmZmYKPiAgIDM2OiAweDgwMDAwMDAwLi4weDhmZmZmZmZmCgpJJ20g
c3RpbGwgbm90IGNvbnZpbmNlZCB0aGF0IHRoZSBtZW1ibG9jayByZWZhY3RvcmluZyBkaWRuJ3Qg
dW5jb3ZlcmVkIGFuCmlzc3VlIGluIGV0bmF2aXYgZHJpdmVyLgoKV2h5IG1vdmluZyB0aGUgQ01B
IGFyZWEgZnJvbSAweDgwMDAwMDAwIHRvIDB4MzAwMDAwMDAgbWFrZXMgaXQgZmFpbD8KCkJUVywg
dGhlIGNvZGUgdGhhdCBjb21wbGFpbmVkIGFib3V0ICJjb21tYW5kIGJ1ZmZlciBvdXRzaWRlIHZh
bGlkIG1lbW9yeQp3aW5kb3ciIGhhcyBiZWVuIHJlbW92ZWQgYnkgdGhlIGNvbW1pdCAxN2U0NjYw
YWUzZDcgKCJkcm0vZXRuYXZpdjoKaW1wbGVtZW50IHBlci1wcm9jZXNzIGFkZHJlc3Mgc3BhY2Vz
IG9uIE1NVXYyIikuIAoKQ291bGQgYmUgdGhhdCByZWNlbnQgY2hhbmdlcyB0byBNTVUgbWFuYWdl
bWVudCBvZiBldG5hdml2IHJlc29sdmUgdGhlCmlzc3VlPwoKPiA+IEZyb20gMDY1MjlmODYxNzcy
YjdkZWEyOTEyZmMyMjQ1ZGViZTQ2OTAxMzliOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiA+
IEZyb206IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiA+IERhdGU6IFdlZCwg
MiBPY3QgMjAxOSAxMDoxNDoxNyArMDMwMAo+ID4gU3ViamVjdDogW1BBVENIXSBtbTogbWVtYmxv
Y2s6IGRvIG5vdCBlbmZvcmNlIGN1cnJlbnQgbGltaXQgZm9yIG1lbWJsb2NrX3BoeXMqCj4gPiAg
ZmFtaWx5Cj4gPgo+ID4gVW50aWwgY29tbWl0IDkyZDEyZjk1NDRiNyAoIm1lbWJsb2NrOiByZWZh
Y3RvciBpbnRlcm5hbCBhbGxvY2F0aW9uCj4gPiBmdW5jdGlvbnMiKSB0aGUgbWF4aW1hbCBhZGRy
ZXNzIGZvciBtZW1ibG9jayBhbGxvY2F0aW9ucyB3YXMgZm9yY2VkIHRvCj4gPiBtZW1ibG9jay5j
dXJyZW50X2xpbWl0IG9ubHkgZm9yIHRoZSBhbGxvY2F0aW9uIGZ1bmN0aW9ucyByZXR1cm5pbmcg
dmlydHVhbAo+ID4gYWRkcmVzcy4gVGhlIGNoYW5nZXMgaW50cm9kdWNlZCBieSB0aGF0IGNvbW1p
dCBtb3ZlZCB0aGUgbGltaXQgZW5mb3JjZW1lbnQKPiA+IGludG8gdGhlIGFsbG9jYXRpb24gY29y
ZSBhbmQgYXMgYSByZXN1bHQgdGhlIGFsbG9jYXRpb24gZnVuY3Rpb25zIHJldHVybmluZwo+ID4g
cGh5c2ljYWwgYWRkcmVzcyBhbHNvIHN0YXJ0ZWQgdG8gbGltaXQgYWxsb2NhdGlvbnMgdG8KPiA+
IG1lbWJsb2NrLmN1cnJlbnRfbGltaXQuCj4gPgo+ID4gVGhpcyBjYXVzZWQgYnJlYWthZ2Ugb2Yg
ZXRuYXZpdiBHUFUgZHJpdmVyOgo+ID4KPiA+IFsgICAgMy42ODIzNDddIGV0bmF2aXYgZXRuYXZp
djogYm91bmQgMTMwMDAwLmdwdSAob3BzIGdwdV9vcHMpCj4gPiBbICAgIDMuNjg4NjY5XSBldG5h
dml2IGV0bmF2aXY6IGJvdW5kIDEzNDAwMC5ncHUgKG9wcyBncHVfb3BzKQo+ID4gWyAgICAzLjY5
NTA5OV0gZXRuYXZpdiBldG5hdml2OiBib3VuZCAyMjA0MDAwLmdwdSAob3BzIGdwdV9vcHMpCj4g
PiBbICAgIDMuNzAwODAwXSBldG5hdml2LWdwdSAxMzAwMDAuZ3B1OiBtb2RlbDogR0MyMDAwLCBy
ZXZpc2lvbjogNTEwOAo+ID4gWyAgICAzLjcyMzAxM10gZXRuYXZpdi1ncHUgMTMwMDAwLmdwdTog
Y29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+ID4gbWVtb3J5IHdpbmRvdwo+ID4gWyAgICAz
LjczMTMwOF0gZXRuYXZpdi1ncHUgMTM0MDAwLmdwdTogbW9kZWw6IEdDMzIwLCByZXZpc2lvbjog
NTAwNwo+ID4gWyAgICAzLjc1MjQzN10gZXRuYXZpdi1ncHUgMTM0MDAwLmdwdTogY29tbWFuZCBi
dWZmZXIgb3V0c2lkZSB2YWxpZAo+ID4gbWVtb3J5IHdpbmRvdwo+ID4gWyAgICAzLjc2MDU4M10g
ZXRuYXZpdi1ncHUgMjIwNDAwMC5ncHU6IG1vZGVsOiBHQzM1NSwgcmV2aXNpb246IDEyMTUKPiA+
IFsgICAgMy43NjY3NjZdIGV0bmF2aXYtZ3B1IDIyMDQwMDAuZ3B1OiBJZ25vcmluZyBHUFUgd2l0
aCBWRyBhbmQgRkUyLjAKPiA+Cj4gPiBSZXN0b3JlIHRoZSBiZWhhdmlvdXIgb2YgbWVtYmxvY2tf
cGh5cyogZmFtaWx5IHNvIHRoYXQgdGhlc2UgZnVuY3Rpb25zIHdpbGwKPiA+IG5vdCBlbmZvcmNl
IG1lbWJsb2NrLmN1cnJlbnRfbGltaXQuCj4gPgo+IAo+IFRoaXMgZml4ZWQgdGhlIGlzc3VlLiAg
VGhhbmsgeW91Cj4gCj4gVGVzdGVkLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4g
I2lteDZxLWxvZ2ljcGQKPiAKPiA+IEZpeGVzOiA5MmQxMmY5NTQ0YjcgKCJtZW1ibG9jazogcmVm
YWN0b3IgaW50ZXJuYWwgYWxsb2NhdGlvbiBmdW5jdGlvbnMiKQo+ID4gUmVwb3J0ZWQtYnk6IEFk
YW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gLS0tCj4gPiAgbW0vbWVtYmxvY2suYyB8IDYg
KysrLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbW0vbWVtYmxvY2suYyBiL21tL21lbWJsb2NrLmMKPiA+
IGluZGV4IDdkNGY2MWEuLmM0YjE2Y2EgMTAwNjQ0Cj4gPiAtLS0gYS9tbS9tZW1ibG9jay5jCj4g
PiArKysgYi9tbS9tZW1ibG9jay5jCj4gPiBAQCAtMTM1Niw5ICsxMzU2LDYgQEAgc3RhdGljIHBo
eXNfYWRkcl90IF9faW5pdCBtZW1ibG9ja19hbGxvY19yYW5nZV9uaWQocGh5c19hZGRyX3Qgc2l6
ZSwKPiA+ICAgICAgICAgICAgICAgICBhbGlnbiA9IFNNUF9DQUNIRV9CWVRFUzsKPiA+ICAgICAg
ICAgfQo+ID4KPiA+IC0gICAgICAgaWYgKGVuZCA+IG1lbWJsb2NrLmN1cnJlbnRfbGltaXQpCj4g
PiAtICAgICAgICAgICAgICAgZW5kID0gbWVtYmxvY2suY3VycmVudF9saW1pdDsKPiA+IC0KPiA+
ICBhZ2FpbjoKPiA+ICAgICAgICAgZm91bmQgPSBtZW1ibG9ja19maW5kX2luX3JhbmdlX25vZGUo
c2l6ZSwgYWxpZ24sIHN0YXJ0LCBlbmQsIG5pZCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZmxhZ3MpOwo+ID4gQEAgLTE0NjksNiArMTQ2Niw5IEBAIHN0
YXRpYyB2b2lkICogX19pbml0IG1lbWJsb2NrX2FsbG9jX2ludGVybmFsKAo+ID4gICAgICAgICBp
ZiAoV0FSTl9PTl9PTkNFKHNsYWJfaXNfYXZhaWxhYmxlKCkpKQo+ID4gICAgICAgICAgICAgICAg
IHJldHVybiBremFsbG9jX25vZGUoc2l6ZSwgR0ZQX05PV0FJVCwgbmlkKTsKPiA+Cj4gPiArICAg
ICAgIGlmIChtYXhfYWRkciA+IG1lbWJsb2NrLmN1cnJlbnRfbGltaXQpCj4gPiArICAgICAgICAg
ICAgICAgbWF4X2FkZHIgPSBtZW1ibG9jay5jdXJyZW50X2xpbWl0Owo+ID4gKwo+ID4gICAgICAg
ICBhbGxvYyA9IG1lbWJsb2NrX2FsbG9jX3JhbmdlX25pZChzaXplLCBhbGlnbiwgbWluX2FkZHIs
IG1heF9hZGRyLCBuaWQpOwo+ID4KPiA+ICAgICAgICAgLyogcmV0cnkgYWxsb2NhdGlvbiB3aXRo
b3V0IGxvd2VyIGxpbWl0ICovCj4gPiAtLQo+ID4gMi43LjQKPiA+Cj4gPgo+ID4gPiA+IGFkYW0K
PiA+ID4gPgo+ID4gPiA+IE9uIFNhdCwgU2VwIDI4LCAyMDE5IGF0IDI6MzMgQU0gTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBU
aHUsIFNlcCAyNiwgMjAxOSBhdCAwMjozNTo1M1BNIC0wNTAwLCBBZGFtIEZvcmQgd3JvdGU6Cj4g
PiA+ID4gPiA+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDExOjA0IEFNIE1pa2UgUmFwb3BvcnQg
PHJwcHRAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBI
aSwKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDA4
OjA5OjUyQU0gLTA1MDAsIEFkYW0gRm9yZCB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IE9uIFdlZCwg
U2VwIDI1LCAyMDE5IGF0IDEwOjE3IEFNIEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IE9uIFdlZCwgU2Vw
IDI1LCAyMDE5IGF0IDk6MTcgQU0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+IEkgdHJpZWQgY21hPTI1Nk0g
YW5kIG5vdGljZWQgdGhlIGNtYSBkdW1wIGF0IHRoZSBiZWdpbm5pbmcgZGlkbid0Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gY2hhbmdlLiAgRG8gd2UgbmVlZCB0byBzZXR1cCBhIHJlc2VydmVkLW1lbW9y
eSBub2RlIGxpa2UKPiA+ID4gPiA+ID4gPiA+ID4gPiBpbXg2dWwtY2NpbXg2dWxzb20uZHRzaSBk
aWQ/Cj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IEkgZG9uJ3QgdGhpbmsgc28u
Cj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IFdlcmUgeW91IGFibGUgdG8gaWRl
bnRpZnkgd2hhdCB3YXMgdGhlIGV4YWN0IGNvbW1pdCB0aGF0IGNhdXNlZCBzdWNoIHJlZ3Jlc3Np
b24/Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSSB3YXMgYWJsZSB0byBuYXJyb3cg
aXQgZG93biB0aGUgOTJkMTJmOTU0NGI3ICgibWVtYmxvY2s6IHJlZmFjdG9yCj4gPiA+ID4gPiA+
ID4gPiBpbnRlcm5hbCBhbGxvY2F0aW9uIGZ1bmN0aW9ucyIpIHRoYXQgY2F1c2VkIHRoZSByZWdy
ZXNzaW9uIHdpdGgKPiA+ID4gPiA+ID4gPiA+IEV0bmF2aXYuCj4gPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+IENhbiB5b3UgcGxlYXNlIHRlc3Qgd2l0aCB0aGlzIGNoYW5n
ZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGF0IGFwcGVhcnMgdG8g
aGF2ZSBmaXhlZCBteSBpc3N1ZS4gIEkgYW0gbm90IHN1cmUgd2hhdCB0aGUgaW1wYWN0Cj4gPiA+
ID4gPiA+IGlzLCBidXQgaXMgdGhpcyBhIHNhZmUgb3B0aW9uPwo+ID4gPiA+ID4KPiA+ID4gPiA+
IEl0J3Mgbm90IHJlYWxseSBhIGZpeCwgSSBqdXN0IHdhbnRlZCB0byBzZWUgaG93IGV4YWN0bHkg
OTJkMTJmOTU0NGI3ICgibWVtYmxvY2s6Cj4gPiA+ID4gPiByZWZhY3RvciBpbnRlcm5hbCBhbGxv
Y2F0aW9uIGZ1bmN0aW9ucyIpIGJyb2tlIHlvdXIgc2V0dXAuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
Q2FuIHlvdSBzaGFyZSB0aGUgZHRzIHlvdSBhcmUgdXNpbmcgYW5kIHRoZSBmdWxsIGtlcm5lbCBs
b2c/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPiBhZGFtCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
ZGlmZiAtLWdpdCBhL21tL21lbWJsb2NrLmMgYi9tbS9tZW1ibG9jay5jCj4gPiA+ID4gPiA+ID4g
aW5kZXggN2Q0ZjYxYS4uMWY1YTBlYiAxMDA2NDQKPiA+ID4gPiA+ID4gPiAtLS0gYS9tbS9tZW1i
bG9jay5jCj4gPiA+ID4gPiA+ID4gKysrIGIvbW0vbWVtYmxvY2suYwo+ID4gPiA+ID4gPiA+IEBA
IC0xMzU2LDkgKzEzNTYsNiBAQCBzdGF0aWMgcGh5c19hZGRyX3QgX19pbml0IG1lbWJsb2NrX2Fs
bG9jX3JhbmdlX25pZChwaHlzX2FkZHJfdCBzaXplLAo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICBhbGlnbiA9IFNNUF9DQUNIRV9CWVRFUzsKPiA+ID4gPiA+ID4gPiAgICAgICAgIH0KPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IC0gICAgICAgaWYgKGVuZCA+IG1lbWJsb2NrLmN1cnJl
bnRfbGltaXQpCj4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGVuZCA9IG1lbWJsb2NrLmN1
cnJlbnRfbGltaXQ7Cj4gPiA+ID4gPiA+ID4gLQo+ID4gPiA+ID4gPiA+ICBhZ2FpbjoKPiA+ID4g
PiA+ID4gPiAgICAgICAgIGZvdW5kID0gbWVtYmxvY2tfZmluZF9pbl9yYW5nZV9ub2RlKHNpemUs
IGFsaWduLCBzdGFydCwgZW5kLCBuaWQsCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFncyk7Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+IEkgYWxzbyBub3RpY2VkIHRoYXQgaWYgSSBjcmVhdGUgYSByZXNlcnZlZCBtZW1vcnkg
bm9kZSBhcyB3YXMgZG9uZSBvbmUKPiA+ID4gPiA+ID4gPiA+IGlteDZ1bC1jY2lteDZ1bHNvbS5k
dHNpIHRoZSAzRCBzZWVtcyB0byB3b3JrIGFnYWluLCBidXQgd2l0aG91dCBpdCwgSQo+ID4gPiA+
ID4gPiA+ID4gd2FzIGdldHRpbmcgZXJyb3JzIHJlZ2FyZGxlc3Mgb2YgdGhlICdjbWE9MjU2TScg
b3Igbm90Lgo+ID4gPiA+ID4gPiA+ID4gSSBkb24ndCBoYXZlIGEgcHJvYmxlbSB1c2luZyB0aGUg
cmVzZXJ2ZWQgbWVtb3J5LCBidXQgSSBndWVzcyBJIGFtIG5vdAo+ID4gPiA+ID4gPiA+ID4gc3Vy
ZSB3aGF0IHRoZSBhbW91bnQgc2hvdWxkIGJlLiAgSSBrbm93IGZvciB0aGUgdmlkZW8gZGVjb2Rp
bmcgMTA4MHAsCj4gPiA+ID4gPiA+ID4gPiBJIGhhdmUgaGlzdG9yaWNhbGx5IHVzZWQgY21hPTEy
OE0sIGJ1dCB3aXRoIHRoZSAzRCBhbHNvIG5lZWRpbmcgc29tZQo+ID4gPiA+ID4gPiA+ID4gbWVt
b3J5IGFsbG9jYXRpb24sIGlzIHRoYXQgZW5vdWdoIG9yIHNob3VsZCBJIHVzZSAyNTZNPwo+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IGFkYW0KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+IC0tCj4gPiA+ID4gPiA+ID4gU2luY2VyZWx5IHlvdXJzLAo+ID4gPiA+ID4gPiA+IE1pa2Uu
Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gU2luY2VyZWx5
IHlvdXJzLAo+ID4gPiA+ID4gTWlrZS4KPiA+ID4gPiA+Cj4gPgo+ID4gLS0KPiA+IFNpbmNlcmVs
eSB5b3VycywKPiA+IE1pa2UuCj4gPgoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGlu
ZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
