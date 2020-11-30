Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E392C8A9A
	for <lists+etnaviv@lfdr.de>; Mon, 30 Nov 2020 18:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0676E5C6;
	Mon, 30 Nov 2020 17:16:50 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 542 seconds by postgrey-1.36 at gabe;
 Mon, 30 Nov 2020 17:16:49 UTC
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3AF6E5C6
 for <etnaviv@lists.freedesktop.org>; Mon, 30 Nov 2020 17:16:49 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 0D344DF357;
 Mon, 30 Nov 2020 17:04:52 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Gqxy0HkQRbaW; Mon, 30 Nov 2020 17:04:51 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id A7C98E06E1;
 Mon, 30 Nov 2020 17:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4x0vByXMfUrF; Mon, 30 Nov 2020 17:04:51 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 63B57DF357;
 Mon, 30 Nov 2020 17:04:51 +0000 (UTC)
Date: Mon, 30 Nov 2020 18:07:45 +0100
From: Lubomir Rintel <lkundrak@v3.sk>
To: etnaviv@lists.freedesktop.org
Subject: GC300 2D unit won't work with GC2000 3D disabled on MMP3
Message-ID: <20201130170745.GA1666321@demiurge.local>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Ivan Najdanovic <najdanovicivan@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hello,

(adding Ivan to Cc, since he brought the issue up privately. Ivan,
etnaviv@ is a moderated list, please subscribe if you're going to
reply.)

I'm wondering if anyone can help me understand what is going with Vivante
GC300 on a MMP3 and find a reasonable fix. MMP3 has these two GPU cores:

  [    2.142545] etnaviv-gpu d420d000.gpu: model: GC2000, revision: 5026
  [    2.154468] etnaviv-gpu d420f000.gpu: model: GC300, revision: 4634
  [    2.166808] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on minor 0

Currently, clients that try to use the GC300 2D unit -- libdrm's etnaviv_2d
test or the xorg-x11-drv-armada ddx on a MMP3 don't work and etnaviv
complains:

  [  295.077770] etnaviv-gpu d420d000.gpu: recover hung GPU!

That is, until the clock that's supposedly for the GC2000 3D unit are
turned on. Then things work fine.

There's no documentation for the MMP3, but it is known that the relevant
register (at 0xd42828cc) in the APMU that controls the GPU clock looks
somewhat like this (on the right is the name of the clock that sets given
bits):

    28   24   20   16    12    8    4    0
  0011 0011 0001 1100  0000 0111 0000 1010 - 0x331c070a won't work
  0011 0011 0001 1100  0000 0111 0000 1111 - 0x331c070f works
  `--| `--|    | ||      `|  `|| `|`| |||`-- GC3D_AXI_RST_N      (1u << 0) ------------ gpu_3d_clk
     |    |    | ||       |   ||  | | ||`--- GC2D3D_RST_N        (1u << 1)    / --\
     |    |    | ||       |   ||  | | |`---- GC3D_AXICLK_EN      (1u << 2) --/     \
     |    |    | ||       |   ||  | | `----- GC2D3D_CLK_EN       (1u << 3)      ------- gpu_bus_clk
     |    |    | ||       |   ||  | |
     |    |    | ||       |   ||  | `------- GC3D_ACLK_SEL(n)    ((n & 3) << 4) ------- gpu_bus_mux
     |    |    | ||       |   ||  `--------- GC3D_CLK_SRC_SEL(n) ((n & 3) << 6) ------- gpu_3d_mux
     |    |    | ||       |   ||
     |    |    | ||       |   |`------------ GC_ISB              (1u << 8)
     |    |    | ||       |   `------------- GC_PWRUP(n)         ((n & 3) << 9) ------- gpu_power
     |    |    | ||       |
     |    |    | ||       `----------------- GC2D_CLK_SRC_SEL(n) ((n & 3) << 12) ------ gpu_2d_mux
     |    |    | ||
     |    |    | |`------------------------- GC2D_AXI_RST_N      (1u << 18) ---\
     |    |    | `-------------------------- GC2D_AXICLK_EN      (1u << 19) ----\
     |    |    |                                                                 >----- gpu_2d_clk
     |    |    `---------------------------- GC2D_CLK_EN         (1u << 20) ----/
     |    |
     |    `--------------------------------- GC3D_CLK_DIV(n)     ((n & 0xF) << 24) ---- gpu_3d_div
     |
     `-------------------------------------- GC2D_CLK_DIV(n)     ((n & 0xF) << 28) ---- gpu_2d_div

The bits that make a difference are the bits 0 and 2. Bit 0 is the inverse
reset and bit 2 is the clock enable. Both ought to be controlling the 3D
block which is why I find it odd that they're required for 2D to function.

To deal with the situation, I guess I could assume the bits don't do what
they say on the tin and make the clock driver set the "3d" bits for
both blocks. Alternatively, etnaviv could perhaps be made to enable the
3d clock when the 2d block is being used, perhaps configurable with a knob
in the DT.

Unfortunatelly, both options seem to suck. Perhaps someone with more clue
about how galcore are integrated into the socs might have a better idea?

Thanks
Lubo
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
