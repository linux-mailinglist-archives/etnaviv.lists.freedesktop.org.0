Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o7HMNcVaUWoDDAMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 22:49:09 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C473E79A
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 22:49:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=XLmlvWXI;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E0B10E229;
	Fri, 10 Jul 2026 20:49:07 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB5410E1C6
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 20:49:05 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-51c8e2e39easo10028491cf.0
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1783716545; x=1784321345; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fM3Bw1AZy4lAkPPHaL59OrI7vB0RIP/keCGdI0vS7tk=;
 b=XLmlvWXIaMsCCd1uhLr+2QtTxzhJlXPTK/U9Cfk7YOh6xWRQhSQDA4oo6trq164wC3
 ZgdKQiBgkP2Y+nGw9BUa+uBcM2ok6apnIIJHdxVCqt4JdIgrFKuAk9qmP19+IVqyLsEM
 dQvBRW5poyD+rupTV83/sYp3TkFaqrhGq0ZH2xd7F9AqM1+B3Qa7W7d2jnb6qN/QUQdI
 hLD/EZuMfY6GJ0UuPWY6arduQqqM7HGtdOdaJbBbYT8qGEl+hlc5Eziug0SzPWSXtvCU
 TiM8msF5sufgQlcYf1sxnciQnZiQItxJFWW2PvGWG1dn6AyQLbUTp7T7+c+d4SzQKy0M
 XGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716545; x=1784321345;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fM3Bw1AZy4lAkPPHaL59OrI7vB0RIP/keCGdI0vS7tk=;
 b=ARshFaBrpKmxKc4RUtRsXnjP7zNH8qQpjc+JV35pScyu1EvIbn/PRq4zW054+pNd9p
 dGZu65P7iluMQ0y4O1Y57uD2SWj9ySPKTeIYRNnUJwUsaPq6ReqpWSw0qShgfx7cvJ/v
 zN4EhOfeR0qi+BKjT+vZCcTmjPscR8S2HRGZ0KIEFJnTid4ERTVB2hTC89+5i5cEb8f2
 XiDlqELZcCBv49U8FXon5mIkV0Hnup00oZ9u4mHpLKH06z/AVOthyXw2DiBTUeoSo24T
 ijyhai/o72bLLpRyr4L61+JTsTdHzl0oEfc1s9g2WUkgUXMwRJEROOZTVYGA6va4lMel
 oOVw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrQ9tHVocibGeQFp076skFG9uhzIn38pySNr3a4s2qQH4TyOATVdP7yyGOAl6Vn7pIxNdmWhtYU@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn6fZUBUPBeLSWxnx/KnWcY9kwtEH7JBESxu1pa+sZCVaKES21
 ngch0foCFDg18nRihyjhhAVxBXh1wp7yC8uKbzkonRuGfaHfCo34ST86fEDSfZMwOlY=
X-Gm-Gg: AfdE7clX6YDYYwDaO4qhL3JYp8S0jniVMNz78Lb5XySBK8oWandQFf8uZK+1BIqA2dn
 0DGXZitN8r44SW8Rs7gl+WaUgPuu8krune8Qathut0zeMsu/muzMMYDIn7v9IXeQ5VUwRksL0e7
 RfEhvALPLBae5uKlYXNtfek874MYf+g+hba+dtmOzbaBc86iOET/8Z0Ql4fSLeKiOYZMr2JLxyP
 LS/juOn124FhyDnUPHHqi8BZMjxbPVFyrSnptrO4Vh/nCeagTI8GeOUOTUhGvADqieURMUqy8E4
 gQrvNz8uPCrCdcFzfviViTLrT1sHPjhyBLvfcvJzA/YpnaJkC4PyseCU7/jK3oRZtvW+IPBalM4
 b6m17pB7VWcKxNuOUGW5eqisAo3Y1Rgy3rOIARQORLe0OVN0a9C5+ShRA4CRSEfXzZdIHG0/RMf
 m5xuVJejeGsXzphwOyt2chLSFIc7+1kuteL3QBrBCjXocggwj57gj276fZWOTXtx0n9a3u
