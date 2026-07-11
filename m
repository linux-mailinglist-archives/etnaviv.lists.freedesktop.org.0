Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id csMJFDDiUWrvJwMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sat, 11 Jul 2026 08:26:56 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1457409C6
	for <lists+etnaviv@lfdr.de>; Sat, 11 Jul 2026 08:26:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cnxr8ph+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1F310E2EC;
	Sat, 11 Jul 2026 06:26:54 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF86D10E2EC;
 Sat, 11 Jul 2026 06:26:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id ADF21600C3;
 Sat, 11 Jul 2026 06:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C64C1F000E9;
 Sat, 11 Jul 2026 06:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783751211;
 bh=oEOFuhzeieMbnwaju2e0IyYLOOljLY7Vu3oSd3kdBHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=cnxr8ph+JvOklROMnVucJQrwHjsALSCj4Ss+aIH/0LX604Xs1T9DH/LiBtq8DJ7CB
 bbFTc6S7EMzv13aXVNHz37o3w0H8cJVDkv4EEInq5aeJXRMvt824n4tG1k47YNFa8G
 EEA2Db90wtgvblrtq8KsiTYxReeJpSlF3eZjjkyY3N1viC0WHBwCxq3l1oRlpcYqS7
 QgRD0/favy08A6S+5sgaUW5i6AYO6b9zdbFwe0prWZorlAfVWtQE7i8a/bTndcjz/R
 KrW6QiZSCXk9Ev7/ALIwvBmzcfBLHJNn0n1YTZf1YI9xC0rUFXaw8voXqV1/nPb13z
 PG0yxvDGEfIrA==
Date: Sat, 11 Jul 2026 07:26:27 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>, 
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Lucas Stach <l.stach@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Ankit Agrawal <ankita@nvidia.com>, 
 Alex Williamson <alex@shazbot.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Dan Williams <djbw@kernel.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 "Liam R . Howlett" <liam@infradead.org>, Matthew Wilcox <willy@infradead.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Zijlstra <peterz@infradead.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>,
 Miaohe Lin <linmiaohe@huawei.com>, 
 Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>,
 Kees Cook <kees@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-sgx@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 kvm@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org, 
 iommu@lists.linux.dev, linux-perf-users@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 damon@lists.linux.dev, 
 Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>
Subject: Re: [PATCH 30/30] tools/testing/vma: output compared expression on
 ASSERT_[EQ, NE]()
Message-ID: <alHh1cPs9tNLMLJf@lucifer>
References: <cover.1782735110.git.ljs@kernel.org>
 <432444fa4c12ae1c4047550e2b205d3e9bab458f.1782735110.git.ljs@kernel.org>
 <alFausURKttxHUAI@gourry-fedora-PF4VCD3F>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alFausURKttxHUAI@gourry-fedora-PF4VCD3F>
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[76];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,lucifer:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA1457409C6

On Fri, Jul 10, 2026 at 04:48:58PM -0400, Gregory Price wrote:
> On Mon, Jun 29, 2026 at 01:23:41PM +0100, Lorenzo Stoakes wrote:
> > -#define ASSERT_TRUE(_expr)						\
> > -	do {								\
> > -		if (!(_expr)) {						\
> > -			fprintf(stderr,					\
> > -				"Assert FAILED at %s:%d:%s(): %s is FALSE.\n", \
> > -				__FILE__, __LINE__, __FUNCTION__, #_expr); \
> > -			return false;					\
> > -		}							\
> > +#define __ASSERT_TRUE(_expr, _fmt, ...)					   \
> > +	do {								   \
> > +		if (!(_expr)) {						   \
> > +			fprintf(stderr,					   \
> > +				"Assert FAILED at %s:%d:%s(): %s is FALSE" \
> > +				_fmt ".\n",				   \
> > +				__FILE__, __LINE__, __FUNCTION__, #_expr   \
> > +				__VA_OPT__(,) __VA_ARGS__);		   \
> > +			return false;					   \
> > +		}							   \
> >  	} while (0)
> >
> > +#define __TO_SCALAR(x)	((unsigned long long)(uintptr_t)(x))
> > +
> > +#define ASSERT_TRUE(_expr) __ASSERT_TRUE(_expr, "")
>
> Mmmmm... macro madness.... I don't think this is what you want.
>
> I think you end up double-running the expression in the failure branch.
>
>   ASSERT_EQ(cleanup_mm(&mm, &vmi), 2)
>
> run through the preprocessor expands to:
>
>   do {
>       if (!( (cleanup_mm(&mm, &vmi)) == (2) )) {
>               **** first run ****
>
>           fprintf(stderr,
>               "Assert FAILED at %s:%d:%s(): %s is FALSE" " (0x%llx != 0x%llx)" ".\n",
>               "merge.c", 645, __FUNCTION__,
>               "(cleanup_mm(&mm, &vmi)) == (2)",
>               ((unsigned long long)(uintptr_t)(cleanup_mm(&mm, &vmi))),
>                                                **** second run ****
>
>               ((unsigned long long)(uintptr_t)(2)));
>           return false;
>       }
>   } while (0);
>
>
> A bunch of existing ASSERT callers mutate state, so there's no guarantee
> the printed value matches teh actual test value.
>
> I think you want something like:
>
> #define ASSERT_EQ(_val1, _val2) do {	\
> 	__auto_type _v1 = (_val1);	\
> 	__auto_type _v2 = (_val2);	\
> 	__ASSERT_TRUE(_v1 == _v2, " (0x%llx != 0x%llx)",	\
> 		__TO_SCALAR(_v1), __TO_SCALAR(_v2));	\
> } while (0)
>
> which expands to:
>
>   do {
>       __auto_type _v1 = (cleanup_mm(&mm, &vmi));
>       __auto_type _v2 = (2);
>       do {
>           if (!(_v1 == _v2)) {
>               fprintf(stderr, "...FALSE (0x%llx != 0x%llx).\n",
>                       "merge.c", 645, __FUNCTION__, "_v1 == _v2",
>                       ((unsigned long long)(uintptr_t)(_v1)),
>                       ((unsigned long long)(uintptr_t)(_v2)));
>               return false;
>           }
>       } while (0);
>   } while (0);
>
> ~Gregory

It's funny you should mention that... fixed in v2.

But ugh sorry that you reviewed this while I was also fixing this up (Claude
reported it also), your review's very appreciated :>)

Cheers, Lorenzo
