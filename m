Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D060BCA06F
	for <lists+etnaviv@lfdr.de>; Thu,  3 Oct 2019 16:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC0A6E9FC;
	Thu,  3 Oct 2019 14:36:03 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E52E6E10A
 for <etnaviv@lists.freedesktop.org>; Thu,  3 Oct 2019 11:30:22 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x93BRXY9041254
 for <etnaviv@lists.freedesktop.org>; Thu, 3 Oct 2019 07:30:21 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vdf5wsvvn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <etnaviv@lists.freedesktop.org>; Thu, 03 Oct 2019 07:30:20 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <etnaviv@lists.freedesktop.org> from <rppt@linux.ibm.com>;
 Thu, 3 Oct 2019 12:30:18 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 3 Oct 2019 12:30:14 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x93BUDku57016436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 11:30:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F81A11C058;
 Thu,  3 Oct 2019 11:30:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FA8511C052;
 Thu,  3 Oct 2019 11:30:12 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.8.153])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Oct 2019 11:30:12 +0000 (GMT)
Date: Thu, 3 Oct 2019 14:30:10 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 00/21] Refine memblock API
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003084914.GV25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19100311-0012-0000-0000-00000353A8D8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100311-0013-0000-0000-0000218EAF93
Message-Id: <20191003113010.GC23397@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030107
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
 Christoph Hellwig <hch@lst.de>, arm-soc <linux-arm-kernel@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDk6NDk6MTRBTSArMDEwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IGFkbWluIHdyb3RlOgo+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDA4OjM0OjUy
