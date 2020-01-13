Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413F714169B
	for <lists+etnaviv@lfdr.de>; Sat, 18 Jan 2020 09:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6DC6F9D4;
	Sat, 18 Jan 2020 08:44:48 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A67C6E091
 for <etnaviv@lists.freedesktop.org>; Mon, 13 Jan 2020 13:03:50 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 18so8116239oin.9
 for <etnaviv@lists.freedesktop.org>; Mon, 13 Jan 2020 05:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5G9FdmtNV2iHYlapoGJEh5ka9SJZPJcIXR6DVDNe+No=;
 b=U1ttkbMOg5D/i6N6bwbR5Qb6/bhw0nr1UOsI6bsb6DdGaHAZ3dnTbQaBG7gkjqVgR0
 kHvu4CUEpUUQ7GbW/jDNr6jD/cFepjhA/fl2Zsv2EPXpIxXUL9+9fMiXVd61X0VDRnLd
 AuoGXf7rydznCTB5Kv6zyQuT/cOe/E/YBCnqKs1o7v5Cmtv21+PGyfPXcGuLFH8Jtq2I
 bUZbQEly0aIY95wdl/I7Lmj5yclubmUklmBBF1N3wfH3dag8zvv8S6KA1bnWKHkZbPaT
 CoakpHjrf+wFk1m55gB91BLSeflGUM2o7AtGlskQfzCHoCtg4XYMRFSjapl7O1idvyYI
 JQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5G9FdmtNV2iHYlapoGJEh5ka9SJZPJcIXR6DVDNe+No=;
 b=SygJOFOKPxSV2muX/kRpiL5Tf1d6CjkS3aGvhTfj8oBCGeer6dejldGcLg/XlVFAmi
 /uGzDthDjvnDFmWUjYTaOOERGaDP4ZhmhSXyImm8+KkxhhB2koB5xwVcN1MbkBr9Bl4l
 QclWf99bLQA5NVLHzhhS+k5Roo37Jvy6y4iLXXMnXj6itx7a81ww6L+nAqNrPmOhYY/0
 pvoXEa4YQvsqbcLNP/eFsTEY/fTDp1G8jJt1jupifPFtlUvkzjeddDztaZdTb6puexhJ
 H4iEAbypOW4q0i32jhjG+EiAAlk0Xx/aJqlaMBuOqoMFTo5cDwL9Jf7h0qHMkogPgSma
 ei4w==
X-Gm-Message-State: APjAAAVqkUQnK3n9ZVzgzi9mVr3HIOfC/cLOf7958Y/Vzkv1r/u0I9Qn
 ElggmYeFFpiX+M9eNSjQMYgUulRw32y08kwzJ4XG9bdT
X-Google-Smtp-Source: APXvYqx3/rey0BekYCgubxnOzV9AGWwTkn2XzHy62jH62hHk2g3SAn3k0GUqH3c93x9RcB8LmTHhm8GxC5gRCN+60jA=
X-Received: by 2002:aca:ef82:: with SMTP id n124mr12904345oih.88.1578920628636; 
 Mon, 13 Jan 2020 05:03:48 -0800 (PST)
MIME-Version: 1.0
From: Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Mon, 13 Jan 2020 16:03:28 +0300
Message-ID: <CAMWBNu7pxv0rA45fN16-P=W2N6Y3=piaQosErVDjFWNXVzHE8Q@mail.gmail.com>
Subject: etnaviv gpu driver on imx8qxp
To: etnaviv@lists.freedesktop.org
X-Mailman-Approved-At: Sat, 18 Jan 2020 08:44:47 +0000
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
Content-Type: multipart/mixed; boundary="===============0646911179=="
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

--===============0646911179==
Content-Type: multipart/alternative; boundary="00000000000032d280059c051b85"

--00000000000032d280059c051b85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I want to run mesa framework on the imx8qxp with etnaviv gpu driver.  I am
using kernel 5.4.0_8dxlphantom_er version from
https://source.codeaurora.org/external/imx/linux-imx and enable DRM_ETNAVIV
as a module. I compiled
mesa 19.3.1
x11
xf86-video-armada
libdrm-armada with buildroot.
When I want to run glmark2,it crash.

xinit /usr/bin/glmark2 it can not load etnaviv driver.

You can find detailed log

What is the reason why it can not load etnaviv kernel module?

