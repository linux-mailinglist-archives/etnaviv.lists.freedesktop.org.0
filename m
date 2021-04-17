Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D7362F5C
	for <lists+etnaviv@lfdr.de>; Sat, 17 Apr 2021 12:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD2F8903B;
	Sat, 17 Apr 2021 10:52:23 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 90871 seconds by postgrey-1.36 at gabe;
 Sat, 17 Apr 2021 10:52:22 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5A88903B
 for <etnaviv@lists.freedesktop.org>; Sat, 17 Apr 2021 10:52:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1618656731; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=T94Y29LyfrZvzZ2fMkmf5dZBa6TsZ6KgmpYtp9RUkxuJaPq9SdgjLtuL79kfHwGi8e
 +06YAe7Dtb5tr58PGTDEekOFjrNcTSDEphYe97RzMlRKsjwIExqcCqCUTtg2gSQ8OkIS
 TonDA1kjEZEj0WuKs2N4txsJRklld3jt8csyUD7blnSC+FAosWQBMVDslWs6OQ9nFn53
 ZqVc/Pvb7KdyLm+ESMqqyt7YWX3sGB8nqz/ISvneXk9XFilATjy/wUENbvSH5y+EIDTH
 l8S3hbY0utGzXw67zJmjDSvZueDZBEvQ8qq7tM0ZMhN7uvX2BBgCYHafPhqhWipJ1eKJ
 Ouzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618656731;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:Subject:From:References:Cc:To:Cc:Date:
 From:Subject:Sender;
 bh=Aca1JEsGvtEoC5uTZIwW2kcVPgscb76sHCUXpSQOZDc=;
 b=O2l82nbBnQoe3vXgRZnDZKI2AL4ftHrUZHgE+SNuCISfOhzQxTIV9MPtyJOC1/lKzl
 S+88S8UoWYQMNsgxne3Xh5qfohGX3NO7vZ3snxH+WtywEllg11HB3Xctx2aR8vpFBORe
 BIg7+v/TtToO2P5BuyvV+0udyb7roJWAM4MRS47kMvPwouUh1QB0TZLHOos6PaFOGr89
 UlmQyey3a3d2hQJ8S31Crnc7icW9NqnpWQdHpllKSkPtfjEEGdEwrpJRm3v9SaHYRE3+
 A9wPDS5G5Y/+Be7qEuDxpsD3rWXzHrozebiBGePnQ1KII1umeKMc5gpBaAchOD6AfNRB
 AEqw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1618656731;
 s=strato-dkim-0002; d=jm0.eu;
 h=In-Reply-To:Date:Message-ID:Subject:From:References:Cc:To:Cc:Date:
 From:Subject:Sender;
 bh=Aca1JEsGvtEoC5uTZIwW2kcVPgscb76sHCUXpSQOZDc=;
 b=fwV8mms0K4yt14Ae2Hp5HtSdMiRQ/9cGqIkvs5aexnLS/kSCj0Ut8RWmlKNGNtsUFP
 Z59eR5GWeaWrKCUpiuDHemqH0GutHEgK/1kXRH4mmJm0pdlPZOv/2K5kdQBcGPG40nLH
 pgarEaa+GimBO5FH+Sogjl9DW+1g2Mu+Xs9Ptx0SMnk3p5kYXWS93p+fMuBhku2ns/Lj
 fv65Sc7FV0Lru6ijfhg0exl5bdlcs/g8OYn/zgRE0gNLVT2vlvtYk7OOHSpaOW3/KYx/
 P27CnmfpSfyDp7M8Lh9UX1xS4spGnwOGs6C12681fOiJgvCpO9RRWnDomIoNCvMuJWcP
 RIXg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPXvQCbXgI7t69COvnl6LERsNcX+38fzPJhyS/JvIQkjQZbA=="
X-RZG-CLASS-ID: mo00
Received: from p200300c61f3beb109fa2ef225d856571.dip0.t-ipconnect.de
 by smtp.strato.de (RZmta 47.24.3 AUTH)
 with ESMTPSA id g09a86x3HAqAA04
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 17 Apr 2021 12:52:10 +0200 (CEST)
To: John Stultz <john.stultz@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
References: <d83adc7a-d9db-af35-83c9-6d3dab60ab82@jm0.eu>
 <9880212dc158bbadbccb6313d9fa59a27698ef3e.camel@pengutronix.de>
 <a7002193-343d-9144-38ab-63542c09a4de@jm0.eu>
 <11943ea5d883bd2632c71f4a9e1a42c5f88c5e14.camel@pengutronix.de>
 <CALAqxLWsOLvrSxWzhGDzvUDyDfcKXJ7wK4oSaQ9Wqo4_iKLjkg@mail.gmail.com>
From: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Subject: Re: etnaviv fails probe early, but succeeds after rmmod && modprobe
Message-ID: <8d570278-aa6a-acbf-77af-e62641c25bf5@jm0.eu>
Date: Sat, 17 Apr 2021 12:52:10 +0200
MIME-Version: 1.0
In-Reply-To: <CALAqxLWsOLvrSxWzhGDzvUDyDfcKXJ7wK4oSaQ9Wqo4_iKLjkg@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------843B4875BDEA8D868F23342F"
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
Cc: Rob Herring <robh@kernel.org>, etnaviv@lists.freedesktop.org,
 Saravana Kannan <saravanak@google.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------843B4875BDEA8D868F23342F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi John,
