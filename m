Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B519AC8269
	for <lists+etnaviv@lfdr.de>; Thu, 29 May 2025 21:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294D110E247;
	Thu, 29 May 2025 19:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="TRjNU+L0";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5BB10E247
 for <etnaviv@lists.freedesktop.org>; Thu, 29 May 2025 19:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748545303; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=B2a8PMwjcc0TAqNpabeWRpJ7viSC5dHZaZm0zG3L3jME/Ol0ZjORLWbrE5NvbkvJ3TEiajD4ff0PcJVOsdlQV9U137aJ2K/PV6Y3WzGFINmFe9mrfCZvtkg4WmVaTAJRo227nLXxqwJFUbwU4gf+MdMwWLZzUnA3IvbW9XMQmNk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748545303;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=L3uj6rLy46QHqM66eogkjrelHkiVumz/LWjuCMD+K9U=; 
 b=bWK0XK7FARrsm3Hkvt95S2pEar0tGFUs3gyGIQqOBeldcn/28Jo44NlwwXJBN+WOy8NoJWDP5WduaI8IHlGH6MRfNwHlJRCpZ+38tehoZjiw2yywM9EtRiZkMaH4k8/ZZ3uzV0u+TDQJFXLE9UPM7TW3wAEPi9UgEZGQsOUx2FU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748545303; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
 bh=L3uj6rLy46QHqM66eogkjrelHkiVumz/LWjuCMD+K9U=;
 b=TRjNU+L0/TES31HssIps9fr8FB2zNFJh+RApFr3iRK4YfNHU3sOiZgrLG1byxYZA
 m88UhCRk/sCGsqM4FvIbXRJ7nGU7EQRVH7mn15issjxzwxzvimxbTwwqrXyp+BOxffy
 FHP3DBGNMncvNlwj/iucGa1ZLnz8CU8VU/PtES6s=
Received: by mx.zohomail.com with SMTPS id 1748545300925161.31655077024436;
 Thu, 29 May 2025 12:01:40 -0700 (PDT)
Message-ID: <ca49760b3d9c2eba03c6ba4677f285965b874d02.camel@collabora.com>
Subject: XDC 2025: Registration & Call for Proposals now open!
From: Mark Filion <mark.filion@collabora.com>
To: etnaviv@lists.freedesktop.org
Date: Thu, 29 May 2025 15:01:39 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

Registration & Call for Proposals are now open for XDC 2025, which will
take place at the  TU Wien Kuppelsaal in Vienna, Austria on 29
September to 1 October.

    https://xdc2025.x.org
 =20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible:

    https://indico.freedesktop.org/event/10/registrations/

In addition to registration, the CfP is now open for talks, demos, and
workshops at XDC 2025. While any serious proposal will be gratefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more:

    https://indico.freedesktop.org/event/10/abstracts/

The deadline for submissions Friday, 11 July 2025.

We are looking forward to seeing you in Vienna! If you have any
questions, please email the organizer (hfink at snap.com), adding on
CC the X.org board (board at foundation.x.org).

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

    https://floss.social/@XOrgDevConf

Best,

Mark
