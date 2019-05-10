Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D63F19A4B
	for <lists+etnaviv@lfdr.de>; Fri, 10 May 2019 11:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73B889BF6;
	Fri, 10 May 2019 09:09:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CAE899DB;
 Fri, 10 May 2019 09:09:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 198so6637122wme.3;
 Fri, 10 May 2019 02:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tXzH3a+quGkSwnAi+5IfztIsYafs/Ilaib9rLEcXR3Q=;
 b=ZXtI1u+MM5tlc7g1L5z55ysVbf9zCI9B//1p4c0BPdp2bf2uA99zF/rSPOWXV2tx29
 IVCgh6hWfqZURXyPgltMsEnqSjDJ5CBv1Wa7s2St3G/8NP8PbNOJ+JjTk9j+HWxV8xvJ
 47megmWYEuboUZG0ISan/2mm+eJuqQ+xFBvyhn2J5qQIzjG2yRbm1BuyblEdADLrTC7w
 e1aZSBqTcECa+IJ0gHJWs28Mb+Mi4Wgrcw0CaPeiHrJ5h/CyeyXxZB9zPiT+2FSZVSUF
 rEgj92cf0Sbvt71jTrnP6t9Eahjg0bndXpBk4sLfRXABEeR6cd3sko8nYuep4QQUDSht
 tKnw==
X-Gm-Message-State: APjAAAW9kSefYOtaI1FUPWGCnWIE3eEEPYlcP7V0i2wnT7Df4jCyZM/y
 G+lZX7wqeD/5NWPonIeF0uS8JyD8CRQ=
X-Google-Smtp-Source: APXvYqxkZN2xE1hrwWMXyABvO1NECUpiJf/LseA+yDLy5+wOLcFrIwpGBq3MKLoQW2rbWugskiws1w==
X-Received: by 2002:a7b:c743:: with SMTP id w3mr6127087wmk.22.1557479376561;
 Fri, 10 May 2019 02:09:36 -0700 (PDT)
Received: from localhost.localdomain (80-110-110-254.cgn.dynamic.surfer.at.
 [80.110.110.254])
 by smtp.gmail.com with ESMTPSA id l18sm1645344wrv.38.2019.05.10.02.09.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 02:09:35 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: mesa-dev@lists.freedesktop.org
Subject: [RFC PATCH 15/17] eir: make use of eir_nir_lower_alu_to_scalar(..)
Date: Fri, 10 May 2019 11:09:13 +0200
Message-Id: <20190510090915.2739-16-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190510090915.2739-1-christian.gmeiner@gmail.com>
References: <20190510090915.2739-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tXzH3a+quGkSwnAi+5IfztIsYafs/Ilaib9rLEcXR3Q=;
 b=rjjLEiqFnJG/OBAKzlRDDNJeTcmdhp8mcdnHH/uNW4DbSmYTBD84gFmsccOQTgBBlF
 jNYtJv7brfy2BLEcFKNZ4ZHVOWdv0u/wwt3v48UG0XbDe7/w5qPqCgUxP2stM6Tb/+CG
 taVR4qNB2f5ikskBnrfSuNbPDxaENtRaBdc384YvsSbKvViiUHOj58Bz+Ui0A72YQgb1
 yVEkateqAyMQpzYEIflDNhkeCOS6lVcZjPqRHNxsEDdMLyHalpJYcozUgqzxc4XetNl3
 eqvaaizGXvodxIDINmDyZyr8Uj4HUdZ0oYo3BGSTfOTrCWyes62JWqUZYr/x6QLuHbUg
 xecQ==
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
 etnaviv@lists.freedesktop.org, cphealy@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWls
LmNvbT4KLS0tCiBzcmMvZXRuYXZpdi9jb21waWxlci9laXJfbmlyLmMgfCAyICsrCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc3JjL2V0bmF2aXYvY29tcGls
ZXIvZWlyX25pci5jIGIvc3JjL2V0bmF2aXYvY29tcGlsZXIvZWlyX25pci5jCmluZGV4IDZlNzVm
MmM1ZmQ4Li5hNTc5MDM3YTY2NyAxMDA2NDQKLS0tIGEvc3JjL2V0bmF2aXYvY29tcGlsZXIvZWly
X25pci5jCisrKyBiL3NyYy9ldG5hdml2L2NvbXBpbGVyL2Vpcl9uaXIuYwpAQCAtMTAyLDYgKzEw
Miw4IEBAIGVpcl9vcHRpbWl6ZV9uaXIoc3RydWN0IG5pcl9zaGFkZXIgKnMpCiAgICBPUFRfVihz
LCBuaXJfbG93ZXJfZ2xvYmFsX3ZhcnNfdG9fbG9jYWwpOwogICAgT1BUX1YocywgbmlyX2xvd2Vy
X3JlZ3NfdG9fc3NhKTsKIAorICAgT1BUX1YocywgZWlyX25pcl9sb3dlcl9hbHVfdG9fc2NhbGFy
KTsKKwogICAgT1BUX1YocywgbmlyX29wdF9hbGdlYnJhaWMpOwogCiAgICBlaXJfb3B0aW1pemVf
bG9vcChzKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5h
dml2
