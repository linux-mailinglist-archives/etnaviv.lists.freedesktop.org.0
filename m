Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GaZdI5HefGmpPAIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 30 Jan 2026 17:38:41 +0100
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C54BC90E
	for <lists+etnaviv@lfdr.de>; Fri, 30 Jan 2026 17:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFDE10EA13;
	Fri, 30 Jan 2026 16:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="QmSCTpO9";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Fri, 30 Jan 2026 16:38:38 UTC
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0708210EA16
 for <etnaviv@lists.freedesktop.org>; Fri, 30 Jan 2026 16:38:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769790213; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Zph6/iWHqsyjuWYEd3nYke/lCq2WbluLVsVevdLQ0WZxHEHJwGVdNMb5GOZEWegIvV3Uvy/oTkn3rxdx3s3b1abnOMTXb01V4RyVbs86lz4IQDI6j26i0Iv5y6FmtbMYDR3/LFoyBxV08VtqcQ5ud9is09o4QCv+FThNzdoBeZA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769790213;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=U7/y7Eco//rxDWnc3crvL04tdvxGqZg8pDlPmjjbOBY=; 
 b=BDCQAjyAh8cZ4DIB+D872aka59toZW8XR8BvZu/Ew3VGjP2nSb8rd18pV+C7sH57EosDBj6DcY4u8PUKSEMuyGDo7YHIMXQ75lfvyEGoL+ZRunlftMmiXEE22X1+lMZPpWSGhbZrBY42LByjDbO4ejh5FgeuT+rlhzGb7mLlOVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769790212; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=U7/y7Eco//rxDWnc3crvL04tdvxGqZg8pDlPmjjbOBY=;
 b=QmSCTpO9TDAnIGTuG37M+9q/RJbkTsIMRN+0sFQQI6lg/cAgpouUnuFFqRv9aDqC
 /brYhhkHdU1iJn9iZVhksE8LlPi3gtKwjHJ7Vs8v9L6Sxh6uAW7dZTx2QNzLzsir8NH
 L3YLO0JfCLwiCUAaw96qxgZ4ZmfLYY3G3SvFEnkw=
Received: by mx.zohomail.com with SMTPS id 1769790211481743.1522375834357;
 Fri, 30 Jan 2026 08:23:31 -0800 (PST)
Message-ID: <bcd5629addd99fd97cd014e4a5bd0c734885543e.camel@collabora.com>
Subject: Save the Date! XDC 2026 comes to Toronto
From: Mark Filion <mark.filion@collabora.com>
To: etnaviv@lists.freedesktop.org
Date: Fri, 30 Jan 2026 11:23:28 -0500
Content-Type: multipart/alternative; boundary="=-6SFnenNq3XkNYtrw+p4F"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43app1) 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_RCPT(0.00)[etnaviv];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.877];
	RCVD_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,floss.social:url];
	FROM_NEQ_ENVFROM(0.00)[mark.filion@collabora.com,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Queue-Id: 11C54BC90E
X-Rspamd-Action: no action

--=-6SFnenNq3XkNYtrw+p4F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

We=E2=80=99re excited to announce that XDC 2026 will take place September 2=
8=E2=80=9330
in Toronto, Canada =E2=80=94 mark your calendars!

The conference will be held in person at Daniels Spectrum, a vibrant
community cultural hub in the heart of Toronto=E2=80=99s Regent Park
neighbourhood, just minutes from Yonge=E2=80=93Dundas Square.

We=E2=80=99d also like to extend a sincere thank you to Arm for organizing =
this
year=E2=80=99s conference and helping make XDC another great success.

Registration and the Call for Proposals will be opening soon, so stay
tuned!

Until then, be sure to follow us on Mastodon for the latest news and
updates:
https://floss.social/@XOrgDevConf

Best,

Mark

--=-6SFnenNq3XkNYtrw+p4F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hello!</div><div><br></div><div>We=E2=80=99re exc=
ited to announce that XDC 2026 will take place September 28=E2=80=9330 in T=
oronto, Canada =E2=80=94 mark your calendars!</div><div><br></div><div>The =
conference will be held in person at Daniels Spectrum, a vibrant community =
cultural hub in the heart of Toronto=E2=80=99s Regent Park neighbourhood, j=
ust minutes from Yonge=E2=80=93Dundas Square.</div><div><br></div><div>We=
=E2=80=99d also like to extend a sincere thank you to Arm for organizing th=
is year=E2=80=99s conference and helping make XDC another great success.</d=
iv><div><br></div><div>Registration and the Call for Proposals will be open=
ing soon, so stay tuned!</div><div><br></div><div>Until then, be sure to fo=
llow us on Mastodon for the latest news and updates:</div><div><a href=3D"h=
ttps://floss.social/@XOrgDevConf">https://floss.social/@XOrgDevConf</a></di=
v><div><br></div><div>Best,</div><div><br></div><div>Mark</div><div><span><=
/span></div></body></html>

--=-6SFnenNq3XkNYtrw+p4F--
