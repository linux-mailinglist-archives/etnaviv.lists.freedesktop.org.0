Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12092361E59
	for <lists+etnaviv@lfdr.de>; Fri, 16 Apr 2021 12:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB996EB79;
	Fri, 16 Apr 2021 10:57:55 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310D36EB79
 for <etnaviv@lists.freedesktop.org>; Fri, 16 Apr 2021 10:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1618570671; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Gl9zQ9RB/YCe2nqLs+Oebv8AuVP2j6KwAAv32lMGK117KrKK5no+lRQUAyZw6N8KMt
 WaT3M6/BbggiHakxYIDjor3NgoVeLbEIi5Jstlcjtpe6If9Z2/GtB4m9TCVvnUYJYPvb
 cyE3y4vtX6jjInM5vJ0xjzWypyNvM7OeZB0jcAptdZjWsgKaLGe1K18XtCEVIKBTkR7B
 Pb6le6K1oNMkTCmS2VVCiH6FDB8+c/imAiexzesEzCty035L2Q+mWHeVNuhgIZMstl2v
 sRRhZ+CNB4oOPTzv7fISXdu+6zwP9L1BEnfxibP+nkcRwBAv7wIduYVZQti18VOM9V0W
 vSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618570671;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:To:Subject:Cc:Date:From:
 Subject:Sender;
 bh=rpv5MjLv2vJ03mdypPQZmpLzJriHTsk2sv22ULrmiS4=;
 b=LMDCXnJAJBAIdLdp36sTz8tUTcdd3DYUWNktX4iEuMQEFiCf2nNc/aL3LotBFMs24S
 k97WbC78Bq95/2ud0xd9GjGxVhn8QB3Pfg0lkGaTidd825PV/37hbeAjqy5AWgo1ADkY
 g1AWDT98gnPQpgnri/irytm9xgry9LuxusM2AirStfh9pAPEbOpe+URRlzZS3VUxLwRD
 Ay0X7vKpC6zWSvVyTz0DUEtQfM1Z4o4yJryS5QAfnoe+xysdBa2x/lcBKLTb6vq6ffhE
 FNMuQ14ULtPqMMMtH4qLZcWVr0Rmv2E3H5PjF/sZGl9GD1UOVpTJlg0zxDYzpkzQke6p
 3ciQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1618570671;
 s=strato-dkim-0002; d=jm0.eu;
 h=In-Reply-To:Date:Message-ID:From:References:To:Subject:Cc:Date:From:
 Subject:Sender;
 bh=rpv5MjLv2vJ03mdypPQZmpLzJriHTsk2sv22ULrmiS4=;
 b=VYUYgYtGdqmzH+pwlrzRcdN0Y2Wuvz4hpUSTUy60Q1vNsQ3yXr5hvt2r0i4fO2C4fQ
 sPJoEbsRjMzLuOM2ZBN7DaQGTrnBjiKvYE1bevH877EPEa1Jg/AeSBEm4FJ9u4Bj3Qbw
 8HOVG3w6o4LoI/I7AzjOGc+78kcaweA0yTCUUzhGVRbbVtPclVUQvD0YIu89Q363Jfbt
 RNejjg5YOMo20TNi9d+LbFRJm5JEbMwGPy3HV1tibglwpWfvl6L6mMkvb3cRUb/eZauW
 AvJcfR+5VwlEsFFWGeONXrhAxuHaMnWMBAZfUhPi1pDCE+TJktrjM/G7nH1MmUFqWJwZ
 2Dzw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPXvQCbXgI7t69COvnl6LERsNcX+38fzPJhyS/JvIQkjQZbA=="
X-RZG-CLASS-ID: mo00
Received: from DESKTOP-QN8EJSD.lan by smtp.strato.de (RZmta 47.24.3 AUTH)
 with ESMTPSA id g09a86x3GAvp6lF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 16 Apr 2021 12:57:51 +0200 (CEST)
Subject: Re: etnaviv fails probe early, but succeeds after rmmod && modprobe
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
References: <d83adc7a-d9db-af35-83c9-6d3dab60ab82@jm0.eu>
 <9880212dc158bbadbccb6313d9fa59a27698ef3e.camel@pengutronix.de>
From: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Message-ID: <a7002193-343d-9144-38ab-63542c09a4de@jm0.eu>
Date: Fri, 16 Apr 2021 12:57:50 +0200
MIME-Version: 1.0
In-Reply-To: <9880212dc158bbadbccb6313d9fa59a27698ef3e.camel@pengutronix.de>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Lucas,

anatop_regulator is indeed a module currently,
this is one of the changes introduced in their jump from kernel 5.9 to 
5.10 - and has even landed in buster through backports ...

I wonder how / where those timeouts are specified.
Regarding the order of module loading there is not much I can do, it is 
already the second module inserted by the initramfs.

sincerely
Josua Mayer

Am 16.04.21 um 12:41 schrieb Lucas Stach:
> Hi Josua,
> 
> Am Freitag, dem 16.04.2021 um 11:34 +0200 schrieb Ing. Josua Mayer:
>> Greetings everybody,
>>
>> While testing Debian on the i.MX6 HummingBoard, I came across a problem
>> where after boot, the /dev/dri/card1 representing the GC2000 does not exist.
>>
>> However at that point issuing
>> rmmod etnaviv; modprobe etnaviv
>> succeeds and I can then go on running applications uing GL.
>>
>> So I am very unsure how to debug this. What I have so far is this output
>> from dmesg [1], which points at some deferred probing timeout behaviour.
>> I do not know how to trace
>> (1) whose timeout exceeded
>> (2) what dependency is being ignored
>> (3) why after 3 attempts probing apparently gives up
>> I do know that this problem is shared with the coda driver, which fails
>> the same way. Hence maybe this is not an etnaviv problem - but hopefully
>> this message can still reach somebody who understands what is happening
>> here.
> 
> I have no idea how this deferred probe timeout stuff works, but from
> your logs it seems vddpu gets probed really late (is the anatop
> regulator driver a module in your config?), which in turn would cause a
> probe defer of the GPC power domain driver, which is a common
> dependency between VPU and GPU on the i.MX6. Seems like those etnaviv
> timeouts happen before the GPC driver had a chance to probe.
> 
> Regards,
> Lucas
> 
> 
>> Yours sincerely
>> Josua Mayer
>>
>> [1] short dmesg (full dmesg attached):
>> root@sr-imx6:~# dmesg | grep etna
>> [    5.969888] etnaviv-gpu 130000.gpu: deferred probe timeout, ignoring
>> dependency
>> [    5.985970] etnaviv-gpu: probe of 130000.gpu failed with error -110
>> [    6.076604] etnaviv-gpu 134000.gpu: deferred probe timeout, ignoring
>> dependency
>> [    6.102833] etnaviv-gpu: probe of 134000.gpu failed with error -110
>> [    6.121231] etnaviv-gpu 2204000.gpu: deferred probe timeout, ignoring
>> dependency
>> [    6.150314] etnaviv-gpu: probe of 2204000.gpu failed with error -110
>> root@sr-imx6:~# rmmod etnaviv
>> root@sr-imx6:~# modprobe etnaviv
>> root@sr-imx6:~# dmesg | grep etna
>> ...
>> [  166.482349] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops [etnaviv])
>> [  166.502064] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops [etnaviv])
>> [  166.514261] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops [etnaviv])
>> [  166.520868] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
>> [  166.527630] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
>> [  166.533879] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
>> [  166.540048] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
>> [  166.547379] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on
>> minor 1
>> _______________________________________________
>> etnaviv mailing list
>> etnaviv@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/etnaviv
> 
> 
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
