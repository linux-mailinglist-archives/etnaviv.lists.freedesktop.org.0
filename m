Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YVZoDgrDT2rqnwIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 17:49:30 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E3E733175
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 17:49:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=QpmG+eEn;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BA310E6B7;
	Thu,  9 Jul 2026 15:49:28 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B2010E6B7
 for <etnaviv@lists.freedesktop.org>; Thu,  9 Jul 2026 15:49:27 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-8eefd0c5f59so329306d6.3
 for <etnaviv@lists.freedesktop.org>; Thu, 09 Jul 2026 08:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1783612166; x=1784216966; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=hryUWYzOZzjuIh9gJx+Hzg+n+E360+tJZh4R7BZGeLA=;
 b=QpmG+eEndcBezbydrBIeugJzqosCVwCwJYo3Bsd1rUIoifBWwyb5Wmqbpumb9deb8C
 txDbN68Yv2Sm0pNptuVjU9i2OMQB5z6JU7wJZw4n5jvcxU5UEgO0rWHuPhv6pTGWA/PP
 yC74rhmZ6pMhMLNs/MnIH+HuJUlqz23V1A7cPpEVPntcvmoopZj7o3H43LuhPQK0xtjR
 imZAPsmTNHSShi36TuGlbfK56TEH9Sqa/G5JJ1Bb/0ZHVFzo6w/HJLsMFB3GoLWzuPVU
 kPMfDvv/x/DgW1ahdIHasVia1f5EU8qcpqg9OYe52bd7LDpELOtAFzkcmqqILGZnRQUi
 /Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783612166; x=1784216966;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hryUWYzOZzjuIh9gJx+Hzg+n+E360+tJZh4R7BZGeLA=;
 b=j74DAY5U60swVBc1hgGVOT0jIUMoH9ysMDbpzDKzHDe0UfR+k6trSLjBdjKohzc1td
 h2FwPioCFQ2R/B0RAmy2uUKTMEQK9qImbx2YxxaBroKbWZwbiQ5We1QZGWL3qbr5GGoo
 lvVu84mN2ABkqNEs+6zdSCtSpkRXvqY5wnxfljD8ifdAecAjUNYH2zOTB9MLo5s6CsTk
 gO6vXuenJutlpC1zwVxwCdWl9nqbxo0gRph6ET37K76HIqpbADpvf4964nCxa4qF4ul+
 19nSvr1JZ4hOUoZRuMiFWcecm4q3H9bJhZMMyC6bzdWi2ddh1wmU3U78YtUtkuxBUNds
 dQyQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpzUHcw5XO1jCFKKU5dm1e3kpAFqshkrd1nPu1VhV1iOPSkqx/I+ls1dRMgiYSYrZV29T8UdxyL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkXcfYn5JJTxBx/k+J7mLjg8BQkMKwTTOg2X738gMfMUNk3xPs
 aoSomSCA7dxf31OjOAc1fmIeIEaRi/lAFJv7SI/Ui+vYAoBEgHF9YRno0W1tx4kvveo=
X-Gm-Gg: AfdE7cnU4zhjy2ReHBQcOwOfkNIXxmh5CIUuf5R+1w+HiA+++iWi1jqX4h+Sc/64Q16
 S914Tk/r6/7ceSxNNlgoXjtiL0jVAlkdZZyMcR8M3Bf/c5BS0KMijg6E4wqD9SVGmmyfKQRNpy8
 UTyMqZVt5uzgmMQFwTzWt8b7YgybOBPa82JHrFwbAltJ9x+bLv/hLCJriH0kwIuB56GvMPxacN6
 5ps25z0U45kKmYgrd5l9Ds8JJ6ecswpaxxRZ11y28jW/VuiQyEAaAQd58tW2MyACTHFd42PNKsO
 xevjiUkQ6CkFR0yIl3rY058X7yHimhcdAdGo5aBJVUl3uANknRP/MapJp6BHkjIo07lJDsdskQb
 nEyrF7+Oqcd+a2kcm5scMLD/6/Z9K3vH+4j84fd7vn2VoCmbdqm9f3tcqNYp0PbI0DOm2bAZegA
 ZHFDvcV48AC1TExa6ZGHkzQF7FbAJ7pX0rf7cAPI8/OKSCtJ8/4usE0mFkHb/+o2fI9KOm
X-Received: by 2002:ad4:5c8a:0:b0:8cc:2a92:48e4 with SMTP id
 6a1803df08f44-8fec217b8bfmr87997286d6.32.1783612165998; 
 Thu, 09 Jul 2026 08:49:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F
 (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd7c1d9f6sm20164456d6.23.2026.07.09.08.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 08:49:24 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:49:18 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 damon@lists.linux.dev, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>
Subject: Re: [PATCH 17/30] mm: prefer vma_[start,end]_pgoff() to
 vma->vm_pgoff in kernel/
Message-ID: <ak_C_o2ehS17Q5HV@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <ea87349d63205bf4c26ea79854f179a9bf8cfb0b.1782735110.git.ljs@kernel.org>
 <akZCg73F-oGzDp1a@pedro-suse.lan> <akZGqclqQ6gS12Vv@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZGqclqQ6gS12Vv@lucifer>
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
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:pfalcato@suse.de,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infrad
 ead.org,m:m.szyprowski@samsung.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[suse.de,linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry-fedora-PF4VCD3F:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,gourry.net:from_mime,gourry.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2E3E733175

On Thu, Jul 02, 2026 at 12:30:59PM +0100, Lorenzo Stoakes wrote:
> 
...
> static inline unsigned long vma_offset(const struct vm_area_struct *vma,
> 				       const unsigned long address)
> {
> 	/* Retains page offset and tags. */
> 	return address - vma->vm_start;
> }
> 
...
> And I'm not sure it's really all that useful. Perhaps retaining vma_offset()
> would be though.
> 

Silly question:

   What's the purpose of retaining tags in a non-address value?

That sounds like there's fragility just waiting to be broken.

(I presume you are talking about things like ARM MTE and such, right?)

> This is one that I think makes more sense.
> 
> But in general, I'd rather hold off from yet more churn here.
> 
> I'm making these changes to establish a basis for virtual page offsets
> introduced in [0], rather than just cleaning up in general.
> 

I agree with this.  If the refactors here suddenly have to think about
corner cases on things like tags, that's better resolved separately.

~Gregory
