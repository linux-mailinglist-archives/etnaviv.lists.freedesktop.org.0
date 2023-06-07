Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77CC726029
	for <lists+etnaviv@lfdr.de>; Wed,  7 Jun 2023 14:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9180F10E4EB;
	Wed,  7 Jun 2023 12:59:35 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A5710E4EB
 for <etnaviv@lists.freedesktop.org>; Wed,  7 Jun 2023 12:59:34 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q6slA-0003gk-No; Wed, 07 Jun 2023 14:59:32 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: slow down FE idle polling
Date: Wed,  7 Jun 2023 14:59:32 +0200
Message-Id: <20230607125932.3518547-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Currently the FE is spinning way too fast when polling for new work in
the FE idleloop. As each poll fetches 16 bytes from memory, a GPU running
at 1GHz with the current setting of 200 wait cycle between fetches causes
80 MB/s of memory traffic just to check for new work when the GPU is
otherwise idle, which is more FE traffic than in some GPU loaded cases.

Significantly increase the number of wait cycles to slow down the poll
interval to ~30µs, limiting the FE idle memory traffic to 512 KB/s, while
providing a max latency which should not hurt most use-cases. The FE WAIT
command seems to have some unknown discrete steps in the wait cycles so
we may over/undershoot the target a bit, but that should be harmless.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 11 ++++++-----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c    |  7 +++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h    |  1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index cf741c5c82d2..384df1659be6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -53,11 +53,12 @@ static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
 	OUT(buffer, VIV_FE_END_HEADER_OP_END);
 }
 
-static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer)
+static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
+			    unsigned int waitcycles)
 {
 	buffer->user_size = ALIGN(buffer->user_size, 8);
 
-	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | 200);
+	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
 }
 
 static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
@@ -168,7 +169,7 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
 	/* initialize buffer */
 	buffer->user_size = 0;
 
-	CMD_WAIT(buffer);
+	CMD_WAIT(buffer, gpu->fe_waitcycles);
 	CMD_LINK(buffer, 2,
 		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
 		 + buffer->user_size - 4);
@@ -320,7 +321,7 @@ void etnaviv_sync_point_queue(struct etnaviv_gpu *gpu, unsigned int event)
 	CMD_END(buffer);
 
 	/* Append waitlink */
-	CMD_WAIT(buffer);
+	CMD_WAIT(buffer, gpu->fe_waitcycles);
 	CMD_LINK(buffer, 2,
 		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
 		 + buffer->user_size - 4);
@@ -503,7 +504,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 
 	CMD_LOAD_STATE(buffer, VIVS_GL_EVENT, VIVS_GL_EVENT_EVENT_ID(event) |
 		       VIVS_GL_EVENT_FROM_PE);
-	CMD_WAIT(buffer);
+	CMD_WAIT(buffer, gpu->fe_waitcycles);
 	CMD_LINK(buffer, 2,
 		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
 		 + buffer->user_size - 4);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 41aab1aa330b..8c20dff32240 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -493,6 +493,13 @@ static void etnaviv_gpu_update_clock(struct etnaviv_gpu *gpu)
 		clock |= VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
 		etnaviv_gpu_load_clock(gpu, clock);
 	}
+
+	/*
+	 * Choose number of wait cycles to target a ~30us (1/32768) max latency
+	 * until new work is picked up by the FE when it polls in the idle loop.
+	 */
+	gpu->fe_waitcycles = min(gpu->base_rate_core >> (15 - gpu->freq_scale),
+				 0xffffUL);
 }
 
 static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 98c6f9c320fc..e1e1de59c38d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -150,6 +150,7 @@ struct etnaviv_gpu {
 	struct clk *clk_shader;
 
 	unsigned int freq_scale;
+	unsigned int fe_waitcycles;
 	unsigned long base_rate_core;
 	unsigned long base_rate_shader;
 };
-- 
2.39.2

