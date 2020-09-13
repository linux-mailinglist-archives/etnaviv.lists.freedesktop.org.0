Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517CA267D0B
	for <lists+etnaviv@lfdr.de>; Sun, 13 Sep 2020 03:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5776E471;
	Sun, 13 Sep 2020 01:19:16 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B446E471;
 Sun, 13 Sep 2020 01:19:15 +0000 (UTC)
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EFA8214F1;
 Sun, 13 Sep 2020 01:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599959955;
 bh=o2bVdjxpULrUup9iSKagiQwwz7bvCxt8RBPtA41IJI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mLDX/kSAHPstTpQFU0Ub0Jkklpf+ndKjNMoOainVadn5veQZ2o52M6ugwm9ew+9pk
 3f0SNghnkh0XmyvQLE0LtSRQ8HFsQrQzKURr10CRDTP9XN9yTpzrnSjvhhfVk5MKVr
 c9wqlv3O/upR0P0VfS6jQUqV5DxvhFbDFKR+kgD0=
Date: Sun, 13 Sep 2020 09:19:07 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 08/13] arm64: dts: imx8mm-var-som-symphony: Use newer
 interrupts property
Message-ID: <20200913011906.GC25109@dragon>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-9-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904145312.10960-9-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: etnaviv@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <etnaviv.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/etnaviv>
List-Post: <mailto:etnaviv@lists.freedesktop.org>
List-Help: <mailto:etnaviv-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, etnaviv@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Robert Chiras <robert.chiras@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Fri, Sep 04, 2020 at 04:53:07PM +0200, Krzysztof Kozlowski wrote:
> The int-gpios was deprecated in favor of generic interrupts property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied patch #8 ~ #13, thanks.
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
