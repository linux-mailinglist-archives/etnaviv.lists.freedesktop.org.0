Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479C69AFC09
	for <lists+etnaviv@lfdr.de>; Fri, 25 Oct 2024 10:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232E410EA1C;
	Fri, 25 Oct 2024 08:06:52 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BE410EA21
 for <etnaviv@lists.freedesktop.org>; Fri, 25 Oct 2024 08:06:51 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1t4FL6-0004hU-KX; Fri, 25 Oct 2024 10:06:32 +0200
Message-ID: <14677b6975162c59f5bfbe71aec52f9078ae6f64.camel@pengutronix.de>
Subject: Re: [PATCH 0/3] Fix GPU virtual address collosion when CPU page
 size != GPU page size
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 25 Oct 2024 10:06:31 +0200
In-Reply-To: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
References: <20241004194207.1013744-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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

Hi Sui,

Am Samstag, dem 05.10.2024 um 03:42 +0800 schrieb Sui Jingfeng:
> Etnaviv assumes that GPU page size is 4KiB, however, when using
> softpin capable GPUs on a different CPU page size configuration.
> Userspace still doing the allocation with 4KiB page as unit. This
> results in userspace allocated GPU virtual address ranges collision
> and therefore unable to be inserted to the specified hole exactly.
>=20
> The root cause is that kernel side BO takes up bigger address space
> than userspace assumes when the size of it is not CPU page size aligned.
>=20
> To solve it with no GPU VA range space wasting, we first track the size
> of a buffer that userspace/GPU think of it is, then partially map and/or
> unmap the tail physical page with respect to this 'user size'. Ensure
> that GPU VA is fully mapped and/or unmapped.
>=20
Would you be able to get me a updated series with the feedback taken
care of? I would like to add this series to the next upstream pull
request, if possible.

Regards,
Lucas

> Sui Jingfeng (3):
>   drm/etnaviv: Track GPU VA size separately
>   drm/etnaviv: Map and unmap the GPU VA range with respect to its user
>     size
>   drm/etnaviv: Print an error message if inserting IOVA range fails
>=20
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c |  8 +++--
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h |  1 +
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 42 ++++++++++++---------------
>  3 files changed, 24 insertions(+), 27 deletions(-)
>=20

