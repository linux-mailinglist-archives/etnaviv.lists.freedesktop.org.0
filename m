Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043C1BDB22
	for <lists+etnaviv@lfdr.de>; Wed, 25 Sep 2019 11:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E90589895;
	Wed, 25 Sep 2019 09:38:15 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24516EADA;
 Tue, 24 Sep 2019 18:12:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 22E57AC93;
 Tue, 24 Sep 2019 18:12:51 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 00/11] of: Fix DMA configuration for non-DT masters
Date: Tue, 24 Sep 2019 20:12:31 +0200
Message-Id: <20190924181244.7159-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: f.fainelli@gmail.com, freedreno@lists.freedesktop.org, mbrugger@suse.com,
 wahrenst@gmx.net, james.quinlan@broadcom.com,
 Dan Williams <dan.j.williams@intel.com>, robin.murphy@arm.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgQWxsLAp0aGlzIHNlcmllcyB0cmllcyB0byBhZGRyZXNzIG9uZSBvZiB0aGUgaXNzdWVzIGJs
b2NraW5nIHVzIGZyb20KdXBzdHJlYW1pbmcgQnJvYWRjb20ncyBTVEIgUENJZSBjb250cm9sbGVy
WzFdLiBOYW1lbHksIHRoZSBmYWN0IHRoYXQKZGV2aWNlcyBub3QgcmVwcmVzZW50ZWQgaW4gRFQg
d2hpY2ggc2l0IGJlaGluZCBhIFBDSSBidXMgZmFpbCB0byBnZXQgdGhlCmJ1cycgRE1BIGFkZHJl
c3NpbmcgY29uc3RyYWludHMuCgpUaGlzIGlzIGR1ZSB0byB0aGUgZmFjdCB0aGF0IG9mX2RtYV9j
b25maWd1cmUoKSBhc3N1bWVzIGl0J3MgcmVjZWl2aW5nIGEKRFQgbm9kZSByZXByZXNlbnRpbmcg
dGhlIGRldmljZSBiZWluZyBjb25maWd1cmVkLCBhcyBvcHBvc2VkIHRvIHRoZSBQQ0llCmJyaWRn
ZSBub2RlIHdlIGN1cnJlbnRseSBwYXNzLiBUaGlzIGNhdXNlcyB0aGUgY29kZSB0byBkaXJlY3Rs
eSBqdW1wCmludG8gUENJJ3MgcGFyZW50IG5vZGUgd2hlbiBjaGVja2luZyBmb3IgJ2RtYS1yYW5n
ZXMnIGFuZCBtaXNzZXMKd2hhdGV2ZXIgd2FzIHNldCB0aGVyZS4KClRvIGFkZHJlc3MgdGhpcyBJ
IGNyZWF0ZSBhIG5ldyBBUEkgaW4gT0YgLSBpbnNwaXJlZCBmcm9tIFJvYmluIE11cnBoeXMKb3Jp
Z2luYWwgcHJvcG9zYWxbMl0gLSB3aGljaCBhY2NlcHRzIGEgYnVzIERUIG5vZGUgYXMgaXQncyBp
bnB1dCBpbgpvcmRlciB0byBjb25maWd1cmUgYSBkZXZpY2UncyBETUEgY29uc3RyYWludHMuIFRo
ZSBjaGFuZ2VzIGdvIGRlZXAgaW50bwpvZi9hZGRyZXNzLmMncyBpbXBsZW1lbnRhdGlvbiwgYXMg
YSBkZXZpY2UgYmVpbmcgaGF2aW5nIGEgRFQgbm9kZQphc3N1bXB0aW9uIHdhcyBwcmV0dHkgc3Ry
b25nLgoKT24gdG9wIG9mIHRoaXMgd29yaywgSSBhbHNvIGNsZWFuZWQgdXAgb2ZfZG1hX2NvbmZp
Z3VyZSgpIHJlbW92aW5nIGl0cwpyZWR1bmRhbnQgYXJndW1lbnRzIGFuZCBjcmVhdGluZyBhbiBh
bHRlcm5hdGl2ZSBmdW5jdGlvbiBmb3IgdGhlIHNwZWNpYWwgY2FzZXMKbm90IGFwcGxpY2FibGUg
dG8gZWl0aGVyIHRoZSBhYm92ZSBjYXNlIG9yIHRoZSBkZWZhdWx0IHVzYWdlLgoKSU1PIHRoZSBy
ZXN1bHRpbmcgZnVuY3Rpb25zIGFyZSBtb3JlIGV4cGxpY2l0LiBUaGV5IHdpbGwgcHJvYmFibHkK
c3VyZmFjZSBzb21lIGhhY2t5IHVzYWdlcyB0aGF0IGNhbiBiZSBwcm9wZXJseSBmaXhlZCBhcyBJ
IHNob3cgd2l0aCB0aGUKRFQgZml4ZXMgb24gdGhlIExheWVyc2NhcGUgcGxhdGZvcm0uCgpUaGlz
IHdhcyBhbHNvIHRlc3RlZCBvbiBhIFJhc3BiZXJyeSBQaSA0IHdpdGggYSBjdXN0b20gUENJZSBk
cml2ZXIgYW5kCm9uIGEgU2VhdHRsZSBBTUQgYm9hcmQuCgpSZWdhcmRzLApOaWNvbGFzCgpbMV0g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85NjUwMzQ1LyMyMDI5NDk2MQpbMl0g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85NjUwMzQ1LwoKLS0tCgpOaWNvbGFz
IFNhZW56IEp1bGllbm5lICgxMSk6CiAgb2Y6IGFkZHJlc3M6IGNsZWFuLXVwIHVudXNlZCB2YXJp
YWJsZSBpbiBvZl9kbWFfZ2V0X3JhbmdlKCkKICBvZjogYmFzZTogaW50cm9kdWNlIF9fb2Zfbl8q
X2NlbGxzX3BhcmVudCgpCiAgb2Y6IGFkZHJlc3M6IHVzZSBwYXJlbnQgRFQgbm9kZSBpbiBidXMt
PmNvdW50X2NlbGxzKCkKICBvZjogYWRkcmVzczogaW50cm9kdWNlIG9mX3RyYW5zbGF0ZV9kbWFf
YWRkcmVzc19wYXJlbnQoKQogIG9mOiBleHBvc2UgX19vZl9nZXRfZG1hX3BhcmVudCgpIHRvIE9G
IHN1YnN5c3RlbQogIG9mOiBhZGRyZXNzOiB1c2UgcGFyZW50IE9GIG5vZGUgaW4gb2ZfZG1hX2dl
dF9yYW5nZSgpCiAgZHRzOiBhcm02NDogbGF5ZXJzY2FwZTogYWRkIGRtYS1yYW5nZXMgcHJvcGVy
dHkgdG8gcW9yaWMtbWMgbm9kZQogIGR0czogYXJtNjQ6IGxheWVyc2NhcGU6IGFkZCBkbWEtcmFu
Z2VzIHByb3BlcnR5IHRvIHBjaWUgbm9kZXMKICBvZjogZGV2aWNlOiByZW1vdmUgY29tbWVudCBp
biBvZl9kbWFfY29uZmlndXJlKCkKICBvZjogZGV2aWNlOiBpbnRyb2R1Y2Ugb2ZfZG1hX2NvbmZp
Z3VyZV9wYXJlbnQoKQogIG9mOiBzaW1wbGlmeSBvZl9kbWFfY29uZmlnKCkncyBhcmd1bWVudHMK
CiAuLi4vYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwODhhLmR0c2kgfCAgIDEgKwog
Li4uL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMyMDh4YS5kdHNpIHwgICA1ICsKIC4u
Li9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEuZHRzaSB8ICAgMSArCiBkcml2
ZXJzL2Jhc2UvcGxhdGZvcm0uYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZl
cnMvYmNtYS9tYWluLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVy
cy9idXMvZnNsLW1jL2ZzbC1tYy1idXMuYyAgICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJz
L2RtYS9xY29tL2hpZG1hX21nbXQuYyAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuNGlfYmFja2VuZC5jICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udC5jICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUv
aG9zdDF4L2J1cy5jICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3Fjb20vdmVudXMvZmlybXdhcmUuYyAgfCAgIDIgKy0KIGRyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vczVwLW1mYy9zNXBfbWZjLmMgICAgICB8ICAgMiArLQogZHJpdmVycy9vZi9hZGRy
ZXNzLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTM2ICsrKysrKysrKy0tLS0tLS0tLQog
ZHJpdmVycy9vZi9iYXNlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDY5ICsrKysr
KystLQogZHJpdmVycy9vZi9kZXZpY2UuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDU5
ICsrKysrKystCiBkcml2ZXJzL29mL29mX3ByaXZhdGUuaCAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDUgKwogZHJpdmVycy9wY2kvcGNpLWRyaXZlci5jICAgICAgICAgICAgICAgICAgICAgIHwg
ICAzICstCiBkcml2ZXJzL3hlbi9nbnRkZXYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKy0KIGluY2x1ZGUvbGludXgvb2ZfYWRkcmVzcy5oICAgICAgICAgICAgICAgICAgICB8ICAg
OCArLQogaW5jbHVkZS9saW51eC9vZl9kZXZpY2UuaCAgICAgICAgICAgICAgICAgICAgIHwgIDIz
ICsrLQogMjIgZmlsZXMgY2hhbmdlZCwgMjIzIGluc2VydGlvbnMoKyksIDExMyBkZWxldGlvbnMo
LSkKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
