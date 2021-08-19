Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E686E3F1738
	for <lists+etnaviv@lfdr.de>; Thu, 19 Aug 2021 12:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C036E8A4;
	Thu, 19 Aug 2021 10:24:50 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Thu, 19 Aug 2021 10:24:49 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEC16E8A4
 for <etnaviv@lists.freedesktop.org>; Thu, 19 Aug 2021 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1629367784; x=1631959784;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hBSAgd3FUMxdAuWbePFPnkr83V67iW8MyuzfPvpuQWA=;
 b=BUBBZOK1Pf+9czazZVtFl7cBhQwIQBBbV0P2RhrjBmRbfh+LyZ7L8eUIi6Pf/M/Z
 GZenGLAI9Ph3b/TdiLG9UFuAVz3smhqX51+mWRmE/HBEp+HW4owZFiNNE/Uvz2Ou
 Ugqti9BAndf6zWfOvJZTorCl19driFoN/huDEGEYNw8=;
X-AuditID: c39127d2-b66b870000001ddb-d1-611e2de8b50c
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id C1.E9.07643.8ED2E116;
 Thu, 19 Aug 2021 12:09:44 +0200 (CEST)
Received: from [172.16.5.104] (172.16.0.116) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 19 Aug
 2021 12:09:44 +0200
To: <etnaviv@lists.freedesktop.org>
From: Wadim Egorov <w.egorov@phytec.de>
Subject: [5.14-rc5] etnaviv-gpu 130000.gpu: recover hung GPU!
Message-ID: <db2091d9-49ac-ca54-4a24-f01c105fcad9@phytec.de>
Date: Thu, 19 Aug 2021 12:09:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.16.0.116]
X-ClientProxiedBy: Florix.phytec.de (172.16.0.118) To Berlix.phytec.de
 (172.16.0.117)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKLMWRmVeSWpSXmKPExsWyRoChVPeFrlyiwY3VKha7Ztxhd2D0uN99
 nCmAMYrLJiU1J7MstUjfLoEr49vXdywF7wUrJq3rY2tg3MHXxcjJISFgIvF+z06mLkYuDiGB
 5UwSd96eZIVw7jNKLJ7RzA5SJSKgLPGg/Q8biM0moC5xZ8M3VhBbWMBWov3HJDCbV8BG4uXV
 CywgNouAqsT5O7+Aejk4RAUiJXbusIQoEZQ4OfMJWAmzgIXEzPnnGSFseYnmrbOZIWxxiVtP
 5jOB2EJA8ReXlrNAHKogMff3RGYIO1ziz/L9TBMYBWYhGTsLydhZSMbOQjJ2ASPLKkah3Mzk
 7NSizGy9gozKktRkvZTUTYzAoDw8Uf3SDsa+OR6HGJk4GA8xSnAwK4nwHvsjmyjEm5JYWZVa
 lB9fVJqTWnyIUZqDRUmc934PU6KQQHpiSWp2ampBahFMlomDU6qB0Sfm7KvO215R196devGI
 t+/ztbTMr5LRHY/CZ7Cr2an8L90dbvixW+Hhgbk+bbs6Oa9/y3dpmbW+d8PEd+VT+7LSvHq9
 FZre7gtaFti6rN2x80eTlu5qsYl+Mxz/+29r/D/BR/n+Q68f5he9je0XWpn+0Dtd7W3/24cj
 adve5/tq+4NZdwZdVWIpzkg01GIuKk4EAFAqi+A4AgAA
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

Hi,

we have noticed "recover hung GPU" messages with the latest Linux on a i.MX6 
Solo. The GPU recover message appears after some time running a Qt application 
with QT_QPA_PLATFORM=eglfs and Mesa 21.0.3.
So far there are no problems with the GUI. Nevertheless, we want to understand 
the cause of the problem.

Below is the output from the viv-unpack tool of a coredump we've saved. 
Unfortunately, I am not familiar with the whole DRM/GPU framework and don't 
really know how to proceed and provide more relevant debug information.

Is this a known problem?

Regards,
Wadim


=== Register dump
0000000c = 00000051
00000000 = 00040100
00000004 = 7ffffff6 Idle: FE- DE+ PE+ SH- PA+ SE+ RA+ TX+ VG+ IM+ FP+ TS+
00000008 = 00002200
00000014 = ffffffff
00000018 = 0c010000
0000001c = e02864ad
00000020 = 00000880
00000024 = 00005106
00000028 = 20110511
0000002c = 01012500
00000034 = c9f99eff
00000038 = c9f99eff
00000070 = 00000000
00000100 = 00140021
00000104 = 00000010
00000108 = 000000e4
0000010c = 00000000
00000400 = 2a200000
00000404 = 2a200000
00000408 = 2a200000
0000040c = 2a200000
00000410 = 2a200000
00000414 = 3e000000
00000418 = 28000000
0000041c = 28000000
00000420 = 28000000
00000424 = 28000000
00000428 = 28000000
0000042c = 2a230000
00000480 = 00000088
0000065c = 00000001
00000660 = 00000804 Cmd: [adr1 DMA: idle Fetch: valid] Req idle Cal idle
00000664 = 02082650 Command DMA address
00000668 = 08010380 FE fetched word 0
0000066c = 00000003 FE fetched word 1
00000670 = 00000000
=== Buffers
  Num Name  IOVA     Size
    0 reg   00000000 00000128      296
    1 mmu   00000000 00200000  2097152
    2 ring  02080000 00001000     4096
*  3 cmd   02082000 00000a08     2568
    4 bomap 00000000 00006300    25344
    5 bo    80a07000 00003000    12288
    6 bo    80003000 00003000    12288
    7 bo    80006000 00100000  1048576
    8 bo    80a0a000 00001000     4096
    9 bo    80107000 00280000  2621440
   10 bo    80a0b000 00280000  2621440
   11 bo    80106000 00001000     4096
   12 bo    80607000 00400000  4194304
   13 bo    02700000 00258000  2457600

Checking MMU entries... ok

