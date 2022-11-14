Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD79627715
	for <lists+etnaviv@lfdr.de>; Mon, 14 Nov 2022 09:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD0210E274;
	Mon, 14 Nov 2022 08:07:46 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E0D10E274
 for <etnaviv@lists.freedesktop.org>; Mon, 14 Nov 2022 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668413261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sc3OD/33LVOTPB4+NFeZBiaw904aPGsKctdDvYBcdUs=;
 b=YD4FrXp+yAE1cQRDX8/NXWvuY67DI6XSgRs4QjXmOz56BMzZw4a0nQ/hz/l0t/Lk0km/6X
 3BFZq5pwwdlpgNHPPZzHHoYxN9sPkaB5Sg8E2w3LVg6BnkNI0AmIFyydb0FG1b7VuAqOpe
 e+1w8RAHZt3DY2i1Pn9iUCDuCild/Uc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-1-IYIM5HHRN1SkiP6YnUboNw-1; Mon, 14 Nov 2022 03:07:38 -0500
X-MC-Unique: IYIM5HHRN1SkiP6YnUboNw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so2652470wmb.2
 for <etnaviv@lists.freedesktop.org>; Mon, 14 Nov 2022 00:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sc3OD/33LVOTPB4+NFeZBiaw904aPGsKctdDvYBcdUs=;
 b=wYU99w/DoO+fbMg1n391QMf0XLgRjLB6zlQET+VdwoN672KhEvz/2GH2gkf+yfuV1E
 qTF0Nl/9KeFCLbmGry8EcW+g3apVLEohOh7nxzxwTtYL0XRuTzSvADGlQEUFrwyWG6U5
 q43BoExaHk8ygW+F5JMJJXTcfbbWkYPAeI6JjXX1Q3CGcf71HSVN834jBdrPT0Owy02Y
 Iiq5sfuCk4f5N03Hf5qX9TbiCjzD+pytl+AobfNE3lQiJdrtWYhFG8RB0TsS5g471aDK
 PjB2ymNhEMNGh4QCO0Ji81msUG84pSWskDs7tYboOoENNGnl1JlBK4gEZUjp1vhNnL9v
 tn9g==
X-Gm-Message-State: ANoB5pkitScqnFmftoUfL78YnRKWcMiHde6S3VlGZDFsv+CtxQ/jo6FE
 J3bB+Jmlq5W/nTfHdzmmq3wllCozrtlXmY4FVURtrkEVKPXXQjweXhQ75SRtpyw43TsbQXkznCH
 LEZK0JiVgpviF/lofI7jy883wyQ==
X-Received: by 2002:a5d:4575:0:b0:236:6e4b:8c2 with SMTP id
 a21-20020a5d4575000000b002366e4b08c2mr6336374wrc.545.1668413257332; 
 Mon, 14 Nov 2022 00:07:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7nVXgU/8Jv+xzckTpvD06sshk0g6lWh6ohMy1bXzH3vi7keYGWVfIARGixyNY+Rc8WvFWGhQ==
X-Received: by 2002:a5d:4575:0:b0:236:6e4b:8c2 with SMTP id
 a21-20020a5d4575000000b002366e4b08c2mr6336334wrc.545.1668413256954; 
 Mon, 14 Nov 2022 00:07:36 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:d300:8765:6ef2:3111:de53?
 (p200300cbc703d30087656ef23111de53.dip0.t-ipconnect.de.
 [2003:cb:c703:d300:8765:6ef2:3111:de53])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a5d540b000000b0022cdeba3f83sm8798705wrv.84.2022.11.14.00.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 00:07:36 -0800 (PST)
Message-ID: <f233f77b-a065-37aa-e2fb-5b92899dd13b@redhat.com>
Date: Mon, 14 Nov 2022 09:07:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC 00/19] mm/gup: remove FOLL_FORCE usage from drivers
 (reliable R/O long-term pinning)
To: Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20221107161740.144456-1-david@redhat.com>
 <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
 <Y3HaGbPcGfTxlLPZ@infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y3HaGbPcGfTxlLPZ@infradead.org>
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

On 14.11.22 07:03, Christoph Hellwig wrote:
> On Mon, Nov 07, 2022 at 09:27:23AM -0800, Linus Torvalds wrote:
>> And I'd really love to just have this long saga ended, and FOLL_FORCE
>> finally relegated to purely ptrace accesses.
> 
> At that point we should also rename it to FOLL_PTRACE to make that
> very clear, and also break anything in-flight accidentally readding it,
> which I'd otherwise expect to happen.

Good idea; I'll include a patch in v1.

-- 
Thanks,

David / dhildenb

