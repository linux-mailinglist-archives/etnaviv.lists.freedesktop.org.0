Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904C157F483
	for <lists+etnaviv@lfdr.de>; Sun, 24 Jul 2022 11:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272DEB0BA7;
	Sun, 24 Jul 2022 09:47:32 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01olkn2020.outbound.protection.outlook.com [40.92.99.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53C9B0BA7
 for <etnaviv@lists.freedesktop.org>; Sun, 24 Jul 2022 09:47:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKlMuxR6/sg5SpT2ZFaOxsL//6q89fqlLC61EOclVMiAmDdK7i2dn0hWmJRQlV+qNf30uZJJk9+cVh0onpoKEPsOUwfUJqRniWDo2+j3+xeWGdUmnT5/wBorsMbzSJW4uE5/idqiGGElAGPjS/v6r/8KpY7J1SajfJuDWr91XKmwU8JfEoBiy372ogF+LgvgDjgJ2UioJNR+PMGdcUrtEzcS5AgB52kGf0iaoLefAd/4pBRTcLadER+EogipbvoNOXo0o2ddhtS7A4H4x50xk0gDi2gHtYMd8LwnP/eMH0zuPl/9iTlTQeaYdyUow6GPKUQKFzwPBEibe+iRut1l2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2EEKuv3LCsu5qgs0bv2UJE/dfdvy1Jmy8a1s4iHciY=;
 b=M37a93D3BcsSDIrw/C5ObZr1E5Ig7x3UJPGvj2pCCzNii2uRoJiPZJ7L2RRggCLl35MKTGEqBoLjvdqdLUpXSEvbDoZ1FR0IDDodBcLD9Ni504tznlnwCvQ6QXVRiwGdJGgCTZsvhZU2Fnw/BaBY87NbZDFQBg1tb3gr9UeD84lcDh5YIUwG/e0w5m1E8JTLA4469YpdBqQnipjp1Hpp6dH9Xc2Ap69+gEoUKsey/ANE2p3MMRd6NoqpMepZ73Gxl8/+PeW8ASPrnCCMVfMd2SgKvZBIHkvPPG8kGBUS93axGej9hpCUU76ybk0/46IEoS56snivM36RTiBeRMR7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2EEKuv3LCsu5qgs0bv2UJE/dfdvy1Jmy8a1s4iHciY=;
 b=AwWzp+GSeCBkVrVkHMRnQ8mMxzcPRuuBWIqcWFmDbPAhrB2XtQd6Jr5vyMZOrVD9+bp/b+3zb+G+nQfQXpIWWtZGDT0MO9AcCQkNV08eU0ULnzdvsqp9536tfjhayy+HVIizppHLPJWxosvrkfJELj5GqPuh5p2pXN3CVygpiRBylb0rV7zsUt7PC502kF5qgl3RkMHxXL6GgtuU2rE3AroVdTxrPUc6fj2eWvy6jgSsBnhSkL9B03FiYgd045hpvE1nK0+RhFHD2sBgjdFnBHRUJQScxSNUVncA4JFtyTjFLTZdzuWzunqjtoheoGEy+k5MPQrjvKO3AWlskY8aEw==
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:df::12)
 by TY3P286MB2594.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Sun, 24 Jul
 2022 09:47:29 +0000
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ed1f:7f05:2a4a:5d36]) by TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ed1f:7f05:2a4a:5d36%5]) with mapi id 15.20.5458.023; Sun, 24 Jul 2022
 09:47:29 +0000
