Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 34PGBxkLUWrh+QIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 17:09:13 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1F873C136
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 17:09:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=A4eInKcj;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5015210E1E0;
	Fri, 10 Jul 2026 15:09:11 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DF010E7D8
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 15:09:09 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-92e54f8c051so49299985a.3
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1783696148; x=1784300948; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kfeOD7p/qxHHEIV6dN3ojdA17bZ6I64Gd2Z+QpoWxkg=;
 b=A4eInKcjRnxSTipkdrL/JiK4jLm2hKeYSSmffhcve02wbT4NWF/e8QZ4KWGO9powvg
 B9kQKQSNogsZt1N4mMrdo5llnRiTaez1H7stOIr0ecD0tR2cScEiChyJLssswpsyXaVK
 Ebzk45jG+MrzqGE6dScvAYV/G82rUdiZMUXMvcFES8WlrkdhLjOWq2dPLW0VfE51EFBx
 fCISVfOs4p6qCar3itvJ0gl5xoYd8p74q+a9O0lYWlr+LflVhhV0IIZid5xtHJJpajbE
 t8Znj9CseP1X4gk+P5rFjqye43TbDaEjpgu0dd98u/ym9hQf671E5R1aw3Z/AFyCj5Qu
 8IlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783696148; x=1784300948;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kfeOD7p/qxHHEIV6dN3ojdA17bZ6I64Gd2Z+QpoWxkg=;
 b=Ql8U1mBt3ImHGP83iwnDAQJNHhTRZDLChZib+epH9LM6y5rw5Tf2rzcSWRqDUmJHDm
 PkeR0PYUUTqDuQI+4JKyaAcrQTZf6R6D6KqBdFRzZB5BuLmagOXj3rPYaP7l+Fa/S3O1
 O7PB24IIZ4r4J8CArR1hGnNs+0aIcTKOiiBxlNvdDrooc/1W1NrGzUdMptqeBdP9ppiy
 qGeJoMSgUuCX5P3sUWCkRTYb+YAPbyX7MtkfcnBbqXhAicJbhfEPtdjOMbvxbqkTSHf2
 Yz0UZwKWVCmj1uZGln5hLzmFqFSFdN8OMJboU6OKZCQFpT9hIMdnUlcWPDWngmCqkFnE
 eL3Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqH1OnjZhzr6uaNPuH76teLxpCj1LzctcnlPUQjmz5mXSE3g8ayJUzvyqtmwCNaAy2+8+0AJbY0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS+4/PISHnhyzWo5qvHstdJR27RYtBo6s3QRSh2bu/8FlTkzZN
 rqK05R9f9IiB2EozFHJwQ21njeXGR3QQdQ720vB4BRfCJ6gycIwQVLxSI8ZMmp2ieoA=
X-Gm-Gg: AfdE7ck/+hwuMaoxrKMsIr+PVoJUHzdmKNUC2Cke0nssFsKmBw9TEn9Sl4CT/wFUuEa
 oVpvqVaGm6+EkDgkEr0mxY9yQq8mpTz2VLHd3ERZ+quHAJq0NQsY+ur5f10vD7I46iHgApQcRYI
 Fal+RybeM6SY4qbrSLLYeOjgh7INhXBQU7ZhGHE0Ij2mcH1GOA7ni7f/S50qb5Qj7EWez0KeLSx
 GLYz+FWNzAqY514JsOiCnYz6q6W/Mdgym6WsycEGrffyEOdu51Ff/hMSFaLW2+cz19/bx40TQwj
 78jRrTuCiOyfXbGstSsHF6tQ3LO/KsjOdd1fEu9u7mitqXSScF05ojoH3HQOZ0meJ+dYwgc/quD
 4D/WYL0b4rftlNzX8tkpCDPHutyl6G5ITWPfxOklRPyCTSF88e4AlKhCiXwaLrRC/sWMoRFQNvk
 sCNXixvGYmCsY0CNnCWLiVZiVI9jquuYEAzO6IY58CeMbJYdf2IOkzK+aqnrb9cizfyiK0
X-Received: by 2002:a05:620a:4414:b0:92e:7d53:8e8d with SMTP id
 af79cd13be357-92ecf55964cmr1359477885a.27.1783696148308; 
 Fri, 10 Jul 2026 08:09:08 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F
 (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-92ee5d34f76sm213283985a.35.2026.07.10.08.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 08:09:07 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:09:02 -0400
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
Message-ID: <alELDgm258nhjk3b@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <ea87349d63205bf4c26ea79854f179a9bf8cfb0b.1782735110.git.ljs@kernel.org>
 <akZCg73F-oGzDp1a@pedro-suse.lan> <akZGqclqQ6gS12Vv@lucifer>
 <ak_C_o2ehS17Q5HV@gourry-fedora-PF4VCD3F>
 <alEHy1raICek7imv@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alEHy1raICek7imv@lucifer>
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
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:pfalcato@suse.de,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infrad
 ead.org,m:m.szyprowski@samsung.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[gourry.net];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER(0.00)[gourry@gourry.net,etnaviv-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry-fedora-PF4VCD3F:mid,gourry.net:from_mime,gourry.net:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F1F873C136

On Fri, Jul 10, 2026 at 03:56:33PM +0100, Lorenzo Stoakes wrote:
> On Thu, Jul 09, 2026 at 11:49:18AM -0400, Gregory Price wrote:
> >
> > Silly question:
> 
> There's no such thing :)
>

All my questions are silly.  That's my secret :]

> >
> >    What's the purpose of retaining tags in a non-address value?
> 
> Well if you want to reconstitute an address from it later then that'd be the
> intent, but I'm being hand wavey here for sure.
> 
> Main thing is to retain stuff under the page mask
> 

Right, which ... 

vvvvvv
> > That sounds like there's fragility just waiting to be broken.

If that's an actual issue, then our relationship with tags is painful :[

~Gregory
