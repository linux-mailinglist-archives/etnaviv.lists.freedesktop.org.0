Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC013F45A8
	for <lists+etnaviv@lfdr.de>; Mon, 23 Aug 2021 09:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA0F89830;
	Mon, 23 Aug 2021 07:13:21 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F228289830
 for <etnaviv@lists.freedesktop.org>; Mon, 23 Aug 2021 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1629702797; x=1632294797;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xVK+X4qiMEXD5F8UINDESGP/qVGVufeD4Rl0CZcjw70=;
 b=lKB4bAdK/9T4j8LRnnwNlxSLGTfOc76nAK6eUDNJrlqqgnuu/xm47MdxMOvnIiKL
 VmI1PoHG/NFuN6a7vwoszagcA9t2eAk4dXvKIhcpxhPfe6Lm3BJUD0JQ4/FUbYvV
 TXfuGnESs0WoEIgEYb/N6FHkF+TfXt740HfpQ8hGhuY=;
X-AuditID: c39127d2-b5ab770000001ddb-f8-61234a8df8d4
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 52.35.07643.D8A43216;
 Mon, 23 Aug 2021 09:13:17 +0200 (CEST)
Received: from [172.16.5.104] (172.16.0.116) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 23 Aug
 2021 09:13:17 +0200
Subject: Re: [5.14-rc5] etnaviv-gpu 130000.gpu: recover hung GPU!
To: Lucas Stach <l.stach@pengutronix.de>, <etnaviv@lists.freedesktop.org>
References: <db2091d9-49ac-ca54-4a24-f01c105fcad9@phytec.de>
 <e6aec4ef72db28ceda40cec0de0e9bf0e8bcfd80.camel@pengutronix.de>
 <0b8a77fc-c3ca-b46e-b6de-9d921132e554@phytec.de>
 <718bf18b8aac1c550757f07b82662e2e06c50ce4.camel@pengutronix.de>
From: Wadim Egorov <w.egorov@phytec.de>
Message-ID: <8a2b88de-0c21-bd1e-2b68-7e6375ed2f80@phytec.de>
Date: Mon, 23 Aug 2021 09:13:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <718bf18b8aac1c550757f07b82662e2e06c50ce4.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.16.0.116]
X-ClientProxiedBy: Berlix.phytec.de (172.16.0.117) To Berlix.phytec.de
 (172.16.0.117)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsWyRoChVLfXSznR4OllJYtdM+6wWzyYe5PJ
 gcnjfvdxJo/+vwYBTFFcNimpOZllqUX6dglcGQ8bNjMVrFKs+Hx6BlMD40WpLkZODgkBE4m9
 s3pYuhi5OIQEljNJPNw3gQnCuc8ocXLeGRaQKmEBR4kZ7/ezgdgiAp4SF469AosLCXxmlHiy
 yA/EZhNQl7iz4RsriM0rYCOxbcYndhCbRUBVYsapWYxdjBwcogKREjt3WEKUCEqcnPmEBSTM
 KeAj8a05ESTMLGAhMXP+eUYIW16ieetsZghbXOLWk/lMEFvlJV5cWs4Ccb+CxNzfE5kh7HCJ
 t6d+M09gFJqFZMMsJGNnIRk7C8nYBYwsqxiFcjOTs1OLMrP1CjIqS1KT9VJSNzECg/rwRPVL
 Oxj75ngcYmTiYDzEKMHBrCTC+5dJOVGINyWxsiq1KD++qDQntfgQozQHi5I47/0epkQhgfTE
 ktTs1NSC1CKYLBMHp1QD44zGAL/it/L3Z/jvfzP37n1H4cNPf/eqJckbuj7tO7fNMeYiz5uu
 aYv/bZJVOnRwe0BQfHzdruYfh04npVSZydwMa+Osil/M4br9ZusDpZ5PCh2/zOTkfAUX/f2/
 rMX94nqBOF/GM9P+BU5w/8cVv+vTrwsc9tL2E7aci7Lq41Sdkzedvzw5SomlOCPRUIu5qDgR
 AAKtUjJYAgAA
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

