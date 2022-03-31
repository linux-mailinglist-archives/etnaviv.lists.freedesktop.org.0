Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953F44EE2D8
	for <lists+etnaviv@lfdr.de>; Thu, 31 Mar 2022 22:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D76A10E36E;
	Thu, 31 Mar 2022 20:47:01 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3650610E36E
 for <etnaviv@lists.freedesktop.org>; Thu, 31 Mar 2022 20:47:00 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d7so1384889wrb.7
 for <etnaviv@lists.freedesktop.org>; Thu, 31 Mar 2022 13:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OaigAmf9HLJxa16DMsmAOftU6jO0cKv4WD1sNiYt+HM=;
 b=BHVQFvupc9m/eDyIV7I1Jubm4zS9XomLiNbx4OEFbP4hbJdz4uBMQBLgCPjmlG6Wy0
 hxy3FhF9cFFtVXLr4lWhnEpka2yWwKsR1rUzGawiduuEF/ei0aBiX2D0UbzZXbGqT2Fj
 HT32sRFN7+YJnjiNkXvHmxejWV80YImoIoVDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OaigAmf9HLJxa16DMsmAOftU6jO0cKv4WD1sNiYt+HM=;
 b=3smRLkxvesI7Z9InlUhpi4J+1pPndCtnBtfdUVzXB+aYK+IpmZJBIRvPJD+IXTI9gg
 Yb7FyM/SkqaBW5UZXGNpgGNU0vr54tGyEIB6EuuoVUfMrLdGsunhiULFJeq4pDAuGth6
 q3sLay034QD2G+8B+VRoRzIWaCfXuUpTzCqZgOEdTqchaHV+VrIlZvSjfPvt0RHf7ZJD
 NJqGTV8vIOpetqqkszrnjK7ujOn40svRR3waBpfHaldAdfjgqclfSb/pNoHQL9QKcc2H
 W6+qYRnYyIjk4ou5mgCPSkrgpg6vQDDwjPcFAYWmYhFVG9WPXzsbythuAAL/0Ud2cLE1
 rX+g==
X-Gm-Message-State: AOAM532LNXjEnTUWaTHfyWaEDu6Tcg/xCmcMgJsjGA63gYKBuj25bzjb
 DAWHj+GR2ErNYAyi6TV+CB0+eZPZynVtX0Zf
X-Google-Smtp-Source: ABdhPJwHFf4/uz1nE9SiH+iiaEVhOnoMTbI0bc1+dm7eOmTVB+KJXTtgjTX3Y21nfonb8wLruPkM8A==
X-Received: by 2002:a5d:6092:0:b0:203:f860:a84 with SMTP id
 w18-20020a5d6092000000b00203f8600a84mr5323914wrt.160.1648759618793; 
 Thu, 31 Mar 2022 13:46:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a05600018af00b002057c72d45fsm480319wri.77.2022.03.31.13.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:46:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/etnaviv: Don't break exclusive fence ordering
Date: Thu, 31 Mar 2022 22:46:51 +0200
Message-Id: <20220331204651.2699107-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
References: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, etnaviv@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

There's only one exclusive slot, and we must not break the ordering.
Adding a new exclusive fence drops all previous fences from the
dma_resv. To avoid violating the signalling order we err on the side of
over-synchronizing by waiting for the existing fences, even if
userspace asked us to ignore them.

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but it probably makes sense to lift this into
dma-resv.c code as a proper concept, so that drivers don't have to
hack up their own solution each on their own. Hence go with the simple
fix for now.

Another option is the fence import ioctl from Jason:

https://lore.kernel.org/dri-devel/20210610210925.642582-7-jason@jlekstrand.net/

v2: Improve commit message per Lucas' suggestion.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 5f502c49aec2..14c5ff155336 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -178,19 +178,21 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
 		struct dma_resv *robj = bo->obj->base.resv;
+		bool write = bo->flags & ETNA_SUBMIT_BO_WRITE;
 
-		if (!(bo->flags & ETNA_SUBMIT_BO_WRITE)) {
+		if (!(write)) {
 			ret = dma_resv_reserve_shared(robj, 1);
 			if (ret)
 				return ret;
 		}
 
-		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
+		/* exclusive fences must be ordered */
+		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT && !write)
 			continue;
 
 		ret = drm_sched_job_add_implicit_dependencies(&submit->sched_job,
 							      &bo->obj->base,
-							      bo->flags & ETNA_SUBMIT_BO_WRITE);
+							      write);
 		if (ret)
 			return ret;
 	}
-- 
2.34.1

