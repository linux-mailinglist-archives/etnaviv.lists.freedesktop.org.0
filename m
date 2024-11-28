Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5539DFEFF
	for <lists+etnaviv@lfdr.de>; Mon,  2 Dec 2024 11:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6847010E6BE;
	Mon,  2 Dec 2024 10:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NF86R7YP";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B3510E36F
 for <etnaviv@lists.freedesktop.org>; Thu, 28 Nov 2024 12:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732796954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Nxf6CkGK3NslY+JLgqPcTLt32q1OCumzkrHYUKQkbE=;
 b=NF86R7YPaO4OmYapdN/YmkctK36hyatOwgFnMmypDgOYs+5hDSzw9VI6kPrX1Sfwh9Y/oh
 pkRUEbh4+BmMaTxCAagWRlwi7lwQxDFd7HAWNdry//JprUXWVkYB37Tpxs4gq9uxDC5E3q
 Hb7mXLh0aj/aMRbdo2tBNwPWG0P55Bs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-8GUsA5lPPBinLT3wFT_XPA-1; Thu, 28 Nov 2024 07:29:13 -0500
X-MC-Unique: 8GUsA5lPPBinLT3wFT_XPA-1
X-Mimecast-MFC-AGG-ID: 8GUsA5lPPBinLT3wFT_XPA
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5cfbec85442so510284a12.1
 for <etnaviv@lists.freedesktop.org>; Thu, 28 Nov 2024 04:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732796952; x=1733401752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Nxf6CkGK3NslY+JLgqPcTLt32q1OCumzkrHYUKQkbE=;
 b=sqN9fILdFWZx9MQFJhEF3JNUFwGk7Nj6S5xghQHk1gP0LsWGhTHR32hnUAmbz+U7Va
 3hPvhHLQsRf7PuJeSY+s51FamtHkvLF55XkiTzouNvupxKsa7O+doWm85BuiA1QjoCG6
 HAUpdjfPiNHbH2ViZNmFYc0tPTevk7yvG3QLaNoz92ncctTg4BhlwJrg+rzJhOHGmuJd
 QQ937OIQpaGG8RMenA3IUk6xTo4LAcGQoAoNoXCEeCFTPW3VhkxFDTrNvFK14ghvqbI/
 gvXYrbDPkoHqC0ugkoXNmNDjaAoiM+rmCHKI0YM1A2AxXF0ciJiXLbMDxdRI5kUtp7ao
 8yng==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3RWv9LZdcQIxCt9ABFv49oMbYcKDWhHS8toFGsjJ1sBUXRvMATYzlLsR6S/pJCc2OQXUpg6PX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxQl6hxoOls3wd26QJIx/D1tG+lkHudEz21nJEmrzWZlTOrsEK
 uZtfPajaP830axSaDTPQl3LI4RvUHF6B8QGwb6ARjTEbGlUpw4MTHt44cYRXTEGsbna0RigBprk
 j3xUSnvHAuFEIO/fAJ3MkHZi3dJT5QSgeUNh2oVgTbLts17hUsZYaDjCx3ER/eR8WHe6NksXrwh
 K+oZPhy+2KIM2jD7qQb4cXwQxU2XR10Q4eFQuj/Q==
X-Gm-Gg: ASbGncujKcve0/9w59JQTQ9D46hFJSyVZV2pucj6aK0K1F5dDSSwDCeKC/476O68zRK
 yWyWt/vMoX1vr64acLMYyJ3ega89j8pc=
X-Received: by 2002:a05:6402:5243:b0:5cf:e26b:9797 with SMTP id
 4fb4d7f45d1cf-5d080c604fcmr5605173a12.29.1732796951986; 
 Thu, 28 Nov 2024 04:29:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuE0zkJ6zJza+fGet7qX+06h7Jmet7/bu0xRwgqC9A06SMAgod8PaoQJd1k5pY7KRDfw0cJAGqmNIglvOyUZo=
X-Received: by 2002:a05:6402:5243:b0:5cf:e26b:9797 with SMTP id
 4fb4d7f45d1cf-5d080c604fcmr5605060a12.29.1732796951475; Thu, 28 Nov 2024
 04:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v1-18-19aadc34941b@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-18-19aadc34941b@linux.microsoft.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Thu, 28 Nov 2024 14:29:00 +0200
Message-ID: <CAO8a2SjKS2nWWVkAcqXkZhR+Q1TocULkwRk09ABf8XQjjzwJPQ@mail.gmail.com>
Subject: Re: [PATCH 18/22] ceph: Convert timeouts to secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lEo6R9fkMYaTj607xGw3iRg09_xeTYaOFa5IjbF91hQ_1732796952
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 02 Dec 2024 10:32:03 +0000
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

looks good

On Fri, Nov 15, 2024 at 11:35=E2=80=AFPM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> Changes made with the following Coccinelle rules:
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  fs/ceph/quota.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ceph/quota.c b/fs/ceph/quota.c
> index 06ee397e0c3a6172592e62dba95cd267cfff0db1..d90eda19bcc4618f98bfed833=
c10a6071cf2e2ac 100644
> --- a/fs/ceph/quota.c
> +++ b/fs/ceph/quota.c
> @@ -166,7 +166,7 @@ static struct inode *lookup_quotarealm_inode(struct c=
eph_mds_client *mdsc,
>         if (IS_ERR(in)) {
>                 doutc(cl, "Can't lookup inode %llx (err: %ld)\n", realm->=
ino,
>                       PTR_ERR(in));
> -               qri->timeout =3D jiffies + msecs_to_jiffies(60 * 1000); /=
* XXX */
> +               qri->timeout =3D jiffies + secs_to_jiffies(60); /* XXX */
>         } else {
>                 qri->timeout =3D 0;
>                 qri->inode =3D in;
>
> --
> 2.34.1
>
>

