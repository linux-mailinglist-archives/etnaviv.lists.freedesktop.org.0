Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BC073F6BF
	for <lists+etnaviv@lfdr.de>; Tue, 27 Jun 2023 10:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4620F10E2AF;
	Tue, 27 Jun 2023 08:17:15 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 514 seconds by postgrey-1.36 at gabe;
 Fri, 23 Jun 2023 10:17:05 UTC
Received: from out-23.mta0.migadu.com (out-23.mta0.migadu.com [91.218.175.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4AD10E106
 for <etnaviv@lists.freedesktop.org>; Fri, 23 Jun 2023 10:17:05 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1687514907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WQvQ1/8ew72J0lPd28yNsu5tnN3fJmOWFY9fr+RpJdw=;
 b=jwmZ6pTywJ2krzZsDq3HjK7YXRqLJREJOP/aKd1VPXwi8EHrGBlxcFsG7bmb3VuYIYDIqX
 H68rmmEGjFLohzjNfmCSXXweAjP17iBHfkqsmnTfWZbPRNe1kS2wZ3rw5cZ32sHeIFoSQX
 9m5BB/xHZe/63cSH3icuf4ux1cjMN0k=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 0/8] drm/etnaviv: Various cleanup
Date: Fri, 23 Jun 2023 18:08:14 +0800
Message-Id: <20230623100822.274706-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 27 Jun 2023 08:17:10 +0000
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
Cc: loongson-kernel@lists.loongnix.cn, Sui Jingfeng <suijingfeng@loongson.cn>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

No functional change.

Sui Jingfeng (8):
  drm/etnaviv: Using the size_t variable to store the number of pages
  drm/etnaviv: Using the unsigned int type to count the number of pages
  drm/etnaviv: Drop the second argument of the etnaviv_gem_new_impl()
  drm/etnaviv: Remove surplus else after return
  drm/etnaviv: Keep the curly brace aligned
  drm/etnaviv: No indentation by double tabs
  drm/etnaviv: Add dedicated functions to create and destroy platform
    device
  drm/etnaviv: Add a helper to get a pointer to the first available node

 drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 100 +++++++++++++-------
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  14 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |   7 +-
 3 files changed, 77 insertions(+), 44 deletions(-)

-- 
2.25.1

