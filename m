Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB6E2966A
	for <lists+etnaviv@lfdr.de>; Fri, 24 May 2019 12:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260F46E0E1;
	Fri, 24 May 2019 10:54:24 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027356E0E1;
 Fri, 24 May 2019 10:54:22 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id u16so5637008wrn.8;
 Fri, 24 May 2019 03:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=es2af5mk/xDXr3Di4DkJSXnztfDEsMmRf4gmi6/pG1w=;
 b=e4VfpH+COd5WRDce4x7CpLXUEUvLs3c3tMaa2c7vigH4hELjsHfykBJxqHGtWGBPWq
 p+qI7GGozwL5podVBHEPvlmGjKcLcUpWXbgKvRz9K1p0qRfaJLGfa2DcL8Its/REjW8m
 nCuFRcjqNMkFdeij2yQwMEoesmsOqFaSuYXVqWteFWsiQWlwTfR3PoF2NTl4kPSKTJ/F
 k/sDKNo3VwN++9NMtAz3lM81NTfBG+NzRZJSMTk3Qf0zvpza9A6SwvKMraxOtbqeS6T6
 /rUmlygvX202UV2hIdILkifiIqOlL9pWMGUySbgg3lqaVqlwceqdtvYmU8IJ+QeKYjqX
 PReQ==
X-Gm-Message-State: APjAAAWlC1d9dR2B3By+VIcMIdSjuPsljA/Lgla6b8KmEifPtQQq6wB6
 LGed6l7nxqTtWbTpNex3r4/sUt/1Z7g=
X-Google-Smtp-Source: APXvYqwpLQqXd28rNXV3JbxgNggO6B3OB+Myh6i0PaA1V+tBJ07gNgvd5Rvs/27e8X8dLNnlHKvb+Q==
X-Received: by 2002:a5d:4946:: with SMTP id r6mr12724978wrs.310.1558694731257; 
 Fri, 24 May 2019 03:45:31 -0700 (PDT)
Received: from localhost.localdomain (80-110-110-254.cgn.dynamic.surfer.at.
 [80.110.110.254])
 by smtp.gmail.com with ESMTPSA id x187sm1863229wmb.33.2019.05.24.03.45.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 03:45:30 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: mesa-dev@lists.freedesktop.org
Subject: [PATCH 1/2] etnaviv: rs: s/TRUE/true && s/FALSE/false
Date: Fri, 24 May 2019 12:45:19 +0200
Message-Id: <20190524104520.5706-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=es2af5mk/xDXr3Di4DkJSXnztfDEsMmRf4gmi6/pG1w=;
 b=vY3GuMH0xvMoyMk1oqePsUGo+EtDpTw8n2A2UDw/znHMoqGFyOaddDobJDVxjANALj
 +/C6yELo3kOJxy/i6nyN+k3u+EWNMciUy49eUgaUimwmeHJmgSTlc7hWkvFY6G1RYxjh
 XX/68ZLztFPkIJZnBN/OfOitLUzB+GXuUki07T7xEj7vkWlhziuXRqL7cbgX3URcn6wb
 NRAt1v8kymlalYbVfnyEfe2ao4OoFDMRIDiUwZ3LtBhe8Eayu+xhJkWxi4nW216Dzi0b
 XpD0RiGJdCf4gJe0dbFstxzU7qb1XSLUoVcPCAqHPheYo5mJNMlI9VPuJokwCYAI8I82
 CnRA==
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