cat /var/log/Xorg.0.log
X.Org X Server 1.20.6
X Protocol Version 11, Revision 0
[   628.097] Build Operating System: Linux 5.0.0-37-generic x86_64
[   628.097] Current Operating System: Linux buildroot 5.4.0 #1 SMP PREEMPT
Mon Jan 13 15:03:39 +03 2
020 aarch64
[   628.097] Kernel command line: console=3DttyLP0,115200 earlycon
root=3D/dev/mmcblk1p2 rootwait rw
[   628.097] Build Date: 13 January 2020  01:33:57PM
[   628.097]
[   628.097] Current version of pixman: 0.38.4
[   628.097]    Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
[   628.098] Markers: (--) probed, (**) from config file, (=3D=3D) default
setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[   628.098] (=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Sun Dec 15
10:57:31 2019
[   628.098] (=3D=3D) Using config file: "/etc/X11/xorg.conf"
[   628.098] (=3D=3D) Using system config directory "/usr/share/X11/xorg.co=
nf.d"
[   628.099] (=3D=3D) No Layout section.  Using the first Screen section.
[   628.099] (=3D=3D) No screen section available. Using defaults.
[   628.099] (**) |-->Screen "Default Screen Section" (0)
[   628.099] (**) |   |-->Monitor "<default monitor>"
[   628.100] (=3D=3D) No device specified for screen "Default Screen Sectio=
n".
        Using the first device section listed.
[   628.100] (**) |   |-->Device "Driver0"
[   628.100] (=3D=3D) No monitor specified for screen "Default Screen Secti=
on".
        Using a default monitor configuration.
[   628.100] (=3D=3D) Automatically adding devices
[   628.101] (=3D=3D) Automatically enabling devices
[   628.101] (=3D=3D) Automatically adding GPU devices
[   628.101] (=3D=3D) Max clients allowed: 256, resource mask: 0x1fffff
[   628.101] (WW) The directory "/usr/share/fonts/X11//TTF/" does not exist=
.
[   628.101]    Entry deleted from font path.
[   628.101] (WW) The directory "/usr/share/fonts/X11//OTF/" does not exist=
.
[   628.101]    Entry deleted from font path.
[   628.101] (WW) The directory "/usr/share/fonts/X11//Type1/" does not
exist.
[   628.101]    Entry deleted from font path.
[   628.101] (WW) `fonts.dir' not found (or not valid) in
"/usr/share/fonts/X11//100dpi/".
[   628.101]    Entry deleted from font path.
[   628.101]    (Run 'mkfontdir' on "/usr/share/fonts/X11//100dpi/").
[   628.101] (WW) `fonts.dir' not found (or not valid) in
"/usr/share/fonts/X11//75dpi/".
[   628.101]    Entry deleted from font path.
[   628.101]    (Run 'mkfontdir' on "/usr/share/fonts/X11//75dpi/").
[   628.101] (=3D=3D) FontPath set to:
        /usr/share/fonts/X11//misc/
[   628.101] (=3D=3D) ModulePath set to "/usr/lib/xorg/modules"
[   628.101] (II) The server relies on udev to provide the list of input
devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
[   628.101] (II) Loader magic: 0x61ecb0
[   628.101] (II) Module ABI versions:
[   628.101]    X.Org ANSI C Emulation: 0.4
[   628.101]    X.Org Video Driver: 24.0
[   628.101]    X.Org XInput driver : 24.1
[   628.101]    X.Org Server Extension : 10.0
[   628.104] (--) using VT number 2

[   628.104] (II) systemd-logind: logind integration requires -keeptty and
-keeptty was not provided,
 disabling logind integration
[   628.107] (II) xfree86: Adding drm device (/dev/dri/card0)
[   628.119] (II) no primary bus or device found
[   628.119]    falling back to
/sys/devices/platform/display-subsystem/drm/card0
[   628.120] (II) LoadModule: "glx"
[   628.121] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[   628.126] (II) Module glx: vendor=3D"X.Org Foundation"
[   628.126]    compiled for 1.20.6, module version =3D 1.0.0
[   628.126]    ABI class: X.Org Server Extension, version 10.0
[   628.126] (II) LoadModule: "armada"
[   628.127] (II) Loading /usr/lib/xorg/modules/drivers/armada_drv.so
[   628.128] (II) Module armada: vendor=3D"X.Org Foundation"
[   628.128]    compiled for 1.20.6, module version =3D 0.0.0
[   628.128]    Module class: X.Org Video Driver
[   628.128]    ABI class: X.Org Video Driver, version 24.0
[   628.129] (II) armada: Support for Marvell LCD Controller: 88AP510
[   628.129] (II) armada: Support for Freescale IPU: i.MX6
[   628.141] (II) armada(0): Added screen for KMS device /dev/dri/card0
[   628.142] (II) armada(0): hardware: imx-drm
[   628.142] (II) armada(0): Creating default Display subsection in Screen
section
        "Default Screen Section" for depth/fbbpp 24/32
[   628.142] (=3D=3D) armada(0): Depth 24, (--) framebuffer bpp 32
[   628.142] (=3D=3D) armada(0): RGB weight 888
[   628.142] (=3D=3D) armada(0): Default visual is TrueColor
[   628.142] (**) armada(0): Option "XvAccel" "TRUE"
[   628.142] (**) armada(0): Option "XvPreferOverlay" "TRUE"
[   628.142] (**) armada(0): Option "UseGPU" "TRUE"
[   628.142] (II) Loading sub module "etnadrm_gpu"
[   628.142] (II) LoadModule: "etnadrm_gpu"
[   628.143] (II) Loading /usr/lib/xorg/modules/drivers/etnadrm_gpu.so
[   628.143] (II) Module Etnaviv GPU driver (DRM): vendor=3D"X.Org Foundati=
on"
[   628.143]    compiled for 1.20.6, module version =3D 0.0.0
[   628.143]    ABI class: X.Org ANSI C Emulation, version 0.4
[   628.144] (II) UnloadModule: "Etnaviv GPU driver (DRM)"
[   628.145] (II) Unloading Etnaviv GPU driver (DRM)
[   628.145] (EE) armada: Failed to load module "etnadrm_gpu"
(module-specific error, 0)
[   628.302] (II) armada(0): Output HDMI1 has no monitor section
[   628.461] (II) armada(0): Output HDMI2 has no monitor section
[   628.617] (II) armada(0): EDID for output HDMI1
[   628.617] (II) armada(0): Manufacturer: DDI  Model: f03  Serial#: 0
[   628.617] (II) armada(0): Year: 2013  Week: 31
[   628.617] (II) armada(0): EDID Version: 1.3
[   628.617] (II) armada(0): Digital Display Input
[   628.617] (II) armada(0): Max Image Size [cm]: horiz.: 30  vert.: 23
[   628.617] (II) armada(0): Gamma: 2.20
[   628.617] (II) armada(0): DPMS capabilities: Off
[   628.617] (II) armada(0): Supported color encodings: RGB 4:4:4 YCrCb
4:4:4 YCrCb 4:2:2
[   628.617] (II) armada(0): Default color space is primary color space
[   628.617] (II) armada(0): First detailed timing is preferred mode
[   628.617] (II) armada(0): redX: 0.640 redY: 0.330   greenX: 0.300
greenY: 0.600
[   628.617] (II) armada(0): blueX: 0.150 blueY: 0.060   whiteX: 0.312
whiteY: 0.329
[   628.617] (II) armada(0): Supported established timings:
[   628.617] (II) armada(0): 640x480@60Hz
[   628.617] (II) armada(0): 640x480@67Hz
[   628.617] (II) armada(0): 800x600@56Hz
[   628.618] (II) armada(0): 800x600@60Hz
[   628.618] (II) armada(0): 1024x768@60Hz
[   628.618] (II) armada(0): Manufacturer's mask: 0
[   628.618] (II) armada(0): Supported standard timings:
[   628.618] (II) armada(0): #0: hsize: 1152  vsize 864  refresh: 60  vid:
16497
[   628.618] (II) armada(0): #1: hsize: 1280  vsize 800  refresh: 60  vid:
129
[   628.618] (II) armada(0): #2: hsize: 1280  vsize 960  refresh: 60  vid:
16513
[   628.618] (II) armada(0): #3: hsize: 1280  vsize 1024  refresh: 60  vid:
32897
[   628.618] (II) armada(0): #4: hsize: 1440  vsize 900  refresh: 60  vid:
149
[   628.618] (II) armada(0): #5: hsize: 1600  vsize 1200  refresh: 60  vid:
16553
[   628.618] (II) armada(0): #6: hsize: 1680  vsize 1050  refresh: 60  vid:
179
[   628.618] (II) armada(0): #7: hsize: 1360  vsize 765  refresh: 60  vid:
49291
[   628.618] (II) armada(0): Supported detailed timing:
[   628.618] (II) armada(0): clock: 56.0 MHz   Image Size:  300 x 230 mm
[   628.618] (II) armada(0): h_active: 1024  h_sync: 1072  h_sync_end 1104
h_blank_end 1184 h_border:
 0
[   628.618] (II) armada(0): v_active: 768  v_sync: 771  v_sync_end 775
v_blanking: 790 v_border: 0
[   628.618] (II) armada(0): Supported detailed timing:
[   628.618] (II) armada(0): clock: 154.0 MHz   Image Size:  300 x 230 mm
[   628.619] (II) armada(0): h_active: 1920  h_sync: 1968  h_sync_end 2000
h_blank_end 2080 h_border:
 0
[   628.619] (II) armada(0): v_active: 1200  v_sync: 1203  v_sync_end 1209
v_blanking: 1235 v_border:
 0
[   628.619] (II) armada(0): Ranges: V min: 49 V max: 154 Hz, H min: 15 H
max: 95 kHz, PixClock max 1
65 MHz
[   628.619] (II) armada(0): Monitor name: PMEco XGA
[   628.619] (II) armada(0): Number of EDID sections to follow: 1
[   628.619] (II) armada(0): EDID (in hex):
[   628.619] (II) armada(0):    00ffffffffffff001089030f00000000
[   628.619] (II) armada(0):    1f170103801e17783eee91a3544c9926
[   628.619] (II) armada(0):    0f505433080071408100814081809500
[   628.619] (II) armada(0):    a940b3008bc0e01500a0400016303020
[   628.619] (II) armada(0):    34002ce61000001a283c80a070b02340
[   628.619] (II) armada(0):    302036002ce61000001a000000fd0031
[   628.619] (II) armada(0):    9a0f5f10000a202020202020000000fc
[   628.619] (II) armada(0):    00504d45636f205847410a2020200108
[   628.619] (II) armada(0):    02031af04f101f212204130203060711
[   628.620] (II) armada(0):    1215160165030c001000000000000000
[   628.620] (II) armada(0):    00000000000000000000000000000000
[   628.620] (II) armada(0):    00000000000000000000000000000000
[   628.620] (II) armada(0):    00000000000000000000000000000000
[   628.620] (II) armada(0):    00000000000000000000000000000000
[   628.621] (II) armada(0):    00000000000000000000000000000000
[   628.621] (II) armada(0):    00000000000000000000000000000034
[   628.621] (II) armada(0): Printing probed modes for output HDMI1
[   628.621] (II) armada(0): Modeline "1024x768"x59.9   56.00  1024 1072
1104 1184  768 771 775 790 +
hsync -vsync (47.3 kHz eP)
[   628.621] (II) armada(0): Modeline "1920x1080"x60.0  148.50  1920 2008
2052 2200  1080 1084 1089 1
125 +hsync +vsync (67.5 kHz e)
[   628.621] (II) armada(0): Modeline "1920x1080"x50.0  148.50  1920 2448
2492 2640  1080 1084 1089 1
125 +hsync +vsync (56.2 kHz e)
[   628.621] (II) armada(0): Modeline "1920x1080"x59.9  148.35  1920 2008
2052 2200  1080 1084 1089 1
125 +hsync +vsync (67.4 kHz e)
[   628.621] (II) armada(0): Modeline "1920x1080"x30.0   74.25  1920 2008
2052 2200  1080 1084 1089 1
125 +hsync +vsync (33.8 kHz e)
[   628.621] (II) armada(0): Modeline "1920x1080"x25.0   74.25  1920 2448
2492 2640  1080 1084 1089 1
125 +hsync +vsync (28.1 kHz e)
[   628.621] (II) armada(0): Modeline "1920x1080"x30.0   74.18  1920 2008
2052 2200  1080 1084 1089 1
125 +hsync +vsync (33.7 kHz e)
[   628.621] (II) armada(0): Modeline "1680x1050"x59.9  119.00  1680 1728
1760 1840  1050 1053 1059 1
080 +hsync -vsync (64.7 kHz e)
[   628.621] (II) armada(0): Modeline "1440x900"x59.9   88.75  1440 1488
1520 1600  900 903 909 926 +
hsync -vsync (55.5 kHz e)
[   628.621] (II) armada(0): Modeline "1280x960"x60.0  108.00  1280 1376
1488 1800  960 961 964 1000
+hsync +vsync (60.0 kHz e)
[   628.621] (II) armada(0): Modeline "1360x768"x59.9   84.96  1366 1431
1567 1776  768 771 781 798 -
hsync +vsync (47.8 kHz)
[   628.621] (II) armada(0): Modeline "1280x800"x59.9   71.00  1280 1328
1360 1440  800 803 809 823 +
hsync -vsync (49.3 kHz e)
[   628.621] (II) armada(0): Modeline "1152x864"x60.0   81.58  1152 1216
1336 1520  864 865 868 895 -
hsync +vsync (53.7 kHz)
[   628.621] (II) armada(0): Modeline "1280x720"x60.0   74.25  1280 1390
1430 1650  720 725 730 750 +
hsync +vsync (45.0 kHz e)
[   628.622] (II) armada(0): Modeline "1280x720"x50.0   74.25  1280 1720
1760 1980  720 725 730 750 +
hsync +vsync (37.5 kHz e)
[   628.622] (II) armada(0): Modeline "1280x720"x59.9   74.18  1280 1390
1430 1650  720 725 730 750 +
hsync +vsync (45.0 kHz e)
[   628.622] (II) armada(0): Modeline "1024x768"x60.0   65.00  1024 1048
1184 1344  768 771 777 806 -
hsync -vsync (48.4 kHz e)
[   628.622] (II) armada(0): Modeline "800x600"x60.3   40.00  800 840 968
1056  600 601 605 628 +hsyn
c +vsync (37.9 kHz e)
[   628.622] (II) armada(0): Modeline "800x600"x56.2   36.00  800 824 896
1024  600 601 603 625 +hsyn
c +vsync (35.2 kHz e)
[   628.622] (II) armada(0): Modeline "720x576"x50.0   27.00  720 732 796
864  576 581 586 625 -hsync
 -vsync (31.2 kHz e)
[   628.622] (II) armada(0): Modeline "720x480"x60.0   27.03  720 736 798
858  480 489 495 525 -hsync
 -vsync (31.5 kHz e)
[   628.622] (II) armada(0): Modeline "720x480"x59.9   27.00  720 736 798
858  480 489 495 525 -hsync
 -vsync (31.5 kHz e)
[   628.622] (II) armada(0): Modeline "640x480"x66.7   30.24  640 704 768
864  480 483 486 525 -hsync
 -vsync (35.0 kHz e)
[   628.622] (II) armada(0): Modeline "640x480"x60.0   25.20  640 656 752
800  480 490 492 525 -hsync
 -vsync (31.5 kHz e)
[   628.622] (II) armada(0): Modeline "640x480"x59.9   25.18  640 656 752
800  480 490 492 525 -hsync
 -vsync (31.5 kHz e)
[   628.779] (II) armada(0): EDID for output HDMI2
[   628.779] (II) armada(0): Manufacturer: DDI  Model: f03  Serial#: 0
[   628.779] (II) armada(0): Year: 2013  Week: 31
[   628.779] (II) armada(0): EDID Version: 1.3
[   628.780] (II) armada(0): Digital Display Input
[   628.780] (II) armada(0): Max Image Size [cm]: horiz.: 30  vert.: 23
[   628.780] (II) armada(0): Gamma: 2.20
[   628.780] (II) armada(0): DPMS capabilities: Off
[   628.780] (II) armada(0): Supported color encodings: RGB 4:4:4 YCrCb
4:4:4 YCrCb 4:2:2
[   628.780] (II) armada(0): Default color space is primary color space
[   628.780] (II) armada(0): First detailed timing is preferred mode
[   628.780] (II) armada(0): redX: 0.640 redY: 0.330   greenX: 0.300
greenY: 0.600
[   628.780] (II) armada(0): blueX: 0.150 blueY: 0.060   whiteX: 0.312
whiteY: 0.329
[   628.780] (II) armada(0): Supported established timings:
[   628.780] (II) armada(0): 640x480@60Hz
[   628.780] (II) armada(0): 640x480@67Hz
[   628.780] (II) armada(0): 800x600@56Hz
[   628.780] (II) armada(0): 800x600@60Hz
[   628.780] (II) armada(0): 1024x768@60Hz
[   628.780] (II) armada(0): Manufacturer's mask: 0
[   628.781] (II) armada(0): Supported standard timings:
[   628.781] (II) armada(0): #0: hsize: 1152  vsize 864  refresh: 60  vid:
16497
[   628.781] (II) armada(0): #1: hsize: 1280  vsize 800  refresh: 60  vid:
129
[   628.781] (II) armada(0): #2: hsize: 1280  vsize 960  refresh: 60  vid:
16513
[   628.781] (II) armada(0): #3: hsize: 1280  vsize 1024  refresh: 60  vid:
32897
[   628.781] (II) armada(0): #4: hsize: 1440  vsize 900  refresh: 60  vid:
149
[   628.781] (II) armada(0): #5: hsize: 1600  vsize 1200  refresh: 60  vid:
16553
[   628.781] (II) armada(0): #6: hsize: 1680  vsize 1050  refresh: 60  vid:
179
[   628.781] (II) armada(0): #7: hsize: 1360  vsize 765  refresh: 60  vid:
49291
[   628.781] (II) armada(0): Supported detailed timing:
[   628.781] (II) armada(0): clock: 56.0 MHz   Image Size:  300 x 230 mm
[   628.781] (II) armada(0): h_active: 1024  h_sync: 1072  h_sync_end 1104
h_blank_end 1184 h_border:
 0
[   628.781] (II) armada(0): v_active: 768  v_sync: 771  v_sync_end 775
v_blanking: 790 v_border: 0
[   628.781] (II) armada(0): Supported detailed timing:
[   628.781] (II) armada(0): clock: 154.0 MHz   Image Size:  300 x 230 mm
[   628.781] (II) armada(0): h_active: 1920  h_sync: 1968  h_sync_end 2000
h_blank_end 2080 h_border:
 0
[   628.781] (II) armada(0): v_active: 1200  v_sync: 1203  v_sync_end 1209
v_blanking: 1235 v_border:
 0
[   628.781] (II) armada(0): Ranges: V min: 49 V max: 154 Hz, H min: 15 H
max: 95 kHz, PixClock max 1
65 MHz
[   628.782] (II) armada(0): Monitor name: PMEco XGA
[   628.782] (II) armada(0): Number of EDID sections to follow: 1
[   628.782] (II) armada(0): EDID (in hex):
[   628.782] (II) armada(0):    00ffffffffffff001089030f00000000
[   628.782] (II) armada(0):    1f170103801e17783eee91a3544c9926
[   628.782] (II) armada(0):    0f505433080071408100814081809500
[   628.782] (II) armada(0):    a940b3008bc0e01500a0400016303020
[   628.782] (II) armada(0):    34002ce61000001a283c80a070b02340
[   628.782] (II) armada(0):    302036002ce61000001a000000fd0031
[   628.782] (II) armada(0):    9a0f5f10000a202020202020000000fc
[   628.782] (II) armada(0):    00504d45636f205847410a2020200108
[   628.782] (II) armada(0):    02031af04f101f212204130203060711
[   628.782] (II) armada(0):    1215160165030c001000000000000000
[   628.782] (II) armada(0):    00000000000000000000000000000000
[   628.782] (II) armada(0):    00000000000000000000000000000000
[   628.782] (II) armada(0):    00000000000000000000000000000000
[   628.783] (II) armada(0):    00000000000000000000000000000000
[   628.783] (II) armada(0):    00000000000000000000000000000000
[   628.783] (II) armada(0):    00000000000000000000000000000034
[   628.783] (II) armada(0): Printing probed modes for output HDMI2
[   628.783] (II) armada(0): Modeline "1024x768"x59.9   56.00  1024 1072
1104 1184  768 771 775 790 +
hsync -vsync (47.3 kHz eP)
[   628.783] (II) armada(0): Modeline "1920x1080"x60.0  148.50  1920 2008
2052 2200  1080 1084 1089 1
125 +hsync +vsync (67.5 kHz e)
[   628.783] (II) armada(0): Modeline "1920x1080"x50.0  148.50  1920 2448
2492 2640  1080 1084 1089 1
125 +hsync +vsync (56.2 kHz e)
[   628.783] (II) armada(0): Modeline "1920x1080"x59.9  148.35  1920 2008
2052 2200  1080 1084 1089 1
125 +hsync +vsync (67.4 kHz e)
[   628.783] (II) armada(0): Modeline "1920x1080"x30.0   74.25  1920 2008
2052 2200  1080 1084 1089 1
125 +hsync +vsync (33.8 kHz e)
[   628.783] (II) armada(0): Modeline "1920x1080"x25.0   74.25  1920 2448
2492 2640  1080 1084 1089 1
125 +hsync +vsync (28.1 kHz e)
[   628.783] (II) armada(0): Modeline "1920x1080"x30.0   74.18  1920 2008
2052 2200  1080 1084 1089 1
125 +hsync +vsync (33.7 kHz e)
[   628.783] (II) armada(0): Modeline "1680x1050"x59.9  119.00  1680 1728
1760 1840  1050 1053 1059 1
080 +hsync -vsync (64.7 kHz e)
[   628.783] (II) armada(0): Modeline "1440x900"x59.9   88.75  1440 1488
1520 1600  900 903 909 926 +
hsync -vsync (55.5 kHz e)
[   628.783] (II) armada(0): Modeline "1280x960"x60.0  108.00  1280 1376
1488 1800  960 961 964 1000
+hsync +vsync (60.0 kHz e)
[   628.784] (II) armada(0): Modeline "1360x768"x59.9   84.96  1366 1431
1567 1776  768 771 781 798 -
hsync +vsync (47.8 kHz)
[   628.784] (II) armada(0): Modeline "1280x800"x59.9   71.00  1280 1328
1360 1440  800 803 809 823 +
hsync -vsync (49.3 kHz e)
[   628.784] (II) armada(0): Modeline "1152x864"x60.0   81.58  1152 1216
1336 1520  864 865 868 895 -
hsync +vsync (53.7 kHz)
[   628.784] (II) armada(0): Modeline "1280x720"x60.0   74.25  1280 1390
1430 1650  720 725 730 750 +
hsync +vsync (45.0 kHz e)
[   628.784] (II) armada(0): Modeline "1280x720"x50.0   74.25  1280 1720
1760 1980  720 725 730 750 +
hsync +vsync (37.5 kHz e)
[   628.784] (II) armada(0): Modeline "1280x720"x59.9   74.18  1280 1390
1430 1650  720 725 730 750 +
hsync +vsync (45.0 kHz e)
[   628.784] (II) armada(0): Modeline "1024x768"x60.0   65.00  1024 1048
1184 1344  768 771 777 806 -
hsync -vsync (48.4 kHz e)
[   628.784] (II) armada(0): Modeline "800x600"x60.3   40.00  800 840 968
1056  600 601 605 628 +hsyn
c +vsync (37.9 kHz e)
[   628.784] (II) armada(0): Modeline "800x600"x56.2   36.00  800 824 896
1024  600 601 603 625 +hsyn
c +vsync (35.2 kHz e)
[   628.784] (II) armada(0): Modeline "720x576"x50.0   27.00  720 732 796
864  576 581 586 625 -hsync
 -vsync (31.2 kHz e)
[   628.784] (II) armada(0): Modeline "720x480"x60.0   27.03  720 736 798
858  480 489 495 525 -hsync
 -vsync (31.5 kHz e)
[   628.784] (II) armada(0): Modeline "720x480"x59.9   27.00  720 736 798
858  480 489 495 525 -hsync
 -vsync (31.5 kHz e)
[   628.784] (II) armada(0): Modeline "640x480"x66.7   30.24  640 704 768
864  480 483 486 525 -hsync
 -vsync (35.0 kHz e)
[   628.784] (II) armada(0): Modeline "640x480"x60.0   25.20  640 656 752
800  480 490 492 525 -hsync
 -vsync (31.5 kHz e)
[   628.784] (II) armada(0): Modeline "640x480"x59.9   25.18  640 656 752
800  480 490 492 525 -hsync
 -vsync (31.5 kHz e)
[   628.785] (II) armada(0): Output HDMI1 connected
[   628.785] (II) armada(0): Output HDMI2 connected
[   628.785] (II) armada(0): Using spanning desktop for initial modes
[   628.785] (II) armada(0): Output HDMI1 using initial mode 1024x768 +0+0
[   628.785] (II) armada(0): Output HDMI2 using initial mode 1024x768
+1024+0
[   628.785] (=3D=3D) armada(0): Using gamma correction (1.0, 1.0, 1.0)
[   628.785] (=3D=3D) armada(0): DPI set to (96, 96)
[   628.785] (II) Loading sub module "fb"
[   628.785] (II) LoadModule: "fb"
[   628.786] (II) Loading /usr/lib/xorg/modules/libfb.so
[   628.787] (II) Module fb: vendor=3D"X.Org Foundation"
[   628.787]    compiled for 1.20.6, module version =3D 1.0.0
[   628.787]    ABI class: X.Org ANSI C Emulation, version 0.4
[   628.793] (=3D=3D) armada(0): Backing store disabled
[   628.793] (=3D=3D) armada(0): Silken mouse enabled
[   628.837] (=3D=3D) armada(0): DPMS enabled
[   628.837] (=3D=3D) armada(0): hotplug detection enabled
[   628.904] (II) Initializing extension Generic Event Extension
[   628.904] (II) Initializing extension SHAPE
[   628.904] (II) Initializing extension MIT-SHM
[   628.904] (II) Initializing extension XInputExtension
[   628.904] (II) Initializing extension XTEST
[   628.904] (II) Initializing extension BIG-REQUESTS
[   628.904] (II) Initializing extension SYNC
[   628.904] (II) Initializing extension XKEYBOARD
[   628.904] (II) Initializing extension XC-MISC
[   628.904] (II) Initializing extension XFIXES
[   628.904] (II) Initializing extension RENDER
[   628.905] (II) Initializing extension RANDR
[   628.905] (II) Initializing extension DAMAGE
[   628.905] (II) Initializing extension DOUBLE-BUFFER
[   628.905] (II) Initializing extension RECORD
[   628.905] (II) Initializing extension DPMS
[   628.905] (II) Initializing extension Present
[   628.905] (II) Initializing extension DRI3
[   628.905] (II) Initializing extension X-Resource
[   628.905] (II) Initializing extension XVideo
[   628.905] (II) Initializing extension XVideo-MotionCompensation
[   628.905] (II) Initializing extension GLX
[   628.905] (II) AIGLX: Screen 0 is not DRI2 capable
[   628.936] (II) IGLX: Loaded and initialized swrast
[   628.936] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[   628.936] (II) Initializing extension XFree86-VidModeExtension
[   628.936] (II) Initializing extension XFree86-DGA
[   628.936] (II) Initializing extension XFree86-DRI
[   628.936] (II) Initializing extension DRI2
[   628.936] (II) armada(0): Setting screen physical size to 541 x 203
[   629.122] (II) config/udev: Adding input device fxos8700
(/dev/input/event1)
[   629.122] (II) No input driver specified, ignoring this device.
[   629.122] (II) This device may have been added with another device file.
[   629.125] (II) config/udev: Adding input device fxas2100x
(/dev/input/event2)
[   629.125] (II) No input driver specified, ignoring this device.
[   629.125] (II) This device may have been added with another device file.
[   629.128] (II) config/udev: Adding input device sc-powerkey
(/dev/input/event0)
[   629.129] (**) sc-powerkey: Applying InputClass "evdev keyboard catchall=
"
[   629.129] (II) LoadModule: "evdev"
[   629.129] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[   629.130] (II) Module evdev: vendor=3D"X.Org Foundation"
[   629.130]    compiled for 1.20.6, module version =3D 2.10.6
[   629.130]    Module class: X.Org XInput Driver
[   629.130]    ABI class: X.Org XInput driver, version 24.1
[   629.130] (II) Using input driver 'evdev' for 'sc-powerkey'
[   629.130] (**) sc-powerkey: always reports core events
[   629.131] (**) evdev: sc-powerkey: Device: "/dev/input/event0"
[   629.131] (--) evdev: sc-powerkey: Vendor 0 Product 0
[   629.131] (--) evdev: sc-powerkey: Found keys
[   629.131] (II) evdev: sc-powerkey: Configuring as keyboard
[   629.131] (**) Option "config_info"
"udev:/sys/devices/platform/sc-powerkey/input/input0/event0"
[   629.131] (II) XINPUT: Adding extended input device "sc-powerkey" (type:
KEYBOARD, id 6)
[   629.131] (**) Option "xkb_rules" "evdev"
[   629.135] (II) config/udev: Adding input device mpl3115
(/dev/input/event3)
[   629.136] (II) No input driver specified, ignoring this device.
[   629.136] (II) This device may have been added with another device file.
[   629.137] (II) config/udev: Adding input device isl29023 light sensor
(/dev/input/event4)
[   629.137] (II) No input driver specified, ignoring this device.
[   629.137] (II) This device may have been added with another device file.
[   630.024] (II) evdev: sc-powerkey: Close
[   630.024] (II) UnloadModule: "evdev"
[   630.072] (II) Server terminated successfully (0). Closing log file.

--=20
Refik Tuzakl=C4=B1

--00000000000032d280059c051b85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I want to run mesa fr=
amework on the imx8qxp with etnaviv gpu driver.=C2=A0 I am using kernel 5.4=
.0_8dxlphantom_er version from <a href=3D"https://source.codeaurora.org/ext=
ernal/imx/linux-imx">https://source.codeaurora.org/external/imx/linux-imx</=
a> and enable DRM_ETNAVIV as a module. I compiled</div><div>mesa 19.3.1</di=
v><div>x11</div><div>xf86-video-armada</div><div>libdrm-armada with buildro=
ot.</div><div>When I want to run glmark2,it crash.</div><div><br></div><div=
>xinit /usr/bin/glmark2 it can not load etnaviv driver.</div><div><br></div=
><div>You can find detailed log</div><div><br></div><div>What is the reason=
 why it can not load etnaviv kernel module?<br></div><div><br></div><div>ca=
t /var/log/Xorg.0.log</div><div>X.Org X Server 1.20.6<br>X Protocol Version=
 11, Revision 0<br>[ =C2=A0 628.097] Build Operating System: Linux 5.0.0-37=
-generic x86_64 <br>[ =C2=A0 628.097] Current Operating System: Linux build=
root 5.4.0 #1 SMP PREEMPT Mon Jan 13 15:03:39 +03 2<br>020 aarch64<br>[ =C2=
=A0 628.097] Kernel command line: console=3DttyLP0,115200 earlycon root=3D/=
dev/mmcblk1p2 rootwait rw<br>[ =C2=A0 628.097] Build Date: 13 January 2020 =
=C2=A001:33:57PM<br>[ =C2=A0 628.097] =C2=A0<br>[ =C2=A0 628.097] Current v=
ersion of pixman: 0.38.4<br>[ =C2=A0 628.097] =C2=A0 =C2=A0Before reporting=
 problems, check <a href=3D"http://wiki.x.org">http://wiki.x.org</a><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 to make sure that you have the latest version.<br>=
