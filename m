Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8A916BB9F
	for <lists+etnaviv@lfdr.de>; Tue, 25 Feb 2020 09:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454BE6E9FF;
	Tue, 25 Feb 2020 08:14:03 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C8F6E9FE
 for <etnaviv@lists.freedesktop.org>; Tue, 25 Feb 2020 08:14:01 +0000 (UTC)
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 94CB467A8C8;
 Tue, 25 Feb 2020 09:13:58 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 25 Feb
 2020 09:13:58 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Tue, 25 Feb 2020 09:13:58 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Lucas Stach <l.stach@pengutronix.de>, Chris Healy <cphealy@gmail.com>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Subject: Re: Etnaviv issues on i.MX8M-Mini
Thread-Topic: Etnaviv issues on i.MX8M-Mini
Thread-Index: AQHV5+yplA/1sTzXA027Bdn9yaxznqgkQ0YAgAASYYCAAAlEgIAFurcAgAAChwCAAAR5gIAABF6AgAFhcIA=
Date: Tue, 25 Feb 2020 08:13:58 +0000
Message-ID: <41b4070d-8db8-112c-6c57-f50af00b1604@kontron.de>
References: <2704d3bd-5563-8951-58f7-75a906782754@kontron.de>
 <CAFXsbZp9kW555gm+8Cz+oQVRNSzVzzQO2rM5YqzitCd6T7KN6Q@mail.gmail.com>
 <bcc3af77-07c5-fbc7-ad20-d070c5ab1ce8@kontron.de>
 <CAFXsbZqNQMi+-tPE22oMTHqb+8vEOy+v8cLfUMmhqs7S5RLoqg@mail.gmail.com>
 <d1c98cb7-c75f-d8ca-9541-3c118d371a57@kontron.de>
 <38c7cdc27213697b50517ce103a9d38120f84bd3.camel@pengutronix.de>
 <f3a0bd17-83f5-4afa-e9a6-3eac411d34ff@kontron.de>
 <ca594143751e94a2cf519e03915faa23a91c2836.camel@pengutronix.de>
In-Reply-To: <ca594143751e94a2cf519e03915faa23a91c2836.camel@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <1ED10842D99F904B917DF4EDE9E6E08C@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 94CB467A8C8.AE017
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

On 24.02.20 12:08, Lucas Stach wrote:
> On Mo, 2020-02-24 at 10:53 +0000, Schrempf Frieder wrote:
>> Hi Lucas,
>>
>> On 24.02.20 11:37, Lucas Stach wrote:
>>> Hi Frieder,
>>>
>>> On Mo, 2020-02-24 at 10:28 +0000, Schrempf Frieder wrote:
>>>> On 20.02.20 19:58, Chris Healy wrote:
>>>>> For the jerkey transitions, can you determine if this is a symptom of
>>>>> a low framerate or dropped frames or something else?
>>>>>
>>>>> Perhaps you can start your app with
>>>>> "GALLIUM_HUD=fps,cpu,draw-calls,frametime".  This may give some clues.
>>>>
>>>> The framerate seems ok. I get something between 50 and 70 FPS.
>>>>
>>>> I have a Qt demo app with a menu and an animated 'ball' that moves
>>>> across the screen. When the menu is visible, the ball movement is really
>>>> jerky (ball seems to 'jump back and forth' instead of moving linearly).
>>>>
>>>> As soon as I hide the menu and show the animation fullscreen, the
>>>> movements are perfectly smooth.
>>>>
>>>> Running the same app with software rendering, everything looks good, too.
>>>>
>>>> No idea what that means, though. I probably need to look at the code of
>>>> the app and do some more experiments to get a better idea of what might
>>>> cause the distortion.
>>>>
>>>> Unless some of the graphics experts here already have an idea of what
>>>> can cause and/or how to debug such an issue!?
>>>
>>> Which driver is used for the display side? It seems like the display
>>> side doesn't properly handle the dma fences used to synchronize scanout
>>> and rendering.
>>
>> I ported/picked the drivers for the LCDIF and DSI controllers from
>> development branch of the 5.4-based vendor kernel [1] to our own
>> v5.4-based kernel [2]. So it is quite probable, that something could be
>> wrong here.
> 
> Please just use DRM_MXSFB for the display side, instead of the
> downstream driver.

Hm, good idea. I somehow forgot about the fact, that there is an 
upstream driver for the LCDIF controller. On first try I couldn't get it 
to run on the i.MX8MM, but I suspect that's due to some reset, 
power-domain or clock setup, that is missing upstream. I will see if I 
can get any further with this.

Thanks,
Frieder
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
