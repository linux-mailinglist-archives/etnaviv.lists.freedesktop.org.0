Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DC72E87A5
	for <lists+etnaviv@lfdr.de>; Sat,  2 Jan 2021 15:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CBA895C8;
	Sat,  2 Jan 2021 14:50:04 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72696E876
 for <etnaviv@lists.freedesktop.org>; Wed, 23 Dec 2020 19:51:17 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1ksAAG-0001MY-7X
 for etnaviv@lists.freedesktop.org; Wed, 23 Dec 2020 20:51:16 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 2047C5B2ACC
 for <etnaviv@lists.freedesktop.org>; Wed, 23 Dec 2020 19:51:15 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id 557085B2AC8;
 Wed, 23 Dec 2020 19:51:14 +0000 (UTC)
Received: from blackshift.org (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 9d05f08d;
 Wed, 23 Dec 2020 19:51:13 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: dump: fix sparse warnings
Date: Wed, 23 Dec 2020 20:51:10 +0100
Message-Id: <20201223195110.2264558-1-mkl@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
X-Mailman-Approved-At: Sat, 02 Jan 2021 14:50:03 +0000
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
 Lucas Stach <l.stach@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
 etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

This patch fixes the following sparse warnings, by adding the missing endianess
conversion functions.

| etnaviv/etnaviv_dump.c:78:26: warning: restricted __le32 degrades to integer
| etnaviv/etnaviv_dump.c:88:26: warning: incorrect type in assignment (different base types)
| etnaviv/etnaviv_dump.c:88:26:    expected restricted __le32 [usertype] reg
| etnaviv/etnaviv_dump.c:88:26:    got unsigned short const
| etnaviv/etnaviv_dump.c:89:28: warning: incorrect type in assignment (different base types)
| etnaviv/etnaviv_dump.c:89:28:    expected restricted __le32 [usertype] value
| etnaviv/etnaviv_dump.c:89:28:    got unsigned int
| etnaviv/etnaviv_dump.c:210:43: warning: incorrect type in assignment (different base types)
| etnaviv/etnaviv_dump.c:210:43:    expected restricted __le32
| etnaviv/etnaviv_dump.c:210:43:    got long

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_dump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
index 706af0304ca4..f418e0b75772 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
@@ -75,7 +75,7 @@ static void etnaviv_core_dump_header(struct core_dump_iterator *iter,
 	hdr->file_size = cpu_to_le32(data_end - iter->data);
 
 	iter->hdr++;
-	iter->data += hdr->file_size;
+	iter->data += le32_to_cpu(hdr->file_size);
 }
 
 static void etnaviv_core_dump_registers(struct core_dump_iterator *iter,
@@ -85,8 +85,8 @@ static void etnaviv_core_dump_registers(struct core_dump_iterator *iter,
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(etnaviv_dump_registers); i++, reg++) {
-		reg->reg = etnaviv_dump_registers[i];
-		reg->value = gpu_read(gpu, etnaviv_dump_registers[i]);
+		reg->reg = cpu_to_le32(etnaviv_dump_registers[i]);
+		reg->value = cpu_to_le32(gpu_read(gpu, etnaviv_dump_registers[i]));
 	}
 
 	etnaviv_core_dump_header(iter, ETDUMP_BUF_REG, reg);
@@ -207,7 +207,7 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
 		if (!IS_ERR(pages)) {
 			int j;
 
-			iter.hdr->data[0] = bomap - bomap_start;
+			iter.hdr->data[0] = cpu_to_le32((bomap - bomap_start));
 
 			for (j = 0; j < obj->base.size >> PAGE_SHIFT; j++)
 				*bomap++ = cpu_to_le64(page_to_phys(*pages++));
-- 
2.29.2


_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
