Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MCNMKdXjIWoUQQEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 04 Jun 2026 22:45:09 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30602643727
	for <lists+etnaviv@lfdr.de>; Thu, 04 Jun 2026 22:45:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=LPvUTOTR;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90991112987;
	Thu,  4 Jun 2026 20:45:07 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jun 2026 20:44:55 UTC
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146F61128E7
 for <etnaviv@lists.freedesktop.org>; Thu,  4 Jun 2026 20:44:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1780604989; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SF3t0Pz4SPHWUDW8fesMYnOibzt6wSl9f0kXlUwb++TxxzI463sP9/8q3I5jQMB369MbhljW3KXOH28iWPyZlr/KSjl9VPVe71xalCzSD5IYNywKwbOFn0acCcSQ7lqwGdsPdAR7G51YwPyyL/HSUKUN3Gk8H/vpowr5JTBeUfw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1780604989;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=muC6rawBX3CykhRdzS4yBFWa650rEAb1z3ELNMgRXrs=; 
 b=Bp3XIKtVn3A3MdhReKOG/HsqMPpR5Z4/eLjaNQkIQ4rG5heyjY8E8Zh7LoYWZbLm27VeSHiaodArHziRtKD5cPiBzSf+Ex1/oaj/1TIBsHSxUVf0y1lXrNdPMt2RxD07A4lxZaLBPBDd6AmXR4yI2TZnrRIe4gUOwzl5KIY0smA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780604989; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
 bh=muC6rawBX3CykhRdzS4yBFWa650rEAb1z3ELNMgRXrs=;
 b=LPvUTOTR8Pmhxdlo36LsRjSurrqezxxiArvCds+2MSg9tTDdeELJfEwR/1feicrb
 vFPxscQ98R1V7BFg7mz1UjPXFn24Dk/zSW3b4g6ycyZJOcDPlA157sFxQx0FnH4bUFh
 /6dgg2j0xSSGXOsVdtixFJy1ZumXd4rtMGk/OFLY=
Received: by mx.zohomail.com with SMTPS id 1780604986737944.8143799893513;
 Thu, 4 Jun 2026 13:29:46 -0700 (PDT)
Message-ID: <9a8e123f39e12303824d74cee824f2da5d2735dd.camel@collabora.com>
Subject: XDC 2026: Registration & Call for Proposals now open!
From: Mark Filion <mark.filion@collabora.com>
To: etnaviv@lists.freedesktop.org
Date: Thu, 04 Jun 2026 16:29:45 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44app2) 
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.filion@collabora.com,etnaviv-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:from_mime,collabora.com:dkim,freedesktop.org:url,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,floss.social:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30602643727

Hello!

Registration and Call for Proposals are now open for XDC 2026,
taking place at the Daniels Spectrum in Toronto, Canada,
September 28=E2=80=9330, organized by Arm.

    https://xdc2026.x.org
=20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible:

    https://indico.freedesktop.org/event/12/registrations/

In addition to registration, the CfP is now open for talks, demos, and
workshops at XDC 2026. While any serious proposal will be carefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more:

    https://indico.freedesktop.org/event/12/abstracts/

The deadline for submissions Friday, July 3, 2026.

We are looking forward to seeing you in Toronto! If you have any
questions, please email the organizer (charlie.dixon at arm.com), and
CC=20
the X.Org board (board at foundation.x.org).

Don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

    https://floss.social/@XOrgDevConf

Best,

Mark
