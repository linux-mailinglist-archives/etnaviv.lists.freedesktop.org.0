Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD1BE3C58
	for <lists+etnaviv@lfdr.de>; Thu, 24 Oct 2019 21:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBA06E629;
	Thu, 24 Oct 2019 19:50:01 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277716E629
 for <etnaviv@lists.freedesktop.org>; Thu, 24 Oct 2019 19:50:00 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so22167695wrr.10
 for <etnaviv@lists.freedesktop.org>; Thu, 24 Oct 2019 12:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7ZNrFFpCgADXLv8ONhdbj+eczc95wRKmi4stIr1Hmd4=;
 b=NUQXq1IaPo1pCECqf84DiXAANs1QwrGpDkk014QhFOWR4tK7a2EbnwrOYJuqC0T44r
 rOLumV7sILVRzuBMBGiNAcSYcdgJofM9aIVpQs2Pd0U+1UPtNczdXH/8xzsnR/kQSvgh
 00UqlDpk6IUbT60YEZEWbE2ofEeKpkfsu6nyruRwGwwLHMAn1DQPr9rcsT9ckW4dWGFV
 6cxU0X3LWy4KqxwcnBJEZe4Eg7r2la0oL1XTiJwq4u3gkcm2IpQaWsmLoHqNi/nKzhVg
 vSNfObwnUYAMo5Lxt9bd6C9YCeG0Qb9jlJMjnWEmc/cwUAPc+cactfLCjFrKRlVJ4Qq6
 6G2A==
X-Gm-Message-State: APjAAAXAYUiqXb9BU7b+Eevh0NsKPK0YR+pjkailZ3TW90r3FxoMLqJw
 vEC4IGu0duuDrUHa4+AsulzFE+QOrDK+TrHqlp4ExWIhlnY=
X-Google-Smtp-Source: APXvYqzKKEdXFwbiZM7NlgaJTpW4aQ/pl6NKfvzj0nqndWG4DOyyzkS7ogtdyoqlBjXqIHm83LukOpbVk2wMEs94I00=
X-Received: by 2002:adf:94e2:: with SMTP id 89mr4787882wrr.259.1571946598329; 
 Thu, 24 Oct 2019 12:49:58 -0700 (PDT)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 24 Oct 2019 12:49:47 -0700
Message-ID: <CAJ+vNU0F276LwQk4fSedaQjYDAs4i_TbWERE3F+Zd0SEjdn5fw@mail.gmail.com>
Subject: IMX6 accelerated desktop UI?
To: etnaviv@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7ZNrFFpCgADXLv8ONhdbj+eczc95wRKmi4stIr1Hmd4=;
 b=rdx0EeNf1KQcpodYOmw4wM5ftLJX9slVXpnrlaX7/0tHbYTaz+LHNtTC3blf8abcVu
 Y3mJdsTCKisR+v3Urd7XDIFwrQlAg9Pn71I+aQ+Mj+T3lA88NEXu+SEBAOkj/LnFDNfr
 scdxpJZQA7Yshk97YlN4u3wxPcFMG+EFPC5VD+pMopO6qr8rUl+xxzwLjEnC41hYML6u
 xEpm6PQpN+c/RFfnE74FGtPzrQv1ZTQd2o7Q4qiAR+/kChFcH58qDrn2h+ERAral+BgF
 5whMoMS550tJZYcJJDhpRFN8HghnPT5VCNd0q4DwYjJfZU3TtwyTkht+XHlZG5cmaMJk
 5kdg==
X-BeenThere: etnaviv@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <etnaviv.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/etnaviv>
List-Post: <mailto:etnaviv@lists.freedesktop.org>
List-Help: <mailto:etnaviv-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Michilot <mmichilot@gateworks.com>,
 Fabio Estevam <festevam@gmail.com>, Chris Healy <cphealy@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

R3JlZXRpbmdzLAoKQ2FuIGFueW9uZSB3YWxrIG1lIHRocm91Z2ggYSBwYWNrYWdlZCBpbnN0YWxs
YXRpb24gdGhhdCB3b3JrcyBmb3IgYW4KSU1YNiB1c2luZyBodyBhY2NlbGVyYXRlZCB2aWRlbz8g
SSB0cnkgdGhpcyBldmVyeSB0aW1lIFVidW50dSBkcm9wcyBhCm5ldyByZWxlYXNlIGFuZCBldmVy
eSB0aW1lIGl0IGRvZXNuJ3Qgd29yayBvdXQgb2YgdGhlIGJveC4KCk15IGxhdGVzdCB0ZXN0IHVz
aW5nIFVidW50dSAxOS4xMCB3aXRoIHRoZSA1LjMga2VybmVsIGluc3RhbGxpbmcKJ2dub21lLXNl
c3Npb24nIHNob3dzIG5vIGhhcmR3YXJlIGFjY2VsZXJhdGlvbiAoZGVza3RvcCBVSSBydW5zIGJ1
dApjbGVhcmx5IG5vdCBhY2NlbGVyYXRlZCkuIEkgZm91bmQgdGhhdCB0aGUgNS4zIGtlcm5lbCBz
dWZmZXJzIGZyb20gYQpjbWEgcmVncmVzc2lvbiB0aGF0IGJyZWFrcyBldG5hdml2IGFuZCB3aGlj
aCBpcyBmaXhlZCBieQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD1mMzA1N2FkNzY3NTQyYmU3YmJhYzQ0
ZTU0OGNiNDQwMTcxNzhhMTYzLgpJZiBJIGFwcGx5IHRoYXQgdG8gYSA1LjMga2VybmVsIChvciB0
cnkgNS40LXJjNCB3aGljaCBoYXMgdGhhdCBmaXgpCnRoZSBnZG0gbG9naW4gc2NyZWVuIGhhcyBz
bW9vdGggbW91c2UgY29udHJvbCAod2hlcmUgaXQgZGlkIG5vdCBiZWZvcmUKdGhpcyBmaXgpIGJ1
dCBhcyBzb29uIGFzIEkgbG9naW4gbm93IHRoZSBzY3JlZW4vbW91c2UgZnJlZXplcy4KCkl0IHNl
ZW1zIGl0cyBiZWVuIHllYXJzIG5vdyB0aGF0IGV0bmFuaXYvbGliZHJtL21lc2EgaGF2ZSBzdXBw
b3J0ZWQKSU1YNiBhY2NlbGVyYXRpb24gc28gSSBjYW4ndCB1bmRlcnN0YW5kIHdoeSBpdHMgc28g
ZGlmZmljdWx0IHRvIGdldCBhCnBhY2thZ2VkIGluc3RhbGwgb2YgYSBkZXNrdG9wIFVJIGdvaW5n
PyBJJ20gbm90IGF0IGFsbCB0aWVkIHRvIGdub21lCm9yIGV2ZW4gVWJ1bnR1Li4uIG15IGdvYWwg
aXMgcmVhbGx5IGp1c3QgdG8gZ2V0IGEgd2ViIGJyb3dzZXIgd2l0aCBodwphY2NlbGF0ZWQgMkQv
M0QgYW5kIHZpZGVvIGRlY29kZS9kaXNwbGF5LgoKQW55IHN1Z2dlc3Rpb25zPwoKUmVnYXJkcywK
ClRpbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5h
dml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
