Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46D3C88E0
	for <lists+etnaviv@lfdr.de>; Wed, 14 Jul 2021 18:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C5F6E424;
	Wed, 14 Jul 2021 16:45:59 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B0A6E424;
 Wed, 14 Jul 2021 16:45:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 946F161183;
 Wed, 14 Jul 2021 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626281158;
 bh=GaEFF31NMUsd5eIM8YUqlRtZlKYwuXRD6uYBGm2L1us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HBLK5hJRKNYHezGrpiMLA/zi5Bhsftm3wcnY+WZwq3V5/wLTAcodA4EBWnqMIqA3O
 Vl/WubSeXTtrJd1tPj0JLMPYecCDSG8Ju//ab9ST2/rufcFtDlFM+zSd268T9p19GW
 CoGrhOZW9nBiQbyqjWoRv6ZBDMZ7WroekWln2/1Xk6As2v7enbpLcfEqDfMtWYp7mr
 B2fSkMyw+NNm0hSD8Ik21GIhNh/EI7oOKxzuZCfSbErXzuDghhcwB60/SV8ln+Wl0S
 UyS/16VNAvpnSRXIKQ7YgKbeSsm53LuHJPlX7qJavXxc1+MLdxBzl/NbVO6uekXXP4
 wZfMIYgeyUMZA==
Date: Wed, 14 Jul 2021 12:45:57 -0400
From: Sasha Levin <sashal@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH AUTOSEL 5.13 001/189] drm/etnaviv: fix NULL check before
 some freeing functions is not needed
Message-ID: <YO8UxRoBHV8avzxz@sashalap>
References: <20210706111409.2058071-1-sashal@kernel.org>
 <099ef9f1cd1b865afd9cb8849d5485776ad1b868.camel@pengutronix.de>
 <b7de6b13-e193-d303-33d9-05c518517711@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7de6b13-e193-d303-33d9-05c518517711@amd.com>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tian Tao <tiantao6@hisilicon.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, Jul 07, 2021 at 01:50:21PM +0200, Christian K=F6nig wrote:
>
>
>Am 07.07.21 um 12:52 schrieb Lucas Stach:
>>Am Dienstag, dem 06.07.2021 um 07:11 -0400 schrieb Sasha Levin:
>>>From: Tian Tao <tiantao6@hisilicon.com>
>>>
>>>[ Upstream commit 7d614ab2f20503ed8766363d41f8607337571adf ]
>>>
>>>fixed the below warning:
>>>drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c:84:2-8: WARNING: NULL check
>>>before some freeing functions is not needed.
>>While the subject contains "fix" this only removes a duplicated NULL
>>check, so the code is correct before and after this change.
>>Is this really stable material? Doesn't this just add commit noise to
>>the stable kernels?
>
>Yeah, agree.
>
>I also had a case where a NULL check was removed in amdgpu and then a =

>bit later back ported to stable.
>
>Maybe just use something like "remove superfluous NULL check".

Sorry for missing that, I'll drop it. Thanks!

-- =

Thanks,
Sasha
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
