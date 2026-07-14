Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w7XqJ1D6VWotxQAAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 14 Jul 2026 10:58:56 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2830F752A20
	for <lists+etnaviv@lfdr.de>; Tue, 14 Jul 2026 10:58:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=b48cJk93;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061C910ECA1;
	Tue, 14 Jul 2026 08:58:55 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A58010E1CC;
 Tue, 14 Jul 2026 02:25:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AC9B660103;
 Tue, 14 Jul 2026 02:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DE31F000E9;
 Tue, 14 Jul 2026 02:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=korg; t=1783995922;
 bh=dxhqIlF4Nmwz7Dc6V0zHplATkq8zPUSt2q/Zds9EZa8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=b48cJk93FtKmn41eVdolAVE/uzQX6EHo01Pnkn0OgnY1vIvJtpHyTyl3C+S0onbuL
 GGMGjmfE2JKefejiLP1J3PzT6MIi/Ch6j4XkBShkTRk15H8PEW9ZSYVvQQ/3WhTIGU
 P9nMjGwkFSOLhnsQCjHUwc7HZ389d5X722tVvR6w=
Date: Mon, 13 Jul 2026 19:25:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Jann Horn <jannh@google.com>, Pedro
 Falcato <pfalcato@suse.de>, Muchun Song <muchun.song@linux.dev>, Oscar
 Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain
 <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Zack Rusin
 <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>, Helge Deller <deller@gmx.de>, Kees Cook
 <kees@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Boris Brezillon <boris.brezillon@collabora.com>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org,
 linux-sound@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 00/13] mm: convert more vm_flags_t users to vma_flags_t
Message-Id: <20260713192519.58113fa69c169d3f5f82e453@linux-foundation.org>
In-Reply-To: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
References: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 14 Jul 2026 08:58:53 +0000
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
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,google.com,suse.com,alpha.franken.de,kvack.org,zeniv.linux.org.uk,suse.cz,linux.alibaba.com,suse.de,linux.dev,nvidia.com,redhat.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,linux.intel.com,ffwll.ch,pengutronix.de,armlinux.org.uk,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,poorly.run,somainline.org,ideasonboard.com,rock-chips.com,sntech.de,collabora.com,chromium.org,broadcom.com,epam.com,gmx.de,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[100];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,linux-foundation.org:from_mime,linux-foundation.org:dkim,linux-foundation.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2830F752A20

On Sat, 11 Jul 2026 19:44:57 +0100 Lorenzo Stoakes <ljs@kernel.org> wrote:

> This series makes further progress in converting usage of the deprecated
> vm_flags_t type to its replacement, vma_flags_t.
> 
> It focuses on mm, though updates some users of mm APIs also.
> 
> It updates:
> 
> * The core do_mmap() code path for VMA mapping.
> * Unmapped area logic.
> * The usage of mm->def_vma_flags.
> * VMA page protection bit logic.
> * General usage of VMA flags in core mm code, mlock, mprotect, mremap.

Added to mm-new, thanks.

And oh my, what a lot of pre-existing issues:
	https://sashiko.dev/#/patchset/20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org


