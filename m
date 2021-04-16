Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3794F361E78
	for <lists+etnaviv@lfdr.de>; Fri, 16 Apr 2021 13:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E356EB7B;
	Fri, 16 Apr 2021 11:13:03 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F5C6EB7B
 for <etnaviv@lists.freedesktop.org>; Fri, 16 Apr 2021 11:13:02 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lXMPE-0007Ir-Rz; Fri, 16 Apr 2021 13:13:00 +0200
Message-ID: <11943ea5d883bd2632c71f4a9e1a42c5f88c5e14.camel@pengutronix.de>
Subject: Re: etnaviv fails probe early, but succeeds after rmmod && modprobe
From: Lucas Stach <l.stach@pengutronix.de>
To: "Ing. Josua Mayer" <josua.mayer@jm0.eu>, etnaviv@lists.freedesktop.org
Date: Fri, 16 Apr 2021 13:12:59 +0200
In-Reply-To: <a7002193-343d-9144-38ab-63542c09a4de@jm0.eu>
References: <d83adc7a-d9db-af35-83c9-6d3dab60ab82@jm0.eu>
 <9880212dc158bbadbccb6313d9fa59a27698ef3e.camel@pengutronix.de>
 <a7002193-343d-9144-38ab-63542c09a4de@jm0.eu>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
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
Cc: John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Freitag, dem 16.04.2021 um 12:57 +0200 schrieb Ing. Josua Mayer:
> Hi Lucas,
> 
> anatop_regulator is indeed a module currently,
> this is one of the changes introduced in their jump from kernel 5.9 to 
> 5.10 - and has even landed in buster through backports ...
> 
> I wonder how / where those timeouts are specified.
> Regarding the order of module loading there is not much I can do, it is 
> already the second module inserted by the initramfs.

This looks like a kernel bug to me. If no timeout is given on the
command line, the status is immediately considered as timed-out after
the initcalls are done, as the code doesn't differentiate between "no
timeout given" and "timeout expired" at that point.

CC'ing John Stultz, who touched that code last.

Regards,
Lucas

> sincerely
> Josua Mayer
> 
> Am 16.04.21 um 12:41 schrieb Lucas Stach:
> > Hi Josua,
> > 
> > Am Freitag, dem 16.04.2021 um 11:34 +0200 schrieb Ing. Josua Mayer:
> > > Greetings everybody,
> > > 
> > > While testing Debian on the i.MX6 HummingBoard, I came across a problem
> > > where after boot, the /dev/dri/card1 representing the GC2000 does not exist.
> > > 
> > > However at that point issuing
> > > rmmod etnaviv; modprobe etnaviv
> > > succeeds and I can then go on running applications uing GL.
> > > 
> > > So I am very unsure how to debug this. What I have so far is this output
> > > from dmesg [1], which points at some deferred probing timeout behaviour.
> > > I do not know how to trace
> > > (1) whose timeout exceeded
> > > (2) what dependency is being ignored
> > > (3) why after 3 attempts probing apparently gives up
> > > I do know that this problem is shared with the coda driver, which fails
> > > the same way. Hence maybe this is not an etnaviv problem - but hopefully
> > > this message can still reach somebody who understands what is happening
> > > here.
> > 
> > I have no idea how this deferred probe timeout stuff works, but from
> > your logs it seems vddpu gets probed really late (is the anatop
> > regulator driver a module in your config?), which in turn would cause a
> > probe defer of the GPC power domain driver, which is a common
> > dependency between VPU and GPU on the i.MX6. Seems like those etnaviv
> > timeouts happen before the GPC driver had a chance to probe.
> > 
> > Regards,
> > Lucas
> > 
> > 
> > > Yours sincerely
> > > Josua Mayer
> > > 
> > > [1] short dmesg (full dmesg attached):
> > > root@sr-imx6:~# dmesg | grep etna
> > > [    5.969888] etnaviv-gpu 130000.gpu: deferred probe timeout, ignoring
> > > dependency
> > > [    5.985970] etnaviv-gpu: probe of 130000.gpu failed with error -110
> > > [    6.076604] etnaviv-gpu 134000.gpu: deferred probe timeout, ignoring
> > > dependency
> > > [    6.102833] etnaviv-gpu: probe of 134000.gpu failed with error -110
> > > [    6.121231] etnaviv-gpu 2204000.gpu: deferred probe timeout, ignoring
> > > dependency
> > > [    6.150314] etnaviv-gpu: probe of 2204000.gpu failed with error -110
> > > root@sr-imx6:~# rmmod etnaviv
> > > root@sr-imx6:~# modprobe etnaviv
> > > root@sr-imx6:~# dmesg | grep etna
> > > ...
> > > [  166.482349] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops [etnaviv])
> > > [  166.502064] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops [etnaviv])
> > > [  166.514261] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops [etnaviv])
> > > [  166.520868] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
> > > [  166.527630] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
> > > [  166.533879] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
> > > [  166.540048] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
> > > [  166.547379] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on
> > > minor 1
> > > _______________________________________________
> > > etnaviv mailing list
> > > etnaviv@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/etnaviv
> > 
> > 


_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
