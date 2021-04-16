Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03507361CDA
	for <lists+etnaviv@lfdr.de>; Fri, 16 Apr 2021 11:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC836EB59;
	Fri, 16 Apr 2021 09:40:47 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Fri, 16 Apr 2021 09:40:46 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.160])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A2E6EB59
 for <etnaviv@lists.freedesktop.org>; Fri, 16 Apr 2021 09:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1618565683; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Iq/1n3SgOh7g6A/5oxhKmX1CaXgHlrP0BXrQra4ogO4mYz4+dIQlqvrFo2rTJ6phaF
 xDlQnyI8AL/W9oOWY3uMEK/8JdNvL/DWtg3sPFj9/47ZhrLdfyN6Uivsy2lUyctrmIKv
 vQMAmbb/Cc6WK0XsHTqahnFLCvVI0xDCsLa75xQWc6YnXU5psmprZLMizFk7mhG0PqN8
 LXoxRRAb+PaBPLf50id29gCKaXCMC6DDoRw5rPeeVRucdkJAjiSUdb/r/h855P41sPik
 fVBkRUIPl2Iuf1zdx85lcFgSGu0BS5UJTrJi1ulyszXpDdj5eD79ptBm/4prDEBOqqaF
 2SlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618565683;
 s=strato-dkim-0002; d=strato.com;
 h=Date:Message-ID:Subject:From:To:Cc:Date:From:Subject:Sender;
 bh=cGBFo5W/lBW6gTXRt6VI/KxRs1f0O38v+ZIUQ6lbNj8=;
 b=WaWUeaZav8QOaH1J75rHO4AiUM03vGWAE1N9ON/n5zGoxdvbvGxP6C85WK5SpM0lzG
 JAlfGrHbDIPwhJS0NF2tR4rcROxn2i8wPBF1Iy+4MtwvDDQojNNAXE5HKZFI2LlaYvTp
 +sQnxHuxN5gjg4Q1vHJKZZ9hDaxXKOtIzFc3AUfhndmxHDBVT24Mna2uA0yYsBIdN07z
 NpOEljQ1TYr2Nf8TfBupIAc5wD7GJ6dwjy8MlGbp3sjDFncXv3eFDA2158OLX7gNiVqJ
 qSy1cFBoWw/hanTpmxAFPoRajuQsqQaFFyVUkjOmtdMK2ZckpGw39PXcPbK6G5gwLp5L
 LHkA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1618565683;
 s=strato-dkim-0002; d=jm0.eu;
 h=Date:Message-ID:Subject:From:To:Cc:Date:From:Subject:Sender;
 bh=cGBFo5W/lBW6gTXRt6VI/KxRs1f0O38v+ZIUQ6lbNj8=;
 b=JYBxhdAqMFXr8Y5p4iYz3b6gCRU1W/LmoXwNbQNc/agm6bIrCbOsXRhB3bESmaLvvM
 XYqnfcKDZYPqoefWrmRSdVfzE2h7fphzjLiT9vXNT7Yf1hsMCVfNjUy7oUSlv+j/Nexo
 KsVnnzu4ug+FXHXmDRcshbMB+CgDr0IFIoBIHdZUvAKH3msD5CnPIIxWeIklxp3r8UCV
 VnXhqnEhMngaOw1oMogTf65bw7kMDz0yWbWwEFlKfr+1GStWM5TUKkrqES3xQ17yXBE5
 tv6jIr1R00zvZlnAmbM0vJoHDk0xXseQtPIiZQW/E2WiPaYpNu33PaCLn8dUayzr8+++
 NUgA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPXvQCbXgI7t69COvnl6LERsNcX+38fzPJhyS/JvIQkjQZbA=="
X-RZG-CLASS-ID: mo00
Received: from DESKTOP-QN8EJSD.lan by smtp.strato.de (RZmta 47.24.3 AUTH)
 with ESMTPSA id g09a86x3G9Yh6AW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <etnaviv@lists.freedesktop.org>;
 Fri, 16 Apr 2021 11:34:43 +0200 (CEST)
To: etnaviv@lists.freedesktop.org
From: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Subject: etnaviv fails probe early, but succeeds after rmmod && modprobe
Message-ID: <d83adc7a-d9db-af35-83c9-6d3dab60ab82@jm0.eu>
Date: Fri, 16 Apr 2021 11:34:43 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------6B8BAB8A274BEB77E6F1608C"
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------6B8BAB8A274BEB77E6F1608C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Greetings everybody,

While testing Debian on the i.MX6 HummingBoard, I came across a problem 
where after boot, the /dev/dri/card1 representing the GC2000 does not exist.

However at that point issuing
rmmod etnaviv; modprobe etnaviv
succeeds and I can then go on running applications uing GL.

So I am very unsure how to debug this. What I have so far is this output 
from dmesg [1], which points at some deferred probing timeout behaviour.
I do not know how to trace
(1) whose timeout exceeded
(2) what dependency is being ignored
(3) why after 3 attempts probing apparently gives up
I do know that this problem is shared with the coda driver, which fails 
the same way. Hence maybe this is not an etnaviv problem - but hopefully 
this message can still reach somebody who understands what is happening 
here.

Yours sincerely
Josua Mayer