Message-ID: <TYYP286MB1439EA66B9E3109B8FB2781FC6929@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Date: Sun, 24 Jul 2022 17:47:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: etnaviv@lists.freedesktop.org
From: dramforever <dramforever@live.com>
Subject: Help needed with getting GC300 working on the JH7100 RISC-V SoC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TMN: [iQ8484bQ/KxW3gdptVCdPmRuaiGcckLQ]
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:df::12)
X-Microsoft-Original-Message-ID: <13b72cfc-5744-d1ec-6104-12360a0552f4@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1fcde30-99b7-4353-e4a3-08da6d5985ad
X-MS-TrafficTypeDiagnostic: TY3P286MB2594:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3M5+ykwjCCZnShfO7QfMi4gYF2vmcmYLbFijLmOi8c//g6K3tIhLw28J0SnArF79LAomhbKj4oSGAkeDVAVh86M5BQGKJwsWy3zIcgGIlaEg1cj/xBY00M7o3TNpatjvnye31Q9HYWEIUBym7mcgsqVnLqfHSBF2B63QJ0kBoznDWpOkfaJeRLHcIShbJmUJ6V7+lppO2/VSOITDWN1AGgm7n3ULPCiZwLCXoKexZkuSLnFaKpeB2eKuRHUfCJwkZUDvr3qBmmykNINFWxxuCGZii2KpoBeB8+//9doKn66PaOfm+jAKxUwEs9+odG7Nw/k3fjC2Usskxfg56E5uWX1hQ7W2nGZBOfOtEii+1gP1EwYz3UR3DIoYMjd+DNpXfS6dJyKGKz6HEF4EN9khzZGq9Um6/SM9uDfgo9Y+ZMNXD5F4pBaQfWqAQA/ucxJzqVcOtg+faocIy8RCX+fbwWTnaHQ5ouR86gnKGYSppsbCQrY+zr9hNuQGIR3ERA7eFqdh/FaUVmGLNwnxQBBuAxhmsit1k2eAhscZGw5oNItmpaO0SPUrxCiJgDmCFbofn6xWCQeBZUQv27RxRQNU5aIp8T6dlTsNXj3Ivx+7o9KbuRJKsQ2pS484RT+XwGmTNlghziuSg9bgXPwxfq30ZCBrms2iFj0BPlNcBwjJ77Y=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWRpWkZ0ZUxrbHZIVVR2Y2NnVHJNeVZ3TlN3TWpweEZOVFBWaElsN00wMC9z?=
 =?utf-8?B?d1M0OEJZK3RUNFlLcUZ4Q0pBa3M2LzdTY0s4OFBaTUhiUkN4c3J4cjZhaUlG?=
 =?utf-8?B?K1ptM3hNTTA3NnFac2RhTUdzcm9NaW81eVJRK3dOS3lwcDNBSkkxeXNwMHJL?=
 =?utf-8?B?VGJWVzhIVXNpOGhTK0c2UHcvOVhUbFRickVSMktHSFBqRUpIckxsZE51aDBZ?=
 =?utf-8?B?anJ0b245eTRtQldFRTNJZW5uNDJ0ZTcrU1V1RERKVENPT2hHbCt2Y2JOSXFQ?=
 =?utf-8?B?b2RRWUVrcE5ucXB5OFBPT0xnL21zRW1NQTM1MUo3U2V2RHlva2toa0o4MEVX?=
 =?utf-8?B?ZWJkRDhpdXJzVXUzRWNWT3laeFBHV2g0NmxoMkFCKzk5cDM3N2thbmd2MHgr?=
 =?utf-8?B?ajdrSXNSS1pobGkwc3l4TjlJRWpGTjZCUnc1MTJiMXRlQm1LZkp4Zld1cDk1?=
 =?utf-8?B?RmZoZDh6L2NSb0w5UzRZYk9nT0pQWEZhTXdGaC9tWkFIRmh0ejBHZCtUK2Jx?=
 =?utf-8?B?djNhMHQvYU9sOXhJNlF6TjlSdDhoWnQyQk0ySmltZ2hRczBYNlNFSEx1eklK?=
 =?utf-8?B?V2ZIaHdpaGJBOExaRlJYTnY5V0N2MVBWczR0dWZqTG9ydWtxZHNnUVkxWVdG?=
 =?utf-8?B?bEhYVCsweHRuTVJHd0I3ZEdMOGhZckNrMmhCTFloSWJFWGFjWXRHUEpRa3Bj?=
 =?utf-8?B?NVJYZDVyRTN2SmxzSjRhWWo2RjU5Rzk1K2Z2V1NHaWR5bVFsR0RueXRXQWc0?=
 =?utf-8?B?dVFFVFdMd1RQWEE5VUVUSUJsaEhHNEpLZFFhR1hXU1BveDlVUFlwRHB0SmVV?=
 =?utf-8?B?R3dJbWNxTWY2WTFKV1YxMnhaQ2cvQ3FkNFM2TlNxZDRzTUNDSmk5eitIUXk0?=
 =?utf-8?B?Y2Jvek9wMmRCUi95QjVYYlc4UllMcXkvc3Bmb2lrcmJrZHhzTXlmQVlKd3p3?=
 =?utf-8?B?VUNhN3p0NTNteUV1UVBZZlVBM1RkYWRXcFI3RVppVUNPMjQ3TjlkUHVLMk1n?=
 =?utf-8?B?amMxVTk0NVRYUnYrR0FJWlBialVnNC82Y1B5TWQ3WTRJZ01XTG42YmV5OHdH?=
 =?utf-8?B?QzcxSW5Ways4RGZ1dHRrQng5b2syTzlsNXdKUkFCQzNGWnM4M0l0cEFESk9F?=
 =?utf-8?B?N1pyK2RxME9BMjEwcVNzc1B3eUF3Tmc3U3hwT3VRUXByUHRzNG9UNmVldnZa?=
 =?utf-8?B?MWYxOWZ0dG9mOExPSWtKNFpmUU0rRWQxbjhkTXBhUjIxQTZmTFNYWVlXczg0?=
 =?utf-8?B?OEdEakltVWtzVkgvV1RhVDdudzBvclZOYmw2U1UxWWl4QktxM0pGb2RHS1R4?=
 =?utf-8?B?R3NNNUlabkRpeHJ6dUxZMXROUkhvM1U2ZzB4R0xTU0lUalRTK0hSMUdvcmor?=
 =?utf-8?B?UWwvMytuZ0FCRjQ1WWdUQ05GQVVMOUxXaXZnbTgzc3hma0xHR2xwRHdkVW9Q?=
 =?utf-8?B?Y2VlYXZFTWNqa0hna0RYejgrZEVLcDdTWVBMQlRkRDcvd09Va09YcStUNERi?=
 =?utf-8?B?a0cxZnFPWGE5Zk5XN1p6ZzdjVkRKMTlYL0JUbWF2ZGREUUxsOTdhT3VlQ0o3?=
 =?utf-8?B?V0QrMHU0czZVTUNkaWZCQWVJYUNvaVNJMnd3TzNpSmxzZ1QrNWxlM214Snpr?=
 =?utf-8?B?YlJXVWxmWGZPYTlEMTlHSXFzYWJ6OGx0STFoaGVaN0wzRksvYWdxU20yQjdp?=
 =?utf-8?B?c21ZSDhtNW9HMTZZVXBMaXoydzR5TnRvaHIvSlRVd3BzdVBsYVNiWCtnPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fcde30-99b7-4353-e4a3-08da6d5985ad
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2022 09:47:29.2391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB2594
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

