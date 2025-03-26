Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B572CA71DFC
	for <lists+etnaviv@lfdr.de>; Wed, 26 Mar 2025 19:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F47810E1AA;
	Wed, 26 Mar 2025 18:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="JmmWo/99";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6C010E1BD
 for <etnaviv@lists.freedesktop.org>; Wed, 26 Mar 2025 18:06:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743012401; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OgTKzq7oSiJpG2oS2Hxq+rq0+cRm3mDvKdV258ynMHOqFII1P02v9lXVJY3Yks3Xkn96m8UFytYCcagRAFrv/+i4+zZXdYZ7i9tnD9j91s3lrMdmEtU32Kf3mjpGcTUCa/SKy4LBxnxa7AEp3l7zFZFw0V0HJfRH/lJkjxW/wxc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743012401;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=BchO4jbyX1uU7GymCxbzxd+byp4F6NqqZG+aZWbl85w=; 
 b=QMK1Egm1ldaximEG1B88St7DrPGPPhlysorZprAXuSd4JaGyGPr4VkTtRgaHjO4//au35zVTIo0l7TQRbdWOX3e2sClTY/LVcaCMhQ8MSZPmLaR/C1JmXD0C4dKP2DauMfGsDWtSfhSN3LYWxaxTCcHi27uJI5ulE6sxEuyEX80=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743012401; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=BchO4jbyX1uU7GymCxbzxd+byp4F6NqqZG+aZWbl85w=;
 b=JmmWo/99kDl3GPBG5bcsfz2UsUTyNhp3j3XglU7UWB1/k6OllGseatu/+8kEmkN6
 Wgq59Efg2ZE2oJ4pWvUwr0m0koN2o5QxTKrOhRTntq2LY7Pe337VlliPwrqlrs6NBxz
 mgEm6KbYTC4aNVQoBUu4znQTjq7g4qtloFDsFgqc=
Received: by mx.zohomail.com with SMTPS id 1743012399991768.6845725377964;
 Wed, 26 Mar 2025 11:06:39 -0700 (PDT)
Message-ID: <4e30aab36a06ee3d12e9129eadae22e97e70afe0.camel@collabora.com>
Subject: 2025 X.Org Foundation Membership deadline for voting in the
 upcoming election
From: Mark Filion <mark.filion@collabora.com>
To: Etnaviv <etnaviv@lists.freedesktop.org>
Date: Wed, 26 Mar 2025 14:06:38 -0400
Content-Type: multipart/alternative; boundary="=-W39nJeMmJZzD32yPsZa3"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
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

--=-W39nJeMmJZzD32yPsZa3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Now that the freedesktop server migration is almost done, it's time to
turn our attention on the 2025 X.Org Foundation elections, which are
rapidly approaching! We will be forwarding the election schedule and
nominating process to the membership shortly.

Please note that only current members can vote in the upcoming
election, and that the deadline for new memberships or renewals to vote
in the upcoming election is 23 April 2025 at 23:59 UTC.

If you are interested in joining the X.Org Foundation or in renewing
your membership, please visit the membership system site
at:=C2=A0https://members.x.org/

Mark Filion, on behalf of the X.Org elections committee

--=-W39nJeMmJZzD32yPsZa3
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
</style></head><body><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0,=
 0, 0); font-family: Cantarell; font-style: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px;=
 text-decoration: none;">Hello,</div><div style=3D"caret-color: rgb(0, 0, 0=
); color: rgb(0, 0, 0); font-family: Cantarell; font-style: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-st=
roke-width: 0px; text-decoration: none;"><br></div><div style=3D"caret-colo=
r: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Cantarell; font-style: n=
ormal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -=
webkit-text-stroke-width: 0px; text-decoration: none;">Now that the freedes=
ktop server migration is almost done, it's time to turn our attention on th=
e 2025 X.Org Foundation elections, which are rapidly approaching! We will b=
e forwarding the election schedule and nominating process to the membership=
 shortly.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0)=
; font-family: Cantarell; font-style: normal; font-variant-caps: normal; fo=
nt-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap=
-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-=
decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color=
: rgb(0, 0, 0); font-family: Cantarell; font-style: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; text-align: start; te=
xt-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0p=
x; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-wid=
th: 0px; text-decoration: none;">Please note that only current members can =
vote in the upcoming election, and that the deadline for new memberships or=
 renewals to vote in the upcoming election is 23 April 2025 at 23:59 UTC.</=
div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fami=
ly: Cantarell; font-style: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-=
color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration:=
 none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0,=
 0); font-family: Cantarell; font-style: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; te=
xt-decoration: none;">If you are interested in joining the X.Org Foundation=
 or in renewing your membership, please visit the membership system site at=
:<span class=3D"Apple-converted-space">&nbsp;</span><a href=3D"https://memb=
ers.x.org/" style=3D"color: rgb(238, 238, 236);">https://members.x.org/</a>=
</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fa=
mily: Cantarell; font-style: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highligh=
t-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoratio=
n: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0); font-family: Cantarell; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; =
text-decoration: none;">Mark Filion, on behalf of the X.Org elections commi=
ttee</div><div><span></span></div></body></html>

--=-W39nJeMmJZzD32yPsZa3--