QU0gKzAzMDAsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiAodHJpbW1lZCB0aGUgQ0MpCj4gPiAK
PiA+IE9uIFdlZCwgT2N0IDAyLCAyMDE5IGF0IDA2OjE0OjExQU0gLTA1MDAsIEFkYW0gRm9yZCB3
cm90ZToKPiA+ID4gT24gV2VkLCBPY3QgMiwgMjAxOSBhdCAyOjM2IEFNIE1pa2UgUmFwb3BvcnQg
PHJwcHRAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gCj4gPiA+IEJlZm9yZSB0
aGUgcGF0Y2g6Cj4gPiA+IAo+ID4gPiAjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1ibG9jay9t
ZW1vcnkKPiA+ID4gICAgMDogMHgxMDAwMDAwMC4uMHg4ZmZmZmZmZgo+ID4gPiAjIGNhdCAvc3lz
L2tlcm5lbC9kZWJ1Zy9tZW1ibG9jay9yZXNlcnZlZAo+ID4gPiAgICAwOiAweDEwMDA0MDAwLi4w
eDEwMDA3ZmZmCj4gPiA+ICAgMzQ6IDB4MmZmZmZmODguLjB4M2ZmZmZmZmYKPiA+ID4gCj4gPiA+
IAo+ID4gPiBBZnRlciB0aGUgcGF0Y2g6Cj4gPiA+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVnL21l
bWJsb2NrL21lbW9yeQo+ID4gPiAgICAwOiAweDEwMDAwMDAwLi4weDhmZmZmZmZmCj4gPiA+ICMg
Y2F0IC9zeXMva2VybmVsL2RlYnVnL21lbWJsb2NrL3Jlc2VydmVkCj4gPiA+ICAgIDA6IDB4MTAw
MDQwMDAuLjB4MTAwMDdmZmYKPiA+ID4gICAzNjogMHg4MDAwMDAwMC4uMHg4ZmZmZmZmZgo+ID4g
Cj4gPiBJJ20gc3RpbGwgbm90IGNvbnZpbmNlZCB0aGF0IHRoZSBtZW1ibG9jayByZWZhY3Rvcmlu
ZyBkaWRuJ3QgdW5jb3ZlcmVkIGFuCj4gPiBpc3N1ZSBpbiBldG5hdml2IGRyaXZlci4KPiA+IAo+
ID4gV2h5IG1vdmluZyB0aGUgQ01BIGFyZWEgZnJvbSAweDgwMDAwMDAwIHRvIDB4MzAwMDAwMDAg
bWFrZXMgaXQgZmFpbD8KPiAKPiBJIHRoaW5rIHlvdSBoYXZlIHRoYXQgdGhlIHdyb25nIHdheSBy
b3VuZC4KCkknbSByZWx5aW5nIG9uIEFkYW0ncyByZXBvcnRzIG9mIHdvcmtpbmcgYW5kIG5vbi13
b3JraW5nIHZlcnNpb25zLgpBY2NvcmRpbmcgdG8gdGhhdCBldG5hdml2IHdvcmtzIHdoZW4gQ01B
IGFyZWEgaXMgYXQgMHg4MDAwMDAwMCBhbmQgZG9lcyBub3QKd29yayB3aGVuIGl0IGlzIGF0IDB4
MzAwMDAwMDAuCgpIZSBhbHNvIHNlbnQgbG9ncyBhIGZldyBkYXlzIGFnbyBbMV0sIHRoZXkgYWxz
byBjb25maXJtIHRoYXQuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vQ0FI
Q043eEpFdlMyU2k9TStCWXR6K2tZME00TnhtcURqaVg5TndxNl8zR0dCaDN5Zz13QG1haWwuZ21h
aWwuY29tLwogCj4gPiBCVFcsIHRoZSBjb2RlIHRoYXQgY29tcGxhaW5lZCBhYm91dCAiY29tbWFu
ZCBidWZmZXIgb3V0c2lkZSB2YWxpZCBtZW1vcnkKPiA+IHdpbmRvdyIgaGFzIGJlZW4gcmVtb3Zl
ZCBieSB0aGUgY29tbWl0IDE3ZTQ2NjBhZTNkNyAoImRybS9ldG5hdml2Ogo+ID4gaW1wbGVtZW50
IHBlci1wcm9jZXNzIGFkZHJlc3Mgc3BhY2VzIG9uIE1NVXYyIikuIAo+ID4gCj4gPiBDb3VsZCBi
ZSB0aGF0IHJlY2VudCBjaGFuZ2VzIHRvIE1NVSBtYW5hZ2VtZW50IG9mIGV0bmF2aXYgcmVzb2x2
ZSB0aGUKPiA+IGlzc3VlPwo+IAo+IFRoZSBpTVg2IGRvZXMgbm90IGhhdmUgTU1VdjIgaGFyZHdh
cmUsIGl0IGhhcyBNTVV2MS4gIFdpdGggTU1VdjEKPiBoYXJkd2FyZSByZXF1aXJlcyBjb21tYW5k
IGJ1ZmZlcnMgd2l0aGluIHRoZSBmaXJzdCAyR2lCIG9mIHBoeXNpY2FsCj4gUkFNLgoKSSd2ZSBt
ZW50aW9uZWQgdGhhdCBwYXRjaCBiZWNhdXNlIGl0IHJlbW92ZWQgdGhlIGNoZWNrIGZvciBjbWRi
dWYgYWRkcmVzcwpmb3IgTU1VdjE6CgpAQCAtNzg1LDE1ICs3NjgsNyBAQCBpbnQgZXRuYXZpdl9n
cHVfaW5pdChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFBBR0VfU0laRSk7CiAgICAgICAgaWYgKHJldCkgewogICAgICAgICAgICAgICAg
ZGV2X2VycihncHUtPmRldiwgImNvdWxkIG5vdCBjcmVhdGUgY29tbWFuZCBidWZmZXJcbiIpOwot
ICAgICAgICAgICAgICAgZ290byB1bm1hcF9zdWJhbGxvYzsKLSAgICAgICB9Ci0KLSAgICAgICBp
ZiAoIShncHUtPmlkZW50aXR5Lm1pbm9yX2ZlYXR1cmVzMSAmIGNoaXBNaW5vckZlYXR1cmVzMV9N
TVVfVkVSU0lPTikgJiYKLSAgICAgICAgICAgZXRuYXZpdl9jbWRidWZfZ2V0X3ZhKCZncHUtPmJ1
ZmZlciwgJmdwdS0+Y21kYnVmX21hcHBpbmcpID4gMHg4MDAwMDAwMCkgewotICAgICAgICAgICAg
ICAgcmV0ID0gLUVJTlZBTDsKLSAgICAgICAgICAgICAgIGRldl9lcnIoZ3B1LT5kZXYsCi0gICAg
ICAgICAgICAgICAgICAgICAgICJjb21tYW5kIGJ1ZmZlciBvdXRzaWRlIHZhbGlkIG1lbW9yeSB3
aW5kb3dcbiIpOwotICAgICAgICAgICAgICAgZ290byBmcmVlX2J1ZmZlcjsKKyAgICAgICAgICAg
ICAgIGdvdG8gZmFpbDsKICAgICAgICB9CiAKICAgICAgICAvKiBTZXR1cCBldmVudCBtYW5hZ2Vt
ZW50ICovCgoKSSByZWFsbHkgZG9uJ3Qga25vdyBob3cgZXRuYXZpdiB3b3Jrcywgc28gSSBob3Bl
ZCB0aGF0IHBlb3BsZSB3aG8KdW5kZXJzdGFuZCBpdCB3b3VsZCBoZWxwLgogCj4gSSd2ZSByZXBv
cnRlZCB0aGUgcHJvYmxlbSBwcmV2aW91c2x5IGJ1dCB0aGVyZSB3YXMgbm8gcmVzb2x1dGlvbiwK
PiBvdGhlciB0aGFuIHBvaW50aW5nIHRoZSBibGFtZSBhdCBDTUEuCj4gCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktSnVuZS90aHJlYWQuaHRt
bCMyMjM1MTYKPiAKPiAtLSAKPiBSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxp
bnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KPiBGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWls
ZSBsaW5lIGluIHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cAo+IEFj
Y29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJwcyBkb3duIDUwMGticHMgdXAKCi0tIApT
aW5jZXJlbHkgeW91cnMsCk1pa2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0
bmF2aXY=
