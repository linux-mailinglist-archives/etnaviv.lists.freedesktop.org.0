Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F999757735
	for <lists+etnaviv@lfdr.de>; Tue, 18 Jul 2023 10:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D806210E076;
	Tue, 18 Jul 2023 08:58:11 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356F510E274
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Jul 2023 15:40:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7459C61123
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Jul 2023 15:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0490C433C7
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Jul 2023 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689608404;
 bh=tF/K12dcb1AtR13XQY0pq3bgmoCAiVfZHpGq03H1+sk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=q4KER7a+f1oMRIEffUJKvg6dZFlTmOyBMPRSBcKmepKAxxSTdCR29pxjstsl6Vfyc
 CazoNl3mrmYEBGvyZnhfcSM3BNdv0OLnQCT9F76fpfHNrpkLmPr18EVIBq1NtesWYK
 mXMe09NhywuVwpCJVwbQ/2f8vuiDDhY0YVE97fR1RIcXmdJtSbjb+paTArX/KwlnMZ
 +RMtQnZRoFPqFtj7imcr8D7Pmi3s+fNO5xh3BuQypghh23k3nOoF1yEq5cnfw0Mp9L
 kxN+PcpeA+ml5bPhvrVLmqLngxd9f9SpfyujJh5WglFdbFaLt3IokAJ5KznR+WjsQc
 CmXzJUml5PpOQ==
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3a36b52b4a4so2830670b6e.1
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Jul 2023 08:40:04 -0700 (PDT)
X-Gm-Message-State: ABy/qLZ2eK/k7+UtCNoy5oatBUaj5vW60i79CqDKwhhCiTYVHohQ3kJM
 3dRMy4mKu046YOz8k625hdxmvvYj0HzOgk30PSv7AA==
X-Google-Smtp-Source: APBJJlHs9bNlVGErzzDkG3ITNYPrBi9bcbK5hB2pZ5ku9OA6MncccRQ7QQDddVXbZVn5Z/tCXP76UHYBqks/PFSJBmQ=
X-Received: by 2002:a17:90b:1095:b0:263:3567:f99 with SMTP id
 gj21-20020a17090b109500b0026335670f99mr13011407pjb.15.1689608384033; Mon, 17
 Jul 2023 08:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174545.4056287-1-robh@kernel.org>
 <114500369.nniJfEyVGO@phil>
 <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
In-Reply-To: <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 17 Jul 2023 17:39:32 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5wOhptw4PgP2etkC5KYh_5cfOXZuVhsN6YCMiqn15hog@mail.gmail.com>
Message-ID: <CAN6tsi5wOhptw4PgP2etkC5KYh_5cfOXZuVhsN6YCMiqn15hog@mail.gmail.com>
Subject: Re: [PATCH] drm: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 18 Jul 2023 08:58:10 +0000
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
Cc: Heiko Stuebner <heiko@sntech.de>, Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
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
 Tomi Valkeinen <tomba@kernel.org>, linux-sunxi@lists.linux.dev,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 John Stultz <jstultz@google.com>, Shawn Guo <shawnguo@kernel.org>,
 Ondrej Jirman <megous@megous.com>, linux-stm32@st-md-mailman.stormreply.com,
 Emma Anholt <emma@anholt.net>, Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 linux-renesas-soc@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Purism Kernel Team <kernel@puri.sm>, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 4:27=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Jul 16, 2023 at 3:26=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> =
wrote:
> >
> > Am Freitag, 14. Juli 2023, 19:45:34 CEST schrieb Rob Herring:
> > > The DT of_device.h and of_platform.h date back to the separate
> > > of_platform_bus_type before it as merged into the regular platform bu=
s.
> > > As part of that merge prepping Arm DT support 13 years ago, they
> > > "temporarily" include each other. They also include platform_device.h
> > > and of.h. As a result, there's a pretty much random mix of those incl=
ude
> > > files used throughout the tree. In order to detangle these headers an=
d
> > > replace the implicit includes with struct declarations, users need to
> > > explicitly include the correct includes.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> >
> > [...]
> >
> > > diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/driver=
s/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > > index 917e79951aac..2744d8f4a6fa 100644
> > > --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > > +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > > @@ -12,7 +12,9 @@
> > >  #include <linux/mfd/syscon.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of_device.h>
> > > +#include <linux/of_platform.h>
> > >  #include <linux/phy/phy.h>
> > > +#include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/regmap.h>
> >
> > I'm not sure if I'm just misreading something, but in all other places
> > of_device.h gets removed while here is stays as an include. Is this
> > correct this way?
>
> Yes, because of_match_device() is used.
>
> Rob
>

For drivers/gpu/drm/bridge/

Acked-by: Robert Foss <rfoss@kernel.org>
