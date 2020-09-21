Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88581272409
	for <lists+etnaviv@lfdr.de>; Mon, 21 Sep 2020 14:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB236E27F;
	Mon, 21 Sep 2020 12:41:38 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5B489D4B;
 Mon, 21 Sep 2020 12:41:37 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id y4so10944243ljk.8;
 Mon, 21 Sep 2020 05:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BVEVDz8/h8Cio7/Afbst/YZ+fxiVgc3gkfyUGdSiHz4=;
 b=J+2c+k7vKCaxG38o6rs3iahzsPYrEgpKMCHtKM6Q+rHbPWsLBIvpbQn4eKEFw+CEgd
 Y9pcGhzLagagh0bLe1IiBlxThS9eECmgImVSeuE0YqrdPHb1GoYIeeKYIVKDYSG1gICd
 fHrYA2A2ERI3iIxApyyIirait/u+UUExezh4hOLRVd2/uJwRS7QHA6jsL/ryuwMisIxm
 3gonDC97mrKHLTMYuugbtWBgVBsbvTJwBI/9KDuW2Pz+RhoZch4AiojpTXZ/NjbIFq+Q
 fYZXZ0pPlnmjl8SCb/rAqTTSIl8/gNaX6C94CZEklcJrNVvIYOzrEEgFOms+XguDlugn
 jKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BVEVDz8/h8Cio7/Afbst/YZ+fxiVgc3gkfyUGdSiHz4=;
 b=JeKJQpGKuflGZWspMjKU41uYq+0R2appUfPymF4Yee2HDjrBHxdIvL3OTmy0IUB0og
 8B/l7zCToUfNRSsUVbJf3SV+hw+GVu7xhFM2TVETbtS+M6H+jCw/3jcNHIapTlrYUQXn
 ZsVqWX0L/Lg+feDMaI6VWiAwBrhDzsWcD6U0HxqF9SFvYJxoeUmy1JGnn+YEs3Euscf/
 sO4Ibk36GM9DmVLd8KPzr5ZLgs5MPLwLxngAEJCjxAnp5UYRt4zCN/+zG5blz0N2oANG
 eeZXGkvOvHPsIiZJjNyb1mK06UcWc57VI2aXhEVZC0Wfx3r0sbbKfpr9Dsr/W+4CiZgN
 3t9A==
X-Gm-Message-State: AOAM532XpylAWvZaVmcWg9kkhESSymhw0BbYIjuTLSVZx0Q+PLdye2Ea
 4hZ9zF4UvQkdJGEqQen3TShiApDQRU8KtUHo8Rk=
X-Google-Smtp-Source: ABdhPJwEZrClRPIH9vx8ftIHbXAHKg+40uvixJ8hU+c8XQdOLf87/Ai9P4oAa4hLLNh2pQiauiijkI8CirOSt6T60u8=
X-Received: by 2002:a2e:b4ca:: with SMTP id r10mr16438436ljm.452.1600692095580; 
 Mon, 21 Sep 2020 05:41:35 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Sep 2020 09:41:24 -0300
Message-ID: <CAOMZO5C=XTOepsy7NJqS8DsL=9h0PvE8VyMSad4Jc-u89ccO_A@mail.gmail.com>
Subject: Etnaviv: eglCreateWindowSurface fails with glmark2
To: Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Adam Ford <aford173@gmail.com>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi,

I am trying to run glmark2 and I am getting the following error on an
imx6qp-sabresd with kernel 5.8.4:

# glmark2-es2-drm -d
Debug: Using Udev to detect the right DRM node to use
Debug: Looking for the main GPU DRM node...
Debug: Not found!
Debug: Looking for a concrete GPU DRM node...
Debug: Success!
Debug: Trying to use the DRM node /dev/dri/card0
Debug: Success!
Debug: Using eglGetPlatformDisplayEXT()
Debug: Got 6 suitable EGLConfigs:
Debug:
Debug:     cfg buf  rgb  colorbuffer dp st config native support surface sample
Debug:      id  sz  lum  r  g  b  a  th cl caveat render  visid    type  buf ns
Debug: ------------------------------------------------------------------------
Debug:     0x2  32  rgb 10 10 10  2  16  0   None   true0x30334241
0x4   0  0
Debug:     0xa  32  rgb  8  8  8  8  16  0   None   true0x34325241
0x4   0  0
Debug:     0x3  32  rgb 10 10 10  2  24  0   None   true0x30334241
0x4   0  0
Debug:     0xb  32  rgb  8  8  8  8  24  0   None   true0x34325241
0x4   0  0
Debug:     0x4  32  rgb 10 10 10  2  24  8   None   true0x30334241
0x4   0  0
Debug:     0xc  32  rgb  8  8  8  8  24  8   None   true0x34325241
0x4   0  0
Debug:
Debug: Best EGLConfig ID: 0x3
Error: eglCreateWindowSurface failed with error: 0x3009
Error: eglCreateWindowSurface failed with error: 0x3009
Error: CanvasGeneric: Invalid EGL state
Error: main: Could not initialize canvas

kmscube runs without issues.

glmark2-es2-drm used to work fine with older kernel/Mesa versions.

Does anyone have any ideas?

Thanks,

Fabio Estevam
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