[ =C2=A0 628.098] Markers: (--) probed, (**) from config file, (=3D=3D) def=
ault setting,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 (++) from command line, (!!) n=
otice, (II) informational,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 (WW) warning, (EE=
) error, (NI) not implemented, (??) unknown.<br>[ =C2=A0 628.098] (=3D=3D) =
Log file: &quot;/var/log/Xorg.0.log&quot;, Time: Sun Dec 15 10:57:31 2019<b=
r>[ =C2=A0 628.098] (=3D=3D) Using config file: &quot;/etc/X11/xorg.conf&qu=
ot;<br>[ =C2=A0 628.098] (=3D=3D) Using system config directory &quot;/usr/=
share/X11/xorg.conf.d&quot;<br>[ =C2=A0 628.099] (=3D=3D) No Layout section=
.=C2=A0 Using the first Screen section.<br>[ =C2=A0 628.099] (=3D=3D) No sc=
reen section available. Using defaults.<br>[ =C2=A0 628.099] (**) |--&gt;Sc=
reen &quot;Default Screen Section&quot; (0)<br>[ =C2=A0 628.099] (**) | =C2=
=A0 |--&gt;Monitor &quot;&lt;default monitor&gt;&quot;<br>[ =C2=A0 628.100]=
 (=3D=3D) No device specified for screen &quot;Default Screen Section&quot;=
