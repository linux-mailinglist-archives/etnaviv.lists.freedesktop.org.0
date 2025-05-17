Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE03ABA932
	for <lists+etnaviv@lfdr.de>; Sat, 17 May 2025 11:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0239810E165;
	Sat, 17 May 2025 09:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="WG8WVYFi";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E42510E165
 for <etnaviv@lists.freedesktop.org>; Sat, 17 May 2025 09:45:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747475099; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SvT+57HePwnBhnB9meUSWVFvIn7/Ia0FyqkyCngBnnLLIZy4xxKnISRSKyV8d54qpxIYttR6vmCYGeYJroGvpgiicT745a+bhN9G7F1ZxX3u5rkhiD9MV0rTmi2XqzGzyybi1iCp3JoH0Om/oGtrpnyx6ZS8rwpeN2HsJwdN9vA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747475099;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=O8tAgC3YgnhIHe1YuRXJSAVSRr2vwaClSYm1fhgpSfg=; 
 b=WceFhUNIIBHMu5/KUIjzxJJqt58KOTrx6RNBdZruWjq6Vh/e99+kRiZYRIMUyV/DqXnLVP9kU6C8lQcoy3iZ6mz6YIxZj7XkTZwbceedHM0Fh3VL82LAz8utnt329MqrluOoK3cQsg0fbtxVTBI00er00Q7bsNPORjqer05VGi0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747475099; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=O8tAgC3YgnhIHe1YuRXJSAVSRr2vwaClSYm1fhgpSfg=;
 b=WG8WVYFirCsA4fFX4plOhJjigPExbO1ddIJu+9RMWuZO55wbjPCihtPuMg/Fd1PU
 d1OhyJjem36T3PYJU9QWgBjHxhGWM7KYL5npPy917POYfG9T9BbTd0OM0wj0xhSqZ4N
 lpHEmM416QJ9gjqwBCJWl8q3iP4ogA3lVg/8Nzlk=
Received: by mx.zohomail.com with SMTPS id 1747475096651892.4595465664207;
 Sat, 17 May 2025 02:44:56 -0700 (PDT)
Message-ID: <17f8e9490268bfd6c87960ef03a571a05364bf29.camel@collabora.com>
Subject: 2025 X.Org Foundation Election results
From: Mark Filion <mark.filion@collabora.com>
To: Etnaviv <etnaviv@lists.freedesktop.org>
Date: Sat, 17 May 2025 11:44:50 +0200
Content-Type: multipart/alternative; boundary="=-wipUEPiWUy1zDeRyIsi3"
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

--=-wipUEPiWUy1zDeRyIsi3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

The Board of Directors election concluded at 23:59 UTC on 14 May 2025.
For this election, we had 77 members who could cast a vote. 72 did, so
the turnout was 92.5%. This is the 3rd highest turnout in the last 10
elections, with only 2021 (93.8%) and 2016 (98.8%) being higher. It is
also a 147% increase from last year's turnout (62.9%). Thank you to
everyone who took the time to vote!

In the election of the Directors to the Board of the X.Org Foundation,
the results were that Lyude Paul, Andres Gomez, Arkadiusz Hiler and
Harry Wentland were elected for two year terms.

The old full board is: Erik Faye-Lund, Mark Filion, Neal Gompa,
Arkadiusz Hiler, Christopher Michael, Lyude Paul, and Simon Ser.

The new full board is: Erik Faye-Lund, Mark Filion, Andres Gomez, Neal
Gompa, Arkadiusz Hiler, Lyude Paul, Simon Ser, and Harry Wentland.

Mark Filion, on behalf of the X.Org elections committee

--=-wipUEPiWUy1zDeRyIsi3
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
 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-var=
iant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-str=
oke-width: 0px; text-decoration: none;">Hello all,</div><div style=3D"caret=
-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&=
quot;; font-style: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: r=
gba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">=
<br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); fon=
t-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -=
webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: =
0px; text-decoration: none;">The Board of Directors election concluded at 2=
3:59 UTC on 14 May 2025. For this election, we had 77 members who could cas=
t a vote. 72 did, so the turnout was 92.5%. This is the 3rd highest turnout=
 in the last 10 elections, with only 2021 (93.8%) and 2016 (98.8%) being hi=
gher. It is also a 147% increase from last year's turnout (62.9%). Thank yo=
u to everyone who took the time to vote!</div><div style=3D"caret-color: rg=
b(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; fon=
t-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, =
0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;"><br></div>=
<div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
&quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; fo=
nt-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap=
-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-=
decoration: none;">In the election of the Directors to the Board of the X.O=
rg Foundation, the results were that Lyude Paul, Andres Gomez, Arkadiusz Hi=
ler and Harry Wentland were elected for two year terms.</div><div style=3D"=
caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita =
Sans&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-col=
or: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: no=
ne;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0)=
; font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;">The old full board is: Erik Faye-Lund, Ma=
rk Filion, Neal Gompa, Arkadiusz Hiler, Christopher Michael, Lyude Paul, an=
d Simon Ser.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0,=
 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke=
-width: 0px; text-decoration: none;"><br></div><div style=3D"caret-color: r=
gb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; fo=
nt-style: normal; font-variant-caps: normal; font-weight: 400; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; whit=
e-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0,=
 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">The new f=
ull board is: Erik Faye-Lund, Mark Filion, Andres Gomez, Neal Gompa, Arkadi=
usz Hiler, Lyude Paul, Simon Ser, and Harry Wentland.</div><div style=3D"ca=
ret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sa=
ns&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color=
: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none=
;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-cap=
s: normal; font-weight: 400; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-widt=
h: 0px; text-decoration: none;">Mark Filion, on behalf of the X.Org electio=
ns committee</div><div><span></span></div></body></html>

--=-wipUEPiWUy1zDeRyIsi3--
