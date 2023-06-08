Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F7729329
	for <lists+etnaviv@lfdr.de>; Fri,  9 Jun 2023 10:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2FD10E276;
	Fri,  9 Jun 2023 08:31:31 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906CF10E0BF;
 Thu,  8 Jun 2023 16:26:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126033089000.35.openmobile.ne.jp
 [126.33.89.0])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABD6FF7C;
 Thu,  8 Jun 2023 18:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686241579;
 bh=9rruNaQgl/oQBE2oLPlmpO6slCgdtIRvea2nyNzPSZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LLXEiASpvCS+K6TnETZR+gAVntREVUQlWqSFAEd8t5iunYhMtLxUDYZ7ZD4AjpFdD
 n9hRLmIFvh9Nfrccon6V6aV4cRl+tSQCd+S/RISk+hv5rWicoVYu0qcAItyObwwlvE
 dO+yQN68ltwo5R0MgrqYlmfk5q+3Kvczr50XtQSw=
Date: Thu, 8 Jun 2023 19:26:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback returning
 void
Message-ID: <20230608162642.GA23400@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
X-Mailman-Approved-At: Fri, 09 Jun 2023 08:31:30 +0000
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
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Danilo Krummrich <dakr@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, Miaoqian Lin <linmq006@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liang He <windhl@126.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alain Volmat <alain.volmat@foss.st.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Yuan Can <yuancan@huawei.com>, Stefan Agner <stefan@agner.ch>,
 Michal Simek <michal.simek@xilinx.com>, linux-tegra@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh@kernel.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, Joel Stanley <joel@jms.id.au>,
 nouveau@lists.freedesktop.org, Orson Zhai <orsonzhai@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Guo Zhengkui <guozhengkui@vivo.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alison Wang <alison.wang@nxp.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liu Shixin <liushixin2@huawei.com>, Tomi Valkeinen <tomba@kernel.org>,
 Deepak R Varma <drv@mailo.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tian Tao <tiantao6@hisilicon.com>,
 Shawn Guo <shawnguo@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>,
 Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org,
 Yongqin Liu <yongqin.liu@linaro.org>, Jayshri Pawar <jpawar@cadence.com>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Clark <robdclark@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Qiang Yu <yuq825@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Doug,

On Thu, Jun 08, 2023 at 09:08:15AM -0700, Doug Anderson wrote:
> On Thu, Jun 1, 2023 at 8:40 AM Uwe Kleine-König wrote:
> > On Sun, May 07, 2023 at 06:25:23PM +0200, Uwe Kleine-König wrote:
> > > this patch series adapts the platform drivers below drivers/gpu/drm
> > > to use the .remove_new() callback. Compared to the traditional .remove()
> > > callback .remove_new() returns no value. This is a good thing because
> > > the driver core doesn't (and cannot) cope for errors during remove. The
> > > only effect of a non-zero return value in .remove() is that the driver
> > > core emits a warning. The device is removed anyhow and an early return
> > > from .remove() usually yields a resource leak.
> > >
> > > By changing the remove callback to return void driver authors cannot
> > > reasonably (but wrongly) assume any more that there happens some kind of
> > > cleanup later.
> >
> > I wonder if someone would volunteer to add the whole series to
> > drm-misc-next?!
> 
> It looks as if Neil applied quite a few of them already, so I looked
> at what was left...
> 
> I'm a little hesitant to just apply the whole kit-and-caboodle to
> drm-misc-next since there are specific DRM trees for a bunch of them
> and it would be better if they landed there. ...so I went through all
> the patches that still applied to drm-misc-next, then used
> 'scripts/get_maintainer.pl --scm' to check if they were maintained
> through drm-misc. That still left quite a few patches. I've applied
> those ones and pushed to drm-misc-next:
> 
> 71722685cd17 drm/xlnx/zynqmp_dpsub: Convert to platform remove
> callback returning void
> 1ed54a19f3b3 drm/vc4: Convert to platform remove callback returning void
> b957812839f8 drm/v3d: Convert to platform remove callback returning void
> e2fd3192e267 drm/tve200: Convert to platform remove callback returning void
> 84e6da7ad553 drm/tiny: Convert to platform remove callback returning void
> 34cdd1f691ad drm/tidss: Convert to platform remove callback returning void
> d665e3c9d37a drm/sun4i: Convert to platform remove callback returning void
> 0c259ab19146 drm/stm: Convert to platform remove callback returning void
> 9a865e45884a drm/sti: Convert to platform remove callback returning void
> 3c855610840e drm/rockchip: Convert to platform remove callback returning void
> e41977a83b71 drm/panfrost: Convert to platform remove callback returning void
> cef3776d0b5a drm/panel: Convert to platform remove callback returning void
> bd296a594e87 drm/mxsfb: Convert to platform remove callback returning void
> 38ca2d93d323 drm/meson: Convert to platform remove callback returning void
> fd1457d84bae drm/mcde: Convert to platform remove callback returning void
> 41a56a18615c drm/logicvc: Convert to platform remove callback returning void
> 980ec6444372 drm/lima: Convert to platform remove callback returning void
> 82a2c0cc1a22 drm/hisilicon: Convert to platform remove callback returning void
> c3b28b29ac0a drm/fsl-dcu: Convert to platform remove callback returning void
> a118fc6e71f9 drm/atmel-hlcdc: Convert to platform remove callback returning void
> 9a32dd324c46 drm/aspeed: Convert to platform remove callback returning void
> 2c7d291c498c drm/arm/malidp: Convert to platform remove callback returning void
> a920028df679 drm/arm/hdlcd: Convert to platform remove callback returning void
> 1bf3d76a7d15 drm/komeda: Convert to platform remove callback returning void
> 
> The following ones appeared to apply to the top of drm-misc-next, but
> I didn't apply them since get_maintainer didn't say they were part of
> drm-misc-next:
> 
> drm/tiny: Convert to platform remove callback returning void
> drm/tilcdc: Convert to platform remove callback returning void
> drm/sprd: Convert to platform remove callback returning void
> drm/shmobile: Convert to platform remove callback returning void
> drm/rcar-du: Convert to platform remove callback returning void

If you don't mind, could you take the rcar-du patch through drm-misc too
? I don't plan to send another pull request for v6.5.

> drm/omap: Convert to platform remove callback returning void

Tomi, should drm/omap moved to being maintained through drm-misc ?

> drm/nouveau: Convert to platform remove callback returning void
> drm/mediatek: Convert to platform remove callback returning void
> drm/kmb: Convert to platform remove callback returning void
> drm/ingenic: Convert to platform remove callback returning void
> drm/imx/ipuv3: Convert to platform remove callback returning void
> drm/imx/dcss: Convert to platform remove callback returning void
> drm/etnaviv: Convert to platform remove callback returning void
> drm/armada: Convert to platform remove callback returning void

-- 
Regards,

Laurent Pinchart
