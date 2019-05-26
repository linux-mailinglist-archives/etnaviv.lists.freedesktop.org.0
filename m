Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859762ABC4
	for <lists+etnaviv@lfdr.de>; Sun, 26 May 2019 21:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3840389815;
	Sun, 26 May 2019 19:06:55 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386A6895C4;
 Sun, 26 May 2019 19:06:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t4so6459702wrx.7;
 Sun, 26 May 2019 12:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jciy0CPcOfW5rSBhopgRiyUGp58M7UNjX0KrkV/s2vY=;
 b=t4/AXDwg1QwkbNZ/FlcHnlAzokk4aAdHSNqFoO1tvRDSRccIK0Jijp6O8OKri/s3E7
 ptNEL0rF38vJuVrk00KiERXM22AuyYGyxywiBcecta6LfWHXEtNYuSvSF9PxhhZP91Ca
 ibXpVSn6CbpCjsiZfRXzhS7KsPBvr84A5gBjqnbMiP6iCZxu+YDLbY3I8TxuGlEdbh9i
 WWjYwG/BjsG7xRx41YJwOGP2hFKJF7Q3ImYwtIu0ew9sYpCt0qPl/eNY6GOT3K6GIKOB
 NMSmkp1ID6bGJOrMy/POXZPbNpQDZkBMEbMRm4leyntWekBrgGvH8Y3haWx/yFaaAwgp
 b1Bw==
X-Gm-Message-State: APjAAAUlQ6FBR5YsFrkBpX3qSMVAKZVoqtUsjVIv+ST1buROikN/Fio2
 mA0t1I5O75mIIqEuvORSCW5m1HmejFs=
X-Google-Smtp-Source: APXvYqzJlFXTPDQXnDQ/v2jde1M4kjSP5ETrw9/zuYNgYZPzqa60u4j6OuI3Z6KwDAyKG+LOZ9/Wwg==
X-Received: by 2002:adf:e711:: with SMTP id c17mr33738199wrm.227.1558897611498; 
 Sun, 26 May 2019 12:06:51 -0700 (PDT)
Received: from localhost.localdomain (80-110-110-254.cgn.dynamic.surfer.at.
 [80.110.110.254])
 by smtp.gmail.com with ESMTPSA id 205sm13464202wmd.43.2019.05.26.12.06.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 May 2019 12:06:50 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: mesa-dev@lists.freedesktop.org
Subject: [PATCH] etnaviv: rs: choose clear format based on block size
Date: Sun, 26 May 2019 21:06:51 +0200
Message-Id: <20190526190651.369-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jciy0CPcOfW5rSBhopgRiyUGp58M7UNjX0KrkV/s2vY=;
 b=IgUp1mbiwEtywCRC1AOaMhc4jAXWqQCqHrWweEeY19Vcz8gJHBvzJ+rEqpXSDIWrSJ
 MIvr9czev1UCkJpw89PpEsrZzHlg4Jvhfjd9aSyG71223CRF3wuYy/tvQJyesh7DKN+Q
 nCAePo2HITiGxKo2FktshZQtggdPCBDIybe1/0wfsGCaxNrMOYmyLyvpY/FClxkkrhD4
 uWn6Dg9n6cslOi9Vwpp50ZUVkqRiFASu299U25oTgCGV1FcD69MsfE9oW2P5TH6uks1/
 byYQYNbQi2Wdm8ipbvtmsXWBtk+PqcENZVu6Ud2IXGnkvXmy+qg4SmR/UDJxNHvFeZwC
 HwcA==
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

Rml4ZXMgZm9sbG93aW5nIHBpZ2xpdCBhbmQgZG9lcyBub3QgaW50cm9kdWNlIGFueSByZWdyZXNz
aW9ucy4KICBzcGVjQGV4dF9wYWNrZWRfZGVwdGhfc3RlbmNpbEBmYm8tZGVwdGgtZ2xfZGVwdGgy
NF9zdGVuY2lsOC1ibGl0CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0
aWFuLmdtZWluZXJAZ21haWwuY29tPgotLS0KIHNyYy9nYWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9l
dG5hdml2X3JzLmMgfCAxNCArKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zcmMvZ2FsbGl1bS9kcml2ZXJz
L2V0bmF2aXYvZXRuYXZpdl9ycy5jIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2
aXZfcnMuYwppbmRleCBlNjRiYWJmZGQwYS4uOGM4NWYzMjlmNzYgMTAwNjQ0Ci0tLSBhL3NyYy9n
YWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5hdml2X3JzLmMKKysrIGIvc3JjL2dhbGxpdW0vZHJp
dmVycy9ldG5hdml2L2V0bmF2aXZfcnMuYwpAQCAtMjU0LDcgKzI1NCwxOSBAQCBldG5hX3JzX2dl
bl9jbGVhcl9zdXJmYWNlKHN0cnVjdCBldG5hX2NvbnRleHQgKmN0eCwgc3RydWN0IGV0bmFfc3Vy
ZmFjZSAqc3VyZiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgY2xlYXJfdmFs
dWUpCiB7CiAgICBzdHJ1Y3QgZXRuYV9yZXNvdXJjZSAqZHN0ID0gZXRuYV9yZXNvdXJjZShzdXJm
LT5iYXNlLnRleHR1cmUpOwotICAgdWludDMyX3QgZm9ybWF0ID0gdHJhbnNsYXRlX3JzX2Zvcm1h
dChzdXJmLT5iYXNlLmZvcm1hdCk7CisgICB1aW50MzJfdCBmb3JtYXQ7CisKKyAgIHN3aXRjaCAo
dXRpbF9mb3JtYXRfZ2V0X2Jsb2Nrc2l6ZWJpdHMoc3VyZi0+YmFzZS5mb3JtYXQpKSB7CisgICBj
YXNlIDE2OgorICAgICAgZm9ybWF0ID0gUlNfRk9STUFUX0E0UjRHNEI0OworICAgICAgYnJlYWs7
CisgICBjYXNlIDMyOgorICAgICAgZm9ybWF0ID0gUlNfRk9STUFUX0E4UjhHOEI4OworICAgICAg
YnJlYWs7CisgICBkZWZhdWx0OgorICAgICAgZm9ybWF0ID0gRVROQV9OT19NQVRDSDsKKyAgICAg
IGJyZWFrOworICAgfQogCiAgICBpZiAoZm9ybWF0ID09IEVUTkFfTk9fTUFUQ0gpIHsKICAgICAg
IEJVRygiZXRuYV9yc19nZW5fY2xlYXJfc3VyZmFjZTogVW5oYW5kbGVkIGNsZWFyIGZtdCAlcyIs
IHV0aWxfZm9ybWF0X25hbWUoc3VyZi0+YmFzZS5mb3JtYXQpKTsKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5n
IGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
