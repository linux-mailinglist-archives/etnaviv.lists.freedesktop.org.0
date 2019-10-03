Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2891CB013
	for <lists+etnaviv@lfdr.de>; Thu,  3 Oct 2019 22:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97D46E117;
	Thu,  3 Oct 2019 20:24:09 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBE989B69;
 Thu,  3 Oct 2019 16:34:05 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4263921783;
 Thu,  3 Oct 2019 16:34:05 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20191002160632.11140-1-krzk@kernel.org>
References: <20191002160632.11140-1-krzk@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Convert Generic Power Domain
 bindings to json-schema
User-Agent: alot/0.8.1
Date: Thu, 03 Oct 2019 09:34:04 -0700
Message-Id: <20191003163405.4263921783@mail.kernel.org>
X-Mailman-Approved-At: Thu, 03 Oct 2019 20:24:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570120445;
 bh=3Bz1OUoxGDjgeT98hppsGEw91e3Ye36LUrMKlBtqcSU=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=j/K162GHR8smbdtnU3kJ9VWiqmsrEwDD+5DiuSNo/q0iv/ITY+YoqW2+yjI1POSoX
 UhSWY7N6nAoeYF55YeI0ITa7Ya91LlcNCgn/L8LsNRbxn5mYuNKwbhWSHK+NX8cnXW
 fLO2UPAEPnRh95wTpBNoIcAzJl/2QPOMSTploa9s=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

UXVvdGluZyBLcnp5c3p0b2YgS296bG93c2tpICgyMDE5LTEwLTAyIDA5OjA2OjMwKQo+IENvbnZl
cnQgR2VuZXJpYyBQb3dlciBEb21haW4gYmluZGluZ3MgdG8gRFQgc2NoZW1hIGZvcm1hdCB1c2lu
Zwo+IGpzb24tc2NoZW1hLiAgVGhlIGNvbnN1bWVyIGJpbmRpbmdzIGFyZSBzcGxpdCB0byBzZXBh
cmF0ZSBmaWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4KPiAKPiAtLS0KCkFja2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpl
dG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
