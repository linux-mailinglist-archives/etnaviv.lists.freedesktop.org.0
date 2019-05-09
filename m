Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D595B19358
	for <lists+etnaviv@lfdr.de>; Thu,  9 May 2019 22:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A180889C61;
	Thu,  9 May 2019 20:24:31 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EE789C60;
 Thu,  9 May 2019 20:24:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b203so4817698wmb.4;
 Thu, 09 May 2019 13:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ep0gLQ03A/CuzhyRURUBtktl4+rus7OWNnPLTlbuiEM=;
 b=jf28EoB12UwupVmakaWoC1KehRzvDwGqdX2dut9vF43RESF44oOMEi5vmkhoOofUOI
 HagpfnX/Zahz0DRQWnSkU2dZLJjk1Cbh6lm7jskPiaX+k8Mq5f2k84KBv7h6UVjrrTto
 X2rf/eto9zBfh0VoU994jeTJK2aXdOkV2oonYCnV6CPx/nRcQ252zTdm16UoYE0b4//p
 De/eGi8ChzMKhrKOLvxe4FiX8+bcj70mBVZedLqn5v83AuU+Cl6tMbP6KIGNpzsC/P+f
 IRRnvUy8865rDCialvMU2RAs3+6Hn6dqlLaiXXfQgI1TOgEwAgF4/ZQjdwAr0zwxGCCf
 cfug==
X-Gm-Message-State: APjAAAXeXUlwIXhHwSK5sWCLQipdkFXVBfnt1p4gqnkuxZ54WUoFttMZ
 wyF6RI0XyZxs14Sm34zwCXyf8UdzcoE=
X-Google-Smtp-Source: APXvYqyD8i0miIgdaXekH3A4A2gsiG/V3SWWR3KryxugyzKnds5SJmBIccCX3LIqfcrszIusf9L2wQ==
X-Received: by 2002:a1c:7dd6:: with SMTP id y205mr1113659wmc.90.1557433468004; 
 Thu, 09 May 2019 13:24:28 -0700 (PDT)
Received: from localhost.localdomain (80-110-110-254.cgn.dynamic.surfer.at.
 [80.110.110.254])
 by smtp.gmail.com with ESMTPSA id b2sm3409372wrt.20.2019.05.09.13.24.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 13:24:27 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: mesa-dev@lists.freedesktop.org
Subject: [PATCH] etnaviv: use the correct uniform dirty bits
Date: Thu,  9 May 2019 22:24:22 +0200
Message-Id: <20190509202422.10165-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ep0gLQ03A/CuzhyRURUBtktl4+rus7OWNnPLTlbuiEM=;
 b=GbxJ2Zl5SN00QXX7PvegrbdBCVoQ6bzA0xn+2U5sEQ7zW9Zh0zl4svz/QQs9t/DSwv
 M47SkBJR6SOSn9NYn3AkhVVIav5bjez+EEaegStJBXwVeqOozHVVPjvhdIxKYOKDdtPA
 CEpRcqHO6Q3iDjW6a6JmDe/MPD0C1/iEc0tSFmHlMsEW2ZK6uDpvnBJdIP4U0KPVPprj
 PKtAuAu8iylScB/AVqyZt09quNoSofOvOe0J3Swpx+lEui9vRcA1/lczECfTVYyWOlSC
 4jPaUPE/REP7DoL8mlr/qjTjhrSn3IOhhdKP5SdVudHtt6b358KA12lZaq5vTeDXCGVP
 arQQ==
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
 mesa-stable@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Rm91bmQgZHVyaW5nIGNvZGUgaW5zcGVjdGlvbi4KCkNjOiBtZXNhLXN0YWJsZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5n
bWVpbmVyQGdtYWlsLmNvbT4KLS0tCiBzcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZp
dl9lbWl0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2
aXZfZW1pdC5jIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfZW1pdC5jCmlu
ZGV4IGVkN2I3ZWUzY2I4Li5lZTU0ZGFhYmYzZSAxMDA2NDQKLS0tIGEvc3JjL2dhbGxpdW0vZHJp
dmVycy9ldG5hdml2L2V0bmF2aXZfZW1pdC5jCisrKyBiL3NyYy9nYWxsaXVtL2RyaXZlcnMvZXRu
YXZpdi9ldG5hdml2X2VtaXQuYwpAQCAtNTc3LDEyICs1NzcsMTIgQEAgZXRuYV9lbWl0X3N0YXRl
KHN0cnVjdCBldG5hX2NvbnRleHQgKmN0eCkKICAgIHN0YXRpYyBjb25zdCB1aW50MzJfdCB1bmlm
b3JtX2RpcnR5X2JpdHMgPQogICAgICAgRVROQV9ESVJUWV9TSEFERVIgfCBFVE5BX0RJUlRZX0NP
TlNUQlVGOwogCi0gICBpZiAoZGlydHkgJiAodW5pZm9ybV9kaXJ0eV9iaXRzIHwgY3R4LT5zaGFk
ZXIuZnMtPnVuaWZvcm1zX2RpcnR5X2JpdHMpKQorICAgaWYgKGRpcnR5ICYgKHVuaWZvcm1fZGly
dHlfYml0cyB8IGN0eC0+c2hhZGVyLnZzLT51bmlmb3Jtc19kaXJ0eV9iaXRzKSkKICAgICAgIGV0
bmFfdW5pZm9ybXNfd3JpdGUoCiAgICAgICAgICBjdHgsIGN0eC0+c2hhZGVyLnZzLCAmY3R4LT5j
b25zdGFudF9idWZmZXJbUElQRV9TSEFERVJfVkVSVEVYXSwKICAgICAgICAgIGN0eC0+c2hhZGVy
X3N0YXRlLlZTX1VOSUZPUk1TLCAmY3R4LT5zaGFkZXJfc3RhdGUudnNfdW5pZm9ybXNfc2l6ZSk7
CiAKLSAgIGlmIChkaXJ0eSAmICh1bmlmb3JtX2RpcnR5X2JpdHMgfCBjdHgtPnNoYWRlci52cy0+
dW5pZm9ybXNfZGlydHlfYml0cykpCisgICBpZiAoZGlydHkgJiAodW5pZm9ybV9kaXJ0eV9iaXRz
IHwgY3R4LT5zaGFkZXIuZnMtPnVuaWZvcm1zX2RpcnR5X2JpdHMpKQogICAgICAgZXRuYV91bmlm
b3Jtc193cml0ZSgKICAgICAgICAgIGN0eCwgY3R4LT5zaGFkZXIuZnMsICZjdHgtPmNvbnN0YW50
X2J1ZmZlcltQSVBFX1NIQURFUl9GUkFHTUVOVF0sCiAgICAgICAgICBjdHgtPnNoYWRlcl9zdGF0
ZS5QU19VTklGT1JNUywgJmN0eC0+c2hhZGVyX3N0YXRlLnBzX3VuaWZvcm1zX3NpemUpOwotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpl
dG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
