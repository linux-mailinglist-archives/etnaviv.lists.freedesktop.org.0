Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF789447D45
	for <lists+etnaviv@lfdr.de>; Mon,  8 Nov 2021 11:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E535B6E92D;
	Mon,  8 Nov 2021 10:06:21 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E6A6E92D
 for <etnaviv@lists.freedesktop.org>; Mon,  8 Nov 2021 10:06:20 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id j21so60007605edt.11
 for <etnaviv@lists.freedesktop.org>; Mon, 08 Nov 2021 02:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GV3ZwdlgA6/4x6WHLzAnUaIVvX2rcVy9UBWcbqDh190=;
 b=LEyQZ7dKU3Ix3k7cK5iR/Buse1w5aSDE95DkqWJKh8PZ6J1kqEipfByksAME7XfEHZ
 oP7r9nOhbb3GCt++2pk1Uf9+w7GhcLPZWrO8B0TtXvnbcWcrplNqSs2Kj3DvyfoRoavt
 e5VMPWQuzLl6xU2xj2r9NS2sG2dKSyaxxmg6ZJujFzR9PjAYi3Ni1go2OmzFht39dlS7
 gKx0X082dTDl2XfcATq4zZMtCqGJU0q4n+yX0Hou85qV/x2whC1hHqawEQuHPVsux2ZZ
 TGwkSw3LaMBB5Q8zCsIDRn+n+tZxjlyQ9VWQS1beAqhbNmQj5RI1GivXNP5RAIpfzri6
 oSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GV3ZwdlgA6/4x6WHLzAnUaIVvX2rcVy9UBWcbqDh190=;
 b=qLT1QO9tHrYWsIqVEWZpNIi98JTuja/AYr2otDJVUwZRpK1TDJ8mjiwMBxH5Fuw6qE
 CP5NmdEKNkiZz2prg5G1zVphI7z8pOMKrdZP61zARaJI0w/sNt/UUX7XZU9p7Uad+Xku
 PMI2RInHGJ5Hgb+xp14vfMmIesh4IqLKQJ1/M0mk8Hwcdq8NKxatwId/vOAZhEeqN7j+
 ibqIROwqdcWHQH14Y7udgqPAs5Iyc6FW5ALJnWmni8Mbp/+PuElbNLoElaeLeuNAwxx0
 TpmxXKf8EKWvNsY3FWuT0LAR5HbJ7VC5nc5YOhDSWY99GC2eOGfeslEf9WzlzQL81bBA
 ibhQ==
X-Gm-Message-State: AOAM5301PEFj7mjUS+gxwfDMFoYg1dc/annMB006TRv5K74cJ/jaBoUI
 Lmf7t2+zx3wX8Mc00V4NtNDwjdGiIZwgkfdH9Fk=
X-Google-Smtp-Source: ABdhPJyLvGV9SbbZIs13BExBfNAIcJF5x1MmpyktqRvGPqjmgwty0bhhK9QTbieJxC3D/pGq1zKwWonmV8f3A+QbKZg=
X-Received: by 2002:a17:907:9156:: with SMTP id
 l22mr47729765ejs.220.1636365978534; 
 Mon, 08 Nov 2021 02:06:18 -0800 (PST)
MIME-Version: 1.0
References: <CAFrQVPNPAoJQehVEjtfreCTf=A=O3q254+ecWbWD95NLw6P=bg@mail.gmail.com>
In-Reply-To: <CAFrQVPNPAoJQehVEjtfreCTf=A=O3q254+ecWbWD95NLw6P=bg@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 8 Nov 2021 11:06:07 +0100
Message-ID: <CAH9NwWcQSZNGNrVL7H8heQ9g4qj1PzQ36zifyG6PunbxvgEj7A@mail.gmail.com>
Subject: Re: glxgears corruption on gc400lt
To: Kyle Russell <bkylerussell@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi,

>
> I'm trying to use etnadrm from xf86-video-armada and the etnaviv driver f=
rom the 5.4.90 kernel with Xorg 1.20.8 and mesa 20.0.2, but occasionally gl=
xgears displays corrupt output.  When corruption occurs, it lasts for the d=
uration of the boot cycle.  On other boots, glxgears displays fine, though =
it's very inconsistent.  The corruption is not static.  The triangular shap=
es seem to correspond to the colors of the gears, and appear to rapidly "da=
nce" in the window.  Sometimes faint shadows of the gears can be detected b=
ehind the corrupted region.
>

Please update your kernel to the latest 5.4 kernel (5.4.158) - there
were some MMU fixes on the kernel side.

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
