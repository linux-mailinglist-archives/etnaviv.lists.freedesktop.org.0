Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E46E19A
	for <lists+etnaviv@lfdr.de>; Fri, 19 Jul 2019 09:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2AD6E5AE;
	Fri, 19 Jul 2019 07:19:41 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CF46E0E4;
 Tue, 16 Jul 2019 21:42:41 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id t16so9724737pfe.11;
 Tue, 16 Jul 2019 14:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+natRHZ6L0BuGx+W5tA7MTs43222M5gkM31utxxbCOU=;
 b=e0m17xVKcUvytXknOsKbXU3B7ReFkn0IMACFGYCdw+7SHsdxzWRy6MkdQMKNdL/wk9
 VGYn8RiT0PVG4J0rKwMA25s+SNR1HDmDs0s39FlQAnYdzRIoY8j4h9I5LMufoGPMLC6n
 mlfricd39YdyUOsVXvUHmdPwbCmzDFa+xqm9oX+IVWltEycISW0Oa0funmgVwPCwYp4n
 XmfYPMKQUKwLsDYADHN13WY9ebbvdgJjdL+SwisKPdVL7fTirxGVe9ELWWWO/1uhau5f
 VhbLer+PFRxGV2vom8B/FKBZ4Z0uvbz0cAlGekuB5RiWe0jhD/n2/5E/zU3/16FLARNr
 MBcw==
X-Gm-Message-State: APjAAAURr6xla7d/83hriM1Zt5jv1mWlzB2nNJTyQpwwfP2CPGi1bQXh
 0afchu+EaRxnd2xumeQualVgrr1gCF64vg==
X-Google-Smtp-Source: APXvYqzfz/S5WZIpSAuwm3Dywv2EHXSbMUU2QF7mDGE4cV/Oh7IH2/0lpwu3uOVqyg5xVISogAbcDA==
X-Received: by 2002:a63:1658:: with SMTP id 24mr37706389pgw.167.1563313360593; 
 Tue, 16 Jul 2019 14:42:40 -0700 (PDT)
Received: from localhost ([100.118.89.203])
 by smtp.gmail.com with ESMTPSA id q22sm18809095pgh.49.2019.07.16.14.42.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 14:42:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm: plumb attaching dev thru to prime_pin/unpin
