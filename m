Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D09762CFFD
	for <lists+etnaviv@lfdr.de>; Thu, 17 Nov 2022 01:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258AF10E509;
	Thu, 17 Nov 2022 00:45:55 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0CD10E50C
 for <etnaviv@lists.freedesktop.org>; Thu, 17 Nov 2022 00:45:47 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id h10so210151qvq.7
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Nov 2022 16:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6GmH5bBgQAPTYyWGM7n52ZkzuQiQsRGb4mBRnSjjrbs=;
 b=l2lxIbefVRjdcatsHe8zxGxmcFT5QX0zkZlGmTA+6hS7woiLsGV9I6bNGV4zHN8kjb
 l2p/UcY6CYSTNWmi7VujvEPDLopmeYV5y04nexmylfHHZLvrChhtK9ZoFHB8KXFnQm2L
 u2KxlP3m/08gOzMOWFz7wJqhAgcRBAizzZiUHkaGNmUyt44/uIl+uDznkLyQC/8LtiyK
 IYJyOaMVreNHxUrE7KnyIf6buUGiBVrXdyfdI9hycSXNdg6N07L9Zen1tNKJCn4NMx7j
 3tR7ySmG4oePdK/F1paF+sUf2cgVO41erHwEOTLPwwAJA2UwmtpAOpPTOIoYWmh1mJkM
 +oJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6GmH5bBgQAPTYyWGM7n52ZkzuQiQsRGb4mBRnSjjrbs=;
 b=SUlBZERpqgHd1yDT3OJHq7w3Q7GLjX+deeKDQikxVN/kAGmnHhUEd/bwkClKMh3Ct4
 5sfv0geZH7Loz7JZU9YNCcFcBVS5GYGlTObuclDEnH7Nuc+8+91+LXPr0S2S/jIth5/P
 OHhkEbg9r26RiQw0Dm80A+XIYX9BJ3QQcGNVK9heyee+Nzs3Ts8OnibRl4WGeTAkYZnM
 PnBdL+iZh0AhrAkvttx1v+52TDRKC0Hn+5Bbt8WHDG6QztYh1Aix/B1oyULWxgX2FH8y
 19y5sqloUa7QtuQIZaDVGglvH5vMilW/XoxxUE9UkatoBY5fjD7Afzj74NQAD91X28DI
 eKng==
X-Gm-Message-State: ANoB5pnUk8cCYCBpEHsMg6SKOt9jol4akslS9CjweE0P68+HvvkFZdpF
 jwNEUlisUHmIt2K5o5YzZh1DKg==
X-Google-Smtp-Source: AA0mqf6kOndX6mF3jdPV+JEPNJmYotlDtU6GG3yPlrdGFCMTOM0aazChCn63y+VS5Enp4BFgjok9CA==
X-Received: by 2002:a05:6214:7f3:b0:4c6:5acc:1e24 with SMTP id
 bp19-20020a05621407f300b004c65acc1e24mr626072qvb.61.1668645946250; 
 Wed, 16 Nov 2022 16:45:46 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 h2-20020ac85042000000b003a606428a59sm2189506qtm.91.2022.11.16.16.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 16:45:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ovT2G-0066Tl-Ts;
 Wed, 16 Nov 2022 20:45:44 -0400
Date: Wed, 16 Nov 2022 20:45:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH mm-unstable v1 11/20] RDMA/usnic: remove FOLL_FORCE usage
Message-ID: <Y3WEONlxYkwrglYR@ziepe.ca>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-12-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116102659.70287-12-david@redhat.com>
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
Cc: Nelson Escobar <neescoba@cisco.com>, linux-ia64@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Benvenuti <benve@cisco.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 David Airlie <airlied@gmail.com>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 11:26:50AM +0100, David Hildenbrand wrote:
> GUP now supports reliable R/O long-term pinning in COW mappings, such
> that we break COW early. MAP_SHARED VMAs only use the shared zeropage so
> far in one corner case (DAXFS file with holes), which can be ignored
> because GUP does not support long-term pinning in fsdax (see
> check_vma_flags()).
> 
> Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
> for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
> using FOLL_FORCE, which is really only for ptrace access.
> 
> Cc: Christian Benvenuti <benve@cisco.com>
> Cc: Nelson Escobar <neescoba@cisco.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/infiniband/hw/usnic/usnic_uiom.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
