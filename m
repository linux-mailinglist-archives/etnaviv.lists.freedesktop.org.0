Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060BF9B0C29
	for <lists+etnaviv@lfdr.de>; Fri, 25 Oct 2024 19:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D3910EB61;
	Fri, 25 Oct 2024 17:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="lG6FcQkz";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6CA10EB5F
 for <etnaviv@lists.freedesktop.org>; Fri, 25 Oct 2024 17:51:59 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729878717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0VAovJZnv81E9jN21fLB7KRqTnaLqZovtOnStvkrsto=;
 b=lG6FcQkzWOhTOyl2YtmtCf5w+WUyJwCRe6b/tzxgu/2mpJT9AT3aXo+dLaQorkjoCpnXlk
 4iMmsPvM7qIMsCYZvfq6qvC94wqdBtHDocDDQ+3B1BKb176cRTKWIPBtRSSupSZ9LaVYq/
 0WrcSD7RvVZcOqD6RpPqqPH5yPhe8Do=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm/etnaviv: Drop the 'struct etnaviv_iommu_global::pta_lock'
 data member
Date: Sat, 26 Oct 2024 01:51:36 +0800
Message-Id: <20241025175136.414054-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Because it is not get used, drop it.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
index c01a147f0dfd..7f8ac0178547 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
@@ -61,7 +61,6 @@ struct etnaviv_iommu_global {
 			/* P(age) T(able) A(rray) */
 			u64 *pta_cpu;
 			dma_addr_t pta_dma;
-			struct spinlock pta_lock;
 			DECLARE_BITMAP(pta_alloc, ETNAVIV_PTA_ENTRIES);
 		} v2;
 	};
-- 
2.34.1

