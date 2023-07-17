Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B14ED756198
	for <lists+etnaviv@lfdr.de>; Mon, 17 Jul 2023 13:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8174210E0EE;
	Mon, 17 Jul 2023 11:30:02 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 204EA10E231
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Jul 2023 11:09:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3BDA11FB
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Jul 2023 04:10:41 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2631B3F67D
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Jul 2023 04:09:58 -0700 (PDT)
Date: Mon, 17 Jul 2023 12:07:47 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm: Explicitly include correct DT includes
Message-ID: <ZLUhA1yxQQONA0eL@e110455-lin.cambridge.arm.com>
References: <20230714174545.4056287-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714174545.4056287-1-robh@kernel.org>
X-Mailman-Approved-At: Mon, 17 Jul 2023 11:30:00 +0000
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
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, etnaviv@lists.freedesktop.org,
 Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Ondrej Jirman <megi@xff.cz>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Icenowy Zheng <icenowy@aosc.io>, freedreno@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>, lima@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Liu Ying <victor.liu@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Alain Volmat <alain.volmat@foss.st.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-rpi-kernel@lists.infradead.org,
 Tian Tao <tiantao6@hisilicon.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-tegra@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, xen-devel@lists.xenproject.org,
 Daniel Vetter <daniel@ffwll.ch>, Tomi Valkeinen <tomba@kernel.org>,
 linux-sunxi@lists.linux.dev,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 John Stultz <jstultz@google.com>, Shawn Guo <shawnguo@kernel.org>,
 Ondrej Jirman <megous@megous.com>, linux-stm32@st-md-mailman.stormreply.com,
 Emma Anholt <emma@anholt.net>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Purism Kernel Team <kernel@puri.sm>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Dmitry B aryshkov <dmitry.baryshkov@linaro.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 11:45:34AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index cc7664c95a54..14ee79becacb 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -6,7 +6,7 @@
>   */
>  #include <linux/io.h>
>  #include <linux/iommu.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index c03cfd57b752..a5a9534d4353 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/debugfs.h>
>

For the komeda and malidp drivers:

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu


> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> index 99964f5a5457..2a6b91f752cb 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> @@ -7,7 +7,6 @@
>  
>  #include <linux/device.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/slab.h>
>  #include <linux/clk.h>
>  
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 2254457ab5d0..b9957da0f55a 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -9,7 +9,7 @@
>  #include <linux/device.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/slab.h>
>  
>  #include <media/cec.h>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index f50d65f54314..7457d38622b0 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -14,8 +14,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index f6822dfa3805..4aff817f82ce 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -29,7 +29,6 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/phy/phy.h>
>  #include <linux/phy/phy-dp.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index 8bfce21d6b90..d205e755e524 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -17,7 +17,7 @@
>  #include <linux/i2c.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index f7f436cf96e0..08bd5695ddae 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -10,7 +10,6 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index b8e52156b07a..0e4bac7dd04f 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -8,7 +8,6 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> index 386032a02599..21471a9a28b2 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> @@ -9,9 +9,9 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> index c806576b1e22..7984da9c0a35 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
> index aa8d47e7f40d..4d404f5ef87e 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9211.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
> @@ -16,7 +16,6 @@
>  #include <linux/i2c.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index 67368f23d4aa..8c5668dca0c4 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -7,7 +7,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 4a5f5c4f5dcc..8d54091ec66e 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -16,8 +16,8 @@
>  #include <linux/module.h>
>  #include <linux/mux/consumer.h>
>  #include <linux/of.h>
> -#include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/sys_soc.h>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
> index c9b6cb7678e3..ae3ab9262ef1 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> @@ -12,7 +12,6 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/pm.h>
>  #include <linux/regulator/consumer.h>
>  
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 043b8109e64a..46b2c5027690 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -16,8 +16,9 @@
>  #include <linux/delay.h>
>  #include <linux/irq.h>
>  #include <linux/media-bus-format.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
>  
>  #include <video/mipi_display.h>
>  
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index d85d9ee463b8..cbe8e778d7c7 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -8,8 +8,9 @@
>  
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
> +#include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_atomic_helper.h>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 9d6dcaf317a1..9df19d7b8445 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -14,7 +14,7 @@
>  #include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/regmap.h>
>  #include <linux/dma-mapping.h>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index b2efecf7d160..5cc9a63a65ff 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -13,7 +13,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 7e9f4ec8e780..061e8bd5915d 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -31,7 +31,7 @@
>  #include <linux/i2c.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 6252ac01e945..14201f73aab1 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -27,6 +27,7 @@
>  
>  #include <linux/device.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index de8c9894967c..bbc9c54871f4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -8,8 +8,8 @@
>  #include <linux/delay.h>
>  #include <linux/dma-fence.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 2867b39fa35e..4d986077738b 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -12,7 +12,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/irq.h>
>  #include <linux/mfd/syscon.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index 3126f735dedc..0156a5e94435 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -12,7 +12,6 @@
>  #include <linux/kernel.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index fc81f728e6ba..69ea33cae651 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -8,7 +8,8 @@
>   */
>  
>  #include <linux/component.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  
>  #include <drm/bridge/samsung-dsim.h>
>  #include <drm/drm_probe_helper.h>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 7f4a0be03dd1..8dde7b1e9b35 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -12,7 +12,6 @@
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> index 8706f377c349..ffb327c5139e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> @@ -12,7 +12,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/sizes.h>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> index 20608e9780ce..f2b8b09a6b4e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -11,7 +11,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index b7c11bdce2c8..f3aaa4ea3e68 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -21,8 +21,8 @@
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 8d333db813b7..b302392ff0d7 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -18,7 +18,6 @@
>  #include <linux/kernel.h>
>  #include <linux/ktime.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index 9c5d49bf40c9..711f7ce9894a 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -11,9 +11,9 @@
>   *	Xinwei Kong <kong.kongxinwei@hisilicon.com>
>   */
>  
> -#include <linux/of_platform.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> index 5d1779ab65c0..4f3af0dfb344 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -4,8 +4,9 @@
>   */
>  
>  #include <linux/clk.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <drm/drm_bridge_connector.h>
> @@ -198,7 +199,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  
>  	dcss->of_port = of_graph_get_port_by_id(dev->of_node, 0);
>  	if (!dcss->of_port) {
> -		dev_err(dev, "no port@0 node in %s\n", dev->of_node->full_name);
> +		dev_err(dev, "no port@0 node in %pOF\n", dev->of_node);
>  		ret = -ENODEV;
>  		goto clks_err;
>  	}
> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> index 277ead6a459a..22b65f4a0e30 100644
> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> @@ -19,8 +19,8 @@
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  
>  #define IMX21LCDC_LSSAR         0x0000 /* LCDC Screen Start Address Register */
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 5ec75e9ba499..8dbd4847d3a6 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -14,7 +14,7 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index 7a43505011a5..6d236547f611 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -14,7 +14,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/time.h>
>  
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
> index 39cab4a55f57..39c725958ef3 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -2,7 +2,8 @@
>  /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
>  
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/uaccess.h>
>  #include <linux/slab.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
> index c35c453fd025..e6b68c2e249b 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_drm.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> @@ -10,8 +10,8 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/types.h>
>  
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
> index a8cd86c06c14..5d68d0f27212 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -471,7 +471,7 @@ static const struct of_device_id mcde_of_match[] = {
>  static struct platform_driver mcde_driver = {
>  	.driver = {
>  		.name           = "mcde",
> -		.of_match_table = of_match_ptr(mcde_of_match),
> +		.of_match_table = mcde_of_match,
>  	},
>  	.probe = mcde_probe,
>  	.remove = mcde_remove,
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> index 434e8a9ce8ab..cdbec79474d1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -6,8 +6,7 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 1773379b2439..7c5e04ee5b9f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -6,8 +6,7 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> index cac9206079e7..0b9b4b06d19c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> @@ -6,8 +6,7 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index c844942603f7..7746dceadb20 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -6,8 +6,7 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> index 6428b6203ffe..bea8a0d8040a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -5,8 +5,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/component.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 8f52cc1f3fba..73320a7425cd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -10,8 +10,7 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index c0a38f5217ee..878575bb9671 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -7,8 +7,9 @@
>  #include <drm/drm_of.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index d4df17ad600a..a12c05786d28 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -8,8 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 948a53f1f4b3..28bdb1f427ff 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -10,7 +10,6 @@
>  #include <linux/kernel.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d40142842f85..8a43656ecc30 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -6,6 +6,7 @@
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/mailbox_controller.h>
> +#include <linux/of.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 6dcb4ba2466c..e01427717912 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -7,8 +7,9 @@
>  #include <linux/component.h>
>  #include <linux/iommu.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
> +#include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/dma-mapping.h>
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> index 73dc4da3ba3b..db7ac666ec5e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> @@ -7,7 +7,7 @@
>  #include <drm/drm_framebuffer.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> index e06db6e56b5f..4806bdd4b8fa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> @@ -6,8 +6,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
> -#include <linux/of_address.h>
> -#include <linux/of_device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
> index b23009a3380f..3f9345c14f31 100644
> --- a/drivers/gpu/drm/meson/meson_drv.h
> +++ b/drivers/gpu/drm/meson/meson_drv.h
> @@ -9,7 +9,6 @@
>  
>  #include <linux/device.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/regmap.h>
>  
>  struct drm_crtc;
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 3d046878ce6c..63206535de65 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -9,8 +9,9 @@
>  #include <linux/component.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
> +#include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index 57447abf1a29..e5fe4e994f43 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -7,9 +7,10 @@
>  
>  #include <linux/clk.h>
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/phy/phy.h>
>  #include <linux/bitfield.h>
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 812e172dec63..3f93c70488ca 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -7,7 +7,6 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  
>  #include <drm/drm_atomic_helper.h>
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 53231bfdf7e2..9913971fa5d2 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -9,8 +9,10 @@
>  #include <linux/component.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 5deb79924897..b20ef6c8ea26 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -3,6 +3,8 @@
>  
>  #include <linux/clk.h>
>  #include <linux/interconnect.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
>  #include <soc/qcom/cmd-db.h>
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 1245c7aa49df..4a2e479723a8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -6,7 +6,7 @@
>  
>  #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
>  
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/drm_edid.h>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 3f6dfb4f9d5a..4c6d73e24bb5 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -10,7 +10,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/syscon.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_irq.h>
>  #include <linux/pinctrl/consumer.h>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 3132105a2a43..60509fb39710 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -7,6 +7,8 @@
>  
>  #include <linux/of_irq.h>
>  #include <linux/of_gpio.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_of.h>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> index 9780107e1cc9..3e00fb8190b2 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -3,7 +3,8 @@
>   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
>   */
>  
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  
>  #include "hdmi.h"
>  
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 05648c910c68..6bf6c4a0f550 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -10,6 +10,8 @@
>  #include <linux/irqchip.h>
>  #include <linux/irqdesc.h>
>  #include <linux/irqchip/chained_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index c9d8cbb21407..5e8dc88efea1 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -10,7 +10,6 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> index 1cc0f1d09684..662c7bcbe6e5 100644
> --- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> +++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> @@ -11,7 +11,8 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
> diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> index 3c976a98de6a..6c86ebf2cad7 100644
> --- a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> +++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> @@ -11,8 +11,8 @@
>  #include <linux/device.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/media-bus-format.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
> diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> index d879b3b14c48..11b64acbe8a9 100644
> --- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> +++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> @@ -10,7 +10,6 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  
>  #include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index dc276c346fd1..5ac926281d2c 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -8,7 +8,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_connector.h>
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index ba17bcc4461c..6b3f4d664d2a 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -11,7 +11,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/jiffies.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_connector.h>
> diff --git a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> index 76572c922983..986e3e192881 100644
> --- a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> +++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> @@ -7,7 +7,6 @@
>  #include <linux/delay.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_mipi_dsi.h>
> diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> index df493da50afe..48e3acaecdf3 100644
> --- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> +++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> @@ -11,7 +11,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/regulator/consumer.h>
>  
>  #define FEIYANG_INIT_CMD_LEN	2
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> index d4fb5d1b295b..c73243d85de7 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> @@ -15,7 +15,7 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <video/mipi_display.h>
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> index 3dfafa585127..61c872f0f7ca 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> @@ -22,7 +22,8 @@
>  #include <linux/bitops.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 3fdf884b3257..3574681891e8 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -23,7 +23,7 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
>  
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 1ec696adf9de..72dbb8184280 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -9,7 +9,7 @@
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  
>  #include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> index b2b0ebc9e943..8fdbda59be48 100644
> --- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> +++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> @@ -11,7 +11,8 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
> diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> index 9992d0d4c0e5..485178a99910 100644
> --- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> +++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> @@ -7,7 +7,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <video/mipi_display.h>
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 323c33c9c37a..4879835fe101 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -16,7 +16,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  
>  #define JD9365DA_INIT_CMD_LEN		2
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index d2efd887484b..d41482d3a34f 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -8,7 +8,6 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <video/display_timing.h>
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index de8758c30e6e..6c46985237c6 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -10,7 +10,7 @@
>  
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
> index 26d358b9b85a..799c2161fc85 100644
> --- a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
> +++ b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
> @@ -18,7 +18,6 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
>  
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index 9243b2ad828d..ea4a6bf6d35b 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -10,7 +10,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <video/mipi_display.h>
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> index a07958038ffd..ad98dd9322b4 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> @@ -13,7 +13,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <video/display_timing.h>
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index cf078f0d3cd3..71e57de6d8b2 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -11,7 +11,8 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
>  #include <video/mipi_display.h>
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index 493c3c23f0d6..d6dceb858008 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -26,7 +26,7 @@
>  #include <linux/bitops.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> index cc7f96d70826..5bbea734123b 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> @@ -18,7 +18,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <video/mipi_display.h>
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> index 8b108ac80b55..412ca84d0581 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> @@ -8,7 +8,7 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/regulator/consumer.h>
>  
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> index c3befa7f253d..9632b9e95b71 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> @@ -9,7 +9,7 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/regulator/consumer.h>
>  
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> index 73bcffa1e0c1..33fb3d715e54 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -16,7 +16,6 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  
>  #include <linux/gpio/consumer.h>
>  #include <linux/pinctrl/consumer.h>
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> index f58cfb10b58a..059260262b5a 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> @@ -12,7 +12,6 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
> index e46be5014d42..c415dacf1816 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
> @@ -12,7 +12,6 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
> diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> index 90ea91e4311d..4618c892cdd6 100644
> --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> @@ -47,7 +47,6 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/pm.h>
>  
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> index 008e2b0d6652..79f611963c61 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> @@ -11,7 +11,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/delay.h>
> -#include <linux/of_device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  
>  struct s6d16d0 {
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index 102e1fc7ee38..0755f85a44bd 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -11,7 +11,6 @@
>  #include <linux/module.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  
>  #include <video/mipi_display.h>
>  #include <drm/drm_mipi_dsi.h>
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> index 39eef3dce7c9..639a4fdf57bb 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> @@ -12,7 +12,7 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_mipi_dsi.h>
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> index ed3895e4ca5e..a89d925fdfb2 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> @@ -6,7 +6,7 @@
>  
>  #include <linux/module.h>
>  #include <linux/delay.h>
> -#include <linux/of_device.h>
> +#include <linux/mod_devicetable.h>
>  
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_print.h>
> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> index 1ebb79e3103c..cbf9607dd576 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> @@ -8,7 +8,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/backlight.h>
>  
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> index 7eae83aa0ea1..0459965e1b4f 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> @@ -12,7 +12,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <video/mipi_display.h>
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 3aa31f3d6157..6a3945639535 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -13,7 +13,7 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <video/display_timing.h>
> diff --git a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
> index 8d8813dbaa45..1bde2f01786b 100644
> --- a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
> +++ b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
> @@ -14,7 +14,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <video/mipi_display.h>
> diff --git a/drivers/gpu/drm/panel/panel-truly-nt35597.c b/drivers/gpu/drm/panel/panel-truly-nt35597.c
> index b31cffb660a7..4f4009f9fe25 100644
> --- a/drivers/gpu/drm/panel/panel-truly-nt35597.c
> +++ b/drivers/gpu/drm/panel/panel-truly-nt35597.c
> @@ -7,7 +7,7 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index ec228c269146..c2806e4fd553 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -5,7 +5,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index bbada731bbbd..20c25c836198 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -4,8 +4,9 @@
>  /* Copyright 2019 Collabora ltd. */
>  
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
>  #include <linux/pagemap.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <drm/panfrost_drm.h>
>  #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> index 00c3ebd32359..1e4b28d03f4d 100644
> --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/vexpress.h>
>  
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index 1ffde19cb87f..3904b0cca814 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -12,7 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index adfb36b0e815..9ff4537c26c8 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -20,8 +20,10 @@
>  
>  #include <linux/device.h>
>  #include <linux/dma-buf.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/wait.h>
>  
>  #include "rcar_du_crtc.h"
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> index 45c05d0ffc70..9cbb5e6e2cba 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -22,6 +22,7 @@
>  #include <linux/bitops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index e10e4d4b89a2..db2e6f16f954 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -12,7 +12,6 @@
>  #include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> index aa95b85a2964..8048bdca2d6c 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> @@ -10,7 +10,6 @@
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index ad2d3ae7e621..255e6eab8544 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -10,8 +10,9 @@
>  
>  #include <linux/component.h>
>  #include <linux/mfd/syscon.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/clk.h>
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 917e79951aac..2744d8f4a6fa 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -12,7 +12,9 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
> index 9afb889963c1..751e694b39cd 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> @@ -11,9 +11,10 @@
>  #include <linux/err.h>
>  #include <linux/hdmi.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> -#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index d97f2edc646b..01954a0b5696 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index a530ecc4d207..86fd9f51c692 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -12,7 +12,6 @@
>  #include <linux/log2.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/overflow.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index ca73b8ccc29f..583df4d22f7e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -13,7 +13,6 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
> index b96fc6837b0d..48183bbd0590 100644
> --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -9,10 +9,8 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
> -#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
> index be60c0d546a3..0aa39156f2fa 100644
> --- a/drivers/gpu/drm/sprd/sprd_drm.c
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -5,10 +5,11 @@
>  
>  #include <linux/component.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of_graph.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
> index ab0e5cce7adb..d7b143a75601 100644
> --- a/drivers/gpu/drm/sprd/sprd_dsi.c
> +++ b/drivers/gpu/drm/sprd/sprd_dsi.c
> @@ -5,10 +5,8 @@
>  
>  #include <linux/component.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
> -#include <linux/of_graph.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <video/mipi_display.h>
>  
>  #include <drm/drm_atomic_helper.h>
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index 1b87b5899f9e..deb75b61e4cf 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -8,7 +8,9 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index cb4404b3ce62..e507739ced0c 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -10,8 +10,9 @@
>  
>  #include <linux/component.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
>  #include <drm/drm_aperture.h>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index b8be4c1db423..5576fdae4962 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -14,7 +14,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
> index 799ab7460ae5..e156a9e97fd8 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
> @@ -7,7 +7,7 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.h b/drivers/gpu/drm/sun4i/sun4i_frontend.h
> index 2e7b76e50c2b..61c24088772c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_frontend.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_frontend.h
> @@ -8,6 +8,7 @@
>  #define _SUN4I_FRONTEND_H_
>  
>  #include <linux/list.h>
> +#include <linux/mod_devicetable.h>
>  
>  #define SUN4I_FRONTEND_EN_REG			0x000
>  #define SUN4I_FRONTEND_EN_EN				BIT(0)
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> index c0df5e892fa7..ac4e07142378 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -10,7 +10,7 @@
>  #include <linux/i2c.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 6a52fb12cbfb..662027f137a6 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -10,9 +10,9 @@
>  #include <linux/ioport.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_device.h>
> -#include <linux/of_irq.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index 7cab4213a680..a450f33fb02a 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -5,7 +5,7 @@
>  
>  #include <linux/component.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  
>  #include <drm/drm_modeset_helper_vtables.h>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> index ca53b5e9fffc..4fa69c463dc4 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> @@ -4,8 +4,9 @@
>   */
>  
>  #include <linux/delay.h>
> -#include <linux/of_address.h>
> +#include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  
>  #include "sun8i_dw_hdmi.h"
>  
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index 11d5244a5aa5..dac442f94128 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -10,8 +10,10 @@
>  #include <linux/component.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/platform_device.h>
>  #include <linux/reset.h>
>  
>  #include <drm/drm_atomic_helper.h>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> index da97682b6835..a7cb2b0ffb02 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> @@ -7,7 +7,7 @@
>  #include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 6e78416e64b0..13b182ab905f 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -11,7 +11,8 @@
>  #include <linux/iommu.h>
>  #include <linux/interconnect.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 4d2677dcd831..96a8afcab3ef 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -8,7 +8,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> index 50f77fddda54..4c55133467a0 100644
> --- a/drivers/gpu/drm/tegra/gr2d.c
> +++ b/drivers/gpu/drm/tegra/gr2d.c
> @@ -7,7 +7,8 @@
>  #include <linux/delay.h>
>  #include <linux/iommu.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  
> diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
> index c026c2c916c1..2768f8f073ed 100644
> --- a/drivers/gpu/drm/tegra/gr3d.c
> +++ b/drivers/gpu/drm/tegra/gr3d.c
> @@ -9,7 +9,7 @@
>  #include <linux/host1x.h>
>  #include <linux/iommu.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 6eac54ae1205..00be307ca070 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -10,7 +10,8 @@
>  #include <linux/hdmi.h>
>  #include <linux/math64.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index 916857361a91..1af5f8318d91 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -9,8 +9,8 @@
>  #include <linux/host1x.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
> index ae78a81e5eef..f821e36111a7 100644
> --- a/drivers/gpu/drm/tegra/nvdec.c
> +++ b/drivers/gpu/drm/tegra/nvdec.c
> @@ -11,8 +11,6 @@
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
> -#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index abd6e3b92293..93471b70e180 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -8,7 +8,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> index da7a038dca20..5da989ac700e 100644
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c
> @@ -10,8 +10,6 @@
>  #include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
> -#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index dca077411f77..da6b2b01f7bd 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -15,8 +15,6 @@
>  #include <linux/module.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> -#include <linux/of_graph.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 3f5f27fb6ebc..1f06a6284770 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -5,7 +5,7 @@
>   */
>  
>  #include <linux/console.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index bef9d45ef1df..7b30e4675559 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -31,7 +31,8 @@
>  
>  #include <linux/clk.h>
>  #include <linux/component.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
>  #include <drm/drm_atomic.h>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index e68c07d86040..333f77609dba 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -22,8 +22,8 @@
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/media-bus-format.h>
> -#include <linux/of_graph.h>
> -#include <linux/of_platform.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
>  #include "vc4_drv.h"
>  #include "vc4_regs.h"
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 823395c23cc3..272c6503aac9 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -26,7 +26,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 9e0c355b236f..46f28e04cefc 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -25,8 +25,9 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  #include <linux/io.h>
> +#include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
>  #include <drm/drm_atomic_helper.h>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 5261526d286f..a9515eb7b587 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -41,8 +41,8 @@
>  #include <linux/component.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> +#include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/rational.h>
>  #include <linux/reset.h>
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index c5abdec03103..136fb4f4fe7a 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -9,8 +9,8 @@
>  
>  #include <linux/clk.h>
>  #include <linux/component.h>
> -#include <linux/of_graph.h>
> -#include <linux/of_platform.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
>  #include <drm/drm_atomic.h>
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index d6e6a1a22eba..26441be41265 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -21,8 +21,8 @@
>  #include <drm/drm_simple_kms_helper.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
> -#include <linux/of_graph.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
>  #include "vc4_drv.h"
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> index 90996c108146..a83f054d0a8b 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -11,7 +11,6 @@
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
> index c35eac1116f5..71ec1e7f657a 100644
> --- a/drivers/gpu/ipu-v3/ipu-common.c
> +++ b/drivers/gpu/ipu-v3/ipu-common.c
> @@ -18,7 +18,7 @@
>  #include <linux/irq.h>
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  
>  #include <drm/drm_fourcc.h>
> -- 
> 2.40.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
