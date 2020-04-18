Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2037E1B0F4E
	for <lists+etnaviv@lfdr.de>; Mon, 20 Apr 2020 17:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A116E5B2;
	Mon, 20 Apr 2020 15:08:50 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 546 seconds by postgrey-1.36 at gabe;
 Sat, 18 Apr 2020 10:10:33 UTC
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 516266E250
 for <etnaviv@lists.freedesktop.org>; Sat, 18 Apr 2020 10:10:32 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
 rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id 2eec5e9acfe6ca7-aceeb;
 Sat, 18 Apr 2020 18:01:13 +0800 (CST)
X-RM-TRANSID: 2eec5e9acfe6ca7-aceeb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.1.172.61])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee15e9acfe69d5-6ed96;
 Sat, 18 Apr 2020 18:01:12 +0800 (CST)
X-RM-TRANSID: 2ee15e9acfe69d5-6ed96
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/etnaviv: Omit superfluous error message in
 etnaviv_gpu_platform_probe()
Date: Sat, 18 Apr 2020 18:02:48 +0800
Message-Id: <20200418100248.4552-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Apr 2020 15:08:50 +0000
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
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

In the function etnaviv_gpu_platform_probe(), when get irq failed,
the function platform_get_irq() logs an error message, so remove
redundant message here.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a31eeff2b..6dbe0c45b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1770,10 +1770,8 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 
 	/* Get Interrupt: */
 	gpu->irq = platform_get_irq(pdev, 0);
-	if (gpu->irq < 0) {
-		dev_err(dev, "failed to get irq: %d\n", gpu->irq);
+	if (gpu->irq < 0)
 		return gpu->irq;
-	}
 
 	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
 			       dev_name(gpu->dev), gpu);
-- 
2.20.1.windows.1



_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
