Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0781162E974
	for <lists+etnaviv@lfdr.de>; Fri, 18 Nov 2022 00:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C2610E6C6;
	Thu, 17 Nov 2022 23:20:23 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD4C10E6C6
 for <etnaviv@lists.freedesktop.org>; Thu, 17 Nov 2022 23:20:21 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id k4so2357572qkj.8
 for <etnaviv@lists.freedesktop.org>; Thu, 17 Nov 2022 15:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0Zl62KafxDJ8AwrDahi1bqb4Xk/32bDlmDdXpQC/2I=;
 b=McHst7l/f7KmgETncU4ax8Cz1+X0pDSSDz+NpOo85KKRbSTGF3eq2IAlrIRy/FELSJ
 Y7C0SIlyu5mGQyhzPLIjsCXMOXUrzD5TZH+dJcbaF2LHrVuVcof8hyWOL3D9pZZx4wAD
 8LINQRolzJh6QXumNwKV51jsDIdF9sMEo4+5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y0Zl62KafxDJ8AwrDahi1bqb4Xk/32bDlmDdXpQC/2I=;
 b=maI1wiPdlRLFD1t25d56xJamNWt8bnA0WXtGHVRYJnV60iISE6Ni5rCRLT2bb1/DAV
 4QEbUDC0zXf84kdNac4IuId7PczQfLTr9asCG4I/gyxPeoLhrA55aJoW8QZE/1cpKx9a
 cVFCIhn3SFXEgcqh9tSG7qaal61Rx8537BxN9LkuSNPlrXx7eAWXF16C/tTJdvPo1Je9
 ME0ipWbyXurEufAy9/9WWoByaGWywYMhYGoapVu1MKgl4I5kjex49opN6zCQuAiPCevH
 wDxBvOFb45SrHtL7JKFD8vZEFpFCE5v5K51KI5Sb9okTZLar2DeWoA70z8DoPt/zTeO1
 ckGg==
X-Gm-Message-State: ANoB5pm4gqPmXqCBXgr+6CTj3rzibDyumBmGG6EXTrYkm+6Ni+JnC18u
 bygSlDwMVDVOCNYprjCuryc1OgK3z7IyMg==
X-Google-Smtp-Source: AA0mqf5UvBnEnvS5HVQ3lquqdcLaVumt++RjS3rIsBENjj6nSqq9qWedRW87H2KxBob8o8p0oB8stg==
X-Received: by 2002:a37:6381:0:b0:6ee:4d91:4523 with SMTP id
 x123-20020a376381000000b006ee4d914523mr3643791qkb.574.1668727220063; 
 Thu, 17 Nov 2022 15:20:20 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50]) by smtp.gmail.com with ESMTPSA id
 ay20-20020a05620a179400b006faa88ba2b5sm1369593qkb.7.2022.11.17.15.20.17
 for <etnaviv@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 15:20:17 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id j6so2266418qvn.12
 for <etnaviv@lists.freedesktop.org>; Thu, 17 Nov 2022 15:20:17 -0800 (PST)
X-Received: by 2002:ad4:4101:0:b0:4b1:856b:4277 with SMTP id
 i1-20020ad44101000000b004b1856b4277mr4665856qvp.129.1668727216978; Thu, 17
 Nov 2022 15:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
 <202211171439.CDE720EAD@keescook>
In-Reply-To: <202211171439.CDE720EAD@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Nov 2022 15:20:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjykbz-4xVTWF7vkvGJnFoTSXNVeMzfsXaLnGm3CRd8rQ@mail.gmail.com>
Message-ID: <CAHk-=wjykbz-4xVTWF7vkvGJnFoTSXNVeMzfsXaLnGm3CRd8rQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
To: Kees Cook <keescook@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, Will Deacon <will@kernel.org>,
 Nadav Amit <namit@vmware.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, linux-rdma@vger.kernel.org,
 David Airlie <airlied@gmail.com>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Matt Turner <mattst88@gmail.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org,
 Nicholas Piggin <npiggin@gmail.com>, Richard Weinberger <richard@nod.at>,
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
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
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

On Thu, Nov 17, 2022 at 2:58 PM Kees Cook <keescook@chromium.org> wrote:
>
> Oh, er, why does get_arg_page() even need FOLL_FORCE? This is writing the
> new stack contents to the nascent brpm->vma, which was newly allocated
> with VM_STACK_FLAGS, which an arch can override, but they all appear to include
> VM_WRITE | VM_MAYWRITE.

Yeah, it does seem entirely superfluous.

It's been there since the very beginning (although in that original
commit b6a2fea39318 it was there as a '1' to the 'force' argument to
get_user_pages()).

I *think* it can be just removed. But as long as it exists, it should
most definitely not be renamed to FOLL_PTRACE.

There's a slight worry that it currently hides some other setup issue
that makes it matter, since it's been that way so long, but I can't
see what it is.

             Linus
