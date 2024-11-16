Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F329CFD1B
	for <lists+etnaviv@lfdr.de>; Sat, 16 Nov 2024 08:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B295E10E033;
	Sat, 16 Nov 2024 07:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q7Qbk0tA";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BB610E033
 for <etnaviv@lists.freedesktop.org>; Sat, 16 Nov 2024 07:59:35 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-431616c23b5so14427405e9.0
 for <etnaviv@lists.freedesktop.org>; Fri, 15 Nov 2024 23:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731743973; x=1732348773; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xrsdExZKqTlwoTRHJD0ZdQo7yx2uU25FrNS0bU2S5+Y=;
 b=Q7Qbk0tAfQacCYVxaAHGdGXAjbA4Pryd2/3kM68Dih8R6A+lqTK3L96je4Gns9ZHn/
 UdHzCW41m139tReRYmSq3YigkQbEwuHYvyHlSIAcgWAygTFKyxmJklDnElfO6AtDN5FM
 /r5yeYrYYwczovYwZiAl4Kns7oJPD/JlHqNXEc+/1YZe5sbVmDgwa9vtiviB9YFjs56e
 C8Ku8CycCSzYp798iE4hljUdc64XEhJ4ljhabm3dCHQYcRKW2/CqJxQWQ3ScjqLgIsnh
 RF+4wpZ+ryWDom42KaB10BT4/rhnLpm+7XPmCpc4VkKd7RFnp5sVCqzFLizRMuJ91fCf
 SVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731743973; x=1732348773;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xrsdExZKqTlwoTRHJD0ZdQo7yx2uU25FrNS0bU2S5+Y=;
 b=iFHgVHvCWmXylZYJcPm7VNJpXWhjYEoYMJkpo3XuHJdwFd1zHVJXMpYcqLNiNMfhpA
 mC24Ok9DQ7tOJiwkv3ja6Qh4iCu268Ew54H3HMqxQwzM3/qs0LINP9BBAyuQqwBBZoZH
 QUQu+OVjhAtLZXKR0TrZ2747s5KCNlYA1uuE0EX194gzGBKI7GuACGdDKzJH94SeakuV
 7AAJqaZt0toZ4sWT2/mSK/7rCtYitOySIMDWF+oZG8oVu/PE0KQR5ciWZv1hrdK9Y/df
 SblmUx0yxn0Dupz7kSBEMVTIF6e2T5oUuH5bUaSx02Cvd2NiUkeyMxgusc5/RM65nkcQ
 uJtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI5eerrHSSuhBcLOAlr8iZq+7rGDe3Q9pAAzIRqQgmC04NnCu6WfNQrkxDL07GdCBXu5Dcz3Rl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlHeg/XEbSOFVBODNGDMesWJhbzI8DBjewGFsTVp5Wia+HIJNJ
 QSwti0JbWo40NKS71P79whWRHkvglCR0xD9QAMQmnO3qHndWjFLrwJEqpYsizno=
X-Google-Smtp-Source: AGHT+IHwPca/r8TengkDOJBkzNMy5+IC+M/DjfY5vaIp0XwfqGKX+JdkORZRtZVKPaDZkydKQ4+r2A==
X-Received: by 2002:a05:600c:19cb:b0:431:559d:4103 with SMTP id
 5b1f17b1804b1-432defe3203mr49400585e9.7.1731743973417; 
 Fri, 15 Nov 2024 23:59:33 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab806e1sm81445685e9.20.2024.11.15.23.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 23:59:32 -0800 (PST)
Date: Sat, 16 Nov 2024 10:59:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Ofir Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 linux-mm@kvack.org, linux-bluetooth@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 ceph-devel@vger.kernel.org, live-patching@vger.kernel.org,
 linux-sound@vger.kernel.org, etnaviv@lists.freedesktop.org,
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH 19/22] livepatch: Convert timeouts to secs_to_jiffies()
Message-ID: <896c656f-6d8c-4337-8464-7557c43a80ab@stanley.mountain>
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v1-19-19aadc34941b@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-19-19aadc34941b@linux.microsoft.com>
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

On Fri, Nov 15, 2024 at 09:22:49PM +0000, Easwar Hariharan wrote:
> diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
> index 378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993badcc9aba 100644
> --- a/samples/livepatch/livepatch-callbacks-busymod.c
> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
> @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
>  {
>  	pr_info("%s\n", __func__);
>  	schedule_delayed_work(&work,
> -		msecs_to_jiffies(1000 * 0));
> +		secs_to_jiffies(0));

Better to just call schedule_delayed_work(&work, 0);

>  	return 0;
>  }

regards,
dan carpenter
