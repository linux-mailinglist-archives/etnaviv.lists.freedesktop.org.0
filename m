Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9654111CD
	for <lists+etnaviv@lfdr.de>; Mon, 20 Sep 2021 11:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D9B6E454;
	Mon, 20 Sep 2021 09:15:51 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459106E454
 for <etnaviv@lists.freedesktop.org>; Mon, 20 Sep 2021 09:15:51 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mSFOv-000073-BF; Mon, 20 Sep 2021 11:15:49 +0200
Message-ID: <026524f28316a83654d6b39f3afe1206bb087e55.camel@pengutronix.de>
Subject: Re: NULL pointer dereference in etnaviv_iommu_context_init (v5.4.105)
From: Lucas Stach <l.stach@pengutronix.de>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Date: Mon, 20 Sep 2021 11:15:48 +0200
In-Reply-To: <aa2b22fb-c4d1-3a89-2111-7513ab9f2fc1@kontron.de>
References: <aa2b22fb-c4d1-3a89-2111-7513ab9f2fc1@kontron.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Frieder,

Am Montag, dem 20.09.2021 um 10:58 +0200 schrieb Frieder Schrempf:
> Hello Lucas,
> 
> I have a report from a customer running kernel 5.4.105 on i.MX8MM with
> the stack trace below. Do you know something about this or can you give
> a guess?
> 
> I saw that there are fixes from you targeting MMU context handling that
> were merged recently, but aren't in the stable tree, yet. Could this be
> related?

I doubt that those are related. The fixes are for a context switch
issue, which triggers a use-after-free on the GPU side.

Your issue seems to happen much earlier, when constructing the context,
and happens on the CPU side. If I'm reading that trace right, the iommu
global pointer is NULL in that etnaviv_iommu_context_init() call. Now I
haven't really looked further on how this could happen, but I guess
that's the route to go for investigating the issues.

Regards,
Lucas

> 
> Thanks
> Frieder
> 
> [    5.172688] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000008
> [    5.172697] Mem abort info:
> [    5.172699]   ESR = 0x96000004
> [    5.172702]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    5.172704]   SET = 0, FnV = 0
> [    5.172706]   EA = 0, S1PTW = 0
> [    5.172707] Data abort info:
> [    5.172709]   ISV = 0, ISS = 0x00000004
> [    5.172710]   CM = 0, WnR = 0
> [    5.172714] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000b7e01000
> [    5.172716] [0000000000000008] pgd=0000000000000000
> [    5.172721] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    5.178295] Modules linked in: powersupply(O) nsam(O) egalax_i2c(O)
> GobiSerial(O) GobiNet(O)
> [    5.186762] CPU: 2 PID: 313 Comm: Xorg Tainted: G           O
> 5.4.105-gnt #1
> [    5.194265] Hardware name: ## redacted ##
> [    5.194269] pstate: 40000005 (nZcv daif -PAN -UAO)
> [    5.194281] pc : etnaviv_iommu_context_init+0x18/0xc8
> [    5.194291] lr : etnaviv_open+0x50/0xe8
> [    5.213198] sp : ffff800011b43a00
> [    5.213204] x29: ffff800011b43a00 x28: 0000000000000000
> [    5.221850] x27: 0000000000000002 x26: ffff800011b43d10
> [    5.221855] x25: 0000000000000000 x24: ffff00007a1c3200
> [    5.221858] x23: 000000007c2e0100 x22: ffff000077e08000
> [    5.221861] x21: ffff00007c2e0400 x20: 0000000000000000
> [    5.221864] x19: ffff00007c2e0380 x18: 0000000000000000
> [    5.221867] x17: 0000000000000000 x16: 0000000000000000
> [    5.221870] x15: 0000000000000000 x14: 0000000000000000
> [    5.221873] x13: ffff000077e08000 x12: 0000000000000000
> [    5.221876] x11: 0000000000000001 x10: 0000000000000040
> [    5.221878] x9 : 0000000000000000 x8 : ffff00007a317400
> [    5.221881] x7 : 0000000000000000 x6 : 000000000000003f
> [    5.221884] x5 : 0000000000000040 x4 : 0000000000000000
> [    5.221887] x3 : 0000000000000004 x2 : 0000000000000000
> [    5.221890] x1 : ffff00007c2e0400 x0 : 0000000000000000
> [    5.221894] Call trace:
> [    5.221906]  etnaviv_iommu_context_init+0x18/0xc8
> [    5.221911]  etnaviv_open+0x50/0xe8
> [    5.221917]  drm_file_alloc+0x11c/0x1e0
> [    5.221920]  drm_open+0x94/0x198
> [    5.221924]  drm_stub_open+0xb4/0xf8
> [    5.221930]  chrdev_open+0xa0/0x198
> [    5.221934]  do_dentry_open+0x110/0x3b0
> [    5.221936]  vfs_open+0x28/0x30
> [    5.221940]  path_openat+0x4b8/0x1280
> [    5.221943]  do_filp_open+0x74/0xf8
> [    5.221946]  do_sys_open+0x168/0x218
> [    5.221949]  __arm64_sys_openat+0x20/0x28
> [    5.221955]  el0_svc_common.constprop.0+0x68/0x160
> [    5.221958]  el0_svc_handler+0x20/0x80
> [    5.221962]  el0_svc+0x8/0x204
> [    5.221970] Code: a90153f3 aa0003f4 a9025bf5 aa0103f5 (b9400801)
> [    5.221975] ---[ end trace 0d8e2dcf004ee953 ]---


