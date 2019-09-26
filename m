Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC11C067B
	for <lists+etnaviv@lfdr.de>; Fri, 27 Sep 2019 15:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9716E151;
	Fri, 27 Sep 2019 13:37:43 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CAD899C7
 for <etnaviv@lists.freedesktop.org>; Thu, 26 Sep 2019 16:04:56 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8QFqmqU081328
 for <etnaviv@lists.freedesktop.org>; Thu, 26 Sep 2019 12:04:55 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v8yw4hwfy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <etnaviv@lists.freedesktop.org>; Thu, 26 Sep 2019 12:04:54 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <etnaviv@lists.freedesktop.org> from <rppt@linux.ibm.com>;
 Thu, 26 Sep 2019 17:04:53 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 26 Sep 2019 17:04:41 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8QG4eJ744761120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Sep 2019 16:04:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C49C4A4054;
 Thu, 26 Sep 2019 16:04:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A5B1A405C;
 Thu, 26 Sep 2019 16:04:36 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.8.153])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 26 Sep 2019 16:04:36 +0000 (GMT)
Date: Thu, 26 Sep 2019 19:04:34 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19092616-0016-0000-0000-000002B10922
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092616-0017-0000-0000-00003311D734
Message-Id: <20190926160433.GD32311@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-26_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909260142
X-Mailman-Approved-At: Fri, 27 Sep 2019 13:37:43 +0000
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

SGksCgpPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAwODowOTo1MkFNIC0wNTAwLCBBZGFtIEZvcmQg
d3JvdGU6Cj4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTA6MTcgQU0gRmFiaW8gRXN0ZXZhbSA8
ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIFNlcCAyNSwgMjAxOSBh
dCA5OjE3IEFNIEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiA+
IEkgdHJpZWQgY21hPTI1Nk0gYW5kIG5vdGljZWQgdGhlIGNtYSBkdW1wIGF0IHRoZSBiZWdpbm5p
bmcgZGlkbid0Cj4gPiA+IGNoYW5nZS4gIERvIHdlIG5lZWQgdG8gc2V0dXAgYSByZXNlcnZlZC1t
ZW1vcnkgbm9kZSBsaWtlCj4gPiA+IGlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIGRpZD8KPiA+Cj4g
PiBJIGRvbid0IHRoaW5rIHNvLgo+ID4KPiA+IFdlcmUgeW91IGFibGUgdG8gaWRlbnRpZnkgd2hh
dCB3YXMgdGhlIGV4YWN0IGNvbW1pdCB0aGF0IGNhdXNlZCBzdWNoIHJlZ3Jlc3Npb24/Cj4gCj4g
SSB3YXMgYWJsZSB0byBuYXJyb3cgaXQgZG93biB0aGUgOTJkMTJmOTU0NGI3ICgibWVtYmxvY2s6
IHJlZmFjdG9yCj4gaW50ZXJuYWwgYWxsb2NhdGlvbiBmdW5jdGlvbnMiKSB0aGF0IGNhdXNlZCB0
aGUgcmVncmVzc2lvbiB3aXRoCj4gRXRuYXZpdi4KCgpDYW4geW91IHBsZWFzZSB0ZXN0IHdpdGgg
dGhpcyBjaGFuZ2U6CgpkaWZmIC0tZ2l0IGEvbW0vbWVtYmxvY2suYyBiL21tL21lbWJsb2NrLmMK
aW5kZXggN2Q0ZjYxYS4uMWY1YTBlYiAxMDA2NDQKLS0tIGEvbW0vbWVtYmxvY2suYworKysgYi9t
bS9tZW1ibG9jay5jCkBAIC0xMzU2LDkgKzEzNTYsNiBAQCBzdGF0aWMgcGh5c19hZGRyX3QgX19p
bml0IG1lbWJsb2NrX2FsbG9jX3JhbmdlX25pZChwaHlzX2FkZHJfdCBzaXplLAogCQlhbGlnbiA9
IFNNUF9DQUNIRV9CWVRFUzsKIAl9CiAKLQlpZiAoZW5kID4gbWVtYmxvY2suY3VycmVudF9saW1p
dCkKLQkJZW5kID0gbWVtYmxvY2suY3VycmVudF9saW1pdDsKLQogYWdhaW46CiAJZm91bmQgPSBt
ZW1ibG9ja19maW5kX2luX3JhbmdlX25vZGUoc2l6ZSwgYWxpZ24sIHN0YXJ0LCBlbmQsIG5pZCwK
IAkJCQkJICAgIGZsYWdzKTsKIAo+IEkgYWxzbyBub3RpY2VkIHRoYXQgaWYgSSBjcmVhdGUgYSBy
ZXNlcnZlZCBtZW1vcnkgbm9kZSBhcyB3YXMgZG9uZSBvbmUKPiBpbXg2dWwtY2NpbXg2dWxzb20u
ZHRzaSB0aGUgM0Qgc2VlbXMgdG8gd29yayBhZ2FpbiwgYnV0IHdpdGhvdXQgaXQsIEkKPiB3YXMg
Z2V0dGluZyBlcnJvcnMgcmVnYXJkbGVzcyBvZiB0aGUgJ2NtYT0yNTZNJyBvciBub3QuCj4gSSBk
b24ndCBoYXZlIGEgcHJvYmxlbSB1c2luZyB0aGUgcmVzZXJ2ZWQgbWVtb3J5LCBidXQgSSBndWVz
cyBJIGFtIG5vdAo+IHN1cmUgd2hhdCB0aGUgYW1vdW50IHNob3VsZCBiZS4gIEkga25vdyBmb3Ig
dGhlIHZpZGVvIGRlY29kaW5nIDEwODBwLAo+IEkgaGF2ZSBoaXN0b3JpY2FsbHkgdXNlZCBjbWE9
MTI4TSwgYnV0IHdpdGggdGhlIDNEIGFsc28gbmVlZGluZyBzb21lCj4gbWVtb3J5IGFsbG9jYXRp
b24sIGlzIHRoYXQgZW5vdWdoIG9yIHNob3VsZCBJIHVzZSAyNTZNPwo+IAo+IGFkYW0KCi0tIApT
aW5jZXJlbHkgeW91cnMsCk1pa2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0
bmF2aXY=
