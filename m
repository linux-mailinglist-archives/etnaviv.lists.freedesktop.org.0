Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B728262C828
	for <lists+etnaviv@lfdr.de>; Wed, 16 Nov 2022 19:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C6710E196;
	Wed, 16 Nov 2022 18:49:37 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD72710E528
 for <etnaviv@lists.freedesktop.org>; Mon,  7 Nov 2022 17:35:13 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id v81so12892833oie.5
 for <etnaviv@lists.freedesktop.org>; Mon, 07 Nov 2022 09:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OtwMIMageNgEFgITDbP/X4AlmExFVOD7QsjK39jRkOs=;
 b=ZrBbGd0NE5W3bFjfpMfVEGchJiOqL5vKGUnJZWHQEDCz71oryF6CDiPscJkkJaNeeg
 /pKDfIl6hW5yw8tjgrcZSOwrloCrFqYb1/s9Bc1/cV94xFkaKkZwH1bCSgyaTCtOH5Nq
 2ijwSehO6aXkrD87GuWevIaaXGPhzXmGc/u0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OtwMIMageNgEFgITDbP/X4AlmExFVOD7QsjK39jRkOs=;
 b=gP3a/B8CVty7k3yCKk9yIGjDyFSFkVQy/WHzc2i6+LyYxho5nImC+Zi+jsw+xTeqCA
 FF7FTzaUwlNFMM2oWfrisVNFyI67SEJ6B8pWu6KXTlCl0Pjl5qletCmX/vrs4c5MznJE
 fV6qN+8+1b/XJSwUQQ6bCs7Z8C65AMMDKEkAGCrwVis4aiyBpiFdQiwVYKXScXhvqnFj
 7VPSYKaHViBfsPhYgp+gu/enrWktyXQvF+qAPRhATF9AiN/THAUTNeg5JhQxbBA1cW0c
 dZnmlF+LT/GabFLrkD+dpiRqbwM121MmIEhBIwGtKle1/MzLvNtG5vVe9zwzUeqNKzDg
 C5TQ==
X-Gm-Message-State: ANoB5pnccXiieIqEG6GOusTHGRgBGXJr9xOa4KRBSoGposaHC1sv/DwN
 YcPlqNL9AbRtJeaum0rEfWSkYTzuXQIljw==
X-Google-Smtp-Source: AA0mqf7ChTiC/vL4XslNzYjetaNg5yKGNFWZ3QFdBO4qmsPtgNNyIavO0JqWN5RTS4LqDthUtC5k8Q==
X-Received: by 2002:a05:6808:3cf:b0:35a:7d0c:5c68 with SMTP id
 o15-20020a05680803cf00b0035a7d0c5c68mr5227335oie.8.1667842512218; 
 Mon, 07 Nov 2022 09:35:12 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com.
 [209.85.210.48]) by smtp.gmail.com with ESMTPSA id
 l8-20020a0568302b0800b00655ca9a109bsm3111173otv.36.2022.11.07.09.35.10
 for <etnaviv@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 09:35:11 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso6949103otb.6
 for <etnaviv@lists.freedesktop.org>; Mon, 07 Nov 2022 09:35:10 -0800 (PST)
X-Received: by 2002:a05:6902:1352:b0:6bb:3f4b:9666 with SMTP id
 g18-20020a056902135200b006bb3f4b9666mr46634218ybu.101.1667842059236; Mon, 07
 Nov 2022 09:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20221107161740.144456-1-david@redhat.com>
In-Reply-To: <20221107161740.144456-1-david@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Nov 2022 09:27:23 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
Message-ID: <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/19] mm/gup: remove FOLL_FORCE usage from drivers
 (reliable R/O long-term pinning)
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 16 Nov 2022 18:49:34 +0000
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
 Mike Kravetz <mike.kravetz@oracle.com>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 8:18 AM David Hildenbrand <david@redhat.com> wrote:
>
> So instead, make R/O long-term pinning work as expected, by breaking COW
> in a COW mapping early, such that we can remove any FOLL_FORCE usage from
> drivers.

Nothing makes me unhappy from a quick scan through these patches.

And I'd really love to just have this long saga ended, and FOLL_FORCE
finally relegated to purely ptrace accesses.

So an enthusiastic Ack from me.

                   Linus
