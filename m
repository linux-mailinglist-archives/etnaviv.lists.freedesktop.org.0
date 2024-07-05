Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C23928E02
	for <lists+etnaviv@lfdr.de>; Fri,  5 Jul 2024 22:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C2B10E2E1;
	Fri,  5 Jul 2024 20:00:18 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4F610E2E1
 for <etnaviv@lists.freedesktop.org>; Fri,  5 Jul 2024 20:00:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sPp6M-0003VL-Kr; Fri, 05 Jul 2024 22:00:14 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sPp6L-007Ocg-VB; Fri, 05 Jul 2024 22:00:14 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH v2 2/5] drm/etnaviv: assert GPU lock held in perfmon
 pipe_*_read functions
Date: Fri,  5 Jul 2024 22:00:10 +0200
Message-Id: <20240705200013.2656275-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705200013.2656275-1-l.stach@pengutronix.de>
References: <20240705200013.2656275-1-l.stach@pengutronix.de>
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

The perf counter read functions don't just read registers, but they
also mutate state to direct the reads towards the correct pipe and
engine. Assert that the GPU mutex is held at this point, so that
those state changes don't interfere with others.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2: new patch
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index dc9dea664a28..d53a5c293373 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -62,6 +62,8 @@ static u32 pipe_perf_reg_read(struct etnaviv_gpu *gpu,
 	u32 value = 0;
 	unsigned i;
 
+	lockdep_assert_held(&gpu->lock);
+
 	for (i = 0; i < gpu->identity.pixel_pipes; i++) {
 		pipe_select(gpu, clock, i);
 		value += perf_reg_read(gpu, domain, signal);
@@ -81,6 +83,8 @@ static u32 pipe_reg_read(struct etnaviv_gpu *gpu,
 	u32 value = 0;
 	unsigned i;
 
+	lockdep_assert_held(&gpu->lock);
+
 	for (i = 0; i < gpu->identity.pixel_pipes; i++) {
 		pipe_select(gpu, clock, i);
 		value += gpu_read(gpu, signal->data);
-- 
2.39.2

