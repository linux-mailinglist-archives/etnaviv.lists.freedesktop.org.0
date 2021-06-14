Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C713A7ED1
	for <lists+etnaviv@lfdr.de>; Tue, 15 Jun 2021 15:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96F2897FB;
	Tue, 15 Jun 2021 13:13:26 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 502 seconds by postgrey-1.36 at gabe;
 Mon, 14 Jun 2021 22:26:30 UTC
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4B189C5E;
 Mon, 14 Jun 2021 22:26:30 +0000 (UTC)
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9B00222235;
 Tue, 15 Jun 2021 00:18:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1623709084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NMazRWFUklqY5eKDwZP4pOG/B4qTZtlOrNAqqXg85KM=;
 b=WIlbTbIMoEMwgAeIBTZqL45CA8FFfQ0Dr5KF7/eIx42VylMacCCVZbbv1CQsApJ9evwaKw
 AWZl927+zd9UzC57FvyONCA+Sfs/pum2ch2Fa8gOH8xp8WFuKgoZI0PpW9Wq41Nk9T3Vl+
 Jhm4qiaciaigpXAnrnahACKcFRkyo2w=
From: Michael Walle <michael@walle.cc>
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] drm/etnaviv: add GC7000 r6202 support
Date: Tue, 15 Jun 2021 00:17:50 +0200
Message-Id: <20210614221752.1251-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam: Yes
X-Mailman-Approved-At: Tue, 15 Jun 2021 13:13:25 +0000
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
Cc: David Airlie <airlied@linux.ie>, Michael Walle <michael@walle.cc>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

This is the first step to bring GPU support to the NXP LS1028A SoC. It
features a Mali DP500, a Vivante GC7000 and has one DisplayPort output
which is driven by a Cadence MHDP controller and PHY.

This was briefly tested with glmark2, a patched mesa kmsro driver to
support the mali DP500/GC7000 duo an using
ETNA_MESA_DEBUG=no_supertile,no_ts.

Michael Walle (2):
  drm/etnaviv: add HWDB entry for GC7000 r6202
  drm/etnaviv: add clock gating workaround for GC7000 r6202

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  |  6 +++++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.20.1

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
