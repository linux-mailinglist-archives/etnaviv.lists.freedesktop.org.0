Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qPvgLJp5Qmpe8AkAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Mon, 29 Jun 2026 15:56:42 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086FD6DB9BD
	for <lists+etnaviv@lfdr.de>; Mon, 29 Jun 2026 15:56:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iTLJp6dT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OQmkdJX6;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=c8FwD76f;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0oUBUqEI;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=suse.de
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D923010E8DF;
	Mon, 29 Jun 2026 13:56:40 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01E010E8E0
 for <etnaviv@lists.freedesktop.org>; Mon, 29 Jun 2026 13:56:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DEB08759F1;
 Mon, 29 Jun 2026 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1782741398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wif5TkOjpA/toqZALFTtcoHHCFCpNXj/ZtBXBdU8ofc=;
 b=iTLJp6dTtPrWQYOFyPqFVjgKvk21ha7IRKet+2dRtaNfbz8s93LWr177MlCDv93Lw+QRgD
 7o1KqI/bt1LmxMLueusI/725nXlN/PgmszTfVyozUBHb6Qi8yVL//+sb4YJ/wG4ME16N53
 RIAPJVnA6x+MsLvQe0ziepnssaApP5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1782741398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wif5TkOjpA/toqZALFTtcoHHCFCpNXj/ZtBXBdU8ofc=;
 b=OQmkdJX6vvxzSc5XuWuW7iqNsLRnbCxEqoEScPBsy0F3tBM4YLHsmsqy0SrlxzhAOGwRGX
 xhKvHI8OwBFGKHBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1782741397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wif5TkOjpA/toqZALFTtcoHHCFCpNXj/ZtBXBdU8ofc=;
 b=c8FwD76f1Uwd6aWDKF6SNUoBEdd2a4NDbp8I0kHWLVFS513I7noTYBT1CKVGVbZLiFVsHG
 pD06GBDt/jyh5PfkHZ/Jefe0wtV6rATtUyZvbZuabE43i6zJ0mEIuDaNLER8BdqsrSK6J8
 06M8bH3/rTealQHdY4kKQ1MBnzVyIOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1782741397;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wif5TkOjpA/toqZALFTtcoHHCFCpNXj/ZtBXBdU8ofc=;
 b=0oUBUqEIguzuujB7xM2VRDIjsqG4lJtIX0A2z5+9RGQsCFq29svGSk6y0ZdWklp8T5lnNO
 tljnfWx5rpptL/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4D6E779A8;
 Mon, 29 Jun 2026 13:56:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rfu3MpJ5Qmo6bAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 29 Jun 2026 13:56:34 +0000
Message-ID: <21c4d96a-cd1b-4c65-8a66-2223df3b6109@suse.de>
Date: Mon, 29 Jun 2026 15:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/30] mm: use linear_page_[index, delta]() consistently
To: Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>,
 Simon Schuster <schuster.simon@siemens-energy.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Ankit Agrawal <ankita@nvidia.com>, Alex Williamson <alex@shazbot.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Dan Williams <djbw@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, "Liam R . Howlett" <liam@infradead.org>,
 Matthew Wilcox <willy@infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 SeongJae Park <sj@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>,
 Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>,
 Kees Cook <kees@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-sgx@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kvm@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org,
 iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 damon@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
 Jann Horn <jannh@google.com>
References: <cover.1782735110.git.ljs@kernel.org>
 <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,kernel.org,siemens-energy.com,HansenPartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,suse.de,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infradead.org,m:m.szyprowski@samsung.com,m:pete
 rz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:pfalcato@suse.de,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,etnaviv-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,etnaviv-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:dkim,suse.de:email,suse.de:mid,suse.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 086FD6DB9BD

Hi

Am 29.06.26 um 14:23 schrieb Lorenzo Stoakes:
> There are a number of places where we open code what linear_page_index()
> and linear_page_delta() calculate.
>
> Replace this code with the appropriate functions for consistency.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

For the DRM changes:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

See below for two additional comments.


