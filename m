Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EB7C9AA5
	for <lists+etnaviv@lfdr.de>; Thu,  3 Oct 2019 11:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCC66E98E;
	Thu,  3 Oct 2019 09:18:13 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 3094 seconds by postgrey-1.36 at gabe;
 Wed, 02 Oct 2019 08:28:04 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3BA6E8F6
 for <etnaviv@lists.freedesktop.org>; Wed,  2 Oct 2019 08:28:04 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x927aSlj135173
 for <etnaviv@lists.freedesktop.org>; Wed, 2 Oct 2019 03:36:29 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vckugx4ks-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <etnaviv@lists.freedesktop.org>; Wed, 02 Oct 2019 03:36:29 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <etnaviv@lists.freedesktop.org> from <rppt@linux.ibm.com>;
 Wed, 2 Oct 2019 08:36:23 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 2 Oct 2019 08:36:12 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x927ZgPA34865576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 07:35:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56E0EA4060;
 Wed,  2 Oct 2019 07:36:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDD2EA4054;
 Wed,  2 Oct 2019 07:36:07 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.8.153])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  2 Oct 2019 07:36:07 +0000 (GMT)
Date: Wed, 2 Oct 2019 10:36:06 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
References: <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
 <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
 <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
 <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19100207-0008-0000-0000-0000031D3BD8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100207-0009-0000-0000-00004A3C3DD3
