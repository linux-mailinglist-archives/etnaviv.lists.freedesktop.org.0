Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6F0108B1C
	for <lists+etnaviv@lfdr.de>; Mon, 25 Nov 2019 10:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB236E0D6;
	Mon, 25 Nov 2019 09:44:06 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615F56E0C9
 for <etnaviv@lists.freedesktop.org>; Mon, 25 Nov 2019 09:44:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y11so13973005wrt.6
 for <etnaviv@lists.freedesktop.org>; Mon, 25 Nov 2019 01:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9P/88QZp3twV5ZMBCNpxP10Jrg6uWQ8vrgISj8qXSq0=;
 b=QpSRuou6FXT6d5uAI8K40T+twqPKCct3bW6pIL4XSlcZ/5Kg2hdsBVQFXo15y87aoz
 svvfm+IQJ4ZCftTDT4C7gbYlsZv+37AGJMDWluQLdXZir+cmzaE8SZ0SzMr/Nqhn4Grz
 21xW3nFIxHy6Lx2+6jwguc9VNAi/58ypSJGx1xeWICJPd4HFlWJizZGcZWUw7r5nDfu6
 4N8rFNWQZU+FuO/PvbefpBWUNrfjZeSc8BomlVCCfqDgKqxbM50vXYnseY3lx4my3c6j
 AxP71f87nAf93jkiXhyVkOPaOm0vjlqTwOHVI9Euhyxmxf43HbS7aAt34O71ivRW/Fzj
 ZVzw==
X-Gm-Message-State: APjAAAVjKTo7Q9EPE/mH/uQIUFHf7HBZGAQ+Q6ehM9Q1orD1cUDIjAX/
 zI2zWDOQnNvh9Muit75Kxc2/dQ==
X-Google-Smtp-Source: APXvYqwMoAw+yJfB7c4+ueaQWcTFXuuK+HTFpLh7X64EMiPuUMQeOpBynVtM55dhzAEGbCQtfXbzJw==
X-Received: by 2002:adf:e881:: with SMTP id d1mr31107065wrm.296.1574675044020; 
 Mon, 25 Nov 2019 01:44:04 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id x2sm7598233wmc.3.2019.11.25.01.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 01:44:03 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/etnaviv: Use dma_resv locking wrappers
Date: Mon, 25 Nov 2019 10:43:53 +0100
Message-Id: <20191125094356.161941-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
References: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9P/88QZp3twV5ZMBCNpxP10Jrg6uWQ8vrgISj8qXSq0=;
 b=AWsmPt6USB81qT6NHiMlHZ706OVrHW9Q0tPWLU1F7CErK+5wn0tFkPQw4/sJEfAA0e
 K7SEjtPAVRScXDrLZ/itQnv46WKecMzn9+W0Ct7RtrKxWlMbhdP1GlcbAnxyy9bJhU6x
 32uuhkdK+aBd7aaakAdZtZ/AZ8pF0cIOeAcZo=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SSdsbCBhZGQgbW9yZSBmYW5jeSBsb2dpYyB0byB0aGVtIHNvb24sIHNvIGV2ZXJ5b25lIHJlYWxs
eSBoYXMgdG8gdXNlCnRoZW0uIFBsdXMgdGhleSBhbHJlYWR5IHByb3ZpZGUgc29tZSBuaWNlIGFk
ZGl0aW9uYWwgZGVidWcKaW5mcmFzdHJ1Y3R1cmUgb24gdG9wIG9mIGRpcmVjdCB3d19tdXRleCB1
c2FnZSBmb3IgdGhlIGZlbmNlcyB0cmFja2VkCmJ5IGRtYV9yZXN2LgoKU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBMdWNhcyBTdGFjaCA8
bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KQ2M6IFJ1c3NlbGwgS2luZyA8bGludXgrZXRuYXZpdkBh
cm1saW51eC5vcmcudWs+CkNjOiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJA
Z21haWwuY29tPgpDYzogZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYyB8IDggKysrLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fc3VibWl0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYwppbmRleCBhYTNlNGMzYjA2M2EuLjk0
N2IyMTg2OGU3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9n
ZW1fc3VibWl0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fc3Vi
bWl0LmMKQEAgLTExMyw3ICsxMTMsNyBAQCBzdGF0aWMgdm9pZCBzdWJtaXRfdW5sb2NrX29iamVj
dChzdHJ1Y3QgZXRuYXZpdl9nZW1fc3VibWl0ICpzdWJtaXQsIGludCBpKQogCWlmIChzdWJtaXQt
PmJvc1tpXS5mbGFncyAmIEJPX0xPQ0tFRCkgewogCQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9i
aiA9ICZzdWJtaXQtPmJvc1tpXS5vYmotPmJhc2U7CiAKLQkJd3dfbXV0ZXhfdW5sb2NrKCZvYmot
PnJlc3YtPmxvY2spOworCQlkbWFfcmVzdl91bmxvY2sob2JqLT5yZXN2KTsKIAkJc3VibWl0LT5i
b3NbaV0uZmxhZ3MgJj0gfkJPX0xPQ0tFRDsKIAl9CiB9CkBAIC0xMzMsOCArMTMzLDcgQEAgc3Rh
dGljIGludCBzdWJtaXRfbG9ja19vYmplY3RzKHN0cnVjdCBldG5hdml2X2dlbV9zdWJtaXQgKnN1
Ym1pdCwKIAkJY29udGVuZGVkID0gaTsKIAogCQlpZiAoIShzdWJtaXQtPmJvc1tpXS5mbGFncyAm
IEJPX0xPQ0tFRCkpIHsKLQkJCXJldCA9IHd3X211dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmb2Jq
LT5yZXN2LT5sb2NrLAotCQkJCQkJCSAgdGlja2V0KTsKKwkJCXJldCA9IGRtYV9yZXN2X2xvY2so
b2JqLT5yZXN2LCB0aWNrZXQpOwogCQkJaWYgKHJldCA9PSAtRUFMUkVBRFkpCiAJCQkJRFJNX0VS
Uk9SKCJCTyBhdCBpbmRleCAldSBhbHJlYWR5IG9uIHN1Ym1pdCBsaXN0XG4iLAogCQkJCQkgIGkp
OwpAQCAtMTYxLDggKzE2MCw3IEBAIHN0YXRpYyBpbnQgc3VibWl0X2xvY2tfb2JqZWN0cyhzdHJ1
Y3QgZXRuYXZpdl9nZW1fc3VibWl0ICpzdWJtaXQsCiAJCW9iaiA9ICZzdWJtaXQtPmJvc1tjb250
ZW5kZWRdLm9iai0+YmFzZTsKIAogCQkvKiB3ZSBsb3N0IG91dCBpbiBhIHNlcW5vIHJhY2UsIGxv
Y2sgYW5kIHJldHJ5Li4gKi8KLQkJcmV0ID0gd3dfbXV0ZXhfbG9ja19zbG93X2ludGVycnVwdGli
bGUoJm9iai0+cmVzdi0+bG9jaywKLQkJCQkJCSAgICAgICB0aWNrZXQpOworCQlyZXQgPSBkbWFf
cmVzdl9sb2NrX3Nsb3dfaW50ZXJydXB0aWJsZShvYmotPnJlc3YsIHRpY2tldCk7CiAJCWlmICgh
cmV0KSB7CiAJCQlzdWJtaXQtPmJvc1tjb250ZW5kZWRdLmZsYWdzIHw9IEJPX0xPQ0tFRDsKIAkJ
CXNsb3dfbG9ja2VkID0gY29udGVuZGVkOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2V0bmF2aXY=
