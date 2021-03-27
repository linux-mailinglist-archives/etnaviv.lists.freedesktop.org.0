Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B0934B7AB
	for <lists+etnaviv@lfdr.de>; Sat, 27 Mar 2021 15:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFC16E153;
	Sat, 27 Mar 2021 14:30:15 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7866E153
 for <etnaviv@lists.freedesktop.org>; Sat, 27 Mar 2021 14:30:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88A07619F2;
 Sat, 27 Mar 2021 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616855415;
 bh=rcp5iR+iMkhFgPlT11tNCbmZxf5nai+dbjIBEd30u60=;
 h=Subject:To:Cc:From:Date:From;
 b=XjYpn0EYW8k42GQTGBCycrT5lph+oPV0J89Cyru/n8yn0qW02VDyQAPGE01oPWSef
 18Ny2um9R+KOPZbW64x4Htr/zkd/uDvShv323qtyIr6jf4fZQiFYMrrSiMsabdEZYH
 kC8JNKY0mrka4UAmLGU2LuLAe+bXV7UT+g4kTBGM=
Subject: Patch "drm/etnaviv: Use FOLL_FORCE for userptr" has been added to the
 5.11-stable tree
To: christian.gmeiner@gmail.com, daniel.vetter@ffwll.ch,
 daniel.vetter@intel.com, etnaviv@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jhubbard@nvidia.com, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk
From: <gregkh@linuxfoundation.org>
Date: Sat, 27 Mar 2021 15:28:01 +0100
Message-ID: <161685528124569@kroah.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/etnaviv: Use FOLL_FORCE for userptr

to the 5.11-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-etnaviv-use-foll_force-for-userptr.patch
and it can be found in the queue-5.11 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From cd5297b0855f17c8b4e3ef1d20c6a3656209c7b3 Mon Sep 17 00:00:00 2001
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 1 Mar 2021 10:52:53 +0100
Subject: drm/etnaviv: Use FOLL_FORCE for userptr

From: Daniel Vetter <daniel.vetter@ffwll.ch>

commit cd5297b0855f17c8b4e3ef1d20c6a3656209c7b3 upstream.

Nothing checks userptr.ro except this call to pup_fast, which means
there's nothing actually preventing userspace from writing to this.
Which means you can just read-only mmap any file you want, userptr it
and then write to it with the gpu. Not good.

The right way to handle this is FOLL_WRITE | FOLL_FORCE, which will
break any COW mappings and update tracking for MAY_WRITE mappings so
there's no exploit and the vm isn't confused about what's going on.
For any legit use case there's no difference from what userspace can
observe and do.

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Cc: stable@vger.kernel.org
Cc: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
Link: https://patchwork.freedesktop.org/patch/msgid/20210301095254.1946084-1-daniel.vetter@ffwll.ch
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -689,7 +689,7 @@ static int etnaviv_gem_userptr_get_pages
 		struct page **pages = pvec + pinned;
 
 		ret = pin_user_pages_fast(ptr, num_pages,
-					  !userptr->ro ? FOLL_WRITE : 0, pages);
+					  FOLL_WRITE | FOLL_FORCE, pages);
 		if (ret < 0) {
 			unpin_user_pages(pvec, pinned);
 			kvfree(pvec);


Patches currently in stable-queue which might be from daniel.vetter@ffwll.ch are

queue-5.11/drm-etnaviv-use-foll_force-for-userptr.patch
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
