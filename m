Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F522965B
	for <lists+etnaviv@lfdr.de>; Fri, 24 May 2019 12:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87C66E0D2;
	Fri, 24 May 2019 10:52:49 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A956E0B1;
 Fri, 24 May 2019 10:52:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e15so9539205wrs.4;
 Fri, 24 May 2019 03:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgxoXVCnKAayKNRD0obMSMuPn3KtkXPy0GRdbPAFGw8=;
 b=ngmEIY1cnAgTbSdBgl5XCYWLijRens/ZA9Zl3dqu3p22GQYNojzfnG8FZ+S45+IY2F
 vX4li5Wr6HvgRrO4khLH9uPadlI4PKG9rvk2a0OImFRSq2ToO513ZBlAkZHXh8xFJPOu
 TKoBu49y/agQwCaBFLprTNE/0Elk0u3q2HiWZAwW4u5Ybk95YdB0yk8y2u8Tp2aHVQAg
 We0QxJUpS0ut2jBr7KQY1BLdCzsmPNr+uayg4TSAs6Rr3Qq9nhwT72eoI4Dt0QPx4N4/
 zKHuiGOJ38AxUG6+NbQajId0zoVQsqdHlkpaWxcZIUhA3ac0LMBOf+k74PfobaVJNi4d
 F5cA==
X-Gm-Message-State: APjAAAVS6sPZs9aqztGGMGu7fVfe53/Jr7lu4uhthcTaZ1uKE15q9mB9
 oBzG2CpVPZob+nL1D3szpitefH75DNQ=
X-Google-Smtp-Source: APXvYqwQVdMAyiDnBxsxSzL5jgN0sm+G4kdLWTXC1mOKYYIVscXhkQ3jXbRGt8T4elnpAxx9S6g+rw==
X-Received: by 2002:a5d:6408:: with SMTP id z8mr4500074wru.238.1558694735193; 
 Fri, 24 May 2019 03:45:35 -0700 (PDT)
Received: from localhost.localdomain (80-110-110-254.cgn.dynamic.surfer.at.
 [80.110.110.254])
 by smtp.gmail.com with ESMTPSA id x187sm1863229wmb.33.2019.05.24.03.45.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 03:45:34 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: mesa-dev@lists.freedesktop.org
Subject: [PATCH 2/2] etnaviv: blt: s/TRUE/true && s/FALSE/false
Date: Fri, 24 May 2019 12:45:20 +0200
Message-Id: <20190524104520.5706-2-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190524104520.5706-1-christian.gmeiner@gmail.com>
References: <20190524104520.5706-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgxoXVCnKAayKNRD0obMSMuPn3KtkXPy0GRdbPAFGw8=;
 b=LAm9Jgpx3o9fSb6In/zXnf5Cx6dju/MfFtNFumQpXQsjC8Hqoddurx1TGYW7g9LO9H
 mtmuYAmbq+5tuOhxra42Y3pNTt533AoClXUT6tBr7GA3DWTtK5NXk3FJ2ns4lC2HB/Jo
 zt7c9qIyTEOgUSTr05J51X4g+EvYDZ4+mkQrmQUTM6fB9PggKm4DDYqM62BoU+f5UbOe
 ahfzNkTNoS9QmFB9ggl41cQS/IUD/L0J+TWHu830D/zjITunH8UcOrRy9g34qKaFQGLG
 shNDCHtAKY8w/4+v6MbLZxM2bcQdKyD9Y9hYus9389ALllo9838cGQr8C9seWb3MvrXb
 yXcA==
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
LmNvbT4KLS0tCiBzcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9ibHQuYyB8IDQg
KystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9ibHQuYyBiL3Ny
Yy9nYWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5hdml2X2JsdC5jCmluZGV4IDQyMTkwZDc1ZDRl
Li5jYjZlODE5OTlmYyAxMDA2NDQKLS0tIGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0
bmF2aXZfYmx0LmMKKysrIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfYmx0
LmMKQEAgLTQxOSw3ICs0MTksNyBAQCBldG5hX3RyeV9ibHRfYmxpdChzdHJ1Y3QgcGlwZV9jb250
ZXh0ICpwY3R4LAogICAgICAgLyogUmVzb2x2ZS1pbi1wbGFjZSAqLwogICAgICAgYXNzZXJ0KCFt
ZW1jbXAoJmJsaXRfaW5mby0+c3JjLCAmYmxpdF9pbmZvLT5kc3QsIHNpemVvZihibGl0X2luZm8t
PnNyYykpKTsKICAgICAgIGlmICghc3JjX2xldi0+dHNfc2l6ZSB8fCAhc3JjX2xldi0+dHNfdmFs
aWQpIC8qIE5vIFRTLCBubyB3b3JyaWVzICovCi0gICAgICAgICByZXR1cm4gVFJVRTsKKyAgICAg
ICAgIHJldHVybiB0cnVlOwogICAgICAgc3RydWN0IGJsdF9pbnBsYWNlX29wIG9wID0ge307CiAK
ICAgICAgIG9wLmFkZHIuYm8gPSBzcmMtPmJvOwpAQCAtNTE2LDcgKzUxNiw3IEBAIGV0bmFfdHJ5
X2JsdF9ibGl0KHN0cnVjdCBwaXBlX2NvbnRleHQgKnBjdHgsCiAgICBkc3QtPnNlcW5vKys7CiAg
ICBkc3RfbGV2LT50c192YWxpZCA9IGZhbHNlOwogCi0gICByZXR1cm4gVFJVRTsKKyAgIHJldHVy
biB0cnVlOwogfQogCiBzdGF0aWMgdm9pZAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2V0bmF2aXY=