On 8/19/21 3:37 PM, Lucas Stach wrote:
> Am Donnerstag, dem 19.08.2021 um 15:07 +0200 schrieb Wadim Egorov:
>> Hello Lucas,
>>
>> On 8/19/21 1:14 PM, Lucas Stach wrote:
>>> Hi Wadim,
>>>
>>> Am Donnerstag, dem 19.08.2021 um 12:09 +0200 schrieb Wadim Egorov:
>>>> Hi,
>>>>
>>>> we have noticed "recover hung GPU" messages with the latest Linux on a i.MX6
>>>> Solo. The GPU recover message appears after some time running a Qt application
>>>> with QT_QPA_PLATFORM=eglfs and Mesa 21.0.3.
>>>> So far there are no problems with the GUI. Nevertheless, we want to understand
>>>> the cause of the problem.
>>>>
>>>> Below is the output from the viv-unpack tool of a coredump we've saved.
>>>> Unfortunately, I am not familiar with the whole DRM/GPU framework and don't
>>>> really know how to proceed and provide more relevant debug information.
>>>>
>>>> Is this a known problem?
>>>>
>>> Is this something that started showing up after the kernel update, or
>>> are there other system component changes involved, like a Mesa update?
>>>   From the hang location (inside a user cmdstream) a Mesa issue sounds
>>> more likely than a kernel issue.
>> We have already encountered this Issue with older components, Mesa 19.0.8 and
>> Linux v4.19. So I can't really say that this issue started showing up after a
>> specific component change.
>>
>> With the older components the system broke the complete Qt GUI. After the
>> recover message triggered, the GUI was totally visually distorted. This seems to
>> be fixed with newer versions.
>>
>> Since you think it is more likely related to mesa, do you think it makes sense
>> to report this problem in the mesa bug tracker?
>>
> Yes, I think that makes sense. Please open an issue in the freedesktop
> gitlab and attach the complete devcoredump. Since you might not be able
> to add a label in gitlab, please indicate when you opened the issue, so
> I can add the label to avoid the issue getting lost.

I've just opened the Issue and attached the devcoredump file.

   https://gitlab.freedesktop.org/mesa/mesa/-/issues/5275

Regards,
Wadim


>
> Regards,
> Lucas
>
>> Regards,
>> Wadim
>>
>>> Regards,
>>> Lucas
>>>
>>>> Regards,
>>>> Wadim
>>>>
>>>>
>>>> === Register dump
>>>> 0000000c = 00000051
>>>> 00000000 = 00040100
>>>> 00000004 = 7ffffff6 Idle: FE- DE+ PE+ SH- PA+ SE+ RA+ TX+ VG+ IM+ FP+ TS+
>>>> 00000008 = 00002200
>>>> 00000014 = ffffffff
>>>> 00000018 = 0c010000
>>>> 0000001c = e02864ad
>>>> 00000020 = 00000880
>>>> 00000024 = 00005106
>>>> 00000028 = 20110511
>>>> 0000002c = 01012500
>>>> 00000034 = c9f99eff
>>>> 00000038 = c9f99eff
>>>> 00000070 = 00000000
>>>> 00000100 = 00140021
>>>> 00000104 = 00000010
>>>> 00000108 = 000000e4
>>>> 0000010c = 00000000
>>>> 00000400 = 2a200000
>>>> 00000404 = 2a200000
>>>> 00000408 = 2a200000
>>>> 0000040c = 2a200000
>>>> 00000410 = 2a200000
>>>> 00000414 = 3e000000
>>>> 00000418 = 28000000
>>>> 0000041c = 28000000
>>>> 00000420 = 28000000
>>>> 00000424 = 28000000
>>>> 00000428 = 28000000
>>>> 0000042c = 2a230000
>>>> 00000480 = 00000088
>>>> 0000065c = 00000001
>>>> 00000660 = 00000804 Cmd: [adr1 DMA: idle Fetch: valid] Req idle Cal idle
>>>> 00000664 = 02082650 Command DMA address
>>>> 00000668 = 08010380 FE fetched word 0
>>>> 0000066c = 00000003 FE fetched word 1
>>>> 00000670 = 00000000
>>>> === Buffers
>>>>     Num Name  IOVA     Size
>>>>       0 reg   00000000 00000128      296
>>>>       1 mmu   00000000 00200000  2097152
>>>>       2 ring  02080000 00001000     4096
>>>> *  3 cmd   02082000 00000a08     2568
>>>>       4 bomap 00000000 00006300    25344
>>>>       5 bo    80a07000 00003000    12288
>>>>       6 bo    80003000 00003000    12288
>>>>       7 bo    80006000 00100000  1048576
>>>>       8 bo    80a0a000 00001000     4096
>>>>       9 bo    80107000 00280000  2621440
>>>>      10 bo    80a0b000 00280000  2621440
>>>>      11 bo    80106000 00001000     4096
>>>>      12 bo    80607000 00400000  4194304
>>>>      13 bo    02700000 00258000  2457600
>>>>
>>>> Checking MMU entries... ok
>>>>
>

