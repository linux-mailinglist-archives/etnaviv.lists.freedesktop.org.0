Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88CA92EB13
	for <lists+etnaviv@lfdr.de>; Thu, 11 Jul 2024 16:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8998110E255;
	Thu, 11 Jul 2024 14:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="05LoM21F";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9916010E255
 for <etnaviv@lists.freedesktop.org>; Thu, 11 Jul 2024 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720709858;
 bh=Y+wAWAFTXevIAj9CS2cKzDzafDJ2NYFrO0uWvlIyreg=;
 h=Subject:From:To:Date:From;
 b=05LoM21FsS5Ma5AbS8WYldAMWM9odFsSY01bX8dK/ISuw6sqjTaH0nswWGFqOID2i
 lw3XjLbSApk6mXXwsoEDCfGOWg0Gxuz8oAas+NIxiSb6NHjUW3vx0vMrLvj/uBUTys
 AkBD2+ZQx+BHEX3tthEk+Ck5clZiKCiKQ/3TcGLRBKdz8Opr63t7vd4r6hMds7HR/3
 jsiluqZRNNsYsYgZs3VNNUztm8TbD8oqab9ba9lGtW7dHsxNgVSeJA51SCCuoqefAY
 c2BWphyukZ1Ezoos168FMxWusjOgQDCxJcxwbYhcZsHGRLGg2Hd17MFB/+QBI7n7JC
 5b9MGw43/8ZZQ==
Received: from [100.127.186.53] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: mfilion)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0B8433780627
 for <etnaviv@lists.freedesktop.org>; Thu, 11 Jul 2024 14:57:37 +0000 (UTC)
Message-ID: <77a25936e8bbf4db933c4e2672c5491c1e3b9c9a.camel@collabora.com>
Subject: XDC 2024: Registration & Call for Proposals now open!
From: Mark Filion <mark.filion@collabora.com>
To: etnaviv@lists.freedesktop.org
Date: Thu, 11 Jul 2024 10:57:20 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
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

Hello!

Registration & Call for Proposals are now open for XDC 2024, which will
take place at the Concordia University Conference Centre in Montr=C3=A9al,
Canada on October 9 to 11.=20

New this year: XDC 2024 will feature two full days dedicated to talks
followed by a day dedicated to workshops, meetings & hacking.
All workshops and meetings will take place on the last day.

    https://xdc2024.x.org
  =20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!
=20
In order to register as attendee, you will therefore need to register
via the XDC website.

    https://indico.freedesktop.org/event/6/registrations/

In addition to registration, the CfP is now open for talks, workshops
and demos at XDC 2024. While any serious proposal will be gratefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more:

    https://indico.freedesktop.org/event/6/abstracts/

The deadline for submissions Monday, 12 August 2024.

We are looking forward to seeing you in Montr=C3=A9al! If you have any
questions,
please send me an email (mfilion at collabora.com),
adding on CC the X.org board (board at foundation.x.org).

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

    https://floss.social/@XOrgDevConf

Best,

Mark
