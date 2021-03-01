Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3569B327C62
	for <lists+etnaviv@lfdr.de>; Mon,  1 Mar 2021 11:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C4F89ECD;
	Mon,  1 Mar 2021 10:41:09 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Mon, 01 Mar 2021 10:41:08 UTC
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB306E5BE
 for <etnaviv@lists.freedesktop.org>; Mon,  1 Mar 2021 10:41:08 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603cc13e0000>; Mon, 01 Mar 2021 02:26:06 -0800
Received: from [10.2.62.164] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Mar
 2021 10:26:01 +0000
Message-ID: <1aabe37b-d79b-8456-641d-aaf8fe2c330d@nvidia.com>
Date: Mon, 1 Mar 2021 02:26:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:86.0) Gecko/20100101
 Thunderbird/86.0
Subject: Re: [PATCH 2/2] drm/etnaviv: User FOLL_LONGTERM in userptr
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
 <20210301095254.1946084-2-daniel.vetter@ffwll.ch>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20210301095254.1946084-2-daniel.vetter@ffwll.ch>
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614594366; bh=exhNNc3pakdre3i0a0SDhUPJfxkGN1iLkxkrTKw/W94=;
 h=Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
 To:CC:References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=UQJL1WhWok7lLJdt8zj+iHsK+qgtfEQzZzIGQc25BOTobzTDYUv6XxVNMKZfSihi6
 RxqbWptCLIOHQA8hzV3OIQP921tJn0/NahYqNoiAccvhk/+TGi5bPSoWT/pqLLvkwI
 prg5njWpoM1QcG/4rj22qeEKotWRwDLTQxMHZ6zQhnBxhkVxj1wm/xqF4rKizebltk
 hSN4gSQKYmRSXZje7NC29MX3WDnSfDMbmjBgSKZgASx6t/TYJNqyJJBjGblQ+XJjEk
 goGU6XvY0cMBLaoESHD3vNMonMwKtafKAgLTCmBwtgXZJ+pzAjAYYpDaPuwivVB2jz
 fmZfA9qFsE6mQ==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, etnaviv@lists.freedesktop.org,
 Lucas Stach <l.stach@pengutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On 3/1/21 01:52, Daniel Vetter wrote:
> There's no mmu notifier or anything like that, releasing this pin is
> entirely up to userspace. Hence FOLL_LONGTERM.
> 
> No cc: stable for this patch since a lot of the infrastructure around
> FOLL_LONGETRM (like not allowing it for pages currently sitting in

   ^FOLL_LONGTERM

> ZONE_MOVEABLE before they're migrated) is still being worked on. So
> not big benefits yet.

Yes. Great write-up, that's very clear, and it's exactly where we're at.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA

> 
> Cc: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index a9e696d05b33..db69f19ab5bc 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -689,7 +689,8 @@ static int etnaviv_gem_userptr_get_pages(struct etnaviv_gem_object *etnaviv_obj)
>   		struct page **pages = pvec + pinned;
>   
>   		ret = pin_user_pages_fast(ptr, num_pages,
> -					  FOLL_WRITE | FOLL_FORCE, pages);
> +					  FOLL_WRITE | FOLL_FORCE | FOLL_LONGTERM,
> +					  pages);
>   		if (ret < 0) {
>   			unpin_user_pages(pvec, pinned);
>   			kvfree(pvec);
> 
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
