Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB106272490
	for <lists+etnaviv@lfdr.de>; Mon, 21 Sep 2020 15:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0313389B0C;
	Mon, 21 Sep 2020 13:06:24 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41780898C6;
 Mon, 21 Sep 2020 13:06:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y2so13898807lfy.10;
 Mon, 21 Sep 2020 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ODLJe6m8RMLMn/uRVhYRKpPwZah/fy7Izx107WZahPM=;
 b=rTdShvq+0Oc10KMVF5CGoMiE3qSddVzlZELySCAaODXcDYcozZwJNwDF/uQhr5/W1s
 kDyrNqhRS8BckNdjsmdxa2YlXuFPf2EI7IWFPP6b0Km5j+Yc4mnK5i1pQlv4CiG+U31a
 h3L2dJe7LAB/9WhOO/XUoq4XWLYVAeS66lzzsFTy5wxCv0XQu+MMiyUzLm8xD5vHH6W5
 1tgGUnrvfWKn3P8DySqJERPm9Ktll0WNXqaXHDMYkUs5tA5YJDNsEkIYXWQv1vCkKVWZ
 tnGc4n4Y/302VMU6AWWZUPoDnQLGaMsDqYBJbH4Zt3jF2R44daJCecd0efRq/swPgzQN
 S8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ODLJe6m8RMLMn/uRVhYRKpPwZah/fy7Izx107WZahPM=;
 b=FulgquEFvhd5s5UWpO3N8csQ1GRcZ1oos2KUU/hDzAUeqGihGMx/p5MnnJPd7XqaEP
 hktDxO6EhHPCSeDVCWr45pLNfiX7yp3bmtF9w0apkPuCRciC2qksj1E4m2nLIYrDS6tT
 dUG8J2w614kUnEev0f5IFz8eVj8ISJGl+UaCG1GRHj1xFyll9k29exPxlWR2AyXfGLNp
 0sbUIhkDJ4wxGnzYArEednqDv5EwDAp49JnjXbkRWytAb5MIL4f9xu1aowgfKh5xCRPr
 unAsys0RBXvsk6C+7nJK6+gwwJ3DgzU6E9kpnCClpqPcA+auRTE6pH5i9MFIxOecsYN8
 IEDA==
X-Gm-Message-State: AOAM5338AEiTpJ5BuuarBoNpFuBuqYvhY6Us4n0uwXqiptZImH4rR6eR
 RBltIQqZK5f1ZDZg1FtGbZqqs3LcO+reZpAoAJk=
X-Google-Smtp-Source: ABdhPJz+4wTq8fAd1MpUS2t3b+DTcY8VrwgVWxII5MkSQg8fHjg154P50n6lNnjUuOUKbzd7+GxOIeEusxEJfRC6X30=
X-Received: by 2002:ac2:4e92:: with SMTP id o18mr16817905lfr.527.1600693580577; 
 Mon, 21 Sep 2020 06:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5C=XTOepsy7NJqS8DsL=9h0PvE8VyMSad4Jc-u89ccO_A@mail.gmail.com>
 <e29e8ef235407831ed3f5e8d5d54763f79183025.camel@pengutronix.de>
In-Reply-To: <e29e8ef235407831ed3f5e8d5d54763f79183025.camel@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Sep 2020 10:06:09 -0300
Message-ID: <CAOMZO5CWNPtA8Wgq0cER_QRE_b5Q6gqrUjYRsSzs2mBUAb2Ojg@mail.gmail.com>
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

> Since a while Mesa offers 10bit EGL configs, which have the highest
> priority and thus get selected if the application doesn't care about
> bit depth. imx-drm is unable to scanout those formats.
>
> Try starting glmark with --visual-config red=8 as a workaround to get a
> scanout capable visual.

Thanks for the suggestion.

I bumped the glmark2 version to the latest one in master and now it
runs fine without any extra parameters.

Thanks,

Fabio Estevam
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
