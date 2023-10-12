Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F06377C752A
	for <lists+etnaviv@lfdr.de>; Thu, 12 Oct 2023 19:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBCF10E536;
	Thu, 12 Oct 2023 17:53:18 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225A910E542
 for <etnaviv@lists.freedesktop.org>; Thu, 12 Oct 2023 17:53:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 900E061ED3;
 Thu, 12 Oct 2023 17:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E70C433C8;
 Thu, 12 Oct 2023 17:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1697133195;
 bh=BkfNbGy/pNYZ3CxiWDiWuEC3UVTeRXABZWE3Bel7wD4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=u0j9F8oxZK4OkdvK/xpc25MVq9ldj+qxlc7ROiOuB/A0aD6vHt/Gr1UFHAiu3cVPn
 u3D3px9SmuJHhYksqVcoCptcTqgDqq3GGGHnkD0S748cjbBMgzUqEVOuPXd7pguKkz
 VzVJRHIhyWeBRwmd6fjMqY8sEtzh03CAuHIpuVxA=
Subject: Patch "drm: etvnaviv: fix bad backport leading to warning" has been
 added to the 5.4-stable tree
To: etnaviv@lists.freedesktop.org, gregkh@linuxfoundation.org,
 l.stach@pengutronix.de, martin.fuzzey@flowbird.group
From: <gregkh@linuxfoundation.org>
Date: Thu, 12 Oct 2023 19:53:12 +0200
In-Reply-To: <20231010132030.1392238-1-martin.fuzzey@flowbird.group>
Message-ID: <2023101211-iciness-cattishly-7b29@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
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
Cc: stable-commits@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm: etvnaviv: fix bad backport leading to warning

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-etvnaviv-fix-bad-backport-leading-to-warning.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From martin.fuzzey@flowbird.group  Thu Oct 12 19:51:38 2023
From: Martin Fuzzey <martin.fuzzey@flowbird.group>
Date: Tue, 10 Oct 2023 15:19:28 +0200
Subject: drm: etvnaviv: fix bad backport leading to warning
To: stable@vger.kernel.org
Cc: Lucas Stach <l.stach@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, etnaviv@lists.freedesktop.org
Message-ID: <20231010132030.1392238-1-martin.fuzzey@flowbird.group>

From: Martin Fuzzey <martin.fuzzey@flowbird.group>

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
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -98,7 +98,7 @@ static int etnaviv_gem_prime_mmap_obj(st
 	ret = dma_buf_mmap(etnaviv_obj->base.dma_buf, vma, 0);
 	if (!ret) {
 		/* Drop the reference acquired by drm_gem_mmap_obj(). */
-		drm_gem_object_put(&etnaviv_obj->base);
+		drm_gem_object_put_unlocked(&etnaviv_obj->base);
 	}
 
 	return ret;


Patches currently in stable-queue which might be from martin.fuzzey@flowbird.group are

queue-5.4/drm-etvnaviv-fix-bad-backport-leading-to-warning.patch
