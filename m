Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3938BAEFB
	for <lists+etnaviv@lfdr.de>; Fri,  3 May 2024 16:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5403210E495;
	Fri,  3 May 2024 14:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TLm9EY/c";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF77510E495
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2024 14:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714746458;
 bh=UHe4iqg3ixISSEROdWuySYDLP46acSumltKUi+xr7YU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=TLm9EY/cZlTNzrQLSNP8ypQRECto572x50sK48SiZwS2mQXTWwZs3cEtjmCkFAkiy
 QXJBpNW+yGmT5JghqjXX6uU4psZz2FA95dq0xFuoXdEegQa2h/1XBCIjoeUEA9aP26
 b4E8JUkTWSHw01ZK2/cp5T9B6EqI6P2nrMzC27iGclxUfa5PF/7aWDGDeKX+UrYw++
 HEv8lx/S/aXZgnCNi/L179Bd72zwbXrO3vdrLJxq5oBr9V0lQF5AC1b0z377OvAowE
 axP2SvpXulmHP095FvQSxOLtyVAdgk50u5e8nTKh4wY/ifQy6l4kUxJwNBECA/WNLF
 bBhvoZ0WB3urQ==
Received: from [100.120.197.163] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: derekf)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4191D37804B2
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2024 14:27:38 +0000 (UTC)
Message-ID: <6d4f4269-abe3-4d71-b91a-bb951de14627@collabora.com>
Date: Fri, 3 May 2024 09:27:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/etnaviv: during dump, read registers twice
To: etnaviv@lists.freedesktop.org
References: <20240503142255.263399-1-derek.foreman@collabora.com>
Content-Language: en-US
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <20240503142255.263399-1-derek.foreman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

I have a follow up question related to this:

In etnaviv_sched_timedoutjob we only read this register once - we should 
probably read twice there as well?

Further, that function appears to always treat the first timeout as 
spurious because gpu->hangcheck_dma_addr starts as 0? The Vivante 
driver's hang check spins briefly to see if forward progress is being 
made, would that be a better thing to do there?

Thanks,
Derek

On 2024-05-03 09:22, Derek Foreman wrote:
> The vivante driver always reads dma registers twice and discards the first
> value - we need to do this too or at least the DMA address and low/high
> fetches can return wrong results.
>
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_dump.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> index 898f84a0fc30..8a8ca8dcc49a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> @@ -91,6 +91,8 @@ static void etnaviv_core_dump_registers(struct core_dump_iterator *iter,
>   		    read_addr <= VIVS_PM_PULSE_EATER)
>   			read_addr = gpu_fix_power_address(gpu, read_addr);
>   		reg->reg = cpu_to_le32(etnaviv_dump_registers[i]);
> +		/* Discard first read, as it is frequently inaccurate */
> +		gpu_read(gpu, read_addr);
>   		reg->value = cpu_to_le32(gpu_read(gpu, read_addr));
>   	}
>   
