Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E22BBDB23
	for <lists+etnaviv@lfdr.de>; Wed, 25 Sep 2019 11:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0BD89873;
	Wed, 25 Sep 2019 09:38:15 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 1329 seconds by postgrey-1.36 at gabe;
 Wed, 25 Sep 2019 07:04:33 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68AB6EA7A
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Sep 2019 07:04:33 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8P6b0M4038833
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Sep 2019 02:42:22 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v7yve6v02-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Sep 2019 02:42:22 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <etnaviv@lists.freedesktop.org> from <rppt@linux.ibm.com>;
 Wed, 25 Sep 2019 07:42:20 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 25 Sep 2019 07:42:18 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8P6gH2n22478876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 06:42:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65C5AA405B;
 Wed, 25 Sep 2019 06:42:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8B88A4055;
 Wed, 25 Sep 2019 06:42:16 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.8.153])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 25 Sep 2019 06:42:16 +0000 (GMT)
Date: Wed, 25 Sep 2019 09:42:15 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19092506-0012-0000-0000-000003504C83
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092506-0013-0000-0000-0000218ADF03
Message-Id: <20190925064214.GB1857@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-25_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909250066
X-Mailman-Approved-At: Wed, 25 Sep 2019 09:38:14 +0000
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 etnaviv@lists.freedesktop.org, linux-mm@kvack.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

