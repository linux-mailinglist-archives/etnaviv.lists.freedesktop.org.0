Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F3317A3B7
	for <lists+etnaviv@lfdr.de>; Thu,  5 Mar 2020 12:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EB36E1D3;
	Thu,  5 Mar 2020 11:08:46 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 1209 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2020 11:08:45 UTC
Received: from gateway36.websitewelcome.com (gateway36.websitewelcome.com
 [192.185.196.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2976E1D3
 for <etnaviv@lists.freedesktop.org>; Thu,  5 Mar 2020 11:08:45 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id 4D1AE400D1608
 for <etnaviv@lists.freedesktop.org>; Thu,  5 Mar 2020 04:03:50 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 9o3NjPnx3Sl8q9o3Nj2Gw3; Thu, 05 Mar 2020 04:48:34 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N+cQ6695/UaT15cBW0dOVs0XFP/fIU8FdrNDquttipY=; b=jRnFL4wQjKz1AfDheOOAqnMyi5
 erogLWYYg0i5Ton9B+L1Occ8/tO7OBtB8P7NXs9jDMDb1sI5ZMgzgQUvJfpvNV537UW0AFTZqXbje
 Wu2UvVtueVgUcqT0tohInOtDGg66GaturmFGxZb7/rqe8CTdGxPjB2wR7R0WwbRbmg6P6yTeB1jkE
 cBYIVnbtG5udEWlTfD1WOlkyFwgjdM6xOrZOYklk4oN0RN3b0A3QA+8t3oKlybYuXwIcEA68eEfKJ
 3SrQjr5xzWEHYXiQmDl+5If0ZS/v21s3G9GaD0ZEZlVINosd2QM6nngBlFJi3n3QoiGo/gg+A1/kU
 8qUCmSWg==;
Received: from [201.166.169.220] (port=13470 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j9o3L-003dNJ-JM; Thu, 05 Mar 2020 04:48:32 -0600
Date: Thu, 5 Mar 2020 04:51:37 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm: etnaviv_gem.h: Replace zero-length array with
 flexible-array member
Message-ID: <20200305105137.GA18628@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.166.169.220
X-Source-L: No
X-Exim-ID: 1j9o3L-003dNJ-JM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.166.169.220]:13470
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index 6b68fe16041b..98e60df882b6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -105,7 +105,7 @@ struct etnaviv_gem_submit {
 	unsigned int nr_pmrs;
 	struct etnaviv_perfmon_request *pmrs;
 	unsigned int nr_bos;
-	struct etnaviv_gem_submit_bo bos[0];
+	struct etnaviv_gem_submit_bo bos[];
 	/* No new members here, the previous one is variable-length! */
 };
 
-- 
2.25.0

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
