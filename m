Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hQj5IOEGUWqZ+AIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 16:51:13 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C2373BEA9
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 16:51:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GV0G1PCd;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5F510E1C9;
	Fri, 10 Jul 2026 14:51:11 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B7D10E1C9;
 Fri, 10 Jul 2026 14:51:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 67B6960051;
 Fri, 10 Jul 2026 14:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13DE1F00A3A;
 Fri, 10 Jul 2026 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783695069;
 bh=/adl28F1RG11+xFCTzjhiMT3/quSA/55SrYHe5Xl+as=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=GV0G1PCdVWL/17cPDVZfz86GmBO0VpAcpElRSgqzkFaZnFKsDK6rIw+lxzMvM7oyM
 gOb7BmlLZV+r7XfvVToV0An5vS3DWoiRNZEtakP1kgKdd/pwAzK/AhJrUnpZlFH/ma
 IDgVC6vlNuOfwFAEke1UlfCP3mMcmRNqv1rAQF1Ta5n8CDc7P/kP23VMlYUdFRkbMx
 btXD63gJA5fhI4bndbOxrinkAQhHaNvBor7RN1UECzz5h5BotHDkxdGHR0ZdFn1Wle
 sxRRlN3kLf8W7g8Lmmkim9s7ySe4W1NlivrC5VU8viOWzvoYYPKNt7/4lb6lTsMCz8
 i1PWPp9WBYC/w==
Date: Fri, 10 Jul 2026 15:50:44 +0100
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
Subject: Re: [PATCH 13/30] mm/vma: refactor vmg_adjust_set_range() for clarity
Message-ID: <alEGqHY5GPhT30Ty@lucifer>
References: <cover.1782735110.git.ljs@kernel.org>
 <ada7972f49ea7f1ff1df6d11e4651f270444f8fd.1782735110.git.ljs@kernel.org>
 <ak-70CHGujkI5jJI@gourry-fedora-PF4VCD3F>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak-70CHGujkI5jJI@gourry-fedora-PF4VCD3F>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lucifer:mid,gourry.net:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7C2373BEA9

On Thu, Jul 09, 2026 at 11:18:40AM -0400, Gregory Price wrote:
> On Mon, Jun 29, 2026 at 01:23:24PM +0100, Lorenzo Stoakes wrote:
> > Add comments with ASCII diagrams to describe what we're doing, avoid
> > dubious use of PHYS_PFN(), and use vma_start_pgoff().
> >
> > The most complicated scenario represented here is vmg->__adjust_next_start
> > - when this is set, vmg->[start, end] actually indicate the range to be
> > retained, so take special care to describe this accurately.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>
> Reviewed-by: Gregory Price <gourry@gourry.net>
>
> > +		/*
> > +		 * vmg->start    vmg->end
> > +		 * |             |
> > +		 * v    merge    v
> > +		 * <------------->
> > +		 *         delta
> > +		 *        <------>
> > +		 * |------|----------------|
> > +		 * | prev |    middle      |
> > +		 * |------|----------------|
> > +		 *        ^
> > +		 *        |
> > +		 *        middle->vm_start
> > +		 */
>
> Even with these diagrams, it's a bit difficult to understand what the
> actual intent/result of this chunk is (but that may be a limitation of
> me not spending enough time reading the surrounding code, not a comment
> of your work here).

Yeah I know, I do hope to refactor all this at some point to make it simpler,
but for the time being tried to make the confusing thing at least _slightly_
less confusing :)

>
> ~Gregory

Cheers, Lorenzo

>
> > +		/*
> > +		 *                Originally:
> > +		 *
> > +		 *            vmg->start   vmg->end
> > +		 *            |            |
> > +		 *            v    merge   v
> > +		 *            <------------>
> > +		 *            .            .
> > +		 * merge_existing_range() updates to:
> > +		 *            .            .
> > +		 * vmg->start vmg->end     .
> > +		 * |          |            .
> > +		 * v  retain  v            .
> > +		 * <---------->            .
> > +		 *             delta       .
> > +		 *            <----->      .
> > +		 * |----------------|------|
> > +		 * |    middle      | next |
> > +		 * |----------------|------|
> > +		 *                  ^
> > +		 *                  |
> > +		 *                  next->vm_start
> > +		 */
