Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDAC117BA
	for <lists+etnaviv@lfdr.de>; Thu,  2 May 2019 12:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA1B893A8;
	Thu,  2 May 2019 10:59:34 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92727893A8;
 Thu,  2 May 2019 10:59:32 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id o10so1071468vsp.12;
 Thu, 02 May 2019 03:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rZsT67+c4uJvTcGXYTLRzQ4Ghep3JyjkMr+I6iHwNto=;
 b=lAkw0zzrFxHFbd5SeZcZV6PmdAgIlrn7s5nPVYZHaECWbh3TUKFqo+0EWu7WvPMzxT
 TWxXp2E2EGVZjMZ2ZuAhB7cFXkITcX34nMq3q2PeTTFeFPQZOJcdpqxNYbMInysgEP3s
 ZHaTA8QvQB6LfuAfLN0uP651FTMSdlEN1LGAGkd6EymI56AqlK9ILZgW519jrW685zNO
 J46o2F+uCm4cePk3tq/timj7Pn1eimJMrKHdbmc6uSTZvlvOOSIIc08KdEE4NIrfzpja
 vvPXuCo+6cmzHmdEb4/CiiBydzdcfM04GdeMgBlBpNKCEqZAyxiucCx0LsCU1munIWpE
 rnpw==
X-Gm-Message-State: APjAAAWek9CU9Z/Vnut2zZdgG64Da1nOpJ5tczy9Xz2NQN5isc8gRv30
 4KYv1m1vNWhcKoCyvi/cZaqFZDrZHwdwwpnsvvI=
X-Google-Smtp-Source: APXvYqyTXsbsdb1/ulvGsc05BwTPJEqIMeESSbr+VNcQX4G7ZoJIsOJwF2tFR0RdJuOW7RS0Z7oKY/hCZLLQ4CHgxWs=
X-Received: by 2002:a67:7494:: with SMTP id p142mr1559831vsc.72.1556794771712; 
 Thu, 02 May 2019 03:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190412173820.24491-1-l.stach@pengutronix.de>
In-Reply-To: <20190412173820.24491-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 2 May 2019 12:59:20 +0200
Message-ID: <CAH9NwWfTWma+dMu9egdV8vQ2542CwjnNj7WT=akubmPCnf7=sw@mail.gmail.com>
Subject: Re: [PATCH 1/8] etnaviv: create optional 2d pipe in screen
To: Lucas Stach <l.stach@pengutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rZsT67+c4uJvTcGXYTLRzQ4Ghep3JyjkMr+I6iHwNto=;
 b=sPBFmKpztKX/pyMIX+ZLmEc1Z3VhkZnZGNIzkYrgzzXCE+qJt4/2rjZNknjsC/nEXV
 Zb19vCpGvqGQrdWqL0WqAOOKLGxkJorOCuLJJnDOJmDAbTdkPcl95PZhpRcC2Tr9wpsM
 y76GH75fScNN89d1+atRf0Q7mPPZq4oyLZiHJ9DQ/Z+/rtE5QBjg+ZhQE3a2ygf1cIk3
 SmPue2xN1BEcv9kNyY9o49on4+KXBoDQoPLMf7p0HbgqIhH6e8QyTJHYoum6mURVTWPT
 x2ozT85VEZsb+zbves1dN0KGNf6Cu1Kl6iXBXk9otHGIcI+E7gNxZezUOVmwvHd52xNB
 9fYQ==
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>, graphics@pengutronix.de,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgTHVjYXMsCgoKQW0gRnIuLCAxMi4gQXByLiAyMDE5IHVtIDE5OjM4IFVociBzY2hyaWViIEx1
Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPjoKPgo+IFRoZSAyRCBwaXBlIGlzIHVz
ZWZ1bCB0byBpbXBsZW1lbnQgZmFzdCBwbGFuYXIgYW5kIGludGVybGVhdmVkIFlVViBidWZmZXIK
PiBpbXBvcnRzLiBOb3QgYWxsIHN5c3RlbXMgaGF2ZSBhIDJEIGNhcGFibGUgY29yZSwgc28gdGhp
cyBpcyBzdHJpY3RseQo+IG9wdGlvbmFsLgo+CgpkbyB5b3UgaGF2ZSBwbGFuZWQgdG8gc2VuZCBv
dXQgYSBuZXcgdmVyc2lvbiBvZiB0aGlzIHBhdGNoLXNldD8KCi0tIApncmVldHMKLS0KQ2hyaXN0
aWFuIEdtZWluZXIsIE1TYwoKaHR0cHM6Ly9jaHJpc3RpYW4tZ21laW5lci5pbmZvCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBs
aXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
