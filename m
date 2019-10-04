Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D6BCD1B5
	for <lists+etnaviv@lfdr.de>; Sun,  6 Oct 2019 13:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FC56E243;
	Sun,  6 Oct 2019 11:24:46 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEE96EBFF
 for <etnaviv@lists.freedesktop.org>; Fri,  4 Oct 2019 17:10:20 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x94H5BkR167372
 for <etnaviv@lists.freedesktop.org>; Fri, 4 Oct 2019 13:10:19 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ve7g4y4fc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <etnaviv@lists.freedesktop.org>; Fri, 04 Oct 2019 13:10:18 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <etnaviv@lists.freedesktop.org> from <rppt@linux.ibm.com>;
 Fri, 4 Oct 2019 18:10:17 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 4 Oct 2019 18:10:12 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x94HABN026214450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Oct 2019 17:10:11 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 372CD52050;
 Fri,  4 Oct 2019 17:10:11 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.204.245])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 1B2F152051;
 Fri,  4 Oct 2019 17:10:10 +0000 (GMT)
Date: Fri, 4 Oct 2019 20:10:07 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 00/21] Refine memblock API
References: <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
 <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
 <20191002073605.GA30433@linux.ibm.com>
 <CAHCN7xL1MkJh44N3W_1+08DHmX__SqnfH6dqUzYzr2Wpg0kQyQ@mail.gmail.com>
 <20191003053451.GA23397@linux.ibm.com>
 <20191003084914.GV25745@shell.armlinux.org.uk>
 <20191003113010.GC23397@linux.ibm.com>
 <20191004092727.GX25745@shell.armlinux.org.uk>
 <bc05540f2aa46cff5d6239faab83446401ba7b5f.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc05540f2aa46cff5d6239faab83446401ba7b5f.camel@pengutronix.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19100417-0028-0000-0000-000003A61246
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100417-0029-0000-0000-000024681DB2
Message-Id: <20191004171007.GA17825@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-04_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910040146
X-Mailman-Approved-At: Sun, 06 Oct 2019 11:24:45 +0000
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
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Fabio Estevam <festevam@gmail.com>,
 Christoph Hellwig <hch@lst.de>, arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDM6MjE6MDNQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gQW0gRnJlaXRhZywgZGVuIDA0LjEwLjIwMTksIDEwOjI3ICswMTAwIHNjaHJpZWIgUnVz