Am 17.04.21 um 05:46 schrieb John Stultz:
> On Fri, Apr 16, 2021 at 4:13 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>> Am Freitag, dem 16.04.2021 um 12:57 +0200 schrieb Ing. Josua Mayer:
>>> Hi Lucas,
>>>
>>> anatop_regulator is indeed a module currently,
>>> this is one of the changes introduced in their jump from kernel 5.9 to
>>> 5.10 - and has even landed in buster through backports ...
>>>
>>> I wonder how / where those timeouts are specified.
>>> Regarding the order of module loading there is not much I can do, it is
>>> already the second module inserted by the initramfs.
>>
>> This looks like a kernel bug to me. If no timeout is given on the
>> command line, the status is immediately considered as timed-out after
>> the initcalls are done, as the code doesn't differentiate between "no
>> timeout given" and "timeout expired" at that point.
>>
>> CC'ing John Stultz, who touched that code last.
> 
> Yea, sadly my attempts to try to stretch the default timeouts so this
> wouldn't happen ended up causing problems for the "optional links"
> case, where folks want the driver core to stop deferring and return an
> error for the bits that aren't present. So we had to back out most of
> those changes (so yes, I touched it last, but unfortunately had to to
> put things mostly back the way it was).
 >
Thank you for your comments!
I am sad to hear that adjusting timeouts was not a path of success ...

> Personally, I think the implicit optional link concept in dts was a
> mistake, as I think having some explicit notation would have made
> things work a lot better since the timeout solution does not feel
> ideal for anyone, but I also am (happily) not the expert there, so I
> probably shouldn't judge. :)
> 
> In the end, it seems the fw_devlink logic Saravana is working on is
> really the better solution. I know he's getting closer to being able
> to set it as the default, so you might check that out?
> 
> thanks
> -john
> 

So from all these pointers I finally played with the 
deferred_probe_timeout kernel parameter. Maybe something just needed 
more time? Well ... for some reason passing 20 made it so that etnaviv 
eventually probes successfully!

I am attaching the full dmesg for reference - note that all modules are 
in initramfs only for debugging purposes, this is not the default debian 
split.

Is there really a difference between specifying and not specifying 
deferred_probe_timeout which is described as a debugging feature?

sincerely
Josua Mayer

--------------843B4875BDEA8D868F23342F
Content-Type: text/x-log; charset=UTF-8;
 name="sr-imx6-etna-probe-timeout20.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="sr-imx6-etna-probe-timeout20.log"

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
[    0.000000] Kernel command line:  root=3D/dev/mmcblk1p1 deferred_probe=
_timeout=3D20 console=3Dttymxc0,115200 log_level=3D7 net.ifnames=3D0 cons=
ole=3Dtty cma=3D256M
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 =
bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.000000] Memory: 740700K/1048576K available (11264K kernel code, 16=
65K rwdata, 3184K rodata, 2048K init, 335K bss, 45732K reserved, 262144K =
cma-reserved, 0K highmem)
[    0.000000] random: get_random_u32 called from __kmem_cache_create+0x3=
4/0x438 with crng_init=3D0
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,=20
Nodes=3D1
[    0.000000] ftrace: allocating 37355 entries in 73 pages
[    0.000000] ftrace: allocated 73 pages with 3 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D=
2.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
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
[    0.000008] sched_clock: 32 bits at 3000kHz, resolution 333ns, wraps e=
very 715827882841ns
[    0.000028] clocksource: mxc_timer1: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 637086815595 ns
[    0.003075] Console: colour dummy device 80x30
[    0.003670] printk: console [tty0] enabled
[    0.003730] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 6.00 BogoMIPS (lpj=3D12000)
[    0.003768] pid_max: default: 32768 minimum: 301
[    0.004131] LSM: Security Framework initializing
[    0.004249] Yama: disabled by default; enable with sysctl kernel.yama.=
*
[    0.004546] AppArmor: AppArmor initialized
[    0.004578] TOMOYO Linux initialized
[    0.004703] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes=
, linear)
[    0.004746] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 =
bytes, linear)
[    0.006084] CPU: Testing write buffer coherency: ok
[    0.006148] CPU0: Spectre v2: using BPIALL workaround
[    0.006579] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.007816] Setting up static identity map for 0x10300000 - 0x103000ac=

[    0.009242] rcu: Hierarchical SRCU implementation.
[    0.012025] EFI services will not be available.
[    0.012514] smp: Bringing up secondary CPUs ...
[    0.013691] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.013701] CPU1: Spectre v2: using BPIALL workaround
[    0.013914] smp: Brought up 1 node, 2 CPUs
[    0.013942] SMP: Total of 2 processors activated (12.00 BogoMIPS).
[    0.013962] CPU: All CPU(s) started in SVC mode.
[    0.014835] devtmpfs: initialized
[    0.026016] VFP support v0.3: implementor 41 architecture 3 part 30 va=
riant 9 rev 4
[    0.026398] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 7645041785100000 ns
[    0.026507] futex hash table entries: 512 (order: 3, 32768 bytes, line=
ar)
[    0.045027] pinctrl core: initialized pinctrl subsystem
[    0.046606] DMI not present or invalid.
[    0.047096] NET: Registered protocol family 16
[    0.051001] DMA: preallocated 256 KiB pool for atomic coherent allocat=
ions
[    0.052084] audit: initializing netlink subsys (disabled)
[    0.052418] audit: type=3D2000 audit(0.052:1): state=3Dinitialized aud=
it_enabled=3D0 res=3D1
[    0.053898] thermal_sys: Registered thermal governor 'fair_share'
[    0.053906] thermal_sys: Registered thermal governor 'bang_bang'
[    0.053935] thermal_sys: Registered thermal governor 'step_wise'
[    0.053956] thermal_sys: Registered thermal governor 'user_space'
[    0.053978] thermal_sys: Registered thermal governor 'power_allocator'=

