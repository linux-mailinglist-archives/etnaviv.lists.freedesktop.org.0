Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C237BFD2D
	for <lists+etnaviv@lfdr.de>; Tue, 10 Oct 2023 15:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0967A10E366;
	Tue, 10 Oct 2023 13:20:35 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-x564.google.com (mail-ed1-x564.google.com
 [IPv6:2a00:1450:4864:20::564])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C1F10E366
 for <etnaviv@lists.freedesktop.org>; Tue, 10 Oct 2023 13:20:33 +0000 (UTC)
Received: by mail-ed1-x564.google.com with SMTP id
 4fb4d7f45d1cf-5334d78c5f6so9750164a12.2
 for <etnaviv@lists.freedesktop.org>; Tue, 10 Oct 2023 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flowbird.group; s=google; t=1696944031; x=1697548831;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=klWQQLel+kfzddvQV5jdp3oXAW1qFwzXzukYzZQ/wN8=;
 b=YbdmJ1OYTppc8cpT0qQUcY0efTWqV5SZYsnr5TK7qaEuTe7lMLXpjsBJ1Tv83e/yNe
 cSvDVjaPbpz0D5CftW1HiUgXcAZouuEmH0XG+uud8gECiL35awyQ+GQJbJxh7G60wT7Z
 0jW4Y1LmcgG/MCrbaIdU132DxWTr2dDk+Cba8ShK2vFSxuncE1JZgDD+CbiqMDUdeTlp
 hxBtaW4Pu04rl/bG+nNGI8baVqDz/wTdGe7tM6Hnk/xHMnbOjxMmG93YGXdktL/mrqKs
 aH/DUluPH1/3kR5ZacRRv/15TnV8VhUm3JvO6VWpB2hUHQi9RbtJRAkVHwh/gI4iAQSi
 AvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696944031; x=1697548831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=klWQQLel+kfzddvQV5jdp3oXAW1qFwzXzukYzZQ/wN8=;
 b=KZmMQK4U68DtN6CLJNNgxA3zKpa+kpSZ8tjnHyt9rGyGfEXVMq+k7bOvWtL5yJZMeH
 RBjQI/XEjM+cUXytMSGyt/tlGL8Vec1PjJxrE1SJZ3k6oZzst2N51ywSiNPODkNBiNil
 yZ5PEg5JSESy9MKL9PCd2qJ4sVfTqrkd4oqHEy0zEUQeTh0fQlrtYayJaN+AZrJRXWf4
 3cwqmA6xA/nGeHtCjW3g+7GlQYNrjabWUtPV9kxZtKBgy32eJ8h8vB6/BD/3UdTHDvlE
 EGjZa57dnzy2wWJBK6oXDUeskDpFiffusex81QIojSqyou8XH69fODFDV3W+rXH+9Cva
 /ryQ==
X-Gm-Message-State: AOJu0Yzc7XNfXH3KoRk2XrbalCM2fcQQ4rMQ6DZ0keAo+ffc67rTAciE
 42R+VwOJBBk5Jv2OSRYO4GhToNJbDjolrBH+/O0i2YnlmThl
X-Google-Smtp-Source: AGHT+IEzZ6e4B5MrWtE89wlUax/GwV2zuK4/ekYIvKKPs1FPSFjSbfsj3NqbJjVs3Py5/q/djmUIZZ1PUy/v
X-Received: by 2002:a50:ee87:0:b0:514:9ab4:3524 with SMTP id
 f7-20020a50ee87000000b005149ab43524mr16801660edr.7.1696944031353; 
 Tue, 10 Oct 2023 06:20:31 -0700 (PDT)
Received: from mta1.parkeon.com ([185.149.63.251])
 by smtp-relay.gmail.com with ESMTPS id
 f28-20020a50a6dc000000b00533c7e90bc5sm2045253edc.34.2023.10.10.06.20.30
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 10 Oct 2023 06:20:31 -0700 (PDT)
X-Relaying-Domain: flowbird.group
Received: from [10.32.51.167] (port=49644
 helo=FR-BES-DKT15486.dynamic.besancon.parkeon.com)
 by mta1.parkeon.com with esmtp (Exim 4.71)
 (envelope-from <martin.fuzzey@flowbird.group>)
 id 1qqChF-0003TE-DQ; Tue, 10 Oct 2023 15:22:49 +0200
From: Martin Fuzzey <martin.fuzzey@flowbird.group>
To: stable@vger.kernel.org
Subject: [PATCH 5.4] drm: etvnaviv: fix bad backport leading to warning
Date: Tue, 10 Oct 2023 15:19:28 +0200
Message-Id: <20231010132030.1392238-1-martin.fuzzey@flowbird.group>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 etnaviv@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

When updating from 5.4.219 -> 5.4.256 I started getting a runtime warning:

