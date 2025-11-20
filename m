Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FB0C7219E
	for <lists+etnaviv@lfdr.de>; Thu, 20 Nov 2025 04:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED8C10E6E2;
	Thu, 20 Nov 2025 03:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="W2l+VGDs";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38F810E6E2
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Nov 2025 03:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610429; x=1764215229; i=w_armin@gmx.de;
 bh=w2Nfv//wKfgQYjOWaBmhUaOG3ji2GxiPpvMEXNJkovk=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=W2l+VGDsI9+nFCJCHEibSq/T7safywqSLAVF9n83KEXaCdzFxRydf4fV5+2HEeMz
 LeYmcAQALElvTitHTdLNpvOyzhHzOLUVV4nF1HlWvKeL7tXffc6wzhKRwad/A9C1Z
 +Ka0N1O1OMpVhp6wgrJgkDaBSn150ueANGUgNrZo/X9emDgR4jTEF5OjxBJm1DVCJ
 mJaouqw5I1QRcfCB/1NpHJgjKLbMGBoqN8RRrQ1m3N9gceUYBwhmRCB6g0QZI4vuD
 nIKKuyFpyqtFmicWPbwVH/SbaKD+5efNRT9kcOBlZidEqvyuHYqfYKTpRi+MeaTER
 /RGdEJx/s8uJaICFZg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXUN-1vcDTi2rZ9-00LXG9; Thu, 20
 Nov 2025 04:41:21 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Thu, 20 Nov 2025 04:41:11 +0100
Subject: [PATCH RFC RESEND 1/8] thermal: core: Allow setting the parent
 device of cooling devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251120-thermal-device-v1-1-bbdad594d57a@gmx.de>
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
X-Provags-ID: V03:K1:DWBT/C9r0u0GJbnfM2x6xD+VPAcKYxVi3FSehphoX9P+PP9QP40
 H1l/LJwjFLMySZKWql7wwYEqHZyDutpIpBTgGBKEh2J88LfH30owsDkDNqR6bHSrBuTRbf6
 Kl+PZlhIRv/dziKbjlpllqBNeLTfwcmKKbnRw5NROE93Ahsf+EfgRcHUnCNUJXv4F+hTDU4
 HyxqaIXpHJbzFhFdy/jiA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:i9SGJObeL5U=;glC34uuRfDLRgfUvxQCejcIMg70
 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
 /R4+YpeGNhhbRRK+c=
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

Currently, cooling devices have no parent device, potentially causing
issues with suspend ordering and making it impossible for consumers
(thermal zones and userspace appications) to associate a given cooling
device with its parent device.

Extend __thermal_cooling_device_register() to also accept a parent
device pointer. For now only devm_thermal_of_cooling_device_register()
uses this, as the other wrapper functions need to be extended first.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/thermal/thermal_core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core=
.c
index 17ca5c082643..c8b720194b44 100644
=2D-- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1040,6 +1040,7 @@ static void thermal_cooling_device_init_complete(str=
uct thermal_cooling_device *
=20
 /**
  * __thermal_cooling_device_register() - register a new thermal cooling d=
evice
+ * @parent:	parent device pointer.
  * @np:		a pointer to a device tree node.
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
@@ -1055,7 +1056,7 @@ static void thermal_cooling_device_init_complete(str=
uct thermal_cooling_device *
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 static struct thermal_cooling_device *
-__thermal_cooling_device_register(struct device_node *np,
+__thermal_cooling_device_register(struct device *parent, struct device_no=
de *np,
 				  const char *type, void *devdata,
 				  const struct thermal_cooling_device_ops *ops)
 {
@@ -1092,6 +1093,7 @@ __thermal_cooling_device_register(struct device_node=
 *np,
 	cdev->ops =3D ops;
 	cdev->updated =3D false;
 	cdev->device.class =3D thermal_class;
+	cdev->device.parent =3D parent;
 	cdev->devdata =3D devdata;
=20
 	ret =3D cdev->ops->get_max_state(cdev, &cdev->max_state);
@@ -1158,7 +1160,7 @@ struct thermal_cooling_device *
 thermal_cooling_device_register(const char *type, void *devdata,
 				const struct thermal_cooling_device_ops *ops)
 {
-	return __thermal_cooling_device_register(NULL, type, devdata, ops);
+	return __thermal_cooling_device_register(NULL, NULL, type, devdata, ops)=
;
 }
 EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
=20
@@ -1182,7 +1184,7 @@ thermal_of_cooling_device_register(struct device_nod=
e *np,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
-	return __thermal_cooling_device_register(np, type, devdata, ops);
+	return __thermal_cooling_device_register(NULL, np, type, devdata, ops);
 }
 EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
=20
@@ -1222,7 +1224,7 @@ devm_thermal_of_cooling_device_register(struct devic=
e *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
=20
-	tcd =3D __thermal_cooling_device_register(np, type, devdata, ops);
+	tcd =3D __thermal_cooling_device_register(dev, np, type, devdata, ops);
 	if (IS_ERR(tcd)) {
 		devres_free(ptr);
 		return tcd;

=2D-=20
2.39.5