Date: Tue, 16 Jul 2019 14:37:41 -0700
Message-Id: <20190716213746.4670-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190716213746.4670-1-robdclark@gmail.com>
References: <20190716213746.4670-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:19:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+natRHZ6L0BuGx+W5tA7MTs43222M5gkM31utxxbCOU=;
 b=kN3NUoT12UjsD2xyZpN8e4MYUo58H5FkPsDaw8dzZE/ejR28e9veipDZu1ue9cFGNJ
 C9ZB5Ngpuq+di+buJJ/Y47TVf7fsGqHj2vxwz+U3KoDhMp3U07imodBdSnwCXjDsRyKy
 TVLJsb4D6EpfgBYl20dhWfgQiN4IuioGmF3wHHQZJOPVoT3bwtxGrlqOj6NTIzGPXb3O
 p3mszmW7RuMgdxXOfE/D3ASRGoZH71QWpyjfEHflYR5LADDR5ggU+8ZzdiCMyypEoFPP
 vBTopgbzZ2VpMO56qkbzYjBr59Ev6sZ/AffvJvMX6yIH49JK9TZh2AAKuy/8oJCspGrY
 Yn5Q==
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
Cc: Eric Biggers <ebiggers@google.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, nouveau@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Eric Anholt <eric@anholt.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Deepak Sharma <deepak.sharma@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 etnaviv@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKTmVlZGVkIGluIHRoZSBm
b2xsb3dpbmcgcGF0Y2ggZm9yIGNhY2hlIG9wZXJhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQp2MzogcmViYXNlZCBvbiBkcm0tdGlw
CgogZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAgICAgICAgICAgICAgICAgICB8IDggKysrKy0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJuYWwuaCAgICAgICAgICAgICAgfCA0ICsrLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyAgICAgICAgICAgICAgICAgfCA0ICsrLS0KIGRy
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtX3ByaW1lLmMgfCA0ICsrLS0KIGRyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2Rydi5oICAgICAgICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX2dlbV9wcmltZS5jICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmggICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfcHJpbWUuYyAgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX3ByaW1lLmMgICAgICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX3ByaW1lLmMgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS92Z2VtL3Zn
ZW1fZHJ2LmMgICAgICAgICAgICAgfCA0ICsrLS0KIGluY2x1ZGUvZHJtL2RybV9kcnYuaCAgICAg
ICAgICAgICAgICAgICAgICAgfCA1ICsrLS0tCiAxMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRp
b25zKCspLCAyNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwppbmRleCA4NDY4OWNjYWU4ODUuLmFm
MjU0OWM0NTAyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCkBAIC0xMjE1LDIyICsxMjE1LDIyIEBAIHZvaWQgZHJt
X2dlbV9wcmludF9pbmZvKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgdW5zaWduZWQgaW50IGluZGVu
dCwKIAkJb2JqLT5kZXYtPmRyaXZlci0+Z2VtX3ByaW50X2luZm8ocCwgaW5kZW50LCBvYmopOwog
fQogCi1pbnQgZHJtX2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCitpbnQgZHJt
X2dlbV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBkZXZpY2UgKmRldikK
IHsKIAlpZiAob2JqLT5mdW5jcyAmJiBvYmotPmZ1bmNzLT5waW4pCiAJCXJldHVybiBvYmotPmZ1
bmNzLT5waW4ob2JqKTsKIAllbHNlIGlmIChvYmotPmRldi0+ZHJpdmVyLT5nZW1fcHJpbWVfcGlu
KQotCQlyZXR1cm4gb2JqLT5kZXYtPmRyaXZlci0+Z2VtX3ByaW1lX3BpbihvYmopOworCQlyZXR1
cm4gb2JqLT5kZXYtPmRyaXZlci0+Z2VtX3ByaW1lX3BpbihvYmosIGRldik7CiAJZWxzZQogCQly
ZXR1cm4gMDsKIH0KIAotdm9pZCBkcm1fZ2VtX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqKQordm9pZCBkcm1fZ2VtX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1
Y3QgZGV2aWNlICpkZXYpCiB7CiAJaWYgKG9iai0+ZnVuY3MgJiYgb2JqLT5mdW5jcy0+dW5waW4p
CiAJCW9iai0+ZnVuY3MtPnVucGluKG9iaik7CiAJZWxzZSBpZiAob2JqLT5kZXYtPmRyaXZlci0+
Z2VtX3ByaW1lX3VucGluKQotCQlvYmotPmRldi0+ZHJpdmVyLT5nZW1fcHJpbWVfdW5waW4ob2Jq
KTsKKwkJb2JqLT5kZXYtPmRyaXZlci0+Z2VtX3ByaW1lX3VucGluKG9iaiwgZGV2KTsKIH0KIAog
dm9pZCAqZHJtX2dlbV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5oIGIvZHJpdmVycy9ncHUvZHJtL2RybV9p
bnRlcm5hbC5oCmluZGV4IDUxYTIwNTVjOGYxOC4uZTY0MDkwMzczZTNhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9p
bnRlcm5hbC5oCkBAIC0xMzMsOCArMTMzLDggQEAgdm9pZCBkcm1fZ2VtX3JlbGVhc2Uoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXZhdGUpOwogdm9pZCBk
cm1fZ2VtX3ByaW50X2luZm8oc3RydWN0IGRybV9wcmludGVyICpwLCB1bnNpZ25lZCBpbnQgaW5k
ZW50LAogCQkJY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwogCi1pbnQgZHJtX2dl
bV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwotdm9pZCBkcm1fZ2VtX3VucGluKHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKK2ludCBkcm1fZ2VtX3BpbihzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKm9iaiwgc3RydWN0IGRldmljZSAqZGV2KTsKK3ZvaWQgZHJtX2dlbV91bnBpbihz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGRldmljZSAqZGV2KTsKIHZvaWQgKmRy
bV9nZW1fdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7CiB2b2lkIGRybV9nZW1fdnVu
bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCB2b2lkICp2YWRkcik7CiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJp
bWUuYwppbmRleCAxODlkOTgwNDAyYWQuLjEyNjg2MDQzMmZmOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9wcmltZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwpA
QCAtNTc1LDcgKzU3NSw3IEBAIGludCBkcm1fZ2VtX21hcF9hdHRhY2goc3RydWN0IGRtYV9idWYg
KmRtYV9idWYsCiB7CiAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBkbWFfYnVmLT5wcml2
OwogCi0JcmV0dXJuIGRybV9nZW1fcGluKG9iaik7CisJcmV0dXJuIGRybV9nZW1fcGluKG9iaiwg
YXR0YWNoLT5kZXYpOwogfQogRVhQT1JUX1NZTUJPTChkcm1fZ2VtX21hcF9hdHRhY2gpOwogCkBA
IC01OTMsNyArNTkzLDcgQEAgdm9pZCBkcm1fZ2VtX21hcF9kZXRhY2goc3RydWN0IGRtYV9idWYg
KmRtYV9idWYsCiB7CiAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBkbWFfYnVmLT5wcml2
OwogCi0JZHJtX2dlbV91bnBpbihvYmopOworCWRybV9nZW1fdW5waW4ob2JqLCBhdHRhY2gtPmRl
dik7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9nZW1fbWFwX2RldGFjaCk7CiAKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtX3ByaW1lLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9wcmltZS5jCmluZGV4IGEwNTI5MmU4ZWQ2Zi4uNjdl
NjlhNWYwMGYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dl
bV9wcmltZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtX3ByaW1l
LmMKQEAgLTQzLDcgKzQzLDcgQEAgaW50IGV0bmF2aXZfZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmosCiAJcmV0dXJuIGV0bmF2aXZfb2JqLT5vcHMtPm1tYXAoZXRuYXZp
dl9vYmosIHZtYSk7CiB9CiAKLWludCBldG5hdml2X2dlbV9wcmltZV9waW4oc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmopCitpbnQgZXRuYXZpdl9nZW1fcHJpbWVfcGluKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJaWYgKCFvYmotPmltcG9ydF9h
dHRhY2gpIHsKIAkJc3RydWN0IGV0bmF2aXZfZ2VtX29iamVjdCAqZXRuYXZpdl9vYmogPSB0b19l
dG5hdml2X2JvKG9iaik7CkBAIC01NSw3ICs1NSw3IEBAIGludCBldG5hdml2X2dlbV9wcmltZV9w
aW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiAJcmV0dXJuIDA7CiB9CiAKLXZvaWQgZXRu
YXZpdl9nZW1fcHJpbWVfdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCit2b2lkIGV0
bmF2aXZfZ2VtX3ByaW1lX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCiB7CiAJaWYgKCFvYmotPmltcG9ydF9hdHRhY2gpIHsKIAkJc3RydWN0IGV0
bmF2aXZfZ2VtX29iamVjdCAqZXRuYXZpdl9vYmogPSB0b19ldG5hdml2X2JvKG9iaik7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2Rydi5oCmluZGV4IGVlN2I1MTJkYzE1OC4uMGVlYTY4NjE4YjY4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9kcnYuaApAQCAtMjg4LDggKzI4OCw4IEBAIHZvaWQgbXNtX2dlbV9wcmltZV92dW5tYXAo
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHZvaWQgKnZhZGRyKTsKIGludCBtc21fZ2VtX3By
aW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKTsKIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqbXNtX2dlbV9wcmltZV9pbXBvcnRfc2df
dGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJc3RydWN0IGRtYV9idWZfYXR0YWNobWVu
dCAqYXR0YWNoLCBzdHJ1Y3Qgc2dfdGFibGUgKnNnKTsKLWludCBtc21fZ2VtX3ByaW1lX3Bpbihz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7Ci12b2lkIG1zbV9nZW1fcHJpbWVfdW5waW4oc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOworaW50IG1zbV9nZW1fcHJpbWVfcGluKHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYpOwordm9pZCBtc21fZ2VtX3By
aW1lX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYp
Owogdm9pZCAqbXNtX2dlbV9nZXRfdmFkZHIoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwog
dm9pZCAqbXNtX2dlbV9nZXRfdmFkZHJfYWN0aXZlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
KTsKIHZvaWQgbXNtX2dlbV9wdXRfdmFkZHIoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3ByaW1lLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9nZW1fcHJpbWUuYwppbmRleCA1ZDY0ZTA2NzFmN2EuLmNjMDdiZjk0
ZTIwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3ByaW1lLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3ByaW1lLmMKQEAgLTQ3LDE0ICs0NywxNCBA
QCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm1zbV9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJcmV0dXJuIG1zbV9nZW1faW1wb3J0KGRldiwgYXR0YWNo
LT5kbWFidWYsIHNnKTsKIH0KIAotaW50IG1zbV9nZW1fcHJpbWVfcGluKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqKQoraW50IG1zbV9nZW1fcHJpbWVfcGluKHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJaWYgKCFvYmotPmltcG9ydF9hdHRhY2gp
CiAJCW1zbV9nZW1fZ2V0X3BhZ2VzKG9iaik7CiAJcmV0dXJuIDA7CiB9CiAKLXZvaWQgbXNtX2dl
bV9wcmltZV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKK3ZvaWQgbXNtX2dlbV9w
cmltZV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGRldmljZSAqZGV2
KQogewogCWlmICghb2JqLT5pbXBvcnRfYXR0YWNoKQogCQltc21fZ2VtX3B1dF9wYWdlcyhvYmop
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9nZW0uaCBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmgKaW5kZXggZmUzOTk5OGY2NWNjLi45
MWRjZjg5MTM4ZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
Z2VtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9nZW0uaApAQCAtMzIs
OSArMzIsOSBAQCBleHRlcm4gaW50IG5vdXZlYXVfZ2VtX2lvY3RsX2NwdV9maW5pKHN0cnVjdCBk
cm1fZGV2aWNlICosIHZvaWQgKiwKIGV4dGVybiBpbnQgbm91dmVhdV9nZW1faW9jdGxfaW5mbyhz
dHJ1Y3QgZHJtX2RldmljZSAqLCB2b2lkICosCiAJCQkJICBzdHJ1Y3QgZHJtX2ZpbGUgKik7CiAK
LWV4dGVybiBpbnQgbm91dmVhdV9nZW1fcHJpbWVfcGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
KTsKK2V4dGVybiBpbnQgbm91dmVhdV9nZW1fcHJpbWVfcGluKHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqLCBzdHJ1Y3QgZGV2aWNlICopOwogc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqbm91dmVh
dV9nZW1fcHJpbWVfcmVzX29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKik7Ci1leHRlcm4gdm9p
ZCBub3V2ZWF1X2dlbV9wcmltZV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKik7CitleHRl
cm4gdm9pZCBub3V2ZWF1X2dlbV9wcmltZV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKiwg
c3RydWN0IGRldmljZSAqKTsKIGV4dGVybiBzdHJ1Y3Qgc2dfdGFibGUgKm5vdXZlYXVfZ2VtX3By
aW1lX2dldF9zZ190YWJsZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKik7CiBleHRlcm4gc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpub3V2ZWF1X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoCiAJc3Ry
dWN0IGRybV9kZXZpY2UgKiwgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqLCBzdHJ1Y3Qgc2df
dGFibGUgKik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3By
aW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMKaW5kZXggMWZl
ZmM5M2FmMWQ3Li5kZWMyZDVlMzdiMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfcHJpbWUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X3ByaW1lLmMKQEAgLTg4LDcgKzg4LDcgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpub3V2ZWF1
X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlyZXR1
cm4gJm52Ym8tPmdlbTsKIH0KIAotaW50IG5vdXZlYXVfZ2VtX3ByaW1lX3BpbihzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaikKK2ludCBub3V2ZWF1X2dlbV9wcmltZV9waW4oc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9i
byAqbnZibyA9IG5vdXZlYXVfZ2VtX29iamVjdChvYmopOwogCWludCByZXQ7CkBAIC0xMDEsNyAr
MTAxLDcgQEAgaW50IG5vdXZlYXVfZ2VtX3ByaW1lX3BpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaikKIAlyZXR1cm4gMDsKIH0KIAotdm9pZCBub3V2ZWF1X2dlbV9wcmltZV91bnBpbihzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKK3ZvaWQgbm91dmVhdV9nZW1fcHJpbWVfdW5waW4oc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3Qg
bm91dmVhdV9ibyAqbnZibyA9IG5vdXZlYXVfZ2VtX29iamVjdChvYmopOwogCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfcHJpbWUuYwppbmRleCA3ZDM4MTZmY2E1YTguLjIxZTliNDRlYjJlNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfcHJpbWUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF9wcmltZS5jCkBAIC0yOCwxNCArMjgsMTQgQEAKIC8qIEVtcHR5IEltcGxlbWVudGF0aW9u
cyBhcyB0aGVyZSBzaG91bGQgbm90IGJlIGFueSBvdGhlciBkcml2ZXIgZm9yIGEgdmlydHVhbAog
ICogZGV2aWNlIHRoYXQgbWlnaHQgc2hhcmUgYnVmZmVycyB3aXRoIHF4bCAqLwogCi1pbnQgcXhs
X2dlbV9wcmltZV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCitpbnQgcXhsX2dlbV9w
cmltZV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBkZXZpY2UgKmRldikK
IHsKIAlzdHJ1Y3QgcXhsX2JvICpibyA9IGdlbV90b19xeGxfYm8ob2JqKTsKIAogCXJldHVybiBx
eGxfYm9fcGluKGJvKTsKIH0KIAotdm9pZCBxeGxfZ2VtX3ByaW1lX3VucGluKHN0cnVjdCBkcm1f
Z2VtX29iamVjdCAqb2JqKQordm9pZCBxeGxfZ2VtX3ByaW1lX3VucGluKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHF4bF9ibyAqYm8g
PSBnZW1fdG9fcXhsX2JvKG9iaik7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5j
CmluZGV4IGRlYWZmY2U1MGEyZS4uZjM0NDJiZDg2MGY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3ByaW1lLmMKQEAgLTgzLDcgKzgzLDcgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpy
YWRlb25fZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAog
CXJldHVybiAmYm8tPmdlbV9iYXNlOwogfQogCi1pbnQgcmFkZW9uX2dlbV9wcmltZV9waW4oc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCitpbnQgcmFkZW9uX2dlbV9wcmltZV9waW4oc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgcmFk
ZW9uX2JvICpibyA9IGdlbV90b19yYWRlb25fYm8ob2JqKTsKIAlpbnQgcmV0ID0gMDsKQEAgLTEw
MSw3ICsxMDEsNyBAQCBpbnQgcmFkZW9uX2dlbV9wcmltZV9waW4oc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmopCiAJcmV0dXJuIHJldDsKIH0KIAotdm9pZCByYWRlb25fZ2VtX3ByaW1lX3VucGlu
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQordm9pZCByYWRlb25fZ2VtX3ByaW1lX3VucGlu
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3Ry
dWN0IHJhZGVvbl9ibyAqYm8gPSBnZW1fdG9fcmFkZW9uX2JvKG9iaik7CiAJaW50IHJldCA9IDA7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL3ZnZW0vdmdlbV9kcnYuYwppbmRleCA3NmQ5NWI1ZTI4OWMuLmU3ZDEyZTkzYjFmMCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jCkBAIC0zMDcsNyArMzA3LDcgQEAgc3RhdGljIHZvaWQg
dmdlbV91bnBpbl9wYWdlcyhzdHJ1Y3QgZHJtX3ZnZW1fZ2VtX29iamVjdCAqYm8pCiAJbXV0ZXhf
dW5sb2NrKCZiby0+cGFnZXNfbG9jayk7CiB9CiAKLXN0YXRpYyBpbnQgdmdlbV9wcmltZV9waW4o
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCitzdGF0aWMgaW50IHZnZW1fcHJpbWVfcGluKHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0
IGRybV92Z2VtX2dlbV9vYmplY3QgKmJvID0gdG9fdmdlbV9ibyhvYmopOwogCWxvbmcgbl9wYWdl
cyA9IG9iai0+c2l6ZSA+PiBQQUdFX1NISUZUOwpAQCAtMzI1LDcgKzMyNSw3IEBAIHN0YXRpYyBp
bnQgdmdlbV9wcmltZV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiAJcmV0dXJuIDA7
CiB9CiAKLXN0YXRpYyB2b2lkIHZnZW1fcHJpbWVfdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpvYmopCitzdGF0aWMgdm9pZCB2Z2VtX3ByaW1lX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IGRybV92Z2VtX2dlbV9vYmpl
Y3QgKmJvID0gdG9fdmdlbV9ibyhvYmopOwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
ZHJ2LmggYi9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKaW5kZXggYjMzZjJjZWUyMDk5Li4yYjNkNzli
ZGU2ZTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaAorKysgYi9pbmNsdWRlL2Ry
bS9kcm1fZHJ2LmgKQEAgLTU5MiwyMCArNTkyLDE5IEBAIHN0cnVjdCBkcm1fZHJpdmVyIHsKIAkg
Ki8KIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKiAoKmdlbV9wcmltZV9pbXBvcnQpKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCiAJCQkJc3RydWN0IGRtYV9idWYgKmRtYV9idWYpOwotCiAJLyoqCiAJ
ICogQGdlbV9wcmltZV9waW46CiAJICoKIAkgKiBEZXByZWNhdGVkIGhvb2sgaW4gZmF2b3VyIG9m
ICZkcm1fZ2VtX29iamVjdF9mdW5jcy5waW4uCiAJICovCi0JaW50ICgqZ2VtX3ByaW1lX3Bpbiko
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOworCWludCAoKmdlbV9wcmltZV9waW4pKHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYpOwogCiAJLyoqCiAJICog
QGdlbV9wcmltZV91bnBpbjoKIAkgKgogCSAqIERlcHJlY2F0ZWQgaG9vayBpbiBmYXZvdXIgb2Yg
JmRybV9nZW1fb2JqZWN0X2Z1bmNzLnVucGluLgogCSAqLwotCXZvaWQgKCpnZW1fcHJpbWVfdW5w
aW4pKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKKwl2b2lkICgqZ2VtX3ByaW1lX3VucGlu
KShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGRldmljZSAqZGV2KTsKIAogCiAJ
LyoqCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
