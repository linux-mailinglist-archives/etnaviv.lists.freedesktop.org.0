Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B021462C865
	for <lists+etnaviv@lfdr.de>; Wed, 16 Nov 2022 19:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE4910E500;
	Wed, 16 Nov 2022 18:55:20 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F27310E1B0
 for <etnaviv@lists.freedesktop.org>; Mon, 31 Oct 2022 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667217579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypYZqoZTsptEoKYiFoPm/p19rfXtb3oU3pAWnCNe+WI=;
 b=g4jMqAp8hrGRUSmI2Hc4CZvOW0ebl46D4m3RfmyoWgCmf2lrlh3KOdMx6WKwy6Wms7BBpu
 9oFmNSmJ1GNJ0f9OwMeNqOTKRyvkNNdkJOzaaR8FxeKcNNwJnA1wtKNxvfiBk4dKz+vhjf
 7Gxvj1aF3r85fgbNn4qnVwdUj3RxF6Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-excSvT_kNXiPm9Ym6CbHnQ-1; Mon, 31 Oct 2022 07:59:38 -0400
X-MC-Unique: excSvT_kNXiPm9Ym6CbHnQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 s7-20020adfa287000000b00236c367fcddso1337236wra.6
 for <etnaviv@lists.freedesktop.org>; Mon, 31 Oct 2022 04:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ypYZqoZTsptEoKYiFoPm/p19rfXtb3oU3pAWnCNe+WI=;
 b=cfHZ/nUb/rptqbWIb5hNGEIMW7DfNMuEewm7qW+CU7vXxJNiRYWfQ5DpZPxScFn3kJ
 Lg+K/jXw4248ySTvbEi00G23ywm1QRRVbAn2tQQdv0ruDqPHMotXFAjNFRJjHTS620l/
 mXgHF/dy+nVGIHD1ppi1zBB9T5GVWvEq8SD7p3GSOlg038SZ+Ums4e0CD86QRfgzobGI
 EERMAxrSxR6I8ciaMSK0SOVXyXuwCvqSu8Ixqbt+wI3LBgooxQIdvrIOdoLDOBDeeTsx
 vkzQKaCkXYSvY3fyeO3ArDLxJoaGlUBhT+mNWmx1uUsprju5xDFbmtxJ+gSl9MwkjCvs
 Hbcg==
X-Gm-Message-State: ACrzQf3xmFtp9DH7cwg25QygHl6teliBsSGW4wmyQI0kYdAe01Y3EjrS
 TBSydkA6tfN5s4f/i0sTweAQZHVPui4O5VnORlVUmwJOyeR36t6JFZ+wSrdpFMAGC74WRqxgsJX
 vmKVGy89xg/zSkE6XiCKPDwu9Bw==
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id
 p14-20020a05600c468e00b003c6f510735cmr7602932wmo.179.1667217577116; 
 Mon, 31 Oct 2022 04:59:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EBETLSD4MBJxdnzTxR3FGu4hBbX2SQFUCrJloOPK1q2LF0w1HzUkYOXWVOI9w84+cugepvA==
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id
 p14-20020a05600c468e00b003c6f510735cmr7602924wmo.179.1667217576945; 
 Mon, 31 Oct 2022 04:59:36 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003c6c182bef9sm7774720wmz.36.2022.10.31.04.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 04:59:36 -0700 (PDT)
Message-ID: <ae69e0c5-05ee-f0ef-a333-53bbaff5c3e8@redhat.com>
Date: Mon, 31 Oct 2022 12:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 02/21] drm/mcde: Don't set struct drm_driver.lastclose
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-3-tzimmermann@suse.de>
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
> Don't set struct drm_driver.lastclose. It's used to restore the
> fbdev console. But as mcde uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See
> the call to drm_client_dev_restore() in drm_lastclose().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

