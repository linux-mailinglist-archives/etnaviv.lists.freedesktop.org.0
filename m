Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D27161FE9A
	for <lists+etnaviv@lfdr.de>; Mon,  7 Nov 2022 20:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0F510E3A7;
	Mon,  7 Nov 2022 19:27:19 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5CB10E3A7
 for <etnaviv@lists.freedesktop.org>; Mon,  7 Nov 2022 19:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667849234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=patZqZFG+VP3DSfi5ljEiY21OGL00v17le5HXIzu3EI=;
 b=VRdhnkhUl+iWTk9TtiNrq1Evcl6myw1og64CiR7QLYU6nbfscD9wjjtJTAJeQTIIS4xKso
 EZ2jlOm7soFbDyKiGryMSqxC3bGe4v5D7xNqcblPQcyYKTd4TcKfZ2dHS1wd3pNUpc7Xyt
 W7203K45N7CBuYjAnbedPGy2Xh1p1o4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-d3nND2HvNKWCPg-tv_UaAw-1; Mon, 07 Nov 2022 14:27:13 -0500
X-MC-Unique: d3nND2HvNKWCPg-tv_UaAw-1
Received: by mail-wr1-f72.google.com with SMTP id
 o13-20020adfa10d000000b00232c00377a0so3172568wro.13
 for <etnaviv@lists.freedesktop.org>; Mon, 07 Nov 2022 11:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=patZqZFG+VP3DSfi5ljEiY21OGL00v17le5HXIzu3EI=;
 b=Mij5gg+CxkG9TCHSglBF8XWiSx7C7b4/OIJOFmlsUeTsOwM3hLCvdQlWPsjSJqCklV
 EtuZ6DAkv8sSdFE2Fh8pP+JixwOZqIyG3seZEByj92aRDLXsoMi0Jln+V8bYv7i0c0A/
 kg9zRiwNWxY43ZJO4kfZmOwBZwx1EcxkHiTz7e8ZbS+U/OvYum0zWADh4GxhbkrjHidp
 Yd8nLjZJCzfk5fuFU4h3RwNBQEXC1qW73o5AmRrJVxUJ3t/us9uzk3p/zjG2vkevtMhg
 FmSyIns/SvU6EDOCVgn4lwGC8rIvdI7HNnmXrfDKW6PGkzQOSNlzkdx4XsOAIootKt3k
 AWVg==
X-Gm-Message-State: ACrzQf2aEYZkm/aVS7l/r+vHJ6rpbuAbjPhQtxf46K3ruwpIsHavh730
 acg5wD03PLi7cR4p36Hx2Xp1C/FM1uXszqGJyZpElMSeXa8NwN23VMeA1zr/i61/OPvqYB7JnR4
 CVDKjeCBcZHDdYS07BRr0+NBi6Q==
X-Received: by 2002:a5d:4487:0:b0:22e:3292:75ab with SMTP id
 j7-20020a5d4487000000b0022e329275abmr614291wrq.166.1667849232533; 
 Mon, 07 Nov 2022 11:27:12 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7WA0QO9a9aE/aCsv95kc1/GI2mA1rxsv3w8NpMMhNZXKsgaEBfixEFS4BMiXoamohO6ncLKQ==
X-Received: by 2002:a5d:4487:0:b0:22e:3292:75ab with SMTP id
 j7-20020a5d4487000000b0022e329275abmr614274wrq.166.1667849232188; 
 Mon, 07 Nov 2022 11:27:12 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:7800:3f13:77ac:9360:5e22?
 (p200300cbc70478003f1377ac93605e22.dip0.t-ipconnect.de.
 [2003:cb:c704:7800:3f13:77ac:9360:5e22])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b003cf9bf5208esm10877851wmq.19.2022.11.07.11.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 11:27:11 -0800 (PST)
Message-ID: <c58fe356-62b5-bdec-92a7-6153a27e19b7@redhat.com>
Date: Mon, 7 Nov 2022 20:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC 05/19] mm: add early FAULT_FLAG_WRITE consistency
 checks
To: Nadav Amit <namit@vmware.com>
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-6-david@redhat.com>
 <E1E8C21A-EAEB-4FA3-A9B9-1DFF81FCDA70@vmware.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <E1E8C21A-EAEB-4FA3-A9B9-1DFF81FCDA70@vmware.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux-MM <linux-mm@kvack.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 David Airlie <airlied@gmail.com>, Andrea Arcangeli <aarcange@redhat.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, kernel list <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On 07.11.22 20:03, Nadav Amit wrote:
> On Nov 7, 2022, at 8:17 AM, David Hildenbrand <david@redhat.com> wrote:
> 
>> !! External Email
>>
>> Let's catch abuse of FAULT_FLAG_WRITE early, such that we don't have to
>> care in all other handlers and might get "surprises" if we forget to do
>> so.
>>
>> Write faults without VM_MAYWRITE don't make any sense, and our
>> maybe_mkwrite() logic could have hidden such abuse for now.
>>
>> Write faults without VM_WRITE on something that is not a COW mapping is
>> similarly broken, and e.g., do_wp_page() could end up placing an
>> anonymous page into a shared mapping, which would be bad.
>>
>> This is a preparation for reliable R/O long-term pinning of pages in
>> private mappings, whereby we want to make sure that we will never break
>> COW in a read-only private mapping.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>> mm/memory.c | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index fe131273217a..826353da7b23 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -5159,6 +5159,14 @@ static vm_fault_t sanitize_fault_flags(struct vm_area_struct *vma,
>>                  */
>>                 if (!is_cow_mapping(vma->vm_flags))
>>                         *flags &= ~FAULT_FLAG_UNSHARE;
>> +       } else if (*flags & FAULT_FLAG_WRITE) {
>> +               /* Write faults on read-only mappings are impossible ... */
>> +               if (WARN_ON_ONCE(!(vma->vm_flags & VM_MAYWRITE)))
>> +                       return VM_FAULT_SIGSEGV;
>> +               /* ... and FOLL_FORCE only applies to COW mappings. */
>> +               if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE) &&
>> +                                !is_cow_mapping(vma->vm_flags)))
>> +                       return VM_FAULT_SIGSEGV;
> 
> Not sure about the WARN_*(). Seems as if it might trigger in benign even if
> rare scenarios, e.g., mprotect() racing with page-fault.
> 

We most certainly would want to catch any such broken/racy cases. There 
are no benign cases I could possibly think of.

Page faults need the mmap lock in read. mprotect() / VMA changes need 
the mmap lock in write. Whoever calls handle_mm_fault() is supposed to 
properly check VMA permissions.


-- 
Thanks,

David / dhildenb

