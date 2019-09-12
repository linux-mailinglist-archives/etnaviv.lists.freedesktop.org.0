Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5A0B088B
	for <lists+etnaviv@lfdr.de>; Thu, 12 Sep 2019 08:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C586E8FD;
	Thu, 12 Sep 2019 06:01:22 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D336E029;
 Thu, 12 Sep 2019 02:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6DDFDFB03;
 Thu, 12 Sep 2019 04:40:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3IWeS0LC8kQt; Thu, 12 Sep 2019 04:40:40 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 5EB2D46CC3; Wed, 11 Sep 2019 19:40:36 -0700 (PDT)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: "To : Lucas Stach" <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>,
 Carlo Caione <ccaione@baylibre.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Angus Ainslie (Purism)" <angus@akkea.ca>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] dt-bindings: etnaviv: Add #cooling-cells
Date: Wed, 11 Sep 2019 19:40:36 -0700
Message-Id: <6e9d761598b2361532146f43161fd05f3eee6545.1568255903.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <cover.1568255903.git.agx@sigxcpu.org>
References: <cover.1568255903.git.agx@sigxcpu.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Sep 2019 06:01:21 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QWRkICNjb29saW5nLWNlbGxzIGZvciB3aGVuIHRoZSBncHUgYWN0cyBhcyBhIGNvb2xpbmcgZGV2
aWNlLgoKU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KLS0t
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2V0bmF2aXYvZXRuYXZpdi1kcm0udHh0
ICAgICAgICAgIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9ldG5hdml2L2V0
bmF2aXYtZHJtLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2V0bmF2aXYvZXRuYXZpdi1kcm0udHh0CmluZGV4IDhkZWYxMWIxNmEyNC4uNjQwNTkyZThhYjJl
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9l
dG5hdml2L2V0bmF2aXYtZHJtLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9ldG5hdml2L2V0bmF2aXYtZHJtLnR4dApAQCAtMjEsNiArMjEsNyBAQCBS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgogT3B0aW9uYWwgcHJvcGVydGllczoKIC0gcG93ZXItZG9tYWlu
czogYSBwb3dlciBkb21haW4gY29uc3VtZXIgc3BlY2lmaWVyIGFjY29yZGluZyB0bwogICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXJfZG9tYWluLnR4dAorLSAj
Y29vbGluZy1jZWxsczogOiBJZiB1c2VkIGFzIGEgY29vbGluZyBkZXZpY2UsIG11c3QgYmUgPDI+
CiAKIGV4YW1wbGU6CiAKLS0gCjIuMjMuMC5yYzEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZXRuYXZpdg==
