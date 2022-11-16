Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411F462C829
	for <lists+etnaviv@lfdr.de>; Wed, 16 Nov 2022 19:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682D610E1A0;
	Wed, 16 Nov 2022 18:49:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2A3891B4
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Nov 2022 18:16:55 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id c8so12419544qvn.10
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Nov 2022 10:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PBgZn+u117R7gFQNpsnvlIYlwSeo0LUTLoxlFKr3wyI=;
 b=eH0YS14VezMu1YoYc8i9L/9V4Rda12NtBPhbyEQG9con1K8dLIyV9b4KNCmIq0wzpX
 WqxRC9GRz2SSVMeoKLZbZ25GRVxvk4TLZwapfzc9KJm3PzFnUZgrmijMI3uqPEOn38/b
 +5K39+JbiCr6klzOuT84Gyzf87KIYKFM/ltfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PBgZn+u117R7gFQNpsnvlIYlwSeo0LUTLoxlFKr3wyI=;
 b=bN/GDD0xjvFzYxAp5fSgA1Ku3CnrFUp/C2hsrieXLtK/nzEk2bE4KCIUz+PzyFuYfK
 6l8kHeCPg0OUHMMRf9CMmZk5Ayxn3FbAZq3a9nrJsL2gKrODMlhc+GI00+JYJIjDxxX+
 gafVZCPJI2WmGF1BGMikspaP2LxzuwOy4yOuglbBQsy+Yw96zRQ+KSKgxgMAYmeS4haM
 fhZZhG8/LHH6ylL6o9b0eakNId4SKxR+7oo8QhHWeLPcqBNjyFfmYjdq/mF13VEbxgWC
 ACsR3KbvunTlN2fbR9WmJZyu/Pbcv6QYLNPnHe1cBDmyi4e8U3NLvLsJejzhgwl29x6h
 uNIg==
X-Gm-Message-State: ANoB5pmbxCfLbcs4gHVGUyHnNvfhIujZiTqCgtHFhgcSExmONfoddEuG
 JgwI/dZH+wDI0DlFHnZ0Me9vIObJ52HT1g==
X-Google-Smtp-Source: AA0mqf4/Jlve2CcaY8hht+lrz6KBsSsBUffhhhtGuqQ76SAZHSRdKdPyvbdYOsw4vU8sv9T2EbjeTg==
X-Received: by 2002:a0c:b304:0:b0:4bb:7313:3859 with SMTP id
 s4-20020a0cb304000000b004bb73133859mr21946239qve.105.1668622613873; 
 Wed, 16 Nov 2022 10:16:53 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 g10-20020a05620a40ca00b006faf76e7c9asm10780907qko.115.2022.11.16.10.16.51
 for <etnaviv@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 10:16:52 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id c15so11221501qtw.8
 for <etnaviv@lists.freedesktop.org>; Wed, 16 Nov 2022 10:16:51 -0800 (PST)
X-Received: by 2002:a05:622a:1c15:b0:3a5:49fa:3983 with SMTP id
 bq21-20020a05622a1c1500b003a549fa3983mr21860304qtb.436.1668622610752; Wed, 16
 Nov 2022 10:16:50 -0800 (PST)
MIME-Version: 1.0
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
In-Reply-To: <20221116102659.70287-21-david@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 16 Nov 2022 10:16:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
Message-ID: <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Nadav Amit <namit@vmware.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, linux-rdma@vger.kernel.org,
 David Airlie <airlied@gmail.com>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Matt Turner <mattst88@gmail.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, Nicholas Piggin <npiggin@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 linux-arm-kernel@lists.infradead.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-perf-users@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 2:30 AM David Hildenbrand <david@redhat.com> wrote:
>
> Let's make it clearer that functionality provided by FOLL_FORCE is
> really only for ptrace access.

I'm not super-happy about this one.

I do understand the "let's rename the bit so that no new user shows up".

And it's true that the main traditional use is ptrace.

But from the patch itself it becomes obvious that no, it's not *just*
ptrace. At least not yet.

It's used for get_arg_page(), which uses it to basically look up (and
install) pages in the newly created VM.

Now, I'm not entirely sure why it even uses FOLL_FORCE, - I think it
might be historical, because the target should always be the new stack
vma.

Following the history of it is a big of a mess, because there's a
number of renamings and re-organizations, but it seems to go back to
2007 and commit b6a2fea39318 ("mm: variable length argument support").

Before that commit, we kept our own array of "this is the set of pages
that I will install in the new VM". That commit basically just inserts
the pages directly into the VM instead, getting rid of the array size
limitation.

So at a minimum, I think that FOLL_FORCE would need to be removed
before any renaming to FOLL_PTRACE, because that's not some kind of
small random case.

It *might* be as simple as just removing it, but maybe there's some
reason for having it that I don't immediately see.

There _are_ also small random cases too, like get_cmdline(). Maybe
that counts as ptrace, but the execve() case most definitely does not.

                Linus