[    0.054349] CPU identified as i.MX6Q, silicon rev 1.5
[    0.537244] No ATAGs?
[    0.537410] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1 watc=
hpoint registers.
[    0.537440] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.539289] debugfs: Directory 'dummy-iomuxc-gpr@20e0000' with parent =
'regmap' already present!
[    0.539656] imx6q-pinctrl 20e0000.pinctrl: initialized IMX pinctrl dri=
ver
[    0.541539] Serial: AMBA PL011 UART driver
[    0.549859] Kprobes globally optimized
[    2.281924] mxs-dma 110000.dma-apbh: initialized
[    2.283547] reg-fixed-voltage regulator-vcc-3v3: reg_fixed_voltage_pro=
be()
[    2.284138] reg-fixed-voltage brcm-reg: reg_fixed_voltage_probe()
[    2.284598] reg-fixed-voltage regulator-v-3v2: reg_fixed_voltage_probe=
()
[    2.285083] reg-fixed-voltage regulator-v-5v0: reg_fixed_voltage_probe=
()
[    2.285498] reg-fixed-voltage regulator-v-sd: reg_fixed_voltage_probe(=
)
[    2.287465] v_3v2: supplied by v_5v0
[    2.287544] vcc_3v3: supplied by v_3v2
[    2.287627] v_sd: supplied by v_3v2
[    2.288043] reg-fixed-voltage regulator-v-usb2: reg_fixed_voltage_prob=
e()
[    2.288334] v_usb2: supplied by v_5v0
[    2.288727] reg-fixed-voltage regulator-v-usb1: reg_fixed_voltage_prob=
e()
[    2.289020] v_usb1: supplied by v_5v0
[    2.291486] iommu: Default domain type: Translated=20
[    2.292664] vgaarb: loaded
[    2.293867] mc: Linux media interface: v0.10
[    2.293928] videodev: Linux video capture interface: v2.00
[    2.295885] NetLabel: Initializing
[    2.295912] NetLabel:  domain hash size =3D 128
[    2.295929] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    2.296040] NetLabel:  unlabeled traffic allowed by default
[    2.296493] clocksource: Switched to clocksource mxc_timer1
[    2.389701] VFS: Disk quotas dquot_6.6.0
[    2.389855] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 b=
ytes)
[    2.390768] AppArmor: AppArmor Filesystem Enabled
[    2.404893] NET: Registered protocol family 2
[    2.406360] tcp_listen_portaddr_hash hash table entries: 512 (order: 0=
, 6144 bytes, linear)
[    2.406486] TCP established hash table entries: 8192 (order: 3, 32768 =
bytes, linear)
[    2.406713] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, =
linear)
[    2.406861] TCP: Hash tables configured (established 8192 bind 8192)
[    2.407191] UDP hash table entries: 512 (order: 2, 16384 bytes, linear=
)
[    2.407287] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, l=
inear)
[    2.407564] NET: Registered protocol family 1
[    2.407632] NET: Registered protocol family 44
[    2.407666] PCI: CLS 0 bytes, default 64
[    2.408446] Trying to unpack rootfs image as initramfs...
[    3.348038] Freeing initrd memory: 12904K
[    3.348816] hw perfevents: no interrupt-affinity property for /pmu, gu=
essing.
[    3.349103] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7 =
counters available
[    3.351895] Initialise system trusted keyrings
[    3.351965] Key type blacklist registered
[    3.352283] workingset: timestamp_bits=3D14 max_order=3D18 bucket_orde=
r=3D4
[    3.360252] zbud: loaded
[    3.361619] integrity: Platform Keyring initialized
[    3.361660] Key type asymmetric registered
[    3.361679] Asymmetric key parser 'x509' registered
[    3.362283] bounce: pool size: 64 pages
[    3.362404] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 250)
[    3.362779] io scheduler mq-deadline registered
[    3.374859] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000 ran=
ges:
[    3.374935] imx6q-pcie 1ffc000.pcie:       IO 0x0001f80000..0x0001f8ff=
ff -> 0x0000000000
[    3.374981] imx6q-pcie 1ffc000.pcie:      MEM 0x0001000000..0x0001efff=
ff -> 0x0001000000
[    3.384401] imx-sdma 20ec000.sdma: firmware: direct-loading firmware i=
mx/sdma/sdma-imx6q.bin
[    3.384722] imx-sdma 20ec000.sdma: loaded firmware 3.5
[    3.392287] Serial: 8250/16550 driver, 5 ports, IRQ sharing enabled
[    3.395977] Serial: AMBA driver
[    3.396930] 2020000.serial: ttymxc0 at MMIO 0x2020000 (irq =3D 34, bas=
e_baud =3D 5000000) is a IMX
[    4.254907] printk: console [ttymxc0] enabled
[    4.260825] 21f0000.serial: ttymxc3 at MMIO 0x21f0000 (irq =3D 77, bas=
e_baud =3D 5000000) is a IMX
[    4.271931] STM32 USART driver initialized
[    4.279544] libphy: Fixed MDIO Bus: probed
[    4.290177] libphy: fec_enet_mii_bus: probed
[    4.308785] at803x: module verification failed: signature and/or requi=
red key missing - tainting kernel
[    4.324559] mdio_bus 2188000.ethernet-1: MDIO device at address 4 is m=
issing.
[    4.333860] mousedev: PS/2 mouse device common for all mice
[    4.343014] snvs_rtc 20cc000.snvs:snvs-rtc-lp: registered as rtc0
[    4.349263] snvs_rtc 20cc000.snvs:snvs-rtc-lp: setting system clock to=20
2021-04-17T10:49:36 UTC (1618656576)
[    4.365256] ledtrig-cpu: registered to indicate activity on CPUs
[    4.373614] NET: Registered protocol family 10
[    4.433077] Segment Routing with IPv6
[    4.436946] mip6: Mobile IPv6
[    4.439934] NET: Registered protocol family 17
[    4.444659] mpls_gso: MPLS GSO support
[    4.448986] ThumbEE CPU extension supported.
[    4.453331] Registering SWP/SWPB emulation handler
[    4.458377] registered taskstats version 1
[    4.462557] Loading compiled-in X.509 certificates
[    4.480616] imx6q-pcie 1ffc000.pcie: Phy link never came up
[    4.489513] imx6q-pcie 1ffc000.pcie: PCI host bridge to bus 0000:00
[    4.495838] pci_bus 0000:00: root bus resource [bus 00-ff]
[    4.501360] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    4.507579] pci_bus 0000:00: root bus resource [mem 0x01000000-0x01eff=
fff]
[    4.514528] pci 0000:00:00.0: [16c3:abcd] type 01 class 0x060400
[    4.520584] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000fffff]
[    4.526893] pci 0000:00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff pre=
f]
[    4.533654] pci 0000:00:00.0: Limiting cfg_size to 512
[    4.538868] pci 0000:00:00.0: supports D1
[    4.542910] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
[    4.552909] PCI: bus0: Fast back to back transfers disabled
[    4.561815] PCI: bus1: Fast back to back transfers enabled
[    4.567370] pci 0000:00:00.0: BAR 0: assigned [mem 0x01000000-0x010fff=
ff]
[    4.574205] pci 0000:00:00.0: BAR 6: assigned [mem 0x01100000-0x0110ff=
ff pref]
[    4.581467] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    4.587185] pcieport 0000:00:00.0: PME: Signaling with IRQ 309
[    4.593469] pcieport 0000:00:00.0: AER: enabled with IRQ 309
[    4.869310] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f=
6149f3dd27dfcc5cbb419ea1'
[    4.878158] Loaded X.509 cert 'Debian Secure Boot Signer 2021 - linux:=20
4b6ef5abca669825178e052c84667ccbc0531f8c'
[    4.888575] zswap: loaded using pool lzo/zbud
[    4.893761] Key type ._fscrypt registered
[    4.897864] Key type .fscrypt registered
[    4.901841] Key type fscrypt-provisioning registered
[    4.907080] AppArmor: AppArmor sha1 policy hashing enabled
[    4.957055] Freeing unused kernel memory: 2048K
[    4.969261] ------------[ cut here ]------------
[    4.973953] WARNING: CPU: 1 PID: 1 at arch/arm/mm/dump.c:248 note_page=
+0x3d0/0x3dc
[    4.981567] arm/mm: Found insecure W+X mapping at address 0xf0879000
[    4.987952] Modules linked in: at803x(E)
[    4.991932] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G            E     =
5.10.0-6-armmp #1 Debian 5.10.28-1
[    5.001431] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)=

