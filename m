Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A02CD1B6
	for <lists+etnaviv@lfdr.de>; Sun,  6 Oct 2019 13:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA38B6E3FB;
	Sun,  6 Oct 2019 11:24:46 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DB16EBFC
 for <etnaviv@lists.freedesktop.org>; Fri,  4 Oct 2019 17:29:14 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x94HDVZY078121
 for <etnaviv@lists.freedesktop.org>; Fri, 4 Oct 2019 13:29:14 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ve8f7d097-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <etnaviv@lists.freedesktop.org>; Fri, 04 Oct 2019 13:29:13 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <etnaviv@lists.freedesktop.org> from <rppt@linux.ibm.com>;
 Fri, 4 Oct 2019 18:29:11 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 4 Oct 2019 18:29:08 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x94HT7Vk58065062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Oct 2019 17:29:07 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DEFBA405B;
 Fri,  4 Oct 2019 17:29:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9015A405C;
 Fri,  4 Oct 2019 17:29:05 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.204.245])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Oct 2019 17:29:05 +0000 (GMT)
Date: Fri, 4 Oct 2019 20:29:03 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 00/21] Refine memblock API
References: <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
 <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
 <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
 <20191002073605.GA30433@linux.ibm.com>
 <CAHCN7xL1MkJh44N3W_1+08DHmX__SqnfH6dqUzYzr2Wpg0kQyQ@mail.gmail.com>
 <20191003053451.GA23397@linux.ibm.com>
 <20191003084914.GV25745@shell.armlinux.org.uk>
 <20191003113010.GC23397@linux.ibm.com>
 <20191004092727.GX25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004092727.GX25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19100417-0008-0000-0000-0000031E134C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100417-0009-0000-0000-00004A3D1F6E