KHVwZGF0ZWQgQ0MpCgpIaSwKCk9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDEyOjUyOjM1UE0gLTA1
MDAsIEFkYW0gRm9yZCB3cm90ZToKPiBPbiBNb24sIEphbiAyMSwgMjAxOSBhdCAyOjA1IEFNIE1p
a2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGksCj4gPgo+
ID4gdjIgY2hhbmdlczoKPiA+ICogcmVwbGFjZSBzb21lIG1vcmUgJWx1IHdpdGggJXp1Cj4gPiAq
IHJlbW92ZSBwYW5pY3Mgd2hlcmUgdGhleSBhcmUgbm90IG5lZWRlZCBpbiBzMzkwIGFuZCBpbiBw
cmludGsKPiA+ICogY29sbGVjdCBBY2tlZC1ieSBhbmQgUmV2aWV3ZWQtYnkuCj4gPgo+ID4KPiA+
IENocmlzdG9waGUgTGVyb3kgKDEpOgo+ID4gICBwb3dlcnBjOiB1c2UgbWVtYmxvY2sgZnVuY3Rp
b25zIHJldHVybmluZyB2aXJ0dWFsIGFkZHJlc3MKPiA+Cj4gPiBNaWtlIFJhcG9wb3J0ICgyMCk6
Cj4gPiAgIG9wZW5yaXNjOiBwcmVmZXIgbWVtYmxvY2sgQVBJcyByZXR1cm5pbmcgdmlydHVhbCBh
ZGRyZXNzCj4gPiAgIG1lbWJsb2NrOiByZXBsYWNlIG1lbWJsb2NrX2FsbG9jX2Jhc2UoQU5ZV0hF
UkUpIHdpdGggbWVtYmxvY2tfcGh5c19hbGxvYwo+ID4gICBtZW1ibG9jazogZHJvcCBtZW1ibG9j
a19hbGxvY19iYXNlX25pZCgpCj4gPiAgIG1lbWJsb2NrOiBlbXBoYXNpemUgdGhhdCBtZW1ibG9j
a19hbGxvY19yYW5nZSgpIHJldHVybnMgYSBwaHlzaWNhbCBhZGRyZXNzCj4gPiAgIG1lbWJsb2Nr
OiBtZW1ibG9ja19waHlzX2FsbG9jX3RyeV9uaWQoKTogZG9uJ3QgcGFuaWMKPiA+ICAgbWVtYmxv
Y2s6IG1lbWJsb2NrX3BoeXNfYWxsb2MoKTogZG9uJ3QgcGFuaWMKPiA+ICAgbWVtYmxvY2s6IGRy
b3AgX19tZW1ibG9ja19hbGxvY19iYXNlKCkKPiA+ICAgbWVtYmxvY2s6IGRyb3AgbWVtYmxvY2tf
YWxsb2NfYmFzZSgpCj4gPiAgIG1lbWJsb2NrOiByZWZhY3RvciBpbnRlcm5hbCBhbGxvY2F0aW9u
IGZ1bmN0aW9ucwo+ID4gICBtZW1ibG9jazogbWFrZSBtZW1ibG9ja19maW5kX2luX3JhbmdlX25v
ZGUoKSBhbmQgY2hvb3NlX21lbWJsb2NrX2ZsYWdzKCkgc3RhdGljCj4gPiAgIGFyY2g6IHVzZSBt
ZW1ibG9ja19hbGxvYygpIGluc3RlYWQgb2YgbWVtYmxvY2tfYWxsb2NfZnJvbShzaXplLCBhbGln
biwgMCkKPiA+ICAgYXJjaDogZG9uJ3QgbWVtc2V0KDApIG1lbW9yeSByZXR1cm5lZCBieSBtZW1i
bG9ja19hbGxvYygpCj4gPiAgIGlhNjQ6IGFkZCBjaGVja3MgZm9yIHRoZSByZXR1cm4gdmFsdWUg
b2YgbWVtYmxvY2tfYWxsb2MqKCkKPiA+ICAgc3BhcmM6IGFkZCBjaGVja3MgZm9yIHRoZSByZXR1
cm4gdmFsdWUgb2YgbWVtYmxvY2tfYWxsb2MqKCkKPiA+ICAgbW0vcGVyY3B1OiBhZGQgY2hlY2tz
IGZvciB0aGUgcmV0dXJuIHZhbHVlIG9mIG1lbWJsb2NrX2FsbG9jKigpCj4gPiAgIGluaXQvbWFp
bjogYWRkIGNoZWNrcyBmb3IgdGhlIHJldHVybiB2YWx1ZSBvZiBtZW1ibG9ja19hbGxvYyooKQo+
ID4gICBzd2lvdGxiOiBhZGQgY2hlY2tzIGZvciB0aGUgcmV0dXJuIHZhbHVlIG9mIG1lbWJsb2Nr
X2FsbG9jKigpCj4gPiAgIHRyZWV3aWRlOiBhZGQgY2hlY2tzIGZvciB0aGUgcmV0dXJuIHZhbHVl
IG9mIG1lbWJsb2NrX2FsbG9jKigpCj4gPiAgIG1lbWJsb2NrOiBtZW1ibG9ja19hbGxvY190cnlf
bmlkOiBkb24ndCBwYW5pYwo+ID4gICBtZW1ibG9jazogZHJvcCBtZW1ibG9ja19hbGxvY18qX25v
cGFuaWMoKSB2YXJpYW50cwo+ID4KPiBJIGtub3cgaXQncyByYXRoZXIgbGF0ZSwgYnV0IHRoaXMg
cGF0Y2ggYnJva2UgdGhlIEV0bmF2aXYgM0QgZ3JhcGhpY3MKPiBpbiBteSBpLk1YNlEuCiAKQ2Fu
IHlvdSBpZGVudGlmeSB0aGUgZXhhY3QgcGF0Y2ggZnJvbSB0aGUgc2VyaWVzIHRoYXQgY2F1c2Vk
IHRoZQpyZWdyZXNzaW9uPwoKPiBXaGVuIEkgdHJ5IHRvIHVzZSB0aGUgM0QsIGl0IHJldHVybnMg
c29tZSBlcnJvcnMgYW5kIHRoZSBkbWVzZyBsb2cKPiBzaG93cyBzb21lIG1lbW9yeSBhbGxvY2F0
aW9uIGVycm9ycyB0b286Cj4gWyAgICAzLjY4MjM0N10gZXRuYXZpdiBldG5hdml2OiBib3VuZCAx
MzAwMDAuZ3B1IChvcHMgZ3B1X29wcykKPiBbICAgIDMuNjg4NjY5XSBldG5hdml2IGV0bmF2aXY6
IGJvdW5kIDEzNDAwMC5ncHUgKG9wcyBncHVfb3BzKQo+IFsgICAgMy42OTUwOTldIGV0bmF2aXYg
ZXRuYXZpdjogYm91bmQgMjIwNDAwMC5ncHUgKG9wcyBncHVfb3BzKQo+IFsgICAgMy43MDA4MDBd
IGV0bmF2aXYtZ3B1IDEzMDAwMC5ncHU6IG1vZGVsOiBHQzIwMDAsIHJldmlzaW9uOiA1MTA4Cj4g
WyAgICAzLjcyMzAxM10gZXRuYXZpdi1ncHUgMTMwMDAwLmdwdTogY29tbWFuZCBidWZmZXIgb3V0
c2lkZSB2YWxpZAo+IG1lbW9yeSB3aW5kb3cKPiBbICAgIDMuNzMxMzA4XSBldG5hdml2LWdwdSAx
MzQwMDAuZ3B1OiBtb2RlbDogR0MzMjAsIHJldmlzaW9uOiA1MDA3Cj4gWyAgICAzLjc1MjQzN10g
ZXRuYXZpdi1ncHUgMTM0MDAwLmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+IG1l
bW9yeSB3aW5kb3cKPiBbICAgIDMuNzYwNTgzXSBldG5hdml2LWdwdSAyMjA0MDAwLmdwdTogbW9k
ZWw6IEdDMzU1LCByZXZpc2lvbjogMTIxNQo+IFsgICAgMy43NjY3NjZdIGV0bmF2aXYtZ3B1IDIy
MDQwMDAuZ3B1OiBJZ25vcmluZyBHUFUgd2l0aCBWRyBhbmQgRkUyLjAKPiBbICAgIDMuNzc2MTMx
XSBbZHJtXSBJbml0aWFsaXplZCBldG5hdml2IDEuMi4wIDIwMTUxMjE0IGZvciBldG5hdml2IG9u
IG1pbm9yIDAKPiAKPiAjIGdsbWFyazItZXMyLWRybQo+IEVycm9yIGNyZWF0aW5nIGdwdQo+IEVy
cm9yOiBlZ2xDcmVhdGVXaW5kb3dTdXJmYWNlIGZhaWxlZCB3aXRoIGVycm9yOiAweDMwMDkKPiBF
cnJvcjogZWdsQ3JlYXRlV2luZG93U3VyZmFjZSBmYWlsZWQgd2l0aCBlcnJvcjogMHgzMDA5Cj4g
RXJyb3I6IENhbnZhc0dlbmVyaWM6IEludmFsaWQgRUdMIHN0YXRlCj4gRXJyb3I6IG1haW46IENv
dWxkIG5vdCBpbml0aWFsaXplIGNhbnZhcwo+IAo+IAo+IEJlZm9yZSB0aGlzIHBhdGNoOgo+IAo+
IFsgICAgMy42OTE5OTVdIGV0bmF2aXYgZXRuYXZpdjogYm91bmQgMTMwMDAwLmdwdSAob3BzIGdw
dV9vcHMpCj4gWyAgICAzLjY5ODM1Nl0gZXRuYXZpdiBldG5hdml2OiBib3VuZCAxMzQwMDAuZ3B1
IChvcHMgZ3B1X29wcykKPiBbICAgIDMuNzA0NzkyXSBldG5hdml2IGV0bmF2aXY6IGJvdW5kIDIy
MDQwMDAuZ3B1IChvcHMgZ3B1X29wcykKPiBbICAgIDMuNzEwNDg4XSBldG5hdml2LWdwdSAxMzAw
MDAuZ3B1OiBtb2RlbDogR0MyMDAwLCByZXZpc2lvbjogNTEwOAo+IFsgICAgMy43MzM2NDldIGV0
bmF2aXYtZ3B1IDEzNDAwMC5ncHU6IG1vZGVsOiBHQzMyMCwgcmV2aXNpb246IDUwMDcKPiBbICAg
IDMuNzU2MTE1XSBldG5hdml2LWdwdSAyMjA0MDAwLmdwdTogbW9kZWw6IEdDMzU1LCByZXZpc2lv
bjogMTIxNQo+IFsgICAgMy43NjIyNTBdIGV0bmF2aXYtZ3B1IDIyMDQwMDAuZ3B1OiBJZ25vcmlu
ZyBHUFUgd2l0aCBWRyBhbmQgRkUyLjAKPiBbICAgIDMuNzcxNDMyXSBbZHJtXSBJbml0aWFsaXpl
ZCBldG5hdml2IDEuMi4wIDIwMTUxMjE0IGZvciBldG5hdml2IG9uIG1pbm9yIDAKPiAKPiBhbmQg
dGhlIDNEIGdlbW9zIHdvcmsgd2l0aG91dCB0aGlzLgo+IAo+IEkgZG9uJ3Qga25vdyBlbm91Z2gg
YWJvdXQgdGhlIGkuTVg2IG5vciB0aGUgM0QgYWNjZWxlcmF0b3IgdG8ga25vdyBob3cKPiB0byBm
aXggaXQuCj4gSSBhbSBob3Bpbmcgc29tZW9uZSBpbiB0aGUga25vdyBtaWdodCBoYXZlIHNvbWUg
c3VnZ2VzdGlvbnMuCgpDYW4geW91IHBsZWFzZSBhZGQgIm1lbWJsb2NrPWRlYnVnIiB0byB5b3Vy
IGtlcm5lbCBjb21tYW5kIGxpbmUgYW5kIHNlbmQKa2VybmVsIGxvZ3MgZm9yIGJvdGggd29ya2lu
ZyBhbmQgZmFpbGluZyB2ZXJzaW9ucz8gCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWls
aW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
