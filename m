Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AA63F17C8
	for <lists+etnaviv@lfdr.de>; Thu, 19 Aug 2021 13:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D566E5C3;
	Thu, 19 Aug 2021 11:14:30 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B356E5C3
 for <etnaviv@lists.freedesktop.org>; Thu, 19 Aug 2021 11:14:28 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mGg0A-0003bG-2s; Thu, 19 Aug 2021 13:14:26 +0200
Message-ID: <e6aec4ef72db28ceda40cec0de0e9bf0e8bcfd80.camel@pengutronix.de>
Subject: Re: [5.14-rc5] etnaviv-gpu 130000.gpu: recover hung GPU!
From: Lucas Stach <l.stach@pengutronix.de>
To: Wadim Egorov <w.egorov@phytec.de>, etnaviv@lists.freedesktop.org
Date: Thu, 19 Aug 2021 13:14:25 +0200
In-Reply-To: <db2091d9-49ac-ca54-4a24-f01c105fcad9@phytec.de>
References: <db2091d9-49ac-ca54-4a24-f01c105fcad9@phytec.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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

Hi Wadim,

Am Donnerstag, dem 19.08.2021 um 12:09 +0200 schrieb Wadim Egorov:
> Hi,
> 
> we have noticed "recover hung GPU" messages with the latest Linux on a i.MX6 
> Solo. The GPU recover message appears after some time running a Qt application 
> with QT_QPA_PLATFORM=eglfs and Mesa 21.0.3.
> So far there are no problems with the GUI. Nevertheless, we want to understand 
> the cause of the problem.
> 
> Below is the output from the viv-unpack tool of a coredump we've saved. 
> Unfortunately, I am not familiar with the whole DRM/GPU framework and don't 
> really know how to proceed and provide more relevant debug information.
> 
> Is this a known problem?
> 
Is this something that started showing up after the kernel update, or
are there other system component changes involved, like a Mesa update?
From the hang location (inside a user cmdstream) a Mesa issue sounds
more likely than a kernel issue.

Regards,
Lucas

> Regards,
> Wadim
> 
> 
> === Register dump
> 0000000c = 00000051
> 00000000 = 00040100
> 00000004 = 7ffffff6 Idle: FE- DE+ PE+ SH- PA+ SE+ RA+ TX+ VG+ IM+ FP+ TS+
> 00000008 = 00002200
> 00000014 = ffffffff
> 00000018 = 0c010000
> 0000001c = e02864ad
> 00000020 = 00000880
> 00000024 = 00005106
> 00000028 = 20110511
> 0000002c = 01012500
> 00000034 = c9f99eff
> 00000038 = c9f99eff
> 00000070 = 00000000
> 00000100 = 00140021
> 00000104 = 00000010
> 00000108 = 000000e4
> 0000010c = 00000000
> 00000400 = 2a200000
> 00000404 = 2a200000
> 00000408 = 2a200000
> 0000040c = 2a200000
> 00000410 = 2a200000
> 00000414 = 3e000000
> 00000418 = 28000000
> 0000041c = 28000000
> 00000420 = 28000000
> 00000424 = 28000000
> 00000428 = 28000000
> 0000042c = 2a230000
> 00000480 = 00000088
> 0000065c = 00000001
> 00000660 = 00000804 Cmd: [adr1 DMA: idle Fetch: valid] Req idle Cal idle
> 00000664 = 02082650 Command DMA address
> 00000668 = 08010380 FE fetched word 0
> 0000066c = 00000003 FE fetched word 1
> 00000670 = 00000000
> === Buffers
>   Num Name  IOVA     Size
>     0 reg   00000000 00000128      296
>     1 mmu   00000000 00200000  2097152
>     2 ring  02080000 00001000     4096
> *  3 cmd   02082000 00000a08     2568
>     4 bomap 00000000 00006300    25344
>     5 bo    80a07000 00003000    12288
>     6 bo    80003000 00003000    12288
>     7 bo    80006000 00100000  1048576
>     8 bo    80a0a000 00001000     4096
>     9 bo    80107000 00280000  2621440
>    10 bo    80a0b000 00280000  2621440
>    11 bo    80106000 00001000     4096
>    12 bo    80607000 00400000  4194304
>    13 bo    02700000 00258000  2457600
> 
> Checking MMU entries... ok
> 


