Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60583BDB2D
	for <lists+etnaviv@lfdr.de>; Wed, 25 Sep 2019 11:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07DB6EB69;
	Wed, 25 Sep 2019 09:38:17 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CD26EAEE;
 Tue, 24 Sep 2019 18:13:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 93C9FAEF1;
 Tue, 24 Sep 2019 18:13:02 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 09/11] of: device: remove comment in of_dma_configure()
Date: Tue, 24 Sep 2019 20:12:40 +0200
Message-Id: <20190924181244.7159-10-nsaenzjulienne@suse.de>
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
Cc: f.fainelli@gmail.com, mbrugger@suse.com, wahrenst@gmx.net,
 james.quinlan@broadcom.com, robin.murphy@arm.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SXQncyBub3QgbG9uZ2VyIGFkdmlzZWQgdG8gdXNlIG5vdGlmaWVycyBpbiBvcmRlciB0byBzZXR1
cCBjdXN0b20gRE1BCm9wcy4KClNpZ25lZC1vZmYtYnk6IE5pY29sYXMgU2FlbnogSnVsaWVubmUg
PG5zYWVuemp1bGllbm5lQHN1c2UuZGU+Ci0tLQoKIGRyaXZlcnMvb2YvZGV2aWNlLmMgfCA0IC0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
b2YvZGV2aWNlLmMgYi9kcml2ZXJzL29mL2RldmljZS5jCmluZGV4IDI2N2I1MDlkZjUxNy4uMDE4
YzUyNjg4NTQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL2RldmljZS5jCisrKyBiL2RyaXZlcnMv
b2YvZGV2aWNlLmMKQEAgLTgxLDEwICs4MSw2IEBAIGludCBvZl9kZXZpY2VfYWRkKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKm9mZGV2KQogICoKICAqIFRyeSB0byBnZXQgZGV2aWNlcydzIERNQSBj
b25maWd1cmF0aW9uIGZyb20gRFQgYW5kIHVwZGF0ZSBpdAogICogYWNjb3JkaW5nbHkuCi0gKgot
ICogSWYgcGxhdGZvcm0gY29kZSBuZWVkcyB0byB1c2UgaXRzIG93biBzcGVjaWFsIERNQSBjb25m
aWd1cmF0aW9uLCBpdAotICogY2FuIHVzZSBhIHBsYXRmb3JtIGJ1cyBub3RpZmllciBhbmQgaGFu
ZGxlIEJVU19OT1RJRllfQUREX0RFVklDRSBldmVudHMKLSAqIHRvIGZpeCB1cCBETUEgY29uZmln
dXJhdGlvbi4KICAqLwogaW50IG9mX2RtYV9jb25maWd1cmUoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBib29sIGZvcmNlX2RtYSkKIHsKLS0gCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWls
aW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
