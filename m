Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8244272714
	for <lists+etnaviv@lfdr.de>; Mon, 21 Sep 2020 16:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C1B6E116;
	Mon, 21 Sep 2020 14:32:47 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33FD6E116;
 Mon, 21 Sep 2020 14:32:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id c2so11273571ljj.12;
 Mon, 21 Sep 2020 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wBL8Q/ffRDhmMr6Se2sX1WfFXJDxUENtQfVVk2J04eY=;
 b=vGx27WixydDle95mA1ksz74L/4R+EVWDFzcYq0kaXZgy4kuqjYUbHWCwIM8LKgd11w
 Qap/XN4kZMcfDynD+xNzT0vBY4bPMHSi2zu81geVt5xWAidQu3NQO/Hwif0VUFnW0YUR
 R0qe4/RTc3On49bAVCp/Aj09SJJiYP+LbkMxQNnbCXtTApUorzMKTEc9UfsIxXmZnprG
 xlWmcZ9TFXH+0ZwHJfqmwboPqdsiWGOghgH5pW9beNIg/njBrrfFffD5kpOhAFWqGYHG
 +c15qnuopfOLj1691Pmh4gTTCLwsbamk0ul9bRaJe/w24+IdOb2gXsum5ktx+DPkkbyY
 tOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wBL8Q/ffRDhmMr6Se2sX1WfFXJDxUENtQfVVk2J04eY=;
 b=hNESzWVq2+XaKTcPlyoYyo5NS1lDvUNgWXL3x4iewBjxPgI37XjecXGacJV0j1rp0l
 orEpz/O2HHgD/9+j8KLcoZO65+KRUaNKJ87AZZKuniDwG3v1cE659BcvGX6WtTuICl64
 nv2NhkJiUqErSNTWEWhGn99SpbcKphQjypG0ErfRGXBUayB/8oXD/1Y6ukuQdwZgWo8S
 scZ+NTVT9XXRr9HmgmtP3ki4mHj30YFC0ohZrI5GqUTD8fEyMQbmi1bxRtX1TCkUU23B
 6pqixJO6Aij3JpG6uDV1kSRXBE2luXe74Q04xAWvC1z9aIN79vHSynaJtEEAJqYoZs6/
 HXXQ==
X-Gm-Message-State: AOAM530n9rdbmxfC0/u+WKPhsqpGowpGC5asK1GDXceY7jOCXqv1a1C0
 xAoykGeocAR5oCcWPa9MUXuip5qn+JmhdUSBCOg=
X-Google-Smtp-Source: ABdhPJzsYJqwAXpFe6kWHZ36ur7vjSBJTQ6iBg/yIT9+UrWm2RiWmQ521WMzDj3EqJoqETAg12IILvF3YReVl1QO84o=
X-Received: by 2002:a2e:9743:: with SMTP id f3mr16684ljj.310.1600698765046;
 Mon, 21 Sep 2020 07:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5C=XTOepsy7NJqS8DsL=9h0PvE8VyMSad4Jc-u89ccO_A@mail.gmail.com>
 <e29e8ef235407831ed3f5e8d5d54763f79183025.camel@pengutronix.de>
In-Reply-To: <e29e8ef235407831ed3f5e8d5d54763f79183025.camel@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Sep 2020 11:32:33 -0300
Message-ID: <CAOMZO5CkhFrR1FGtD6W9K7oHmG6+LwaixEW2DM-+K1KgHKR9ng@mail.gmail.com>
Subject: Re: Etnaviv: eglCreateWindowSurface fails with glmark2
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, Adam Ford <aford173@gmail.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Lucas,

On Mon, Sep 21, 2020 at 9:59 AM Lucas Stach <l.stach@pengutronix.de> wrote:

> Try starting glmark with --visual-config red=8 as a workaround to get a
> scanout capable visual.

You are right: passing --visual-config red=8 works with the old
version of glmark2.

The latest glmark2 version works without passing any extra parameter.

I believe this has been fixed by this glmark2 commit:
https://github.com/glmark2/glmark2/commit/c50755b5a19370fef5b865c9a4a9eeb0bbe56a8f

Thanks for your help!
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
