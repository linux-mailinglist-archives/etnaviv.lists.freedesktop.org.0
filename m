Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F667595D0
	for <lists+etnaviv@lfdr.de>; Wed, 19 Jul 2023 14:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3274010E49E;
	Wed, 19 Jul 2023 12:44:10 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722A310E453
 for <etnaviv@lists.freedesktop.org>; Wed, 19 Jul 2023 10:18:03 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-313e742a787so404106f8f.1
 for <etnaviv@lists.freedesktop.org>; Wed, 19 Jul 2023 03:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689761881; x=1690366681;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d6uSqq8iwHxn9/tpT05qWIJPin2r3B4nv+yMTWooWZQ=;
 b=SIOzxz0kITZK8LFNRze7JYjdZtc1YCSgzt3hjwJAeBkNjc+AvJSC1N7/zvWKNFT2fv
 habMlKdbAGHy8hqKFFxFqyYlUrjOI6uRKLk+Ni/S2VBmCgF1LFsed+EYzwSdN5UFx91f
 aezEQDv//EXlkk3QwhCTMiggeTDLMoMyewr9wQvN2WrVfUHviIG2KxRw8tZRLxtNVIiY
 gP5B7vwTv7lxPkt2x42ee8/nZRvPZOh07ZkazAYYdBGTrQm1kl91YnKxjIZZ8Ms8YsBG
 sqUJS0uFKrDKXDHslsHEwC29cDCuqfnJHZXVRKPkhxEOvPpVXdJehP3jJFd4a0GWRWwf
 cLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689761881; x=1690366681;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d6uSqq8iwHxn9/tpT05qWIJPin2r3B4nv+yMTWooWZQ=;
 b=YKAkYWgrehHaFadm1sF6c6sa44D1bz18XVLJetgiew7cix++zcPlUC6vVHjo2tcKK1
 qNJRsTpEd1x4WEOxzfIKrgwqItfT801ktRc7NHwA/TrlQFb5oD5R2vupXaOlXx1M0PxK
 vigd4PyjYpRDQmtG378kKevEb28UeDS6ljf1GRLc7Avd+DmEDGmebJq9rTEy5k8mR2Dp
 595VFQkPd1zdiH0FPDbD4ZRbwP2qepyti51rsnZaeDYz4VZZm6ApafyWAzcnOIc/Asex
 RA+7Z6iwf8tsvu75CUtTyJ60rJjhcpf+9Gx7byptBSI5PLXaYxKa700eoVD69S9G7dX5
 DiCQ==
X-Gm-Message-State: ABy/qLZguL1ZZ7J3yhGD439RuK7YqVzP0b2XSVe9Nnv2VXMmly9An8oo
 fpqyYViKv0c4DE3FnEQJ8ClEyA==
X-Google-Smtp-Source: APBJJlFM7viFvauoAMlySNo6VSSvtQdCoXkaiQxlJ4pgb0dZ2e8PBGcQhfI7IlseoQSuVvfamADMQg==
X-Received: by 2002:adf:f082:0:b0:314:2c77:681b with SMTP id
 n2-20020adff082000000b003142c77681bmr1387870wro.30.1689761881437; 
 Wed, 19 Jul 2023 03:18:01 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 d15-20020adff84f000000b00313f9085119sm4896291wrq.113.2023.07.19.03.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 03:18:00 -0700 (PDT)
Date: Wed, 19 Jul 2023 13:17:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH] drm/etnaviv: fix error code in event_alloc()
Message-ID: <53fc5292-669a-4fca-8b99-e35a49da0b0f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Mailman-Approved-At: Wed, 19 Jul 2023 12:44:09 +0000
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
Cc: kernel-janitors@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

There are two "ret" variables declared in this function so setting
"ret = -EBUSY;" sets the wrong one.  The function ends up returning an
uninitialized variable.

Fixes: f098f9b8042a ("drm/etnaviv: move runtime PM handling to events")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index f54f12090685..0382cd91eebf 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1158,18 +1158,18 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
 	int ret;
 
 	for (i = 0; i < nr_events; i++) {
-		unsigned long ret;
+		unsigned long remaining;
 
-		ret = wait_for_completion_timeout(&gpu->event_free, timeout);
+		remaining = wait_for_completion_timeout(&gpu->event_free, timeout);
 
-		if (!ret) {
+		if (!remaining) {
 			dev_err(gpu->dev, "wait_for_completion_timeout failed");
 			ret = -EBUSY;
 			goto out;
 		}
 
 		acquired++;
-		timeout = ret;
+		timeout = remaining;
 	}
 
 	spin_lock(&gpu->event_spinlock);
-- 
2.39.2

