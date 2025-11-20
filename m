Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F9CC721A1
	for <lists+etnaviv@lfdr.de>; Thu, 20 Nov 2025 04:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B310F10E00B;
	Thu, 20 Nov 2025 03:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="X8OEtuGt";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA6D10E00B
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Nov 2025 03:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610445; x=1764215245; i=w_armin@gmx.de;
 bh=pFfE5rqjVgwE8wDghOzJXBN7RtoFvEZyfhpDnHJr1d0=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=X8OEtuGtMGM2I9N9p7uIB1mtTMLPcS0W7gchkLAfq5SSgj6o0cxXM/RxczvbvY7v
 l2uzYFDAtBSCb/LzMW0gwFYuXsmG/wtzBWg45iIkb9O1U+pW3qb7CUUqn1lxDB6Cv
 YqwyzcyHvAIA5231+f7vsEhJHvTMGLulO1Gaojq9EUxt0yK+BS62f3P8vzFq7gfap
 EhQP2uBmPBHpbkTCNGjh1WSQWo+5EUoVGG7Xm80s93FZAcQbpG6W4h2IjybaKF+It
 qNCM21aJ9/lcVqnJv86YHd+Iv9o1tzw442YZZgKQ71vIzbfK9mHosntaIK/5N5Y1P
 fOsJwnNAnlUgyTkFUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQgC-1w8GuJ49qq-00xsos; Thu, 20
 Nov 2025 04:41:40 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Thu, 20 Nov 2025 04:41:17 +0100
Subject: [PATCH RFC RESEND 7/8] ACPI: thermal: Stop creating "device" sysfs
 link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251120-thermal-device-v1-7-bbdad594d57a@gmx.de>
References: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
In-Reply-To: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Len Brown <lenb@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>, 
 Petr Machata <petrm@nvidia.com>
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
X-Provags-ID: V03:K1:bKjOl416ZBvt0J4Z1ff2/VOM4YUuBr4pjrnuYziG/rC6UM9Bjrb
 iCAyo+RKmQkcq6atgUTHWnC+hoUqvDNqaFpc2OPzy5pIPPW4oHJPk1sK76vauvunauWsJI/
 rZWHUfcw+kkV+yp+4FePUCajckmPJ0U3pwygCJBQNPEV/qhghQjiEQylyxzO3A0H4gakZ/Q
 lbLGd8IWeIkZr7osImDhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AZimEQ/l6Pg=;9tHsSJi+XOL8Wj5l5GIdtreT3ts
 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
 UFsQIcf0=
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
the thermal zone device and its parent device. Stop manually creating
the "device" sysfs link between the thermal zone device and the parent
device to avoid a name collision. The "thermal_zone" sysfs link
however stays for backwards compatibility, as it does not suffer
from a name collision.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/acpi/thermal.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index a511f9ea0267..99ad67bbd764 100644
=2D-- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -592,27 +592,14 @@ static const struct thermal_zone_device_ops acpi_the=
rmal_zone_ops =3D {
 static int acpi_thermal_zone_sysfs_add(struct acpi_thermal *tz)
 {
 	struct device *tzdev =3D thermal_zone_device(tz->thermal_zone);
-	int ret;
=20
-	ret =3D sysfs_create_link(&tz->device->dev.kobj,
-				&tzdev->kobj, "thermal_zone");
-	if (ret)
-		return ret;
-
-	ret =3D sysfs_create_link(&tzdev->kobj,
-				   &tz->device->dev.kobj, "device");
-	if (ret)
-		sysfs_remove_link(&tz->device->dev.kobj, "thermal_zone");
-
-	return ret;
+	/* For backwards compatibility */
+	return sysfs_create_link(&tz->device->dev.kobj, &tzdev->kobj, "thermal_z=
one");
 }
=20
 static void acpi_thermal_zone_sysfs_remove(struct acpi_thermal *tz)
 {
-	struct device *tzdev =3D thermal_zone_device(tz->thermal_zone);
-
 	sysfs_remove_link(&tz->device->dev.kobj, "thermal_zone");
-	sysfs_remove_link(&tzdev->kobj, "device");
 }
=20
 static int acpi_thermal_register_thermal_zone(struct acpi_thermal *tz,

=2D-=20
2.39.5

