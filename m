Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320F835974A
	for <lists+etnaviv@lfdr.de>; Fri,  9 Apr 2021 10:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179466EBA3;
	Fri,  9 Apr 2021 08:11:09 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D966E17F
 for <etnaviv@lists.freedesktop.org>; Thu,  8 Apr 2021 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617873638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVD5TiRVowOEwlanTU+u0spxJ8BlxpAWloXgCiVtay0=;
 b=bxQsTATc0trocSay2BJ7USm49ucd3hpM5fIwWU8CGggRJ44PhjgVudyg0gfScz6rXTPc/c
 f5oStc4wVQBlx0rF/SnQwfVtRWP/5nvYDbsAmjKCyUrlsjpst0rc+qpwGXNUGtXFCImpBj
 8TOxEcRXSEeIoAaqDteUyHVt6w5hEtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-m83rqXtVNYmboz8HyHTSQA-1; Thu, 08 Apr 2021 05:20:34 -0400
X-MC-Unique: m83rqXtVNYmboz8HyHTSQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4E8A1006C80;
 Thu,  8 Apr 2021 09:20:31 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB3B22C169;
 Thu,  8 Apr 2021 09:20:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
Date: Thu,  8 Apr 2021 11:20:11 +0200
Message-Id: <20210408092011.52763-3-david@redhat.com>
In-Reply-To: <20210408092011.52763-1-david@redhat.com>
References: <20210408092011.52763-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mailman-Approved-At: Fri, 09 Apr 2021 08:11:07 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 David Hildenbrand <david@redhat.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 etnaviv@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Peter Collingbourne <pcc@google.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@aj.id.au>, Randy Dunlap <rdunlap@infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Mike Rapoport <rppt@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Random drivers should not override a user configuration of core knobs
(e.g., CONFIG_DMA_CMA=n). Use "imply" instead, to still respect
dependencies and manual overrides.

"This is similar to "select" as it enforces a lower limit on another
 symbol except that the "implied" symbol's value may still be set to n
 from a direct dependency or with a visible prompt."

Implying DRM_CMA should be sufficient, as that depends on CMA.

Note: If this is a real dependency, we should use "depends on DMA_CMA"
instead -  but I assume the driver can work without CMA just fine --
esp. when we wouldn't have HAVE_DMA_CONTIGUOUS right now.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/aspeed/Kconfig  | 3 +--
 drivers/gpu/drm/etnaviv/Kconfig | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/Kconfig
index 5e95bcea43e9..a055f763d230 100644
--- a/drivers/gpu/drm/aspeed/Kconfig
+++ b/drivers/gpu/drm/aspeed/Kconfig
@@ -6,9 +6,8 @@ config DRM_ASPEED_GFX
 	depends on MMU
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
-	select DMA_CMA if HAVE_DMA_CONTIGUOUS
-	select CMA if HAVE_DMA_CONTIGUOUS
 	select MFD_SYSCON
+	imply DRM_CMA
 	help
 	  Chose this option if you have an ASPEED AST2500 SOC Display
 	  Controller (aka GFX).
diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kconfig
index faa7fc68b009..5f5576b7221a 100644
--- a/drivers/gpu/drm/etnaviv/Kconfig
+++ b/drivers/gpu/drm/etnaviv/Kconfig
@@ -9,9 +9,8 @@ config DRM_ETNAVIV
 	select THERMAL if DRM_ETNAVIV_THERMAL
 	select TMPFS
 	select WANT_DEV_COREDUMP
-	select CMA if HAVE_DMA_CONTIGUOUS
-	select DMA_CMA if HAVE_DMA_CONTIGUOUS
 	select DRM_SCHED
+	imply DMA_CMA
 	help
 	  DRM driver for Vivante GPUs.
 
-- 
2.30.2

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