[   58.229857] ------------[ cut here ]------------
[   58.234599] WARNING: CPU: 1 PID: 565 at drivers/gpu/drm/drm_gem.c:1020 drm_gem_object_put+0x90/0x98
[   58.249935] Modules linked in: qmi_wwan cdc_wdm option usb_wwan smsc95xx rsi_usb rsi_91x btrsi ci_hdrc_imx ci_hdrc
[   58.260499] ueventd: modprobe usb:v2F8Fp7FFFd0200dc00dsc00dp00icFEisc01ip02in00 done
[   58.288877] CPU: 1 PID: 565 Comm: android.display Not tainted 5.4.256pkn-5.4-bsp-snapshot-svn-7423 #2195
[   58.288883] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   58.288888] Backtrace:
[   58.288912] [<c010e784>] (dump_backtrace) from [<c010eaa4>] (show_stack+0x20/0x24)
[   58.288920]  r7:00000000 r6:60010013 r5:00000000 r4:c14cd224
[   58.328337] [<c010ea84>] (show_stack) from [<c0cf9ca4>] (dump_stack+0xe8/0x120)
[   58.335661] [<c0cf9bbc>] (dump_stack) from [<c012efd0>] (__warn+0xd4/0xe8)
[   58.342542]  r10:eda54000 r9:c06ca53c r8:000003fc r7:00000009 r6:c111ed54 r5:00000000
[   58.350374]  r4:00000000 r3:76cf564a
[   58.353957] [<c012eefc>] (__warn) from [<c012f094>] (warn_slowpath_fmt+0xb0/0xc0)
[   58.361445]  r9:00000009 r8:c06ca53c r7:000003fc r6:c111ed54 r5:c1406048 r4:00000000
[   58.369198] [<c012efe8>] (warn_slowpath_fmt) from [<c06ca53c>] (drm_gem_object_put+0x90/0x98)
[   58.377728]  r9:edda7e40 r8:edd39360 r7:ad16e000 r6:edda7eb0 r5:00000000 r4:edaa3200
[   58.385524] [<c06ca4ac>] (drm_gem_object_put) from [<bf0125a8>] (etnaviv_gem_prime_mmap_obj+0x34/0x3c [etnaviv])
[   58.395704]  r5:00000000 r4:edaa3200
[   58.399334] [<bf012574>] (etnaviv_gem_prime_mmap_obj [etnaviv]) from [<bf0143a0>] (etnaviv_gem_mmap+0x3c/0x60 [etnaviv])
[   58.410205]  r5:edd39360 r4:00000000
[   58.413816] [<bf014364>] (etnaviv_gem_mmap [etnaviv]) from [<c02c5e08>] (mmap_region+0x37c/0x67c)
[   58.422689]  r5:ad16d000 r4:edda7eb8
[   58.426272] [<c02c5a8c>] (mmap_region) from [<c02c6528>] (do_mmap+0x420/0x544)
[   58.433500]  r10:000000fb r9:000fffff r8:ffffffff r7:00000001 r6:00000003 r5:00000001
[   58.441330]  r4:00001000
[   58.443876] [<c02c6108>] (do_mmap) from [<c02a5b2c>] (vm_mmap_pgoff+0xd0/0x100)
[   58.451190]  r10:eda54040 r9:00001000 r8:00000000 r7:00000000 r6:00000003 r5:c1406048
[   58.459020]  r4:edb8ff24
[   58.461561] [<c02a5a5c>] (vm_mmap_pgoff) from [<c02c3ac8>] (ksys_mmap_pgoff+0xdc/0x10c)
[   58.469570]  r10:000000c0 r9:edb8e000 r8:ed650b40 r7:00000003 r6:00001000 r5:00000000
[   58.477400]  r4:00000001
[   58.479941] [<c02c39ec>] (ksys_mmap_pgoff) from [<c02c3b24>] (sys_mmap_pgoff+0x2c/0x34)
[   58.487949]  r8:c0101224 r7:000000c0 r6:951ece38 r5:00010001 r4:00000065
[   58.494658] [<c02c3af8>] (sys_mmap_pgoff) from [<c0101000>] (ret_fast_syscall+0x0/0x28)

It looks like this was a backporting error for the upstream patch
963b2e8c428f "drm/etnaviv: fix reference leak when mmaping imported buffer"

In the 5.4 kernel there are 2 variants of the object put function:
	drm_gem_object_put() [which requires lock to be held]
	drm_gem_object_put_unlocked() [which requires lock to be NOT held]

In later kernels [5.14+] this has gone and there just drm_gem_object_put()
which requires lock to be NOT held.

So the memory leak pach, which added a call to drm_gem_object_put() was correct
on newer kernels but wrong on 5.4 and earlier ones.

So switch back to using the _unlocked variant for old kernels.
This should only be applied to the 5.4, 4.19 and 4.14 longterm branches;
mainline and more recent longterms already have the correct fix.

Signed-off-by: Martin Fuzzey <martin.fuzzey@flowbird.group>
Fixes: 0c6df5364798 "drm/etnaviv: fix reference leak when mmaping imported buffer" [5.4.y]
Fixes: 0838cb217a52 "drm/etnaviv: fix reference leak when mmaping imported buffer" [4.19.y]
Fixes: 1c9544fbc979 "drm/etnaviv: fix reference leak when mmaping imported buffer" [4.14.y]

---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index fe7817e4c0d1..4400f578685a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -98,7 +98,7 @@ static int etnaviv_gem_prime_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 	ret = dma_buf_mmap(etnaviv_obj->base.dma_buf, vma, 0);
 	if (!ret) {
 		/* Drop the reference acquired by drm_gem_mmap_obj(). */
-		drm_gem_object_put(&etnaviv_obj->base);
+		drm_gem_object_put_unlocked(&etnaviv_obj->base);
 	}

 	return ret;
--
2.25.1

