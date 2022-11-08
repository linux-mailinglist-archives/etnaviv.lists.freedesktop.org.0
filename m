Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679D5620C75
	for <lists+etnaviv@lfdr.de>; Tue,  8 Nov 2022 10:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C1510E3CC;
	Tue,  8 Nov 2022 09:40:32 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A639210E3CF
 for <etnaviv@lists.freedesktop.org>; Tue,  8 Nov 2022 09:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667900427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lW38e6pXJ1acSlo/JcbNSc5AQG/ffLUgHR8IViSMTS4=;
 b=ZNYpv5mYwz6toxe3F9rhtDkI/8OtgCl8z+jePJbDwXHpxX4sl5396j9mJDyMWXDp8bnCu3
 8th8K9xFr0Y3Dgy1ZquVDAM8644e2DuR/lwyV7wZlOQlA2T12HuC/nGIrC3Zj6FNwwDunF
 Hw3TluVeto2wI1iBMGntc5FTDViJIt0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-cCh-UhbBOQOgOujUaRZ9Uw-1; Tue, 08 Nov 2022 04:40:26 -0500
X-MC-Unique: cCh-UhbBOQOgOujUaRZ9Uw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s7-20020adfa287000000b00236c367fcddso3770780wra.6
 for <etnaviv@lists.freedesktop.org>; Tue, 08 Nov 2022 01:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lW38e6pXJ1acSlo/JcbNSc5AQG/ffLUgHR8IViSMTS4=;
 b=loGg01b3BtxHfM/uIt0ehPq/NABetYsDDsJStg1qY9a2A1BV1yZ0QnblC5DxaURS61
 LG//JzQ5/9Fe/R0EOJGMBZeoR0Yd1iuvddwTHqwGa6JOeIgvOtq5FRfFvs+i+I3I1jq6
 5JlVf7ss3c1od8Ds+aRVfAX7jBih4sxjAZQ7NynyCM2XQT2MLwN+oPq8Y/41wOK/wb0/
 vF0Domk0IjUqmZSSA1JBnR0qHp4wAPmRF7bwd0+tDbi7+9vTFlvKbWA2yj+pEdW1Tond
 ZLj7b7x4Ytxyb95VZD38LMhJ9YNW0WIv+QVZLXqFS8UJLVsvYUNNziaYNIbgJ6g4RB7o
 7jMA==
X-Gm-Message-State: ACrzQf1ap9NU42qjcyFX2tkBtzO/7vZGXXl+JfpBv/b4qTtknRxZW4Wh
 szPb7X35YiiPAB7okKRQMkrjAbOFBHdc+kdg6TOvqQMgBMlMvELJZEqOYthQ10E90gg+cHPuN4X
 zv0VgSFV3t63gakwS/aeztgp7JA==
X-Received: by 2002:a05:600c:54ca:b0:3cf:8e5d:7146 with SMTP id
 iw10-20020a05600c54ca00b003cf8e5d7146mr18675267wmb.191.1667900425631; 
 Tue, 08 Nov 2022 01:40:25 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5cH9tWJ/7f+h1bsvSFgTQP1m4PENc1Ye2cP0NqhUl7fQavJfxFFKESh5AiG6/w6GmkhSUyjQ==
X-Received: by 2002:a05:600c:54ca:b0:3cf:8e5d:7146 with SMTP id
 iw10-20020a05600c54ca00b003cf8e5d7146mr18675241wmb.191.1667900425279; 
 Tue, 08 Nov 2022 01:40:25 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:db00:6510:da8d:df40:abbb?
 (p200300cbc708db006510da8ddf40abbb.dip0.t-ipconnect.de.
 [2003:cb:c708:db00:6510:da8d:df40:abbb])
 by smtp.gmail.com with ESMTPSA id
 bu12-20020a056000078c00b0023655e51c33sm10027356wrb.4.2022.11.08.01.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 01:40:24 -0800 (PST)
Message-ID: <040542e7-7d1c-4f25-b1ed-459f3c165283@redhat.com>
Date: Tue, 8 Nov 2022 10:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-17-david@redhat.com>
 <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC 16/19] mm/frame-vector: remove FOLL_FORCE usage
In-Reply-To: <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On 08.11.22 05:45, Tomasz Figa wrote:
> Hi David,

Hi Tomasz,

thanks for looking into this!

> 
> On Tue, Nov 8, 2022 at 1:19 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> FOLL_FORCE is really only for debugger access. According to commit
>> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
>> writable"), the pinned pages are always writable.
> 

As reference, the cover letter of the series:

https://lkml.kernel.org/r/20221107161740.144456-1-david@redhat.com

> Actually that patch is only a workaround to temporarily disable
> support for read-only pages as they seemed to suffer from some
> corruption issues in the retrieved user pages. We expect to support
> read-only pages as hardware input after. That said, FOLL_FORCE doesn't
> sound like the right thing even in that case, but I don't know the
> background behind it being added here in the first place. +Hans
> Verkuil +Marek Szyprowski do you happen to remember anything about it?

Maybe I mis-interpreted 707947247e95; re-reading it again, I am not 
quite sure what the actual problem is and how it relates to GUP 
FOLL_WRITE handling. FOLL_FORCE already was in place before 707947247e95 
and should be removed.

What I understood is "Just always call vb2_create_framevec() with 
FOLL_WRITE to always allow writing to the buffers.".


If the pinned page is never written to via the obtained GUP reference:
* FOLL_WRITE should not be set
* FOLL_FORCE should not be set
* We should not dirty the page when unpinning

If the pinned page may be written to via the obtained GUP reference:
* FOLL_WRITE should be set
* FOLL_FORCE should not be set
* We should dirty the page when unpinning


If the function is called for both, we should think about doing it 
conditional based on a "write" variable, like pre-707947247e95 did.

@Hans, any insight?

-- 
Thanks,

David / dhildenb