[1] short dmesg (full dmesg attached):
root@sr-imx6:~# dmesg | grep etna
[    5.969888] etnaviv-gpu 130000.gpu: deferred probe timeout, ignoring 
dependency
[    5.985970] etnaviv-gpu: probe of 130000.gpu failed with error -110
[    6.076604] etnaviv-gpu 134000.gpu: deferred probe timeout, ignoring 
dependency
[    6.102833] etnaviv-gpu: probe of 134000.gpu failed with error -110
[    6.121231] etnaviv-gpu 2204000.gpu: deferred probe timeout, ignoring 
dependency
[    6.150314] etnaviv-gpu: probe of 2204000.gpu failed with error -110
root@sr-imx6:~# rmmod etnaviv
root@sr-imx6:~# modprobe etnaviv
root@sr-imx6:~# dmesg | grep etna
...
[  166.482349] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops [etnaviv])
[  166.502064] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops [etnaviv])
[  166.514261] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops [etnaviv])
[  166.520868] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[  166.527630] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[  166.533879] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[  166.540048] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[  166.547379] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on 
minor 1

--------------6B8BAB8A274BEB77E6F1608C
Content-Type: text/x-log; charset=UTF-8;
 name="sr-imx6-etna-probe.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="sr-imx6-etna-probe.log"

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.10.0-6-armmp (debian-kernel@lists.debian.o=
rg) (arm-linux-gnueabihf-gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld=20
(GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.28-1 (2021-04-09)
[    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=3D=
10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing ins=
truction cache
[    0.000000] OF: fdt: Machine model: SolidRun HummingBoard Dual/Quad
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 256 MiB at 0x40000000
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000010000000-0x000000003fffffff]
[    0.000000]   Normal   empty
[    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000010000000-0x000000004fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000010000000-0x000000004ff=
fffff]
[    0.000000] On node 0 totalpages: 262144
[    0.000000]   DMA zone: 2304 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 196608 pages, LIFO batch:63
[    0.000000]   HighMem zone: 65536 pages, LIFO batch:15
[    0.000000] percpu: Embedded 21 pages/cpu s54284 r8192 d23540 u86016
[    0.000000] pcpu-alloc: s54284 r8192 d23540 u86016 alloc=3D21*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1=20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 259=
840
[    0.000000] Kernel command line:   console=3Dttymxc0,115200 log_level=3D=
7 net.ifnames=3D0 console=3Dtty cma=3D256M
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 =
bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.000000] Memory: 740704K/1048576K available (11264K kernel code, 16=
65K rwdata, 3184K rodata, 2048K init, 335K bss, 45728K reserved, 262144K =
cma-reserved, 0K highmem)
[    0.000000] random: get_random_u32 called from __kmem_cache_create+0x3=
4/0x438 with crng_init=3D0
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,=20
Nodes=3D1
[    0.000000] ftrace: allocating 37355 entries in 73 pages
[    0.000000] ftrace: allocated 73 pages with 3 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_i=
ds=3D2.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is=20
25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D2
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] L2C-310 errata 752271 769419 enabled
[    0.000000] L2C-310 enabling early BRESP for Cortex-A9
[    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
[    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
[    0.000000] L2C-310 dynamic clock gating enabled, standby mode enabled=

[    0.000000] L2C-310 cache controller enabled, 16 ways, 1024 kB
[    0.000000] L2C-310: CACHE_ID 0x410000c7, AUX_CTRL 0x76470001
[    0.000000] Switching to timer-based delay loop, resolution 333ns
[    0.000007] sched_clock: 32 bits at 3000kHz, resolution 333ns, wraps e=
very 715827882841ns
[    0.000027] clocksource: mxc_timer1: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 637086815595 ns
[    0.003077] Console: colour dummy device 80x30
[    0.003667] printk: console [tty0] enabled
[    0.003727] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 6.00 BogoMIPS (lpj=3D12000)
[    0.003765] pid_max: default: 32768 minimum: 301
[    0.004128] LSM: Security Framework initializing
[    0.004249] Yama: disabled by default; enable with sysctl kernel.yama.=
*
[    0.004548] AppArmor: AppArmor initialized
[    0.004579] TOMOYO Linux initialized
[    0.004701] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes=
, linear)
[    0.004746] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 =
bytes, linear)
[    0.006084] CPU: Testing write buffer coherency: ok
[    0.006146] CPU0: Spectre v2: using BPIALL workaround
[    0.006571] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.007824] Setting up static identity map for 0x10300000 - 0x103000ac=

[    0.009278] rcu: Hierarchical SRCU implementation.
[    0.012071] EFI services will not be available.
[    0.012564] smp: Bringing up secondary CPUs ...
[    0.013744] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.013755] CPU1: Spectre v2: using BPIALL workaround
[    0.013965] smp: Brought up 1 node, 2 CPUs
[    0.013994] SMP: Total of 2 processors activated (12.00 BogoMIPS).
[    0.014015] CPU: All CPU(s) started in SVC mode.
[    0.014885] devtmpfs: initialized
[    0.026301] VFP support v0.3: implementor 41 architecture 3 part 30 va=
riant 9 rev 4
[    0.026675] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 7645041785100000 ns
[    0.026787] futex hash table entries: 512 (order: 3, 32768 bytes, line=
ar)
[    0.045352] pinctrl core: initialized pinctrl subsystem
[    0.046926] DMI not present or invalid.
[    0.047475] NET: Registered protocol family 16
[    0.051330] DMA: preallocated 256 KiB pool for atomic coherent allocat=
ions
[    0.052389] audit: initializing netlink subsys (disabled)
[    0.052725] audit: type=3D2000 audit(0.052:1): state=3Dinitialized aud=
it_enabled=3D0 res=3D1
[    0.054217] thermal_sys: Registered thermal governor 'fair_share'
[    0.054226] thermal_sys: Registered thermal governor 'bang_bang'
[    0.054256] thermal_sys: Registered thermal governor 'step_wise'
[    0.054276] thermal_sys: Registered thermal governor 'user_space'
[    0.054297] thermal_sys: Registered thermal governor 'power_allocator'=

