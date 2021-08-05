Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE13E130B
	for <lists+etnaviv@lfdr.de>; Thu,  5 Aug 2021 12:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551CA6E9DA;
	Thu,  5 Aug 2021 10:47:32 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1726E99B
 for <etnaviv@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:28 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id x11so8793583ejj.8
 for <etnaviv@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vD2S+D+qrCZmRTtKkUPij1jFnTcmLCN3Y/bdBlucsvE=;
 b=ic1SXM32uTOLVJgGkmD4Es4BpeKc/jyWFibVMgY5g0aXLAwkcFZcdU42eH87ozcSGJ
 8YXnx+uNmWh5bhBdl+vZknJR12ctDcMIj8yO4C/ahzSS+kcoVG7G3as6pRPcGRWy30ub
 sDvkoOuIBNjT/P8blREcJeEe4c7RLns61/7lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vD2S+D+qrCZmRTtKkUPij1jFnTcmLCN3Y/bdBlucsvE=;
 b=aE608NgzCkA50pbdav8PI5HSesKwsgjvbTHACF+KSwXVKlDfc7PivhMAx2rNVotK5u
 nIWglB6OaIeC7VQwVjUjFp9AvVYaGA3htmh3qGf6YbaJcEuUBjzYjAVsJuJ+b6XqrRbc
 2xJqk1XRMGvgvVpmuRGiHAvfi7zTPatQttrF4jgI+Ct816Mb462kjjtofSWRDHCM3fI6
 e+Y2gJpJWKqdUwCcoptPmfjpB4r0mfQu05UcjKLRCXK5RPBazXeSrXUANT7WoWhAL8QK
 Hjlp0HMBetfwTyFXcsV3K6Sxb3KaBszdV4Mi/QFd0AxTW/KQzRIEJZqvyZEclKkhk+5u
 x7DQ==
X-Gm-Message-State: AOAM532Lc5bXznpiEENWu9JeEXUENRoTfUqA0lvFBxL2koA4dLnMYXul
 XyTDArglKxOozUI7mkFBvd24Yw==
X-Google-Smtp-Source: ABdhPJzyRHlFv8ykD4YHz5U9uoWYC0PJ246OHOlI07Dqn40yv9PG4/7M4N5faVYmKV5fhcCu24Zftw==
X-Received: by 2002:a17:906:cb95:: with SMTP id
 mf21mr4217141ejb.484.1628160446604; 
 Thu, 05 Aug 2021 03:47:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:26 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org
Subject: [PATCH v5 17/20] drm/etnaviv: Don't break exclusive fence ordering
Date: Thu,  5 Aug 2021 12:47:02 +0200
Message-Id: <20210805104705.862416-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
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
index e3d43678eb09..8d1703da971a 100644
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
2.32.0

