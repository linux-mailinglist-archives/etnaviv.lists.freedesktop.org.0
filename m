Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D6832F17
	for <lists+etnaviv@lfdr.de>; Mon,  3 Jun 2019 13:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B186C89257;
	Mon,  3 Jun 2019 11:56:09 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A95989257
 for <etnaviv@lists.freedesktop.org>; Mon,  3 Jun 2019 11:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 9A22EFB03
 for <etnaviv@lists.freedesktop.org>; Mon,  3 Jun 2019 13:56:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GsqAwN7Fd7Vx for <etnaviv@lists.freedesktop.org>;
 Mon,  3 Jun 2019 13:56:06 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id B40C84994A; Mon,  3 Jun 2019 13:56:05 +0200 (CEST)
Date: Mon, 3 Jun 2019 13:56:05 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: etnaviv@lists.freedesktop.org
Subject: [MR] etnaviv: Fold in etnaviv specific libdrm bits
Message-ID: <20190603115605.GA5137@bogon.m.sigxcpu.org>
References: <CAH9NwWceSgGOYLvngSaGSTFh4rqkaSDppOWZwMfxvdUqN-JPxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH9NwWceSgGOYLvngSaGSTFh4rqkaSDppOWZwMfxvdUqN-JPxg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGksCihkdWUgdG8gdGhlIHNpemUgaSd2ZSBwdWJsaXNoZWQgdGhpcyB2aWEgYSBnaXRsYWIgTVIg
YW5kIHNpbmNlIEknbSBub3QKc3VyZSBldmVyeW9uZSBmb2xsb3cgdGhlc2UgYXMgd2VsbCk6CgpM
dWNhcyBzdWdnZXN0ZWQgdG8gZm9sZCB0aGUgZXRuYXZpdiBwYXJ0IG9mIGxpYmRybSBpbnRvIG1l
c2EgYXMgcHJlcGFyYXRpb24gZm9yCnNvZnRwaW4uICBTbyBoZXJlIHdlIGdvLiBJJ3ZlIGJlZW4g
dXNpbmcgdGhpcyBjb2RlIHF1aXRlIGEgd2hpbGUgbm93IGFuZCBqdXN0CnBvbGlzaGVkIGl0IGEg
Yml0IGZvciBzdWJtaXNzaW9uLgpUaGVzZSBjaGFuZ2VzIHdlcmUgZG9uZSBvdmVyIGxpYmRybSBh
cyBvZiA5MjJkOTI5OTQyNjc3NDMyNjYwMjRlY2NlYjczNGNlMGViYmNhODA4OgoKLSBVc2UgbWVz
YSdzIEFSUkFZX1NJWkUKLSBVc2UgbWVzYSdzIGF0b21pYyBkZWZpbml0aW9ucwotIFVzZSBtZXNh
J3Mgb3NfbWFwIGluc3RlYWQgb2YgZHJtX21hcAotIERyb3AgZHJtX3twdWJsaWMscHJpdmF0ZX0K
LSBSZW5hbWUgdGFibGVfbG9jayB0byBldG5hX2RybV90YWJsZV9sb2NrIHRvIGF2b2lkIGEgY29u
ZmxpY3Qgd2l0aCBmcmVlZHJlbm8ncwogIHRhYmxlX2xvY2suCi0gUmVuYW1lIGJvX2RlbCB0byBf
ZXRuYV9kcm1fYm9fZGVsIHRvIGF2b2lkIGEgY29uZmxpY3Qgd2l0aCBmcmVlZHJlbm8ncwotIGJv
X2RlbAoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS9tZXJnZV9yZXF1
ZXN0cy85NzAKCkNoZWVycywKIC0tIEd1aWRvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZXRuYXZpdg==
