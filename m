Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mZIDHy+hQ2oodwoAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:51 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053886E3353
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 12:57:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b="bTY/egli";
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F9410EC47;
	Tue, 30 Jun 2026 10:57:49 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E683110E666
 for <etnaviv@lists.freedesktop.org>; Mon, 29 Jun 2026 15:27:33 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-92c7a0a7059so197273085a.0
 for <etnaviv@lists.freedesktop.org>; Mon, 29 Jun 2026 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1782746853; x=1783351653; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YVSnUoP7z1l2IjNO7QqWpl688BIslf+DGUxd2Ln6LGs=;
 b=bTY/eglikrstZo4mgRbAcY8W0ky5IARGEPEOcPFJy3gJsj48ZXDCv1SH2uvhO5JhQJ
 5tRoJSQ+s/54efDjFXCqDhkeSLdFbwYoyC9qLMQ3YYeUxI5R0Cc8Spr8rK1ynZYBBT3+
 t9JQwT7XxHpXggHaijoFV1ai27qZz6p6OcQAHhdGZ2hlmjvcLIXr2tEDjJew6NEdozQ6
 MbyvOwFSQnDwGqnsSRHL6OeY9fNPnMuH+iQufmQcEmUgccZa+zj2YGfThEzCDtXyF3C6
 Wgiu74dRgLOSMpXTg1MXWm/mPzPY3JhaWQ7RHnCMnFpm191mWM7UDFknh+JngWyO4wgu
 5ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782746853; x=1783351653;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YVSnUoP7z1l2IjNO7QqWpl688BIslf+DGUxd2Ln6LGs=;
 b=PvG+a1tmtpW+uKcHK4QcA6qvOcOEKHodGbDGVjgMcNZmz+rkE4n4w90MRD7B557YCz
 g7E0Ms1obdtqJcSZsQJMfSN+VTTtc3uwr1S4uMU8NTzRak+9FKhef+KLCtsTpHO/Ld42
 1Mva6lKZ8FvirricYo2lj85YC+Nbo+U/j49G++sxR7ongWPkRcj5gGbN3hESTLmPHo42
 3ce7BQZQqiPN1iWascguBTljG+6kElUbkDaQaefDihDa6AtOnG937OjB+mGw1/l2bshC
 2oq0GZ6ajERS23GxMSHXy85L8tOM9ucIDuQmxxfmPMKLHuR2uwnPffg+Q2yPV4OuEGY1
 4wHA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/S2Y9qlnnZMEpI5/uxk8gHKmsZth2tTePVbF/t7QgtmuE2ANFExX22V3LJtgocJmrGBZY5ME5j@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTtW/IXkI8h8FTn8kbODDFdPGOV9jb3ABpdXjfdZfstquTosy/
 +66TFeWCHEpUJDD45Z0Cj5R7X7LF5xZnMDpQxkRl28NGfvAu1sMKyNIgCTVBYjWqIYc=
X-Gm-Gg: AfdE7cnh1Uoj6HuCWUXfMl583x6GnotZAfxbcuDRq0LXUJLD5deqVn7Dl7clFp2zLa+
 mAaAK1y45IyEfxSqcK0eGP8E1YBqWZ0QDy0A39WrE+X2MiStkO6c1z1+j7D5OCYCZT3vlALZjU+
 45HKHt1zxn1vaaQpxxaT6gl86S7aHicl/i4P8coVZddac7LZmtjwcQcYzhKHTyQJAhBLWYkB62k
 eSHmYcPCqa44/klnd2bPo69eD5ARBYAtiXvKOUdyz/B8Hoo7//8IMNGYPbb+BWBu9bGPy8LsnZx
 VFrRoFkhLW0owcC0ghyU8zeF0ycDHJP/gY4rEmwOWJ59a6jVc7dzYB5YHGKi0Dze+Olp1mix05s
 IunTvll3orl6bCNCq9agtzPXx9SzQEW3b1Tx9JskjHY11HCd1Ugf28+Ef0Y1RAnXNUf2TVyJoMg
 w6YGeFOT9x604RQAOh0U03iM0Ivjcw9jzs32CMWL3LrPgrXLg/ipTaWspUYvp/763z8Z7m/BZot
 ILStjk=
X-Received: by 2002:a05:620a:7002:b0:921:9df8:d38f with SMTP id
 af79cd13be357-92e62785c63mr1415985a.43.1782746852526; 
 Mon, 29 Jun 2026 08:27:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F
 (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-92e621943b3sm7429785a.19.2026.06.29.08.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 08:27:32 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:27:26 -0400
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
Subject: Re: [PATCH 01/30] mm: move vma_start_pgoff() into mm.h and clean up
Message-ID: <akKO3vnNmWIJAZ7z@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <b28b698df4c009e85c4728446ca5863d8e633164.1782735110.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b28b698df4c009e85c4728446ca5863d8e633164.1782735110.git.ljs@kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 053886E3353

On Mon, Jun 29, 2026 at 01:23:12PM +0100, Lorenzo Stoakes wrote:
> vma_last_pgoff() already lives there, so it's a bit odd to keep
> vma_start_pgoff() in mm/interval_tree.c. Move them together.
> 
> These each return unsigned long, which pgoff_t is typedef'd to. Make this
> consistent and have these functions return pgoff_t instead.
> 
> Additionally, express vma_last_pgoff() in terms of vma_start_pgoff(), since
> we wrap the vma->vm_pgoff access, we may as well use it here.
> 
> Also while we're here, const-ify the VMA and cleanup a bit.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

