Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CE53ADDD2
	for <lists+etnaviv@lfdr.de>; Sun, 20 Jun 2021 11:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8186E0FB;
	Sun, 20 Jun 2021 09:00:28 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF786EABE;
 Sat, 19 Jun 2021 10:50:08 +0000 (UTC)
IronPort-SDR: YaS+D4BoOYzqlPZ+j3HQwvGOHiXB/sGu4CryzsiK0AHI0kQvmLZO323vEz+Hy4s8rXgf3zi5fB
 MCJ4t63IySQQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10019"; a="292293348"
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="292293348"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2021 03:50:08 -0700
IronPort-SDR: o8DFUIQ+V+2TuG58ZEr4r3C8CkDGqWu2uw95vEN7oxLjJ8oaxloSWHsXFVzcWwtJJIbqrt7cig
 dDphpiQ2jjXw==
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="622629219"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2021 03:50:02 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1luYY2-003nwB-1Z; Sat, 19 Jun 2021 13:49:58 +0300
Date: Sat, 19 Jun 2021 13:49:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 3/3] Replace for_each_*_bit_from() with for_each_*_bit()
 where appropriate
Message-ID: <YM3L1kciMw7zqhUp@smile.fi.intel.com>
References: <20210618195735.55933-1-yury.norov@gmail.com>
 <20210618195735.55933-4-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618195735.55933-4-yury.norov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Sun, 20 Jun 2021 09:00:27 +0000
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
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Alexey Klimov <aklimov@redhat.com>, etnaviv@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 12:57:35PM -0700, Yury Norov wrote:
> A couple of kernel functions call for_each_*_bit_from() with start
> bit equal to 0. Replace them with for_each_*_bit().
> 
> No functional changes, but might improve on readability.

...

> --- a/drivers/hwmon/ltc2992.c
> +++ b/drivers/hwmon/ltc2992.c
> @@ -248,8 +248,7 @@ static int ltc2992_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
>  
>  	gpio_status = reg;
>  
> -	gpio_nr = 0;
> -	for_each_set_bit_from(gpio_nr, mask, LTC2992_GPIO_NR) {
> +	for_each_set_bit(gpio_nr, mask, LTC2992_GPIO_NR) {
>  		if (test_bit(LTC2992_GPIO_BIT(gpio_nr), &gpio_status))
>  			set_bit(gpio_nr, bits);
>  	}

I would replace the entire loop by bitmap_replace() call.

Something like
	bitmap_replace(bits, bits, &gpio_status, mask, LTC2992_GPIO_NR);

(Good to split sometimes :-)

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
