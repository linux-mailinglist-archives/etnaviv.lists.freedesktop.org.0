Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8332F63429C
	for <lists+etnaviv@lfdr.de>; Tue, 22 Nov 2022 18:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0B110E1CA;
	Tue, 22 Nov 2022 17:39:31 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00A710E1CA
 for <etnaviv@lists.freedesktop.org>; Tue, 22 Nov 2022 17:39:27 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id j26so3632903qki.10
 for <etnaviv@lists.freedesktop.org>; Tue, 22 Nov 2022 09:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y0TG7RSDJLBsFmv13T+kVLFnKE/Gs/+y0yFrl/WZR6s=;
 b=L0dZyDnVDHFIaOItmPGH7qgeLVW0usPCwRH/4nTimj8Xh9l2UXEZKNFm/ei9gDcq24
 Pk3u7Gq7lJi0kmr8z8NjnWgqP5s/GTGAjlS5nF3Rg8c28BPysVoaAoT/SPX3zkQcRIfE
 uip9ptnbHvWOX/Zei2bksChNqBhHUUkmXbxVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y0TG7RSDJLBsFmv13T+kVLFnKE/Gs/+y0yFrl/WZR6s=;
 b=HqZTPHslp33/l2oXwxalc48Ce27AwZgyS/H833J6RGjVSl61mWB4Hm+GMCubHR11i/
 H5LkyxjCUvTb1ITynS6QyEShdcPL6esJgmyAb/ywyv0PaCT1tqOjhbX6WhxnToS4oEXP
 ou3NjF/qEUEWIN5xdzbW+EtOzsrMyznClPg7Tj8CCqxTeRw2h7Elfzyljh70+oHeJOR4
 TkhPKuFk07RyNxjggXhq6PWATV+WTDCCjFQQV47hQtDDAnp9vFJ435PqtR+WRPHRcsli
 StIOa/aM8t9HfToCgrckp5Mb25NMJ8ViQ0f7vI81ZvF7gWu7bS25RinmpSqvyClS9QMH
 FoEw==
X-Gm-Message-State: ANoB5plaPRqEyHknY2UuZjg8riIOGKAnRpHbfCLJWbVeWs14uzZGQh6T
 WHrT5n+DYryEiMmEDdp8jSVGvGzB6lygeA==
X-Google-Smtp-Source: AA0mqf5hc9rpuC0LKj0NV4Ju1iqh42KDHdW+EDF5YBDlvPZsnyKdIt2ox1i1bF8Ku5wK8fU0WruNww==
X-Received: by 2002:ae9:ed82:0:b0:6fa:1745:46b2 with SMTP id
 c124-20020ae9ed82000000b006fa174546b2mr22307625qkg.503.1669138766356; 
 Tue, 22 Nov 2022 09:39:26 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com.
 [209.85.222.170]) by smtp.gmail.com with ESMTPSA id
 w11-20020a05620a444b00b006fb72dbbaa4sm10517309qkp.27.2022.11.22.09.39.25
 for <etnaviv@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 09:39:26 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id x21so10802958qkj.0
 for <etnaviv@lists.freedesktop.org>; Tue, 22 Nov 2022 09:39:25 -0800 (PST)
X-Received: by 2002:a05:620a:1fa:b0:6ee:24d5:b8fc with SMTP id
 x26-20020a05620a01fa00b006ee24d5b8fcmr21656006qkn.336.1669138412298; Tue, 22
 Nov 2022 09:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-17-david@redhat.com>
 <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
 <6175d780-3307-854c-448a-8e6c7ad0772c@xs4all.nl>
In-Reply-To: <6175d780-3307-854c-448a-8e6c7ad0772c@xs4all.nl>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Nov 2022 09:33:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh0nuSn=zYB1z9bHXJRPi33mmbpv-Z6z7ARkHQupbQ3fQ@mail.gmail.com>
Message-ID: <CAHk-=wh0nuSn=zYB1z9bHXJRPi33mmbpv-Z6z7ARkHQupbQ3fQ@mail.gmail.com>
Subject: Re: [PATCH RFC 16/19] mm/frame-vector: remove FOLL_FORCE usage
To: Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 linux-rdma@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 etnaviv@lists.freedesktop.org, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 4:25 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> I tracked the use of 'force' all the way back to the first git commit
> (2.6.12-rc1) in the very old video-buf.c. So it is very, very old and the
> reason is lost in the mists of time.

Well, not entirely.

For archaeology reasons, I went back to the old BK history, which
exists as a git conversion in

    https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/

and there you can actually find it.

Not with a lot of explanations, though - it's commit b7649ef789
("[PATCH] videobuf update"):

    This updates the video-buf.c module (helper module for video buffer
    management).  Some memory management fixes, also some adaptions to the
    final v4l2 api.

but it went from

         err = get_user_pages(current,current->mm,
-                            data, dma->nr_pages,
-                            rw == READ, 0, /* don't force */
+                            data & PAGE_MASK, dma->nr_pages,
+                            rw == READ, 1, /* force */
                             dma->pages, NULL);

in that commit.

So it goes back to October 2002.

> Looking at this old LWN article https://lwn.net/Articles/28548/ suggests
> that it might be related to calling get_user_pages for write buffers

The timing roughly matches.

> I assume that removing FOLL_FORCE from 'FOLL_FORCE|FOLL_WRITE' will still
> allow drivers to read from the buffer?

The issue with some of the driver hacks has been that

 - they only want to read, and the buffer may be read-only

 - they then used FOLL_WRITE despite that, because they want to break
COW (due to the issue that David is now fixing with his series)

 - but that means that the VM layer says "nope, you can't write to
this read-only user mapping"

 - ... and then they use FOLL_FORCE to say "yes, I can".

iOW, the FOLL_FORCE may be entirely due to an (incorrect, but
historically needed) FOLL_WRITE.

             Linus
