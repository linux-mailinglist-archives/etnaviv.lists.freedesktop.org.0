Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C4A149886
	for <lists+etnaviv@lfdr.de>; Sun, 26 Jan 2020 04:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BE26E175;
	Sun, 26 Jan 2020 03:01:10 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAC06E175
 for <etnaviv@lists.freedesktop.org>; Sun, 26 Jan 2020 03:01:09 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id i11so6222468ioi.12
 for <etnaviv@lists.freedesktop.org>; Sat, 25 Jan 2020 19:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pC277UK/esWodFsoyHBl2oP99jU2X/nrntXrSTNlW4A=;
 b=sGOS9+Cvfcqpo9mlJfif8ZSYWWpgs8gLIOz4q4Ggtw87STH557b1zQziRlf9jrvRhX
 1yHEK5IH3KVZEFVV/fRppiowa4SuO0Br7nmb7zQBK2sQXy2tLUzny3lMXodAhYoC2lw9
 hLvzTNRLzgfNHnHu0BndtLlma07l7tU/il+0HKDNbViftbRwrWxsnPHXlCKisOArwcB3
 8xFwUj1j0O0lV0dc9uIgZlPqikbcaZCl+a3ShVWsvKhmW3ZNo1LeYz0vz72pBccGwWe1
 Y3Tpmtz0BRrrdMm1cfQCfiscpexoKU64zUtI+xYsm3rDxTK9iDrlyKqtAJ2KhZ9XmWtC
 uhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pC277UK/esWodFsoyHBl2oP99jU2X/nrntXrSTNlW4A=;
 b=Z5h+tSqBY7Wn0ocquvqfsxB4CCn8DRao1HEPuJNUoYXEgUitZ8Wj3Aw8VGPCP4Asaf
 5+6lLWeYfYTBxhW3XIaXA7l002eZDymn/Zb0xtaut5AyUuxfQN5o2JaJpRFp2ur1Kviw
 vbwwBwU/AbOFSc5OdS4wKlScQu1THsV+QNRfex/j3LWQ7PCrTc/rc2gBRB3nVgZjlzg1
 vMk41Andh6S+7IV/sF3loUgAAAXOHM5Qv1/qIssd45xkiG7GZj8mqSZUPlbc3pVprwhd
 C9baNH5Kq2cgIxyRvJ0+O3NGBuIjTnNU/b/id9R5hETBJpLKWVzeS86oxkNz8IfBABbM
 SOoQ==
X-Gm-Message-State: APjAAAUptzqAILrWA3OqhUtFERROkYRHCmGUNu7qnG7Pau386htFAOmF
 M8nboQaczRFcd8cLyUGWhskbhvPbzWnIVLVtBmpIHIb2
X-Google-Smtp-Source: APXvYqxrKr8XxD68TirMm8VkmpZeKhZuAfQLQ7k/ueqViqLNURW0HS3OanO7/kyNOrJF6Hf9xFBnT0XqQ4jMN21KLpM=
X-Received: by 2002:a5e:8505:: with SMTP id i5mr7485618ioj.158.1580007669017; 
 Sat, 25 Jan 2020 19:01:09 -0800 (PST)
MIME-Version: 1.0
References: <2aad-5e2cfd00-9-275e0440@259173318>
In-Reply-To: <2aad-5e2cfd00-9-275e0440@259173318>
From: Chris Healy <cphealy@gmail.com>
Date: Sat, 25 Jan 2020 19:00:58 -0800
Message-ID: <CAFXsbZqNnYpgm1n9ADgJdEWSvx-TeEcASRSCKUw=mznKNgnNCg@mail.gmail.com>
Subject: Re: Is there an i.MX8 HDMI TX driver that works with Etnaviv?
To: Bernhard Rosenkraenzer <bero@lindev.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Bero,

NXP has a 5.4 kernel tree with DCSS driver and HDMI driver that might
work with the 5.5-rc7 tree you have.  You can find it here:

https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/imx?h=imx_5.4.0_8dxlphantom_er

Regards,

Chris

On Sat, Jan 25, 2020 at 6:49 PM Bernhard Rosenkraenzer <bero@lindev.ch> wrote:
>
> Hi,
> I'm trying to get etnaviv up and running on an i.MX8 based Hummingboard Pulse, on top of kernel 5.5-rc7.
> Everything looks good, etnaviv loads and recognizes the GC7000 correctly:
>
> [Sun Jan 26 00:32:40 2020] etnaviv etnaviv: bound 38000000.gpu (ops gpu_ops [etnaviv])
> [Sun Jan 26 00:32:40 2020] etnaviv-gpu 38000000.gpu: model: GC7000, revision: 6214
> [Sun Jan 26 00:32:40 2020] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on minor 0
>
> Opening /dev/dri/card0 etc. works too - but of course there's no signal on the HDMI port given there's no HDMI TX driver in 5.5-rc7 (at least none that I could find).
> Is there any out of tree driver that will work (or could be made work) on 5.5 without insane amounts of effort?
>
> Thanks
> bero
>
> _______________________________________________
> etnaviv mailing list
> etnaviv@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/etnaviv
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