> ---
>   arch/arm/mm/fault-armv.c              | 2 +-
>   arch/x86/kernel/cpu/sgx/virt.c        | 3 ++-
>   drivers/comedi/comedi_fops.c          | 3 ++-
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 3 ++-
>   drivers/gpu/drm/gma500/gem.c          | 2 +-
>   drivers/gpu/drm/msm/msm_gem.c         | 3 ++-
>   drivers/gpu/drm/omapdrm/omap_gem.c    | 5 +++--
>   drivers/gpu/drm/tegra/gem.c           | 3 ++-
>   drivers/gpu/drm/ttm/ttm_bo_vm.c       | 7 ++++---
>   drivers/vfio/pci/nvgrace-gpu/main.c   | 3 ++-
>   drivers/vfio/pci/vfio_pci_core.c      | 3 ++-
>   mm/nommu.c                            | 2 +-
>   mm/vma.c                              | 2 +-
>   virt/kvm/guest_memfd.c                | 2 +-
>   14 files changed, 26 insertions(+), 17 deletions(-)
>

[...]

>   
>   #include <linux/io.h>
>   #include <linux/uaccess.h>
> @@ -2462,7 +2463,7 @@ static int comedi_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   {
>   	struct comedi_buf_map *bm = vma->vm_private_data;
>   	unsigned long offset =
> -	    addr - vma->vm_start + (vma->vm_pgoff << PAGE_SHIFT);
> +	    addr - vma->vm_start + (vma_start_pgoff(vma) << PAGE_SHIFT);

This doesn't seem to belong here.

>   
>   	if (len < 0)
>   		return -EINVAL;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index b0436a1e103f..2e4d6d117ee2 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_prime.h>
>   #include <drm/drm_print.h>
>   #include <linux/dma-mapping.h>
> +#include <linux/pagemap.h>
>   #include <linux/shmem_fs.h>
>   #include <linux/spinlock.h>
>   #include <linux/vmalloc.h>
> @@ -188,7 +189,7 @@ static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
>   	}
>   
>   	/* We don't use vmf->pgoff since that has the fake offset: */
> -	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> +	pgoff = linear_page_delta(vma, vmf->address);
>   
>   	pfn = page_to_pfn(pages[pgoff]);
>   
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index 88f1e86c8903..2708e8c68f4c 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -288,7 +288,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
>   
>   	/* Page relative to the VMA start - we must calculate this ourselves
>   	   because vmf->pgoff is the fake GEM offset */
> -	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> +	page_offset = linear_page_delta(vma, vmf->address);
>   
>   	/* CPU view of the page, don't go via the GART for CPU writes */
>   	if (pobj->stolen)
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index efd3d3c9a449..cbf723a5d86f 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -9,6 +9,7 @@
>   #include <linux/spinlock.h>
>   #include <linux/shmem_fs.h>
>   #include <linux/dma-buf.h>
> +#include <linux/pagemap.h>
>   
>   #include <drm/drm_dumb_buffers.h>
>   #include <drm/drm_prime.h>
> @@ -360,7 +361,7 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
>   	}
>   
>   	/* We don't use vmf->pgoff since that has the fake offset: */
> -	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> +	pgoff = linear_page_delta(vma, vmf->address);
>   
>   	pfn = page_to_pfn(pages[pgoff]);
>   
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index 8e013e4f2c6b..00404fb6c29a 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <linux/dma-mapping.h>
> +#include <linux/pagemap.h>
>   #include <linux/seq_file.h>
>   #include <linux/shmem_fs.h>
>   #include <linux/spinlock.h>
> @@ -359,7 +360,7 @@ static vm_fault_t omap_gem_fault_1d(struct drm_gem_object *obj,
>   	pgoff_t pgoff;
>   
>   	/* We don't use vmf->pgoff since that has the fake offset: */
> -	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> +	pgoff = linear_page_delta(vma, vmf->address);
>   
>   	if (omap_obj->pages) {
>   		omap_gem_cpu_sync_page(obj, pgoff);
> @@ -407,7 +408,7 @@ static vm_fault_t omap_gem_fault_2d(struct drm_gem_object *obj,
>   	const int m = DIV_ROUND_UP(omap_obj->width << fmt, PAGE_SIZE);
>   
>   	/* We don't use vmf->pgoff since that has the fake offset: */
> -	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> +	pgoff = linear_page_delta(vma, vmf->address);
>   
>   	/*
>   	 * Actual address we start mapping at is rounded down to previous slot
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 436394e04812..1d8d27a5ea89 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -13,6 +13,7 @@
>   #include <linux/dma-buf.h>
>   #include <linux/iommu.h>
>   #include <linux/module.h>
> +#include <linux/pagemap.h>
>   #include <linux/vmalloc.h>
>   
>   #include <drm/drm_drv.h>
> @@ -564,7 +565,7 @@ static vm_fault_t tegra_bo_fault(struct vm_fault *vmf)
>   	if (!bo->pages)
>   		return VM_FAULT_SIGBUS;
>   
> -	offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> +	offset = linear_page_delta(vma, vmf->address);
>   	page = bo->pages[offset];
>   
>   	return vmf_insert_page(vma, vmf->address, page);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index a80510489c45..88babf435ac2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -32,6 +32,7 @@
>   #define pr_fmt(fmt) "[TTM] " fmt
>   
>   #include <linux/export.h>
> +#include <linux/pagemap.h>
>   
>   #include <drm/ttm/ttm_bo.h>
>   #include <drm/ttm/ttm_placement.h>
> @@ -208,9 +209,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   	if (unlikely(err != 0))
>   		return VM_FAULT_SIGBUS;
>   
> -	page_offset = ((address - vma->vm_start) >> PAGE_SHIFT) +
> -		vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node);
> -	page_last = vma_pages(vma) + vma->vm_pgoff -
> +	page_offset = linear_page_index(vma, address) -
> +		drm_vma_node_start(&bo->base.vma_node);
> +	page_last = vma_end_pgoff(vma) -
>   		drm_vma_node_start(&bo->base.vma_node);

Not your fault, but page_last seems misnamed here.

Best regards
Thomas

>   
>   	if (unlikely(page_offset >= PFN_UP(bo->base.size)))
> diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
> index d07dcacb76bd..963fd8ded20d 100644
> --- a/drivers/vfio/pci/nvgrace-gpu/main.c
> +++ b/drivers/vfio/pci/nvgrace-gpu/main.c
> @@ -11,6 +11,7 @@
>   #include <linux/jiffies.h>
>   #include <linux/sched.h>
>   #include <linux/pci-p2pdma.h>
> +#include <linux/pagemap.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/memory-failure.h>
>   
> @@ -385,7 +386,7 @@ static unsigned long addr_to_pgoff(struct vm_area_struct *vma,
>   	u64 pgoff = vma->vm_pgoff &
>   		((1U << (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
>   
> -	return ((addr - vma->vm_start) >> PAGE_SHIFT) + pgoff;
> +	return linear_page_delta(vma, addr) + pgoff;
>   }
>   
>   static vm_fault_t nvgrace_gpu_vfio_pci_huge_fault(struct vm_fault *vmf,
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index a28f1e99362c..55d4937d495a 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -19,6 +19,7 @@
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/notifier.h>
> +#include <linux/pagemap.h>
>   #include <linux/pci.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/slab.h>
> @@ -1727,7 +1728,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
>   	struct vm_area_struct *vma = vmf->vma;
>   	struct vfio_pci_core_device *vdev = vma->vm_private_data;
>   	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
> -	unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
> +	unsigned long pgoff = linear_page_delta(vma, addr);
>   	unsigned long pfn = vma_to_pfn(vma) + pgoff;
>   	vm_fault_t ret = VM_FAULT_FALLBACK;
>   
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 60560b2c457e..7333d855e974 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -1332,7 +1332,7 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>   	*region = *vma->vm_region;
>   	new->vm_region = region;
>   
> -	npages = (addr - vma->vm_start) >> PAGE_SHIFT;
> +	npages = linear_page_delta(vma, addr);
>   
>   	if (new_below) {
>   		region->vm_top = region->vm_end = new->vm_end = addr;
> diff --git a/mm/vma.c b/mm/vma.c
> index ee3a8ca13d07..185d07397ca6 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -517,7 +517,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>   		new->vm_end = addr;
>   	} else {
>   		new->vm_start = addr;
> -		new->vm_pgoff += ((addr - vma->vm_start) >> PAGE_SHIFT);
> +		new->vm_pgoff += linear_page_delta(vma, addr);
>   	}
>   
>   	err = -ENOMEM;
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index db57c5766ab6..f0e5da490866 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -440,7 +440,7 @@ static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpo
>   static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
>   					     unsigned long addr, pgoff_t *ilx)
>   {
> -	pgoff_t pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +	pgoff_t pgoff = linear_page_index(vma, addr);
>   	struct inode *inode = file_inode(vma->vm_file);
>   
>   	*ilx = inode->i_ino;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


