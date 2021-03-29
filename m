Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D17734C807
	for <lists+etnaviv@lfdr.de>; Mon, 29 Mar 2021 10:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4F46E1F7;
	Mon, 29 Mar 2021 08:20:12 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019406E1F7
 for <etnaviv@lists.freedesktop.org>; Mon, 29 Mar 2021 08:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D36661477;
 Mon, 29 Mar 2021 08:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1617006009;
 bh=O6tClAaFA0Qq72nsz5l4iwyHAcp7i0MbnyNKYGoJMvk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LP1Dd2e4FlNA2B6C6KOFUcAR90576ALlMC2DI9gdvIzsnE+hJrmc1DNh+wIE+jc3r
 tyWDVt/4yuhkT8/Qf1J6HKcWoI0b3MRqELWcjUEamsdskJGjDpUdEDFKlRY/I9hmMR
 3mTFflgUEDjl4Mfui1DcVsIEqBgmAtGqwDCroUro=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.10 084/221] drm/etnaviv: Use FOLL_FORCE for userptr
Date: Mon, 29 Mar 2021 09:56:55 +0200
Message-Id: <20210329075632.011485061@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210329075629.172032742@linuxfoundation.org>
References: <20210329075629.172032742@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>, etnaviv@lists.freedesktop.org,
 stable@vger.kernel.org, Christian Gmeiner <christian.gmeiner@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

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
@@ -675,7 +675,7 @@ static int etnaviv_gem_userptr_get_pages
 		struct page **pages = pvec + pinned;
 
 		ret = pin_user_pages_fast(ptr, num_pages,
-					  !userptr->ro ? FOLL_WRITE : 0, pages);
+					  FOLL_WRITE | FOLL_FORCE, pages);
 		if (ret < 0) {
 			unpin_user_pages(pvec, pinned);
 			kvfree(pvec);


_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