[    5.007975] Backtrace:=20
[    5.010453] [<c0cf1000>] (dump_backtrace) from [<c0cf13ac>] (show_stac=
k+0x20/0x24)
[    5.018046]  r7:000000f8 r6:600e0013 r5:00000000 r4:c14cdbd0
[    5.023731] [<c0cf138c>] (show_stack) from [<c0cf64dc>] (dump_stack+0x=
c8/0xdc)
[    5.030987] [<c0cf6414>] (dump_stack) from [<c034d670>] (__warn+0xfc/0=
x158)
[    5.037968]  r7:000000f8 r6:00000009 r5:c031f548 r4:c0fbbd84
[    5.043648] [<c034d574>] (__warn) from [<c0cf2160>] (warn_slowpath_fmt=
+0xa4/0xe4)
[    5.051151]  r7:c031f548 r6:000000f8 r5:c0fbbd84 r4:c0fbbd50
[    5.056829] [<c0cf20c0>] (warn_slowpath_fmt) from [<c031f548>] (note_p=
age+0x3d0/0x3dc)
[    5.064765]  r8:00000000 r7:00000000 r6:00000005 r5:c140c4a0 r4:c195bf=
28
[    5.071483] [<c031f178>] (note_page) from [<c031f63c>] (walk_pmd+0xe8/=
0x1a4)
[    5.078550]  r10:c195bf28 r9:c0207c20 r8:c18db800 r7:00000000 r6:c0fbb=
dcc r5:f087b000
[    5.086395]  r4:c18db1ec
[    5.088944] [<c031f554>] (walk_pmd) from [<c031f83c>] (ptdump_check_wx=
+0x88/0x104)
[    5.096535]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:c0208=
000 r5:f0800000
[    5.104380]  r4:c0207c28
[    5.106936] [<c031f7b4>] (ptdump_check_wx) from [<c0319740>] (mark_rod=
ata_ro+0x3c/0x40)
[    5.114958]  r6:00000000 r5:c0d00694 r4:00000000
[    5.119601] [<c0319704>] (mark_rodata_ro) from [<c0d006d8>] (kernel_in=
it+0x44/0x130)
[    5.127370] [<c0d00694>] (kernel_init) from [<c03001a8>] (ret_from_for=
k+0x14/0x2c)
[    5.134956] Exception stack(0xc195bfb0 to 0xc195bff8)
[    5.140023] bfa0:                                     00000000 0000000=
0 00000000 00000000
[    5.148220] bfc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0 00000000 00000000
[    5.156418] bfe0: 00000000 00000000 00000000 00000000 00000013 0000000=
0
[    5.163045]  r5:c0d00694 r4:00000000
[    5.166688] ---[ end trace 4958bb094cde3061 ]---
[    5.171602] Checked W+X mappings: FAILED, 1 W+X pages found
[    5.177237] Run /init as init process
[    5.180932]   with arguments:
[    5.180941]     /init
[    5.180948]   with environment:
[    5.180955]     HOME=3D/
[    5.180963]     TERM=3Dlinux
[    5.180970]     log_level=3D7
[    5.877526] Registered IR keymap rc-empty
[    5.908392] rc rc0: gpio_ir_recv as /devices/platform/ir-receiver/rc/r=
c0
[    5.928825] rc rc0: lirc_dev: driver gpio_ir_recv registered at minor =
=3D 0, raw IR receiver, no transmitter
[    5.967745] input: gpio_ir_recv as /devices/platform/ir-receiver/rc/rc=
0/input0
[    6.034746] CAN device driver interface
[    6.037846] imx-ipuv3 2400000.ipu: IPUv3H probed
[    6.077694] imx-ipuv3 2800000.ipu: IPUv3H probed
[    6.189861] vdd1p1: supplied by regulator-dummy
[    6.232337] vdd3p0: supplied by regulator-dummy
[    6.253493] vdd2p5: supplied by regulator-dummy
[    6.265960] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops imx=
_drm_exit [imxdrm])
[    6.281926] vddarm: supplied by regulator-dummy
[    6.297505] fsl-ssi-dai 2028000.ssi: No cache defaults, reading back f=
rom HW
[    6.298384] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops imx=
_drm_exit [imxdrm])
[    6.333094] vddpu: supplied by regulator-dummy
[    6.338162] vddsoc: supplied by regulator-dummy
[    6.361342] imx-drm display-subsystem: bound imx-ipuv3-crtc.6 (ops imx=
_drm_exit [imxdrm])
[    6.387189] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops imx=
_drm_exit [imxdrm])
[    6.427142] rtc-pcf8523 0-0068: failed to set xtal load capacitance: -=
6
[    6.455788] sdhci: Secure Digital Host Controller Interface driver
[    6.462117] sdhci: Copyright(c) Pierre Ossman
[    6.487796] sdhci-pltfm: SDHCI platform and OF driver helper
[    6.490576] i2c i2c-0: IMX I2C adapter registered
[    6.498472] etnaviv etnaviv: bound 130000.gpu (ops etnaviv_gpu_recover=
_hang [etnaviv])
[    6.528946] sdhci-esdhc-imx 2190000.mmc: allocated mmc-pwrseq
[    6.535649] sdhci-esdhc-imx 2194000.mmc: Got CD GPIO
[    6.544266] i2c i2c-1: IMX I2C adapter registered
[    6.580888] SCSI subsystem initialized
[    6.584161] usb_phy_generic usbphynop1: supply vcc not found, using du=
mmy regulator
[    6.591984] usbcore: registered new interface driver usbfs
[    6.592575] etnaviv etnaviv: bound 134000.gpu (ops etnaviv_gpu_recover=
_hang [etnaviv])
[    6.618339] usbcore: registered new interface driver hub
[    6.627427] usb_phy_generic usbphynop2: supply vcc not found, using du=
mmy regulator
[    6.635159] usbcore: registered new device driver usb
[    6.639649] etnaviv etnaviv: bound 2204000.gpu (ops etnaviv_gpu_recove=
r_hang [etnaviv])
[    6.648321] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[    6.669523] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver=

