Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ED716A460
	for <lists+etnaviv@lfdr.de>; Mon, 24 Feb 2020 11:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAFC6E0A8;
	Mon, 24 Feb 2020 10:53:25 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF816E0A8
 for <etnaviv@lists.freedesktop.org>; Mon, 24 Feb 2020 10:53:23 +0000 (UTC)
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id D203C67A7C0;
 Mon, 24 Feb 2020 11:53:20 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 24 Feb
 2020 11:53:20 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Mon, 24 Feb 2020 11:53:20 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Lucas Stach <l.stach@pengutronix.de>, Chris Healy <cphealy@gmail.com>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Subject: Re: Etnaviv issues on i.MX8M-Mini
Thread-Topic: Etnaviv issues on i.MX8M-Mini
Thread-Index: AQHV5+yplA/1sTzXA027Bdn9yaxznqgkQ0YAgAASYYCAAAlEgIAFurcAgAAChwCAAAR5gA==
Date: Mon, 24 Feb 2020 10:53:20 +0000
Message-ID: <f3a0bd17-83f5-4afa-e9a6-3eac411d34ff@kontron.de>
References: <2704d3bd-5563-8951-58f7-75a906782754@kontron.de>
 <CAFXsbZp9kW555gm+8Cz+oQVRNSzVzzQO2rM5YqzitCd6T7KN6Q@mail.gmail.com>
 <bcc3af77-07c5-fbc7-ad20-d070c5ab1ce8@kontron.de>
 <CAFXsbZqNQMi+-tPE22oMTHqb+8vEOy+v8cLfUMmhqs7S5RLoqg@mail.gmail.com>
 <d1c98cb7-c75f-d8ca-9541-3c118d371a57@kontron.de>
 <38c7cdc27213697b50517ce103a9d38120f84bd3.camel@pengutronix.de>
In-Reply-To: <38c7cdc27213697b50517ce103a9d38120f84bd3.camel@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <C224702F06367C4B9293DC20E3490258@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: D203C67A7C0.ACA16
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: cphealy@gmail.com, etnaviv@lists.freedesktop.org,
 l.stach@pengutronix.de
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Lucas,

On 24.02.20 11:37, Lucas Stach wrote:
> Hi Frieder,
> 
> On Mo, 2020-02-24 at 10:28 +0000, Schrempf Frieder wrote:
>> On 20.02.20 19:58, Chris Healy wrote:
>>> For the jerkey transitions, can you determine if this is a symptom of
>>> a low framerate or dropped frames or something else?
>>>
>>> Perhaps you can start your app with
>>> "GALLIUM_HUD=fps,cpu,draw-calls,frametime".  This may give some clues.
>>
>> The framerate seems ok. I get something between 50 and 70 FPS.
>>
>> I have a Qt demo app with a menu and an animated 'ball' that moves
>> across the screen. When the menu is visible, the ball movement is really
>> jerky (ball seems to 'jump back and forth' instead of moving linearly).
>>
>> As soon as I hide the menu and show the animation fullscreen, the
>> movements are perfectly smooth.
>>
>> Running the same app with software rendering, everything looks good, too.
>>
>> No idea what that means, though. I probably need to look at the code of
>> the app and do some more experiments to get a better idea of what might
>> cause the distortion.
>>
>> Unless some of the graphics experts here already have an idea of what
>> can cause and/or how to debug such an issue!?
> 
> Which driver is used for the display side? It seems like the display
> side doesn't properly handle the dma fences used to synchronize scanout
> and rendering.

I ported/picked the drivers for the LCDIF and DSI controllers from 
development branch of the 5.4-based vendor kernel [1] to our own 
v5.4-based kernel [2]. So it is quite probable, that something could be 
wrong here.

> 
>> Is it even correct, that the GPUs are detected as GC520 and GC600? Is it
>> known if they need some changes in the HWDB?
> 
> We probably need some addition to the HWDB. It is highly likely that
> the GPU is some variant of the GC600 (all this NanoUltra stuff is just
> marketing fluff), but it seems the feature registers on those newer
> cores aren't fully correct anymore, as the vendor driver handles most
> of this via the HWDB these days.

