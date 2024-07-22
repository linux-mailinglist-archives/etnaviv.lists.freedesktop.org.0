Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF4939149
	for <lists+etnaviv@lfdr.de>; Mon, 22 Jul 2024 17:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7586810E0FA;
	Mon, 22 Jul 2024 15:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="htc3cy1j";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BB710E0FA
 for <etnaviv@lists.freedesktop.org>; Mon, 22 Jul 2024 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721660640;
 bh=94V2FOBhQb+tZMxWV3mDiMf6SrdiLsoT8QBihrvghmc=;
 h=Subject:From:To:Date:From;
 b=htc3cy1j5GhRVu6NS3BkCkTeCwhlSnnrZ50r2Z5kOSdg9lpPs0p45ALpHXcy7R32m
 kK/69fWSE/bTXM/XrDKs8jfPOzCWD/DEyNiBhc0AMzemvCs+6Pgu5LZClhlRVkNyss
 Ifr3sDqFZGbjFISlif+XsgsIB9ufxLcSIAx8v0Zx3AVY9kERIaR7NKkBBNsXGOZIlI
 r8lsKxsjCEISnBnP/WrZ92j8oL+U2SuwJLUgYnmcm+7KulqtgTWlN1EogWCDA4Q9+n
 0uq7sEZM1Baza+0h3IY/4+GnduPBeROLBOKwTOdMi4QFi7HBcG8c4925To1W6SHhHM
 rKxF/GPi8LYTQ==
Received: from [100.127.186.53] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mfilion)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E164F378001E
 for <etnaviv@lists.freedesktop.org>; Mon, 22 Jul 2024 15:03:59 +0000 (UTC)
Message-ID: <54030f8a78546c1bc79f8dd7e7efd6fe55ab62a1.camel@collabora.com>
Subject: Reminder - The Call for Proposals is open for XDC 2024!
From: Mark Filion <mark.filion@collabora.com>
To: etnaviv@lists.freedesktop.org
Date: Mon, 22 Jul 2024 11:03:58 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
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

Reminder -=C2=A0The CfP is now open for talks, workshops=C2=A0and demos at =
XDC
2024. The deadline for submissions is Monday, 12 August 2024.

https://indico.freedesktop.org/event/6/abstracts/

While any serious proposal will be gratefully=C2=A0considered, topics of
interest to X.Org and freedesktop.org developers are encouraged. The
program focus is on new development, ongoing challenges and anything
else that will spark discussions among attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more!
=C2=A0=C2=A0=C2=A0
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

=C2=A0=C2=A0=C2=A0=C2=A0https://floss.social/@XOrgDevConf

Best,

Mark
