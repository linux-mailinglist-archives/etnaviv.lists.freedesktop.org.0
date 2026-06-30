Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id te/VKdUmRGqppgoAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 22:28:05 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6376E7CFA
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jun 2026 22:28:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=VCccPEaj;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB69B10E253;
	Tue, 30 Jun 2026 20:28:03 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B80610E257
 for <etnaviv@lists.freedesktop.org>; Tue, 30 Jun 2026 20:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1782851280; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=V5vdqcoqpkDroQLO8XlnJkaXkHHe+PyXtf/den3NUxBiEskIQR5LhLFvKW1mHYR1uV8Nhkpsgl1i6uBHd1WPwyGvK/zkwYLSaEFwyweRUO0rywRPNWduGwLzgifnNLvJcatB9bbqP/oahOTNM2yn8sL2D/+3y+VtB997SM4vFYA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1782851280;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=/xxStwIF61bn3ZqA6+M8xNVE8MJdolxYpTE31ogRu80=; 
 b=T6tuomzUD8BzWXl0pBKBDd5WuEtiwb5ih+3HavgX6yIkxmM5Krt5ZJHVuAqxzcYcUbWzbwfFK/+S2bm7z01/yX3bbTvAKSeUwpFgu6Awag9jymfQGULYRTjK1w1HEZHK8plQUBeLK0cm+QWLeJ0kKPMIYutMUNGQoYeFcR0B+wg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782851280; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
 bh=/xxStwIF61bn3ZqA6+M8xNVE8MJdolxYpTE31ogRu80=;
 b=VCccPEaj0j9B6Zi05OxyCm9O2qRF7ZWZweegklXbxr3RCd2dvOjBDx5e4S38JJsd
 RPW3j3XwT0WcGUq9JMkIVKX+6kfg18FnFQrwWX0ApuQZ1dTGbkbHIQSr1cbxGpFANCZ
 wscRhani3gHWkutDyjvkMsTV+KvFZLimCVU0RiPA=
Received: by mx.zohomail.com with SMTPS id 1782851278668363.9530674886039;
 Tue, 30 Jun 2026 13:27:58 -0700 (PDT)
Message-ID: <8539d47312c970037eef4fd02ab4b9115df490fc.camel@collabora.com>
Subject: Reminder: Call for Proposals closing soon for XDC 2026!
From: Mark Filion <mark.filion@collabora.com>
To: etnaviv@lists.freedesktop.org
Date: Tue, 30 Jun 2026 16:27:57 -0400
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[etnaviv];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.filion@collabora.com,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F6376E7CFA

Hello!

Reminder - The deadline for submissions for XDC 2026 is this coming
Friday, 3 July 2026.

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
