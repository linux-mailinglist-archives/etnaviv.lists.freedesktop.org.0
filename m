Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32BC65C32C
	for <lists+etnaviv@lfdr.de>; Tue,  3 Jan 2023 16:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED8D10E200;
	Tue,  3 Jan 2023 15:40:26 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2956810E16E
 for <etnaviv@lists.freedesktop.org>; Mon,  2 Jan 2023 10:39:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id co23so25968111wrb.4
 for <etnaviv@lists.freedesktop.org>; Mon, 02 Jan 2023 02:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TN3FpV1I7tFu/Kpha9CDnNvHD7KVpRjqtfkjCmVPUO0=;
 b=CakuEVBcyWpVCHtq/gK0WL8H5kopdxqYu/fVo/dM+vHh1V8sZ+azV8nsGYLtljTXD/
 Jan0bb1u2z6DBTbYgWOe3F3oWRQkEXTN7ztpNDX9uesOCbQwTs9b9Gy1XnACehMALSO9
 epAapZem3wE9CprqWtC4EIdMuPaKyykdTAI9wvrGR8ecRb9OdNyNT5dW/mHVs/l8/LEX
 vzsBl2x2BPr3Ifx3ZZcZZBGkUw1+odEJ4t+2weznXeuIh+RfNJcTOzij+gzqWzQ3DqQR
 wh88hwAqkaRW9U7tYi3O+oxdt5Q5UAigMXZtSxG5GVpOOl3XSzR82YsrFvWlDDt7UISs
 7Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TN3FpV1I7tFu/Kpha9CDnNvHD7KVpRjqtfkjCmVPUO0=;
 b=2L/eGQxTZAlOTye0KDahanhRSs4uP2C7sfaWvbd5j4QcNZ5KE3hQn6MrtchLWUUNZ5
 waXWZ6vKdeXzq9T/GoMF9FbGp03d55iIKDyMCLHhIsxwnMcVC6OVDNRaZ7aiqirjZKVO
 iFM2U64fkEij0K93FGqYqKleDevyu148zM9usZPRH4mqTJbOM9sOgf22G5FZh0NPB0bK
 MWFDkJV/Gi7FjEps5X0C+/s4fp2P0l1O2C/ZQAX/149asItZIvq/UeAYahYz0rIl+mUx
 vRfkKiVn3P2VT2i8u5RWp6OTTdtS7gLgpX2oauu3ZiO426NI65CQKMJ+6mDWiWtj5MIy
 lx+g==
X-Gm-Message-State: AFqh2kpCUt53JvjLI+dAvMq/uDMuOIj6l/nVyom5WmJLuzOzJiH6J6Tp
 p2wuezQcvP9taIjbPJTUeW4s+A==
X-Google-Smtp-Source: AMrXdXvJmLCCviOiLhVE2Fn/tGQ7qfOD6ZJjjx6/aj9+9AjFtmpkJtNmUE2jJpa+634KcFkd2p2Kuw==
X-Received: by 2002:adf:f243:0:b0:26d:798f:ab8a with SMTP id
 b3-20020adff243000000b0026d798fab8amr22489628wrp.68.1672655986705; 
 Mon, 02 Jan 2023 02:39:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d4e4e000000b002549b649b62sm27810881wrt.50.2023.01.02.02.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 02:39:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
Subject: Re: (subset) [PATCH v6 0/8] Support for the NPU in Vim3
Message-Id: <167265598564.387036.9948295692448105822.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:39:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Tue, 03 Jan 2023 15:40:24 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, italonicola@collabora.com,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 David Airlie <airlied@gmail.com>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi,

On Fri, 2 Dec 2022 12:52:12 +0100, Tomeu Vizoso wrote:
> This series adds support for the Verisilicon VIPNano-QI NPU in the A311D
> as in the VIM3 board.
> 
> The IP is very closely based on previous Vivante GPUs, so the etnaviv
> kernel driver works basically unchanged.
> 
> The userspace part of the driver is being reviewed at:
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[4/8] arm64: dts: Add DT node for the VIPNano-QI on the A311D
      https://git.kernel.org/amlogic/c/18b542e544d3bd00e55d7135ee673b34dbfdb9b9
[8/8] arm64: dts: Fix NPU power domain references in Amlogic G12-based SoCs
      (no commit info)

These changes has been applied on the intermediate git tree [1].

The v6.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil
