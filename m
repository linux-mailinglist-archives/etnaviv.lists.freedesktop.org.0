Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A229BBE78
	for <lists+etnaviv@lfdr.de>; Mon,  4 Nov 2024 21:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C0910E4BC;
	Mon,  4 Nov 2024 20:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="KeWPJWVC";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E0310E4BC
 for <etnaviv@lists.freedesktop.org>; Mon,  4 Nov 2024 20:04:08 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730750646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ylQFc/OOYVM30hSaKoL7NXIWVa/EQ8JYV4MG8zHIVTw=;
 b=KeWPJWVCL6KoWFKRSwndKe/+KUb4jgXv5wPi76Pp7Hdo6ZD+AoE8/2bsMjmhNGaJVBiAMu
 YFoQyW5os3AhA8mS+uR3QReakB1MD2fH1s1WOy1xhhzYHlHeqqGxbyW92jRPxPKyNkzOTU
 xPKVrthdh1P2SHCF+BHTq0TZX+sy7S8=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [etnaviv-next v2 0/3] drm/etnaviv: Trivial mmu map and ummap cleanups
Date: Tue,  5 Nov 2024 04:03:51 +0800
Message-Id: <20241104200354.656525-1-sui.jingfeng@linux.dev>
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

The 'offset' data member of the 'struct scatterlist' denotes the offset
into a SG entry in bytes. But it seems that nearly all helper functions
we are using will hardcode it to ZERO. Under such a case, it seems that
take the 'offset' into accounts are just intoduce extra overhead. Waste
CPU circles, then is it correct and safe for us do some simplification
now?

v1 -> v2
	* Reword and fix typos and mistakes

v1 Link: https://patchwork.freedesktop.org/series/140589/

Sui Jingfeng (3):
  drm/etnaviv: Drop offset in page manipulation
  drm/etnaviv: Fix the debug log of the etnaviv_iommu_map()
  drm/etnaviv: Improve VA, PA, SIZE alignment checking

 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

-- 
2.34.1

