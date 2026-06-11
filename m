Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j1dBABGdKmqNtgMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 11 Jun 2026 13:33:37 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A086715DE
	for <lists+etnaviv@lfdr.de>; Thu, 11 Jun 2026 13:33:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Vexdn9ED;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A02610EE94;
	Thu, 11 Jun 2026 11:33:35 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E5110EE94
 for <etnaviv@lists.freedesktop.org>; Thu, 11 Jun 2026 11:33:34 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2c0c3315c5dso81533875ad.3
 for <etnaviv@lists.freedesktop.org>; Thu, 11 Jun 2026 04:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781177613; cv=none;
 d=google.com; s=arc-20240605;
 b=dQ9w4DSMWO+EQKwLFVTc6Zxyg4Bv7Uq7GCBrePWb8u7dsxjBEmcEYmnAYXQAQEDh9h
 jyKgdSolx+QQ1Oz/hTfJQwbMEHC1wtL0YfXL8do9S9YQwRPOvLgDfh9wuq8ZXh7YBPEP
 7Ia7iDwX/qOOqHQoNnD7vR4JE/X2uHCFzAZFMR5We4Jh2d/EtCUg83YgbR14/wn/t/c3
 33JTYl2Bhfbs2yWpUhAAJabVs08if3gU0yYfR42W0/0quriLjC01wF6oMXv9dO7IYAma
 TuwQg6D9fCOCmCZwVwlk34Rmv25K5nkLYgpnQOucz2Mcrw6I4sgzjH8P7kUIuaD0b8xf
 y1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Dp9QBlKQgTMU863TVI7dtmsZ6ywpDTOUUJKYTfISpko=;
 fh=3sR+htzj5JU8tYSY94qAg0LoapgLJYUhYEUesL6hgRY=;
 b=YSJJBLfqKgcwHXg2K2RxSMkn0Yn5WOH+/AhSINfx+WU+l4aIzrXuqlj/Cj+akDAGYQ
 D4Gqjk66JvYIyilLfdfJgxcBJVh4dCR9x7zgJSbpkMdNxaGoPgIQmX5J9vyJKOKzGBVI
 g9Sag/hW/OVonoks86pHoGGkBXhIW44UlvxAAn807hTuLa82TUtApi05/MXAiSEi4hjg
 KRx1NktHcg8DEFQVg4UhTZEVhkKcoTdP0GFK1iU74JXi1xYv3jw0W1mkPgy9JhpiFnZA
 3RYC5hGSdzlR5fwa6RgmqOVH5tjqS51UF2fq8/ILxljFU/suYDhED1Wo6bGa44xby+8J
 FiPA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781177613; x=1781782413; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dp9QBlKQgTMU863TVI7dtmsZ6ywpDTOUUJKYTfISpko=;
 b=Vexdn9EDZAs2g5OWwHlWeQO/DihI8wMQIVoRD07IvD3cpeO7mBHy0yqXL/0fIEKsNi
 Vn7unn7fyObdkzRj4eE5Us/9Lun5ehunItnnBU6zzpGv/kyZB/kDj7F/6B7Qtq9oxI7Y
 ubvtqt1bklz0D1nCyENIiYKCbS05HEtX10+KLa3UmKRkh1P9tKDXpGDIfjTfRYpT5uI6
 7FtH2Lr1Zm4CwWScB3r5fS5EgrtmDQylNbS7ktb+MDfOThw8qVViUmB7SvEk6LiMwWdK
 K9wEjLlOFuLL+j9ow1bkXo6Ppxe64m6Ss2s4wgsKfSLKFSWS2pFl1NEJ6ak9EHhI7pGN
 ZxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781177613; x=1781782413;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dp9QBlKQgTMU863TVI7dtmsZ6ywpDTOUUJKYTfISpko=;
 b=KLJXh3Pl1tlvaEfPPjzaBUobAu9/5pH4U4TH8iwCMYym/C0SZyCzNyHceDh8PmYZ77
 /LohNa6hzNFiG5l9iEUAavzo0BO+bPSpegsAeQelDCRGml+/+8JthVdSIaOc6UolyAhd
 DFYQe4sLixpH2QM83CarNGN2vDqvlXd81xW26ukLq3rZf6Nwy31bOQJo31tk1b49q/4v
 8ComzrqvQcxJsnlk0plAmGlpXDv92g5z22X6+cfSEyHBSm8166hUi3M8tulcr9t6Es+1
 /5+KSGiHbo4EWSPHuZ/Nqn1y2LCf10ffso0NE5ssep4p8T6B5LMC/GADY29JE68GUK1N
 s+1g==
