Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B90EC62E2E
	for <lists+etnaviv@lfdr.de>; Mon, 17 Nov 2025 09:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2092010E2F2;
	Mon, 17 Nov 2025 08:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QwB2YUWj";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC4410E19D
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Nov 2025 08:27:21 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-343dfb673a8so3814371a91.0
 for <etnaviv@lists.freedesktop.org>; Mon, 17 Nov 2025 00:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763368041; x=1763972841; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NqMbp3spyXSyI+jmYwX/g0BR2jSvoVtMc4BEmXvtchY=;
 b=QwB2YUWjSrZ1I7jzdkL0FYFMbf2XKI48CmOMLI1N5LQMue+73zaQu7yeYNmU6ZMmUL
 nMkVLGPPA5fuQCeS1fw7SLPn8O87QPpX1C8SIj8BCB7/3KEwD7Pv0awaRmE3xqBYBiS+
 D5yJN+1iRZ+cAyWrTsUzT/oeJ2r0KPvmiDudB6i/7j9CKqrDSN78Mpyd3ivJgYVVM06y
 rQ6U23695V0kezPU/uMR2h1N92eTxaWcZZYfo+Hn5pAgkAJY1KUaXTwfxNacn4ksGfGR
 daw/RTdL4VFIp8baJnzWC1IC203eREKQepBtZg0N0Qe+cLRFcejdaQ8PdDfY08unmAYt
 m3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763368041; x=1763972841;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqMbp3spyXSyI+jmYwX/g0BR2jSvoVtMc4BEmXvtchY=;
 b=Y7cJm545F8kxcQL24p7Wfh+BGO5UZY6M4ic0/lZsfLTCLO7XcNsBg0tjE7E+SWsxk3
 Qs8OfEPQ2Afr9jTYZuc955zE2KNnQr4jiv8pyig740ugdHEPQSYpM+Qa+T1eTKTA5DGc
 8Q8MnNvCPskJEBJkM+p9XwLvHwdis+YYxxQrLW3ffgs+a2ih/SkxsIzlSUluh/RSXiTg
 Q49+rNbmqSZhW6JhgBT60jocmEWfIK3WXDkovvLO/uENgsuywtRudfGC6gb+kojTpxnY
 4AxR9KlOvYglRm0tYlBstfv/Gp+/ApmhcG1BgILJ+EkdiRGdYlOFJWx7J0qWNrCXDGWJ
 eUbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVEF+D6VSlHThku1cEgZbVpS6zbB5AF2aXA9IT8mJ5GtEc+vAQ8iirH5mgdFA/4bDDNO6edl4t@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyzd4Jo1CvV04wY+YuC6Wpy13IhcUkogJ40Qe94lut/ClfTBaBX
 1HIxR1ZdcHLi3s3bsKvYjxhb7hL2WgY6qEl4NT7wc261nqepQPu/u4g8lozuZAKFht5QnPSIe+G
 /Au8rX14/XZCyp5DfVaOeVIKavnr6Rtc=
X-Gm-Gg: ASbGncvaG1rTKMfz2SkdOKQq9u2/ZBDHVCjeqWYPefEPj8Bd4jnf0z3BHaIo5txtww5
 wsa1kqfO3um3JScIz/mwgl3kLA62D2E5jvfYmDj8paDrFN4UU/DkBq37RrS3UtTajzsCSYWOrx4
 faN6NcIKD3Z2SkfkMPW/hdBa/v6UT3F758gZ+FK/Y+V3FtM4ftvDxhESkjsCVLHLqEApI0KNeHT
 a9caWtv9uovaoulbLgpAn8fEKMlCuHdNA+azCjCkQqzu5n9p+GZiHS1TQY=
X-Google-Smtp-Source: AGHT+IGkMzDEoqI+rt/qEDTD5D9OKmtIrTYe7/+Lovr1JTaZZ98IJ17G6IuDXmpuZQ5NwMT3Xw1q+4mJ9OZDJ2OQMhQ=
X-Received: by 2002:a17:90b:4b49:b0:32e:9f1e:4ee4 with SMTP id
 98e67ed59e1d1-343fa636eb2mr14964476a91.17.1763368040651; Mon, 17 Nov 2025
 00:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20250630202703.13844-1-gert.wollny@collabora.com>
 <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251110144625.18653-4-gert.wollny@collabora.com>
In-Reply-To: <20251110144625.18653-4-gert.wollny@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 17 Nov 2025 09:27:08 +0100
X-Gm-Features: AWmQ_bn0nno6cG5xru1AolIX5ZHV2GGQts5Yy54PHH5Linq0pWMcgulnMZdcLgw
Message-ID: <CAH9NwWev7PjkkSW8N=0aM+3LVOLXajnhs12SPCe6w2ULRA830w@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/etnaviv: Add a new function to emit a series
 of states to cmd stream
To: gert.wollny@collabora.com
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

> From: Gert Wollny <gert.wollny@collabora.com>
>
> v2: fix formatting and remove superfluous masking (Lucas)
>
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> index ae1ba1db6c8a..9388a686edcf 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> @@ -43,6 +43,19 @@ static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer, u32 reg,
>         OUT(buffer, value);
>  }
>
> +static inline void CMD_LOAD_STATES_START(struct etnaviv_cmdbuf *buffer, u32 reg,
> +                                        u32 nvalues)
> +{
> +       u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
> +
> +       buffer->user_size = ALIGN(buffer->user_size, 8);
> +
> +       /* write a register via cmd stream */
> +       OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
> +                           VIV_FE_LOAD_STATE_HEADER_OFFSET(index) |
> +                           VIV_FE_LOAD_STATE_HEADER_COUNT(nvalues));
> +}
> +
>  static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
>  {
>         buffer->user_size = ALIGN(buffer->user_size, 8);
> --
> 2.51.0
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
