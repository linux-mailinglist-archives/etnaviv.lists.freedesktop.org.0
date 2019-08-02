Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E347C7F6C0
	for <lists+etnaviv@lfdr.de>; Fri,  2 Aug 2019 14:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5E26EDF3;
	Fri,  2 Aug 2019 12:22:03 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832456EDE7
 for <etnaviv@lists.freedesktop.org>; Fri,  2 Aug 2019 12:21:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c2so73736170wrm.8
 for <etnaviv@lists.freedesktop.org>; Fri, 02 Aug 2019 05:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H5wGh69dp/2MC7doWK21wK95kqVnSSNKp+yReUaFMfw=;
 b=Q1e75UBb0feoxAWnbCypY5jBGWdXw0JG1MwLo6SgySrGuioQNJVNotwxrjvx46ZL1s
 v4djOUsFYytXFljT6otP1ejuo0syih2CTjMNuL3Yf3KUdeWfWI49/xgtxtMSNH84s5hc
 UQSoKdrjmhc4QybH1mkBbn+K7GEB+alchPFs2OFRIdrqsy/NX8wYgR7XMOZawxXz5MBj
 EsXuWY5MmfXyajf/E5zltC0HeQMRepuFjZb9F5uc8e0wDYjBsHFHreupB6QEMJyWl6k7
 dHNtJ/bMPVoZH8ffejQix9Rd9SPy+r0Px8jv0sdhBnYPq0+orpO73LtTAOEuFaPgQpP3
 OPTw==
X-Gm-Message-State: APjAAAV3loLnn5ILSKA8dhFE/hUDE+X7yMEXUg+HvnW2/7zt/BbXdlBM
 MkmGxoc/nOn+xZ1bhHfvMiE=
X-Google-Smtp-Source: APXvYqy+ImRfcO++8pTE4rtugXo1crID7Pxh+mRV5Xz2OkfmY1enRlxel8RpiDgIXD3i69edDA16dw==
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr92750552wrs.160.1564748472965; 
 Fri, 02 Aug 2019 05:21:12 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id n9sm120612691wrp.54.2019.08.02.05.21.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 05:21:12 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: defconfig: CONFIG_DRM_ETNAVIV=m
Date: Fri,  2 Aug 2019 14:20:28 +0200
Message-Id: <20190802122102.3932-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 02 Aug 2019 12:22:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H5wGh69dp/2MC7doWK21wK95kqVnSSNKp+yReUaFMfw=;
 b=BFng/ii5ClHBf1j1zpaCDA5IzvC99gvtcgwdudRhLryKG6xIUyU9jDeLLixoNyvf/B
 ixf/kgetSJEvj3F0WY3AGf1a4QSlN0zXBU5B10YKflkzqLpq6TH+Y+fk0tGT0u4oe6Rx
 Nh1yBs2HgyGjOoN00wDW73WDIqtCQyDEhMI+cOqYBUqyCFAAQmwdHPv5RAaAtgG+3PZl
 3lbtMZl6nZQcY6Y9QipEhJFrv1Q9gnxHnsZAmwZ84CwgSYsRVnlobDOfxt0WotLodijs
 IkZOKAZf/4fVuX7kXJhVsArdgSO7DkbilnpByIQ9omEPIKpFIAWQ2abShToFNQbduEcq
 vs6A==
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
Cc: Anson Huang <Anson.Huang@nxp.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, etnaviv@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Simon Horman <horms+renesas@verge.net.au>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Rm9yIGlteDggd2Ugd2FudCB0byBlbmFibGUgZXRuYXZpdiwgbGV0J3MgZW5hYmxlIGl0CmluIGRl
ZmNvbmZpZywgaXQgd2lsbCBiZSB1c2VmdWwgdG8gaGF2ZSBpdCBlbmFibGVkIGZvciBLZXJuZWxD
SQpib290IGFuZCBydW50aW1lIHRlc3RpbmcuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gR21l
aW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvY29uZmln
cy9kZWZjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgYi9hcmNoL2FybTY0L2NvbmZpZ3Mv
ZGVmY29uZmlnCmluZGV4IDBlNThlZjAyODgwYy4uYWU1YmJiY2U4YTMwIDEwMDY0NAotLS0gYS9h
cmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZj
b25maWcKQEAgLTUzMSw2ICs1MzEsNyBAQCBDT05GSUdfRFJNX1BBTkVMX1NJTVBMRT1tCiBDT05G
SUdfRFJNX1NJSTkwMlg9bQogQ09ORklHX0RSTV9JMkNfQURWNzUxMT1tCiBDT05GSUdfRFJNX1ZD
ND1tCitDT05GSUdfRFJNX0VUTkFWSVY9bQogQ09ORklHX0RSTV9ISVNJX0hJQk1DPW0KIENPTkZJ
R19EUk1fSElTSV9LSVJJTj1tCiBDT05GSUdfRFJNX01FU09OPW0KLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5n
IGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
