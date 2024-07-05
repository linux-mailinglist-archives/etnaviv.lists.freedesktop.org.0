Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E33B928E03
	for <lists+etnaviv@lfdr.de>; Fri,  5 Jul 2024 22:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E765E10EC23;
	Fri,  5 Jul 2024 20:00:19 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2825810E21E
 for <etnaviv@lists.freedesktop.org>; Fri,  5 Jul 2024 20:00:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sPp6M-0003VJ-Kt; Fri, 05 Jul 2024 22:00:14 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sPp6L-007Ocg-SP; Fri, 05 Jul 2024 22:00:13 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH v2 1/5] drm/etnaviv: hold GPU lock across perfmon sampling
Date: Fri,  5 Jul 2024 22:00:09 +0200
Message-Id: <20240705200013.2656275-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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

The perfmon sampling mutates shared GPU state (e.g. VIVS_HI_CLOCK_CONTROL
to select the pipe for the perf counter reads). To avoid clashing with
other functions mutating the same state (e.g. etnaviv_gpu_update_clock)
the perfmon sampling needs to hold the GPU lock.

Fixes: 68dc0b295dcb ("drm/etnaviv: use 'sync points' for performance monitor requests")
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2: new patch
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7c7f97793ddd..2bd14d3501e2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1330,6 +1330,8 @@ static void sync_point_perfmon_sample_pre(struct etnaviv_gpu *gpu,
 {
 	u32 val;
 
+	mutex_lock(&gpu->lock);
+
 	/* disable clock gating */
 	val = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
 	val &= ~VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
@@ -1341,6 +1343,8 @@ static void sync_point_perfmon_sample_pre(struct etnaviv_gpu *gpu,
 	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
 
 	sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_PRE);
+
+	mutex_unlock(&gpu->lock);
 }
 
 static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
@@ -1350,13 +1354,9 @@ static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
 	unsigned int i;
 	u32 val;
 
-	sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_POST);
-
-	for (i = 0; i < submit->nr_pmrs; i++) {
-		const struct etnaviv_perfmon_request *pmr = submit->pmrs + i;
+	mutex_lock(&gpu->lock);
 
-		*pmr->bo_vma = pmr->sequence;
-	}
+	sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_POST);
 
 	/* disable debug register */
 	val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
@@ -1367,6 +1367,14 @@ static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
 	val = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
 	val |= VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
 	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, val);
+
+	mutex_unlock(&gpu->lock);
+
+	for (i = 0; i < submit->nr_pmrs; i++) {
+		const struct etnaviv_perfmon_request *pmr = submit->pmrs + i;
+
+		*pmr->bo_vma = pmr->sequence;
+	}
 }
 
 
-- 
2.39.2

