Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA99F2CA441
	for <lists+etnaviv@lfdr.de>; Tue,  1 Dec 2020 14:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996056E546;
	Tue,  1 Dec 2020 13:49:47 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ED16E546
 for <etnaviv@lists.freedesktop.org>; Tue,  1 Dec 2020 13:49:45 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id E66E0DF98E;
 Tue,  1 Dec 2020 13:46:48 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rYba85zLCr2m; Tue,  1 Dec 2020 13:46:48 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 5FC73E06F5;
 Tue,  1 Dec 2020 13:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id po0HizPL_2d7; Tue,  1 Dec 2020 13:46:47 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 943B5DF9A4;
 Tue,  1 Dec 2020 13:46:47 +0000 (UTC)
Date: Tue, 1 Dec 2020 14:49:42 +0100
From: Lubomir Rintel <lkundrak@v3.sk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: GC300 2D unit won't work with GC2000 3D disabled on MMP3
Message-ID: <20201201134942.GA1727513@demiurge.local>
References: <20201130170745.GA1666321@demiurge.local>
 <aae1aea6ce45048253cb329b73bd16793e90404b.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aae1aea6ce45048253cb329b73bd16793e90404b.camel@pengutronix.de>
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
 Ivan Najdanovic <najdanovicivan@gmail.com>, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Tue, Dec 01, 2020 at 11:33:36AM +0100, Lucas Stach wrote:
> Hi Lubomir,
> =

> Am Montag, den 30.11.2020, 18:07 +0100 schrieb Lubomir Rintel:
>> Hello,
>> =

>> (adding Ivan to Cc, since he brought the issue up privately. Ivan,
>> etnaviv@ is a moderated list, please subscribe if you're going to
>> reply.)
>> =

>> I'm wondering if anyone can help me understand what is going with
>> Vivante
>> GC300 on a MMP3 and find a reasonable fix. MMP3 has these two GPU
>> cores:
>> =

>> =A0 [=A0=A0=A0 2.142545] etnaviv-gpu d420d000.gpu: model: GC2000, revisi=
on:
>> 5026
>> =A0 [=A0=A0=A0 2.154468] etnaviv-gpu d420f000.gpu: model: GC300, revisio=
n: 4634
>> =A0 [=A0=A0=A0 2.166808] [drm] Initialized etnaviv 1.3.0 20151214 for et=
naviv
>> on minor 0
>> =

>> Currently, clients that try to use the GC300 2D unit -- libdrm's
>> etnaviv_2d
>> test or the xorg-x11-drv-armada ddx on a MMP3 don't work and etnaviv
>> complains:
>> =

>> =A0 [=A0 295.077770] etnaviv-gpu d420d000.gpu: recover hung GPU!
>> =

>> That is, until the clock that's supposedly for the GC2000 3D unit are
>> turned on. Then things work fine.
> =

> I believe the above splat is with the etnaviv_2d_test? This test is
> broken in that it will just pick the first GPU core (in your case the
> GC2000) instead of looking for a core with 2D capabilities. Submitting
> 2D jobs into the 3D GPU will do nothing or hang the GPU, depending on
> the specific GPU generation.

Yes,

With core=3D0 the output is:

  etnaviv-gpu d420d000.gpu: recover hung GPU!

If I change the test to set core=3D1, I get two extra lines:

  etnaviv-gpu d420f000.gpu: recover hung GPU!
  etnaviv-gpu d420f000.gpu: GPU failed to reset: FE not idle, 3D not idle, =
2D not idle
  etnaviv-gpu d420f000.gpu: GPU not yet idle, mask: 0x00000000

> I don't know exactly what the armada driver is doing, IIRC it properly
> looks for a 2D GPU core.

It seems to. It logs this line:

  [  1275.130] (--) armada(0): Vivante GC300 GPU revision 4634 (etnaviv) 2d=
 PE2.0

The kernel output is:

  etnaviv-gpu d420f000.gpu: recover hung GPU!
  etnaviv-gpu d420f000.gpu: GPU failed to reset: FE not idle, 3D not idle, =
2D not idle
  etnaviv-gpu d420f000.gpu: recover hung GPU!
  etnaviv-gpu d420f000.gpu: GPU failed to reset: FE not idle, 3D not idle, =
2D not idle
  etnaviv-gpu d420f000.gpu: recover hung GPU!

> Is the symptom the same if the 2d_test is fixed to submit into the
> right GPU core?

See above.

Note that if I force the clock on the test succeeds (and the result is
correct) with either core=3D0 or core=3D1. I don't know if both cores are 2D
capable; I have no idea how to tell. Here the feature words are:

  core=3D0 ETNA_GPU_FEATURES_0 =3D 0xe0286cad
  core=3D0 ETNA_GPU_FEATURES_1 =3D 0xcb799eff
  core=3D0 ETNA_GPU_FEATURES_2 =3D 0x2e13b2d9
  core=3D0 ETNA_GPU_FEATURES_3 =3D 0x02000000

  core=3D1 ETNA_GPU_FEATURES_0 =3D 0xe02c7eca
  core=3D1 ETNA_GPU_FEATURES_1 =3D 0xe1399fff
  core=3D1 ETNA_GPU_FEATURES_2 =3D 0x2e13b219
  core=3D1 ETNA_GPU_FEATURES_3 =3D 0x00010000

> Regards,
> Lucas

Take care
Lubo
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
