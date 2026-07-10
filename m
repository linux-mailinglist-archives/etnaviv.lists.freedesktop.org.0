Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HkhLHkNiUWp3DgMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 23:21:07 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80F973EC13
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 23:21:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=ItAoIiEQ;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A495510E242;
	Fri, 10 Jul 2026 21:21:05 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EED10E1FB
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 21:21:04 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-51bfb91795eso9176201cf.1
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 14:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1783718463; x=1784323263; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kBOMvPUpfjw5N1/s9nVKhxGNiyKZIoN9dPtD8sVM7ho=;
 b=ItAoIiEQ/+GXmABehvT8ccjsETK/kcscSUADgRwIpQ3kzagaklNOavsBujwaAazp+X
 2iqGEh3Wj1EEhyv2y0ihtnEQ7VYHqOqzq7BNkKczn70yMgkC3OpCRr6Lvv6Wi0Uhs9mc
 DoIeu3u9hEOUx83epg2pG0A17JoYdcQ3PEmOcGbZSdGYaxbVkdECN3cOnZf7CUcef0pW
 fQrt9jisB1LBZxf4WvKYEgSGMFvg3vDWI+e9EII7LYF7GN1O0ozUc/Q8O5wzT+8/uSZn
 MHIem/+nvckyYRIDc+0JinlQgtzxpJECD7rh5Cud+qAX03IhSfzsNibAmz6knfTABjQR
 Y5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783718463; x=1784323263;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kBOMvPUpfjw5N1/s9nVKhxGNiyKZIoN9dPtD8sVM7ho=;
 b=c9nqHmPKi50ThlS72PJ4Y9kTCOayrXNheyPGiTCv7hDRhXVXZ1LrUFBPRwMv+Leyil
 orDVqYd/bHEM5jIz4E8bx799AbxKJ28SpZbT2LreDNPdI4CC8k8RK31YIpoK9kJD9ate
 icFhcrdF8zYleSbEI6pVDljRPcNNZLB9AMM4RQA0OWcEAButlT4HXv6VXyd+RShRt1aG
 NXryCB6zEM7xAPyrpCJ38lzHodplUbcEE9L4fIqQn+zcLEWEzIccTeqhApntVEQZeDM2
 UXPOWVlMvwo64hZcHPRjOAPeNgGCz0a5uU+BKwS/HhlNOPG2KL+NjmK22A63Tzv915l9
 XD9g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpDAB9Ytz/l/YjIAeiCsgMnDMDmyYyHHUumfsbqzFHuT0yKgv4bvIR95H6eaDrOlz9wSQJKvSX2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNPplkOpXnnCZzGJSOvRkgtPlUFvmuoOI7wi/p76FIC9nR9fSY
 Cztv6R01flHWbH7LK2qWe1shUEaQtec+vSiDyonImkOgZNcGXnSyB1B9rkI9GEGbHN0=
X-Gm-Gg: AfdE7cnZBOPr0WQa68mSIzK+ddBLuy461opsZS/NAkj9QbzzpU8UBdx2iJYDyNd0iS7
 OVJDR50xpRILchfCMg2G708ItonQgaNMPQYWhsSh5REPwZomrIrRRCLZ4j90zfyBNNVnkTvWZPB
 7UhZfmKV7aGLoXKvhMkpidO7e3+DOOE7oWNNHDVj7zPKZjtkyeuPvkoIx2U6oNP9FNwbyoknkUq
 qNSyjlKSTh4cBf6eGjPd/A5EPAbMZRLRbx46T30foIRwM8PfUwHL3Rtf0d8BHHyJNssrOA6IeVY
 NY7oL9n1VGEy3nU8G4jirSSlVdUwBZbZqp0OsGRHb8Qx3QPNnDmxCAiC2440uvyuDXRg0N8uzLf
 DcZGYuYhs9IxH0pgr2V7ygDa8eWbhOhWYfDD2oxS+TRTDkvX2PwRL3z8j+RWjLUfi3pB6tGIzrY
 0nQ+r70Cij52MqrfIg+od17JpzXH2tDJRzwTjKBU0LY8BKqYfecanWNvDUw+gu1258P/Tn
X-Received: by 2002:ac8:5ace:0:b0:51c:7b11:41ae with SMTP id
 d75a77b69052e-51cbf2dffb2mr6287721cf.74.1783718463047; 
 Fri, 10 Jul 2026 14:21:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F
 (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51caaf621e6sm23894971cf.24.2026.07.10.14.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 14:21:01 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:20:56 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>,
 Lance Yang <lance.yang@linux.dev>, Pedro Falcato <pfalcato@suse.de>,
 Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>,
 Simon Schuster <schuster.simon@siemens-energy.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Dan Williams <djbw@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-perf-users@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, damon@lists.linux.dev,
 iommu@lists.linux.dev, kasan-dev@googlegroups.com,
 linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 kvm@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
Subject: Re: [PATCH v2 26/33] mm/vma: update vma_shrink() to not pass start,
 pgoff parameters
Message-ID: <alFiODVaGwd_wYl4@gourry-fedora-PF4VCD3F>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
 <20260710-b4-pre-scalable-cow-v2-26-2a5aa403d977@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-b4-pre-scalable-cow-v2-26-2a5aa403d977@kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:lance.yang@linux.dev,m:pfalcato@suse.de,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:djbw@kernel.org,m:willy@infradead.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:mhiramat@kernel.org,m:oleg@redhat.com,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:x86@kernel.org,m:hpa@zytor.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:pbonzini@redhat.com,m:shakeel.butt@linux.dev,m:usama.arif@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org
 ,m:linux-parisc@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:damon@lists.linux.dev,m:iommu@lists.linux.dev,m:kasan-dev@googlegroups.com,m:linux-sgx@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux+etnaviv@armlinux.org.uk,m:christiangmeiner@gmail.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gourry@gourry.net,etnaviv-bounces@lists.freedesktop.org];
	DMARC_NA(0.00)[gourry.net];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gourry.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[60];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[gourry@gourry.net,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,surriel.com,linux.dev,suse.de,armlinux.org.uk,siemens-energy.com,hansenpartnership.com,gmx.de,zeniv.linux.org.uk,suse.cz,redhat.com,zytor.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,kvack.org,vger.kernel.org,lists.linux.dev,googlegroups.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry-fedora-PF4VCD3F:mid,gourry.net:from_mime,gourry.net:email,gourry.net:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D80F973EC13

On Fri, Jul 10, 2026 at 09:17:07PM +0100, Lorenzo Stoakes wrote:
> vma_shrink() is only used by relocate_vma_down() to shrink the tail of a
> VMA. Therefore neither the start nor the pgoff parameters make any sense.
> 
> It seemed we were passing the pgoff parameter solely to satisfy
> vma_set_range()'s requirement for pgoff being specified.
> 
> Since vma_set_range() is now isolated to vma.c, we can simply introduce
> __vma_set_range() which sets only vma->vm_[start, end], and invoke this
> instead, removing start and pgoff from vma_shrink() altogether.
> 
> No functional change intended.
> 
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Carry over from v1

Reviewed-by: Gregory Price <gourry@gourry.net>