Hi all,

I've recently 'found' what appears to be an undocumented Vivante GC300
GPU on the StarFive JH7100 [1], a RISC-V SoC that's used in the
VisionFive [2] development board.

However I was unable to get the etnaviv driver to work on it. This is
the device tree node I ended up using, with reg from the datasheet, and
interrupts/clocks just guessed and probably incorrect. I used
clk_ignore_unused intending to figure out clock handling later.

gpu2d: gpu@10100000 {
=C2=A0=C2=A0 =C2=A0compatible =3D "vivante,gc";
=C2=A0=C2=A0 =C2=A0reg =3D <0x0 0x10100000 0x0 0x40000>;
=C2=A0=C2=A0 =C2=A0interrupts =3D <20>;
=C2=A0=C2=A0 =C2=A0clocks =3D <&clkgen JH7100_CLK_GC300_AHB>;
=C2=A0=C2=A0 =C2=A0clock-names =3D "core";
};

I used the vendor 5.18 kernel[3], which does not seem to have changed
anything in the etnaviv drivers. The GPU seems to be recognized:

[=C2=A0=C2=A0 25.453905] etnaviv-gpu 10100000.gpu: coherent device 0 dev->d=
ma_coherent 0
[=C2=A0=C2=A0 25.597244] etnaviv etnaviv: coherent device 0 dev->dma_cohere=
nt 0
[=C2=A0=C2=A0 25.797495] etnaviv etnaviv: bound 10100000.gpu (ops gpu_ops [=
etnaviv])
[=C2=A0=C2=A0 25.801571] etnaviv-gpu 10100000.gpu: model: GC300, revision: =
4635
[=C2=A0=C2=A0 25.813754] [drm] Initialized etnaviv 1.3.0 20151214 for etnav=
iv on minor 0

