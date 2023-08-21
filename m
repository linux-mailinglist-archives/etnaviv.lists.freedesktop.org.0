Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FBD783A12
	for <lists+etnaviv@lfdr.de>; Tue, 22 Aug 2023 08:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9686010E2DD;
	Tue, 22 Aug 2023 06:37:00 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 7740 seconds by postgrey-1.36 at gabe;
 Mon, 21 Aug 2023 14:36:52 UTC
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
 by gabe.freedesktop.org (Postfix) with ESMTP id A327F10E0BD;
 Mon, 21 Aug 2023 14:36:52 +0000 (UTC)
Received: from 8bytes.org (pd9fe95be.dip0.t-ipconnect.de [217.254.149.190])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id 4CE0C2819E9;
 Mon, 21 Aug 2023 16:36:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1692628611;
 bh=+WiTQ5AG7r8y4G1Zww7KAS8SkcWV0o+RqcA6fs2lTPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cCuzifo9x0D9qOt89G/4/PiqD/F+u4B/70l6IQpdB42jnyWjZAjz6KPgC0KIJ5pot
 yclZplhO935QvwccMrgOtmFHXq3eiyDLUhMvZiDp7Z1uCnQEBb9DWAMAxasIaPyHYq
 a4eQTWVPUC2Ofc8zeYGvrhV9slFe/AwBVAzPWiByhFvVRg2Dwo6GYRuq1SDa/M6D2R
 sY0F1aYmy5lkzE3WB90VPyGeQs8XtRdRd40i7Gqc0UnXnz42dsYsAcZAzCYTfLPIIB
 IeikCsXnKvSGRsvIQ6KRIPv23/3ONC+w0IGRIkYtlssEYICD4kne0F5md7TvoUKscG
 Wl6tO+kp8hFKw==
Date: Mon, 21 Aug 2023 16:36:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] iommu: Remove the device_lock_assert() from
 __iommu_probe_device()
Message-ID: <ZON2gRogBhjmpNIl@8bytes.org>
References: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
 <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
 <ZONdwclGOBaxxqtq@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZONdwclGOBaxxqtq@nvidia.com>
X-Mailman-Approved-At: Tue, 22 Aug 2023 06:36:58 +0000
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
Cc: alsa-devel@alsa-project.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Emma Anholt <emma@anholt.net>, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, ath10k@lists.infradead.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Sinan Kaya <okaya@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 iommu@lists.linux.dev, Andy Gross <agross@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, ath11k@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 etnaviv@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dmaengine@vger.kernel.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-wireless@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sunxi@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 09:51:13AM -0300, Jason Gunthorpe wrote:
> So now that Joerg has dropped it - what is your big idea to make the
> locking actually work right?

I am not opposed to the general idea. When putting it into the tree I
wasn't aware how many users still need to be adapted to properly work
with this.

We can do another try once the issues have been sorted out and you have
agreed with Robin on a workable way forward.

Regards,

	Joerg
