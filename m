Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE09DC5F5CB
	for <lists+etnaviv@lfdr.de>; Fri, 14 Nov 2025 22:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E79910E266;
	Fri, 14 Nov 2025 21:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="EYK5cX8s";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B41510E998
 for <etnaviv@lists.freedesktop.org>; Fri, 14 Nov 2025 03:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763091074; x=1763695874; i=w_armin@gmx.de;
 bh=eaVKqe10jzGoKFaLYje3vU37/s2NKQBvZXfmlKCsGAc=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=EYK5cX8sJWeC6LYj8Ig6AI5LRhTXRKcy7XhQIM55FnB36A7L/eBZ4gE/SyRoNtSF
 ZDCReyHvSy2PJjucs6Tuw4GuhSgVC0vu9NFc/Ll+/EdbsRG9a6cddzFiJWHQgZhUn
 j9w/3UjFIQL8JoiRyKPZKi7n68M5m4aU7W9sgYGIMd6HKmSO8BMXM0qxqZz+/0wry
 2H/TNxZ41aTUUSPyhJE+P9XAmSDdWtOpu1MRNcpZQTV7qG60eXAq9IQ0zCOoWSyxT
 FBYp20YbE/50kbrUBhmqMCFKb+rNb1nCHf+IUHcBqVoIvg2pid/XHcDAWXSWGEsb4
 v+pQtjm06UfqOkRAtw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKKYx-1vcFwC23YN-00MX1X; Fri, 14
 Nov 2025 04:24:11 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Fri, 14 Nov 2025 04:23:04 +0100
Subject: [PATCH RFC 3/8] ACPI: processor: Stop creating "device" sysfs link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251114-thermal-device-v1-3-d8b442aae38b@gmx.de>
References: <20251114-thermal-device-v1-0-d8b442aae38b@gmx.de>
In-Reply-To: <20251114-thermal-device-v1-0-d8b442aae38b@gmx.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Amit Daniel Kachhap <amit.kachhap@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Len Brown <lenb@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>, 
 Petr Machata <petrm@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Kaestle <peter@piie.net>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 linux-pci@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:nPhVaIWI4Qq4tuVB45WFPPKBJ/CGwZWVPg6Gt8tmT9A+FbWxAtE
 Ga2PcMjf7l6TmkQjRQ3DFYFE90GnC+dErsnnwPmuKj78/C4sD9b5HrIRgH196Q1c0m0ofUi
 EBPGWPUk4nGDUtf4BPr+Xv0RNEWUzTg2mVcokune5EpyI2qHlLVTUkezu/BzR1w7FmlPmmH
 fMjnazZjMw5aYR76qC7wg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VH4CJxmnWPg=;gLvXbQgVCtB87s/stqnyMQzGhhE
 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
 8wxeJdCetig4yC05WSa8b75Yxeah4f2bcTzSju
X-Mailman-Approved-At: Fri, 14 Nov 2025 21:28:15 +0000
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

The thermal core will soon automatically create sysfs links between
the cooling device and its parent device. Stop manually creating
the "device" sysfs link between the cooling device and the parent
device to avoid a name collision. The "thermal_cooling" sysfs link
however stays for backwards compatibility, as it does not suffer
from a name collision.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/acpi/processor_thermal.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_the=
rmal.c
index c7b1dc5687ec..1ff10321eac5 100644
=2D-- a/drivers/acpi/processor_thermal.c
+++ b/drivers/acpi/processor_thermal.c
@@ -323,6 +323,7 @@ int acpi_processor_thermal_init(struct acpi_processor =
*pr,
 	dev_dbg(&device->dev, "registered as cooling_device%d\n",
 		pr->cdev->id);
=20
+	/* For backwards compatibility */
 	result =3D sysfs_create_link(&device->dev.kobj,
 				   &pr->cdev->device.kobj,
 				   "thermal_cooling");
@@ -332,19 +333,8 @@ int acpi_processor_thermal_init(struct acpi_processor=
 *pr,
 		goto err_thermal_unregister;
 	}
=20
-	result =3D sysfs_create_link(&pr->cdev->device.kobj,
-				   &device->dev.kobj,
-				   "device");
-	if (result) {
-		dev_err(&pr->cdev->device,
-			"Failed to create sysfs link 'device'\n");
-		goto err_remove_sysfs_thermal;
-	}
-
 	return 0;
=20
-err_remove_sysfs_thermal:
-	sysfs_remove_link(&device->dev.kobj, "thermal_cooling");
 err_thermal_unregister:
 	thermal_cooling_device_unregister(pr->cdev);
=20
@@ -356,7 +346,6 @@ void acpi_processor_thermal_exit(struct acpi_processor=
 *pr,
 {
 	if (pr->cdev) {
 		sysfs_remove_link(&device->dev.kobj, "thermal_cooling");
-		sysfs_remove_link(&pr->cdev->device.kobj, "device");
 		thermal_cooling_device_unregister(pr->cdev);
 		pr->cdev =3D NULL;
 	}

=2D-=20
2.39.5

