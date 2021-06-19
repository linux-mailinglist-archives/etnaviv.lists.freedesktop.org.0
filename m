Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A623ADDD3
	for <lists+etnaviv@lfdr.de>; Sun, 20 Jun 2021 11:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9336E0FF;
	Sun, 20 Jun 2021 09:00:28 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718336EAC1;
 Sat, 19 Jun 2021 10:55:23 +0000 (UTC)
IronPort-SDR: 4tCpcAUB4LJ06rnKRnHtyJuyP2XYYmL0wnSiiZjZyKY2G2sPiyQX8eNlm6dwnTIjX5VlXnTidv
 VadkdlBszNOg==
X-IronPort-AV: E=McAfee;i="6200,9189,10019"; a="267807187"
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="267807187"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2021 03:55:20 -0700
IronPort-SDR: shIIIg1/X9y9YzjyUD4diASIuTOccwffi+cXRobJIdn5PTiaDhYgW62q3GSmj5H/kfj4fRXWjk
 9a8+0jkpK1KQ==
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="443814730"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2021 03:55:15 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1luYd4-003nzI-M1; Sat, 19 Jun 2021 13:55:10 +0300
Date: Sat, 19 Jun 2021 13:55:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 3/3] Replace for_each_*_bit_from() with for_each_*_bit()
 where appropriate
Message-ID: <YM3NDrgF3znR+/4z@smile.fi.intel.com>
References: <20210618195735.55933-1-yury.norov@gmail.com>
 <20210618195735.55933-4-yury.norov@gmail.com>
 <YM3L1kciMw7zqhUp@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YM3L1kciMw7zqhUp@smile.fi.intel.com>
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

On Sat, Jun 19, 2021 at 01:49:58PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 18, 2021 at 12:57:35PM -0700, Yury Norov wrote:
> > A couple of kernel functions call for_each_*_bit_from() with start
> > bit equal to 0. Replace them with for_each_*_bit().
> > 
> > No functional changes, but might improve on readability.
> 
> ...
> 
> > --- a/drivers/hwmon/ltc2992.c
> > +++ b/drivers/hwmon/ltc2992.c
> > @@ -248,8 +248,7 @@ static int ltc2992_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
> >  
> >  	gpio_status = reg;
> >  
> > -	gpio_nr = 0;
> > -	for_each_set_bit_from(gpio_nr, mask, LTC2992_GPIO_NR) {
> > +	for_each_set_bit(gpio_nr, mask, LTC2992_GPIO_NR) {
> >  		if (test_bit(LTC2992_GPIO_BIT(gpio_nr), &gpio_status))
> >  			set_bit(gpio_nr, bits);
> >  	}
> 
> I would replace the entire loop by bitmap_replace() call.
> 
> Something like
> 	bitmap_replace(bits, bits, &gpio_status, mask, LTC2992_GPIO_NR);

Okay, it wouldn't work directly because it involves LTC2992_GPIO_BIT()
macro. So, it rather some kind of bitmap_remap().

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