[    6.687020] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    6.688440] libata version 3.00 loaded.
[    6.693381] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[    6.699588] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[    6.727142] mmc1: SDHCI controller on 2194000.mmc [2194000.mmc] using =
ADMA
[    6.729580] ahci-imx 2200000.sata: fsl,transmit-level-mV value 1025, u=
sing 00000024
[    6.741828] ahci-imx 2200000.sata: fsl,transmit-boost-mdB value 3330, =
using 00000480
[    6.749655] ahci-imx 2200000.sata: fsl,transmit-atten-16ths value 9, u=
sing 00002000
[    6.757414] ahci-imx 2200000.sata: fsl,receive-eq-mdB value 3000, usin=
g 05000000
[    6.775058] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on mi=
nor 0
[    6.792968] ci_hdrc ci_hdrc.0: EHCI Host Controller
[    6.798028] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus nu=
mber 1
[    6.810474] coda 2040000.vpu: firmware: failed to load vpu_fw_imx6q.bi=
n (-2)
[    6.814544] ahci-imx 2200000.sata: supply ahci not found, using dummy =
regulator
[    6.817655] firmware_class: See https://wiki.debian.org/Firmware for i=
nformation about missing firmware
[    6.834411] coda 2040000.vpu: Direct firmware load for vpu_fw_imx6q.bi=
n failed with error -2
[    6.845483] coda 2040000.vpu: firmware: failed to load vpu/vpu_fw_imx6=
q.bin (-2)
[    6.852981] coda 2040000.vpu: Direct firmware load for vpu/vpu_fw_imx6=
q.bin failed with error -2
[    6.860549] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
[    6.862252] coda 2040000.vpu: firmware: failed to load v4l-coda960-imx=
6q.bin (-2)
[    6.874809] coda 2040000.vpu: Direct firmware load for v4l-coda960-imx=
6q.bin failed with error -2
[    6.875009] ahci-imx 2200000.sata: supply phy not found, using dummy r=
egulator
[    6.899300] coda 2040000.vpu: firmware request failed
[    6.900339] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[    6.904971] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops imx=
_drm_exit [imxdrm])
[    6.912766] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    6.912777] usb usb1: Product: EHCI Host Controller
[    6.921125] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops imx=
_drm_exit [imxdrm])
[    6.928237] usb usb1: Manufacturer: Linux 5.10.0-6-armmp ehci_hcd
[    6.928243] usb usb1: SerialNumber: ci_hdrc.0
[    6.952716] imx-drm display-subsystem: bound imx-ipuv3-crtc.6 (ops imx=
_drm_exit [imxdrm])
[    6.961091] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops imx=
_drm_exit [imxdrm])
[    6.969727] dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a=20
with HDCP (DWC HDMI 3D TX PHY)
[    6.980381] imx-drm display-subsystem: bound 120000.hdmi (ops dw_hdmi_=
imx_platform_driver_exit [dw_hdmi_imx])
[    6.985137] ahci-imx 2200000.sata: supply target not found, using dumm=
y regulator
[    6.990472] mmc0: SDHCI controller on 2190000.mmc [2190000.mmc] using =
ADMA
[    7.005630] [drm] Initialized imx-drm 1.0.0 20120507 for display-subsy=
stem on minor 1
[    7.016250] mmc1: host does not support reading read-only switch, assu=
ming write-enable
[    7.027861] mmc1: new high speed SDHC card at address aaaa
[    7.036180] mmcblk1: mmc1:aaaa SC16G 14.8 GiB=20
[    7.050879]  mmcblk1: p1
[    7.053469] hub 1-0:1.0: USB hub found
[    7.055027] ahci-imx 2200000.sata: SSS flag set, parallel bus scan dis=
abled
[    7.064334] ahci-imx 2200000.sata: AHCI 0001.0300 32 slots 1 ports 3 G=
bps 0x1 impl platform mode
[    7.064457] hub 1-0:1.0: 1 port detected
[    7.073186] ahci-imx 2200000.sata: flags: ncq sntf stag pm led clo onl=
y pmp pio slum part ccc apst=20
[    7.079515] random: fast init done
[    7.094470] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    7.099528] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus nu=
mber 2
[    7.120594] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    7.129128] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[    7.137493] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    7.144776] usb usb2: Product: EHCI Host Controller
[    7.149690] usb usb2: Manufacturer: Linux 5.10.0-6-armmp ehci_hcd
[    7.155816] usb usb2: SerialNumber: ci_hdrc.1
[    7.196898] scsi host0: ahci-imx
[    7.197411] ata1: SATA max UDMA/133 mmio [mem 0x02200000-0x02203fff] p=
ort 0x100 irq 80
[    7.198534] sgtl5000 0-000a: Error reading chip id -6
[    7.217168] Console: switching to colour frame buffer device 240x67
[    7.228705] hub 2-0:1.0: USB hub found
[    7.230080] hub 2-0:1.0: 1 port detected
[    7.279503] imx-drm display-subsystem: [drm] fb0: imx-drmdrmfb frame b=
uffer device
[    7.337929] imx_thermal 20c8000.anatop:tempmon: Extended Commercial CP=
U temperature grade - max:105C critical:100C passive:95C
[    7.428628] usb 1-1: new full-speed USB device number 2 using ci_hdrc
[    7.564610] usb 2-1: new high-speed USB device number 2 using ci_hdrc
[    7.604049] usb 1-1: New USB device found, idVendor=3D045e, idProduct=3D=
07b2, bcdDevice=3D 7.44
[    7.612552] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    7.619981] usb 1-1: Product: Microsoft=C2=AE Nano Transceiver v1.0
[    7.626106] usb 1-1: Manufacturer: Microsoft
[    7.670643] hid: raw HID events driver (C) Jiri Kosina
[    7.680713] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    7.688258] ata1.00: ATA-9: TS32GMSA370, 20140516, max UDMA/133
[    7.694352] ata1.00: 62533296 sectors, multi 1: LBA48 NCQ (depth 32)
[    7.708915] ata1.00: configured for UDMA/133
[    7.713942] scsi 0:0:0:0: Direct-Access     ATA      TS32GMSA370      =
0516 PQ: 0 ANSI: 5
[    7.731068] usbcore: registered new interface driver usbhid
[    7.737023] usbhid: USB HID core driver
[    7.753183] usb 2-1: New USB device found, idVendor=3D04b4, idProduct=3D=
6570, bcdDevice=3D32.99
[    7.759006] sd 0:0:0:0: [sda] 62533296 512-byte logical blocks: (32.0 =
GB/29.8 GiB)
[    7.761537] usb 2-1: New USB device strings: Mfr=3D0, Product=3D1, Ser=
ialNumber=3D0
[    7.761544] usb 2-1: Product: USB2.0 Hub
[    7.785980] hub 2-1:1.0: USB hub found
[    7.788397] sd 0:0:0:0: [sda] Write Protect is off
[    7.794767] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    7.795072] hub 2-1:1.0: 4 ports detected
[    7.795645] input: Microsoft Microsoft=C2=AE Nano Transceiver v1.0 as =
/devices/platform/soc/2100000.bus/2184000.usb/ci_hdrc.0/usb1/1-1/1-1:1.0/=
0003:045E:07B2.0001/input/input1
[    7.815382] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enable=
d, doesn't support DPO or FUA
[    7.844734] sd 0:0:0:0: [sda] Attached SCSI disk
[    7.889728] hid-generic 0003:045E:07B2.0001: input,hidraw0: USB HID v1=
=2E11 Keyboard [Microsoft Microsoft=C2=AE Nano Transceiver v1.0] on usb-c=
i_hdrc.0-1/input0
[    7.911249] input: Microsoft Microsoft=C2=AE Nano Transceiver v1.0 Mou=
se as /devices/platform/soc/2100000.bus/2184000.usb/ci_hdrc.0/usb1/1-1/1-=
1:1.1/0003:045E:07B2.0002/input/input2
[    7.928378] input: Microsoft Microsoft=C2=AE Nano Transceiver v1.0 Con=
sumer Control as /devices/platform/soc/2100000.bus/2184000.usb/ci_hdrc.0/=
usb1/1-1/1-1:1.1/0003:045E:07B2.0002/input/input3
[    7.945905] hid-generic 0003:045E:07B2.0002: input,hidraw1: USB HID v1=
=2E11 Mouse [Microsoft Microsoft=C2=AE Nano Transceiver v1.0] on usb-ci_h=
drc.0-1/input1
[    7.969825] input: Microsoft Microsoft=C2=AE Nano Transceiver v1.0 Con=
sumer Control as /devices/platform/soc/2100000.bus/2184000.usb/ci_hdrc.0/=
usb1/1-1/1-1:1.2/0003:045E:07B2.0003/input/input4
[    8.045441] input: Microsoft Microsoft=C2=AE Nano Transceiver v1.0 Sys=
tem Control as /devices/platform/soc/2100000.bus/2184000.usb/ci_hdrc.0/us=
b1/1-1/1-1:1.2/0003:045E:07B2.0003/input/input6
[    8.067255] hid-generic 0003:045E:07B2.0003: input,hiddev0,hidraw2: US=
B HID v1.11 Device [Microsoft Microsoft=C2=AE Nano Transceiver v1.0] on u=
sb-ci_hdrc.0-1/input2
[    8.164600] usb 2-1.1: new low-speed USB device number 3 using ci_hdrc=