[    0.054624] CPU identified as i.MX6Q, silicon rev 1.5
[    0.553749] No ATAGs?
[    0.553909] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1 watc=
hpoint registers.
[    0.553941] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.555783] debugfs: Directory 'dummy-iomuxc-gpr@20e0000' with parent =
'regmap' already present!
[    0.556150] imx6q-pinctrl 20e0000.pinctrl: initialized IMX pinctrl dri=
ver
[    0.558029] Serial: AMBA PL011 UART driver
[    0.566258] Kprobes globally optimized
[    2.298310] mxs-dma 110000.dma-apbh: initialized
[    2.303467] v_3v2: supplied by v_5v0
[    2.303552] vcc_3v3: supplied by v_3v2
[    2.303635] v_sd: supplied by v_3v2
[    2.304303] v_usb2: supplied by v_5v0
[    2.304946] v_usb1: supplied by v_5v0
[    2.307438] iommu: Default domain type: Translated=20
[    2.308608] vgaarb: loaded
[    2.309780] mc: Linux media interface: v0.10
[    2.309842] videodev: Linux video capture interface: v2.00
[    2.311828] NetLabel: Initializing
[    2.311855] NetLabel:  domain hash size =3D 128
[    2.311872] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    2.311985] NetLabel:  unlabeled traffic allowed by default
[    2.312407] clocksource: Switched to clocksource mxc_timer1
[    2.406693] VFS: Disk quotas dquot_6.6.0
[    2.406850] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 b=
ytes)
[    2.407814] AppArmor: AppArmor Filesystem Enabled
[    2.421810] NET: Registered protocol family 2
[    2.423288] tcp_listen_portaddr_hash hash table entries: 512 (order: 0=
, 6144 bytes, linear)
[    2.423415] TCP established hash table entries: 8192 (order: 3, 32768 =
bytes, linear)
[    2.423643] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, =
linear)
[    2.423792] TCP: Hash tables configured (established 8192 bind 8192)
[    2.424129] UDP hash table entries: 512 (order: 2, 16384 bytes, linear=
)
[    2.424221] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, l=
inear)
[    2.424604] NET: Registered protocol family 1
[    2.424672] NET: Registered protocol family 44
[    2.424706] PCI: CLS 0 bytes, default 64
[    2.425446] Trying to unpack rootfs image as initramfs...
[    3.378755] Freeing initrd memory: 12900K
[    3.379356] hw perfevents: no interrupt-affinity property for /pmu, gu=
essing.
[    3.379651] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7 =
counters available
[    3.382536] Initialise system trusted keyrings
[    3.382610] Key type blacklist registered
[    3.382923] workingset: timestamp_bits=3D14 max_order=3D18 bucket_orde=
r=3D4
[    3.390841] zbud: loaded
[    3.392147] integrity: Platform Keyring initialized
[    3.392188] Key type asymmetric registered
[    3.392210] Asymmetric key parser 'x509' registered
[    3.392921] bounce: pool size: 64 pages
[    3.393031] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 250)
[    3.393367] io scheduler mq-deadline registered
[    3.405440] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000 ran=
ges:
[    3.405514] imx6q-pcie 1ffc000.pcie:       IO 0x0001f80000..0x0001f8ff=
ff -> 0x0000000000
[    3.405563] imx6q-pcie 1ffc000.pcie:      MEM 0x0001000000..0x0001efff=
ff -> 0x0001000000
[    3.415219] imx-sdma 20ec000.sdma: firmware: direct-loading firmware i=
mx/sdma/sdma-imx6q.bin
[    3.416136] imx-sdma 20ec000.sdma: loaded firmware 3.5
[    3.423672] Serial: 8250/16550 driver, 5 ports, IRQ sharing enabled
[    3.427354] Serial: AMBA driver
[    3.428290] 2020000.serial: ttymxc0 at MMIO 0x2020000 (irq =3D 34, bas=
e_baud =3D 5000000) is a IMX
[    4.235707] printk: console [ttymxc0] enabled
[    4.241599] 21f0000.serial: ttymxc3 at MMIO 0x21f0000 (irq =3D 77, bas=
e_baud =3D 5000000) is a IMX
[    4.252768] STM32 USART driver initialized
[    4.260344] libphy: Fixed MDIO Bus: probed
[    4.272185] libphy: fec_enet_mii_bus: probed
[    4.290934] at803x: module verification failed: signature and/or requi=
red key missing - tainting kernel
[    4.309829] mdio_bus 2188000.ethernet-1: MDIO device at address 4 is m=
issing.
[    4.318566] mousedev: PS/2 mouse device common for all mice
[    4.327702] snvs_rtc 20cc000.snvs:snvs-rtc-lp: registered as rtc0
[    4.334011] snvs_rtc 20cc000.snvs:snvs-rtc-lp: setting system clock to=20
2021-04-16T09:31:05 UTC (1618565465)
[    4.350002] ledtrig-cpu: registered to indicate activity on CPUs
[    4.358352] NET: Registered protocol family 10
[    4.417877] Segment Routing with IPv6
[    4.421726] mip6: Mobile IPv6
[    4.424748] NET: Registered protocol family 17
[    4.429416] mpls_gso: MPLS GSO support
[    4.433703] ThumbEE CPU extension supported.
[    4.438103] Registering SWP/SWPB emulation handler
[    4.443136] registered taskstats version 1
[    4.447329] Loading compiled-in X.509 certificates
[    4.516508] imx6q-pcie 1ffc000.pcie: Phy link never came up
[    4.525385] imx6q-pcie 1ffc000.pcie: PCI host bridge to bus 0000:00
[    4.531703] pci_bus 0000:00: root bus resource [bus 00-ff]
[    4.537228] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    4.543445] pci_bus 0000:00: root bus resource [mem 0x01000000-0x01eff=
fff]
[    4.550390] pci 0000:00:00.0: [16c3:abcd] type 01 class 0x060400
[    4.556446] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000fffff]
[    4.562756] pci 0000:00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff pre=
f]
[    4.569516] pci 0000:00:00.0: Limiting cfg_size to 512
[    4.574733] pci 0000:00:00.0: supports D1
[    4.578776] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
[    4.588772] PCI: bus0: Fast back to back transfers disabled
[    4.597700] PCI: bus1: Fast back to back transfers enabled
[    4.603255] pci 0000:00:00.0: BAR 0: assigned [mem 0x01000000-0x010fff=
ff]
[    4.610089] pci 0000:00:00.0: BAR 6: assigned [mem 0x01100000-0x0110ff=
ff pref]
[    4.617354] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    4.623087] pcieport 0000:00:00.0: PME: Signaling with IRQ 309
[    4.629398] pcieport 0000:00:00.0: AER: enabled with IRQ 309
[    4.848549] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f=
6149f3dd27dfcc5cbb419ea1'
[    4.857496] Loaded X.509 cert 'Debian Secure Boot Signer 2021 - linux:=20
4b6ef5abca669825178e052c84667ccbc0531f8c'
[    4.867942] zswap: loaded using pool lzo/zbud
[    4.873171] Key type ._fscrypt registered
[    4.877236] Key type .fscrypt registered
[    4.881231] Key type fscrypt-provisioning registered
[    4.886505] AppArmor: AppArmor sha1 policy hashing enabled
[    4.937162] Freeing unused kernel memory: 2048K
[    4.942580] ------------[ cut here ]------------
[    4.947270] WARNING: CPU: 1 PID: 1 at arch/arm/mm/dump.c:248 note_page=
+0x3d0/0x3dc
[    4.954887] arm/mm: Found insecure W+X mapping at address 0xf0879000
[    4.961274] Modules linked in: at803x(E)
[    4.965252] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G            E     =
5.10.0-6-armmp #1 Debian 5.10.28-1
[    4.974755] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)=