Ok, good to know. I don't know how this usually works, but if I can be 
of any help with the actual hardware at hand, let me know.

Thanks,
Frieder

[1] 
https://source.codeaurora.org/external/imx/linux-imx/log/?h=imx_5.4.0_8dxlphantom_er
[2] https://git.kontron-electronics.de/linux/linux/commits/v5.4-ktn

> 
> Regards,
> Lucas
> 
>> Thanks for your support!
>>
>>> On Thu, Feb 20, 2020 at 10:25 AM Schrempf Frieder
>>> <frieder.schrempf@kontron.de> wrote:
>>>> Hi Chris,
>>>>
>>>> On 20.02.20 18:19, Chris Healy wrote:
>>>>> Hi Frieder,
>>>>>
>>>>> For your #1, can you provide more detail on your configuration?  What
>>>>> is your display resolution?  Are you running Qt with egl_fs or are you
>>>>> running on top of a compositor?  If you are running on top of a
>>>>> compositor, is the 3D GPU being used for compositing?
>>>>
>>>> Sure. The display resolution I'm testing with is 1024x600 and I'm using
>>>> the eglfs/KMS backend without compositor.
>>>>
>>>> I'm passing this simple config to Qt via QT_QPA_EGLFS_KMS_CONFIG:
>>>>
>>>> {
>>>>        "device": "/dev/dri/card1"
>>>> }
>>>>
>>>>> For your #2, at least in the case of the GC2000, the GPU cannot deal
>>>>> with shaders that have more than 512 instructions.  The terrain demo
>>>>> has a shader that is typically larger than 512 instructions.  I've
>>>>> always seen the terrain demo fail on the GC2000.  With the GC3000 and
>>>>> GC7000L, this 512 instruction limit does not exist and the terrain
>>>>> demo has always worked.  Likely the GC600 has this 512 instruction
>>>>> limit.
>>>>
>>>> Ok, that's likely the reason for this. Thanks for explaining.
>>>>
>>>> Best regards,
>>>> Frieder
>>>>
>>>>> Regards,
>>>>>
>>>>> Chris
>>>>>
>>>>> On Thu, Feb 20, 2020 at 8:56 AM Schrempf Frieder
>>>>> <frieder.schrempf@kontron.de> wrote:
>>>>>> Hi,
>>>>>>
>>>>>> according to the documents, the i.MX8M-Mini features a GC320 and a
>>>>>> GCNanoUltra. I tried to run the etnaviv drivers and the following GPUs
>>>>>> are detected:
>>>>>>
>>>>>>            etnaviv-gpu 38000000.gpu: model: GC600, revision: 4653
>>>>>>            etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341
>>>>>>
>>>>>> Running some demos and tests with mesa 19.1.6 most things seem to work.
>>>>>> Still I currently have two issues, while the first one is kind of a
>>>>>> show-stopper and the second one is not really important as it seems to
>>>>>> affect shaders only.
>>>>>>
>>>>>> 1. When running any QtQuick applications, all transformations like
>>>>>> moving elements are really jerky and not smooth at all as it should be.
>>>>>> Any ideas what the reason could be, or how to get more information about
>>>>>> this problem?
>>>>>>
>>>>>> 2. With some demos (e.g. with 'glmark2-es2-drm -b terrain') I get:
>>>>>>
>>>>>>            error: compile failed!
>>>>>>            etna_draw_vbo:222: compiled shaders are not okay
>>>>>>
>>>>>> Can this be fixed somehow, or is this due to the limitations of the GPU?
>>>>>>
>>>>>> Thanks,
>>>>>> Frieder
>>>>>> _______________________________________________
>>>>>> etnaviv mailing list
>>>>>> etnaviv@lists.freedesktop.org
>>>>>> https://lists.freedesktop.org/mailman/listinfo/etnaviv
>> _______________________________________________
>> etnaviv mailing list
>> etnaviv@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/etnaviv
> 
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
