Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3BA478954
	for <lists+etnaviv@lfdr.de>; Fri, 17 Dec 2021 11:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A817E10EC7E;
	Fri, 17 Dec 2021 10:59:33 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0678F10ECAE
 for <etnaviv@lists.freedesktop.org>; Fri, 17 Dec 2021 10:59:32 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1myAxW-0000Z3-AB; Fri, 17 Dec 2021 11:59:30 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: limit submit sizes
Date: Fri, 17 Dec 2021 11:59:28 +0100
Message-Id: <20211217105928.3182024-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Currently we allow rediculous ammounts of kernel memory being allocated
via the etnaviv GEM_SUBMIT ioctl, which is a pretty easy DoS vector. Put
some reasonable limits in to fix this.

The commandstream size is limited to 64KB, which was already a soft limit
on older kernels after which the kernel only took submits on a best effort
base, so there is no userspace that tries to submit commandstreams larger
than this. Even if the whole commandstream is a single incrementing address
load, the size limit also limits the number of potential relocs and
referenced buffers to slightly under 64K, so use the same limit for those
arguments. The performance monitoring infrastructure currently supports
less than 50 performance counter signals, so limiting them to 128 on a
single submit seems like a reasonably future-proof number for now. This
number can be bumped if needed without breaking the interface.

Cc: stable@vger.kernel.org
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 486259e154af..225fa5879ebd 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -469,6 +469,12 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
+	if (args->stream_size > SZ_64K || args->nr_relocs > SZ_64K ||
+	    args->nr_bos > SZ_64K || args->nr_pmrs > 128) {
+		DRM_ERROR("submit arguments out of size limits\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Copy the command submission and bo array to kernel space in
 	 * one go, and do this outside of any locks.
-- 
2.30.2