[    4.981297] Backtrace:=20
[    4.983774] [<c0cf0f90>] (dump_backtrace) from [<c0cf133c>] (show_stac=
k+0x20/0x24)
[    4.991367]  r7:000000f8 r6:600e0013 r5:00000000 r4:c14cdbd0
[    4.997048] [<c0cf131c>] (show_stack) from [<c0cf646c>] (dump_stack+0x=
c8/0xdc)
[    5.004305] [<c0cf63a4>] (dump_stack) from [<c034d670>] (__warn+0xfc/0=
x158)
[    5.011284]  r7:000000f8 r6:00000009 r5:c031f548 r4:c0fbbd84
[    5.016964] [<c034d574>] (__warn) from [<c0cf20f0>] (warn_slowpath_fmt=
+0xa4/0xe4)
[    5.024466]  r7:c031f548 r6:000000f8 r5:c0fbbd84 r4:c0fbbd50
[    5.030142] [<c0cf2050>] (warn_slowpath_fmt) from [<c031f548>] (note_p=
age+0x3d0/0x3dc)
[    5.038081]  r8:00000000 r7:00000000 r6:00000005 r5:c140c4a0 r4:c195bf=
28
[    5.044800] [<c031f178>] (note_page) from [<c031f63c>] (walk_pmd+0xe8/=
0x1a4)
[    5.051867]  r10:c195bf28 r9:c0207c20 r8:c18db800 r7:00000000 r6:c0fbb=
dcc r5:f087b000
[    5.059713]  r4:c18db1ec
[    5.062262] [<c031f554>] (walk_pmd) from [<c031f83c>] (ptdump_check_wx=
+0x88/0x104)
[    5.069854]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:c0208=
000 r5:f0800000
[    5.077699]  r4:c0207c28
[    5.080255] [<c031f7b4>] (ptdump_check_wx) from [<c0319740>] (mark_rod=
ata_ro+0x3c/0x40)
[    5.088277]  r6:00000000 r5:c0d00624 r4:00000000
[    5.092921] [<c0319704>] (mark_rodata_ro) from [<c0d00668>] (kernel_in=
it+0x44/0x130)
[    5.100690] [<c0d00624>] (kernel_init) from [<c03001a8>] (ret_from_for=
k+0x14/0x2c)
[    5.108277] Exception stack(0xc195bfb0 to 0xc195bff8)
[    5.113344] bfa0:                                     00000000 0000000=
0 00000000 00000000
[    5.121542] bfc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0 00000000 00000000
[    5.129739] bfe0: 00000000 00000000 00000000 00000000 00000013 0000000=
0
[    5.136367]  r5:c0d00624 r4:00000000
[    5.140004] ---[ end trace fe808febb0b57707 ]---
[    5.144915] Checked W+X mappings: FAILED, 1 W+X pages found
[    5.150544] Run /init as init process
[    5.154240]   with arguments:
[    5.154248]     /init
[    5.154255]   with environment:
[    5.154263]     HOME=3D/
[    5.154271]     TERM=3Dlinux
[    5.154278]     log_level=3D7
[    5.916491] Registered IR keymap rc-empty
[    5.920773] rc rc0: gpio_ir_recv as /devices/platform/ir-receiver/rc/r=
c0
[    5.961699] rc rc0: lirc_dev: driver gpio_ir_recv registered at minor =
=3D 0, raw IR receiver, no transmitter
[    6.032956] input: gpio_ir_recv as /devices/platform/ir-receiver/rc/rc=
0/input0
[    6.065253] CAN device driver interface
[    6.136544] etnaviv-gpu 130000.gpu: deferred probe timeout, ignoring d=
ependency
[    6.154584] coda 2040000.vpu: deferred probe timeout, ignoring depende=
ncy
[    6.164837] etnaviv-gpu: probe of 130000.gpu failed with error -110
[    6.183843] fsl-ssi-dai 2028000.ssi: No cache defaults, reading back f=
rom HW
[    6.197302] coda: probe of 2040000.vpu failed with error -110
[    6.203341] vdd1p1: supplied by regulator-dummy
[    6.212928] imx-ipuv3 2400000.ipu: IPUv3H probed
[    6.220529] etnaviv-gpu 134000.gpu: deferred probe timeout, ignoring d=
ependency
[    6.229564] vdd3p0: supplied by regulator-dummy
[    6.248185] imx-ipuv3 2800000.ipu: IPUv3H probed
[    6.256771] vdd2p5: supplied by regulator-dummy
[    6.261440] etnaviv-gpu: probe of 134000.gpu failed with error -110
[    6.271138] vddarm: supplied by regulator-dummy
[    6.282432] etnaviv-gpu 2204000.gpu: deferred probe timeout, ignoring =
dependency
[    6.300330] vddpu: supplied by regulator-dummy
[    6.305386] etnaviv-gpu: probe of 2204000.gpu failed with error -110
[    6.317138] vddsoc: supplied by regulator-dummy
[    6.360457] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops imx=
_drm_exit [imxdrm])
[    6.371009] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops imx=
_drm_exit [imxdrm])
[    6.409836] imx-drm display-subsystem: bound imx-ipuv3-crtc.6 (ops imx=
_drm_exit [imxdrm])
[    6.470660] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops imx=
_drm_exit [imxdrm])
[    6.484702] sdhci: Secure Digital Host Controller Interface driver
[    6.491019] sdhci: Copyright(c) Pierre Ossman
[    6.504924] sdhci-pltfm: SDHCI platform and OF driver helper
[    6.510874] SCSI subsystem initialized
[    6.535073] sdhci-esdhc-imx 2190000.mmc: allocated mmc-pwrseq
[    6.535806] usbcore: registered new interface driver usbfs
[    6.548080] sdhci-esdhc-imx 2194000.mmc: Got CD GPIO
[    6.573279] usbcore: registered new interface driver hub
[    6.581973] usbcore: registered new device driver usb
[    6.593133] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver=