X-Gm-Message-State: AOJu0Yw8y3xGHKiLSHxtf/qwbNOovHjscMn9B1nv8rRwaYVJAosxpTSf
 XtvoxjITw5KkqPCtEDMUt8L2tRtcEWVq6LlRj9ZwU1ir+aaB1CdN10lF0Ktlu25w1AknrIZ9/M3
 v4zsdMJk1pf0/i/i145QHmc0STQieGuM=
X-Gm-Gg: Acq92OG3fkPEF3CLcXT8Jzf2nQs5gzej08iZ8KwZCspYPbEev4VRWtTSi5qvS6cCaaR
 vXMeWxfnFKpRLq2d17XxBMZf/TXweGWkHTrrGRwQCVpybBZLN+aoTDQaMIvfucOhJ6Dc18sMv10
 OVmnMHFdTs7FH/bGqxC8USt/L+cIRmZvQWz9sPrN6G/KGnQx/64cxURqu3wD2G/wXFwIraSGW2I
 iNtzjnIQI8DVKOzG7/aNJQtsUErgzM/JlgTEXwFslNnl0MRny9UP8U0vymad+5oJQxgkGt+jpLJ
 SNbjy5LyWnTOI0/eoWfvTjlv/GLKRMiw8RWZKeF1Qw27NnOK
X-Received: by 2002:a17:903:37c6:b0:2c0:a360:45e9 with SMTP id
 d9443c01a7336-2c2f2b6ee3amr28266425ad.29.1781177613475; Thu, 11 Jun 2026
 04:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260511085148.652256-1-l.stach@pengutronix.de>
 <20260511085148.652256-2-l.stach@pengutronix.de>
In-Reply-To: <20260511085148.652256-2-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 11 Jun 2026 13:33:20 +0200
X-Gm-Features: AVVi8CdntjkGsiSaOStsg0DvQrN99U9lXn-a3gylizm_-sdLiXemiGC-O5Gz3VI
Message-ID: <CAH9NwWcqF1+=opm0wcVevYwv+9GKm-OZYde+W0Wc4d9PbCjaNg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/etnaviv: check MMUv2 status after reset
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:l.stach@pengutronix.de,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51A086715DE

>
> A fully GPU reset is the only way to disable the MMUv2 and the
> driver depends on the MMU being disabled after a reset to be able
> to properly restart the GPU. Validate this assumption by checking
> that the reset actually did disable the MMU.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 34fff36af450..577fc8131976 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -601,6 +601,23 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
>                         continue;
>                 }
>
> +               /* try resetting again if MMUv2 is not disabled */
> +               if (gpu->identity.minor_features1 & chipMinorFeatures1_MMU_VERSION) {
> +                       if (gpu->sec_mode == ETNA_SEC_KERNEL) {
> +                               if (gpu_read(gpu, VIVS_MMUv2_SEC_CONTROL) &
> +                                   VIVS_MMUv2_SEC_CONTROL_ENABLE) {
> +                                       dev_dbg(gpu->dev, "MMU is not disabled\n");
> +                                       continue;
> +                               }
> +                       } else {
> +                               if (gpu_read(gpu, VIVS_MMUv2_CONTROL) &
> +                                   VIVS_MMUv2_CONTROL_ENABLE) {
> +                                       dev_dbg(gpu->dev, "MMU is not disabled\n");
> +                                       continue;
> +                               }
> +                       }
> +               }
> +
>                 /* enable debug register access */
>                 control &= ~VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
>                 gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, control);
> --
> 2.47.3
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
