Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A6A3013E3
	for <lists+etnaviv@lfdr.de>; Sat, 23 Jan 2021 09:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBBA6E064;
	Sat, 23 Jan 2021 08:16:32 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Sat, 23 Jan 2021 08:16:30 UTC
Received: from qq.com (smtpbg411.qq.com [113.96.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D63A6E064
 for <etnaviv@lists.freedesktop.org>; Sat, 23 Jan 2021 08:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1611389333; bh=lDMno7FJOmFBJcRqTYwr0ZNfaXRwYydidAe+spJX/fE=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=N/QIkzcgnQbSmryZCyb+sX0IQAxw85wMGwKAtKpz96ab4caqzoBYIn/U6NDqFuNMb
 RYZX+XLX3kWTLPSItn0FQWSfyqF9cafwlSqxyET/wbAjpWZXNgr55rPxm9SJmFcb05
 aeKwwyFsecFnG7CpapoOsB2HlKn69TMP8i3ayGbk=
X-QQ-FEAT: tKEuZPfUcq1UFqtSFY7VQbUe1MmZwWp9WYw5ip1YzboCsUpTd1SRpRD40a8mx
 MJSTghYvpK4wnPDE0b9ibYoiTRnW7WG64JPevoP+bXxjIXmcVj4i40U5lT6gMyWGt+AGlbk
 IUSaPFKnZQ6qBAArfla5D7xrjVP0H3ktO1uqQ5UwZboco9Jbxk3lhcp93/ougVZJMeoIsQ7
 Ubls9CiUr2UlhxYxxCepE5EAD5hqO7ilz0+lA79NqXbRxYjJh2P4aNbstWP2rUUdJYDXHts
 d9aA1d3XO7eqJW
X-QQ-SSF: 0000000000000000000000000000004
X-QQ-XMAILINFO: Njbg2S9lA8MPzn4JYgUYeT8mdl+cUDJvC9IWAMJ0hAMl94z0mKgf1b2npAIazJ
 +Pg4uyEnQxr4oW9//PIdswj0j10ghA/VDjaEP2s1FrBlbKPKYicmJk7rdAdGCmmVVoQpBsKBAtc/f
 6X8D+Q53MXfj8Bf4zJIyO9XO/Dee7iCAy4nnayxwTprxKwLmfmF4SNs+UnHwe87O1S79y4oQWy1ml
 ODVnXa2QO0YgWWcYbzEI/ywxskzNx9k4jxU1aYeE557CtjLBOYtDRClkWZBaHbW4HiuQCNBY3hA/C
 2md704wV0dl3luut8E0vG9CFRUTWcalnjs4qoL54OLC/pNWz3mE2015M1KPSDsOTzTkfpDZ6++q1r
 ue+oWQez/ZSuN1J7aoz+g5ZJHdqs4RUOf/1Ebkj/ZuIJ6O2m7hiYDhSKxm7K4sjrQJU+XxLwsvJ1A
 8GdTyritRLYG+8gLrhxj5fiDAG8fglGxQ7Qt3n77+Rf2dvMKwgRAGK/iO3cG0xPHpUbDYmC8psoB0
 ASzkX3RV88tVPuoTGg6uvFxP6gL5dHTnsE6m2K6rZdMJUEEHatr8qLQw6i8bH3GBR1k8Clhe/foBb
 MNlVA7goQX2PAxbvkpchlQJ6UiCoy9LA411zrDRYouUZgJQFJNulEY8l0sAQtgn2UG7lYBDUjgcaS
 9xoBxK4yqvrBlA/akrtjlhOXduPJtQYvtUqnvwaJmQLgFeDSAGL8uTwPFnHtVqq/NGGUoyhXisPA1
 /RmsMA/Cv55c3xw==
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 120.204.44.79
X-QQ-STYLE: 
X-QQ-mid: webmail626t1611389331t3046339
From: "=?ISO-8859-1?B?cnRxcQ==?=" <yaffs@qq.com>
To: "=?ISO-8859-1?B?ZXRuYXZpdg==?=" <etnaviv@lists.freedesktop.org>
Subject: GC3000 MMU fault keep trigger, but mmu staus is zero
Mime-Version: 1.0
Date: Sat, 23 Jan 2021 16:08:51 +0800
X-Priority: 3
Message-ID: <tencent_EE1E8F43729F05D7D750904FC98DBD063606@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Sat, 23 Jan 2021 16:08:52 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign12
X-QQ-Bgrelay: 1
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
Content-Type: multipart/mixed; boundary="===============1656088723=="
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.

--===============1656088723==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_600BD993_106B09A8_2BA7EE01"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_600BD993_106B09A8_2BA7EE01
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGksIA0KDQpJIG1ldCAsJm5ic3A7IEdDMzAwMCBvZiBpLk1YNlFQICwmbmJzcDsgTU1VIGZh
dWx0Jm5ic3A7IGtlZXAgdHJpZ2dlciAsIGJ1dCB0aGUgbW11IHN0YXR1cyByZWdpc3RlciBp
cyB6ZXJvLg0KSSBhbSBub3QgdXNpbmcgdGhlIG9wZW4gc291cmNlIGV0bmF2aXYgZHJpdmVy
Lg0KDQpJc3N1ZSBsaWtlICwgbW11IHN0YXR1cyBpcyB6ZXJvIHRoZW4gYmVsb3cgbG9vcCBp
cyBza2lwZWQsIA0KDQpidXQgaXJxIG9mIG1tdSBmYXVsdCAmbmJzcDsga2VlcCB0cmlnZ2Vy
ICwgYW5kIGdvIG5leHQgcm91bmQgb2YgY29udGluZSAsIGdvIG9uIGxpa2UgdGhpcyAuLi4u
Li4NCg0KDQoNCnN0YXRpYyB2b2lkIGR1bXBfbW11X2ZhdWx0KHN0cnVjdCBldG5hdml2X2dw
dSAqZ3B1KToNCg0KCXN0YXR1cyA9IGdwdV9yZWFkKGdwdSwgc3RhdHVzX3JlZyk7DQoJZGV2
X2Vycl9yYXRlbGltaXRlZChncHUtJmd0O2RldiwgIk1NVSBmYXVsdCBzdGF0dXMgMHglMDh4
XG4iLCBzdGF0dXMpOw0KJm5ic3A7Zm9yIChpID0gMDsgaSA8IDQ7IGkrKykgeyANCg0KJm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHUzMiBhZGRyZXNzX3JlZzsgDQoNCiZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoIShzdGF0dXMgJmFtcDsgKFZJVlNfTU1VdjJfU1RB
VFVTX0VYQ0VQVElPTjBfX01BU0sgPDwgKGkgKiA0KSkpKSANCg0KJm5ic3A7Jm5ic3A7Jm5i
c3A7IGNvbnRpbnVlOw0KDQoNCk15IHF1ZXN0aW9uIGlzIHdoYXQga2luZCBpc3N1ZSBpdCBp
cywgZGlkIGl0IGlzIGEgcmVhbCBNTVUgZmF1bHQ7IA0KDQpNTVUgc3RhdHVzIHJlZ2lzdGVy
IHZhbHVlIGlzIHplcm8sIHRoZSBtZWFuaW5nIGlzPw0KQW55IGRlYnVnIG1ldGhvZCBmb3Ig
dGhpcyBraW5kIGlzc3VlLCBjb3VsZCB5b3UgcG9pbnQgb3V0IGRlYnVnIGNvZGUgb24gY3Vy
cmVudCBldG5hdml2IGRpdmVyPw0KDQoNClRoYW5rcw0KU3RvbmUgTGVl

------=_NextPart_600BD993_106B09A8_2BA7EE01
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGksIDxicj48YnI+SSBtZXQgLCZuYnNwOyBHQzMwMDAgb2YgaS5NWDZRUCAsJm5ic3A7IE1N
VSBmYXVsdCZuYnNwOyBrZWVwIHRyaWdnZXIgLCBidXQgdGhlIG1tdSBzdGF0dXMgcmVnaXN0
ZXIgaXMgemVyby48YnI+SSBhbSBub3QgdXNpbmcgdGhlIG9wZW4gc291cmNlIGV0bmF2aXYg
ZHJpdmVyLjxicj48YnI+PGRpdj5Jc3N1ZSBsaWtlICwgbW11IHN0YXR1cyBpcyB6ZXJvIHRo
ZW4gYmVsb3cgbG9vcCBpcyBza2lwZWQsIDxicj48L2Rpdj48ZGl2PmJ1dCBpcnEgb2YgbW11
IGZhdWx0ICZuYnNwOyBrZWVwIHRyaWdnZXIgLCBhbmQgZ28gbmV4dCByb3VuZCBvZiBjb250
aW5lICwgZ28gb24gbGlrZSB0aGlzIC4uLi4uLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PjxzcGFuIHN0eWxlPSJmb250LXN0eWxlOiBpdGFsaWM7Ij5zdGF0aWMgdm9pZCBkdW1w
X21tdV9mYXVsdChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSk6PGJyPjwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuIHN0eWxlPSJmb250LXN0eWxlOiBpdGFsaWM7Ij4Jc3RhdHVzID0gZ3B1X3Jl
YWQoZ3B1LCBzdGF0dXNfcmVnKTs8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9u
dC1zdHlsZTogaXRhbGljOyI+CWRldl9lcnJfcmF0ZWxpbWl0ZWQoZ3B1LSZndDtkZXYsICJN
TVUgZmF1bHQgc3RhdHVzIDB4JTA4eFxuIiwgc3RhdHVzKTs8L3NwYW4+PC9kaXY+PGRpdj48
c3BhbiBzdHlsZT0iZm9udC1zdHlsZTogaXRhbGljOyI+Jm5ic3A7Zm9yIChpID0gMDsgaSAm
bHQ7IDQ7IGkrKykgeyA8YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQt
c3R5bGU6IGl0YWxpYzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB1MzIgYWRk
cmVzc19yZWc7IDxicj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1zdHls
ZTogaXRhbGljOyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmICghKHN0YXR1cyAmYW1w
OyAoVklWU19NTVV2Ml9TVEFUVVNfRVhDRVBUSU9OMF9fTUFTSyAmbHQ7Jmx0OyAoaSAqIDQp
KSkpIDxicj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1zdHlsZTogaXRh
bGljOyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNvbnRpbnVlOzwvc3Bhbj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2Pk15IHF1ZXN0aW9uIGlzIHdoYXQga2luZCBpc3N1ZSBpdCBpcywgZGlk
IGl0IGlzIGEgcmVhbCBNTVUgZmF1bHQ7IDxicj48L2Rpdj48ZGl2Pk1NVSBzdGF0dXMgcmVn
aXN0ZXIgdmFsdWUgaXMgemVybywgdGhlIG1lYW5pbmcgaXM/PC9kaXY+QW55IGRlYnVnIG1l
dGhvZCBmb3IgdGhpcyBraW5kIGlzc3VlLCBjb3VsZCB5b3UgcG9pbnQgb3V0IGRlYnVnIGNv
ZGUgb24gY3VycmVudCBldG5hdml2IGRpdmVyPzxicj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRo
YW5rczwvZGl2PlN0b25lIExlZSA8YnI+PGJyPjxicj48YnI+

------=_NextPart_600BD993_106B09A8_2BA7EE01--




--===============1656088723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv

--===============1656088723==--