[    6.622067] rtc-pcf8523 0-0068: low voltage detected, time is unreliab=
le
[    6.633766] libata version 3.00 loaded.
[    6.635757] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops imx=
_drm_exit [imxdrm])
[    6.652354] rtc-pcf8523 0-0068: registered as rtc1
[    6.658060] i2c i2c-0: IMX I2C adapter registered
[    6.663949] i2c i2c-1: IMX I2C adapter registered
[    6.664565] mmc1: SDHCI controller on 2194000.mmc [2194000.mmc] using =
ADMA
[    6.675074] ahci-imx 2200000.sata: fsl,transmit-level-mV value 1025, u=
sing 00000024
[    6.680343] usb_phy_generic usbphynop1: supply vcc not found, using du=
mmy regulator
[    6.683396] ahci-imx 2200000.sata: fsl,transmit-boost-mdB value 3330, =
using 00000480
[    6.693936] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops imx=
_drm_exit [imxdrm])
[    6.698876] ahci-imx 2200000.sata: fsl,transmit-atten-16ths value 9, u=
sing 00002000
[    6.698891] ahci-imx 2200000.sata: fsl,receive-eq-mdB value 3000, usin=
g 05000000
[    6.718458] usb_phy_generic usbphynop2: supply vcc not found, using du=
mmy regulator
[    6.748764] imx-drm display-subsystem: bound imx-ipuv3-crtc.6 (ops imx=
_drm_exit [imxdrm])
[    6.768590] ahci-imx 2200000.sata: supply ahci not found, using dummy =
regulator
[    6.776843] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops imx=
_drm_exit [imxdrm])
[    6.778185] ahci-imx 2200000.sata: supply phy not found, using dummy r=
egulator
[    6.793174] ahci-imx 2200000.sata: supply target not found, using dumm=
y regulator
[    6.804259] ahci-imx 2200000.sata: SSS flag set, parallel bus scan dis=
abled
[    6.811347] ahci-imx 2200000.sata: AHCI 0001.0300 32 slots 1 ports 3 G=
bps 0x1 impl platform mode
[    6.814889] dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a=20
with HDCP (DWC HDMI 3D TX PHY)
[    6.820189] ahci-imx 2200000.sata: flags: ncq sntf stag pm led clo onl=
y pmp pio slum part ccc apst=20
[    6.856484] mmc0: SDHCI controller on 2190000.mmc [2190000.mmc] using =
ADMA
[    6.900155] ci_hdrc ci_hdrc.0: EHCI Host Controller
[    6.905219] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus nu=
mber 1
[    6.906870] imx-drm display-subsystem: bound 120000.hdmi (ops dw_hdmi_=
imx_platform_driver_exit [dw_hdmi_imx])
[    6.957851] mmc1: host does not support reading read-only switch, assu=
ming write-enable
[    6.969408] [drm] Initialized imx-drm 1.0.0 20120507 for display-subsy=
stem on minor 0
[    6.982428] mmc1: new high speed SDHC card at address aaaa
[    6.997213] mmcblk1: mmc1:aaaa SC16G 14.8 GiB=20
[    7.017966] scsi host0: ahci-imx
[    7.022671] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
[    7.027314]  mmcblk1: p1
[    7.030377] ata1: SATA max UDMA/133 mmio [mem 0x02200000-0x02203fff] p=
ort 0x100 irq 80
[    7.043857] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[    7.052289] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    7.059645] usb usb1: Product: EHCI Host Controller
[    7.064576] usb usb1: Manufacturer: Linux 5.10.0-6-armmp ehci_hcd
[    7.070724] usb usb1: SerialNumber: ci_hdrc.0
[    7.076320] hub 1-0:1.0: USB hub found
[    7.080286] hub 1-0:1.0: 1 port detected
[    7.086184] random: fast init done
[    7.094444] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    7.099465] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus nu=
mber 2
[    7.120493] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    7.130324] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[    7.138701] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    7.145975] usb usb2: Product: EHCI Host Controller
[    7.150892] usb usb2: Manufacturer: Linux 5.10.0-6-armmp ehci_hcd
[    7.157023] usb usb2: SerialNumber: ci_hdrc.1
[    7.238041] sgtl5000 0-000a: sgtl5000 revision 0x11
[    7.248285] hub 2-0:1.0: USB hub found
[    7.248340] hub 2-0:1.0: 1 port detected
[    7.250870] sgtl5000 0-000a: Using internal LDO instead of VDDD: check=20
ER1 erratum
[    7.255774] Console: switching to colour frame buffer device 240x67
[    7.360644] imx-drm display-subsystem: [drm] fb0: imx-drmdrmfb frame b=
uffer device
[    7.402482] imx_thermal 20c8000.anatop:tempmon: Extended Commercial CP=
U temperature grade - max:105C critical:100C passive:95C
[    7.444999] debugfs: File 'Headphone Jack' in directory 'dapm' already=20
present!
[    7.496466] usb 1-1: new full-speed USB device number 2 using ci_hdrc
[    7.516476] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    7.523932] ata1.00: ATA-9: TS32GMSA370, 20140516, max UDMA/133
[    7.530039] ata1.00: 62533296 sectors, multi 1: LBA48 NCQ (depth 32)
[    7.536995] ata1.00: configured for UDMA/133
[    7.542006] scsi 0:0:0:0: Direct-Access     ATA      TS32GMSA370      =
0516 PQ: 0 ANSI: 5
[    7.579811] sd 0:0:0:0: [sda] 62533296 512-byte logical blocks: (32.0 =
GB/29.8 GiB)
[    7.589173] sd 0:0:0:0: [sda] Write Protect is off
[    7.594306] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    7.595360] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enable=
d, doesn't support DPO or FUA
[    7.605790] usb 2-1: new high-speed USB device number 2 using ci_hdrc
[    7.627934] sd 0:0:0:0: [sda] Attached SCSI disk
[    7.677169] usb 1-1: New USB device found, idVendor=3D045e, idProduct=3D=
07b2, bcdDevice=3D 7.44
[    7.685601] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    7.692967] usb 1-1: Product: Microsoft=C2=AE Nano Transceiver v1.0
[    7.699027] usb 1-1: Manufacturer: Microsoft
[    7.731026] hid: raw HID events driver (C) Jiri Kosina
[    7.774431] usb 2-1: New USB device found, idVendor=3D04b4, idProduct=3D=
6570, bcdDevice=3D32.99
[    7.782861] usb 2-1: New USB device strings: Mfr=3D0, Product=3D1, Ser=
ialNumber=3D0
[    7.790228] usb 2-1: Product: USB2.0 Hub
[    7.790396] usbcore: registered new interface driver usbhid
[    7.799992] usbhid: USB HID core driver
[    7.825516] input: Microsoft Microsoft=C2=AE Nano Transceiver v1.0 as =
/devices/platform/soc/2100000.bus/2184000.usb/ci_hdrc.0/usb1/1-1/1-1:1.0/=
0003:045E:07B2.0001/input/input1
[    7.849226] hub 2-1:1.0: USB hub found
[    7.853674] hub 2-1:1.0: 4 ports detected
[    7.914475] hid-generic 0003:045E:07B2.0001: input,hidraw0: USB HID v1=
=2E11 Keyboard [Microsoft Microsoft=C2=AE Nano Transceiver v1.0] on usb-c=
i_hdrc.0-1/input0
[    7.934774] input: Microsoft Microsoft=C2=AE Nano Transceiver v1.0 Mou=
se as /devices/platform/soc/2100000.bus/2184000.usb/ci_hdrc.0/usb1/1-1/1-=
1:1.1/0003:045E:07B2.0002/input/input2
[    7.950771] raid6: neonx8   gen()   645 MB/s
[    7.956820] input: Microsoft Microsoft=C2=AE Nano Transceiver v1.0 Con=
sumer Control as /devices/platform/soc/2100000.bus/2184000.usb/ci_hdrc.0/=
usb1/1-1/1-1:1.1/0003:045E:07B2.0002/input/input3
[    7.974798] hid-generic 0003:045E:07B2.0002: input,hidraw1: USB HID v1=
=2E11 Mouse [Microsoft Microsoft=C2=AE Nano Transceiver v1.0] on usb-ci_h=
drc.0-1/input1
[    7.993082] input: Microsoft Microsoft=C2=AE Nano Transceiver v1.0 Con=
sumer Control as /devices/platform/soc/2100000.bus/2184000.usb/ci_hdrc.0/=
usb1/1-1/1-1:1.2/0003:045E:07B2.0003/input/input4
[    8.016417] raid6: neonx8   xor()   476 MB/s
[    8.073683] input: Microsoft Microsoft=C2=AE Nano Transceiver v1.0 Sys=
tem Control as /devices/platform/soc/2100000.bus/2184000.usb/ci_hdrc.0/us=
b1/1-1/1-1:1.2/0003:045E:07B2.0003/input/input6
[    8.094756] raid6: neonx4   gen()  1582 MB/s
[    8.106306] hid-generic 0003:045E:07B2.0003: input,hiddev0,hidraw2: US=
B HID v1.11 Device [Microsoft Microsoft=C2=AE Nano Transceiver v1.0] on u=
sb-ci_hdrc.0-1/input2
[    8.164424] raid6: neonx4   xor()   938 MB/s
[    8.240422] raid6: neonx2   gen()  1417 MB/s
[    8.316410] raid6: neonx2   xor()   957 MB/s
[    8.392421] raid6: neonx1   gen()  1265 MB/s
[    8.468409] raid6: neonx1   xor()   866 MB/s
[    8.544481] raid6: int32x8  gen()   290 MB/s
[    8.620429] raid6: int32x8  xor()   189 MB/s
[    8.696420] raid6: int32x4  gen()   314 MB/s
[    8.772451] raid6: int32x4  xor()   202 MB/s
[    8.848462] raid6: int32x2  gen()   396 MB/s
[    8.924402] raid6: int32x2  xor()   199 MB/s
[    9.000400] raid6: int32x1  gen()   404 MB/s
[    9.076399] raid6: int32x1  xor()   177 MB/s
[    9.084874] raid6: using algorithm neonx4 gen() 1582 MB/s
[    9.094486] raid6: .... xor() 938 MB/s, rmw enabled
[    9.103570] raid6: using neon recovery algorithm
[    9.124154] xor: measuring software checksum speed
[    9.164979]    arm4regs        :   624 MB/sec
[    9.200508]    8regs           :   477 MB/sec
[    9.235288]    32regs          :   493 MB/sec
[    9.270966]    neon            :   467 MB/sec
[    9.285283] xor: using function: arm4regs (624 MB/sec)
[    9.316477] usb 2-1.1: new low-speed USB device number 3 using ci_hdrc=