X-Received: by 2002:a05:622a:15c4:b0:51c:7b11:41a3 with SMTP id
 d75a77b69052e-51cbf361a3bmr5658901cf.80.1783716544856; 
 Fri, 10 Jul 2026 13:49:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F
 (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51caaf5f61csm24147321cf.22.2026.07.10.13.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:49:04 -0700 (PDT)
Date: Fri, 10 Jul 2026 16:48:58 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>,
 Simon Schuster <schuster.simon@siemens-energy.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
 Alex Williamson <alex@shazbot.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Dan Williams <djbw@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "Liam R . Howlett" <liam@infradead.org>,
 Matthew Wilcox <willy@infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>,
 Miaohe Lin <linmiaohe@huawei.com>, Hugh Dickins <hughd@google.com>,
 Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-mm@kvack.org, iommu@lists.linux.dev,
 linux-perf-users@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 damon@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH 30/30] tools/testing/vma: output compared expression on
 ASSERT_[EQ, NE]()
Message-ID: <alFausURKttxHUAI@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <432444fa4c12ae1c4047550e2b205d3e9bab458f.1782735110.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <432444fa4c12ae1c4047550e2b205d3e9bab458f.1782735110.git.ljs@kernel.org>
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infradead.org,m:m.szyprow
 ski@samsung.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:pfalcato@suse.de,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[gourry.net];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER(0.00)[gourry@gourry.net,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gourry.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[76];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[gourry@gourry.net,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gourry.net:from_mime,gourry.net:dkim,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D3C473E79A

On Mon, Jun 29, 2026 at 01:23:41PM +0100, Lorenzo Stoakes wrote:
> -#define ASSERT_TRUE(_expr)						\
> -	do {								\
> -		if (!(_expr)) {						\
> -			fprintf(stderr,					\
> -				"Assert FAILED at %s:%d:%s(): %s is FALSE.\n", \
> -				__FILE__, __LINE__, __FUNCTION__, #_expr); \
> -			return false;					\
> -		}							\
> +#define __ASSERT_TRUE(_expr, _fmt, ...)					   \
> +	do {								   \
> +		if (!(_expr)) {						   \
> +			fprintf(stderr,					   \
> +				"Assert FAILED at %s:%d:%s(): %s is FALSE" \
> +				_fmt ".\n",				   \
> +				__FILE__, __LINE__, __FUNCTION__, #_expr   \
> +				__VA_OPT__(,) __VA_ARGS__);		   \
> +			return false;					   \
> +		}							   \
>  	} while (0)
> 
> +#define __TO_SCALAR(x)	((unsigned long long)(uintptr_t)(x))
> +
> +#define ASSERT_TRUE(_expr) __ASSERT_TRUE(_expr, "")

Mmmmm... macro madness.... I don't think this is what you want.

I think you end up double-running the expression in the failure branch.

  ASSERT_EQ(cleanup_mm(&mm, &vmi), 2)

run through the preprocessor expands to:

  do {
      if (!( (cleanup_mm(&mm, &vmi)) == (2) )) {
              **** first run ****

          fprintf(stderr,
              "Assert FAILED at %s:%d:%s(): %s is FALSE" " (0x%llx != 0x%llx)" ".\n",
              "merge.c", 645, __FUNCTION__,
              "(cleanup_mm(&mm, &vmi)) == (2)",
              ((unsigned long long)(uintptr_t)(cleanup_mm(&mm, &vmi))),
                                               **** second run ****

              ((unsigned long long)(uintptr_t)(2)));
          return false;
      }
  } while (0);


A bunch of existing ASSERT callers mutate state, so there's no guarantee
the printed value matches teh actual test value.

I think you want something like:

#define ASSERT_EQ(_val1, _val2) do {	\
	__auto_type _v1 = (_val1);	\
	__auto_type _v2 = (_val2);	\
	__ASSERT_TRUE(_v1 == _v2, " (0x%llx != 0x%llx)",	\
		__TO_SCALAR(_v1), __TO_SCALAR(_v2));	\
} while (0)

which expands to:

  do {
      __auto_type _v1 = (cleanup_mm(&mm, &vmi));
      __auto_type _v2 = (2);
      do {
          if (!(_v1 == _v2)) {
              fprintf(stderr, "...FALSE (0x%llx != 0x%llx).\n",
                      "merge.c", 645, __FUNCTION__, "_v1 == _v2",
                      ((unsigned long long)(uintptr_t)(_v1)),
                      ((unsigned long long)(uintptr_t)(_v2)));
              return false;
          }
      } while (0);
  } while (0);

~Gregory