.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Using the first device section listed.<br>=
[ =C2=A0 628.100] (**) | =C2=A0 |--&gt;Device &quot;Driver0&quot;<br>[ =C2=
=A0 628.100] (=3D=3D) No monitor specified for screen &quot;Default Screen =
Section&quot;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Using a default monitor confi=
guration.<br>[ =C2=A0 628.100] (=3D=3D) Automatically adding devices<br>[ =
=C2=A0 628.101] (=3D=3D) Automatically enabling devices<br>[ =C2=A0 628.101=
] (=3D=3D) Automatically adding GPU devices<br>[ =C2=A0 628.101] (=3D=3D) M=
ax clients allowed: 256, resource mask: 0x1fffff<br>[ =C2=A0 628.101] (WW) =
The directory &quot;/usr/share/fonts/X11//TTF/&quot; does not exist.<br>[ =
=C2=A0 628.101] =C2=A0 =C2=A0Entry deleted from font path.<br>[ =C2=A0 628.=
101] (WW) The directory &quot;/usr/share/fonts/X11//OTF/&quot; does not exi=
st.<br>[ =C2=A0 628.101] =C2=A0 =C2=A0Entry deleted from font path.<br>[ =
=C2=A0 628.101] (WW) The directory &quot;/usr/share/fonts/X11//Type1/&quot;=
 does not exist.<br>[ =C2=A0 628.101] =C2=A0 =C2=A0Entry deleted from font =
path.<br>[ =C2=A0 628.101] (WW) `fonts.dir&#39; not found (or not valid) in=
 &quot;/usr/share/fonts/X11//100dpi/&quot;.<br>[ =C2=A0 628.101] =C2=A0 =C2=
=A0Entry deleted from font path.<br>[ =C2=A0 628.101] =C2=A0 =C2=A0(Run &#3=
9;mkfontdir&#39; on &quot;/usr/share/fonts/X11//100dpi/&quot;).<br>[ =C2=A0=
 628.101] (WW) `fonts.dir&#39; not found (or not valid) in &quot;/usr/share=
