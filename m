Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tHYdLRd/RmphXQsAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 17:09:11 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A2E6F938F
	for <lists+etnaviv@lfdr.de>; Thu, 02 Jul 2026 17:09:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=Dkh9RWL9;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=linux.dev
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEDF10F432;
	Thu,  2 Jul 2026 15:09:09 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C0010F432
 for <etnaviv@lists.freedesktop.org>; Thu,  2 Jul 2026 15:09:05 +0000 (UTC)
Message-ID: <cf5a92d3-2c7e-41e6-afed-f2a4c9d1a774@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1783004941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GVgi/IDW6MB0ICHH5yTujujreeH5t5fHN661xjkq/74=;
 b=Dkh9RWL9rMIQE6Ur1L+lFP9fWBIPUF1EBlETBXiV1FwoU/+0F4n7u3+DtwQotZKTkFazHu
 oHVZr/Vs+FAfYKVbUxY57cWOfPctKhbPm5r74IEfkBs57Xoqgu/OIspBSvCnXq9uEYouaN
 h+ygMrTbcJpYGV90L9aTDp+5SWenOgM=
Date: Thu, 2 Jul 2026 23:08:32 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 02/13] mm/vma: update do_mmap() to use vma_flags_t
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: akpm@linux-foundation.org, tsbogend@alpha.franken.de,
 maddy@linux.ibm.com, mpe@ellerman.id.au, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 l.stach@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, peter.griffin@linaro.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, lyude@redhat.com, dakr@kernel.org,
 tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, thierry.reding@kernel.org, mperttunen@nvidia.com,
 jonathanh@nvidia.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 zack.rusin@broadcom.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com,
 deller@gmx.de, bcrl@kvack.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 muchun.song@linux.dev, osalvador@suse.de, david@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, hughd@google.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 jannh@google.com, pfalcato@suse.de, kees@kernel.org, perex@perex.cz,
 tiwai@suse.com, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-fbdev@vger.kernel.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-sound@vger.kernel.org
References: <e0ac58ad2b88ff7e2f0024e3286b2e786f79ca32.1782760670.git.ljs@kernel.org>
 <20260702111531.64883-1-lance.yang@linux.dev> <akZwsS-_cywsXSjL@lucifer>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <akZwsS-_cywsXSjL@lucifer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.l
 inux.org.uk,m:brauner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.org,m:linux-aio@kvack.org,m:linux-fsdev
 el@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lance.yang@linux.dev,etnaviv-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,etnaviv-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linux.dev:dkim,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0A2E6F938F



On 2026/7/2 22:16, Lorenzo Stoakes wrote:
> On Thu, Jul 02, 2026 at 07:15:31PM +0800, Lance Yang wrote:
[...]
>>
>> [...]
>>> diff --git a/mm/mmap.c b/mm/mmap.c
>>> index 46174e706bbe..547352183214 100644
>>> --- a/mm/mmap.c
>>> +++ b/mm/mmap.c
>> [...]
>>> @@ -488,23 +496,27 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
>>> 		 * Check to see if we are violating any seals and update VMA
>>> 		 * flags if necessary to avoid future seal violations.
>>> 		 */
>>> -		err = memfd_check_seals_mmap(file, &vm_flags);
>>> +		err = memfd_check_seals_mmap(file, &vma_flags);
>>> 		if (err)
>>> 			return (unsigned long)err;
>>> 	} else {
>>> 		switch (flags & MAP_TYPE) {
>>> 		case MAP_SHARED:
>>> -			if (vm_flags & (VM_GROWSDOWN|VM_GROWSUP))
>>> +			if (vma_flags_can_grow(&vma_flags))
>>> 				return -EINVAL;
>>> 			/*
>>> 			 * Ignore pgoff.
>>> 			 */
>>> 			pgoff = 0;
>>> -			vm_flags |= VM_SHARED | VM_MAYSHARE;
>>> +			vma_flags_set(&vma_flags, VMA_SHARED_BIT, VMA_MAYSHARE_BIT);
>>> 			break;
>>> -		case MAP_DROPPABLE:
>>> -			if (VM_DROPPABLE == VM_NONE)
>>> +		case MAP_DROPPABLE: {
>>> +			vma_flags_t droppable = VMA_DROPPABLE;
>>> +
>>> +			if (vma_flags_empty(&droppable))
>>> 				return -EOPNOTSUPP;
>>> +			vma_flags_set_mask(&vma_flags, droppable);
>>> +
>>> 			/*
>>> 			 * A locked or stack area makes no sense to be droppable.
>>> 			 *
>>> @@ -515,23 +527,24 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
>>> 			 */
>>> 			if (flags & (MAP_LOCKED | MAP_HUGETLB))
>>> 			        return -EINVAL;
>>> -			if (vm_flags & (VM_GROWSDOWN | VM_GROWSUP))
>>> +			if (vma_flags_can_grow(&vma_flags))
>>> 			        return -EINVAL;
>>>
>>> -			vm_flags |= VM_DROPPABLE;
>>
>> Old code checked VM_GROWSDOWN|VM_GROWSUP before seting VM_DROPPABLE. New
>> code flips that around. Hmm, shouldn't master, just made me look twice ;)
>>
>> Maybe keep old order?
> 
> I guess I feared that defining droppable above then referencing it below would
> be less clear?
> 
> Can move if you feel strongly about it, and sorry for making the move at the
> same time as the general vm_flags_t -> vma_flags_t refactor as it does make that
> less clear...

No need to churn just for me. Thanks :)
