Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CVSVHhdMOWqqqAcAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Mon, 22 Jun 2026 16:52:07 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7E36B07B1
	for <lists+etnaviv@lfdr.de>; Mon, 22 Jun 2026 16:52:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=Wmdtkr1B;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C857510E735;
	Mon, 22 Jun 2026 14:52:05 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9328810E72C
 for <etnaviv@lists.freedesktop.org>; Mon, 22 Jun 2026 14:52:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1782139923; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JoekLgeCCkpGYlhsul9btiELwjuvi695RZw4gCIijQ3oDd86OITvTJs2SlAJmexX2rTf2bLMVRC6Yv4PRHJzszaoNACcsCkrd78guLseYK/YJkYAPqfDKUHlEKioeCMFhRywul4+kjaOnOYui0hCAEZGIXMUQYIuVvllkFlEFzI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1782139923;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=63C3hkJcUAjLx1Wo5SqhN4nguOHicwdTIcrGRX6qKsE=; 
 b=Zdzd6FLn9UVnFBX3wrbcDTKVao+iXRbygTW9YdMDzJXcURRushn+q+Sx58PBu1Y0ddvRgudSma1a/cc8r1ivY+GD/1NxaFqc685aF+TyW+wvRJNvKocnr7W1ZeSMEPooeJaM8xw/bNfQlMi/Kl+XMuTYQebaNBxTG6wbrh6EG5o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782139923; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
 bh=63C3hkJcUAjLx1Wo5SqhN4nguOHicwdTIcrGRX6qKsE=;
 b=Wmdtkr1B8dQC0BwFYLBHg9EeqxvDpXX5N7pVZ9RxkETzWPKlKg1mi2AFZtOvyali
 q6UyT7V5nstfkv0HgSaQOgMQcBKXdB8rBUsblrkc9LFLxNCv/Tee62QmqvLxI/K9hnN
 bFflaYJ+NyObNWh+yHFWI1Me8hAhhlhmzs63bEic=
Received: by mx.zohomail.com with SMTPS id 1782139921917627.5442277954222;
 Mon, 22 Jun 2026 07:52:01 -0700 (PDT)
Message-ID: <6e02030853feea4fa3207729d5abb82241035c3a.camel@collabora.com>
Subject: Reminder: Call for Proposals open for XDC 2026
From: Mark Filion <mark.filion@collabora.com>
To: etnaviv@lists.freedesktop.org
Date: Mon, 22 Jun 2026 10:52:00 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
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
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	RCVD_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.filion@collabora.com,etnaviv-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,collabora.com:from_mime,freedesktop.org:url];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB7E36B07B1

Hello!

Reminder - The CfP is now open for talks, workshops and demos at XDC
2026. The deadline for submissions is Friday, 3 July 2026.

    https://xdc2026.x.org

While any serious proposal will be gratefully considered, topics of
interest to X.Org and freedesktop.org developers are encouraged. The
program focus is on new development, ongoing challenges and anything
else that will spark discussions among attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more!
  =20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!

Best,

Mark
