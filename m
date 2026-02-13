Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNDgFSAQj2mCHgEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 13 Feb 2026 12:50:56 +0100
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F4135D8C
	for <lists+etnaviv@lfdr.de>; Fri, 13 Feb 2026 12:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B3910E283;
	Fri, 13 Feb 2026 11:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=debevv.com header.i=@debevv.com header.b="HiOeEdPe";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5261810E283
 for <etnaviv@lists.freedesktop.org>; Fri, 13 Feb 2026 11:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debevv.com;
 s=protonmail; t=1770983447; x=1771242647;
 bh=dV/KDMSnGzf1h6G0brpCUoRninIWhl/Ntaw0Wv6+5lk=;
 h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=HiOeEdPe+9Vhe4bj4mlRSUIjfu95jSe3qWCIhWMZkK0YSYOAkziXQawBGqNFnkIvL
 NsMzhjZ9Nm6PySCTqZgkCDrUqOiSCxHZkT43bwIYRMdLKPVtfEZGL7x5iuOhXWI/Sa
 p0yPoitT43tQf68ZkASdvF4k3nvj3cXOdTMap75U=
Date: Fri, 13 Feb 2026 11:50:43 +0000
To: etnaviv@lists.freedesktop.org
From: Valerio De Benedetto <posta@debevv.com>
Subject: LVDS display rotation
Message-ID: <20b6c6b9-f105-4de1-b330-2c3ce5c08ca8@debevv.com>
In-Reply-To: <03653d4c-2e80-44c8-9562-84fad2ef4271@debevv.com>
References: <03653d4c-2e80-44c8-9562-84fad2ef4271@debevv.com>
Feedback-ID: 7307828:user:proton
X-Pm-Message-ID: 2178b73b91448f302aa0d529d97d11cae7af3d6e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[debevv.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[debevv.com:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[debevv.com:mid,debevv.com:dkim,0.0.0.60:email];
	FROM_NEQ_ENVFROM(0.00)[posta@debevv.com,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[debevv.com:+]
X-Rspamd-Queue-Id: D54F4135D8C
X-Rspamd-Action: no action

Hi everyone,

our application needs a 10" LVDS display, connected to our i.MX6 board,=20
to be in "portrait" mode, so rotated by 90 degrees in either direction.
I tried booting the kernel with the 'video=3D1920x1200@60,rotate=3D90'=20
argument, but looks like it is being ignored.
Delving into the drivers/gpu/drm part of the kernel I noticed some=20
drivers actually handling properties like DRM_MODE_ROTATE_90, but looks=20
like etnaviv is not one of them.

Am I correct in assuming that this driver does not handle the rotate=3D90=
=20
parameter? If yes, can you briefly advise me on how to proceed to=20
implement it?

Thank you


