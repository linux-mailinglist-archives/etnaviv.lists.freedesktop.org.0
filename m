Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4D41D4ACF
	for <lists+etnaviv@lfdr.de>; Fri, 15 May 2020 12:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253256EC66;
	Fri, 15 May 2020 10:24:16 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 486 seconds by postgrey-1.36 at gabe;
 Fri, 15 May 2020 10:20:53 UTC
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683E36EC64
 for <etnaviv@lists.freedesktop.org>; Fri, 15 May 2020 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589537564; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/ePh4YMLWBTL9hyhzqUgUQ4fXudSnPsmWQ/+DO/jDI=;
 b=NiQbku4jdQcDOxNquHeMhn1m5LxhL3LJZ2WTO7CcLadmmETPPamlO/NiaFdg9HKSvQ97al
 qqo0OAkpXFMg/k3pf+5hraTU0B0/wJ9h7iLhnKKiflNymqRqCs5ew7ChK3jOnqjr0WBUo6
 gIaV4UPZoQPdphURMUF3/KzzcABU8iM=
Date: Fri, 15 May 2020 12:12:33 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/etnaviv: fix perfmon domain interation
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Message-Id: <X0BDAQ.L99CTJZCDEJE3@crapouillou.net>
In-Reply-To: <CAH9NwWcJNhUVkzd0KAfJyxNZJ9a71KLzipW+qRwhgEWUmnnxmg@mail.gmail.com>
References: <20200511123846.96594-1-christian.gmeiner@gmail.com>
 <CAH9NwWcJNhUVkzd0KAfJyxNZJ9a71KLzipW+qRwhgEWUmnnxmg@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 May 2020 10:24:14 +0000
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Christian,

Le ven. 15 mai 2020 =E0 12:09, Christian Gmeiner =

<christian.gmeiner@gmail.com> a =E9crit :
> Am Mo., 11. Mai 2020 um 14:38 Uhr schrieb Christian Gmeiner
> <christian.gmeiner@gmail.com>:
>> =

>>  The GC860 has one GPU device which has a 2d and 3d core. In this =

>> case
>>  we want to expose perfmon information for both cores.
>> =

>>  The driver has one array which contains all possible perfmon domains
>>  with some meta data - doms_meta. Here we can see that for the GC860
>>  two elements of that array are relevant:
>> =

>>    doms_3d: is at index 0 in the doms_meta array with 8 perfmon =

>> domains
>>    doms_2d: is at index 1 in the doms_meta array with 1 perfmon =

>> domain
>> =

>>  The userspace driver wants to get a list of all perfmon domains and
>>  their perfmon signals. This is done by iterating over all domains =

>> and
>>  their signals. If the userspace driver wants to access the domain =

>> with
>>  id 8 the kernel driver fails and returns invalid data from doms_3d =

>> with
>>  and invalid offset.
>> =

>>  This results in:
>>    Unable to handle kernel paging request at virtual address 00000000
>> =

>>  On such a device it is not possible to use the userspace driver at =

>> all.
>> =

>>  The fix for this off-by-one error is quite simple.
>> =

>>  Reported-by: Paul Cercueil <paul@crapouillou.net>
>>  Tested-by: Paul Cercueil <paul@crapouillou.net>
>>  Fixes: ed1dd899baa3 ("drm/etnaviv: rework perfmon query =

>> infrastructure")
>>  Cc: stable@vger.kernel.org
>>  Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
>>  ---
>>   drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> =

>>  diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c =

>> b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
>>  index e6795bafcbb9..35f7171e779a 100644
>>  --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
>>  +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
>>  @@ -453,7 +453,7 @@ static const struct etnaviv_pm_domain =

>> *pm_domain(const struct etnaviv_gpu *gpu,
>>                  if (!(gpu->identity.features & meta->feature))
>>                          continue;
>> =

>>  -               if (meta->nr_domains < (index - offset)) {
>>  +               if ((meta->nr_domains - 1) < (index - offset)) {
>>                          offset +=3D meta->nr_domains;
>>                          continue;
>>                  }
>>  --
>>  2.26.2
>> =

> =

> ping

I'll merge it tomorrow if there's no further feedback.

-Paul


_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
