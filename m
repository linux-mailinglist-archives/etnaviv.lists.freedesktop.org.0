Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6018ABEB2
	for <lists+etnaviv@lfdr.de>; Sun, 21 Apr 2024 09:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B352211224F;
	Sun, 21 Apr 2024 07:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="iAffYuQa";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F9511224C
 for <etnaviv@lists.freedesktop.org>; Sun, 21 Apr 2024 07:11:13 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-618874234c9so37331297b3.0
 for <etnaviv@lists.freedesktop.org>; Sun, 21 Apr 2024 00:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1713683472;
 x=1714288272; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=evj6QeiKgaPz6ngMgofjmH590OyUhTsBSPNeTpTFRVY=;
 b=iAffYuQaebZm2Q1YSz3MD4Hz63hWf0pA8LeFS2Kszwg6TulahZhMTj7Umqjr0dRbuV
 IwwcQdSkSkn8uH3+1J30jLjT3y3rfZZLcBSbuXTUDwXDxaIxUbyKp7HDJ0Ue7uuQshc8
 6oPFgrZukNJM4LB1+UmgfAuhTruQ7BAioEfYehCACnbc0Jvo+Brd4kC/YSw/OOVXEIg6
 95sOyplsk6wUWc6zOsWqWOy/koqPB+6nE3yAlE0tmqWMoBviMjq9ol6BfRsf4hk9xMaL
 QA1pF8EXH2tw9PnhnrS0N+oiHbRPiipXJJFenou1yBGZKEUpqvdJbHp/AEyUHUlcRr2w
 HegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713683472; x=1714288272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=evj6QeiKgaPz6ngMgofjmH590OyUhTsBSPNeTpTFRVY=;
 b=pZTV0ntzsu8zMZ3Nyaictoe++Gb865cyE1LhxWftUAFeo9+M0vzejMydIycW8t0S7C
 o1Z8qlMxMqpoTHxmD0o8hPASOxeLR5mV+4kswHclUm0bK6AqejU5J6d7LFPuiNkRu/Dm
 u9guf/8BQTozrsDRAFsnjIICm0HNxCPyj96ziOdWvYM9xnHJwrY2ls2FvdTmZME2mFya
 wVcVzFMC9cyyTgOZwJqggS5CHpyy2Wi6fRX7bzby12m5V7q7RpetR9xOfcM+4znHhDU6
 LU4lR6djwd86XgC0tajK0uh6Hu7JJ7X35/VsZfYfXUgP1arRnWb3JQOHbqxU0QA1hC0k
 CPuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj2bRvXaWCFEDzNlXm0alPQ5Tku/XU0JibFSs8gGhqLd5LHQvKaDNAQapXG40C5GbQkFz1hyujvRP+tt1qYn0TTAzgTB0H53Tv+as/sQ==
X-Gm-Message-State: AOJu0YwwQUMxMbVZ3L3g/y6Ns/1rw3It07VqskpJpVRbzgSn08pttfqg
 2Rh+7x3Jz84CS5REnH7njeXJBqLAe6Jty2eCJbjMR4GBcKHBKRAnzDuZvmCNyt3oQVye8KmPdbB
 QGqc=
X-Google-Smtp-Source: AGHT+IEUMPZ0wIkIicOkhEWqo4uMJiYP+xxGRjROL1Ku7fAU1cYnpEG4qdiFjoT8FkNGkb8akQmyZg==
X-Received: by 2002:a05:690c:6410:b0:618:1034:f4ef with SMTP id
 hr16-20020a05690c641000b006181034f4efmr7023558ywb.16.1713683472494; 
 Sun, 21 Apr 2024 00:11:12 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 x30-20020a81af5e000000b0061b1f325755sm1473179ywj.123.2024.04.21.00.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Apr 2024 00:11:12 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-de45e5c3c68so3679124276.0; 
 Sun, 21 Apr 2024 00:11:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7IkmfEcj8jg8VJrcQbwaUY6QfYxvxP9W7D+4uYFldldI26qJdZtIOhid+elXoJvkzz0Mn018MVpRw/eFcz0yhINJ1ZUeLC/DXibkUbPB2KMDIyen3X5NoWrZ+ihjZWwc1YPaXTFXHpEKI0VbheA==
X-Received: by 2002:a25:d354:0:b0:dcb:e0dc:67ee with SMTP id
 e81-20020a25d354000000b00dcbe0dc67eemr6744553ybf.45.1713683471702; Sun, 21
 Apr 2024 00:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240420134159.110509-1-christian.gmeiner@gmail.com>