[    9.450862] usb 2-1.1: New USB device found, idVendor=3D0603, idProduc=
t=3D00f2, bcdDevice=3D 1.12
[    9.462645] Btrfs loaded, crc32c=3Dcrc32c-generic
[    9.463768] usb 2-1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
[    9.486381] usb 2-1.1: Product: USB Keyboard
[    9.496114] usb 2-1.1: Manufacturer: NOVATEK
[    9.524690] input: NOVATEK USB Keyboard as /devices/platform/soc/21000=
00.bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.1/2-1.1:1.0/0003:0603:00F2.0004=
/input/input7
[    9.614345] hid-generic 0003:0603:00F2.0004: input,hidraw3: USB HID v1=
=2E10 Keyboard [NOVATEK USB Keyboard] on usb-ci_hdrc.1-1.1/input0
[    9.641942] input: NOVATEK USB Keyboard System Control as /devices/pla=
tform/soc/2100000.bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.1/2-1.1:1.1/0003=
:0603:00F2.0005/input/input8
[    9.730157] input: NOVATEK USB Keyboard Consumer Control as /devices/p=
latform/soc/2100000.bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.1/2-1.1:1.1/00=
03:0603:00F2.0005/input/input9
[    9.757684] input: NOVATEK USB Keyboard as /devices/platform/soc/21000=
00.bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.1/2-1.1:1.1/0003:0603:00F2.0005=
/input/input10
[    9.779283] hid-generic 0003:0603:00F2.0005: input,hiddev1,hidraw4: US=
B HID v1.10 Device [NOVATEK USB Keyboard] on usb-ci_hdrc.1-1.1/input1
[   10.157995] fuse: init (API version 7.32)
[   10.901118] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   13.019618] EXT4-fs (mmcblk1p1): mounted filesystem with ordered data =
mode. Opts: (null)
[   13.411215] Not activating Mandatory Access Control as /sbin/tomoyo-in=
it does not exist.
[   14.065796] systemd[1]: systemd 247.3-3 running in system mode. (+PAM =
+AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCR=
YPT +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -ID=
N +PCRE2 default-hierarchy=3Dunified)
[   14.112507] systemd[1]: Detected architecture arm.
[   14.134411] systemd[1]: Set hostname to <sr-imx6>.
[   14.989392] systemd[1]: /lib/systemd/system/plymouth-start.service:16:=20
Unit configured to use KillMode=3Dnone. This is unsafe, as it disables sy=
stemd's process lifecycle management for the service. Please update your =
service to use a safer KillMode=3D, such as 'mixed' or 'control-group'. S=
upport for KillMode=3Dnone is deprecated and will eventually be removed.
[   15.306138] systemd[1]: Queued start job for default target Multi-User=20
System.
[   15.319415] random: systemd: uninitialized urandom read (16 bytes read=
)
[   15.335497] systemd[1]: Created slice system-getty.slice.
[   15.346052] random: systemd: uninitialized urandom read (16 bytes read=
)
[   15.360080] systemd[1]: Created slice system-modprobe.slice.
[   15.373250] random: systemd: uninitialized urandom read (16 bytes read=
)
[   15.375100] systemd[1]: Created slice system-serial\x2dgetty.slice.
[   15.400765] systemd[1]: Created slice User and Session Slice.
[   15.415370] systemd[1]: Started Forward Password Requests to Wall Dire=
ctory Watch.
[   15.435949] systemd[1]: Set up automount Arbitrary Executable File For=
mats File System Automount Point.
[   15.454617] systemd[1]: Reached target Remote File Systems.
[   15.469572] systemd[1]: Reached target Slices.
[   15.484053] systemd[1]: Reached target Swap.
[   15.499089] systemd[1]: Listening on fsck to fsckd communication Socke=
t.
[   15.515243] systemd[1]: Listening on initctl Compatibility Named Pipe.=