[    8.290993] usb 2-1.1: New USB device found, idVendor=3D0603, idProduc=
t=3D00f2, bcdDevice=3D 1.12
[    8.303924] usb 2-1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
[    8.315545] usb 2-1.1: Product: USB Keyboard
[    8.324059] usb 2-1.1: Manufacturer: NOVATEK
[    8.360493] raid6: neonx8   gen()   617 MB/s
[    8.436491] raid6: neonx8   xor()   498 MB/s
[    8.512504] raid6: neonx4   gen()  1524 MB/s
[    8.588497] raid6: neonx4   xor()   992 MB/s
[    8.664491] raid6: neonx2   gen()  1421 MB/s
[    8.740497] raid6: neonx2   xor()   955 MB/s
[    8.816509] raid6: neonx1   gen()  1263 MB/s
[    8.892499] raid6: neonx1   xor()   864 MB/s
[    8.968506] raid6: int32x8  gen()   289 MB/s
[    9.044501] raid6: int32x8  xor()   189 MB/s
[    9.120517] raid6: int32x4  gen()   313 MB/s
[    9.196504] raid6: int32x4  xor()   202 MB/s
[    9.272551] raid6: int32x2  gen()   395 MB/s
[    9.348485] raid6: int32x2  xor()   198 MB/s
[    9.424542] raid6: int32x1  gen()   402 MB/s
[    9.500515] raid6: int32x1  xor()   177 MB/s
[    9.508544] raid6: using algorithm neonx4 gen() 1524 MB/s
[    9.517689] raid6: .... xor() 992 MB/s, rmw enabled
[    9.526259] raid6: using neon recovery algorithm
[    9.536364] input: NOVATEK USB Keyboard as /devices/platform/soc/21000=
00.bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.1/2-1.1:1.0/0003:0603:00F2.0004=
/input/input7
[    9.562217] xor: measuring software checksum speed
[    9.577110]    arm4regs        :  1593 MB/sec
[    9.593513]    8regs           :  1208 MB/sec
[    9.609571]    32regs          :  1244 MB/sec
[    9.624071] hid-generic 0003:0603:00F2.0004: input,hidraw3: USB HID v1=
=2E10 Keyboard [NOVATEK USB Keyboard] on usb-ci_hdrc.1-1.1/input0
[    9.626097]    neon            :  1185 MB/sec
[    9.648198] xor: using function: arm4regs (1593 MB/sec)
[    9.666511] input: NOVATEK USB Keyboard System Control as /devices/pla=
tform/soc/2100000.bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.1/2-1.1:1.1/0003=
:0603:00F2.0005/input/input8
[    9.750015] input: NOVATEK USB Keyboard Consumer Control as /devices/p=
latform/soc/2100000.bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.1/2-1.1:1.1/00=
03:0603:00F2.0005/input/input9
[    9.770915] input: NOVATEK USB Keyboard as /devices/platform/soc/21000=
00.bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.1/2-1.1:1.1/0003:0603:00F2.0005=
/input/input10
[    9.789635] Btrfs loaded, crc32c=3Dcrc32c-generic
[    9.793612] hid-generic 0003:0603:00F2.0005: input,hiddev1,hidraw4: US=
B HID v1.10 Device [NOVATEK USB Keyboard] on usb-ci_hdrc.1-1.1/input1
[   10.374769] fuse: init (API version 7.32)
[   11.133789] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   12.051134] EXT4-fs (mmcblk1p1): mounted filesystem with ordered data =
mode. Opts: (null)
[   12.476946] Not activating Mandatory Access Control as /sbin/tomoyo-in=
it does not exist.
[   13.158409] systemd[1]: systemd 247.3-3 running in system mode. (+PAM =
+AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCR=
YPT +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -ID=
N +PCRE2 default-hierarchy=3Dunified)
[   13.203924] systemd[1]: Detected architecture arm.
[   13.225835] systemd[1]: Set hostname to <sr-imx6>.
[   14.234257] systemd[1]: /lib/systemd/system/plymouth-start.service:16:=20
Unit configured to use KillMode=3Dnone. This is unsafe, as it disables sy=
stemd's process lifecycle management for the service. Please update your =
service to use a safer KillMode=3D, such as 'mixed' or 'control-group'. S=
upport for KillMode=3Dnone is deprecated and will eventually be removed.
[   14.558831] systemd[1]: Queued start job for default target Multi-User=20
System.
[   14.572103] random: systemd: uninitialized urandom read (16 bytes read=
)
[   14.588185] systemd[1]: Created slice system-getty.slice.
[   14.601129] random: systemd: uninitialized urandom read (16 bytes read=
)
[   14.605242] systemd[1]: Created slice system-modprobe.slice.
[   14.635638] random: systemd: uninitialized urandom read (16 bytes read=
)
[   14.637946] systemd[1]: Created slice system-serial\x2dgetty.slice.
[   14.666825] systemd[1]: Created slice User and Session Slice.
[   14.683163] systemd[1]: Started Forward Password Requests to Wall Dire=
ctory Watch.
[   14.703199] systemd[1]: Set up automount Arbitrary Executable File For=
mats File System Automount Point.
[   14.724195] systemd[1]: Reached target Remote File Systems.
[   14.739336] systemd[1]: Reached target Slices.
[   14.753678] systemd[1]: Reached target Swap.
[   14.768707] systemd[1]: Listening on fsck to fsckd communication Socke=
t.
[   14.785013] systemd[1]: Listening on initctl Compatibility Named Pipe.=