c2VsbCBLaW5nIC0gQVJNCj4gTGludXggYWRtaW46Cj4gPiBPbiBUaHUsIE9jdCAwMywgMjAxOSBh
dCAwMjozMDoxMFBNICswMzAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gPiBPbiBUaHUsIE9j
dCAwMywgMjAxOSBhdCAwOTo0OToxNEFNICswMTAwLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXgK
PiA+ID4gYWRtaW4gd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDg6MzQ6
NTJBTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+ID4gPiA+ICh0cmltbWVkIHRoZSBD
QykKPiA+ID4gPiA+IAo+ID4gPiA+ID4gT24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDY6MTQ6MTFB
TSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBXZWQsIE9jdCAyLCAyMDE5
IGF0IDI6MzYgQU0gTWlrZSBSYXBvcG9ydCA8Cj4gPiA+ID4gPiA+IHJwcHRAbGludXguaWJtLmNv
bT4gd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBCZWZvcmUgdGhlIHBhdGNoOgo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvbWVtYmxvY2svbWVt
b3J5Cj4gPiA+ID4gPiA+ICAgIDA6IDB4MTAwMDAwMDAuLjB4OGZmZmZmZmYKPiA+ID4gPiA+ID4g
IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvbWVtYmxvY2svcmVzZXJ2ZWQKPiA+ID4gPiA+ID4gICAg
MDogMHgxMDAwNDAwMC4uMHgxMDAwN2ZmZgo+ID4gPiA+ID4gPiAgIDM0OiAweDJmZmZmZjg4Li4w
eDNmZmZmZmZmCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gQWZ0ZXIgdGhl
IHBhdGNoOgo+ID4gPiA+ID4gPiAjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1ibG9jay9tZW1v
cnkKPiA+ID4gPiA+ID4gICAgMDogMHgxMDAwMDAwMC4uMHg4ZmZmZmZmZgo+ID4gPiA+ID4gPiAj
IGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1ibG9jay9yZXNlcnZlZAo+ID4gPiA+ID4gPiAgICAw
OiAweDEwMDA0MDAwLi4weDEwMDA3ZmZmCj4gPiA+ID4gPiA+ICAgMzY6IDB4ODAwMDAwMDAuLjB4
OGZmZmZmZmYKPiA+ID4gPiA+IAo+ID4gPiA+ID4gSSdtIHN0aWxsIG5vdCBjb252aW5jZWQgdGhh
dCB0aGUgbWVtYmxvY2sgcmVmYWN0b3JpbmcgZGlkbid0Cj4gPiA+ID4gPiB1bmNvdmVyZWQgYW4K
PiA+ID4gPiA+IGlzc3VlIGluIGV0bmF2aXYgZHJpdmVyLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBX
aHkgbW92aW5nIHRoZSBDTUEgYXJlYSBmcm9tIDB4ODAwMDAwMDAgdG8gMHgzMDAwMDAwMCBtYWtl
cyBpdAo+ID4gPiA+ID4gZmFpbD8KPiA+ID4gPiAKPiA+ID4gPiBJIHRoaW5rIHlvdSBoYXZlIHRo
YXQgdGhlIHdyb25nIHdheSByb3VuZC4KPiA+ID4gCj4gPiA+IEknbSByZWx5aW5nIG9uIEFkYW0n
cyByZXBvcnRzIG9mIHdvcmtpbmcgYW5kIG5vbi13b3JraW5nIHZlcnNpb25zLgo+ID4gPiBBY2Nv
cmRpbmcgdG8gdGhhdCBldG5hdml2IHdvcmtzIHdoZW4gQ01BIGFyZWEgaXMgYXQgMHg4MDAwMDAw
MCBhbmQKPiA+ID4gZG9lcyBub3QKPiA+ID4gd29yayB3aGVuIGl0IGlzIGF0IDB4MzAwMDAwMDAu
Cj4gPiA+IAo+ID4gPiBIZSBhbHNvIHNlbnQgbG9ncyBhIGZldyBkYXlzIGFnbyBbMV0sIHRoZXkg
YWxzbyBjb25maXJtIHRoYXQuCj4gPiA+IAo+ID4gPiBbMV0gCj4gPiA+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LW1tL0NBSENON3hKRXZTMlNpPU0rQll0eitrWTBNNE54bXFEamlYOU53
cTZfM0dHQmgzeWc9d0BtYWlsLmdtYWlsLmNvbS8KPiA+IAo+ID4gU29ycnksIHllcywgeW91J3Jl
IHJpZ2h0LiAgU3RpbGwsIEkndmUgcmVwb3J0ZWQgdGhpcyBzYW1lIHJlZ3Jlc3Npb24KPiA+IGEg
d2hpbGUgYmFjaywgYW5kIGl0J3MgbmV2ZXIgZ29uZSBhd2F5Lgo+ID4gCj4gPiA+ID4gPiBCVFcs
IHRoZSBjb2RlIHRoYXQgY29tcGxhaW5lZCBhYm91dCAiY29tbWFuZCBidWZmZXIgb3V0c2lkZQo+
ID4gPiA+ID4gdmFsaWQgbWVtb3J5Cj4gPiA+ID4gPiB3aW5kb3ciIGhhcyBiZWVuIHJlbW92ZWQg
YnkgdGhlIGNvbW1pdCAxN2U0NjYwYWUzZDcKPiA+ID4gPiA+ICgiZHJtL2V0bmF2aXY6Cj4gPiA+
ID4gPiBpbXBsZW1lbnQgcGVyLXByb2Nlc3MgYWRkcmVzcyBzcGFjZXMgb24gTU1VdjIiKS4gCj4g
PiA+ID4gPiAKPiA+ID4gPiA+IENvdWxkIGJlIHRoYXQgcmVjZW50IGNoYW5nZXMgdG8gTU1VIG1h
bmFnZW1lbnQgb2YgZXRuYXZpdgo+ID4gPiA+ID4gcmVzb2x2ZSB0aGUKPiA+ID4gPiA+IGlzc3Vl
Pwo+ID4gPiA+IAo+ID4gPiA+IFRoZSBpTVg2IGRvZXMgbm90IGhhdmUgTU1VdjIgaGFyZHdhcmUs
IGl0IGhhcyBNTVV2MS4gIFdpdGggTU1VdjEKPiA+ID4gPiBoYXJkd2FyZSByZXF1aXJlcyBjb21t
YW5kIGJ1ZmZlcnMgd2l0aGluIHRoZSBmaXJzdCAyR2lCIG9mCj4gPiA+ID4gcGh5c2ljYWwKPiA+
ID4gPiBSQU0uCj4gPiA+IAo+ID4gPiBJJ3ZlIG1lbnRpb25lZCB0aGF0IHBhdGNoIGJlY2F1c2Ug
aXQgcmVtb3ZlZCB0aGUgY2hlY2sgZm9yIGNtZGJ1Zgo+ID4gPiBhZGRyZXNzCj4gPiA+IGZvciBN
TVV2MToKPiA+ID4gCj4gPiA+IEBAIC03ODUsMTUgKzc2OCw3IEBAIGludCBldG5hdml2X2dwdV9p
bml0KHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgUEFHRV9TSVpFKTsKPiA+ID4gICAgICAgICBpZiAocmV0KSB7Cj4gPiA+ICAg
ICAgICAgICAgICAgICBkZXZfZXJyKGdwdS0+ZGV2LCAiY291bGQgbm90IGNyZWF0ZSBjb21tYW5k
Cj4gPiA+IGJ1ZmZlclxuIik7Cj4gPiA+IC0gICAgICAgICAgICAgICBnb3RvIHVubWFwX3N1YmFs
bG9jOwo+ID4gPiAtICAgICAgIH0KPiA+ID4gLQo+ID4gPiAtICAgICAgIGlmICghKGdwdS0+aWRl
bnRpdHkubWlub3JfZmVhdHVyZXMxICYKPiA+ID4gY2hpcE1pbm9yRmVhdHVyZXMxX01NVV9WRVJT
SU9OKSAmJgo+ID4gPiAtICAgICAgICAgICBldG5hdml2X2NtZGJ1Zl9nZXRfdmEoJmdwdS0+YnVm
ZmVyLCAmZ3B1LQo+ID4gPiA+Y21kYnVmX21hcHBpbmcpID4gMHg4MDAwMDAwMCkgewo+ID4gPiAt
ICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+ID4gLSAgICAgICAgICAgICAgIGRldl9l
cnIoZ3B1LT5kZXYsCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICJjb21tYW5kIGJ1ZmZl
ciBvdXRzaWRlIHZhbGlkIG1lbW9yeQo+ID4gPiB3aW5kb3dcbiIpOwo+ID4gPiAtICAgICAgICAg
ICAgICAgZ290byBmcmVlX2J1ZmZlcjsKPiA+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZmFpbDsK
PiA+ID4gICAgICAgICB9Cj4gPiA+ICAKPiA+ID4gICAgICAgICAvKiBTZXR1cCBldmVudCBtYW5h
Z2VtZW50ICovCj4gPiA+IAo+ID4gPiAKPiA+ID4gSSByZWFsbHkgZG9uJ3Qga25vdyBob3cgZXRu
YXZpdiB3b3Jrcywgc28gSSBob3BlZCB0aGF0IHBlb3BsZSB3aG8KPiA+ID4gdW5kZXJzdGFuZCBp
dCB3b3VsZCBoZWxwLgo+ID4gCj4gPiBGcm9tIHdoYXQgSSBjYW4gc2VlLCByZW1vdmluZyB0aGF0
IGNoZWNrIGlzIGEgY29tcGxldGVseSBpbnNhbmUgdGhpbmcKPiA+IHRvIGRvLCBhbmQgSSBub3Rl
IHRoYXQgdGhlc2UgY2hhbmdlcyBhcmUgX25vdF8gZGVzY3JpYmVkIGluIHRoZQo+ID4gY29tbWl0
Cj4gPiBtZXNzYWdlLiAgVGhlIHByb2JsZW0gd2FzIGtub3duIGFib3V0IF9iZWZvcmVfIChKdW5l
IDIyKSB0aGUgcGF0Y2gKPiA+IHdhcwo+ID4gY3JlYXRlZCAoSnVseSA1KS4KPiA+IAo+ID4gTHVj
YXMsIHBsZWFzZSBjYW4geW91IGV4cGxhaW4gd2h5IHJlbW92aW5nIHRoZSBhYm92ZSBjaGVjaywg
d2hpY2ggaXMKPiA+IHdlbGwga25vd24gdG8gY29ycmVjdGx5IHRyaWdnZXIgb24gdmFyaW91cyBw
bGF0Zm9ybXMgdG8gcHJldmVudAo+ID4gaW5jb3JyZWN0IEdQVSBiZWhhdmlvdXIsIGlzIHNhZmU/
Cj4gCj4gSXQgaXNuJ3QuIEl0J3MgYSBwcmV0dHkgYmlnIG92ZXJzaWdodCBpbiB0aGlzIGNvbW1p
dCB0byByZW1vdmUgdGhpcwo+IGNoZWNrLiBJdCBjYW4ndCBiZSBkb25lIGF0IHRoZSBzYW1lIHNw
b3QgaW4gdGhlIGNvZGUgYW55bW9yZSwgYXMgd2UKPiBkb24ndCBoYXZlIGEgbWFwcGluZyBjb250
ZXh0IGF0IHRoaXMgdGltZSBhbnltb3JlLCBidXQgaXQgc2hvdWxkIGhhdmUKPiBtb3ZlZCBpbnRv
IGV0bmF2aXZfaW9tbXVfY29udGV4dF9pbml0KCkuIEknbGwgc2VuZCBhIHBhdGNoIHRvIGZpeCB0
aGlzCj4gdXAuCgpMdWNhcywgY2FuIHlvdSBtYWtlIHRoZSBjaGVjayB1c2UgU1pfMkcgaW5zdGVh
ZCBvZiAweDgwMDAwMDAwIGFuZCBhZGQgYQpjb21tZW50IGFib3V0IDJHIGxpbWl0YXRpb24gb2Yg
dGhlIGFwZXJ0dXJlIHdpbmRvdz8KIAo+IFJlZ2FyZHMsCj4gTHVjYXMKPiAKCi0tIApTaW5jZXJl
bHkgeW91cnMsCk1pa2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
