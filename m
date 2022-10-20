Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB9B6069C3
	for <lists+etnaviv@lfdr.de>; Thu, 20 Oct 2022 22:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D146710E09E;
	Thu, 20 Oct 2022 20:44:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F159110E101
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Oct 2022 20:44:34 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 p6-20020a17090a748600b002103d1ef63aso810956pjk.1
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Oct 2022 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Jt+o5q+QQoG9zWgdQIQu84BSf/PCB0HahbcchF6vEyQ=;
 b=iodtlyC4Tzbs+Tedw1WKE18bKa2hCfn4qkXClkwH8Y/ceFzaLoFVx0fa+/HT6mLmav
 a2iVpol+98HJY0mLb8H0f+wqlXf/WYpl4CDZvf7M3Q8xINe++0cDFfSeSjtBeLLBLn7V
 Wd6Z/ZTjrlhAREa9q8IUgsfjztpa/qyPH16zIaIQjJUWxE9z4WvpOG3S2H8BzwYMqiI8
 LX7c+tHvngdMGevYydENkNmIEkK4wEM9rOHsmW2qQsvPsWUoY/aEQanNm3J+teWP4wH0
 KkOyfP+D3uPlp5bLlGAcpOzbQ+zL1EkI2A0wMnP/PtwDiBF4WOpy1iPukj/YRWeAHucI
 dMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jt+o5q+QQoG9zWgdQIQu84BSf/PCB0HahbcchF6vEyQ=;
 b=oBqE889NO32F4g8ztQgEUlbeOj70pxanOcYqNXhP46mu+RYsU0mB0DB7QLbyAl5F8Z
 TKjXBGDeK1IXqObAVpF0UfVm3nNHPDqeB2/IR7Y5jWYAHfWLYex5A7WLeT4C7Tds8oc3
 2XjyFyKQcgiWcN6WWTK8igWuUzMdjGO6bnoIKJ6+8cnNcHlfJVxVeqiyLQ2jcy5mqHhe
 ifMFX6gjBpsFfYTU0+XfRBD7O/3kfgx5ZqPaF8wuKffOgoZwpIQRwZDjxuIlYub14/dP
 poPyKOCfr3XIQgOzAn8j77TU21fnzeZlUW1ogi/PiQAnSoy0681RLUQKzC957AkXNaz+
 rV6w==
X-Gm-Message-State: ACrzQf0wcBVMZktzAJXaWfJygcDmsqwLsaln6cOkDVhGlNY3fIfDgtbn
 1lr3jzY4pv7XsERBh4pzn+wHs0bbK2eblOg91zQEeQ/4CvRxdw==
X-Google-Smtp-Source: AMsMyM6ppTKjTDigK5dw4q/N3KihTqTlrbjXYszynZsqMSqdHDIdEyaNp9/eCVrdZCvLPeSBzPZekzyFNkFEC6h7KSw=
X-Received: by 2002:a17:90b:224d:b0:20d:8828:3051 with SMTP id
 hk13-20020a17090b224d00b0020d88283051mr17613903pjb.89.1666298673916; Thu, 20
 Oct 2022 13:44:33 -0700 (PDT)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 20 Oct 2022 13:44:22 -0700
Message-ID: <CAJ+vNU3zyrAOVWmgPJpRLzMm1V05b9rEMeb6=4AutmZC_rJN8A@mail.gmail.com>
Subject: IMX6 etnaviv issue
To: The etnaviv authors <etnaviv@lists.freedesktop.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Fabio Estevam <festevam@gmail.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Greetings,

I use a standard Ubuntu 20.04 focal rootfs with a mainline kernel on
an IMX6Q based board and have had no issues using things like gnome
desktop, glxgears, glmark2 however recently I updated the rootfs to
Ubuntu 22.04 jammy using the same mainline kernel and now I see some
issues. I've replicated the issue with several kernel versions
including 5.4, 5.10, 5.15 and 6.0 so I would say this is not a kernel
regression but something related to the graphics stack being used
which I'm not very familiar with.

The issues I see can be described as:
- mouse cursor is incorrect (looks like a hatched square)
- glxgears shows some sort of sync/jitter issue and has a fairly low framerate
- glmark2 shows a some sync issues then after a few seconds results in
a GPU hang

My ubuntu focal image that appears to work fine has the following:
gnome 3.36.5-0
xserver-xorg 1:7.7+19
xserver-xorg-core 2:1.20.13-1
xwayland 2:1.20.13-1
glmark2 2021.02
mesa-utils 8.4.0-1
GL_VENDOR: Mesa/X.org
GL_RENDERER: llvmpipe (LLVM 12.0.0, 128 bits)
GL_VERSION: 3.1 Mesa 21.2.6

My ubuntu jammy image that has the issues has the following:
gnome-41.7-0
xserver-xorg 1:7.7+23
xserver-xorg-core 2:21.1.3-2
xwayland 2:22.1.1-1
glmark2 2021.02-0
mesa-utils 8.4.0-1
GL_VENDOR: etnaviv
GL_RENDERER: Vivantte GC2000 rev 5108
GL_VERSION: 2.1 Mesa 22.0.5

Does anyone have any ideas on what might be going on here? I apologize
for my lack of knowledge regarding the software layers on top of the
etnaviv kernel driver being used here.

Best Regards,

Tim
