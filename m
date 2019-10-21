Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691C8E47AC
	for <lists+etnaviv@lfdr.de>; Fri, 25 Oct 2019 11:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5FA6E951;
	Fri, 25 Oct 2019 09:45:15 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Mon, 21 Oct 2019 16:09:47 UTC
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABFA6E170
 for <etnaviv@lists.freedesktop.org>; Mon, 21 Oct 2019 16:09:46 +0000 (UTC)
IronPort-SDR: l2kcP3LEqHuW4Jzj4RCn51EREV7ci98Hr5/9pm9DaNcVcYS0jN9PddCzvdQlnhFXkWKbIsEjD8
 p3nWE2sGbAhzHdP0BWVrZrr0pGMo6yvWhEm87myEk+TM8FDcqAfoSQq3X/LzB8966ZZOa+/3qR
 rlSIaxEV141Ew3IAV/acX21lk5ANippT2vB1uQHTi2NTsKuolv++oBM7J5bPcMV8s2TzRdjWbw
 o4DpnH8ANPvb2otlW+/ZQLyb2BGS1b8mWRY86PwVdeZD1ghiJqqaW6KE/sKs+KbnFylEgm6AXC
 tsQ=
X-IronPort-AV: E=Sophos;i="5.67,324,1566856800"; 
   d="scan'208";a="2386771"
To: <etnaviv@lists.freedesktop.org>
From: Richard Leitner <richard.leitner@skidata.com>
Subject: Separate X11 screens for LVDS and HDMI (ZaphodHeads)
Message-ID: <eda37de6-2161-e865-bd5f-4b11ca515707@skidata.com>
Date: Mon, 21 Oct 2019 18:02:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
X-Mailman-Approved-At: Fri, 25 Oct 2019 09:45:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
 t=1571674187; x=1603210187;
 h=to:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=I7Vf2oiWiH7GTb4Xe38xwV/vyY9lD5+18xVmQMeogJc=;
 b=PW9JSpPBvEy3ipWLaCnQ++5y/9wYYH8NXrqQaVVItOt6TWWER7678zIM
 TGbHzGb7pDlWK1iCp3i2P0awT8pNblwPvcR2Q7tmP75TonflVchKw8sGv
 aNtk/JC51KPHlDQEEwwCnnq40O9P1w/e64uJvPBrSIM9L/KSWkd8pzPVg
 hs5677NLnz5DSblsrTXiUz9ssfcqWWwXsdCiev/VYtnuloX2ukkBhkwNk
 dEkohmkMReSLhsSwZOnA1ESUqjl/wdJPTKYAHcpCYTe2s9X4eP07HxxfJ
 vT+KQmTO1z61l97YUgxM0hRWEP2P385wW2mdI8lTGPDejiYPn+1JoWBgV
 A==;
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGksCkkgaG9wZSBJJ20gb24gdGhlIGNvcnJlY3QgbGlzdCBmb3Igc3VjaCBhIHF1ZXN0aW9uIGhl
cmUuCklmIG5vdCwgSSdkIGJlIGhhcHB5IGlmIHNvbWVvbmUgY291bGQgZ2l2ZSBtZSBhIHBvaW50
ZXIgd2hlcmUgdG8gcG9zdCAKdGhpcyBxdWVzdGlvbi4KCkknbSBydW5uaW5nIGEgTlhQIGkuTVg2
REwgcGxhdGZvcm0gd2l0aCB0aGUgbGF0ZXN0IExpbnV4IEtlcm5lbCAodjUuMy55KQphbmQgWDEx
ICh4Zjg2LXZpZGVvLWFybWFkYSkuIFVzaW5nIHRoZSBkZWZhdWx0IGNvbmZpZ3VyYXRpb24gZnJv
bSBbMV0KSSdtIGFibGUgdG8gdXNlIHRoZSBIRE1JIGFuZCBMVkRTIHBhcmFsbGVsIG9uIFNjcmVl
biAwOgoKcm9vdEBpbXg2On4jIHhyYW5kcgpTY3JlZW4gMDogbWluaW11bSAxIHggMSwgY3VycmVu
dCAxNjAwIHggNDgwLCBtYXhpbXVtIDQwOTYgeCA0MDk2CkhETUkxIGNvbm5lY3RlZCBwcmltYXJ5
IDgwMHg0ODArMCswIChub3JtYWwgbGVmdCBpbnZlcnRlZCByaWdodCB4IGF4aXMgeSAKYXhpcykg
MTUybW0geCA5MW1tCiAgICA4MDB4NDgwICAgICAgIDU5Ljk3KisKTFZEUzEgY29ubmVjdGVkIDgw
MHg0ODArODAwKzAgKG5vcm1hbCBsZWZ0IGludmVydGVkIHJpZ2h0IHggYXhpcyB5IGF4aXMpIAow
bW0geCAwbW0KICAgIDgwMHg0ODAgICAgICAgNTkuOTcqKwoKTm9uZXRoZWxlc3MgSSB3YW50IHRv
IGhhdmUgYSBzZXBhcmF0ZSBzY3JlZW4gZm9yIGJvdGggb2YgdGhlIGludGVyZmFjZXMsCnNvIExW
RFMxIHNob3VsZCBiZSBhdmFpbGFibGUgb24gIjowLjAiIGFuZCBIRE1JMSBzaG91bGQgYmUgYXZh
aWxhYmxlIG9uCiI6MC4xIi4KClRoaXMgZmVhdHVyZSBpcyBjYWxsZWQgIlphcGhvZEhlYWRzIiBm
b3IgIm5vdXZlYXUiLgoKSXMgc29tZXRoaW5nIHNpbWlsYXIgYXZhaWxhYmxlIGZvciB0aGUgaS5N
WDYgZGV2aWNlcyB1c2luZyAKZXRuYXZpdi94Zjg2LXZpZGVvLWFybWFkYT8KCkFueSBoZWxwIGlz
IGdyZWF0bHkgYXBwcmVjaWF0ZWQhIFRoYW5rIHlvdSEKCnJlZ2FyZHM7UmljaGFyZC5MCgpbMV0g
Cmh0dHA6Ly9naXQuYXJtLmxpbnV4Lm9yZy51ay9jZ2l0L3hmODYtdmlkZW8tYXJtYWRhLmdpdC90
cmVlL2NvbmYveG9yZy1zYW1wbGUuY29uZj9oPXVuc3RhYmxlLWRldmVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0
bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
