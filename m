Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC6E35AB69
	for <lists+etnaviv@lfdr.de>; Sat, 10 Apr 2021 08:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB706E10B;
	Sat, 10 Apr 2021 06:43:32 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764E16E4A2;
 Fri,  9 Apr 2021 12:23:13 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGy091Yytz9xX2;
 Fri,  9 Apr 2021 20:20:57 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.176.196) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 20:22:59 +0800
From: Qiheng Lin <linqiheng@huawei.com>
To: <l.stach@pengutronix.de>, <linux+etnaviv@armlinux.org.uk>,
 <christian.gmeiner@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/etnaviv: remove unneeded if-null-free check
Date: Fri, 9 Apr 2021 20:22:31 +0800
Message-ID: <20210409122231.8391-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.174.176.196]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 10 Apr 2021 06:43:31 +0000
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
Cc: Qiheng Lin <linqiheng@huawei.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Eliminate the following coccicheck warning:

drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:616:2-8: WARNING:
 NULL check before some freeing functions is not needed.
drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:618:2-8: WARNING:
 NULL check before some freeing functions is not needed.
drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:620:2-8: WARNING:
 NULL check before some freeing functions is not needed.
drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:622:2-8: WARNING:
 NULL check before some freeing functions is not needed.

Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index d05c35994579..bd0d66ebf314 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -612,14 +612,10 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 err_submit_cmds:
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
-	if (stream)
-		kvfree(stream);
-	if (bos)
-		kvfree(bos);
-	if (relocs)
-		kvfree(relocs);
-	if (pmrs)
-		kvfree(pmrs);
+	kvfree(stream);
+	kvfree(bos);
+	kvfree(relocs);
+	kvfree(pmrs);
 
 	return ret;
 }
-- 
2.31.1

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