/fonts/X11//75dpi/&quot;.<br>[ =C2=A0 628.101] =C2=A0 =C2=A0Entry deleted f=
rom font path.<br>[ =C2=A0 628.101] =C2=A0 =C2=A0(Run &#39;mkfontdir&#39; o=
n &quot;/usr/share/fonts/X11//75dpi/&quot;).<br>[ =C2=A0 628.101] (=3D=3D) =
FontPath set to:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/share/fonts/X11//misc/=
<br>[ =C2=A0 628.101] (=3D=3D) ModulePath set to &quot;/usr/lib/xorg/module=
s&quot;<br>[ =C2=A0 628.101] (II) The server relies on udev to provide the =
list of input devices.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 If no devices become =
available, reconfigure udev or disable AutoAddDevices.<br>[ =C2=A0 628.101]=
 (II) Loader magic: 0x61ecb0<br>[ =C2=A0 628.101] (II) Module ABI versions:=
<br>[ =C2=A0 628.101] =C2=A0 =C2=A0X.Org ANSI C Emulation: 0.4<br>[ =C2=A0 =
628.101] =C2=A0 =C2=A0X.Org Video Driver: 24.0<br>[ =C2=A0 628.101] =C2=A0 =
=C2=A0X.Org XInput driver : 24.1<br>[ =C2=A0 628.101] =C2=A0 =C2=A0X.Org Se=
rver Extension : 10.0<br>[ =C2=A0 628.104] (--) using VT number 2<br><br>[ =
=C2=A0 628.104] (II) systemd-logind: logind integration requires -keeptty a=
nd -keeptty was not provided,<br>=C2=A0disabling logind integration<br>[ =
=C2=A0 628.107] (II) xfree86: Adding drm device (/dev/dri/card0)<br>[ =C2=
=A0 628.119] (II) no primary bus or device found<br>[ =C2=A0 628.119] =C2=
=A0 =C2=A0falling back to /sys/devices/platform/display-subsystem/drm/card0=
<br>[ =C2=A0 628.120] (II) LoadModule: &quot;glx&quot;<br>[ =C2=A0 628.121]=
 (II) Loading /usr/lib/xorg/modules/extensions/libglx.so<br>[ =C2=A0 628.12=
6] (II) Module glx: vendor=3D&quot;X.Org Foundation&quot;<br>[ =C2=A0 628.1=
26] =C2=A0 =C2=A0compiled for 1.20.6, module version =3D 1.0.0<br>[ =C2=A0 =
628.126] =C2=A0 =C2=A0ABI class: X.Org Server Extension, version 10.0<br>[ =
=C2=A0 628.126] (II) LoadModule: &quot;armada&quot;<br>[ =C2=A0 628.127] (I=
I) Loading /usr/lib/xorg/modules/drivers/armada_drv.so<br>[ =C2=A0 628.128]=
 (II) Module armada: vendor=3D&quot;X.Org Foundation&quot;<br>[ =C2=A0 628.=
128] =C2=A0 =C2=A0compiled for 1.20.6, module version =3D 0.0.0<br>[ =C2=A0=
 628.128] =C2=A0 =C2=A0Module class: X.Org Video Driver<br>[ =C2=A0 628.128=
] =C2=A0 =C2=A0ABI class: X.Org Video Driver, version 24.0<br>[ =C2=A0 628.=
129] (II) armada: Support for Marvell LCD Controller: 88AP510<br>[ =C2=A0 6=
28.129] (II) armada: Support for Freescale IPU: i.MX6<br>[ =C2=A0 628.141] =
(II) armada(0): Added screen for KMS device /dev/dri/card0<br>[ =C2=A0 628.=
142] (II) armada(0): hardware: imx-drm<br>[ =C2=A0 628.142] (II) armada(0):=
 Creating default Display subsection in Screen section<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Default Screen Section&quot; for depth/fbbpp 24/32<br>[ =
=C2=A0 628.142] (=3D=3D) armada(0): Depth 24, (--) framebuffer bpp 32<br>[ =
=C2=A0 628.142] (=3D=3D) armada(0): RGB weight 888<br>[ =C2=A0 628.142] (=
=3D=3D) armada(0): Default visual is TrueColor<br>[ =C2=A0 628.142] (**) ar=
mada(0): Option &quot;XvAccel&quot; &quot;TRUE&quot;<br>[ =C2=A0 628.142] (=
**) armada(0): Option &quot;XvPreferOverlay&quot; &quot;TRUE&quot;<br>[ =C2=
=A0 628.142] (**) armada(0): Option &quot;UseGPU&quot; &quot;TRUE&quot;<br>=
[ =C2=A0 628.142] (II) Loading sub module &quot;etnadrm_gpu&quot;<br>[ =C2=
=A0 628.142] (II) LoadModule: &quot;etnadrm_gpu&quot;<br>[ =C2=A0 628.143] =
(II) Loading /usr/lib/xorg/modules/drivers/etnadrm_gpu.so<br>[ =C2=A0 628.1=
43] (II) Module Etnaviv GPU driver (DRM): vendor=3D&quot;X.Org Foundation&q=
uot;<br>[ =C2=A0 628.143] =C2=A0 =C2=A0compiled for 1.20.6, module version =
=3D 0.0.0<br>[ =C2=A0 628.143] =C2=A0 =C2=A0ABI class: X.Org ANSI C Emulati=
on, version 0.4<br>[ =C2=A0 628.144] (II) UnloadModule: &quot;Etnaviv GPU d=
river (DRM)&quot;<br>[ =C2=A0 628.145] (II) Unloading Etnaviv GPU driver (D=
RM)<br>[ =C2=A0 628.145] (EE) armada: Failed to load module &quot;etnadrm_g=
pu&quot; (module-specific error, 0)<br>[ =C2=A0 628.302] (II) armada(0): Ou=
tput HDMI1 has no monitor section<br>[ =C2=A0 628.461] (II) armada(0): Outp=
ut HDMI2 has no monitor section<br>[ =C2=A0 628.617] (II) armada(0): EDID f=
or output HDMI1<br>[ =C2=A0 628.617] (II) armada(0): Manufacturer: DDI =C2=
=A0Model: f03 =C2=A0Serial#: 0<br>[ =C2=A0 628.617] (II) armada(0): Year: 2=
013 =C2=A0Week: 31<br>[ =C2=A0 628.617] (II) armada(0): EDID Version: 1.3<b=
r>[ =C2=A0 628.617] (II) armada(0): Digital Display Input<br>[ =C2=A0 628.6=
17] (II) armada(0): Max Image Size [cm]: horiz.: 30 =C2=A0vert.: 23<br>[ =
=C2=A0 628.617] (II) armada(0): Gamma: 2.20<br>[ =C2=A0 628.617] (II) armad=
a(0): DPMS capabilities: Off<br>[ =C2=A0 628.617] (II) armada(0): Supported=
 color encodings: RGB 4:4:4 YCrCb 4:4:4 YCrCb 4:2:2<br>[ =C2=A0 628.617] (I=
I) armada(0): Default color space is primary color space<br>[ =C2=A0 628.61=
7] (II) armada(0): First detailed timing is preferred mode<br>[ =C2=A0 628.=
617] (II) armada(0): redX: 0.640 redY: 0.330 =C2=A0 greenX: 0.300 greenY: 0=
.600<br>[ =C2=A0 628.617] (II) armada(0): blueX: 0.150 blueY: 0.060 =C2=A0 =
whiteX: 0.312 whiteY: 0.329<br>[ =C2=A0 628.617] (II) armada(0): Supported =
established timings:<br>[ =C2=A0 628.617] (II) armada(0): 640x480@60Hz<br>[=
 =C2=A0 628.617] (II) armada(0): 640x480@67Hz<br>[ =C2=A0 628.617] (II) arm=
ada(0): 800x600@56Hz<br>[ =C2=A0 628.618] (II) armada(0): 800x600@60Hz<br>[=
 =C2=A0 628.618] (II) armada(0): 1024x768@60Hz<br>[ =C2=A0 628.618] (II) ar=
mada(0): Manufacturer&#39;s mask: 0<br>[ =C2=A0 628.618] (II) armada(0): Su=
pported standard timings:<br>[ =C2=A0 628.618] (II) armada(0): #0: hsize: 1=
152 =C2=A0vsize 864 =C2=A0refresh: 60 =C2=A0vid: 16497<br>[ =C2=A0 628.618]=
 (II) armada(0): #1: hsize: 1280 =C2=A0vsize 800 =C2=A0refresh: 60 =C2=A0vi=
d: 129<br>[ =C2=A0 628.618] (II) armada(0): #2: hsize: 1280 =C2=A0vsize 960=
 =C2=A0refresh: 60 =C2=A0vid: 16513<br>[ =C2=A0 628.618] (II) armada(0): #3=
: hsize: 1280 =C2=A0vsize 1024 =C2=A0refresh: 60 =C2=A0vid: 32897<br>[ =C2=
=A0 628.618] (II) armada(0): #4: hsize: 1440 =C2=A0vsize 900 =C2=A0refresh:=
 60 =C2=A0vid: 149<br>[ =C2=A0 628.618] (II) armada(0): #5: hsize: 1600 =C2=
=A0vsize 1200 =C2=A0refresh: 60 =C2=A0vid: 16553<br>[ =C2=A0 628.618] (II) =
armada(0): #6: hsize: 1680 =C2=A0vsize 1050 =C2=A0refresh: 60 =C2=A0vid: 17=
9<br>[ =C2=A0 628.618] (II) armada(0): #7: hsize: 1360 =C2=A0vsize 765 =C2=
=A0refresh: 60 =C2=A0vid: 49291<br>[ =C2=A0 628.618] (II) armada(0): Suppor=
ted detailed timing:<br>[ =C2=A0 628.618] (II) armada(0): clock: 56.0 MHz =
=C2=A0 Image Size: =C2=A0300 x 230 mm<br>[ =C2=A0 628.618] (II) armada(0): =
h_active: 1024 =C2=A0h_sync: 1072 =C2=A0h_sync_end 1104 h_blank_end 1184 h_=
border:<br>=C2=A00<br>[ =C2=A0 628.618] (II) armada(0): v_active: 768 =C2=
=A0v_sync: 771 =C2=A0v_sync_end 775 v_blanking: 790 v_border: 0<br>[ =C2=A0=
 628.618] (II) armada(0): Supported detailed timing:<br>[ =C2=A0 628.618] (=
II) armada(0): clock: 154.0 MHz =C2=A0 Image Size: =C2=A0300 x 230 mm<br>[ =
=C2=A0 628.619] (II) armada(0): h_active: 1920 =C2=A0h_sync: 1968 =C2=A0h_s=
ync_end 2000 h_blank_end 2080 h_border:<br>=C2=A00<br>[ =C2=A0 628.619] (II=
) armada(0): v_active: 1200 =C2=A0v_sync: 1203 =C2=A0v_sync_end 1209 v_blan=
king: 1235 v_border:<br>=C2=A00<br>[ =C2=A0 628.619] (II) armada(0): Ranges=
: V min: 49 V max: 154 Hz, H min: 15 H max: 95 kHz, PixClock max 1<br>65 MH=
z<br>[ =C2=A0 628.619] (II) armada(0): Monitor name: PMEco XGA<br>[ =C2=A0 =
628.619] (II) armada(0): Number of EDID sections to follow: 1<br>[ =C2=A0 6=
28.619] (II) armada(0): EDID (in hex):<br>[ =C2=A0 628.619] (II) armada(0):=
 =C2=A0 =C2=A000ffffffffffff001089030f00000000<br>[ =C2=A0 628.619] (II) ar=
mada(0): =C2=A0 =C2=A01f170103801e17783eee91a3544c9926<br>[ =C2=A0 628.619]=
 (II) armada(0): =C2=A0 =C2=A00f505433080071408100814081809500<br>[ =C2=A0 =
628.619] (II) armada(0): =C2=A0 =C2=A0a940b3008bc0e01500a0400016303020<br>[=
 =C2=A0 628.619] (II) armada(0): =C2=A0 =C2=A034002ce61000001a283c80a070b02=
340<br>[ =C2=A0 628.619] (II) armada(0): =C2=A0 =C2=A0302036002ce61000001a0=
00000fd0031<br>[ =C2=A0 628.619] (II) armada(0): =C2=A0 =C2=A09a0f5f10000a2=
02020202020000000fc<br>[ =C2=A0 628.619] (II) armada(0): =C2=A0 =C2=A000504=
d45636f205847410a2020200108<br>[ =C2=A0 628.619] (II) armada(0): =C2=A0 =C2=
=A002031af04f101f212204130203060711<br>[ =C2=A0 628.620] (II) armada(0): =
=C2=A0 =C2=A01215160165030c001000000000000000<br>[ =C2=A0 628.620] (II) arm=
ada(0): =C2=A0 =C2=A000000000000000000000000000000000<br>[ =C2=A0 628.620] =
(II) armada(0): =C2=A0 =C2=A000000000000000000000000000000000<br>[ =C2=A0 6=
28.620] (II) armada(0): =C2=A0 =C2=A000000000000000000000000000000000<br>[ =
=C2=A0 628.620] (II) armada(0): =C2=A0 =C2=A0000000000000000000000000000000=
00<br>[ =C2=A0 628.621] (II) armada(0): =C2=A0 =C2=A00000000000000000000000=
0000000000<br>[ =C2=A0 628.621] (II) armada(0): =C2=A0 =C2=A000000000000000=
000000000000000034<br>[ =C2=A0 628.621] (II) armada(0): Printing probed mod=
es for output HDMI1<br>[ =C2=A0 628.621] (II) armada(0): Modeline &quot;102=
4x768&quot;x59.9 =C2=A0 56.00 =C2=A01024 1072 1104 1184 =C2=A0768 771 775 7=
90 +<br>hsync -vsync (47.3 kHz eP)<br>[ =C2=A0 628.621] (II) armada(0): Mod=
eline &quot;1920x1080&quot;x60.0 =C2=A0148.50 =C2=A01920 2008 2052 2200 =C2=
=A01080 1084 1089 1<br>125 +hsync +vsync (67.5 kHz e)<br>[ =C2=A0 628.621] =
(II) armada(0): Modeline &quot;1920x1080&quot;x50.0 =C2=A0148.50 =C2=A01920=
 2448 2492 2640 =C2=A01080 1084 1089 1<br>125 +hsync +vsync (56.2 kHz e)<br=
>[ =C2=A0 628.621] (II) armada(0): Modeline &quot;1920x1080&quot;x59.9 =C2=
=A0148.35 =C2=A01920 2008 2052 2200 =C2=A01080 1084 1089 1<br>125 +hsync +v=
sync (67.4 kHz e)<br>[ =C2=A0 628.621] (II) armada(0): Modeline &quot;1920x=
1080&quot;x30.0 =C2=A0 74.25 =C2=A01920 2008 2052 2200 =C2=A01080 1084 1089=
 1<br>125 +hsync +vsync (33.8 kHz e)<br>[ =C2=A0 628.621] (II) armada(0): M=
odeline &quot;1920x1080&quot;x25.0 =C2=A0 74.25 =C2=A01920 2448 2492 2640 =
=C2=A01080 1084 1089 1<br>125 +hsync +vsync (28.1 kHz e)<br>[ =C2=A0 628.62=
1] (II) armada(0): Modeline &quot;1920x1080&quot;x30.0 =C2=A0 74.18 =C2=A01=
920 2008 2052 2200 =C2=A01080 1084 1089 1<br>125 +hsync +vsync (33.7 kHz e)=
<br>[ =C2=A0 628.621] (II) armada(0): Modeline &quot;1680x1050&quot;x59.9 =
=C2=A0119.00 =C2=A01680 1728 1760 1840 =C2=A01050 1053 1059 1<br>080 +hsync=
 -vsync (64.7 kHz e)<br>[ =C2=A0 628.621] (II) armada(0): Modeline &quot;14=
40x900&quot;x59.9 =C2=A0 88.75 =C2=A01440 1488 1520 1600 =C2=A0900 903 909 =
926 +<br>hsync -vsync (55.5 kHz e)<br>[ =C2=A0 628.621] (II) armada(0): Mod=
eline &quot;1280x960&quot;x60.0 =C2=A0108.00 =C2=A01280 1376 1488 1800 =C2=
=A0960 961 964 1000 <br>+hsync +vsync (60.0 kHz e)<br>[ =C2=A0 628.621] (II=
) armada(0): Modeline &quot;1360x768&quot;x59.9 =C2=A0 84.96 =C2=A01366 143=
1 1567 1776 =C2=A0768 771 781 798 -<br>hsync +vsync (47.8 kHz)<br>[ =C2=A0 =
628.621] (II) armada(0): Modeline &quot;1280x800&quot;x59.9 =C2=A0 71.00 =
=C2=A01280 1328 1360 1440 =C2=A0800 803 809 823 +<br>hsync -vsync (49.3 kHz=
 e)<br>[ =C2=A0 628.621] (II) armada(0): Modeline &quot;1152x864&quot;x60.0=
 =C2=A0 81.58 =C2=A01152 1216 1336 1520 =C2=A0864 865 868 895 -<br>hsync +v=
sync (53.7 kHz)<br>[ =C2=A0 628.621] (II) armada(0): Modeline &quot;1280x72=
0&quot;x60.0 =C2=A0 74.25 =C2=A01280 1390 1430 1650 =C2=A0720 725 730 750 +=
<br>hsync +vsync (45.0 kHz e)<br>[ =C2=A0 628.622] (II) armada(0): Modeline=
 &quot;1280x720&quot;x50.0 =C2=A0 74.25 =C2=A01280 1720 1760 1980 =C2=A0720=
 725 730 750 +<br>hsync +vsync (37.5 kHz e)<br>[ =C2=A0 628.622] (II) armad=
a(0): Modeline &quot;1280x720&quot;x59.9 =C2=A0 74.18 =C2=A01280 1390 1430 =
1650 =C2=A0720 725 730 750 +<br>hsync +vsync (45.0 kHz e)<br>[ =C2=A0 628.6=
22] (II) armada(0): Modeline &quot;1024x768&quot;x60.0 =C2=A0 65.00 =C2=A01=
024 1048 1184 1344 =C2=A0768 771 777 806 -<br>hsync -vsync (48.4 kHz e)<br>=
[ =C2=A0 628.622] (II) armada(0): Modeline &quot;800x600&quot;x60.3 =C2=A0 =
40.00 =C2=A0800 840 968 1056 =C2=A0600 601 605 628 +hsyn<br>c +vsync (37.9 =
kHz e)<br>[ =C2=A0 628.622] (II) armada(0): Modeline &quot;800x600&quot;x56=
.2 =C2=A0 36.00 =C2=A0800 824 896 1024 =C2=A0600 601 603 625 +hsyn<br>c +vs=
ync (35.2 kHz e)<br>[ =C2=A0 628.622] (II) armada(0): Modeline &quot;720x57=
6&quot;x50.0 =C2=A0 27.00 =C2=A0720 732 796 864 =C2=A0576 581 586 625 -hsyn=
c<br>=C2=A0-vsync (31.2 kHz e)<br>[ =C2=A0 628.622] (II) armada(0): Modelin=
e &quot;720x480&quot;x60.0 =C2=A0 27.03 =C2=A0720 736 798 858 =C2=A0480 489=
 495 525 -hsync<br>=C2=A0-vsync (31.5 kHz e)<br>[ =C2=A0 628.622] (II) arma=
da(0): Modeline &quot;720x480&quot;x59.9 =C2=A0 27.00 =C2=A0720 736 798 858=
 =C2=A0480 489 495 525 -hsync<br>=C2=A0-vsync (31.5 kHz e)<br>[ =C2=A0 628.=
622] (II) armada(0): Modeline &quot;640x480&quot;x66.7 =C2=A0 30.24 =C2=A06=
40 704 768 864 =C2=A0480 483 486 525 -hsync<br>=C2=A0-vsync (35.0 kHz e)<br=
>[ =C2=A0 628.622] (II) armada(0): Modeline &quot;640x480&quot;x60.0 =C2=A0=
 25.20 =C2=A0640 656 752 800 =C2=A0480 490 492 525 -hsync<br>=C2=A0-vsync (=
31.5 kHz e)<br>[ =C2=A0 628.622] (II) armada(0): Modeline &quot;640x480&quo=
t;x59.9 =C2=A0 25.18 =C2=A0640 656 752 800 =C2=A0480 490 492 525 -hsync<br>=
=C2=A0-vsync (31.5 kHz e)<br>[ =C2=A0 628.779] (II) armada(0): EDID for out=
put HDMI2<br>[ =C2=A0 628.779] (II) armada(0): Manufacturer: DDI =C2=A0Mode=
l: f03 =C2=A0Serial#: 0<br>[ =C2=A0 628.779] (II) armada(0): Year: 2013 =C2=
=A0Week: 31<br>[ =C2=A0 628.779] (II) armada(0): EDID Version: 1.3<br>[ =C2=
=A0 628.780] (II) armada(0): Digital Display Input<br>[ =C2=A0 628.780] (II=
) armada(0): Max Image Size [cm]: horiz.: 30 =C2=A0vert.: 23<br>[ =C2=A0 62=
8.780] (II) armada(0): Gamma: 2.20<br>[ =C2=A0 628.780] (II) armada(0): DPM=
S capabilities: Off<br>[ =C2=A0 628.780] (II) armada(0): Supported color en=
codings: RGB 4:4:4 YCrCb 4:4:4 YCrCb 4:2:2<br>[ =C2=A0 628.780] (II) armada=
(0): Default color space is primary color space<br>[ =C2=A0 628.780] (II) a=
rmada(0): First detailed timing is preferred mode<br>[ =C2=A0 628.780] (II)=
 armada(0): redX: 0.640 redY: 0.330 =C2=A0 greenX: 0.300 greenY: 0.600<br>[=
 =C2=A0 628.780] (II) armada(0): blueX: 0.150 blueY: 0.060 =C2=A0 whiteX: 0=
.312 whiteY: 0.329<br>[ =C2=A0 628.780] (II) armada(0): Supported establish=
ed timings:<br>[ =C2=A0 628.780] (II) armada(0): 640x480@60Hz<br>[ =C2=A0 6=
28.780] (II) armada(0): 640x480@67Hz<br>[ =C2=A0 628.780] (II) armada(0): 8=
00x600@56Hz<br>[ =C2=A0 628.780] (II) armada(0): 800x600@60Hz<br>[ =C2=A0 6=
28.780] (II) armada(0): 1024x768@60Hz<br>[ =C2=A0 628.780] (II) armada(0): =
Manufacturer&#39;s mask: 0<br>[ =C2=A0 628.781] (II) armada(0): Supported s=
tandard timings:<br>[ =C2=A0 628.781] (II) armada(0): #0: hsize: 1152 =C2=
=A0vsize 864 =C2=A0refresh: 60 =C2=A0vid: 16497<br>[ =C2=A0 628.781] (II) a=
rmada(0): #1: hsize: 1280 =C2=A0vsize 800 =C2=A0refresh: 60 =C2=A0vid: 129<=
br>[ =C2=A0 628.781] (II) armada(0): #2: hsize: 1280 =C2=A0vsize 960 =C2=A0=
refresh: 60 =C2=A0vid: 16513<br>[ =C2=A0 628.781] (II) armada(0): #3: hsize=
: 1280 =C2=A0vsize 1024 =C2=A0refresh: 60 =C2=A0vid: 32897<br>[ =C2=A0 628.=
781] (II) armada(0): #4: hsize: 1440 =C2=A0vsize 900 =C2=A0refresh: 60 =C2=
=A0vid: 149<br>[ =C2=A0 628.781] (II) armada(0): #5: hsize: 1600 =C2=A0vsiz=
e 1200 =C2=A0refresh: 60 =C2=A0vid: 16553<br>[ =C2=A0 628.781] (II) armada(=
0): #6: hsize: 1680 =C2=A0vsize 1050 =C2=A0refresh: 60 =C2=A0vid: 179<br>[ =
=C2=A0 628.781] (II) armada(0): #7: hsize: 1360 =C2=A0vsize 765 =C2=A0refre=
sh: 60 =C2=A0vid: 49291<br>[ =C2=A0 628.781] (II) armada(0): Supported deta=
iled timing:<br>[ =C2=A0 628.781] (II) armada(0): clock: 56.0 MHz =C2=A0 Im=
age Size: =C2=A0300 x 230 mm<br>[ =C2=A0 628.781] (II) armada(0): h_active:=
 1024 =C2=A0h_sync: 1072 =C2=A0h_sync_end 1104 h_blank_end 1184 h_border:<b=
