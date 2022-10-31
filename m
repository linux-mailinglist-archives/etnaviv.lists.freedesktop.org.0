Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B3B62C85A
	for <lists+etnaviv@lfdr.de>; Wed, 16 Nov 2022 19:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1FF10E4F9;
	Wed, 16 Nov 2022 18:55:15 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7839010E1D6
 for <etnaviv@lists.freedesktop.org>; Mon, 31 Oct 2022 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667218578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlC4H0gmckJZ8E/tDGtmzwjQN3hfnWY+OkvhUHpUiTc=;
 b=U3ZJpY7gT+D5I6PC8JmyfK8Dw6x+JVsuAs+xscF+MzGUN1YMIDKHvipfYKPmXPk4S0tL/W
 aC8ek+KXmhkWnY/IQUdb0yK6nH4sReN+5FWAkMYMvceAq2r702zK8MMpPLLj+lKX5bz0WE
 5uvtZwDnrKq8lTFa6BuklctVPU1qrT8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-JeVJQokYMB-kufTl31_n9Q-1; Mon, 31 Oct 2022 08:16:16 -0400
X-MC-Unique: JeVJQokYMB-kufTl31_n9Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so2539303wmh.6
 for <etnaviv@lists.freedesktop.org>; Mon, 31 Oct 2022 05:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WlC4H0gmckJZ8E/tDGtmzwjQN3hfnWY+OkvhUHpUiTc=;
 b=63obAAcm/deW2q7Ll4hZbY827wEA3cjx5J90nHM7Wl2Vu4lmZKv6ba5ReSW5+1Kv0G
 7yhSnj1G6qVXXfj+5BNbGK56MvvBRX0Clg2zxVYAS8Ha4G7o9QvODknmMtvD1rvYgLyT
 IcEkSrVYkXifIv+/nIhQpRZsLt3Kj7Fw5m5jA154hfGxKkMkOnecPkMiRIphJDzbI6CY
 8wOmD5UDNMIYusLQXveLv5PxAIZqESwe26jvi7/EQBtjgD0u4KIynwq72Vh3+EVRv63C
 ZevHuDBNXyegAiQNFcXuTqKUS3OURogXIguf9Q//AnPUSKNmp0TDQjhdFSXFsxYK4DhZ
 tyXA==
X-Gm-Message-State: ACrzQf24+YmFzzmw3Y1BuepnOvpoYO2caYhadvfuCUoA5A+Qvz9frg11
 w8e7udejsNiyw45QOChxWgxXyI0s7VYnzJOqiR0S2aNIov3DFCDBlAe9RoVicwcYc0u4oLRlr9i
 YT3bp58crIKscjAfyPa+s39MbYw==
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id
 j13-20020a05600c1c0d00b003cf5fd21fd1mr10268840wms.8.1667218575305; 
 Mon, 31 Oct 2022 05:16:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vtgF5OcVzyyhJbAVQv0UtjhNq0IgAK2jPkGsnoYeZKQ/ZE7IsMKsB/emo+io4u+dLlmSgSQ==
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id
 j13-20020a05600c1c0d00b003cf5fd21fd1mr10268814wms.8.1667218575124; 
 Mon, 31 Oct 2022 05:16:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d2-20020a05600c34c200b003b3365b38f9sm7118010wmq.10.2022.10.31.05.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:16:14 -0700 (PDT)
Message-ID: <8423bcd3-84f6-b6c9-914a-c70166e20482@redhat.com>
Date: Mon, 31 Oct 2022 13:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 05/21] drm/imx/dcss: Don't set struct
 drm_driver.output_poll_changed
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 16 Nov 2022 18:55:05 +0000
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
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as DCSS uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

