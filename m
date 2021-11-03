Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E331443E2E
	for <lists+etnaviv@lfdr.de>; Wed,  3 Nov 2021 09:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890C1734C7;
	Wed,  3 Nov 2021 08:12:41 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81FB734C0;
 Wed,  3 Nov 2021 08:12:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u18so2245792wrg.5;
 Wed, 03 Nov 2021 01:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
 b=g9U1aSa+6bfag8lo3nJKStn7BnOsmwJb6j1n4QC0Lkp1bDff6m9nVVeAoToH3yAudW
 4jTbxb8/cz27CKva48/O/RblrmnLlJa141hwjr/7zvWE1IjnsP9KKu7Zbc4G7kGQ+bjy
 TRMIQFhu0WKSRP/jVfYGghycdSFltphYSAwVFMpZt91dTudt5/B1Bw7LABU4HXO3tbv8
 q9Q62IJ8avbKVgS4KTNxIMKbWGcXUxKEB+i3t+0ZCrlwNWFLXmBmD/GZCpKLiZFgIp3z
 8zW847hVRQ1jOayX9XCwct3J+rN0aZqVN6CWHmMOhJF6kywpn1Xl6nxJGDznecM+bw+q
 2k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
 b=QpN0blYHtN6isPxPoDoHeKpxd9OCAGxA8YtkbCRJFJw/30fGcBy7vLt78BekoTjPd3
 BQKXqDApa+09R8tUN98vJ+RCYa2aZSEed9+fVlwACOz5e4HODro2JBlLHasJF8d9XGHd
 Ss42PkeZEXAl/ikAjRCwEYfVHGiy7e+DavUOp0cjSH/88qaX5FzGy8NtCUapeRja6ms2
 EaxupHJ9W6GIwrUvlkxlCPLPauvlf4PERLrdMW9jCh6GUmfUe3wOJq91AMZGLdfw6Wgc
 FruxNQHy7sK7lHyl50SBbcHokgVaEM5T602MAyeY9nzVCf+Vii33KsifykWFiePWHRJQ
 SUJg==
X-Gm-Message-State: AOAM5312ivoS6xG9YIKEUtJMZrMLIg9hnIG0der4ZK5gz9ZGCGZG8RE1
 4YQUAXxan+n0wP7kO5VqjM8=
X-Google-Smtp-Source: ABdhPJxlY/OJLgc774nRzsIwvqJo4XvP/pZEzGcq0XIZGbOcmmVvVYVPx0RKwrS16P8UJv2gUPvNvA==
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr53757436wrs.46.1635927158385; 
 Wed, 03 Nov 2021 01:12:38 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l7sm1450088wry.86.2021.11.03.01.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:12:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, etnaviv@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/qxl: use iterator instead of dma_resv_shared_list
Date: Wed,  3 Nov 2021 09:12:31 +0100
Message-Id: <20211103081231.18578-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103081231.18578-1-christian.koenig@amd.com>
References: <20211103081231.18578-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: sumit.semwal@linaro.org, daniel@ffwll.ch, l.stach@pengutronix.de
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

I'm not sure why it is useful to know the number of fences
in the reservation object, but we try to avoid exposing the
dma_resv_shared_list() function.

So use the iterator instead. If more information is desired
we could use dma_resv_describe() as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/qxl/qxl_debugfs.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 1f9a59601bb1..6a36b0fd845c 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -57,13 +57,16 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 	struct qxl_bo *bo;
 
 	list_for_each_entry(bo, &qdev->gem.objects, list) {
-		struct dma_resv_list *fobj;
-		int rel;
-
-		rcu_read_lock();
-		fobj = dma_resv_shared_list(bo->tbo.base.resv);
-		rel = fobj ? fobj->shared_count : 0;
-		rcu_read_unlock();
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
+		int rel = 0;
+
+		dma_resv_iter_begin(&cursor, bo->tbo.base.resv, true);
+		dma_resv_for_each_fence_unlocked(&cursor, fence) {
+			if (dma_resv_iter_is_restarted(&cursor))
+				rel = 0;
+			++rel;
+		}
 
 		seq_printf(m, "size %ld, pc %d, num releases %d\n",
 			   (unsigned long)bo->tbo.base.size,
-- 
2.25.1

