Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FE1630015
	for <lists+etnaviv@lfdr.de>; Fri, 18 Nov 2022 23:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A653F10E7E6;
	Fri, 18 Nov 2022 22:29:06 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDC510E7E7
 for <etnaviv@lists.freedesktop.org>; Fri, 18 Nov 2022 22:29:03 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id p21so5764554plr.7
 for <etnaviv@lists.freedesktop.org>; Fri, 18 Nov 2022 14:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UbBsvDU//DL6nEBTfVogOGw4gtrIt5cEgoWU7wg0yqE=;
 b=An8R27hBelrmHfCbOWIi0CQbpB+FbdUKZd/K74OWA+t1inv8v4494buerQXpAbVoQ/
 hawXo5IWqwOaOJXIlgQJ62nY4aZ8mzIQL8T0sN5QawgAa8EGZw3klOrzN/KXycM8ohn1
 PnwiDQNXHvwQENzmlhMaoO6BFIxzwB92hREPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UbBsvDU//DL6nEBTfVogOGw4gtrIt5cEgoWU7wg0yqE=;
 b=eY7h9XDd0v8FTPicSE3bnfZXwcFxi+U2W3inUrZd4zoo9r77mvA4QcsTRoMIuVUjLw
 JSkSrQRMmYC60Fh/eYukzfcm12TmdCW8yvkbLJAINKyIMdL27b4IwJ5nz1hHNl8Nrlx+
 5hMx4QF2NdnkVQEldrb6zBHc3B+ab48YWLJgBAZxIVxKnGNMQ0NSmEGXV/+33zGtfjvQ
 bx6wSVdNWtO1LosnmiC8TPiP8FohaJ87mDm71ITEcTTR2rXxzXjToDY9tW4n622xbJz4
 ALBWf/NKiqGVz5akmkbEOPU8m/Hq2wutO9M/bvszr7v89XbpqDu2G099Rhb0tGTU8Tap
 3F+g==
X-Gm-Message-State: ANoB5pnrOr3E7z6TigbPBIi8sILoVW4RXMRayCGwHaI9yx7B7TDwm3LZ
 ltgyc0O8ZL2ZOzsTV/3K+E9W/Q==
X-Google-Smtp-Source: AA0mqf6CgTDul/374P0W7rrlIZwWC/WtPB/rFM9c4Pb8H4WjGT5BNPOAuJqtgF8hwxBjrZP80dPQ5g==
X-Received: by 2002:a17:902:7b96:b0:188:b0db:cd5d with SMTP id
 w22-20020a1709027b9600b00188b0dbcd5dmr1455470pll.104.1668810543328; 
 Fri, 18 Nov 2022 14:29:03 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 f26-20020aa7969a000000b00571dda13fafsm3646997pfk.163.2022.11.18.14.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 14:29:02 -0800 (PST)
Date: Fri, 18 Nov 2022 14:29:02 -0800
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
Message-ID: <202211181427.4D1C3132FE@keescook>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
 <Y3dnzgwJpjTQXI9y@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3dnzgwJpjTQXI9y@hirez.programming.kicks-ass.net>
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
 David Hildenbrand <david@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, Will Deacon <will@kernel.org>,
 Nadav Amit <namit@vmware.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-samsung-soc@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Matt Turner <mattst88@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-media@vger.kernel.org,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, Nicholas Piggin <npiggin@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Alex Williamson <alex.williamson@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 linux-arm-kernel@lists.infradead.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-perf-users@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lucas Stach <l.stach@pengutronix.de>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 12:09:02PM +0100, Peter Zijlstra wrote:
> On Wed, Nov 16, 2022 at 10:16:34AM -0800, Linus Torvalds wrote:
> > Following the history of it is a big of a mess, because there's a
> > number of renamings and re-organizations, but it seems to go back to
> > 2007 and commit b6a2fea39318 ("mm: variable length argument support").
> 
> I went back and read parts of the discussions with Ollie, and the
> .force=1 thing just magically appeared one day when we were sending
> work-in-progress patches back and forth without mention of where it came
> from :-/
> 
> And I certainly can't remember now..
> 
> Looking at it now, I have the same reaction as both you and Kees had, it
> seems entirely superflous. So I'm all for trying to remove it.

Thanks for digging through the history! I've pushed the change to -next:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/execve&id=cd57e443831d8eeb083c7165bce195d886e216d4

-- 
Kees Cook
