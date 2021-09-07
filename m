Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B11402D26
	for <lists+etnaviv@lfdr.de>; Tue,  7 Sep 2021 18:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D316E063;
	Tue,  7 Sep 2021 16:49:57 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B246E05D;
 Tue,  7 Sep 2021 16:49:55 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A8B1622175;
 Tue,  7 Sep 2021 18:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1631033393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RBIaEU+QYRJFKSVBjVbUGUzxvaWbeZCnz5PKzm5X2GQ=;
 b=YhiJSkf6SgSXcXZhUZRVN1SrYWpTY2oGzLSHPG+7bLeaQBJ48I4LJgDj9XyIibCV/yBVyD
 4zQYOCiAXlEhq2I+39/qg3rVbo2tgZcUK2QWxKwfzomgXe70r0HDOoeY3VfmaAQ20HQmBl
 wb9hyz2JunKJnQupi/UPJwyYZ3Qe9Qk=
From: Michael Walle <michael@walle.cc>
To: Robin Murphy <robin.murphy@arm.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: "Lukas F . Hartmann" <lukas@mntre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v2 0/3] drm/etnaviv: IOMMU related fixes
Date: Tue,  7 Sep 2021 18:49:42 +0200
Message-Id: <20210907164945.2309815-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
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

This patch series fixes usage of the etnaviv driver with GPUs behind a
IOMMU. It was tested on a NXP LS1028A SoC. Together with Lucas' MMU patches
[1] there are not more (GPU internal) MMU nor (system) IOMMU faults on the
LS1028A.

[1] https://lists.freedesktop.org/archives/etnaviv/2021-August/003682.html

changes since v1:
 - don't move the former dma_mask setup code around in patch 2/3. Will
   avoid any confusion.

Michael Walle (3):
  drm/etnaviv: use PLATFORM_DEVID_NONE
  drm/etnaviv: fix dma configuration of the virtual device
  drm/etnaviv: use a 32 bit mask as coherent DMA mask

 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 41 ++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 10 deletions(-)

-- 
2.30.2

