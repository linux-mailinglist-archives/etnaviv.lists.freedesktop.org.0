Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1EB62C858
	for <lists+etnaviv@lfdr.de>; Wed, 16 Nov 2022 19:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FB010E4F7;
	Wed, 16 Nov 2022 18:55:14 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9D210E0A0
 for <etnaviv@lists.freedesktop.org>; Fri,  4 Nov 2022 10:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667558243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvcSXdbTIY6j0RtoeMW2Oyvbsf0knEKyh2vmjeJsi+Y=;
 b=fGFMEUbWy7xHDVgNskcS8xydZB7oGn4pcZS3kY484huL6CCiCMoROd9F5N1mGUhYTnUGZb
 R0uTKfwjKVcdp9LhhvGflcDkst1z90jadSNcDRSkesWEknN7GA+LrIHK25DnmRhmbPd7nM
 raMjwSADNPdsYvdjUHw4B3MXzkCCUTQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-DG9n6wddPXyZ2ijqz604oQ-1; Fri, 04 Nov 2022 06:37:20 -0400
X-MC-Unique: DG9n6wddPXyZ2ijqz604oQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so3285901wmb.5
 for <etnaviv@lists.freedesktop.org>; Fri, 04 Nov 2022 03:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FvcSXdbTIY6j0RtoeMW2Oyvbsf0knEKyh2vmjeJsi+Y=;
 b=hUVVFYzPpuBcWjFUi6IlDQlKRSHCqNqUj9htC10NgWabhKyr+6LUclb0WnyZyb2ob+
 TOCGIOPaYGE108aTnfSNc2MhRWv5vBJV9gOQKPEDGNv1J0DhBSMI+/NCPbmxlS05AyLP
 T5QJ1oMZI2HQdTOgwDRyheRzbkfs6/qdUDVKc9M14oPgWk5WPfVCCwNh91SsDcpKLFGl
 TVno1VmmrvHutEOhkXI6P4f04bpfZSYjJMAlZ4AzauF7UC7DEa5IYamBhJrfMAxKhQBs
 rAdWYRxV6nhV75yypvbfEI/897P9DNsm8qEUzM6Cy0KWMZ0YdWoDJnAmKEAyqlxRDwPX
 dYtQ==
X-Gm-Message-State: ACrzQf0ER9i4gUFtCXtvHzpi6fmbdCnYNBO3FTYVqqCdr4YgQoX/cFLv
 B60JcTc+DsbRwW/odOKa7IbE9yeVug8p/qdLoHpvqA3OF2srS3BvZOw5J8zyZBZH/ekE7I+j8RW
 4kJXl9UsIN+bxZ2xahoBrEEW6/g==
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id
 ay42-20020a05600c1e2a00b003c3d7701756mr23539599wmb.134.1667558239645; 
 Fri, 04 Nov 2022 03:37:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LKXhwK5qh8ieFEkCSZgi7mblk9sJOfnr0awtpFbS+pIQGNE9IUSRaCOrs9CG3VpGFJY/xjQ==
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id
 ay42-20020a05600c1e2a00b003c3d7701756mr23539569wmb.134.1667558239379; 
 Fri, 04 Nov 2022 03:37:19 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f15-20020a5d50cf000000b0022e36c1113fsm3031008wrt.13.2022.11.04.03.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 03:37:18 -0700 (PDT)
Message-ID: <ab8358a9-8450-0d49-627f-26afe7ba4f9d@redhat.com>
Date: Fri, 4 Nov 2022 11:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 20/23] drm/fb-helper: Set flag in struct drm_fb_helper
 for leaking physical addresses
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221103151446.2638-1-tzimmermann@suse.de>
 <20221103151446.2638-21-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221103151446.2638-21-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 16 Nov 2022 18:55:06 +0000
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, spice-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On 11/3/22 16:14, Thomas Zimmermann wrote:
> Uncouple the parameter drm_leak_fbdev_smem from the implementation by
> setting a flag in struct drm_fb_helper. This will help to move the
> generic fbdev emulation into its own source file, while keeping the
> parameter in drm_fb_helper.c. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