[   14.802361] systemd[1]: Listening on Journal Audit Socket.
[   14.818128] systemd[1]: Listening on Journal Socket (/dev/log).
[   14.834566] systemd[1]: Listening on Journal Socket.
[   14.858315] systemd[1]: Listening on udev Control Socket.
[   14.869485] systemd[1]: Listening on udev Kernel Socket.
[   14.885305] systemd[1]: Condition check resulted in Huge Pages File Sy=
stem being skipped.
[   14.890005] systemd[1]: Mounting POSIX Message Queue File System...
[   14.920409] systemd[1]: Mounting Kernel Debug File System...
[   14.937255] systemd[1]: Mounting Kernel Trace File System...
[   14.968075] systemd[1]: Starting Create list of static device nodes fo=
r the current kernel...
[   14.989890] systemd[1]: Starting Load Kernel Module configfs...
[   15.009991] systemd[1]: Starting Load Kernel Module drm...
[   15.027740] systemd[1]: Starting Load Kernel Module fuse...
[   15.057625] systemd[1]: Condition check resulted in Set Up Additional =
Binary Formats being skipped.
[   15.074570] systemd[1]: Condition check resulted in File System Check =
on Root Device being skipped.
[   15.100758] systemd[1]: Starting Journal Service...
[   15.121128] systemd[1]: Starting Load Kernel Modules...
[   15.137609] systemd[1]: Starting Remount Root and Kernel File Systems.=
=2E.
[   15.165667] systemd[1]: Starting Coldplug All udev Devices...
[   15.241804] systemd[1]: Mounted POSIX Message Queue File System.
[   15.257287] EXT4-fs (mmcblk1p1): re-mounted. Opts: (null)
[   15.268964] systemd[1]: Mounted Kernel Debug File System.
[   15.288244] systemd[1]: Mounted Kernel Trace File System.
[   15.311062] systemd[1]: Finished Create list of static device nodes fo=
r the current kernel.
[   15.339667] systemd[1]: modprobe@configfs.service: Succeeded.
[   15.341439] systemd[1]: Finished Load Kernel Module configfs.
[   15.382876] systemd[1]: modprobe@drm.service: Succeeded.
[   15.388810] systemd[1]: Finished Load Kernel Module drm.
[   15.423479] systemd[1]: modprobe@fuse.service: Succeeded.
[   15.428984] systemd[1]: Finished Load Kernel Module fuse.
[   15.463499] systemd[1]: Finished Load Kernel Modules.
[   15.488049] systemd[1]: Finished Remount Root and Kernel File Systems.=

