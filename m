Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D874C14169C
	for <lists+etnaviv@lfdr.de>; Sat, 18 Jan 2020 09:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F946F9D2;
	Sat, 18 Jan 2020 08:44:48 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4493B6EE32;
 Thu, 16 Jan 2020 17:24:49 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1331E246B2;
 Thu, 16 Jan 2020 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579195489;
 bh=EAJbWnwBlpDDCXgh5JtZ8Bw4nWOjmpO5KaecW+klynY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VZuWLbuA7Z63ZCvO0KxO97j3xYvWT/ERgtrbPiDJ4GHfryzhuQVOuZzBnJi/EII5G
 MIFGk96gxKmthAu5AfZqv7AzpGxXoifsb/oOw4+b4Jl6tvy3Gwzy1ID1NG6u+UegvR
 fpz2/wnidwJM9hby81rIK379gFayrdwFm5D9TjUw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 092/371] drm/etnaviv: potential NULL dereference
Date: Thu, 16 Jan 2020 12:19:24 -0500
Message-Id: <20200116172403.18149-35-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116172403.18149-1-sashal@kernel.org>
References: <20200116172403.18149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Approved-At: Sat, 18 Jan 2020 08:44:47 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>, linux-media@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit 9e05352340d3a3e68c144136db9810b26ebb88c3 ]

The etnaviv_gem_prime_get_sg_table() is supposed to return error
pointers.  Otherwise it can lead to a NULL dereference when it's called
from drm_gem_map_dma_buf().

Fixes: 5f4a4a73f437 ("drm/etnaviv: fix gem_prime_get_sg_table to return new SG table")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index ae884723e9b1..880b95511b98 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -26,7 +26,7 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	int npages = obj->size >> PAGE_SHIFT;
 
 	if (WARN_ON(!etnaviv_obj->pages))  /* should have already pinned! */
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	return drm_prime_pages_to_sg(etnaviv_obj->pages, npages);
 }
-- 
2.20.1

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
