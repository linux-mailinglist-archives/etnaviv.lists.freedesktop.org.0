Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5230C3C2
	for <lists+etnaviv@lfdr.de>; Tue,  2 Feb 2021 16:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F816E193;
	Tue,  2 Feb 2021 15:28:50 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685D56E2F2;
 Fri, 29 Jan 2021 01:48:27 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DRgDm53KpzlCJs;
 Fri, 29 Jan 2021 09:46:48 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 29 Jan 2021 09:48:21 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <l.stach@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>
Subject: [PATCH] drm/etnaviv: fix coccicheck by ifnullfree.cocci
Date: Fri, 29 Jan 2021 09:48:03 +0800
Message-ID: <1611884883-36726-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 02 Feb 2021 15:28:49 +0000
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Fixes coccicheck warning:
./drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:616:2-8: WARNING: NULL check before some
freeing functions is not needed.
./drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:618:2-8: WARNING: NULL check before some
freeing functions is not needed.
./drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:620:2-8: WARNING: NULL check before some
freeing functions is not needed.
./drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:622:2-8: WARNING: NULL check before some
freeing functions is not needed.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index d05c359..bd0d66e 100644
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
2.7.4

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