However running 'etnaviv_2d_test /dev/dri/renderD128' from libdrm
2.4.112 hangs with a kernel BUG_ON in the page fault handler (see bottom
of message for backtrace). At this point I've run out of ideas to try as
I'm not really familiar with DRM or other Linux internals. It seems to
fail on a VM_BUG_ON in gfp_zone checking for GFP_ZONE_BAD flags, but I
don't really have a clue as to what that means in this context.

Do you have any suggestions on how I can investigate into this?

By the way, here's some extra things that might be of interest. Firstly,
the existence of this GPU on JH7100 isn't advertised anywhere AFAIK, so
the hardware might just be completely broken. Secondly, on the JH7100
DMA isn't coherent by default and requires arch_dma_prep_coherent etc [4].

Thanks in advance for any help and guidance.

Regards,
dram

[1]: https://rvspace.org/en/Product/JH7100/Technical_Documents/JH7100_Datas=
heet
[2]: https://rvspace.org/en/Product/VisionFive/Technical_Documents/VisionFi=
ve_Single_Board_Computer_Quick_Start_Guide
[3]: https://github.com/starfive-tech/linux/tree/visionfive-5.18.y
[4]: https://github.com/starfive-tech/linux/commit/525ecfb08c62004d34dfe1fd=
e99f4503a08842d8

Kernel VM_BUG_ON backtrace:

