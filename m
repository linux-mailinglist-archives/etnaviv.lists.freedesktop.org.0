Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5084B14987E
	for <lists+etnaviv@lfdr.de>; Sun, 26 Jan 2020 03:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D801F6E154;
	Sun, 26 Jan 2020 02:49:36 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Sun, 26 Jan 2020 02:49:35 UTC
Received: from mail.lindev.ch (mail.lindev.ch [5.39.83.55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4043A6E154
 for <etnaviv@lists.freedesktop.org>; Sun, 26 Jan 2020 02:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 (Authenticated sender: bero@lindev.ch)
 by mail.lindev.ch (Postfix) with ESMTPA id B37553FDD4
 for <etnaviv@lists.freedesktop.org>; Sun, 26 Jan 2020 03:43:41 +0100 (CET)
From: "Bernhard Rosenkraenzer" <bero@lindev.ch>
To: etnaviv@lists.freedesktop.org
User-Agent: SOGoMail 4.1.1
MIME-Version: 1.0
Date: Sun, 26 Jan 2020 03:43:41 +0100
Subject: Is there an =?utf-8?q?i=2EMX8?= HDMI TX driver that works with 
 =?utf-8?q?Etnaviv=3F?=
Message-ID: <2aad-5e2cfd00-9-275e0440@259173318>
X-Forward: 46.92.180.50
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi,
I'm trying to get etnaviv up and running on an i.MX8 based Hummingboard Pulse, on top of kernel 5.5-rc7.
Everything looks good, etnaviv loads and recognizes the GC7000 correctly:

[Sun Jan 26 00:32:40 2020] etnaviv etnaviv: bound 38000000.gpu (ops gpu_ops [etnaviv])
[Sun Jan 26 00:32:40 2020] etnaviv-gpu 38000000.gpu: model: GC7000, revision: 6214
[Sun Jan 26 00:32:40 2020] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on minor 0

Opening /dev/dri/card0 etc. works too - but of course there's no signal on the HDMI port given there's no HDMI TX driver in 5.5-rc7 (at least none that I could find).
Is there any out of tree driver that will work (or could be made work) on 5.5 without insane amounts of effort?

Thanks
bero

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
