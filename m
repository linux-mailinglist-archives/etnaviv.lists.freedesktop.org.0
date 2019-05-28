Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381AF2CFB2
	for <lists+etnaviv@lfdr.de>; Tue, 28 May 2019 21:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83466E064;
	Tue, 28 May 2019 19:43:48 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EDE6E064;
 Tue, 28 May 2019 19:43:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b18so21510971wrq.12;
 Tue, 28 May 2019 12:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WmYE6qTbezTMOolZBnZpNuIT0CUalMx3aVBsA9KL04=;
 b=FzL+U7TNMVNjsxZhPzo6qtQrhuK/PT2V2Vu8hvGgugUgkvbWFzeC5SV5sFQHLUd3sD
 ozIFNXrec5Vy4iGpYuEW+KGIpGbpwtdVLdkQ72uZN5Cr3qb1Qf+EvEdjKLmXz/Zm/vTr
 mqZzjB5f31lLXow0jiauGOQZ//NGm300f0aUkqVSoH1O/ns28Sq/8bLjsRuTMxEkXwQJ
 zOZcx/XoB9qUH6ALIgqEjdtInj2q9XE7yOX7Z1E+dZK0qrHupS9etPZCfSxarv7cqPIh
 UsqLmHuzwZ00xFyqyHJBRXEdFH3wB5UReMY3xJLoZX0oyuQ8r3A0xQq7b7eq8XIrr4u5
 PsBQ==
X-Gm-Message-State: APjAAAW4RlY4RCOMDySWpB8huDhh48PbFc8xV+XfHiF0cEJoPO4BqWn9
 fLn36yVKU07Z1F/WTzYtPtcVcv2t
X-Google-Smtp-Source: APXvYqyoI83ZLHLaMfvQaOOKVCmsqMpHnZajkd12qNdYinfra8EbnSgzbdbCLV1MQ6HC8fYucMJbnA==
X-Received: by 2002:a5d:4a92:: with SMTP id o18mr23245281wrq.80.1559072626636; 
 Tue, 28 May 2019 12:43:46 -0700 (PDT)
Received: from localhost.localdomain (80-110-110-254.cgn.dynamic.surfer.at.
 [80.110.110.254])
 by smtp.gmail.com with ESMTPSA id 19sm3956209wmi.10.2019.05.28.12.43.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 May 2019 12:43:45 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: mesa-dev@lists.freedesktop.org
Subject: [PATCH] etnaviv: implement set_active_query_state(..) for hw queries
Date: Tue, 28 May 2019 21:43:51 +0200
Message-Id: <20190528194351.19003-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WmYE6qTbezTMOolZBnZpNuIT0CUalMx3aVBsA9KL04=;
 b=iT4Ue+s/YNReqmA4270BMa0di8QGaS1ba9FzEu8j3ELjpjuRaAd/XyL/KXNtvUhk24
 ZcHkOEJTAOXoGi4vikUKEbeJaAqygSZk5uvF6lr36EHFX6FMfX2MOwe3WoJW/MgocICh
 nNza/r6BZEffc/AKKCDm77b7h7P4jxtXB7BwBQBeNIw46wdQTsbR7MTR/aSO5Nb4clTm
 Wrtf2g5HQUmbJRzMazShIe017ByNmoNmb1QHSNCdVQB71JoehRMC2x0Ebs/yoH7ykJtx
 AeJ9t9N1Khbyzb1Lbuq4XSFhKolqV4+9fqQxPpsIP29RKBUGkpb4zdK28TIIaHf3E9ep
 GXBA==
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Q2xlYXIgdy8gcXVhZCB1c2VzIGEgbm9ybWFsIGRyYXcgd2hpY2ggYWRkcyB1cCB0byBPUS4gc3Qv
bWV0YQp1c2VzIHNldF9hY3RpdmVfcXVlcnlfc3RhdGUoLi4pIHRvIHRlbGwgdGhlIGRyaXZlciB0
byBwYXVzZQpxdWVyaWVzIGluIHN1Y2ggY2FzZXMuCgpGaXhlcyBzcGVjQGFyYl9vY2NsdXNpb25f
cXVlcnlAb2NjbHVzaW9uX3F1ZXJ5X21ldGFfc2F2ZSBwaWdsaXQuCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgotLS0KIHNyYy9n
YWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5hdml2X3F1ZXJ5LmMgfCAxMSArKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9xdWVyeS5jIGIvc3JjL2dh
bGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfcXVlcnkuYwppbmRleCBiMDc2ZTg3ZTc4Mi4u
YmQ3NWNhOTBiOGEgMTAwNjQ0Ci0tLSBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5h
dml2X3F1ZXJ5LmMKKysrIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfcXVl
cnkuYwpAQCAtMTM0LDggKzEzNCwxNyBAQCBldG5hX2dldF9kcml2ZXJfcXVlcnlfZ3JvdXBfaW5m
byhzdHJ1Y3QgcGlwZV9zY3JlZW4gKnBzY3JlZW4sIHVuc2lnbmVkIGluZGV4LAogfQogCiBzdGF0
aWMgdm9pZAotZXRuYV9zZXRfYWN0aXZlX3F1ZXJ5X3N0YXRlKHN0cnVjdCBwaXBlX2NvbnRleHQg
KnBpcGUsIGJvb2xlYW4gZW5hYmxlKQorZXRuYV9zZXRfYWN0aXZlX3F1ZXJ5X3N0YXRlKHN0cnVj
dCBwaXBlX2NvbnRleHQgKnBjdHgsIGJvb2xlYW4gZW5hYmxlKQogeworICAgc3RydWN0IGV0bmFf
Y29udGV4dCAqY3R4ID0gZXRuYV9jb250ZXh0KHBjdHgpOworCisgICBpZiAoZW5hYmxlKSB7Cisg
ICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHN0cnVjdCBldG5hX2h3X3F1ZXJ5LCBocSwgJmN0eC0+
YWN0aXZlX2h3X3F1ZXJpZXMsIG5vZGUpCisgICAgICAgICBldG5hX2h3X3F1ZXJ5X3Jlc3VtZSho
cSwgY3R4KTsKKyAgIH0gZWxzZSB7CisgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHN0cnVjdCBl
dG5hX2h3X3F1ZXJ5LCBocSwgJmN0eC0+YWN0aXZlX2h3X3F1ZXJpZXMsIG5vZGUpCisgICAgICAg
ICBldG5hX2h3X3F1ZXJ5X3N1c3BlbmQoaHEsIGN0eCk7CisgICB9CiB9CiAKIHZvaWQKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRu
YXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
