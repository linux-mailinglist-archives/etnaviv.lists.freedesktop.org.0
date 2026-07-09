Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TJ4LDeTET2p5oAIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 17:57:24 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F4473331D
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 17:57:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=YJ8RbjUf;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56B710F629;
	Thu,  9 Jul 2026 15:57:17 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A830E10F639
 for <etnaviv@lists.freedesktop.org>; Thu,  9 Jul 2026 15:57:16 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-8ee88fce572so568066d6.1
 for <etnaviv@lists.freedesktop.org>; Thu, 09 Jul 2026 08:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1783612636; x=1784217436; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=T5BtG8ZZnILhla7gs7f63UlRSUpFIkMkPS04TXxov0k=;
 b=YJ8RbjUf33iK03014P1wVBtqkFGmcibxr1HouXtEUXyOFoFvYFkgeNa87ADxo/u7wB
 G1MU2KtVSjdYJYdVE4FJLBI0au58TUct6d0K/UIgIv0+To1qdKOzN4IL7fvU3YVJo6Q9
 iGrsNMYTlRvhhy0hTGAzakqljIKuo1hY3z0qww0ayOPKA8d6ZC7ZdiZ3OG1OSOGd5Rjw
 wRXW+zAFO+fZEyF4az+IvEt3Eetzb5TEOJd8wB0/AZHva1WFJFk6iF0h7W6Xijha8e1o
 WuV56SnjdMU/ZeFNEjo7yLYLrp1pmsd7+Vzrj9Zvf0uFWTo1lVtbE5GDx5sKzbtPgR6W
 SaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783612636; x=1784217436;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T5BtG8ZZnILhla7gs7f63UlRSUpFIkMkPS04TXxov0k=;
 b=nN0mnKd9xSpf5YEx2vqL070a5a133vmXWeImJw5hQo747d7Cg+StAAor21b5pAgJVA
 3Ohut6cnAsmJmhi01jf34XP95JlgusWeIpJZdr1vQ0XNv4n0ed/SArO5TQJjLptvH9P9
 OuFvdq7Tun9AKCYh5asBI7QznzXmJBYn1LU8oFs2wrUt0rze1U/injhp71CwlpEuhO8P
 dLhOdgc/OGdGJh8rBGrWGLkpASuf+FgNRhz/nHUe3T/LhTI9sm0CmwjVEcq4LpuLXPFR
 nHJhyOd9rB94SS0W8yWFcKldxzc0z1tHnVnJN3LoJEo1AVm97lsBpAZYRBvTh9wB+cV4
 MwuA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr3c2RVRDta+4kdy4l8eR9EdSCSSpaiLDLoqE1+rAJEq8aiRTxba1UvqgmtJsRQYnK22sz/c7aF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylhK6KLmr8Jbnzg2LAUdKb2ZvgQJAdjX2fcPT5RlgspNqSbgl+
 pxfjCqIRZ3F/u/JRHq2GGkpMuOgJEuujoGdP0I3FV4Dbh7o+koPHci4EUD6NIH8gxdw=
X-Gm-Gg: AfdE7cksNprYUTDXMopOQKAGMOqFsG+FM8r2mUmPGVScRKtD9vg1LVYR/7rusxjXdTh
 T6Rxiy+d4xdeESBUn1gFpRELATH9QDEfyC3JacHRVdhwBjAucinsmMtPn5yOsWw88wPYvX/gGL/
 4xrXGx4WAPUcXdYLjLdUzieY9k0Hs5sJohdA4NN9Dy5wbJwSzojPiRy3cY6Q6wtgTioMfsan0Dh
 fZOmn/qhDcCrcAZYkCieloSLpOPH5jrgePC8pg7yh629O4W/10n7xMKgntqfd+gbjZ25Fz11AqJ
 pPhejNNmx79gZEXl/n8fQEbvn3NoC+bAROK7fyx/KiswA6ZNS94ebBB/vLbJ/PSM+srnr1hwz+5
 l9m4bx87Y3FWpjkVaE2Gq33RYzfLAsZTyzk5Uf/d+94m/evv3SvDyNpz0+u8Ura8u0VB20ZtsGO
 fQCzEkw7mWxcTUxl3hN/WRzX1knJJXx0+nbxjN6NawARgKUSgDNRbe+pHbbdh7ENHes9WjUS40x
 Lh76xk=
X-Received: by 2002:a05:6214:2aa6:b0:8f3:e0ce:6119 with SMTP id
 6a1803df08f44-8fec0ead52amr91789316d6.21.1783612635560; 
 Thu, 09 Jul 2026 08:57:15 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F
 (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd86d43e2sm20317526d6.43.2026.07.09.08.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 08:57:15 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:57:09 -0400
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
Subject: Re: [PATCH 19/30] mm: use linear_page_[index, delta]() consistently
Message-ID: <ak_E1Y-D2Twykusr@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
 <ak_EivwcDDdn1Xvp@gourry-fedora-PF4VCD3F>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak_EivwcDDdn1Xvp@gourry-fedora-PF4VCD3F>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry-fedora-PF4VCD3F:mid,lists.freedesktop.org:from_smtp,gourry.net:from_mime,gourry.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2F4473331D

On Thu, Jul 09, 2026 at 11:55:54AM -0400, Gregory Price wrote:
> > @@ -2462,7 +2463,7 @@ static int comedi_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >  {
> >  	struct comedi_buf_map *bm = vma->vm_private_data;
> >  	unsigned long offset =
> > -	    addr - vma->vm_start + (vma->vm_pgoff << PAGE_SHIFT);
> > +	    addr - vma->vm_start + (vma_start_pgoff(vma) << PAGE_SHIFT);
> >  
> 
> Obviously correct, but was this intended for a different patch?
> 
> ~Gregory

bleh already caught, sorry for the noise :]