In-Reply-To: <20240420134159.110509-1-christian.gmeiner@gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 21 Apr 2024 09:11:00 +0200
X-Gmail-Original-Message-ID: <CAAObsKBT3udZ-=iKRq_ekoxxnmseR_ZH59WvNFzdywWx2E_W3A@mail.gmail.com>
Message-ID: <CAAObsKBT3udZ-=iKRq_ekoxxnmseR_ZH59WvNFzdywWx2E_W3A@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/etnaviv: Expose a few more chipspecs to
 userspace"
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian Gmeiner <cgmeiner@igalia.com>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Agreed, thanks for doing this, Christian.

Reviewed-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Cheers,

Tomeu

On Sat, Apr 20, 2024 at 3:41=E2=80=AFPM Christian Gmeiner
<christian.gmeiner@gmail.com> wrote:
>
> From: Christian Gmeiner <cgmeiner@igalia.com>
>
> This reverts commit 1dccdba084897443d116508a8ed71e0ac8a031a4.
>
> In userspace a different approach was choosen - hwdb. As a result, there
> is no need for these values.
>
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 20 ---------------
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 12 ---------
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 34 --------------------------
>  include/uapi/drm/etnaviv_drm.h         |  5 ----
>  4 files changed, 71 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 734412aae94d..e47e5562535a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -164,26 +164,6 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u=
32 param, u64 *value)
>                 *value =3D gpu->identity.eco_id;
>                 break;
>
> -       case ETNAVIV_PARAM_GPU_NN_CORE_COUNT:
> -               *value =3D gpu->identity.nn_core_count;
> -               break;
> -
> -       case ETNAVIV_PARAM_GPU_NN_MAD_PER_CORE:
> -               *value =3D gpu->identity.nn_mad_per_core;
> -               break;
> -
> -       case ETNAVIV_PARAM_GPU_TP_CORE_COUNT:
> -               *value =3D gpu->identity.tp_core_count;
> -               break;
> -
> -       case ETNAVIV_PARAM_GPU_ON_CHIP_SRAM_SIZE:
> -               *value =3D gpu->identity.on_chip_sram_size;
> -               break;
> -
> -       case ETNAVIV_PARAM_GPU_AXI_SRAM_SIZE:
> -               *value =3D gpu->identity.axi_sram_size;
> -               break;
> -
>         default:
>                 DBG("%s: invalid param: %u", dev_name(gpu->dev), param);
>                 return -EINVAL;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.h
> index 7d5e9158e13c..197e0037732e 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -54,18 +54,6 @@ struct etnaviv_chip_identity {
>         /* Number of Neural Network cores. */
>         u32 nn_core_count;
>
> -       /* Number of MAD units per Neural Network core. */
> -       u32 nn_mad_per_core;
> -
> -       /* Number of Tensor Processing cores. */
> -       u32 tp_core_count;
> -
> -       /* Size in bytes of the SRAM inside the NPU. */
> -       u32 on_chip_sram_size;
> -
> -       /* Size in bytes of the SRAM across the AXI bus. */
> -       u32 axi_sram_size;
> -
>         /* Size of the vertex cache. */
>         u32 vertex_cache_size;
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etn=
aviv/etnaviv_hwdb.c
> index d8e7334de8ce..8665f2658d51 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> @@ -17,10 +17,6 @@ static const struct etnaviv_chip_identity etnaviv_chip=
_identities[] =3D {
>                 .thread_count =3D 128,
>                 .shader_core_count =3D 1,
>                 .nn_core_count =3D 0,
> -               .nn_mad_per_core =3D 0,
> -               .tp_core_count =3D 0,
> -               .on_chip_sram_size =3D 0,
> -               .axi_sram_size =3D 0,
>                 .vertex_cache_size =3D 8,
>                 .vertex_output_buffer_size =3D 1024,
>                 .pixel_pipes =3D 1,
> @@ -52,11 +48,6 @@ static const struct etnaviv_chip_identity etnaviv_chip=
_identities[] =3D {
>                 .register_max =3D 64,
>                 .thread_count =3D 256,
>                 .shader_core_count =3D 1,
> -               .nn_core_count =3D 0,
> -               .nn_mad_per_core =3D 0,
> -               .tp_core_count =3D 0,
> -               .on_chip_sram_size =3D 0,
> -               .axi_sram_size =3D 0,
>                 .vertex_cache_size =3D 8,
>                 .vertex_output_buffer_size =3D 512,
>                 .pixel_pipes =3D 1,
> @@ -89,10 +80,6 @@ static const struct etnaviv_chip_identity etnaviv_chip=
_identities[] =3D {
>                 .thread_count =3D 512,
>                 .shader_core_count =3D 2,
>                 .nn_core_count =3D 0,
> -               .nn_mad_per_core =3D 0,
> -               .tp_core_count =3D 0,
> -               .on_chip_sram_size =3D 0,
> -               .axi_sram_size =3D 0,
>                 .vertex_cache_size =3D 16,
>                 .vertex_output_buffer_size =3D 1024,
>                 .pixel_pipes =3D 1,
> @@ -125,10 +112,6 @@ static const struct etnaviv_chip_identity etnaviv_ch=
ip_identities[] =3D {
>                 .thread_count =3D 512,
>                 .shader_core_count =3D 2,
>                 .nn_core_count =3D 0,
> -               .nn_mad_per_core =3D 0,
> -               .tp_core_count =3D 0,
> -               .on_chip_sram_size =3D 0,
> -               .axi_sram_size =3D 0,
>                 .vertex_cache_size =3D 16,
>                 .vertex_output_buffer_size =3D 1024,
>                 .pixel_pipes =3D 1,
> @@ -160,11 +143,6 @@ static const struct etnaviv_chip_identity etnaviv_ch=
ip_identities[] =3D {
>                 .register_max =3D 64,
>                 .thread_count =3D 512,
>                 .shader_core_count =3D 2,
> -               .nn_core_count =3D 0,
> -               .nn_mad_per_core =3D 0,
> -               .tp_core_count =3D 0,
> -               .on_chip_sram_size =3D 0,
> -               .axi_sram_size =3D 0,
>                 .vertex_cache_size =3D 16,
>                 .vertex_output_buffer_size =3D 1024,
>                 .pixel_pipes =3D 1,
> @@ -197,10 +175,6 @@ static const struct etnaviv_chip_identity etnaviv_ch=
ip_identities[] =3D {
>                 .thread_count =3D 1024,
>                 .shader_core_count =3D 4,
>                 .nn_core_count =3D 0,
> -               .nn_mad_per_core =3D 0,
> -               .tp_core_count =3D 0,
> -               .on_chip_sram_size =3D 0,
> -               .axi_sram_size =3D 0,
>                 .vertex_cache_size =3D 16,
>                 .vertex_output_buffer_size =3D 1024,
>                 .pixel_pipes =3D 2,
> @@ -233,10 +207,6 @@ static const struct etnaviv_chip_identity etnaviv_ch=
ip_identities[] =3D {
>                 .thread_count =3D 256,
>                 .shader_core_count =3D 1,
>                 .nn_core_count =3D 8,
> -               .nn_mad_per_core =3D 64,
> -               .tp_core_count =3D 4,
> -               .on_chip_sram_size =3D 524288,
> -               .axi_sram_size =3D 1048576,
>                 .vertex_cache_size =3D 16,
>                 .vertex_output_buffer_size =3D 1024,
>                 .pixel_pipes =3D 1,
> @@ -269,10 +239,6 @@ static const struct etnaviv_chip_identity etnaviv_ch=
ip_identities[] =3D {
>                 .thread_count =3D 256,
>                 .shader_core_count =3D 1,
>                 .nn_core_count =3D 6,
> -               .nn_mad_per_core =3D 64,
> -               .tp_core_count =3D 3,
> -               .on_chip_sram_size =3D 262144,
> -               .axi_sram_size =3D 0,
>                 .vertex_cache_size =3D 16,
>                 .vertex_output_buffer_size =3D 1024,
>                 .pixel_pipes =3D 1,
> diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_dr=
m.h
> index d87410a8443a..af024d90453d 100644
> --- a/include/uapi/drm/etnaviv_drm.h
> +++ b/include/uapi/drm/etnaviv_drm.h
> @@ -77,11 +77,6 @@ struct drm_etnaviv_timespec {
>  #define ETNAVIV_PARAM_GPU_PRODUCT_ID                0x1c
>  #define ETNAVIV_PARAM_GPU_CUSTOMER_ID               0x1d
>  #define ETNAVIV_PARAM_GPU_ECO_ID                    0x1e
> -#define ETNAVIV_PARAM_GPU_NN_CORE_COUNT             0x1f
> -#define ETNAVIV_PARAM_GPU_NN_MAD_PER_CORE           0x20
> -#define ETNAVIV_PARAM_GPU_TP_CORE_COUNT             0x21
> -#define ETNAVIV_PARAM_GPU_ON_CHIP_SRAM_SIZE         0x22
> -#define ETNAVIV_PARAM_GPU_AXI_SRAM_SIZE             0x23
>
>  #define ETNA_MAX_PIPES 4
>
> --
> 2.44.0
>
