Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B45B605DE1
	for <lists+etnaviv@lfdr.de>; Thu, 20 Oct 2022 12:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6023910EC74;
	Thu, 20 Oct 2022 10:38:43 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF9110E6F6;
 Thu, 20 Oct 2022 10:38:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E11901FA90;
 Thu, 20 Oct 2022 10:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666262282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkMHENyFsh6/3SjkSTuYRYMbHc7R5XzWBBCbrwJgYhc=;
 b=1iiK5H3VCq2QZPD9I6TaLe5/dMWlIhalrt5djJ2luVVaxnv1fAuIh/hwuw6a3/WNyh20Zx
 q30hl/TTc5vv9pZ08LkTAQW5UIo5mgzBkMj6j3gzxw0Alyq38w6Ako/4EdwH437ov9gCMb
 69LE0q28P52yd357VRsNAHoJ7rSH73s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666262282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkMHENyFsh6/3SjkSTuYRYMbHc7R5XzWBBCbrwJgYhc=;
 b=x46APQL1svgGc11HQOHFEs8osVroEdR2Ae3IDMhH3RiyBUJNS8G/LmoWWl6MsmYBLslbim
 A0NNGlzosuhEQTBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 720DE13AF5;
 Thu, 20 Oct 2022 10:38:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aMgYGwolUWPPYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Oct 2022 10:38:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 11/21] drm/fb-helper: Cleanup include statements in header file
Date: Thu, 20 Oct 2022 12:37:45 +0200
Message-Id: <20221020103755.24058-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221020103755.24058-1-tzimmermann@suse.de>
References: <20221020103755.24058-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Only include what we have to.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_fb_helper.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index fddd0d1af6891..e923089522896 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -32,11 +32,9 @@
 
 struct drm_fb_helper;
 
-#include <drm/drm_client.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_device.h>
 #include <linux/fb.h>
-#include <linux/kgdb.h>
+
+#include <drm/drm_client.h>
 
 enum mode_set_atomic {
 	LEAVE_ATOMIC_MODE_SET,
-- 
2.38.0

