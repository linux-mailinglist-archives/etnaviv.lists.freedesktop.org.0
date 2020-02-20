Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC9166624
	for <lists+etnaviv@lfdr.de>; Thu, 20 Feb 2020 19:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5FA6EE3C;
	Thu, 20 Feb 2020 18:25:38 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0206EE3C
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Feb 2020 18:25:36 +0000 (UTC)
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 067A667A7C7;
 Thu, 20 Feb 2020 19:25:33 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 20 Feb
 2020 19:25:32 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Thu, 20 Feb 2020 19:25:32 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Chris Healy <cphealy@gmail.com>
Subject: Re: Etnaviv issues on i.MX8M-Mini
Thread-Topic: Etnaviv issues on i.MX8M-Mini
Thread-Index: AQHV5+yplA/1sTzXA027Bdn9yaxznqgkQ0YAgAASYYA=
Date: Thu, 20 Feb 2020 18:25:32 +0000
Message-ID: <bcc3af77-07c5-fbc7-ad20-d070c5ab1ce8@kontron.de>
References: <2704d3bd-5563-8951-58f7-75a906782754@kontron.de>
 <CAFXsbZp9kW555gm+8Cz+oQVRNSzVzzQO2rM5YqzitCd6T7KN6Q@mail.gmail.com>
In-Reply-To: <CAFXsbZp9kW555gm+8Cz+oQVRNSzVzzQO2rM5YqzitCd6T7KN6Q@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <A82E78A70C04F941A79843ABBB90597E@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 067A667A7C7.AE12F
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: cphealy@gmail.com, etnaviv@lists.freedesktop.org
X-Spam-Status: No
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
Cc: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Chris,

On 20.02.20 18:19, Chris Healy wrote:
> Hi Frieder,
> 
> For your #1, can you provide more detail on your configuration?  What
> is your display resolution?  Are you running Qt with egl_fs or are you
> running on top of a compositor?  If you are running on top of a
> compositor, is the 3D GPU being used for compositing?

Sure. The display resolution I'm testing with is 1024x600 and I'm using 
the eglfs/KMS backend without compositor.

I'm passing this simple config to Qt via QT_QPA_EGLFS_KMS_CONFIG:

{
     "device": "/dev/dri/card1"
}

> 
> For your #2, at least in the case of the GC2000, the GPU cannot deal
> with shaders that have more than 512 instructions.  The terrain demo
> has a shader that is typically larger than 512 instructions.  I've
> always seen the terrain demo fail on the GC2000.  With the GC3000 and
> GC7000L, this 512 instruction limit does not exist and the terrain
> demo has always worked.  Likely the GC600 has this 512 instruction
> limit.

Ok, that's likely the reason for this. Thanks for explaining.

Best regards,
Frieder

> 
> Regards,
> 
> Chris
> 
> On Thu, Feb 20, 2020 at 8:56 AM Schrempf Frieder
> <frieder.schrempf@kontron.de> wrote:
>>
>> Hi,
>>
>> according to the documents, the i.MX8M-Mini features a GC320 and a
>> GCNanoUltra. I tried to run the etnaviv drivers and the following GPUs
>> are detected:
>>
>>          etnaviv-gpu 38000000.gpu: model: GC600, revision: 4653
>>          etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341
>>
>> Running some demos and tests with mesa 19.1.6 most things seem to work.
>> Still I currently have two issues, while the first one is kind of a
>> show-stopper and the second one is not really important as it seems to
>> affect shaders only.
>>
>> 1. When running any QtQuick applications, all transformations like
>> moving elements are really jerky and not smooth at all as it should be.
>> Any ideas what the reason could be, or how to get more information about
>> this problem?
>>
>> 2. With some demos (e.g. with 'glmark2-es2-drm -b terrain') I get:
>>
>>          error: compile failed!
>>          etna_draw_vbo:222: compiled shaders are not okay
>>
>> Can this be fixed somehow, or is this due to the limitations of the GPU?
>>
>> Thanks,
>> Frieder
>> _______________________________________________
>> etnaviv mailing list
>> etnaviv@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/etnaviv
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