[=C2=A0=C2=A0 85.678258] ------------[ cut here ]------------
[=C2=A0=C2=A0 85.678283] kernel BUG at include/linux/gfp.h:500!
[=C2=A0=C2=A0 85.683090] Kernel BUG [#1]
[=C2=A0=C2=A0 85.685878] Modules linked in: af_packet xhci_plat_hcd snd_soc=
_spdif_tx snd_soc_starfive_pwmdac snd_soc_starfive_i2svad snd_soc_simple_ca=
rd xhci_hcd snd_soc_spdif_rx brcmfmac snd_soc_simple_card_utils snd_soc_sta=
rfive_pwmdac_transmitter snd_soc_dmic tda9950 snd_soc_core gpio_tps65086 tp=
s65086_regulator tda998x cec tps65086 starfive_drm rc_core mfd_core at24 re=
gmap_i2c snd_compress ac97_bus drm_cma_helper brcmutil snd_pcm_dmaengine sn=
d_pcm drm_kms_helper ip6_tables cfg80211 xt_conntrack nf_conntrack starfive=
_wdt watchdog spidev starfive_vic_rng cdns3 cdns_usb_common roles usbcore s=
nd_timer pwm_sifive_ptc nf_defrag_ipv6 i2c_designware_platform rng_core fb_=
sys_fops nf_defrag_ipv4 sfctemp i2c_designware_core syscopyarea sysfillrect=
 sysimgblt ip6t_rpfilter ipt_rpfilter xt_pkttype xt_LOG snd nf_log_syslog x=
t_tcpudp nft_compat etnaviv motorcomm rfkill 8021q dwmac_generic usb_common=
 gpu_sched reset_starfive_jh7100_audio soundcore clk_starfive_jh7100_audio =
stmmac_platform nf_tables pwrseq_simple
[=C2=A0=C2=A0 85.686242]=C2=A0 ofpart cmdlinepart spi_nor leds_gpio led_cla=
ss uio_pdrv_genirq libcrc32c nfnetlink sch_fq_codel uio atkbd libps2 serio =
vivaldi_fmap loop tun tap macvlan bridge stp llc mtdblock mtd_blkdevs mtd d=
rm spi_cadence_quadspi(O) fuse backlight i2c_core pstore configfs ip_tables=
 x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 mmc_block dm_mod d=
ax ledtrig_heartbeat spi_dw_mmio spi_dw dw_mmc_pltfm dw_mmc mmc_core dw_axi=
_dmac_platform virt_dma
[=C2=A0=C2=A0 85.813286] CPU: 1 PID: 990 Comm: etnaviv_2d_test Tainted: G=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 5.18.5 #1-NixOS
[=C2=A0=C2=A0 85.821787] Hardware name: StarFive VisionFive V1 (DT)
[=C2=A0=C2=A0 85.826910] epc : prepare_alloc_pages.constprop.0+0x172/0x18c
[=C2=A0=C2=A0 85.832659]=C2=A0 ra : __alloc_pages+0x7e/0x1b6
[=C2=A0=C2=A0 85.836751] epc : ffffffff801e32d0 ra : ffffffff801e8f30 sp : =
ffffffc80498b840
[=C2=A0=C2=A0 85.843954]=C2=A0 gp : ffffffff817df8e8 tp : ffffffd8807b8000 =
t0 : ffffffff8000a960
[=C2=A0=C2=A0 85.851156]=C2=A0 t1 : 0000000000000000 t2 : ffffffff80c002a0 =
s0 : ffffffc80498b890
[=C2=A0=C2=A0 85.858357]=C2=A0 s1 : 0000000000106cc6 a0 : 0000000000000250 =
a1 : 0000000000000000
[=C2=A0=C2=A0 85.865559]=C2=A0 a2 : 0000000000000000 a3 : 0000000000000000 =
a4 : ffffffc80498b898
[=C2=A0=C2=A0 85.872761]=C2=A0 a5 : ffffffc80498b894 a6 : ffffffc80498b890 =
a7 : 000000000000000c
[=C2=A0=C2=A0 85.879963]=C2=A0 s2 : 0000000000000001 s3 : 0000000000106cc6 =
s4 : 0000000000000000
[=C2=A0=C2=A0 85.887164]=C2=A0 s5 : 0000000000000000 s6 : 0000000000000000 =
s7 : 0000000000000000
[=C2=A0=C2=A0 85.894364]=C2=A0 s8 : ffffffc80498b978 s9 : ffffffff8184b910 =
s10: 0000000000106cc6
[=C2=A0=C2=A0 85.901566]=C2=A0 s11: ffffffd890b6e968 t3 : 0000000000000020 =
t4 : ffffffef8485aad0
[=C2=A0=C2=A0 85.908767]=C2=A0 t5 : 000000000000000c t6 : 0000000000000020
[=C2=A0=C2=A0 85.914061] status: 0000000200000120 badaddr: 0000000000000250=
 cause: 0000000000000003
[=C2=A0=C2=A0 85.921957] [<ffffffff801e8f30>] __alloc_pages+0x7e/0x1b6
[=C2=A0=C2=A0 85.927346] [<ffffffff802060f8>] alloc_pages_vma+0xa6/0x2e6
[=C2=A0=C2=A0 85.932920] [<ffffffff801a5132>] shmem_alloc_page+0x3c/0x62
[=C2=A0=C2=A0 85.938494] [<ffffffff801a55ea>] shmem_alloc_and_acct_page+0xe=
6/0x1a4
[=C2=A0=C2=A0 85.944919] [<ffffffff801a8506>] shmem_getpage_gfp+0x280/0x7d8
[=C2=A0=C2=A0 85.950742] [<ffffffff801a8a9c>] shmem_read_mapping_page_gfp+0=
x3e/0x66
[=C2=A0=C2=A0 85.957259] [<ffffffff02bd98d0>] drm_gem_get_pages+0xc0/0x1f8 =
[drm]
[=C2=A0=C2=A0 85.986692] [<ffffffff03933678>] etnaviv_gem_shmem_get_pages+0=
x2c/0x82 [etnaviv]
[=C2=A0=C2=A0 85.998222] [<ffffffff03933a20>] etnaviv_gem_get_pages+0x46/0x=
ca [etnaviv]
[=C2=A0=C2=A0 86.006478] [<ffffffff03933b3c>] etnaviv_gem_fault+0x44/0xc4 [=
etnaviv]
[=C2=A0=C2=A0 86.014315] [<ffffffff801c4814>] __do_fault+0x3a/0x13a
[=C2=A0=C2=A0 86.019460] [<ffffffff801c94d4>] __handle_mm_fault+0x784/0xf68
[=C2=A0=C2=A0 86.025282] [<ffffffff801c9d74>] handle_mm_fault+0xbc/0x1ba
[=C2=A0=C2=A0 86.030842] [<ffffffff8000aabc>] do_page_fault+0x15c/0x3fe
[=C2=A0=C2=A0 86.036319] [<ffffffff800037f2>] ret_from_exception+0x0/0xc
[=C2=A0=C2=A0 86.042168] ---[ end trace 0000000000000000 ]---