[   15.532626] systemd[1]: Listening on Journal Audit Socket.
[   15.548151] systemd[1]: Listening on Journal Socket (/dev/log).
[   15.564593] systemd[1]: Listening on Journal Socket.
[   15.588292] systemd[1]: Listening on udev Control Socket.
[   15.599329] systemd[1]: Listening on udev Kernel Socket.
[   15.615055] systemd[1]: Condition check resulted in Huge Pages File Sy=
stem being skipped.
[   15.619738] systemd[1]: Mounting POSIX Message Queue File System...
[   15.649035] systemd[1]: Mounting Kernel Debug File System...
[   15.669184] systemd[1]: Mounting Kernel Trace File System...
[   15.687224] systemd[1]: Starting Create list of static device nodes fo=
r the current kernel...
[   15.709513] systemd[1]: Starting Load Kernel Module configfs...
[   15.734273] systemd[1]: Starting Load Kernel Module drm...
[   15.753814] systemd[1]: Starting Load Kernel Module fuse...
[   15.770090] systemd[1]: Condition check resulted in Set Up Additional =
Binary Formats being skipped.
[   15.770439] systemd[1]: Condition check resulted in File System Check =
on Root Device being skipped.
[   15.807938] systemd[1]: Starting Journal Service...
[   15.835374] systemd[1]: Starting Load Kernel Modules...
[   15.857910] systemd[1]: Starting Remount Root and Kernel File Systems.=
=2E.
[   15.889501] systemd[1]: Starting Coldplug All udev Devices...
[   15.950549] systemd[1]: Mounted POSIX Message Queue File System.
[   15.971513] systemd[1]: Mounted Kernel Debug File System.
[   15.972510] EXT4-fs (mmcblk1p1): re-mounted. Opts: (null)
[   16.002591] systemd[1]: Mounted Kernel Trace File System.
[   16.039590] systemd[1]: Finished Create list of static device nodes fo=
r the current kernel.
[   16.075917] systemd[1]: modprobe@configfs.service: Succeeded.
[   16.106208] systemd[1]: Finished Load Kernel Module configfs.
[   16.126809] systemd[1]: modprobe@drm.service: Succeeded.
[   16.132690] systemd[1]: Finished Load Kernel Module drm.
[   16.166774] systemd[1]: modprobe@fuse.service: Succeeded.
[   16.168246] systemd[1]: Finished Load Kernel Module fuse.
[   16.211016] systemd[1]: Finished Load Kernel Modules.
[   16.239204] systemd[1]: Finished Remount Root and Kernel File Systems.=

