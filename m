Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECF162D000
	for <lists+etnaviv@lfdr.de>; Thu, 17 Nov 2022 01:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C8C10E509;
	Thu, 17 Nov 2022 00:46:10 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5897910E509
 for <etnaviv@lists.freedesktop.org>; Thu, 17 Nov 2022 00:46:05 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id g10so231267qkl.6
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Nov 2022 16:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rT9xjSJmKp4cCvf16bTKl9Dc4YEY7MjOtsK/w44qv+E=;
 b=VV2cb+pd6jfcSL2tauZE67KBioAHcybPQR+VfU40dKebsvpG7CB3+xd0Uv8h8MKz8R
 sbSQ7TqeMCU61fYQIjRwQoQBWrCcg8ekkdEQ8V7xYjRGPq0DN+C0Atnpvt0eAux7Zvaz
 PXr7WI31PYcmErRNWRYdBKljCyptLiKShcOF4gqH5bxcH7c9a48sUWSu+SLW+D60rEcT
 94q2cJm8yEvdEzbYpl0Vwvwu6uXwvrse0KXhbaR5xd9/LECZYdD6vR+hmUeAJTlxbvcq
 ueSGRE+vNlUSsDE90kXWUWeAcS6lHSqHDXkbeBbAuFPPnKLrO2HgUtltNTPZxflFTx6j
 B+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rT9xjSJmKp4cCvf16bTKl9Dc4YEY7MjOtsK/w44qv+E=;
 b=baOQvtz+xhEwPpt13HnlQJxXaQQhO/X4OjzBPTvCWwJ/YEHGsTYcBsQgEEeE1az7QQ
 SqyFmt+MJnO5xf9TfPYcSHTjHtFTav4CpXY+FqNkvYqKr0g9x6dYk4Lc7cjutVQ/BcvG
 cy/AbtumO4R1iW+OD4x7OzMyqteApn9aFRdLorscJL69oukwzw6TN+9/+hHzWskPT1ac
 bG0YQtq0l7u9NLOwcUM+4V+FR3y5zkvkedjcXqm0rr1lGMtZ2Rvvi6hED0DsRe26w3Ai
 81E7jdkb3PrfJFAQqqAOkYwM2bHnLkGYUoI/9E9acrv3er93ZkV8FG6Hty6MDHZ0wkW1
 4q+w==
X-Gm-Message-State: ANoB5pkYHrdnzHJ4GjgQpcJPlaLlNhvjmpi8cFfo98H3j3kYHPHMIO4U
 6ySvdRBk7clgjZKT9URQYX8TUQ==
X-Google-Smtp-Source: AA0mqf607w9C7cuVA1Gk/5OO594s7B3KGBk4c2yq8D1+/1YgY/KvFwESfDj3NEnwxZjz0MAqyk7Deg==
X-Received: by 2002:a37:424c:0:b0:6fb:a0ec:c5ba with SMTP id
 p73-20020a37424c000000b006fba0ecc5bamr8177915qka.493.1668645964499; 
 Wed, 16 Nov 2022 16:46:04 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 i18-20020a05620a405200b006fa84082b6dsm11394495qko.128.2022.11.16.16.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 16:46:03 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ovT2Z-0066UZ-3n;
 Wed, 16 Nov 2022 20:46:03 -0400
Date: Wed, 16 Nov 2022 20:46:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH mm-unstable v1 12/20] RDMA/siw: remove FOLL_FORCE usage
Message-ID: <Y3WES5adl6yyS4ZB@ziepe.ca>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-13-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116102659.70287-13-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-samsung-soc@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Bernard Metzler <bmt@zurich.ibm.com>, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>,
 linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 11:26:51AM +0100, David Hildenbrand wrote:
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
> Cc: Bernard Metzler <bmt@zurich.ibm.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/infiniband/sw/siw/siw_mem.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
