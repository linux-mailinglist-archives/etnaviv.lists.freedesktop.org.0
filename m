Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221E9BDB31
	for <lists+etnaviv@lfdr.de>; Wed, 25 Sep 2019 11:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4976EB6A;
	Wed, 25 Sep 2019 09:38:20 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0376EADA;
 Tue, 24 Sep 2019 18:13:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4A5C4ABBD;
 Tue, 24 Sep 2019 18:13:01 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 08/11] dts: arm64: layerscape: add dma-ranges property to pcie
 nodes
Date: Tue, 24 Sep 2019 20:12:39 +0200
Message-Id: <20190924181244.7159-9-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2019 09:38:15 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, f.fainelli@gmail.com,
 mbrugger@suse.com, wahrenst@gmx.net, james.quinlan@broadcom.com,
 robin.murphy@arm.com, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

VGhlIGJ1cyBiZWhpbmQgdGhlIGJvYXJkJ3MgUENJZSBjb3JlIGhhcyBETUEgYWRkcmVzc2luZyBs
aW1pdGF0aW9ucy4gQWRkCmFuIGVtcHR5ICdkbWEtcmFuZ2VzJyBwcm9wZXJ0eSBvbiBhbGwgUENJ
ZSBidXMgZGVzY3JpcHRpb25zIHRvIGluZm9ybQp0aGUgT0YgY29yZSB0aGF0IGEgdHJhbnNsYXRp
b24gaXMgZHVlIGZ1cnRoZXIgZG93biB0aGUgbGluZS4KClNpZ25lZC1vZmYtYnk6IE5pY29sYXMg
U2FlbnogSnVsaWVubmUgPG5zYWVuemp1bGllbm5lQHN1c2UuZGU+Ci0tLQoKIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczIwOHhhLmR0c2kgfCA0ICsrKysKIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9mc2wtbHMyMDh4YS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWxzMjA4eGEuZHRzaQppbmRleCBmZDYwMzZiNzg2NWMuLjJjNDFjZmM2NmJiOSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMjA4eGEuZHRzaQorKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMyMDh4YS5kdHNpCkBAIC02NDAs
NiArNjQwLDcgQEAKIAkJCSNzaXplLWNlbGxzID0gPDI+OwogCQkJZGV2aWNlX3R5cGUgPSAicGNp
IjsKIAkJCWRtYS1jb2hlcmVudDsKKwkJCWRtYS1yYW5nZXM7CiAJCQludW0tdmlld3BvcnQgPSA8
Nj47CiAJCQlidXMtcmFuZ2UgPSA8MHgwIDB4ZmY+OwogCQkJbXNpLXBhcmVudCA9IDwmaXRzPjsK
QEAgLTY2MSw2ICs2NjIsNyBAQAogCQkJI3NpemUtY2VsbHMgPSA8Mj47CiAJCQlkZXZpY2VfdHlw
ZSA9ICJwY2kiOwogCQkJZG1hLWNvaGVyZW50OworCQkJZG1hLXJhbmdlczsKIAkJCW51bS12aWV3
cG9ydCA9IDw2PjsKIAkJCWJ1cy1yYW5nZSA9IDwweDAgMHhmZj47CiAJCQltc2ktcGFyZW50ID0g
PCZpdHM+OwpAQCAtNjgyLDYgKzY4NCw3IEBACiAJCQkjc2l6ZS1jZWxscyA9IDwyPjsKIAkJCWRl
dmljZV90eXBlID0gInBjaSI7CiAJCQlkbWEtY29oZXJlbnQ7CisJCQlkbWEtcmFuZ2VzOwogCQkJ
bnVtLXZpZXdwb3J0ID0gPDI1Nj47CiAJCQlidXMtcmFuZ2UgPSA8MHgwIDB4ZmY+OwogCQkJbXNp
LXBhcmVudCA9IDwmaXRzPjsKQEAgLTcwMyw2ICs3MDYsNyBAQAogCQkJI3NpemUtY2VsbHMgPSA8
Mj47CiAJCQlkZXZpY2VfdHlwZSA9ICJwY2kiOwogCQkJZG1hLWNvaGVyZW50OworCQkJZG1hLXJh
bmdlczsKIAkJCW51bS12aWV3cG9ydCA9IDw2PjsKIAkJCWJ1cy1yYW5nZSA9IDwweDAgMHhmZj47
CiAJCQltc2ktcGFyZW50ID0gPCZpdHM+OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2V0bmF2aXY=