[   15.523187] systemd[1]: Mounting FUSE Control File System...
[   15.550327] systemd[1]: Mounting Kernel Configuration File System...
[   15.590940] systemd[1]: Condition check resulted in Rebuild Hardware D=
atabase being skipped.
[   15.612943] systemd[1]: Condition check resulted in Platform Persisten=
t Storage Archival being skipped.
[   15.641820] systemd[1]: Starting Load/Save Random Seed...
[   15.661236] systemd[1]: Starting Apply Kernel Variables...
[   15.689673] systemd[1]: Starting Create System Users...
[   15.738292] systemd[1]: Mounted FUSE Control File System.
[   15.763533] systemd[1]: Started Journal Service.
[   15.904649] systemd-journald[395]: Received client request to flush ru=
ntime journal.
[   17.043848] audit: type=3D1400 audit(1618656589.188:2): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/bin/=
man" pid=3D420 comm=3D"apparmor_parser"
[   17.117469] audit: type=3D1400 audit(1618656589.188:3): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_filte=
r" pid=3D420 comm=3D"apparmor_parser"
[   17.138988] audit: type=3D1400 audit(1618656589.188:4): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_groff=
" pid=3D420 comm=3D"apparmor_parser"
[   17.161675] audit: type=3D1400 audit(1618656589.256:5): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoffi=
ce-xpdfimport" pid=3D422 comm=3D"apparmor_parser"
[   17.182132] audit: type=3D1400 audit(1618656589.284:6): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/=
arm-linux-gnueabihf/lightdm/lightdm-guest-session" pid=3D419 comm=3D"appa=
rmor_parser"
[   17.206238] audit: type=3D1400 audit(1618656589.284:7): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/=
arm-linux-gnueabihf/lightdm/lightdm-guest-session//chromium" pid=3D419 co=
mm=3D"apparmor_parser"
[   17.287428] audit: type=3D1400 audit(1618656589.428:8): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/sbin=
/haveged" pid=3D423 comm=3D"apparmor_parser"
[   17.313472] audit: type=3D1400 audit(1618656589.456:9): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_mo=
dprobe" pid=3D424 comm=3D"apparmor_parser"
[   17.334526] audit: type=3D1400 audit(1618656589.456:10): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_m=
odprobe//kmod" pid=3D424 comm=3D"apparmor_parser"
[   17.378671] audit: type=3D1400 audit(1618656589.524:11): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"libreoff=
ice-senddoc" pid=3D426 comm=3D"apparmor_parser"
[   17.978239] rc rc0: two consecutive events of type space
[   18.144563] random: crng init done
[   18.151769] random: 7 urandom warning(s) missed due to ratelimiting
[   22.473067] BTRFS: device label ssd devid 1 transid 33605 /dev/sda sca=
nned by systemd-udevd (439)
[   24.701928] Qualcomm Atheros AR8035 2188000.ethernet-1:00: attached PH=
Y driver [Qualcomm Atheros AR8035] (mii_bus:phy_addr=3D2188000.ethernet-1=
:00, irq=3DPOLL)
[   25.565625] platform sound-sgtl5000: deferred probe pending
[   28.828948] fec 2188000.ethernet eth0: Link is Up - 1Gbps/Full - flow =
control rx/tx
[   28.836800] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   35.804617] brcm_reg: disabling

--------------843B4875BDEA8D868F23342F
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv

--------------843B4875BDEA8D868F23342F--
