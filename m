Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C930287FC56
	for <lists+etnaviv@lfdr.de>; Tue, 19 Mar 2024 11:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5E710F221;
	Tue, 19 Mar 2024 10:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="28wk1Z0o";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62C10F6AF
 for <etnaviv@lists.freedesktop.org>; Mon, 18 Mar 2024 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710765147;
 bh=fUDtTnNj0HehZ/h2QeBOiSoc8kQ7aGM5Rvc7i3Nw978=;
 h=From:To:Cc:Subject:Date:From;
 b=28wk1Z0o2mUVhvB7Gf6fZtH1EPkUbiMZeGCHjJBz68+VZS245nf9QiiuhzBo1eCxO
 00Yi+2FvauTZXe+tgN2ZCBOM2X4wOosLZIypBmYAWgzuqjN8Pspnl1cwWdDXVj+ksz
 va23kLr3LexW7y5nv2f+db1S+Mj32SFSWjB8Z8d7BLfD4VFilyzxcINsR1PuEUqeBH
 WvuYMO05JN8F9429OF/BFWoH8lAP9kZZNi3OQ+C2alaAMa1i9NMbO3HJhudvNFhRPE
 MHlgfY5hI5WVn0IzO1/cF8RycYCKj7DQlD0UqHXbqXuBrjvFXZ1G5GHz7Y3IkApz1l
 6tRIhOiP7pGTw==
Received: from sisyphus.fouville.ca (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: derekf)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0E4223780A0B;
 Mon, 18 Mar 2024 12:32:25 +0000 (UTC)
From: Derek Foreman <derek.foreman@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>
Subject: [PATCH] drm/etnaviv: fix tx clock gating on some GC7000 variants
Date: Mon, 18 Mar 2024 07:32:07 -0500
Message-ID: <20240318123207.2133223-1-derek.foreman@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Mar 2024 10:56:23 +0000
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

commit 4bce244272513ebb4d13c570e9fbca28497015b2 accidentally applied the
fix for i.MX8MN errata ERR050226 to GC2000 instead of GC7000, failing
to disable tx clock gating for GC7000 rev 0x6023 as intended.

Additional clean-up also partially undid the fix for GC7000 rev 6202 from
commit 432f51e7deedadceaf99a953a6f0a7b30c8155f

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 734412aae94d..6f763038c21a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -663,8 +663,8 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
 	/* Disable TX clock gating on affected core revisions. */
 	if (etnaviv_is_model_rev(gpu, GC4000, 0x5222) ||
 	    etnaviv_is_model_rev(gpu, GC2000, 0x5108) ||
-	    etnaviv_is_model_rev(gpu, GC2000, 0x6202) ||
-	    etnaviv_is_model_rev(gpu, GC2000, 0x6203))
+	    etnaviv_is_model_rev(gpu, GC7000, 0x6202) ||
+	    etnaviv_is_model_rev(gpu, GC7000, 0x6203))
 		pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_TX;
 
 	/* Disable SE and RA clock gating on affected core revisions. */
-- 
2.44.0

