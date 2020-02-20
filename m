Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE5166436
	for <lists+etnaviv@lfdr.de>; Thu, 20 Feb 2020 18:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859356EE07;
	Thu, 20 Feb 2020 17:19:57 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B82A6EE07
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Feb 2020 17:19:56 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id f5so24369205ilq.5
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Feb 2020 09:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HKi71xA96O4CUhQ8GEhyBhb924uVKFebuvLZE9+QNgE=;
 b=X3pCu8995AcnPJyBkSyn0ovxocot/Msa5WisCVfTdfrGY0qCazxkCpAtJHAC3r0KhB
 x+hC+cR1VcSOXHcEiIze67mKtAO94xZycUVs2EGfjR/8a74R1GE07oKzu6ZUYOY5++wb
 /Ml3bnEvWj8wyiKQPuPfwsGZrOJmLai5Qmb6wUkhghQEkRPOoRgXICNL1QcLzk8RDlee
 Fy9suXVUFonJX6hGJejKeKgBrlQESrMTWYHjdqp9/3RwfYmQEDjvJolT19xTHRkLfydQ
 ohbEfeLc6b4H7uwwiHPtB6U/IBd3hkUA1yAQiwky+QRfDZ+ybcVEXyd3D/ddsw885cbH
 yCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HKi71xA96O4CUhQ8GEhyBhb924uVKFebuvLZE9+QNgE=;
 b=shrPElAK35Kr3PRyH9YWZCfchcwuucfdbni9YSBx2hUbdwIJN+Wh91gR5i+y2uvA3n
 Y+fexv40WoJFRV+3aL9ljbHQMIyEq/JbLEJHeUaL8yVMnOU23Q5zKSLrSxkpFtbZ2Hie
 gEWsoo62FPNVRsy1heXjZeVYkHlbvGM67GaU6AR+hDqIWfeH+5Uga910fd2CIT/r4PeC
 CnSd8JdSzp3ZcRKwXCKwY3Cv5+douPsYBR3+KnoNOJs4mPLu6B2vIeGY+6RmWctHPGgl
 YzI36a+HKAMg2Ry/1/kNVMWI5GGroUh9bB61LezFv4XVShuP1VlC0qPbyc7NSdNx/P/g
 IPZA==
X-Gm-Message-State: APjAAAVj68BwLJCMP3G2d301LiCI1WDP5RNf6ydOJo9r1mE7eUm8BuWR
 Iq5RxWc/MqEj+4ivEU9ZuCSWvI6jwxytz36YEbYujDKg
X-Google-Smtp-Source: APXvYqyIX8Qv3sGIwJbcuNaxfUjSQW9bvq9PaGNDs/zrXhk4IXzlvHf2nUuw0tyPmU1JwwEgRwI9DSOIJEHrB4W7ves=
X-Received: by 2002:a92:af44:: with SMTP id n65mr29119112ili.158.1582219195515; 
 Thu, 20 Feb 2020 09:19:55 -0800 (PST)
MIME-Version: 1.0
References: <2704d3bd-5563-8951-58f7-75a906782754@kontron.de>
In-Reply-To: <2704d3bd-5563-8951-58f7-75a906782754@kontron.de>
From: Chris Healy <cphealy@gmail.com>
Date: Thu, 20 Feb 2020 09:19:44 -0800
Message-ID: <CAFXsbZp9kW555gm+8Cz+oQVRNSzVzzQO2rM5YqzitCd6T7KN6Q@mail.gmail.com>
Subject: Re: Etnaviv issues on i.MX8M-Mini
To: Schrempf Frieder <frieder.schrempf@kontron.de>
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
Cc: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Frieder,

For your #1, can you provide more detail on your configuration?  What
is your display resolution?  Are you running Qt with egl_fs or are you
running on top of a compositor?  If you are running on top of a
compositor, is the 3D GPU being used for compositing?

For your #2, at least in the case of the GC2000, the GPU cannot deal
with shaders that have more than 512 instructions.  The terrain demo
has a shader that is typically larger than 512 instructions.  I've
always seen the terrain demo fail on the GC2000.  With the GC3000 and
GC7000L, this 512 instruction limit does not exist and the terrain
demo has always worked.  Likely the GC600 has this 512 instruction
limit.

Regards,

Chris

On Thu, Feb 20, 2020 at 8:56 AM Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> Hi,
>
> according to the documents, the i.MX8M-Mini features a GC320 and a
> GCNanoUltra. I tried to run the etnaviv drivers and the following GPUs
> are detected:
>
>         etnaviv-gpu 38000000.gpu: model: GC600, revision: 4653
>         etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341
>
> Running some demos and tests with mesa 19.1.6 most things seem to work.
> Still I currently have two issues, while the first one is kind of a
> show-stopper and the second one is not really important as it seems to
> affect shaders only.
>
> 1. When running any QtQuick applications, all transformations like
> moving elements are really jerky and not smooth at all as it should be.
> Any ideas what the reason could be, or how to get more information about
> this problem?
>
> 2. With some demos (e.g. with 'glmark2-es2-drm -b terrain') I get:
>
>         error: compile failed!
>         etna_draw_vbo:222: compiled shaders are not okay
>
> Can this be fixed somehow, or is this due to the limitations of the GPU?
>
> Thanks,
> Frieder
> _______________________________________________
> etnaviv mailing list
> etnaviv@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/etnaviv
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