U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWls
LmNvbT4KLS0tCiBzcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9ycy5jIHwgMTYg
KysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZp
dl9ycy5jIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfcnMuYwppbmRleCBh
OWQzODcyYWQ0MS4uZTY0YmFiZmRkMGEgMTAwNjQ0Ci0tLSBhL3NyYy9nYWxsaXVtL2RyaXZlcnMv
ZXRuYXZpdi9ldG5hdml2X3JzLmMKKysrIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0
bmF2aXZfcnMuYwpAQCAtNTQxLDcgKzU0MSw3IEBAIGV0bmFfdHJ5X3JzX2JsaXQoc3RydWN0IHBp
cGVfY29udGV4dCAqcGN0eCwKICAgIGFzc2VydChibGl0X2luZm8tPmRzdC5sZXZlbCA8PSBkc3Qt
PmJhc2UubGFzdF9sZXZlbCk7CiAKICAgIGlmICghdHJhbnNsYXRlX3NhbXBsZXNfdG9feHlzY2Fs
ZShzcmMtPmJhc2UubnJfc2FtcGxlcywgJm1zYWFfeHNjYWxlLCAmbXNhYV95c2NhbGUsIE5VTEwp
KQotICAgICAgcmV0dXJuIEZBTFNFOworICAgICAgcmV0dXJuIGZhbHNlOwogCiAgICAvKiBUaGUg
d2lkdGgvaGVpZ2h0IGFyZSBpbiBwaXhlbHM7IHRoZXkgZG8gbm90IGNoYW5nZSBhcyBhIHJlc3Vs
dCBvZgogICAgICogbXVsdGktc2FtcGxpbmcuIFNvLCB3aGVuIGJsaXR0aW5nIGZyb20gYSA0eCBt
dWx0aXNhbXBsZWQgc3VyZmFjZQpAQCAtNTUyLDE0ICs1NTIsMTQgQEAgZXRuYV90cnlfcnNfYmxp
dChzdHJ1Y3QgcGlwZV9jb250ZXh0ICpwY3R4LAogICAgICAgREJHKCJzY2FsaW5nIHJlcXVlc3Rl
ZDogc291cmNlICVkeCVkIGRlc3RpbmF0aW9uICVkeCVkIiwKICAgICAgICAgICBibGl0X2luZm8t
PnNyYy5ib3gud2lkdGgsIGJsaXRfaW5mby0+c3JjLmJveC5oZWlnaHQsCiAgICAgICAgICAgYmxp
dF9pbmZvLT5kc3QuYm94LndpZHRoLCBibGl0X2luZm8tPmRzdC5ib3guaGVpZ2h0KTsKLSAgICAg
IHJldHVybiBGQUxTRTsKKyAgICAgIHJldHVybiBmYWxzZTsKICAgIH0KIAogICAgLyogTm8gbWFz
a3MgLSBSUyBjYW4ndCBjb3B5IHNwZWNpZmljIGNoYW5uZWxzICovCiAgICB1bnNpZ25lZCBtYXNr
ID0gdXRpbF9mb3JtYXRfZ2V0X21hc2soYmxpdF9pbmZvLT5kc3QuZm9ybWF0KTsKICAgIGlmICgo
YmxpdF9pbmZvLT5tYXNrICYgbWFzaykgIT0gbWFzaykgewogICAgICAgREJHKCJzdWItbWFzayBy
ZXF1ZXN0ZWQ6IDB4JTAyeCB2cyBmb3JtYXQgbWFzayAweCUwMngiLCBibGl0X2luZm8tPm1hc2ss
IG1hc2spOwotICAgICAgcmV0dXJuIEZBTFNFOworICAgICAgcmV0dXJuIGZhbHNlOwogICAgfQog
CiAgICB1bnNpZ25lZCBzcmNfZm9ybWF0ID0gZXRuYV9jb21wYXRpYmxlX3JzX2Zvcm1hdChibGl0
X2luZm8tPnNyYy5mb3JtYXQpOwpAQCAtNTY5LDE4ICs1NjksMTggQEAgZXRuYV90cnlfcnNfYmxp
dChzdHJ1Y3QgcGlwZV9jb250ZXh0ICpwY3R4LAogICAgICAgIGJsaXRfaW5mby0+c2Npc3Nvcl9l
bmFibGUgfHwKICAgICAgICBibGl0X2luZm8tPmRzdC5ib3guZGVwdGggIT0gYmxpdF9pbmZvLT5z
cmMuYm94LmRlcHRoIHx8CiAgICAgICAgYmxpdF9pbmZvLT5kc3QuYm94LmRlcHRoICE9IDEpIHsK
LSAgICAgIHJldHVybiBGQUxTRTsKKyAgICAgIHJldHVybiBmYWxzZTsKICAgIH0KIAogICAgdW5z
aWduZWQgd19tYXNrLCBoX21hc2s7CiAKICAgIGV0bmFfZ2V0X3JzX2FsaWdubWVudF9tYXNrKGN0
eCwgc3JjLT5sYXlvdXQsICZ3X21hc2ssICZoX21hc2spOwogICAgaWYgKChibGl0X2luZm8tPnNy
Yy5ib3gueCAmIHdfbWFzaykgfHwgKGJsaXRfaW5mby0+c3JjLmJveC55ICYgaF9tYXNrKSkKLSAg
ICAgIHJldHVybiBGQUxTRTsKKyAgICAgIHJldHVybiBmYWxzZTsKIAogICAgZXRuYV9nZXRfcnNf
YWxpZ25tZW50X21hc2soY3R4LCBkc3QtPmxheW91dCwgJndfbWFzaywgJmhfbWFzayk7CiAgICBp
ZiAoKGJsaXRfaW5mby0+ZHN0LmJveC54ICYgd19tYXNrKSB8fCAoYmxpdF9pbmZvLT5kc3QuYm94
LnkgJiBoX21hc2spKQotICAgICAgcmV0dXJuIEZBTFNFOworICAgICAgcmV0dXJuIGZhbHNlOwog
CiAgICAvKiBFbnN1cmUgdGhhdCB0aGUgWiBjb29yZGluYXRlIGlzIHNhbmUgKi8KICAgIGlmIChk
c3QtPmJhc2UudGFyZ2V0ICE9IFBJUEVfVEVYVFVSRV9DVUJFKQpAQCAtNzM0LDcgKzczNCw3IEBA
IGV0bmFfdHJ5X3JzX2JsaXQoc3RydWN0IHBpcGVfY29udGV4dCAqcGN0eCwKICAgIGRzdC0+bGV2
ZWxzW2JsaXRfaW5mby0+ZHN0LmxldmVsXS50c192YWxpZCA9IGZhbHNlOwogICAgY3R4LT5kaXJ0
eSB8PSBFVE5BX0RJUlRZX0RFUklWRV9UUzsKIAotICAgcmV0dXJuIFRSVUU7CisgICByZXR1cm4g
dHJ1ZTsKIAogbWFudWFsOgogICAgaWYgKHNyYy0+bGF5b3V0ID09IEVUTkFfTEFZT1VUX1RJTEVE
ICYmIGRzdC0+bGF5b3V0ID09IEVUTkFfTEFZT1VUX1RJTEVEKSB7CkBAIC03NDQsNyArNzQ0LDcg
QEAgbWFudWFsOgogICAgICAgcmV0dXJuIGV0bmFfbWFudWFsX2JsaXQoZHN0LCBkc3RfbGV2LCBk
c3Rfb2Zmc2V0LCBzcmMsIHNyY19sZXYsIHNyY19vZmZzZXQsIGJsaXRfaW5mbyk7CiAgICB9CiAK
LSAgIHJldHVybiBGQUxTRTsKKyAgIHJldHVybiBmYWxzZTsKIH0KIAogc3RhdGljIHZvaWQKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