[   16.274875] systemd[1]: Mounting FUSE Control File System...
[   16.301972] systemd[1]: Mounting Kernel Configuration File System...
[   16.343616] systemd[1]: Condition check resulted in Rebuild Hardware D=
atabase being skipped.
[   16.357551] systemd[1]: Condition check resulted in Platform Persisten=
t Storage Archival being skipped.
[   16.377295] systemd[1]: Starting Load/Save Random Seed...
[   16.397738] systemd[1]: Starting Apply Kernel Variables...
[   16.422894] systemd[1]: Starting Create System Users...
[   16.447657] systemd[1]: Started Journal Service.
[   16.580135] systemd-journald[392]: Received client request to flush ru=
ntime journal.
[   16.626394] systemd-journald[392]: File /var/log/journal/afab1de66bb54=
e38af9f38092812b1e5/system.journal corrupted or uncleanly shut down, rena=
ming and replacing.
[   17.379060] audit: type=3D1400 audit(1618565478.540:2): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffi=
ce-xpdfimport" pid=3D418 comm=3D"apparmor_parser"
[   17.417557] audit: type=3D1400 audit(1618565478.576:3): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/bin/=
man" pid=3D417 comm=3D"apparmor_parser"
[   17.438357] audit: type=3D1400 audit(1618565478.576:4): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_filte=
r" pid=3D417 comm=3D"apparmor_parser"
[   17.458781] audit: type=3D1400 audit(1618565478.576:5): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_groff=
" pid=3D417 comm=3D"apparmor_parser"
[   17.496995] audit: type=3D1400 audit(1618565478.660:6): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/sbin=
/haveged" pid=3D419 comm=3D"apparmor_parser"
[   17.524531] audit: type=3D1400 audit(1618565478.684:7): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_mo=
dprobe" pid=3D420 comm=3D"apparmor_parser"
[   17.547914] audit: type=3D1400 audit(1618565478.688:8): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_mo=
dprobe//kmod" pid=3D420 comm=3D"apparmor_parser"
[   17.600050] audit: type=3D1400 audit(1618565478.760:9): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffi=
ce-senddoc" pid=3D422 comm=3D"apparmor_parser"
[   17.662405] audit: type=3D1400 audit(1618565478.824:10): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"lsb_rele=
ase" pid=3D423 comm=3D"apparmor_parser"
[   17.747261] audit: type=3D1400 audit(1618565478.908:11): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoff=
ice-oopslash" pid=3D424 comm=3D"apparmor_parser"
[   18.652496] random: crng init done
[   18.652504] random: 7 urandom warning(s) missed due to ratelimiting
[   22.579186] BTRFS: device label ssd devid 1 transid 33605 /dev/sda sca=
nned by systemd-udevd (437)
[   24.459090] Qualcomm Atheros AR8035 2188000.ethernet-1:00: attached PH=
Y driver [Qualcomm Atheros AR8035] (mii_bus:phy_addr=3D2188000.ethernet-1=
:00, irq=3DPOLL)
[   24.508525] rc rc0: two consecutive events of type space
[   28.540858] fec 2188000.ethernet eth0: Link is Up - 1Gbps/Full - flow =
control rx/tx
[   28.548911] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   35.804513] brcm_reg: disabling
[  100.392641] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops [etnaviv])
[  100.399989] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops [etnaviv])
[  100.414372] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops [etnaviv])=

[  100.421215] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[  100.428079] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[  100.461443] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[  100.467767] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[  100.476086] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on mi=
nor 1

--------------6B8BAB8A274BEB77E6F1608C
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv

--------------6B8BAB8A274BEB77E6F1608C--
