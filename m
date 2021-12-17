Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9EE479601
	for <lists+etnaviv@lfdr.de>; Fri, 17 Dec 2021 22:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB09310E342;
	Fri, 17 Dec 2021 21:10:05 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 592 seconds by postgrey-1.36 at gabe;
 Fri, 17 Dec 2021 21:10:03 UTC
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id F30A810E342
 for <etnaviv@lists.freedesktop.org>; Fri, 17 Dec 2021 21:10:03 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id 94E46E74217; Fri, 17 Dec 2021 21:59:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.1
Received: from astat.fritz.box (a89-183-128-155.net-htp.de [89.183.128.155])
 by lynxeye.de (Postfix) with ESMTPA id 7609FE7414D;
 Fri, 17 Dec 2021 21:59:39 +0100 (CET)
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH RFT] drm/etnaviv: reap idle softpin mappings when necessary
Date: Fri, 17 Dec 2021 21:59:36 +0100
Message-Id: <20211217205936.153220-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Right now the only point where softpin mappings get removed from the
MMU context is when the mapped GEM object is destroyed. However,
userspace might want to reuse that address space before the object
is destroyed, which is a valid usage, as long as all mapping in that
region of the address space are no longer used by any GPU jobs.

Implement reaping of idle MMU mappings that would otherwise
prevent the insertion of a softpin mapping.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 9fb1a2aadbcb..9111288b4062 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -219,8 +219,47 @@ static int etnaviv_iommu_find_iova(struct etnaviv_iommu_context *context,
 static int etnaviv_iommu_insert_exact(struct etnaviv_iommu_context *context,
 		   struct drm_mm_node *node, size_t size, u64 va)
 {
+	struct etnaviv_vram_mapping *m, *n;
+	struct drm_mm_node *scan_node;
+	LIST_HEAD(scan_list);
+	int ret;
+
 	lockdep_assert_held(&context->lock);
 
+	ret = drm_mm_insert_node_in_range(&context->mm, node, size, 0, 0, va,
+					  va + size, DRM_MM_INSERT_LOWEST);
+	if (ret != -ENOSPC)
+		return ret;
+
+	/*
+	 * When we can't insert the node, due to a existing mapping blocking
+	 * the address space, there are two possible reasons:
+	 * 1. Userspace genuinely messed up and tried to reuse address space
+	 * before the last job using this VMA has finished executing.
+	 * 2. The existing buffer mappings are idle, but the buffers are not
+	 * destroyed yet (likely due to being referenced by another context) in
+	 * which case the mappings will not be cleaned up and we must reap them
+	 * here to make space for the new mapping.
+	 */
+
+	drm_mm_for_each_node_in_range(scan_node, &context->mm, va, va + size) {
+		m = container_of(scan_node, struct etnaviv_vram_mapping,
+				 vram_node);
+
+		if (m->use)
+			return -ENOSPC;
+
+		list_add(&m->scan_node, &scan_list);
+	}
+
+	list_for_each_entry_safe(m, n, &scan_list, scan_node) {
+		etnaviv_iommu_remove_mapping(context, m);
+		etnaviv_iommu_context_put(m->context);
+		m->context = NULL;
+		list_del_init(&m->mmu_node);
+		list_del_init(&m->scan_node);
+	}
+
 	return drm_mm_insert_node_in_range(&context->mm, node, size, 0, 0, va,
 					   va + size, DRM_MM_INSERT_LOWEST);
 }
-- 
2.31.1

