Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BvpNFzGhQ2pVdwoAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:53 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F636E337C
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=a8voR6Ld;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2709110EC5A;
	Tue, 30 Jun 2026 10:57:50 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2D010E97B
 for <etnaviv@lists.freedesktop.org>; Mon, 29 Jun 2026 15:40:20 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-51c0ecfaee7so1470141cf.0
 for <etnaviv@lists.freedesktop.org>; Mon, 29 Jun 2026 08:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1782747619; x=1783352419; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VwgemlAWVZOfyfvrJ+7cyHmQGRLai3JgFnH6EFj5//k=;
 b=a8voR6LdSKl9hghp/HvVf7dTLlEroxjunEQDf+Pzon8+E29S5WVLN6aaQd6SOFLHJB
 AdAkm/ig3itONVKBi7Oov3Nx1p/D/dcOG9rhe4HoE39B+fAaMPuFBn/epxZXPHugtGAE
 u+50V1w6yyyM3UXP2lg50pAkYR/T0n6NnRflmmOVc1dxkMENxjD0EZPgdJGzUmTWEz8I
 LiKAYaudkgOsLDwCNA3nhyYGrW5G1LC8tjOhMq1xKtO3JnL8zgdQt6u2TjEGt92DKCUn
 ZKIaCeSmPyOBCy47SVmFILNEAzduY6GH5ZKSFbQ1j6/yYruHfi+ZkNL21Y6fA6DYyK5U
 WOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782747619; x=1783352419;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VwgemlAWVZOfyfvrJ+7cyHmQGRLai3JgFnH6EFj5//k=;
 b=aZXm0fzeQTqZyb53pdD/FHzm1fLMFYIyMSxDQ83Oq+qoHtd2kiIc5+WTCBlGcyb+8a
 LimPwHEqpOO3a248FnhOjdp2oqQyhVSQQZD3gFQnTyAyTVttZFx8zPGZPbNiQbI7rida
 YDvXfdaYRo5PEONxeXwQpc47AEVKzcdi2MbnhpaX0Odk8CYOpHvZ2fgsBDZieoAm35zA
 IX7zhLvNsh56gXSlS1yhEjhTkB6SJLQLEZLSS1Z/lA6g4+IGpReJRYdn2jrlCH+wsKaP
 tPilQJEdxc+xTqFepbmqdtZD/UhTWcMNuQ/hGq2jy9oGkP+12fuW8YNfDhT8kmurx9z4
 BPZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8lgrTUysEON2R+5Te7LyNGjvhjAcYMJGCWnLaALNeDJCsH1whUhy+eIhmC/2AP0jEeRMNWOxfL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBzccgWVgsKNKiXCF0PGDVaa7/iB581JbJ7Yio4P8qj9kk+/kx
 E7JaVdjJQJNp2R6NX34gm7PSFjqGlInJqAPJZi3RM3+nS0znMjCGt6aIFp6WUldvWxc=
X-Gm-Gg: AfdE7cl3jrOVJ9jyOt6gJb4Y4BskiXkJlef1Ogm07QE+OGmUqjSTQUqOAsBVEMZWlnp
 A358RrLjagtFi9nvFIuKqSniZihkT8yS6XCQzVNZLNhY5KL/08S1fC4pAzeFAR4prgH5foKghHb
 cY5EPTu1AXeoaW+6V5aknRHXMQQR82NCU+2GDFP0KFHTPPdW3kvUnFc+JZsBga82v649aP7ZcJA
 HjO9cJCk3PhQL0WvPo6qJRQrMKWJevj7cv4cnAn9/OU7K/adIfPb/goDd//xTH/hZojrOCa20cS
 wZUvsIVJmlwKHweX5mJ70HQpi4XDGRuM16O1EwOXgvF8NwqboQaAqe3K4bjYYn+FfLO4Vvp2F+b
 HXU62TJdUH4T36WCXq+7ujsFB075+hiMm0uR8lh0LY0IHge4vijp9ytUPN/Gj+MKsOkQvcuBLOW
 JasQjeWgjoNipd5LLOOZMi9EgUqy2SokAqt9RgoDJjOhbQv4qm8l6YucR6dx5/dlJ6ufCz
X-Received: by 2002:a05:622a:5987:b0:51b:f635:9aa1 with SMTP id
 d75a77b69052e-51bf6359eadmr68650541cf.48.1782747619393; 
 Mon, 29 Jun 2026 08:40:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F
 (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51a876c888bsm78114501cf.9.2026.06.29.08.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 08:40:18 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:40:13 -0400
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
Subject: Re: [PATCH 03/30] tools/testing/vma: use vma_start_pgoff() in merge
 tests
Message-ID: <akKR3bFV7393yOUs@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <b501eca378b9d9734e83838102aadc9276590fba.1782735110.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b501eca378b9d9734e83838102aadc9276590fba.1782735110.git.ljs@kernel.org>
X-Mailman-Approved-At: Tue, 30 Jun 2026 10:57:47 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99F636E337C

On Mon, Jun 29, 2026 at 01:23:14PM +0100, Lorenzo Stoakes wrote:
> Now we have the vma_start_pgoff() helper, update the merge tests to make
> use of it for consistency.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Question: Should we have primitive tests for vma_*_pgoff() since
the behavior changes depending on file/anon?

Nice to have the cleanup and clarity. Maybe worth asserting no
one ever breaks this.

for this patch though

Reviewed-by: Gregory Price <gourry@gourry.net>