r>=C2=A00<br>[ =C2=A0 628.781] (II) armada(0): v_active: 768 =C2=A0v_sync: =
771 =C2=A0v_sync_end 775 v_blanking: 790 v_border: 0<br>[ =C2=A0 628.781] (=
II) armada(0): Supported detailed timing:<br>[ =C2=A0 628.781] (II) armada(=
0): clock: 154.0 MHz =C2=A0 Image Size: =C2=A0300 x 230 mm<br>[ =C2=A0 628.=
781] (II) armada(0): h_active: 1920 =C2=A0h_sync: 1968 =C2=A0h_sync_end 200=
0 h_blank_end 2080 h_border:<br>=C2=A00<br>[ =C2=A0 628.781] (II) armada(0)=
: v_active: 1200 =C2=A0v_sync: 1203 =C2=A0v_sync_end 1209 v_blanking: 1235 =
v_border:<br>=C2=A00<br>[ =C2=A0 628.781] (II) armada(0): Ranges: V min: 49=
 V max: 154 Hz, H min: 15 H max: 95 kHz, PixClock max 1<br>65 MHz<br>[ =C2=
=A0 628.782] (II) armada(0): Monitor name: PMEco XGA<br>[ =C2=A0 628.782] (=
II) armada(0): Number of EDID sections to follow: 1<br>[ =C2=A0 628.782] (I=
I) armada(0): EDID (in hex):<br>[ =C2=A0 628.782] (II) armada(0): =C2=A0 =
=C2=A000ffffffffffff001089030f00000000<br>[ =C2=A0 628.782] (II) armada(0):=
 =C2=A0 =C2=A01f170103801e17783eee91a3544c9926<br>[ =C2=A0 628.782] (II) ar=
