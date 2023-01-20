Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26F0677D0A
	for <lists+etnaviv@lfdr.de>; Mon, 23 Jan 2023 14:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8539910E494;
	Mon, 23 Jan 2023 13:50:17 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3290210EA2D;
 Fri, 20 Jan 2023 11:15:26 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CD80A660230B;
 Fri, 20 Jan 2023 11:15:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674213324;
 bh=CASdzRtoHYplP6yd6/mt/6hm04+ftfOht/MoW2dAnK8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YaLvVsczluXVfnE14rTAqsOFML8ibEN1/3WdsV84rBmyv56rm0yhbjdLUhD+eXUI3
 yKn2Ye+ICWEX+swXtC8nTyojSyi5j8aVZuPYvhCHx1sWbnW1CWR4J/WG6G5TcHOWq+
 13fRRh3EqjgwoQo7KnaqPqj0ur/D2OH2xexc1gB7gf/Hlbt7rT5ZQgwX6J3xN0YQdo
 SrTxkQ28Dw8AuQNXaTwK75BGopNLRf82Lq2KW9Jw2yZz9otY2jWkfw+0AnSgNmiMk3
 /A+CAQqcuPdlo4xosz+MWz7duPvfGPQgBCRsPxfwYxeslWq4G5I77YLn6dGajAqHo7
 NKDsK9qZMT2Aw==
Message-ID: <1e924d3b-1283-b9f9-d2a0-0e42db656d4e@collabora.com>
Date: Fri, 20 Jan 2023 12:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/3] drm: Convert users of drm_of_component_match_add
 to component_match_add_of
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20230119191040.1637739-1-sean.anderson@seco.com>
 <20230119191040.1637739-4-sean.anderson@seco.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230119191040.1637739-4-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Jan 2023 13:50:14 +0000
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 John Stultz <jstultz@google.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 Samuel Holland <samuel@sholland.org>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, linux-arm-msm@vger.kernel.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Tomi Valkeinen <tomba@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Brian Starkey <brian.starkey@arm.com>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Il 19/01/23 20:10, Sean Anderson ha scritto:
> Every user of this function either uses component_compare_of or
> something equivalent. Most of them immediately put the device node as
> well. Convert these users to component_match_add_of and remove
> drm_of_component_match_add.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Acked-by: Jyri Sarha <jyri.sarhaı@iki.fi>
> Tested-by: Jyri Sarha <jyri.sarha@iki.fi>

For MediaTek mtk_drm_drv:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


