Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8C1C7219B
	for <lists+etnaviv@lfdr.de>; Thu, 20 Nov 2025 04:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2021B10E00B;
	Thu, 20 Nov 2025 03:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="crXg/g5E";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Thu, 20 Nov 2025 03:47:05 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D7910E00B
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Nov 2025 03:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610423; x=1764215223; i=w_armin@gmx.de;
 bh=EfKyHSgu72E5XtbQRP8q+S271PUWmhxdP5i176j621o=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=crXg/g5EsXuy8Y6WMYY77JVerzppp4vNzsLKslkokngU4Sbl4Y+OsD/5To8z/OKo
 e9dljtsKieaQoYlqwtSOc+PAHtx03hL4yc06yp430KYIAE7ENJs1yuZliB4+KnV+I
 sjTIDnY6N6pj0mMaBKxKeBDvHUjX+6Ywn3zuHOHs6/nPd8AteLYmuHeENCGDEmSBz
 FuQXc/R/9K3efGHRtBb69UnYD8o4YL7qNwzRTv1hBvojDTzVBn1tOSjQmWcNb65sT
 CEenBv6vX9WWA+6iGYs+OalskoRiobXuIXJCxebAvIeA5L4wHCvwBX9KN4Loj5nau
 hA5EoY7jvUZ6FM1E4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLi8m-1vdav82PvU-00KALa; Thu, 20
 Nov 2025 04:41:18 +0100
From: Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH RFC RESEND 0/8] thermal: core: Allow setting the parent
 device of thermal zone/cooling devices
Date: Thu, 20 Nov 2025 04:41:10 +0100
Message-Id: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIANaNHmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3ZKM1KLcxBzdFKDi5FRdM1PTFENjCwsjk2QzJaCmgqLUtMwKsIH
 RSkFuziCxINdgVz8XpdjaWgB7+urfbwAAAA==
X-Change-ID: 20251114-thermal-device-655d138824c6
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Len Brown <lenb@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>, 
 Petr Machata <petrm@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 linux-pci@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:UzHmwioHZKfjFpYTePSeoB+nEB5pgRKUwAckErW8vPODyOjizzx
 /feBzdus+6v6o3v+eb2dnxcueQu6ShHFe1TT6Xi/kk8kv5nVS0Y9m+JMn8+ZkS1ADmANUys
 KJE6GDq7jWYTptIpEMYFhITEe/619/61fPiKltwdUQWuLX/fH71JR7y/I3G+rWcTL/yjCgw
 31BGItEd8tKh5IQVLSerA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dGGVoMTC2uw=;GNv5QfZRsNQgcvjkucd3wRN83RV
 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
 6qPvL3r6Ra6aNwD7A=
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

Drivers registering thermal zone/cooling devices are currently unable
to tell the thermal core what parent device the new thermal zone/
cooling device should have, potentially causing issues with suspend
ordering and making it impossible for user space appications to
associate a given thermal zone device with its parent device.

This patch series aims to fix this issue by extending the functions
used to register thermal zone/cooling devices to also accept a parent
device pointer. The first six patches convert all functions used for
registering cooling devices, while the functions used for registering
thermal zone devices are converted by the remaining two patches.

I tested this series on various devices containing (among others):
- ACPI thermal zones
- ACPI processor devices
- PCIe cooling devices
- Intel Wifi card
- Intel powerclamp
- Intel TCC cooling

I also compile-tested the remaining affected drivers, however i would
still be happy if the relevant maintainers (especially those of the
mellanox ethernet switch driver) could take a quick glance at the
code and verify that i am using the correct device as the parent
device.

This work is also necessary for extending the ACPI thermal zone driver
to support the _TZD ACPI object in the future.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Armin Wolf (8):
      thermal: core: Allow setting the parent device of cooling devices
      thermal: core: Set parent device in thermal_of_cooling_device_regist=
er()
      ACPI: processor: Stop creating "device" sysfs link
      ACPI: fan: Stop creating "device" sysfs link
      ACPI: video: Stop creating "device" sysfs link
      thermal: core: Set parent device in thermal_cooling_device_register(=
)
      ACPI: thermal: Stop creating "device" sysfs link
      thermal: core: Allow setting the parent device of thermal zone devic=
es

 Documentation/driver-api/thermal/sysfs-api.rst     | 10 ++++-
 drivers/acpi/acpi_video.c                          |  9 +----
 drivers/acpi/fan_core.c                            | 16 ++------
 drivers/acpi/processor_thermal.c                   | 15 +------
 drivers/acpi/thermal.c                             | 33 ++++++---------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |  4 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_thermal.c |  4 +-
 drivers/net/ethernet/mellanox/mlxsw/core_thermal.c | 47 +++++++++++------=
=2D----
 drivers/net/wireless/ath/ath10k/thermal.c          |  2 +-
 drivers/net/wireless/ath/ath11k/thermal.c          |  2 +-
 drivers/net/wireless/intel/iwlwifi/mld/thermal.c   |  6 +--
 drivers/net/wireless/intel/iwlwifi/mvm/tt.c        | 12 +++---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c   |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   |  2 +-
 drivers/platform/x86/acerhdf.c                     |  4 +-
 drivers/power/supply/power_supply_core.c           |  4 +-
 drivers/thermal/armada_thermal.c                   |  2 +-
 drivers/thermal/cpufreq_cooling.c                  |  2 +-
 drivers/thermal/cpuidle_cooling.c                  |  2 +-
 drivers/thermal/da9062-thermal.c                   |  2 +-
 drivers/thermal/devfreq_cooling.c                  |  2 +-
 drivers/thermal/dove_thermal.c                     |  2 +-
 drivers/thermal/imx_thermal.c                      |  2 +-
 .../intel/int340x_thermal/int3400_thermal.c        |  2 +-
 .../intel/int340x_thermal/int3403_thermal.c        |  4 +-
 .../intel/int340x_thermal/int3406_thermal.c        |  2 +-
 .../intel/int340x_thermal/int340x_thermal_zone.c   | 13 +++---
 .../int340x_thermal/processor_thermal_device_pci.c |  7 ++--
 drivers/thermal/intel/intel_pch_thermal.c          |  2 +-
 drivers/thermal/intel/intel_powerclamp.c           |  2 +-
 drivers/thermal/intel/intel_quark_dts_thermal.c    |  2 +-
 drivers/thermal/intel/intel_soc_dts_iosf.c         |  2 +-
 drivers/thermal/intel/intel_tcc_cooling.c          |  2 +-
 drivers/thermal/intel/x86_pkg_temp_thermal.c       |  6 +--
 drivers/thermal/kirkwood_thermal.c                 |  2 +-
 drivers/thermal/pcie_cooling.c                     |  2 +-
 drivers/thermal/renesas/rcar_thermal.c             | 10 +++--
 drivers/thermal/spear_thermal.c                    |  2 +-
 drivers/thermal/tegra/soctherm.c                   |  5 +--
 drivers/thermal/testing/zone.c                     |  2 +-
 drivers/thermal/thermal_core.c                     | 23 +++++++----
 drivers/thermal/thermal_of.c                       |  9 +++--
 include/linux/thermal.h                            | 22 +++++-----
 43 files changed, 145 insertions(+), 162 deletions(-)
=2D--
base-commit: 653ef66b2c04bcdecaf3d13ea5069c4b1f27d5da
change-id: 20251114-thermal-device-655d138824c6

Best regards,
=2D-=20
Armin Wolf <W_Armin@gmx.de>