Message-Id: <20191002073605.GA30433@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910020071
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgQWRhbSwKCk9uIFR1ZSwgT2N0IDAxLCAyMDE5IGF0IDA3OjE0OjEzUE0gLTA1MDAsIEFkYW0g
Rm9yZCB3cm90ZToKPiBPbiBTdW4sIFNlcCAyOSwgMjAxOSBhdCA4OjMzIEFNIEFkYW0gRm9yZCA8
YWZvcmQxNzNAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBJIGFtIGF0dGFjaGluZyB0d28gbG9n
cy4gIEkgbm93IHRoZSBtYWlsaW5nIGxpc3RzIHdpbGwgYmUgdW5oYXBweSwgYnV0Cj4gPiAgZG9u
J3Qgd2FudCB0byB0cnkgYW5kIHNwYW0gYSBidW5jaCBvZiBsb2cgdGhyb3VnaCB0aGUgbWFpbGlu
ZyBsaWFzdC4KPiA+IFRoZSB0d28gbG9ncyBzaG93IHRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRo
ZSB3b3JraW5nIGFuZCBub24td29ya2luZwo+ID4gaW14NnEgM0QgYWNjZWxlcmF0b3Igd2hlbiB0
cnlpbmcgdG8gcnVuIGEgc2ltcGxlIGdsbWFyazItZXMyLWRybSBkZW1vLgo+ID4KPiA+IFRoZSBv
bmx5IGNoYW5nZSBiZXR3ZWVuIHRoZW0gaXMgdGhlIDIgbGluZSBjb2RlIGNoYW5nZSB5b3Ugc3Vn
Z2VzdGVkLgo+ID4KPiA+IEluIGJvdGggY2FzZXMsIEkgaGF2ZSBjbWE9MTI4TSBzZXQgaW4gbXkg
Ym9vdGFyZ3MuICBIaXN0b3JpY2FsbHkgdGhpcwo+ID4gaGFzIGJlZW4gc3VmZmljaWVudCwgYnV0
IGNtYT0yNTZNIGhhcyBub3QgbWFkZSBhIGRpZmZlcmVuY2UuCj4gPgo+IAo+IE1pa2UgYW55IHN1
Z2dlc3Rpb25zIG9uIGhvdyB0byBtb3ZlIGZvcndhcmQ/Cj4gSSB3YXMgaG9waW5nIHRvIGdldCB0
aGUgZml4ZXMgdGVzdGVkIGFuZCBwdXNoZWQgYmVmb3JlIDUuNCBpcyByZWxlYXNlZAo+IGlmIGF0
IGFsbCBwb3NzaWJsZQoKSSBoYXZlIGEgZml4IChiZWxvdykgdGhhdCBraW5kYSByZXN0b3JlcyB0
aGUgb3JpZ2luYWwgYmVoYXZpb3VyLCBidXQgSQpzdGlsbCB3b3VsZCBsaWtlIHRvIGRvdWJsZSBj
aGVjayB0byBtYWtlIHN1cmUgaXQncyBub3QgYSBiYW5kIGFpZCBhbmQgSQpoYXZlbid0IG1pc3Nl
ZCB0aGUgYWN0dWFsIHJvb3QgY2F1c2UuCgpDYW4geW91IHBsZWFzZSBzZW5kIG1lIHlvdXIgZGV2
aWNlIHRyZWUgZGVmaW5pdGlvbiBhbmQgdGhlIG91dHB1dCBvZiAKCmNhdCAvc3lzL2tlcm5lbC9k
ZWJ1Zy9tZW1ibG9jay9tZW1vcnkKCmFuZCAKCmNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tZW1ibG9j
ay9yZXNlcnZlZAoKVGhhbmtzIQoKRnJvbSAwNjUyOWY4NjE3NzJiN2RlYTI5MTJmYzIyNDVkZWJl
NDY5MDEzOWI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNaWtlIFJhcG9wb3J0IDxy
cHB0QGxpbnV4LmlibS5jb20+CkRhdGU6IFdlZCwgMiBPY3QgMjAxOSAxMDoxNDoxNyArMDMwMApT
dWJqZWN0OiBbUEFUQ0hdIG1tOiBtZW1ibG9jazogZG8gbm90IGVuZm9yY2UgY3VycmVudCBsaW1p
dCBmb3IgbWVtYmxvY2tfcGh5cyoKIGZhbWlseQoKVW50aWwgY29tbWl0IDkyZDEyZjk1NDRiNyAo
Im1lbWJsb2NrOiByZWZhY3RvciBpbnRlcm5hbCBhbGxvY2F0aW9uCmZ1bmN0aW9ucyIpIHRoZSBt
YXhpbWFsIGFkZHJlc3MgZm9yIG1lbWJsb2NrIGFsbG9jYXRpb25zIHdhcyBmb3JjZWQgdG8KbWVt
YmxvY2suY3VycmVudF9saW1pdCBvbmx5IGZvciB0aGUgYWxsb2NhdGlvbiBmdW5jdGlvbnMgcmV0
dXJuaW5nIHZpcnR1YWwKYWRkcmVzcy4gVGhlIGNoYW5nZXMgaW50cm9kdWNlZCBieSB0aGF0IGNv
bW1pdCBtb3ZlZCB0aGUgbGltaXQgZW5mb3JjZW1lbnQKaW50byB0aGUgYWxsb2NhdGlvbiBjb3Jl
IGFuZCBhcyBhIHJlc3VsdCB0aGUgYWxsb2NhdGlvbiBmdW5jdGlvbnMgcmV0dXJuaW5nCnBoeXNp
Y2FsIGFkZHJlc3MgYWxzbyBzdGFydGVkIHRvIGxpbWl0IGFsbG9jYXRpb25zIHRvCm1lbWJsb2Nr
LmN1cnJlbnRfbGltaXQuCgpUaGlzIGNhdXNlZCBicmVha2FnZSBvZiBldG5hdml2IEdQVSBkcml2
ZXI6CgpbICAgIDMuNjgyMzQ3XSBldG5hdml2IGV0bmF2aXY6IGJvdW5kIDEzMDAwMC5ncHUgKG9w
cyBncHVfb3BzKQpbICAgIDMuNjg4NjY5XSBldG5hdml2IGV0bmF2aXY6IGJvdW5kIDEzNDAwMC5n
cHUgKG9wcyBncHVfb3BzKQpbICAgIDMuNjk1MDk5XSBldG5hdml2IGV0bmF2aXY6IGJvdW5kIDIy
MDQwMDAuZ3B1IChvcHMgZ3B1X29wcykKWyAgICAzLjcwMDgwMF0gZXRuYXZpdi1ncHUgMTMwMDAw
LmdwdTogbW9kZWw6IEdDMjAwMCwgcmV2aXNpb246IDUxMDgKWyAgICAzLjcyMzAxM10gZXRuYXZp
di1ncHUgMTMwMDAwLmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAptZW1vcnkgd2lu
ZG93ClsgICAgMy43MzEzMDhdIGV0bmF2aXYtZ3B1IDEzNDAwMC5ncHU6IG1vZGVsOiBHQzMyMCwg
cmV2aXNpb246IDUwMDcKWyAgICAzLjc1MjQzN10gZXRuYXZpdi1ncHUgMTM0MDAwLmdwdTogY29t
bWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAptZW1vcnkgd2luZG93ClsgICAgMy43NjA1ODNdIGV0
bmF2aXYtZ3B1IDIyMDQwMDAuZ3B1OiBtb2RlbDogR0MzNTUsIHJldmlzaW9uOiAxMjE1ClsgICAg
My43NjY3NjZdIGV0bmF2aXYtZ3B1IDIyMDQwMDAuZ3B1OiBJZ25vcmluZyBHUFUgd2l0aCBWRyBh
bmQgRkUyLjAKClJlc3RvcmUgdGhlIGJlaGF2aW91ciBvZiBtZW1ibG9ja19waHlzKiBmYW1pbHkg
c28gdGhhdCB0aGVzZSBmdW5jdGlvbnMgd2lsbApub3QgZW5mb3JjZSBtZW1ibG9jay5jdXJyZW50
X2xpbWl0LgoKRml4ZXM6IDkyZDEyZjk1NDRiNyAoIm1lbWJsb2NrOiByZWZhY3RvciBpbnRlcm5h
bCBhbGxvY2F0aW9uIGZ1bmN0aW9ucyIpClJlcG9ydGVkLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTcz
QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0u
Y29tPgotLS0KIG1tL21lbWJsb2NrLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9tZW1ibG9jay5jIGIv
bW0vbWVtYmxvY2suYwppbmRleCA3ZDRmNjFhLi5jNGIxNmNhIDEwMDY0NAotLS0gYS9tbS9tZW1i
bG9jay5jCisrKyBiL21tL21lbWJsb2NrLmMKQEAgLTEzNTYsOSArMTM1Niw2IEBAIHN0YXRpYyBw
aHlzX2FkZHJfdCBfX2luaXQgbWVtYmxvY2tfYWxsb2NfcmFuZ2VfbmlkKHBoeXNfYWRkcl90IHNp
emUsCiAJCWFsaWduID0gU01QX0NBQ0hFX0JZVEVTOwogCX0KIAotCWlmIChlbmQgPiBtZW1ibG9j
ay5jdXJyZW50X2xpbWl0KQotCQllbmQgPSBtZW1ibG9jay5jdXJyZW50X2xpbWl0OwotCiBhZ2Fp
bjoKIAlmb3VuZCA9IG1lbWJsb2NrX2ZpbmRfaW5fcmFuZ2Vfbm9kZShzaXplLCBhbGlnbiwgc3Rh
cnQsIGVuZCwgbmlkLAogCQkJCQkgICAgZmxhZ3MpOwpAQCAtMTQ2OSw2ICsxNDY2LDkgQEAgc3Rh
dGljIHZvaWQgKiBfX2luaXQgbWVtYmxvY2tfYWxsb2NfaW50ZXJuYWwoCiAJaWYgKFdBUk5fT05f
T05DRShzbGFiX2lzX2F2YWlsYWJsZSgpKSkKIAkJcmV0dXJuIGt6YWxsb2Nfbm9kZShzaXplLCBH
RlBfTk9XQUlULCBuaWQpOwogCisJaWYgKG1heF9hZGRyID4gbWVtYmxvY2suY3VycmVudF9saW1p
dCkKKwkJbWF4X2FkZHIgPSBtZW1ibG9jay5jdXJyZW50X2xpbWl0OworCiAJYWxsb2MgPSBtZW1i
bG9ja19hbGxvY19yYW5nZV9uaWQoc2l6ZSwgYWxpZ24sIG1pbl9hZGRyLCBtYXhfYWRkciwgbmlk
KTsKIAogCS8qIHJldHJ5IGFsbG9jYXRpb24gd2l0aG91dCBsb3dlciBsaW1pdCAqLwotLSAKMi43
LjQKCiAKPiA+IGFkYW0KPiA+Cj4gPiBPbiBTYXQsIFNlcCAyOCwgMjAxOSBhdCAyOjMzIEFNIE1p
a2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRo
dSwgU2VwIDI2LCAyMDE5IGF0IDAyOjM1OjUzUE0gLTA1MDAsIEFkYW0gRm9yZCB3cm90ZToKPiA+
ID4gPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAxMTowNCBBTSBNaWtlIFJhcG9wb3J0IDxycHB0
QGxpbnV4LmlibS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpLAo+ID4gPiA+ID4K
PiA+ID4gPiA+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDA4OjA5OjUyQU0gLTA1MDAsIEFkYW0g
Rm9yZCB3cm90ZToKPiA+ID4gPiA+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTA6MTcgQU0g
RmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDk6MTcgQU0gQWRhbSBGb3JkIDxh
Zm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBJ
IHRyaWVkIGNtYT0yNTZNIGFuZCBub3RpY2VkIHRoZSBjbWEgZHVtcCBhdCB0aGUgYmVnaW5uaW5n
IGRpZG4ndAo+ID4gPiA+ID4gPiA+ID4gY2hhbmdlLiAgRG8gd2UgbmVlZCB0byBzZXR1cCBhIHJl
c2VydmVkLW1lbW9yeSBub2RlIGxpa2UKPiA+ID4gPiA+ID4gPiA+IGlteDZ1bC1jY2lteDZ1bHNv
bS5kdHNpIGRpZD8KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEkgZG9uJ3QgdGhpbmsgc28u
Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBXZXJlIHlvdSBhYmxlIHRvIGlkZW50aWZ5IHdo
YXQgd2FzIHRoZSBleGFjdCBjb21taXQgdGhhdCBjYXVzZWQgc3VjaCByZWdyZXNzaW9uPwo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBJIHdhcyBhYmxlIHRvIG5hcnJvdyBpdCBkb3duIHRoZSA5MmQx
MmY5NTQ0YjcgKCJtZW1ibG9jazogcmVmYWN0b3IKPiA+ID4gPiA+ID4gaW50ZXJuYWwgYWxsb2Nh
dGlvbiBmdW5jdGlvbnMiKSB0aGF0IGNhdXNlZCB0aGUgcmVncmVzc2lvbiB3aXRoCj4gPiA+ID4g
PiA+IEV0bmF2aXYuCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IENhbiB5b3UgcGxlYXNl
IHRlc3Qgd2l0aCB0aGlzIGNoYW5nZToKPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGF0IGFw
cGVhcnMgdG8gaGF2ZSBmaXhlZCBteSBpc3N1ZS4gIEkgYW0gbm90IHN1cmUgd2hhdCB0aGUgaW1w
YWN0Cj4gPiA+ID4gaXMsIGJ1dCBpcyB0aGlzIGEgc2FmZSBvcHRpb24/Cj4gPiA+Cj4gPiA+IEl0
J3Mgbm90IHJlYWxseSBhIGZpeCwgSSBqdXN0IHdhbnRlZCB0byBzZWUgaG93IGV4YWN0bHkgOTJk
MTJmOTU0NGI3ICgibWVtYmxvY2s6Cj4gPiA+IHJlZmFjdG9yIGludGVybmFsIGFsbG9jYXRpb24g
ZnVuY3Rpb25zIikgYnJva2UgeW91ciBzZXR1cC4KPiA+ID4KPiA+ID4gQ2FuIHlvdSBzaGFyZSB0
aGUgZHRzIHlvdSBhcmUgdXNpbmcgYW5kIHRoZSBmdWxsIGtlcm5lbCBsb2c/Cj4gPiA+Cj4gPiA+
ID4gYWRhbQo+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbW0vbWVtYmxvY2suYyBiL21t
L21lbWJsb2NrLmMKPiA+ID4gPiA+IGluZGV4IDdkNGY2MWEuLjFmNWEwZWIgMTAwNjQ0Cj4gPiA+
ID4gPiAtLS0gYS9tbS9tZW1ibG9jay5jCj4gPiA+ID4gPiArKysgYi9tbS9tZW1ibG9jay5jCj4g
PiA+ID4gPiBAQCAtMTM1Niw5ICsxMzU2LDYgQEAgc3RhdGljIHBoeXNfYWRkcl90IF9faW5pdCBt
ZW1ibG9ja19hbGxvY19yYW5nZV9uaWQocGh5c19hZGRyX3Qgc2l6ZSwKPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICBhbGlnbiA9IFNNUF9DQUNIRV9CWVRFUzsKPiA+ID4gPiA+ICAgICAgICAgfQo+
ID4gPiA+ID4KPiA+ID4gPiA+IC0gICAgICAgaWYgKGVuZCA+IG1lbWJsb2NrLmN1cnJlbnRfbGlt
aXQpCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgZW5kID0gbWVtYmxvY2suY3VycmVudF9saW1p
dDsKPiA+ID4gPiA+IC0KPiA+ID4gPiA+ICBhZ2FpbjoKPiA+ID4gPiA+ICAgICAgICAgZm91bmQg
PSBtZW1ibG9ja19maW5kX2luX3JhbmdlX25vZGUoc2l6ZSwgYWxpZ24sIHN0YXJ0LCBlbmQsIG5p
ZCwKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZmxhZ3MpOwo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSBhbHNvIG5vdGljZWQgdGhhdCBpZiBJIGNy
ZWF0ZSBhIHJlc2VydmVkIG1lbW9yeSBub2RlIGFzIHdhcyBkb25lIG9uZQo+ID4gPiA+ID4gPiBp
bXg2dWwtY2NpbXg2dWxzb20uZHRzaSB0aGUgM0Qgc2VlbXMgdG8gd29yayBhZ2FpbiwgYnV0IHdp
dGhvdXQgaXQsIEkKPiA+ID4gPiA+ID4gd2FzIGdldHRpbmcgZXJyb3JzIHJlZ2FyZGxlc3Mgb2Yg
dGhlICdjbWE9MjU2TScgb3Igbm90Lgo+ID4gPiA+ID4gPiBJIGRvbid0IGhhdmUgYSBwcm9ibGVt
IHVzaW5nIHRoZSByZXNlcnZlZCBtZW1vcnksIGJ1dCBJIGd1ZXNzIEkgYW0gbm90Cj4gPiA+ID4g
PiA+IHN1cmUgd2hhdCB0aGUgYW1vdW50IHNob3VsZCBiZS4gIEkga25vdyBmb3IgdGhlIHZpZGVv
IGRlY29kaW5nIDEwODBwLAo+ID4gPiA+ID4gPiBJIGhhdmUgaGlzdG9yaWNhbGx5IHVzZWQgY21h
PTEyOE0sIGJ1dCB3aXRoIHRoZSAzRCBhbHNvIG5lZWRpbmcgc29tZQo+ID4gPiA+ID4gPiBtZW1v
cnkgYWxsb2NhdGlvbiwgaXMgdGhhdCBlbm91Z2ggb3Igc2hvdWxkIEkgdXNlIDI1Nk0/Cj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IGFkYW0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4g
U2luY2VyZWx5IHlvdXJzLAo+ID4gPiA+ID4gTWlrZS4KPiA+ID4gPiA+Cj4gPiA+Cj4gPiA+IC0t
Cj4gPiA+IFNpbmNlcmVseSB5b3VycywKPiA+ID4gTWlrZS4KPiA+ID4KCi0tIApTaW5jZXJlbHkg
eW91cnMsCk1pa2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
