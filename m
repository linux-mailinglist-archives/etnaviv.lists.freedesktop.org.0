Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72FA29EDD2
	for <lists+etnaviv@lfdr.de>; Thu, 29 Oct 2020 15:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAF089266;
	Thu, 29 Oct 2020 14:04:18 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D666ECDF
 for <etnaviv@lists.freedesktop.org>; Thu, 29 Oct 2020 14:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 625E6FB03;
 Thu, 29 Oct 2020 14:54:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6HYswL3shNB; Thu, 29 Oct 2020 14:54:40 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 4D2C844637; Thu, 29 Oct 2020 14:54:40 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org
Subject: [RFC PATCH 0/2] drm: etnaviv: Unmap gems on gem_close
Date: Thu, 29 Oct 2020 14:54:38 +0100
Message-Id: <cover.1603979517.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

VGhpcyBpcyBtZWFudCBhcyBhIFJGQyBzaW5jZSBpJ20gbm90IHN1cmUgaWYgdGhpcyBpcyB0aGUg
cmlnaHQKd2F5IHRvIGZpeCB0aGUgcHJvYmxlbToKClNvIGZhciB0aGUgdW5tYXAgZnJvbSBncHUg
YWRkcmVzcyBzcGFjZSBvbmx5IGhhcHBlbmVkIHdoZW4gZHJvcHBpbmcgdGhlCmxhc3QgcmVmIGlu
IGdlbV9mcmVlX29iamVjdF91bmxvY2tlZCwgaG93ZXZlciB0aGF0IGlzIHNraXBwZWQgaWYgdGhl
cmUncwpzdGlsbCBtdWx0aXBsZSBoYW5kbGVzIHRvIHRoZSBzYW1lIEdFTSBvYmplY3QuCgpTaW5j
ZSB1c2Vyc3BhY2UgKGhlcmUgbWVzYSkgaW4gdGhlIGNhc2Ugb2Ygc29mdHBpbiBoYW5kcyBiYWNr
IHRoZSBtZW1vcnkKcmVnaW9uIHRvIHRoZSBwb29sIG9mIGF2YWlsYWJsZSBHUFUgdmlydHVhbCBt
ZW1vcnkgY2xvc2luZyB0aGUgaGFuZGxlCnZpYSBEUk1fSU9DVExfR0VNX0NMT1NFIHRoaXMgY2Fu
IGxlYWQgdG8gZXRuYXZpdl9pb21tdV9pbnNlcnRfZXhhY3QKZmFpbGluZyBsYXRlciBzaW5jZSB1
c2Vyc3BhY2UgdGhpbmtzIHRoZSB2YWRkciBpcyBhdmFpbGFibGUgd2hpbGUgdGhlCmtlcm5lbCB0
aGlua3MgaXQgaXNuJ3QgbWFraW5nIHRoZSBzdWJtaXQgZmFpbCBsaWtlCgogICAgIFtFXSBzdWJt
aXQgZmFpbGVkOiAtMTQgKE5vIHNwYWNlIGxlZnQgb24gZGV2aWNlKSAoZXRuYV9jbWRfc3RyZWFt
X2ZsdXNoOjI0NCkKCkZpeCB0aGlzIGJ5IHVubWFwcGluZyB0aGUgbWVtb3J5IHZpYSB0aGUgLmdl
bV9jbG9zZV9vYmplY3QgY2FsbGJhY2suCgpUaGUgcGF0Y2ggaXMgYWdhaW5zdCA1LjkgYW5kIHdp
bGwgbmVlZCB0byBiZSByZWRvbmUgZm9yIGRybS1taXNjLW5leHQgZHVlIHRvCnRoZSBjb252ZXJz
aW9uIHRvIEdFTSBvYmplY3QgZnVuY3Rpb25zIGJ1dCBpJ20gaGFwcHkgdG8gZG8gdGhhdCBpdCBs
b29rcyBsaWtlCnRoZSByaWdodCBhcHByb2FjaC4KCkkgY2FuIHRyaWdnZXIgdGhlIHByb2JsZW0g
d2hlbiBwbHVnZ2luZy91bnBsdWdnaW5nIGEgRFAgc2NyZWVuIGRyaXZlbiBieSBEQ1NTCndoaWxl
IERTSSBpcyBkcml2ZW4gYnkgbXhzZmIuIEl0IHByZWZlcmFibHkgaGFwcGVucyB3aXRoIDRrIHNp
bmNlIHRoaXMKYWxsb2NhdGVzIGJpZ2dlciBjaHVua3MuCgpJIGFsc28gZm9sZGVkIGluIGEgY29t
bWl0IGNoZWNraW5nIGZvciB0aGUgY29udGV4dC0+bG9jayBpbgpldG5hdml2X2lvbW11X2luc2Vy
dF9leGFjdCBhbmQgZXRuYXZpdl9pb21tdV9yZW1vdmVfbWFwcGluZyB0b28gdG8gbWFrZSBpdApt
YXRjaCBldG5hdml2X2lvbW11X2ZpbmRfaW92YS4KCkd1aWRvIEfDvG50aGVyICgyKToKICBkcm06
IGV0bmF2aXY6IEFkZCBsb2NrZGVwIGFubm90YXRpb25zIGZvciBjb250ZXh0IGxvY2sKICBkcm06
IGV0bmF2aXY6IFVubWFwIGdlbXMgb24gZ2VtX2Nsb3NlCgogZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9kcnYuYyB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
ZHJ2LmggfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jIHwgMzIg
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X21tdS5jIHwgIDQgKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCgot
LSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXYK
