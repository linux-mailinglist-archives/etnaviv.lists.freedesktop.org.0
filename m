Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D4E2CAD7E
	for <lists+etnaviv@lfdr.de>; Tue,  1 Dec 2020 21:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362326E8D0;
	Tue,  1 Dec 2020 20:38:42 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485F36E8D0;
 Tue,  1 Dec 2020 20:38:41 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id EC822DF932;
 Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4CNo_ZZzL4rs; Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 5F46EE0711;
 Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xlA33XeSl3Kl; Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 2A0A4E0715;
 Tue,  1 Dec 2020 20:35:43 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 2/3] tests/etnaviv_2d_test: pick the 2D core
Date: Tue,  1 Dec 2020 21:38:28 +0100
Message-Id: <20201201203829.1735559-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201203829.1735559-1-lkundrak@v3.sk>
References: <20201201203829.1735559-1-lkundrak@v3.sk>
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
Cc: Lubomir Rintel <lkundrak@v3.sk>, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Run the test on a core capable of 2D rendering instead of hardcoding to
core zero.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 tests/etnaviv/etnaviv_2d_test.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/tests/etnaviv/etnaviv_2d_test.c b/tests/etnaviv/etnaviv_2d_test.c
index eb9dfa59..a75a4a89 100644
--- a/tests/etnaviv/etnaviv_2d_test.c
+++ b/tests/etnaviv/etnaviv_2d_test.c
@@ -161,6 +161,8 @@ int main(int argc, char *argv[])
 
 	drmVersionPtr version;
 	int fd, ret = 0;
+	uint64_t feat;
+	int core = 0;
 
 	if (argc < 2) {
 		fprintf(stderr, "Usage: %s /dev/dri/<device>\n", argv[0]);
@@ -190,13 +192,28 @@ int main(int argc, char *argv[])
 		goto out;
 	}
 
-	/* TODO: we assume that core 0 is a 2D capable one */
-	gpu = etna_gpu_new(dev, 0);
-	if (!gpu) {
-		perror("etna_gpu_new");
-		ret = 3;
-		goto out_device;
-	}
+	do {
+		gpu = etna_gpu_new(dev, core);
+		if (!gpu) {
+			perror("etna_gpu_new");
+			ret = 3;
+			goto out_device;
+		}
+
+		if (etna_gpu_get_param(gpu, ETNA_GPU_FEATURES_0, &feat)) {
+			perror("etna_gpu_get_param");
+			ret = 4;
+			goto out_device;
+		}
+
+		if ((feat & (1 << 9)) == 0) {
+			/* GPU not 2D capable. */
+			etna_gpu_del(gpu);
+			gpu = NULL;
+		}
+
+		core++;
+	} while (!gpu);
 
 	pipe = etna_pipe_new(gpu, ETNA_PIPE_2D);
 	if (!pipe) {
-- 
2.28.0

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
