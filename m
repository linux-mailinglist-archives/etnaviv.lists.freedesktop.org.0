Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437F3C1857
	for <lists+etnaviv@lfdr.de>; Thu,  8 Jul 2021 19:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D796E97A;
	Thu,  8 Jul 2021 17:38:27 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6426B6E97F
 for <etnaviv@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:26 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 h18-20020a05600c3512b029020e4ceb9588so7353313wmq.5
 for <etnaviv@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0WTGYnK900Sbe5MqmyJ3un5MyLkukJoTVto5awctnjg=;
 b=BA1CI8n7aj+1YVE5l3gQVnejBeTwCmeyUcjV91D7KTNOnYIwytTAkvbR8AH8S5nxhM
 XNJcpcUBKrCntnF+k+yW3FPRMB5IJA008Lbe+rfkUoO0QV+5xZDvL2VqvfMLcXfTriAj
 nu46KM9lpB69+zP/kenMTREsC/XZ+8y4rGOOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0WTGYnK900Sbe5MqmyJ3un5MyLkukJoTVto5awctnjg=;
 b=fq6oDV573/TR2d2gNBm+YdWZs7XRToNTYmT7vuIy7jmFRkcrmSk8J/hgErC1lL58es
 MYNoGuNdNJ8QzFkZeugXqiEEaIUiIsDY47JaPaKu68xt01R/OVlDGJzD/6Ay4J3jd+KD
 GWGaayU8oSQ6ajkdU3jO1lFaWJ5NortXKmMqjaRfY9pPeCUoz0mQYR6DXZ638Da8r7mH
 kuE68kwkd0CcGhkNFJ4eAflLKou8HxWEl7IBasc6Be/n3JAEMOcblCNJTZmvd9xWgn9j
 3vEOC/sCD/rULR765pTY0H889i/NAVVikaYGu6sHbS6lfRk2lrWuYHOKMtiX3nfVUh5p
 y/fg==
X-Gm-Message-State: AOAM533p0j4JG+2zog98PXJgIc7dItqbgXuRdvqQiHSQx0wy9Q7elYbI
 uQc4yY+nS7hycGvnfzWWid3WVA==
X-Google-Smtp-Source: ABdhPJz7mmooXtaadMV9ZD0WmVXBhzIQ8PxzWcH6S+b8dayPdbprohIHZhT8E02oA9aRKQSWmNri+Q==
X-Received: by 2002:a1c:7410:: with SMTP id p16mr35274636wmc.24.1625765905080; 
 Thu, 08 Jul 2021 10:38:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:24 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 17/20] drm/etnaviv: Don't break exclusive fence ordering
Date: Thu,  8 Jul 2021 19:37:51 +0200
Message-Id: <20210708173754.3877540-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index 5b97ce1299ad..07454db4b150 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -178,18 +178,20 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
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
 
 		ret = drm_sched_job_await_implicit(&submit->sched_job, &bo->obj->base,
-						   bo->flags & ETNA_SUBMIT_BO_WRITE);
+						   write);
 		if (ret)
 			return ret;
 	}
-- 
2.32.0

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
