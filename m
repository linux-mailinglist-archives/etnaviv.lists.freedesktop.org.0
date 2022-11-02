Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4062C84B
	for <lists+etnaviv@lfdr.de>; Wed, 16 Nov 2022 19:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4888E10E0A2;
	Wed, 16 Nov 2022 18:55:08 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0EA10E45B
 for <etnaviv@lists.freedesktop.org>; Wed,  2 Nov 2022 09:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667379914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpYqcUNkPgIA1fAPwB+EiO+Z9dq0ENSiM+RajxMrldI=;
 b=OwwZn5CYF1i3neaZWugrRdQ5juRrx4iEdt9YO0AmyNhu8TmpiI7IThe/DlXDhq1R18wOzT
 mUsD3dlFPmBhx79LiMaXYIdssohVzYbSnsJXuFJBDMaULcAya9BmADVaPisM2ShBS2/KJ5
 iJrRmyirYRPOcQ2tu0dR+9d5ebr2q2M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15-LE4fVEVfOdyxCxOsSjcNTw-1; Wed, 02 Nov 2022 05:05:05 -0400
X-MC-Unique: LE4fVEVfOdyxCxOsSjcNTw-1
Received: by mail-wm1-f70.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so244579wmh.6
 for <etnaviv@lists.freedesktop.org>; Wed, 02 Nov 2022 02:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LpYqcUNkPgIA1fAPwB+EiO+Z9dq0ENSiM+RajxMrldI=;
 b=YujFKP0FywJ2kadl9UOSWLq4DRbsvTJ1MAj39Lsw1ZagYg7XrDfEPfLxfgvNmNZx6s
 /Vi/6raQyLzxNnTTux70Q8UAADUvoh/Co0H62kqDG1ZsUoOEV25BnQCMw6Mbw6T7zLwr
 TcxE6U9fmXwvW8XbOVE5bDaTJs5LQZtuYKONv/CcIW4jJob0IhmWpu/x0SZ7RaF2eCYQ
 OTDmbn3OEBis/dLbOGiJpgevtPSRKN0gl50qOVL8AvRrNcNMRL6d5/WHaZLIOybrFYRz
 3u2tuC2bAVENgVD/aiMGekgCD4YMLsRipdZZrWhY93urh95CRjUNvZjEqru5PVPW0zOy
 cM4A==
X-Gm-Message-State: ACrzQf0Vmti47XSWsOp3O0/U3GmkwtkeYZZTRLAsOZupnHgiInyzzpG4
 gVq6ETd0GsD/ENoEZrLYvatDKEnLMtVvrUxbsDlSfKCBFj0sLTAeoyB1Sr+N9ulHNI+sJqMQQwk
 gCGHTmwgniMwq7o/a0uhv7elfiw==
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr14464168wri.138.1667379904745; 
 Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Ug/7BR+PMLuqwC0wiYVRKEgerXkzKho5yFNKIDT0bC26SnYKpkqpAn1quqQ9FNF9E1JGkLg==
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr14464139wri.138.1667379904487; 
 Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p2-20020a5d4582000000b00228d52b935asm12402687wrq.71.2022.11.02.02.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
Message-ID: <a96d57d8-486d-5a48-a00a-39df6275cbb5@redhat.com>
Date: Wed, 2 Nov 2022 10:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 16/21] drm/fb-helper: Call fb_sync in I/O functions
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-17-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-17-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Call struct fb_ops.fb_sync in drm_fbdev_{read,write}() to mimic the
> behavior of fbdev. Fbdev implementations of fb_read and fb_write in
> struct fb_ops invoke fb_sync to synchronize with outstanding operations
> before I/O. Doing the same in DRM implementations will allow us to use
> them throughout DRM drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