Message-Id: <20191004172902.GB17825@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-04_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910040147
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

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMTA6Mjc6MjdBTSArMDEwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IGFkbWluIHdyb3RlOgo+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDAyOjMwOjEw
UE0gKzAzMDAsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAwMywgMjAxOSBh
dCAwOTo0OToxNEFNICswMTAwLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4gd3JvdGU6
Cj4gPiA+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDA4OjM0OjUyQU0gKzAzMDAsIE1pa2UgUmFw
b3BvcnQgd3JvdGU6Cj4gPiA+ID4gKHRyaW1tZWQgdGhlIENDKQo+ID4gPiA+IAo+ID4gPiA+IE9u
IFdlZCwgT2N0IDAyLCAyMDE5IGF0IDA2OjE0OjExQU0gLTA1MDAsIEFkYW0gRm9yZCB3cm90ZToK
PiA+ID4gPiA+IE9uIFdlZCwgT2N0IDIsIDIwMTkgYXQgMjozNiBBTSBNaWtlIFJhcG9wb3J0IDxy
cHB0QGxpbnV4LmlibS5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBCZWZvcmUgdGhlIHBhdGNoOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAjIGNhdCAvc3lzL2tlcm5l
bC9kZWJ1Zy9tZW1ibG9jay9tZW1vcnkKPiA+ID4gPiA+ICAgIDA6IDB4MTAwMDAwMDAuLjB4OGZm
ZmZmZmYKPiA+ID4gPiA+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVnL21lbWJsb2NrL3Jlc2VydmVk
Cj4gPiA+ID4gPiAgICAwOiAweDEwMDA0MDAwLi4weDEwMDA3ZmZmCj4gPiA+ID4gPiAgIDM0OiAw
eDJmZmZmZjg4Li4weDNmZmZmZmZmCj4gPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gQWZ0
ZXIgdGhlIHBhdGNoOgo+ID4gPiA+ID4gIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvbWVtYmxvY2sv
bWVtb3J5Cj4gPiA+ID4gPiAgICAwOiAweDEwMDAwMDAwLi4weDhmZmZmZmZmCj4gPiA+ID4gPiAj
IGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1ibG9jay9yZXNlcnZlZAo+ID4gPiA+ID4gICAgMDog
MHgxMDAwNDAwMC4uMHgxMDAwN2ZmZgo+ID4gPiA+ID4gICAzNjogMHg4MDAwMDAwMC4uMHg4ZmZm
ZmZmZgo+ID4gPiA+IAo+ID4gPiA+IEknbSBzdGlsbCBub3QgY29udmluY2VkIHRoYXQgdGhlIG1l
bWJsb2NrIHJlZmFjdG9yaW5nIGRpZG4ndCB1bmNvdmVyZWQgYW4KPiA+ID4gPiBpc3N1ZSBpbiBl
dG5hdml2IGRyaXZlci4KPiA+ID4gPiAKPiA+ID4gPiBXaHkgbW92aW5nIHRoZSBDTUEgYXJlYSBm
cm9tIDB4ODAwMDAwMDAgdG8gMHgzMDAwMDAwMCBtYWtlcyBpdCBmYWlsPwo+ID4gPiAKPiA+ID4g
SSB0aGluayB5b3UgaGF2ZSB0aGF0IHRoZSB3cm9uZyB3YXkgcm91bmQuCj4gPiAKPiA+IEknbSBy
ZWx5aW5nIG9uIEFkYW0ncyByZXBvcnRzIG9mIHdvcmtpbmcgYW5kIG5vbi13b3JraW5nIHZlcnNp
b25zLgo+ID4gQWNjb3JkaW5nIHRvIHRoYXQgZXRuYXZpdiB3b3JrcyB3aGVuIENNQSBhcmVhIGlz
IGF0IDB4ODAwMDAwMDAgYW5kIGRvZXMgbm90Cj4gPiB3b3JrIHdoZW4gaXQgaXMgYXQgMHgzMDAw
MDAwMC4KPiA+IAo+ID4gSGUgYWxzbyBzZW50IGxvZ3MgYSBmZXcgZGF5cyBhZ28gWzFdLCB0aGV5
IGFsc28gY29uZmlybSB0aGF0Lgo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtbW0vQ0FIQ043eEpFdlMyU2k9TStCWXR6K2tZME00TnhtcURqaVg5TndxNl8zR0dCaDN5
Zz13QG1haWwuZ21haWwuY29tLwo+IAo+IFNvcnJ5LCB5ZXMsIHlvdSdyZSByaWdodC4gIFN0aWxs
LCBJJ3ZlIHJlcG9ydGVkIHRoaXMgc2FtZSByZWdyZXNzaW9uCj4gYSB3aGlsZSBiYWNrLCBhbmQg
aXQncyBuZXZlciBnb25lIGF3YXkuCj4gCj4gPiA+ID4gQlRXLCB0aGUgY29kZSB0aGF0IGNvbXBs
YWluZWQgYWJvdXQgImNvbW1hbmQgYnVmZmVyIG91dHNpZGUgdmFsaWQgbWVtb3J5Cj4gPiA+ID4g
d2luZG93IiBoYXMgYmVlbiByZW1vdmVkIGJ5IHRoZSBjb21taXQgMTdlNDY2MGFlM2Q3ICgiZHJt
L2V0bmF2aXY6Cj4gPiA+ID4gaW1wbGVtZW50IHBlci1wcm9jZXNzIGFkZHJlc3Mgc3BhY2VzIG9u
IE1NVXYyIikuIAo+ID4gPiA+IAo+ID4gPiA+IENvdWxkIGJlIHRoYXQgcmVjZW50IGNoYW5nZXMg
dG8gTU1VIG1hbmFnZW1lbnQgb2YgZXRuYXZpdiByZXNvbHZlIHRoZQo+ID4gPiA+IGlzc3VlPwo+
ID4gPiAKPiA+ID4gVGhlIGlNWDYgZG9lcyBub3QgaGF2ZSBNTVV2MiBoYXJkd2FyZSwgaXQgaGFz
IE1NVXYxLiAgV2l0aCBNTVV2MQo+ID4gPiBoYXJkd2FyZSByZXF1aXJlcyBjb21tYW5kIGJ1ZmZl
cnMgd2l0aGluIHRoZSBmaXJzdCAyR2lCIG9mIHBoeXNpY2FsCj4gPiA+IFJBTS4KPiA+IAo+ID4g
SSd2ZSBtZW50aW9uZWQgdGhhdCBwYXRjaCBiZWNhdXNlIGl0IHJlbW92ZWQgdGhlIGNoZWNrIGZv
ciBjbWRidWYgYWRkcmVzcwo+ID4gZm9yIE1NVXYxOgo+ID4gCj4gPiBAQCAtNzg1LDE1ICs3Njgs
NyBAQCBpbnQgZXRuYXZpdl9ncHVfaW5pdChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX1NJWkUpOwo+ID4gICAgICAgICBp
ZiAocmV0KSB7Cj4gPiAgICAgICAgICAgICAgICAgZGV2X2VycihncHUtPmRldiwgImNvdWxkIG5v
dCBjcmVhdGUgY29tbWFuZCBidWZmZXJcbiIpOwo+ID4gLSAgICAgICAgICAgICAgIGdvdG8gdW5t
YXBfc3ViYWxsb2M7Cj4gPiAtICAgICAgIH0KPiA+IC0KPiA+IC0gICAgICAgaWYgKCEoZ3B1LT5p
ZGVudGl0eS5taW5vcl9mZWF0dXJlczEgJiBjaGlwTWlub3JGZWF0dXJlczFfTU1VX1ZFUlNJT04p
ICYmCj4gPiAtICAgICAgICAgICBldG5hdml2X2NtZGJ1Zl9nZXRfdmEoJmdwdS0+YnVmZmVyLCAm
Z3B1LT5jbWRidWZfbWFwcGluZykgPiAweDgwMDAwMDAwKSB7Cj4gPiAtICAgICAgICAgICAgICAg
cmV0ID0gLUVJTlZBTDsKPiA+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGdwdS0+ZGV2LAo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgImNvbW1hbmQgYnVmZmVyIG91dHNpZGUgdmFsaWQgbWVt
b3J5IHdpbmRvd1xuIik7Cj4gPiAtICAgICAgICAgICAgICAgZ290byBmcmVlX2J1ZmZlcjsKPiA+
ICsgICAgICAgICAgICAgICBnb3RvIGZhaWw7Cj4gPiAgICAgICAgIH0KPiA+ICAKPiA+ICAgICAg
ICAgLyogU2V0dXAgZXZlbnQgbWFuYWdlbWVudCAqLwo+ID4gCj4gPiAKPiA+IEkgcmVhbGx5IGRv
bid0IGtub3cgaG93IGV0bmF2aXYgd29ya3MsIHNvIEkgaG9wZWQgdGhhdCBwZW9wbGUgd2hvCj4g
PiB1bmRlcnN0YW5kIGl0IHdvdWxkIGhlbHAuCj4gCj4gRnJvbSB3aGF0IEkgY2FuIHNlZSwgcmVt
b3ZpbmcgdGhhdCBjaGVjayBpcyBhIGNvbXBsZXRlbHkgaW5zYW5lIHRoaW5nCj4gdG8gZG8sIGFu
ZCBJIG5vdGUgdGhhdCB0aGVzZSBjaGFuZ2VzIGFyZSBfbm90XyBkZXNjcmliZWQgaW4gdGhlIGNv
bW1pdAo+IG1lc3NhZ2UuICBUaGUgcHJvYmxlbSB3YXMga25vd24gYWJvdXQgX2JlZm9yZV8gKEp1
bmUgMjIpIHRoZSBwYXRjaCB3YXMKPiBjcmVhdGVkIChKdWx5IDUpLgoKVGhlIG1lbWJsb2NrIHJl
ZmFjdG9yaW5nIHdlbnQgaW4gaW4gNS4xIHdoaWNoIHdhcyBNYXkgNSwgYW5kIGxpa2VseSBpdApj
YXVzZWQgdGhlIHJlZ3Jlc3Npb24uCgpVbmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLCBiZWZv
cmUgdGhlIG1lbWJsb2NrIHJlZmFjdG9yaW5nIHRoZSBDTUEKcmVzZXJ2YXRpb24gY291bGQgdXNl
IHRoZSBlbnRpcmUgcGh5c2ljYWwgbWVtb3J5IGJlY2F1c2UKbWVtYmxvY2tfcGh5c19hbGxvYygp
IGRpZG4ndCBlbmZvcmNlIG1lbWJsb2NrLmN1cnJlbnRfbGltaXQuCgpTaW5jZSBtZW1ibG9jayBk
ZWZhdWx0IGlzIHRvIGFsbG9jYXRlIGZyb20gdG9wLCBjbWFfZGVjbGFyZV9jb250aWd1b3VzKCkK
Y291bGQgZ3JhYiB0aGUgbWVtb3J5IGNsb3NlIHRvIHRoZSBlbmQgb2YgRFJBTSBhbmQgdGh1cyBo
YXZlIHBoeXNpY2FsCmFkZHJlc3MgY2xvc2UgZW5vdWdoIHRvIHRoZSB2aXJ0dWFsIGFkZHJlc3Mg
dG8gZml0IGluIHRoZSAyRyBsaW1pdC4KCldoZW4gSSd2ZSBtYWRlIG1lbWJsb2NrX3BoeXMqIGxp
bWl0IHRoZSBtZW1ibG9jayBhbGxvY2F0aW9ucyB0bwptZW1ibG9jay5jdXJyZW50X2xpbWl0IHRo
ZSBDTUEgYXJlYSBtb3ZlZCB0b28gZmFyIGF3YXkgZG93biBhbmQgdGhlIGdhcApiZWNhbWUgbGFy
Z2VyIHRoYW4gMkcuCgpJdCBkb2VzIG5vdCBzZWVtIGxpa2UgZGVhbGluZyB3aXRoIHRoaXMgaW4g
ZXRuYXZpdiBkcml2ZXIgYW5kIERNQSBhbmQgQ01BCkFQSXMgd291bGQgaGFwcGVuIGZhc3QgYW5k
IHRoZSAicmV2ZXJ0IiBvZiB0aGUgbWVtYmxvY2sgY2hhbmdlcyBJJ3ZlIHNlbnQKZWFybGllciBp
biB0aGlzIHRocmVhZCBkb2VzIGZpeCB0aGUgcHJvYmxlbS4KCkFuZHJldywgd291bGQgeW91IGxp
a2UgbWUgdG8gcmVzZW5kIHRoZSBwYXRjaCBpbiBhIHNlcGFyYXRlIGUtbWFpbD8KIAo+IEx1Y2Fz
LCBwbGVhc2UgY2FuIHlvdSBleHBsYWluIHdoeSByZW1vdmluZyB0aGUgYWJvdmUgY2hlY2ssIHdo
aWNoIGlzCj4gd2VsbCBrbm93biB0byBjb3JyZWN0bHkgdHJpZ2dlciBvbiB2YXJpb3VzIHBsYXRm
b3JtcyB0byBwcmV2ZW50Cj4gaW5jb3JyZWN0IEdQVSBiZWhhdmlvdXIsIGlzIHNhZmU/Cj4gCj4g
VGhhbmtzLgo+IAoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2
aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
