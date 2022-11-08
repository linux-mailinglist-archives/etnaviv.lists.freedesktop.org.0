Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410DF620C31
	for <lists+etnaviv@lfdr.de>; Tue,  8 Nov 2022 10:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0479110E0E8;
	Tue,  8 Nov 2022 09:29:27 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFEC10E0E8
 for <etnaviv@lists.freedesktop.org>; Tue,  8 Nov 2022 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667899762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/IvXa3Gtc42ocSwbE6e2PTXEI1xHOCM/WDymiGQVjk=;
 b=EclQgB/BAXWPmHv1CQSriGjM01041EmwLWXrYJNK4SB8YG848WwPaT3gtRThNKwuxzmdw5
 WIGW9R+7AM/5gAAZRH/0L5G44XvsMJQpHiO/l6SjGpDw5LLZtlzG5p9K4gQknYqLCl5Jpf
 5BIWRtsM4d1QsnoJfX3bzespR7vjkbA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-376-n70wNdeoNlyi9WDcOi6TaQ-1; Tue, 08 Nov 2022 04:29:21 -0500
X-MC-Unique: n70wNdeoNlyi9WDcOi6TaQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 f62-20020a1c3841000000b003cf6d9aacbbso6690104wma.8
 for <etnaviv@lists.freedesktop.org>; Tue, 08 Nov 2022 01:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G/IvXa3Gtc42ocSwbE6e2PTXEI1xHOCM/WDymiGQVjk=;
 b=MD51Syy6RB+72VQXW0IB+kC5rT0Kz4rq/S/v70WpdAD1MgBEJ6/wNI+z6VaMPlCfPo
 VVEGI4TRoNM9yEOajaX/dozhZVwdZFTzRqeX86Um/7ZW7lQNflHGVglia9wy5V66FMEl
 4YzVr6auSisDOl5qgRfvtiD2HXbW0D6rHxyFnSvII4gEVfyOwlR19ZgKF7O2Ii0JeDaO
 HSpRyHp4f6lNgmVV8VSZZFl4YfDA28eEVStds+Xm8WpvnfYJQufY3WfhkcmFH7O6Rzxd
 el4yy2/eS+ZyAC8zoTsTuoAGoE8DKZcMRYSZs98jr7ypl16YQ9h6wVy5eep0pRS8dScW
 brQQ==
X-Gm-Message-State: ACrzQf30oRhJt4Po6T2OdMI+QSVjjHzWcZ412QLQAjrWX9d9t5JX8OiF
 iTSnmCVui2pKs9ORoivmt2lMxPNfzHfF9aRA9QORoOn7QbA49ODV0tSfFPI+DKSjd8jtTL7ToQA
 COM4eYaOL/vn2p+DPRhnCNCAIag==
X-Received: by 2002:a1c:7418:0:b0:3cf:703a:4f0c with SMTP id
 p24-20020a1c7418000000b003cf703a4f0cmr31192086wmc.63.1667899760174; 
 Tue, 08 Nov 2022 01:29:20 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5StZVkpugFYppLkRHp5xlGTjmqFOUyferk1nDQuYzjbb+gdKwEthZaHv8SGYCGJ8Geu++6Xg==
X-Received: by 2002:a1c:7418:0:b0:3cf:703a:4f0c with SMTP id
 p24-20020a1c7418000000b003cf703a4f0cmr31192042wmc.63.1667899759842; 
 Tue, 08 Nov 2022 01:29:19 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:db00:6510:da8d:df40:abbb?
 (p200300cbc708db006510da8ddf40abbb.dip0.t-ipconnect.de.
 [2003:cb:c708:db00:6510:da8d:df40:abbb])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a5d420a000000b0023682011c1dsm9563940wrq.104.2022.11.08.01.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 01:29:19 -0800 (PST)
Message-ID: <ee9fceb8-f928-8754-d94f-54b662bb0c74@redhat.com>
Date: Tue, 8 Nov 2022 10:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC 00/19] mm/gup: remove FOLL_FORCE usage from drivers
 (reliable R/O long-term pinning)
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20221107161740.144456-1-david@redhat.com>
 <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
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
 Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On 07.11.22 18:27, Linus Torvalds wrote:
> On Mon, Nov 7, 2022 at 8:18 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> So instead, make R/O long-term pinning work as expected, by breaking COW
>> in a COW mapping early, such that we can remove any FOLL_FORCE usage from
>> drivers.
> 
> Nothing makes me unhappy from a quick scan through these patches.
> 
> And I'd really love to just have this long saga ended, and FOLL_FORCE
> finally relegated to purely ptrace accesses.
> 
> So an enthusiastic Ack from me.

Thanks Linus! My hope is that we can remove it from all drivers and not 
have to leave it in for some corner cases; so far it looks promising.

-- 
Thanks,

David / dhildenb

