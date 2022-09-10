Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B455B48CD
	for <lists+etnaviv@lfdr.de>; Sat, 10 Sep 2022 22:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BD910E2C1;
	Sat, 10 Sep 2022 20:30:14 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8484910E2C3
 for <etnaviv@lists.freedesktop.org>; Sat, 10 Sep 2022 20:30:12 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id t3so4925895ply.2
 for <etnaviv@lists.freedesktop.org>; Sat, 10 Sep 2022 13:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=F+PwtkdeSluSTY9EZaCKgnM6E4x9lodGD0vhUiYvWOg=;
 b=Z6AqW7wqSkqOlBMi6WVHqpaMqrXi19V7ENPXpbjw4m/wlc9SGA32OSpaOFMP1h1e7o
 J341vsdOgOBnDdpHXxMKAYxL+HwP/rAPkZivTjNcj7zzeP585ESqT4RdONQBeQCKScxB
 CLDfWOq6oEi/Ekhgf33vBPDmWfPaHCmZpl5tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=F+PwtkdeSluSTY9EZaCKgnM6E4x9lodGD0vhUiYvWOg=;
 b=PuagMxXROeOwtp/WdaYtw9KZlZ/BFKA0qbUSNyX0hNak9Y7k7gJJERVRXGp48cmwaw
 smlA9ATjMZqIWqCRw6k+Eo0mosZQ18ju8ickwQ+1jhkw7kOdglMpa/hRaOcltNIEd0Xj
 XWJFuw7R9F8p2VNP2OxntW+HHpPCB7wJKpe5Y12Pp7t9AWxjd/VzM7iJuwdrbSGBR/+E
 LkdMUDOc1+FiZMwrTl04T7DoH2wYOUu/q0M1qu6rYcxo9x7fNKGC6RbJdvQqFMYvT/d7
 DjDzlAj+4GCWjHmtIU/6Ny3ofypIpjM3Q3+DNP5ZqYHvRRpcLP/myV0h7i++cB7SGLp8
 Pm/A==
X-Gm-Message-State: ACgBeo1bgvkTyg9Aamk+YMZ9KAuPEXN0I3k8j/8VqtPWtI3dmuRDHoOl
 MC2DCWAe6BUq5sZUiWR4i16PJQ==
X-Google-Smtp-Source: AA6agR7zrQYsijlAsLLZyZnetCbm94pLqeQQOGa+awwJdJX8RgYEXxTqY2mflqcea32CUd4hzWPQqA==
X-Received: by 2002:a17:902:eb82:b0:178:2166:fe75 with SMTP id
 q2-20020a170902eb8200b001782166fe75mr2747156plg.31.1662841811459; 
 Sat, 10 Sep 2022 13:30:11 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.124])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a655382000000b00412a708f38asm2641313pgq.35.2022.09.10.13.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 13:30:10 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 0/2] drm/etnaviv: GC300 fixes
Date: Sat, 10 Sep 2022 13:29:37 -0700
Message-Id: <20220910202939.31010-1-doug@schmorgal.com>
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

Changes since v2:
- Dump canonical address in etnaviv_core_dump_registers
- Misc fixes from review by Lucas

Changes from v1->v2:
- Move power register address remapping to new gpu_read_power and
  gpu_write_power accessors instead of modifying gpu_read and gpu_write.

Doug Brown (2):
  drm/etnaviv: add missing quirks for GC300
  drm/etnaviv: fix power register offset on GC300

 drivers/gpu/drm/etnaviv/etnaviv_dump.c |  7 +++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 31 ++++++++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 21 +++++++++++++++++
 3 files changed, 46 insertions(+), 13 deletions(-)

-- 
2.25.1

