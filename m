Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E48E9DFEFE
	for <lists+etnaviv@lfdr.de>; Mon,  2 Dec 2024 11:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5681F10E6BD;
	Mon,  2 Dec 2024 10:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SR+2143n";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B524210E36F
 for <etnaviv@lists.freedesktop.org>; Thu, 28 Nov 2024 12:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732796934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZACMslqIaF7iVtmlx12c8LPoSlN7TzLegXngDuX2z78=;
 b=SR+2143n/ny/c1ljGZjDnEADm/Ip4JnzZKHEGegX2fSpQuWWcE1/kNzNUvhvIvpffUaami
 pQnV8KfkLGfnmwFF1tW7gB4vxoTu6M1GGF94HZMZeKWCvFMHdHksmJydcDHl7j7pLyw10t
 usmZaRSuxFMIGWqNTbACv75cFVGLQL0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-USt0O7ENOMGZVVbF_FkB3w-1; Thu, 28 Nov 2024 07:28:53 -0500
X-MC-Unique: USt0O7ENOMGZVVbF_FkB3w-1
X-Mimecast-MFC-AGG-ID: USt0O7ENOMGZVVbF_FkB3w
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38240d9ed31so455806f8f.3
 for <etnaviv@lists.freedesktop.org>; Thu, 28 Nov 2024 04:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732796932; x=1733401732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZACMslqIaF7iVtmlx12c8LPoSlN7TzLegXngDuX2z78=;
 b=XzKQ/vKGnXzAULw2aQ8vothJxvzg71T3xT7cNb0Ae3OFA05VB1+BQl0FOr99e5GzHl
 //va3Z6Cu2kxmtR6uKOxfXvRXM/UZZpXVFwbIkWudp8VuOqyVsoOwikBa90Huwqv5Q5L
 MStx0Fh/HGzcAWyyAdo9mJVFhJwbzT/fq3O8//Shtf/q4tIDmxzjpBsbrZ18KaEih7nj
 OnciAFSSeqh1Og05j7kOF6pGJ7zSYSpCM8hF5cG55AhFYfdWCaNT6KmPydb9lER6Rv7M
 OLIOcvUW5MQu03RWiDG+q71jA70uQNto5VIuAj8Wj4WEQo8RHImzG1DBOop9KqiGlGbQ
 tH9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCKGCxjFwi6d4R7o/Zn9WODUarJ2uCe8Pwv1Ib2f+EBytbxpqZDcxz3qnc5Yw2hmIixvMZbj+b@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwapNIdGJGATfkIZlm5yqLx0TIhW7fBRKOnNhxhA4i5VDowM+As
 dBdAY4P03nmG5cYoBVceoCkpjmRyWfghHB4vIdBgpj92cIHHEdoK38c7e5DwCjPEYQM2fSjhP2V
 0KBobw2exU4xH5FWz+n4kIZt7H27n71NbclUiIOoo8BbE+UzrEIJwe8k5OS74nsVFU4ieVKf4We
 xXra2XQPBQ4xZ18bm4pYV8d9GM+sMHcp7GLDgEiQ==
X-Gm-Gg: ASbGncvUV3vI0ITOHiGJZKaRQA2ukvbEsZMygavgR/cuGvnZC+sAgw/bXFhDp78NI1n
 eeEZDOSASdFnE/89Luttx9tCLmNo4rpc=
X-Received: by 2002:a05:6000:18ac:b0:382:4a27:1319 with SMTP id
 ffacd0b85a97d-385c6eb5840mr5776113f8f.6.1732796931966; 
 Thu, 28 Nov 2024 04:28:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGOqoP8tsZ6KQpRsoqtGa6KHF61EJ3NUmj3Aw3MlprtODTvHQ/TDY7uTpa3Nw0Vy2Is2RlK3QrcXMwzmVV8rU=
X-Received: by 2002:a05:6000:18ac:b0:382:4a27:1319 with SMTP id
 ffacd0b85a97d-385c6eb5840mr5776067f8f.6.1732796931576; Thu, 28 Nov 2024
 04:28:51 -0800 (PST)
MIME-Version: 1.0
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-18-911fb7595e79@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-18-911fb7595e79@linux.microsoft.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Thu, 28 Nov 2024 14:28:40 +0200
Message-ID: <CAO8a2SgQ-==SjhDFZpi2s3r9FUGA96jwuJL7kTDwE=Hw4UcgUg@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] ceph: Convert timeouts to secs_to_jiffies()
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
X-Mimecast-MFC-PROC-ID: lmr2qmeKA4NjxqCS5Cr48Fbsr9JLKskQM3verU9qaSU_1732796932
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

On Sat, Nov 16, 2024 at 12:32=E2=80=AFAM Easwar Hariharan
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

