Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB05ABD58
	for <lists+etnaviv@lfdr.de>; Sat,  3 Sep 2022 08:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC9510E986;
	Sat,  3 Sep 2022 06:07:01 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC22310E986
 for <etnaviv@lists.freedesktop.org>; Sat,  3 Sep 2022 06:06:58 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id f24so3829653plr.1
 for <etnaviv@lists.freedesktop.org>; Fri, 02 Sep 2022 23:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=py5Y0Qaf4PxCG0tcE0IMumOn8gfqYfS1sNrqUe6Qubw=;
 b=Xq8zSPfLEU6xzfhSfzvaThWR+khiq/LaCdQEVJBYFxRsOd7JjYMwVkFisU/8H5uU7F
 nUiGkdCFO4ZGUGj61sMPG4eaeGAK/vhG4KAuzSJ4vrE3q0j2yw+JMzItB8U5/5YEHon2
 ghlxjfWLzyYOKWh5MX1I3uUA7mBZ4GwvOx6eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=py5Y0Qaf4PxCG0tcE0IMumOn8gfqYfS1sNrqUe6Qubw=;
 b=Cjil4WXFQBCdO2ZtgR+/V/l8xSUauyyolhrYWMmASngE2B1vHlPu6efNYLHDlheGSV
 wieAfvJ05KmRRyoXWtj+T2eEWrNU6urYVVESHd64pO+YCbYEzm7xq5Pl2noP/VnKn4Y5
 J9hosNZnRZCUo8ptImXys4Uas3GWqlAVXmn4AMeH0Th4WDVEKKDvjCY9yB1Hi8yYiBQw
 cPbtRQer0tVAkgujXzWbUJbgPasMWiChhuSlBGHCYnxmNW7Tvlg1+E/G2GwSQBpvBhmP
 apcadCo8mujY34W0jzMkl6klgM6/vagUwNToOciEpaXH+SRjEoZ3i7sQtkma443Sk/TP
 fbbQ==
X-Gm-Message-State: ACgBeo1GKL/P4+R4eV3Fu3oeAD9cqkRslEUG3/XzjDtIdrks0v8FEzL6
 FMBC7J3rEmbOv4/aefgnFSuiJg==
X-Google-Smtp-Source: AA6agR7/u/4EbZMJfQ06VEfBmYTGMFsMtuHoiMGb+/ZUcagUJB8L4821HZEMG+HDPmdtHUYWwq3xtQ==
X-Received: by 2002:a17:903:22c4:b0:175:41bc:9596 with SMTP id
 y4-20020a17090322c400b0017541bc9596mr16512413plg.112.1662185218128; 
 Fri, 02 Sep 2022 23:06:58 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
 by smtp.gmail.com with ESMTPSA id
 v28-20020aa799dc000000b00537ab89c66csm3048793pfi.143.2022.09.02.23.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 23:06:57 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] drm/etnaviv: GC300 fixes
Date: Fri,  2 Sep 2022 23:05:56 -0700
Message-Id: <20220903060558.55167-1-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Doug Brown <doug@schmorgal.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

This series contains a few special cases for supporting the GC300
properly. These were found in the drivers in the vivante_kernel_drivers
repository. These changes were tested on a PXA168 with GC300 revision
0x2201 (date 0x20080814, time 0x12051100), which already has an existing
special case in the driver to modify the revision to 0x1051.

I was a little unsure of the "correct" way to do the fixup to the power
register offsets. I implemented the change in gpu_write and gpu_read,
but if someone has a better idea I would be happy to do it differently.

Doug Brown (2):
  drm/etnaviv: add missing quirks for GC300
  drm/etnaviv: fix power register offset on GC300

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 +++++++++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 16 ++++++++++++++--
 2 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.25.1