mada(0): =C2=A0 =C2=A00f505433080071408100814081809500<br>[ =C2=A0 628.782]=
 (II) armada(0): =C2=A0 =C2=A0a940b3008bc0e01500a0400016303020<br>[ =C2=A0 =
628.782] (II) armada(0): =C2=A0 =C2=A034002ce61000001a283c80a070b02340<br>[=
 =C2=A0 628.782] (II) armada(0): =C2=A0 =C2=A0302036002ce61000001a000000fd0=
031<br>[ =C2=A0 628.782] (II) armada(0): =C2=A0 =C2=A09a0f5f10000a202020202=
020000000fc<br>[ =C2=A0 628.782] (II) armada(0): =C2=A0 =C2=A000504d45636f2=
05847410a2020200108<br>[ =C2=A0 628.782] (II) armada(0): =C2=A0 =C2=A002031=
af04f101f212204130203060711<br>[ =C2=A0 628.782] (II) armada(0): =C2=A0 =C2=
=A01215160165030c001000000000000000<br>[ =C2=A0 628.782] (II) armada(0): =
=C2=A0 =C2=A000000000000000000000000000000000<br>[ =C2=A0 628.782] (II) arm=
ada(0): =C2=A0 =C2=A000000000000000000000000000000000<br>[ =C2=A0 628.782] =
(II) armada(0): =C2=A0 =C2=A000000000000000000000000000000000<br>[ =C2=A0 6=
28.783] (II) armada(0): =C2=A0 =C2=A000000000000000000000000000000000<br>[ =
=C2=A0 628.783] (II) armada(0): =C2=A0 =C2=A0000000000000000000000000000000=
00<br>[ =C2=A0 628.783] (II) armada(0): =C2=A0 =C2=A00000000000000000000000=
0000000034<br>[ =C2=A0 628.783] (II) armada(0): Printing probed modes for o=
utput HDMI2<br>[ =C2=A0 628.783] (II) armada(0): Modeline &quot;1024x768&qu=
ot;x59.9 =C2=A0 56.00 =C2=A01024 1072 1104 1184 =C2=A0768 771 775 790 +<br>=
hsync -vsync (47.3 kHz eP)<br>[ =C2=A0 628.783] (II) armada(0): Modeline &q=
uot;1920x1080&quot;x60.0 =C2=A0148.50 =C2=A01920 2008 2052 2200 =C2=A01080 =
1084 1089 1<br>125 +hsync +vsync (67.5 kHz e)<br>[ =C2=A0 628.783] (II) arm=
ada(0): Modeline &quot;1920x1080&quot;x50.0 =C2=A0148.50 =C2=A01920 2448 24=
92 2640 =C2=A01080 1084 1089 1<br>125 +hsync +vsync (56.2 kHz e)<br>[ =C2=
=A0 628.783] (II) armada(0): Modeline &quot;1920x1080&quot;x59.9 =C2=A0148.=
35 =C2=A01920 2008 2052 2200 =C2=A01080 1084 1089 1<br>125 +hsync +vsync (6=
7.4 kHz e)<br>[ =C2=A0 628.783] (II) armada(0): Modeline &quot;1920x1080&qu=
ot;x30.0 =C2=A0 74.25 =C2=A01920 2008 2052 2200 =C2=A01080 1084 1089 1<br>1=
25 +hsync +vsync (33.8 kHz e)<br>[ =C2=A0 628.783] (II) armada(0): Modeline=
 &quot;1920x1080&quot;x25.0 =C2=A0 74.25 =C2=A01920 2448 2492 2640 =C2=A010=
80 1084 1089 1<br>125 +hsync +vsync (28.1 kHz e)<br>[ =C2=A0 628.783] (II) =
armada(0): Modeline &quot;1920x1080&quot;x30.0 =C2=A0 74.18 =C2=A01920 2008=
 2052 2200 =C2=A01080 1084 1089 1<br>125 +hsync +vsync (33.7 kHz e)<br>[ =
=C2=A0 628.783] (II) armada(0): Modeline &quot;1680x1050&quot;x59.9 =C2=A01=
19.00 =C2=A01680 1728 1760 1840 =C2=A01050 1053 1059 1<br>080 +hsync -vsync=
 (64.7 kHz e)<br>[ =C2=A0 628.783] (II) armada(0): Modeline &quot;1440x900&=
quot;x59.9 =C2=A0 88.75 =C2=A01440 1488 1520 1600 =C2=A0900 903 909 926 +<b=
r>hsync -vsync (55.5 kHz e)<br>[ =C2=A0 628.783] (II) armada(0): Modeline &=
quot;1280x960&quot;x60.0 =C2=A0108.00 =C2=A01280 1376 1488 1800 =C2=A0960 9=
61 964 1000 <br>+hsync +vsync (60.0 kHz e)<br>[ =C2=A0 628.784] (II) armada=
(0): Modeline &quot;1360x768&quot;x59.9 =C2=A0 84.96 =C2=A01366 1431 1567 1=
776 =C2=A0768 771 781 798 -<br>hsync +vsync (47.8 kHz)<br>[ =C2=A0 628.784]=
 (II) armada(0): Modeline &quot;1280x800&quot;x59.9 =C2=A0 71.00 =C2=A01280=
 1328 1360 1440 =C2=A0800 803 809 823 +<br>hsync -vsync (49.3 kHz e)<br>[ =
=C2=A0 628.784] (II) armada(0): Modeline &quot;1152x864&quot;x60.0 =C2=A0 8=
1.58 =C2=A01152 1216 1336 1520 =C2=A0864 865 868 895 -<br>hsync +vsync (53.=
7 kHz)<br>[ =C2=A0 628.784] (II) armada(0): Modeline &quot;1280x720&quot;x6=
0.0 =C2=A0 74.25 =C2=A01280 1390 1430 1650 =C2=A0720 725 730 750 +<br>hsync=
 +vsync (45.0 kHz e)<br>[ =C2=A0 628.784] (II) armada(0): Modeline &quot;12=
80x720&quot;x50.0 =C2=A0 74.25 =C2=A01280 1720 1760 1980 =C2=A0720 725 730 =
750 +<br>hsync +vsync (37.5 kHz e)<br>[ =C2=A0 628.784] (II) armada(0): Mod=
eline &quot;1280x720&quot;x59.9 =C2=A0 74.18 =C2=A01280 1390 1430 1650 =C2=
=A0720 725 730 750 +<br>hsync +vsync (45.0 kHz e)<br>[ =C2=A0 628.784] (II)=
 armada(0): Modeline &quot;1024x768&quot;x60.0 =C2=A0 65.00 =C2=A01024 1048=
 1184 1344 =C2=A0768 771 777 806 -<br>hsync -vsync (48.4 kHz e)<br>[ =C2=A0=
 628.784] (II) armada(0): Modeline &quot;800x600&quot;x60.3 =C2=A0 40.00 =
