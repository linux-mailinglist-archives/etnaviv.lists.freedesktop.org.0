Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B328BAEC0
	for <lists+etnaviv@lfdr.de>; Fri,  3 May 2024 16:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BDE112EF0;
	Fri,  3 May 2024 14:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bYKjxa7M";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10FF112EF0
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2024 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714746104;
 bh=kyYoaVIh3GYeTTgayRKIRlCrlFYrCfwzXArpbYfv8z4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=bYKjxa7McIj3aCJFP4iqsvud9UUB2FbpuSSbHuCrjKODNUa+An9vsu0YqD3eFgQ+/
 /alsnDoLasLLBw724sVUjY0+ZXfxkfXscVxq4CzicHOP8ggrYkaTMseqrI/6YseFee
 K7zjGAmr6zlnLLT112ftDg9vpB8b9BDuNx5gIk7khedZlwo3bdfavww97JT8LjcUU9
 KW6WdRRXeZKW+vvX5/urFiBn0GprjTllx7Svf/lvhKWONxGU73LOUFFnp837Y2PpWR
 yxetvK9Hvvcwlvcys5cb0Y5XqIkZupjQR8kXf+q4PPHbX6gpGt7Fxix02Mfrrz9Naf
 1qIBRCemiTP5w==
Received: from [100.120.197.163] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: derekf)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 63F8537804B2
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2024 14:21:44 +0000 (UTC)
Message-ID: <e38c385f-b441-4c4e-b7d9-3ee7aad7f7b0@collabora.com>
Date: Fri, 3 May 2024 09:21:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/etnaviv: dump DMA registers first
To: etnaviv@lists.freedesktop.org
References: <20240501205709.129992-1-derek.foreman@collabora.com>
Content-Language: en-US
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <20240501205709.129992-1-derek.foreman@collabora.com>
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

This patch is wrong, please discard.

The actual thing to do is read each register twice and discard the first 
read, as the vivante driver does when reading dma registers. I'll 
provide a patch to do that shortly.

Thanks,

Derek

On 2024-05-01 15:57, Derek Foreman wrote:
> On at least some hardware, reading one of these other registers has the
> side effect of changing the DMA address register, making dumps much less
> useful.
>
> Move some DMA registers to the top of the list to increase the chance of
> getting a useful devcoredump.
>
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_dump.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> index 898f84a0fc30..920bbf627aa3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> @@ -25,6 +25,9 @@ struct core_dump_iterator {
>   };
>   
>   static const unsigned short etnaviv_dump_registers[] = {
> +	VIVS_FE_DMA_ADDRESS,
> +	VIVS_FE_DMA_LOW,
> +	VIVS_FE_DMA_HIGH,
>   	VIVS_HI_AXI_STATUS,
>   	VIVS_HI_CLOCK_CONTROL,
>   	VIVS_HI_IDLE_STATE,
> @@ -58,9 +61,6 @@ static const unsigned short etnaviv_dump_registers[] = {
>   	VIVS_MC_BUS_CONFIG,
>   	VIVS_FE_DMA_STATUS,
>   	VIVS_FE_DMA_DEBUG_STATE,
> -	VIVS_FE_DMA_ADDRESS,
> -	VIVS_FE_DMA_LOW,
> -	VIVS_FE_DMA_HIGH,
>   	VIVS_FE_AUTO_FLUSH,
>   };
>   
