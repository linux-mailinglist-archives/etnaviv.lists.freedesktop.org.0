Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C923290A08
	for <lists+etnaviv@lfdr.de>; Fri, 16 Oct 2020 18:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D385A6EE38;
	Fri, 16 Oct 2020 16:55:57 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3366E15A
 for <etnaviv@lists.freedesktop.org>; Fri, 16 Oct 2020 16:55:56 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id e22so4191503ejr.4
 for <etnaviv@lists.freedesktop.org>; Fri, 16 Oct 2020 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=yesC0rGnLlQAZPiZaqdN/x0LC9McaRyVdTIM8cXn1VA=;
 b=F8Ypt+Z3t8cFAOGgAkNWZZXCVCxUn75aAcwiwt6Mxy1in/JKWmdM7t9bC8hDtb9VS4
 hRDHwTV4ufvUk9WExkLXBv19taBT8mGx85ly1Dx/9GXPWsxQeEpnl6uMxkjk0GSJ9GI/
 Xp82swK7MnQ1y30FoLv8ksUhxDUvaUNh2kQVoXvRH0T0QBpMuAaV+D0HBDIxNy81w3+b
 N/pnozxddcaRDSlFEFKl7u7hd6ALj09kH4c+C0nj6RBxxmqg6U8LWUlR8EfwsKEAU6bK
 m8Hc3iRoMYYIBjogX/0TdW5bGUYAv3X1ckTahVFRGpmKPZ+kEHhFAz81uJcDziIlA/pf
 FOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yesC0rGnLlQAZPiZaqdN/x0LC9McaRyVdTIM8cXn1VA=;
 b=ZUWxe0NOM6sKUd+ErNNl0GR23lqXP9Kftofgs1YGP3W7Q3IkjuAh9dTGmjm7+cqs2k
 8bIg/PtIafCOR0N+1fz2jSWpj3MV6eWu8ldu8M8mcjfDTyHkeyDrxeYxRxZ9Nsx0VEBi
 EV6uUP174QZ4qVKTtyy1hxWIvRpqKmlSK40O6VxawY2HqG/KS3HfRfkw/I1FlURSM8Jk
 BoIo22Fpqt5CObQSmzlQm257axSDEe60X8+hJMayUjmOwrj8pqqFouo5kbJHseCWc3qM
 ndGk1pUmgX8nKe5YtOBodl336E5S6+qEHc/F9dCPslN9lqtSJdTwLn0OH6wNkc1f9fEF
 rfJA==
X-Gm-Message-State: AOAM530ekYPklHGlcwkWsBSONZop2duI/pcEFD2My73xBHjVMALByn7B
 9uj8eOWlQzp6qRPdE+64qxKNH72sagsnYdsszW2oo+LCqvRMafue
X-Google-Smtp-Source: ABdhPJw0LNQZhv33vEenA3IUUZnWDS45921IsjPyDvtyeiGUYS16QsWRGUdBAK0sW3/+4CIufAi+Gg08otDNfWsSiVA=
X-Received: by 2002:a17:906:1b01:: with SMTP id
 o1mr4898829ejg.539.1602867354775; 
 Fri, 16 Oct 2020 09:55:54 -0700 (PDT)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 16 Oct 2020 09:55:43 -0700
Message-ID: <CAJ+vNU1M=GxceoURX+SffkQHSxVr3fKUxwysbZmU1-jAu0YY_A@mail.gmail.com>
Subject: OpenCL on etnaviv?
To: etnaviv@lists.freedesktop.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Greetings,

Could anyone explain if OpenCL can run with etnaviv? I'm also not
quite understanding if OpenCL has specific hardware requirements. I
have users that I support wanting to run OpenCL on an IMX8M and am
finding that NXP states the IMX8MM doesn't support OpenCL (yet the
IMX8MN does)  and I'm trying to understand if that is a technical
issue or just simply that they won't support it through their closed
Vivante driver.

I suppose for my own education I also have the same question about
Vulkan. Is there specific GPU hardware requirements for that? My
understanding is that things like OpenCL and Vulkan are just software
API's to tap into the hardware units.

Best Regards,

Tim
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
