Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C680702
	for <lists+etnaviv@lfdr.de>; Sat,  3 Aug 2019 17:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E096E58B;
	Sat,  3 Aug 2019 15:33:50 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDAB6E574
 for <etnaviv@lists.freedesktop.org>; Sat,  3 Aug 2019 15:16:00 +0000 (UTC)
Received: from X250.getinternet.no (98.142.130.235.16clouds.com
 [98.142.130.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1B912073D;
 Sat,  3 Aug 2019 15:15:56 +0000 (UTC)
Date: Sat, 3 Aug 2019 17:15:52 +0200
From: Shawn Guo <shawnguo@kernel.org>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: CONFIG_DRM_ETNAVIV=m
Message-ID: <20190803151551.GR8870@X250.getinternet.no>
References: <20190802122102.3932-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802122102.3932-1-christian.gmeiner@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Sat, 03 Aug 2019 15:33:49 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564845360;
 bh=BEpL6l+3xiuW/IzVuyU+RrKo0dYWHViZQBu/4eOViPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oxpvC7IsJY1oxOl9aW34GdwmdCi/9TD3h8DJ+zYpVvddjomGXnatruz9azzvlFet8
 OQOz3LwIkMbWnolkOASN5g+J3vyZz7dSmGJckO5tDHzDchKMey+lIPmo9KKQOrH87d
 1+c8AwLARAAQb56ABJsx3yxjlOxDRAXGPoVorVOU=
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
Cc: Leonard Crestez <leonard.crestez@nxp.com>,
 Anson Huang <Anson.Huang@nxp.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDI6MjA6MjhQTSArMDIwMCwgQ2hyaXN0aWFuIEdtZWlu
ZXIgd3JvdGU6Cj4gRm9yIGlteDggd2Ugd2FudCB0byBlbmFibGUgZXRuYXZpdiwgbGV0J3MgZW5h
YmxlIGl0Cj4gaW4gZGVmY29uZmlnLCBpdCB3aWxsIGJlIHVzZWZ1bCB0byBoYXZlIGl0IGVuYWJs
ZWQgZm9yIEtlcm5lbENJCj4gYm9vdCBhbmQgcnVudGltZSB0ZXN0aW5nLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+CgpB
cHBsaWVkLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
