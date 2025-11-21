Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F493C7BA5D
	for <lists+etnaviv@lfdr.de>; Fri, 21 Nov 2025 21:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E958710E8FE;
	Fri, 21 Nov 2025 20:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L+zvWL/N";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1825210E8F7
 for <etnaviv@lists.freedesktop.org>; Fri, 21 Nov 2025 20:35:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C45AC43558
 for <etnaviv@lists.freedesktop.org>; Fri, 21 Nov 2025 20:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF4FC16AAE
 for <etnaviv@lists.freedesktop.org>; Fri, 21 Nov 2025 20:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763757358;
 bh=meSktXQNs/zDvTr1rLs7LeQfxQysPHSbGkzQDId9XMY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=L+zvWL/Nh94FkM1rZrXcBtTOzgK+mkJwTDosBcBijCdV34X53/cdtFJtiuZ0Md/WM
 GcqhqeRjUC0vm45dWjFBz6XmwGZdDlx/1YsRu2QyrzPY+3hCmTjo6+j5LM3zBib4I4
 J6tKQx3AUF2IB07P8TFo+IWDzck0Yp3oj5x5qK+1dMshchSxQDW1aIOTW5EmLdVjPD
 3zqNL5lRPlgjWSvClhgdnUG+fb4P2UmRkId3/JrLTerz93MIgGIWp8gL3/SUNNbMpt
 Z0A6qD2K62qoXRs1K/9ABvtlMFte9d0O1sWFPTl8RY6sAvXTCprA/RgDr/i7m3fD6z
 YI+JdDMM/fmQg==
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-656de56ce7aso526006eaf.3
 for <etnaviv@lists.freedesktop.org>; Fri, 21 Nov 2025 12:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXdpg/3pV5efnIKyuaNuczlOeb896wXOcRvmS0c8adjVgVOZwQ4EmCxoHzGF+qkwXmFSYACbQrv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGv62V9yNVez3Pu7PBPqdDkunPQcyuVT2mOEvV0HlP7SUNzPf9
 mddEkbsITL2a2UR+awKKO4pYpzimHJhycUz1/RDS/kyP/2mjTUtFZNG5WNJWJEyP0MY7iwI191t
 cmJpT/NpEeVQPoNesyaRtLC3jmTlBqSY=
X-Google-Smtp-Source: AGHT+IEGV1wW0AyQ4uV5rOeWs+mu0pohToH8QfmqGgzcM1nDvWFgodvXp8dfzsS7PUq8QlplylLWmLPmTb2ii+XtGZ8=
X-Received: by 2002:a05:6820:4d57:10b0:657:7289:b1dc with SMTP id
 006d021491bc7-65792596028mr1028369eaf.6.1763757357967; Fri, 21 Nov 2025
 12:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
In-Reply-To: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 21 Nov 2025 21:35:47 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmY4Rgl1Z4nj5ks6gNTVnBjHocEaNjk9D0MQSLHqvtZo8fqobTCygtTNLc
Message-ID: <CAJZ5v0jOPrBcozzJMsB1eE12MuZRWDAV-+=jfrhJbi=S0p5J9Q@mail.gmail.com>
Subject: Re: [PATCH RFC RESEND 0/8] thermal: core: Allow setting the parent
 device of thermal zone/cooling devices
To: Armin Wolf <W_Armin@gmx.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Len Brown <lenb@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>,
 Petr Machata <petrm@nvidia.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 linux-pci@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Thu, Nov 20, 2025 at 4:41=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Drivers registering thermal zone/cooling devices are currently unable
> to tell the thermal core what parent device the new thermal zone/
> cooling device should have, potentially causing issues with suspend
> ordering

This is one potential class of problems that may arise, but I would
like to see a real example of this.

As it stands today, thermal_class has no PM callbacks, so there are no
callback execution ordering issues with devices in that class and what
other suspend/resume ordering issues are there?

Also, the suspend and resume of thermal zones is handled via PM
notifiers.  Is there a problem with this?

> and making it impossible for user space applications to
> associate a given thermal zone device with its parent device.

Why does user space need to know the parent of a given cooling device
or thermal zone?

> This patch series aims to fix this issue by extending the functions
> used to register thermal zone/cooling devices to also accept a parent
> device pointer. The first six patches convert all functions used for
> registering cooling devices, while the functions used for registering
> thermal zone devices are converted by the remaining two patches.
>
> I tested this series on various devices containing (among others):
> - ACPI thermal zones
> - ACPI processor devices
> - PCIe cooling devices
> - Intel Wifi card
> - Intel powerclamp
> - Intel TCC cooling

What exactly did you do to test it?

> I also compile-tested the remaining affected drivers, however i would
> still be happy if the relevant maintainers (especially those of the
> mellanox ethernet switch driver) could take a quick glance at the
> code and verify that i am using the correct device as the parent
> device.

I think that the above paragraph is not relevant any more?

> This work is also necessary for extending the ACPI thermal zone driver
> to support the _TZD ACPI object in the future.

I'm still unsure why _TZD support requires the ability to set a
thermal zone parent device.

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
> Armin Wolf (8):
>       thermal: core: Allow setting the parent device of cooling devices
>       thermal: core: Set parent device in thermal_of_cooling_device_regis=
ter()
>       ACPI: processor: Stop creating "device" sysfs link

That link is not to the cooling devices' parent, but to the ACPI
device object (a struct acpi_device) that corresponds to the parent.
The parent of the cooling device should be the processor device, not
its ACPI companion, so I'm not sure why there would be a conflict.

>       ACPI: fan: Stop creating "device" sysfs link
>       ACPI: video: Stop creating "device" sysfs link

Analogously in the above two cases AFAICS.

The parent of a cooling device should be a "physical" device object,
like a platform device or a PCI device or similar, not a struct
acpi_device (which in fact is not a device even).

>       thermal: core: Set parent device in thermal_cooling_device_register=
()
>       ACPI: thermal: Stop creating "device" sysfs link

And this link is to the struct acpi_device representing the thermal zone it=
self.

>       thermal: core: Allow setting the parent device of thermal zone devi=
ces

I'm not sure if this is a good idea, at least until it is clear what
the role of a thermal zone parent device should be.