=C2=A0800 840 968 1056 =C2=A0600 601 605 628 +hsyn<br>c +vsync (37.9 kHz e)=
<br>[ =C2=A0 628.784] (II) armada(0): Modeline &quot;800x600&quot;x56.2 =C2=
=A0 36.00 =C2=A0800 824 896 1024 =C2=A0600 601 603 625 +hsyn<br>c +vsync (3=
5.2 kHz e)<br>[ =C2=A0 628.784] (II) armada(0): Modeline &quot;720x576&quot=
;x50.0 =C2=A0 27.00 =C2=A0720 732 796 864 =C2=A0576 581 586 625 -hsync<br>=
=C2=A0-vsync (31.2 kHz e)<br>[ =C2=A0 628.784] (II) armada(0): Modeline &qu=
ot;720x480&quot;x60.0 =C2=A0 27.03 =C2=A0720 736 798 858 =C2=A0480 489 495 =
525 -hsync<br>=C2=A0-vsync (31.5 kHz e)<br>[ =C2=A0 628.784] (II) armada(0)=
: Modeline &quot;720x480&quot;x59.9 =C2=A0 27.00 =C2=A0720 736 798 858 =C2=
=A0480 489 495 525 -hsync<br>=C2=A0-vsync (31.5 kHz e)<br>[ =C2=A0 628.784]=
 (II) armada(0): Modeline &quot;640x480&quot;x66.7 =C2=A0 30.24 =C2=A0640 7=
04 768 864 =C2=A0480 483 486 525 -hsync<br>=C2=A0-vsync (35.0 kHz e)<br>[ =
=C2=A0 628.784] (II) armada(0): Modeline &quot;640x480&quot;x60.0 =C2=A0 25=
.20 =C2=A0640 656 752 800 =C2=A0480 490 492 525 -hsync<br>=C2=A0-vsync (31.=
5 kHz e)<br>[ =C2=A0 628.784] (II) armada(0): Modeline &quot;640x480&quot;x=
59.9 =C2=A0 25.18 =C2=A0640 656 752 800 =C2=A0480 490 492 525 -hsync<br>=C2=
=A0-vsync (31.5 kHz e)<br>[ =C2=A0 628.785] (II) armada(0): Output HDMI1 co=
nnected<br>[ =C2=A0 628.785] (II) armada(0): Output HDMI2 connected<br>[ =
=C2=A0 628.785] (II) armada(0): Using spanning desktop for initial modes<br=
>[ =C2=A0 628.785] (II) armada(0): Output HDMI1 using initial mode 1024x768=
 +0+0<br>[ =C2=A0 628.785] (II) armada(0): Output HDMI2 using initial mode =
1024x768 +1024+0<br>[ =C2=A0 628.785] (=3D=3D) armada(0): Using gamma corre=
ction (1.0, 1.0, 1.0)<br>[ =C2=A0 628.785] (=3D=3D) armada(0): DPI set to (=
96, 96)<br>[ =C2=A0 628.785] (II) Loading sub module &quot;fb&quot;<br>[ =
=C2=A0 628.785] (II) LoadModule: &quot;fb&quot;<br>[ =C2=A0 628.786] (II) L=
oading /usr/lib/xorg/modules/libfb.so<br>[ =C2=A0 628.787] (II) Module fb: =
vendor=3D&quot;X.Org Foundation&quot;<br>[ =C2=A0 628.787] =C2=A0 =C2=A0com=
piled for 1.20.6, module version =3D 1.0.0<br>[ =C2=A0 628.787] =C2=A0 =C2=
=A0ABI class: X.Org ANSI C Emulation, version 0.4<br>[ =C2=A0 628.793] (=3D=
=3D) armada(0): Backing store disabled<br>[ =C2=A0 628.793] (=3D=3D) armada=
(0): Silken mouse enabled<br>[ =C2=A0 628.837] (=3D=3D) armada(0): DPMS ena=
bled<br>[ =C2=A0 628.837] (=3D=3D) armada(0): hotplug detection enabled<br>=
[ =C2=A0 628.904] (II) Initializing extension Generic Event Extension<br>[ =
=C2=A0 628.904] (II) Initializing extension SHAPE<br>[ =C2=A0 628.904] (II)=
 Initializing extension MIT-SHM<br>[ =C2=A0 628.904] (II) Initializing exte=
nsion XInputExtension<br>[ =C2=A0 628.904] (II) Initializing extension XTES=
T<br>[ =C2=A0 628.904] (II) Initializing extension BIG-REQUESTS<br>[ =C2=A0=
 628.904] (II) Initializing extension SYNC<br>[ =C2=A0 628.904] (II) Initia=
lizing extension XKEYBOARD<br>[ =C2=A0 628.904] (II) Initializing extension=
 XC-MISC<br>[ =C2=A0 628.904] (II) Initializing extension XFIXES<br>[ =C2=
=A0 628.904] (II) Initializing extension RENDER<br>[ =C2=A0 628.905] (II) I=
nitializing extension RANDR<br>[ =C2=A0 628.905] (II) Initializing extensio=
n DAMAGE<br>[ =C2=A0 628.905] (II) Initializing extension DOUBLE-BUFFER<br>=
[ =C2=A0 628.905] (II) Initializing extension RECORD<br>[ =C2=A0 628.905] (=
II) Initializing extension DPMS<br>[ =C2=A0 628.905] (II) Initializing exte=
nsion Present<br>[ =C2=A0 628.905] (II) Initializing extension DRI3<br>[ =
=C2=A0 628.905] (II) Initializing extension X-Resource<br>[ =C2=A0 628.905]=
 (II) Initializing extension XVideo<br>[ =C2=A0 628.905] (II) Initializing =
extension XVideo-MotionCompensation<br>[ =C2=A0 628.905] (II) Initializing =
extension GLX<br>[ =C2=A0 628.905] (II) AIGLX: Screen 0 is not DRI2 capable=
<br>[ =C2=A0 628.936] (II) IGLX: Loaded and initialized swrast<br>[ =C2=A0 =
628.936] (II) GLX: Initialized DRISWRAST GL provider for screen 0<br>[ =C2=
=A0 628.936] (II) Initializing extension XFree86-VidModeExtension<br>[ =C2=
=A0 628.936] (II) Initializing extension XFree86-DGA<br>[ =C2=A0 628.936] (=
II) Initializing extension XFree86-DRI<br>[ =C2=A0 628.936] (II) Initializi=
ng extension DRI2<br>[ =C2=A0 628.936] (II) armada(0): Setting screen physi=
cal size to 541 x 203<br>[ =C2=A0 629.122] (II) config/udev: Adding input d=
evice fxos8700 (/dev/input/event1)<br>[ =C2=A0 629.122] (II) No input drive=
r specified, ignoring this device.<br>[ =C2=A0 629.122] (II) This device ma=
y have been added with another device file.<br>[ =C2=A0 629.125] (II) confi=
g/udev: Adding input device fxas2100x (/dev/input/event2)<br>[ =C2=A0 629.1=
25] (II) No input driver specified, ignoring this device.<br>[ =C2=A0 629.1=
25] (II) This device may have been added with another device file.<br>[ =C2=
=A0 629.128] (II) config/udev: Adding input device sc-powerkey (/dev/input/=
event0)<br>[ =C2=A0 629.129] (**) sc-powerkey: Applying InputClass &quot;ev=
dev keyboard catchall&quot;<br>[ =C2=A0 629.129] (II) LoadModule: &quot;evd=
ev&quot;<br>[ =C2=A0 629.129] (II) Loading /usr/lib/xorg/modules/input/evde=
v_drv.so<br>[ =C2=A0 629.130] (II) Module evdev: vendor=3D&quot;X.Org Found=
ation&quot;<br>[ =C2=A0 629.130] =C2=A0 =C2=A0compiled for 1.20.6, module v=
ersion =3D 2.10.6<br>[ =C2=A0 629.130] =C2=A0 =C2=A0Module class: X.Org XIn=
put Driver<br>[ =C2=A0 629.130] =C2=A0 =C2=A0ABI class: X.Org XInput driver=
, version 24.1<br>[ =C2=A0 629.130] (II) Using input driver &#39;evdev&#39;=
 for &#39;sc-powerkey&#39;<br>[ =C2=A0 629.130] (**) sc-powerkey: always re=
ports core events<br>[ =C2=A0 629.131] (**) evdev: sc-powerkey: Device: &qu=
ot;/dev/input/event0&quot;<br>[ =C2=A0 629.131] (--) evdev: sc-powerkey: Ve=
ndor 0 Product 0<br>[ =C2=A0 629.131] (--) evdev: sc-powerkey: Found keys<b=
r>[ =C2=A0 629.131] (II) evdev: sc-powerkey: Configuring as keyboard<br>[ =
=C2=A0 629.131] (**) Option &quot;config_info&quot; &quot;udev:/sys/devices=
/platform/sc-powerkey/input/input0/event0&quot;<br>[ =C2=A0 629.131] (II) X=
INPUT: Adding extended input device &quot;sc-powerkey&quot; (type: KEYBOARD=
, id 6)<br>[ =C2=A0 629.131] (**) Option &quot;xkb_rules&quot; &quot;evdev&=
quot;<br>[ =C2=A0 629.135] (II) config/udev: Adding input device mpl3115 (/=
dev/input/event3)<br>[ =C2=A0 629.136] (II) No input driver specified, igno=
ring this device.<br>[ =C2=A0 629.136] (II) This device may have been added=
 with another device file.<br>[ =C2=A0 629.137] (II) config/udev: Adding in=
put device isl29023 light sensor (/dev/input/event4)<br>[ =C2=A0 629.137] (=
II) No input driver specified, ignoring this device.<br>[ =C2=A0 629.137] (=
II) This device may have been added with another device file.<br>[ =C2=A0 6=
30.024] (II) evdev: sc-powerkey: Close<br>[ =C2=A0 630.024] (II) UnloadModu=
le: &quot;evdev&quot;<br>[ =C2=A0 630.072] (II) Server terminated successfu=
lly (0). Closing log file.<br><br>-- <br><div dir=3D"ltr" class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><font face=3D"verdana, sans=
-serif">Refik Tuzakl=C4=B1</font></div></div></div></div></div></div></div>=
</div></div>

--00000000000032d280059c051b85--

--===============0646911179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv

--===============0646911179==--
