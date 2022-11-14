Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5962C853
	for <lists+etnaviv@lfdr.de>; Wed, 16 Nov 2022 19:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFEE10E4F0;
	Wed, 16 Nov 2022 18:55:10 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ECB10E080;
 Mon, 14 Nov 2022 08:30:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD71D60F0E;
 Mon, 14 Nov 2022 08:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC080C433C1;
 Mon, 14 Nov 2022 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668414615;
 bh=M5Go57T18KU3kovwfaSoPQkXTIJ9pU/x8zoi9VefwW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SdH1QQKcLZQv3AKSNRqZgc4tXzBdMXgXKDuK3MoPQQRFpIYn6+O1nQZvg7Lp1GOYn
 QE742J9xLRn5ra6lGaVDnYoZgTzRjS0XJQSharaM9uVu6TJ//f4uH4suR3r5UAk5PK
 EjsXAoDr8CJU0bttAruYJ+pnYM1kFvmZR3cBw8CkWNisnUsoXW1ZUF1QcRRiDm7Y3L
 oMXJbnHupIRPsjq+jbJhGZzXY9uFf9StdS9G4A+jFvbnURqB8ZwRSbqvO+FUa98HIw
 VRhvftCN3zogKZ7mhH3RYpIiQTD/5vXd1uPM6Tw59jiLpnVXiTCkuHHIHG2JgSWt2/
 SIDKXJb6O8rcQ==
Date: Mon, 14 Nov 2022 10:30:11 +0200
From: Leon Romanovsky <leon@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 10/19] RDMA/umem: remove FOLL_FORCE usage
Message-ID: <Y3H8kys/B4u/gYLe@unreal>
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-11-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107161740.144456-11-david@redhat.com>
X-Mailman-Approved-At: Wed, 16 Nov 2022 18:55:06 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, etnaviv@lists.freedesktop.org,
 Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 05:17:31PM +0100, David Hildenbrand wrote:
> GUP now supports reliable R/O long-term pinning in COW mappings, such
> that we break COW early. MAP_SHARED VMAs only use the shared zeropage so
> far in one corner case (DAXFS file with holes), which can be ignored
> because GUP does not support long-term pinning in fsdax (see
> check_vma_flags()).
> 
> Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
> for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
> using FOLL_FORCE, which is really only for debugger access.
> 
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/infiniband/core/umem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Thanks,
Tested-by: Leon Romanovsky <leonro@nvidia.com> # Over mlx4 and mlx5.
