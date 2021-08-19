Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CD23F19FB
	for <lists+etnaviv@lfdr.de>; Thu, 19 Aug 2021 15:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E93E6E8DF;
	Thu, 19 Aug 2021 13:07:20 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A27F6E8DF
 for <etnaviv@lists.freedesktop.org>; Thu, 19 Aug 2021 13:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1629378435; x=1631970435;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ga7AGO6mo2JTSASiL3RadKFsEnjWKuMMJuhp0AcFVl8=;
 b=kfig6hzq+lkVN4ASOBjqgyBzAXy2A0pRiTvYUOugtnIyLWl663nwWefNoB6R5KWK
 lUovO8BOh9vOx+gDSd9e8S2ntoLK3+iuYS4fQBV/ZVU9GfmIGSim34GFST4mpcpz
 4DneaQLb1nb2d+YKJttL2u5i2Hcbu9DeqjwbkqDpbtU=;
X-AuditID: c39127d2-b5ab770000001ddb-60-611e57834242
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id D3.CB.07643.3875E116;
 Thu, 19 Aug 2021 15:07:15 +0200 (CEST)
Received: from [172.16.5.104] (172.16.0.116) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 19 Aug
 2021 15:07:15 +0200
Subject: Re: [5.14-rc5] etnaviv-gpu 130000.gpu: recover hung GPU!
To: Lucas Stach <l.stach@pengutronix.de>, <etnaviv@lists.freedesktop.org>
References: <db2091d9-49ac-ca54-4a24-f01c105fcad9@phytec.de>
 <e6aec4ef72db28ceda40cec0de0e9bf0e8bcfd80.camel@pengutronix.de>
From: Wadim Egorov <w.egorov@phytec.de>
Message-ID: <0b8a77fc-c3ca-b46e-b6de-9d921132e554@phytec.de>
Date: Thu, 19 Aug 2021 15:07:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e6aec4ef72db28ceda40cec0de0e9bf0e8bcfd80.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.16.0.116]
X-ClientProxiedBy: Berlix.phytec.de (172.16.0.117) To Berlix.phytec.de
 (172.16.0.117)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsWyRoChVLc5XC7R4M4GfYtdM+6wWzyYe5PJ
 gcnjfvdxJo/+vwYBTFFcNimpOZllqUX6dglcGU0//rMXTJOuuPxsEksD4xHRLkZODgkBE4n9
 GxqYuhi5OIQEljNJrL2+iRHCuc8o8a39JBtIlbCAo8SM9/vBbBEBT4kLx16xgNhCAnUSsz9/
 YQax2QTUJe5s+MYKYvMK2EhsenSBEcRmEVCVmPHzLpDNwSEqECmxc4clRImgxMmZT8DGcAr4
 SDy5uhdsPLOAhcTM+ecZIWx5ieats5khbHGJW0/mM0GslZd4cWk5C8QDChJzf09khrDDJd6e
 +s08gVFoFpIVs5CMnYVk7CwkYxcwsqxiFMrNTM5OLcrM1ivIqCxJTdZLSd3ECAzrwxPVL+1g
 7JvjcYiRiYPxEKMEB7OSCO+xP7KJQrwpiZVVqUX58UWlOanFhxilOViUxHnv9zAlCgmkJ5ak
 ZqemFqQWwWSZODilGhijlr44UryWcdYqlq97YxO4xCbvcvjNpqa2j4+fecXFNdqOPP90ViqJ
 VCjn3nj6YPPEPXVvHsqKhHw6zGr9ViHTzabIc4XEHq/bO0/rnH7f9ejbnbSQhbXlD37Mn14z
 qzdJ7eC/GXbderelNur0pV8sePAx5ffLC0t361SmTe5e7yR76mUWU8FxJZbijERDLeai4kQA
 IniHz1kCAAA=
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

Hello Lucas,

On 8/19/21 1:14 PM, Lucas Stach wrote:
> Hi Wadim,
>
> Am Donnerstag, dem 19.08.2021 um 12:09 +0200 schrieb Wadim Egorov:
>> Hi,
>>
>> we have noticed "recover hung GPU" messages with the latest Linux on a i.MX6
>> Solo. The GPU recover message appears after some time running a Qt application
>> with QT_QPA_PLATFORM=eglfs and Mesa 21.0.3.
>> So far there are no problems with the GUI. Nevertheless, we want to understand
>> the cause of the problem.
>>
>> Below is the output from the viv-unpack tool of a coredump we've saved.
>> Unfortunately, I am not familiar with the whole DRM/GPU framework and don't
>> really know how to proceed and provide more relevant debug information.
>>
>> Is this a known problem?
>>
> Is this something that started showing up after the kernel update, or
> are there other system component changes involved, like a Mesa update?
>  From the hang location (inside a user cmdstream) a Mesa issue sounds
> more likely than a kernel issue.

We have already encountered this Issue with older components, Mesa 19.0.8 and 
Linux v4.19. So I can't really say that this issue started showing up after a 
specific component change.

With the older components the system broke the complete Qt GUI. After the 
recover message triggered, the GUI was totally visually distorted. This seems to 
be fixed with newer versions.

Since you think it is more likely related to mesa, do you think it makes sense 
to report this problem in the mesa bug tracker?

Regards,
Wadim

>
> Regards,
> Lucas
>
>> Regards,
>> Wadim
>>
>>
>> === Register dump
>> 0000000c = 00000051
>> 00000000 = 00040100
>> 00000004 = 7ffffff6 Idle: FE- DE+ PE+ SH- PA+ SE+ RA+ TX+ VG+ IM+ FP+ TS+
>> 00000008 = 00002200
>> 00000014 = ffffffff
>> 00000018 = 0c010000
>> 0000001c = e02864ad
>> 00000020 = 00000880
>> 00000024 = 00005106
>> 00000028 = 20110511
>> 0000002c = 01012500
>> 00000034 = c9f99eff
>> 00000038 = c9f99eff
>> 00000070 = 00000000
>> 00000100 = 00140021
>> 00000104 = 00000010
>> 00000108 = 000000e4
>> 0000010c = 00000000
>> 00000400 = 2a200000
>> 00000404 = 2a200000
>> 00000408 = 2a200000
>> 0000040c = 2a200000
>> 00000410 = 2a200000
>> 00000414 = 3e000000
>> 00000418 = 28000000
>> 0000041c = 28000000
>> 00000420 = 28000000
>> 00000424 = 28000000
>> 00000428 = 28000000
>> 0000042c = 2a230000
>> 00000480 = 00000088
>> 0000065c = 00000001
>> 00000660 = 00000804 Cmd: [adr1 DMA: idle Fetch: valid] Req idle Cal idle
>> 00000664 = 02082650 Command DMA address
>> 00000668 = 08010380 FE fetched word 0
>> 0000066c = 00000003 FE fetched word 1
>> 00000670 = 00000000
>> === Buffers
>>    Num Name  IOVA     Size
>>      0 reg   00000000 00000128      296
>>      1 mmu   00000000 00200000  2097152
>>      2 ring  02080000 00001000     4096
>> *  3 cmd   02082000 00000a08     2568
>>      4 bomap 00000000 00006300    25344
>>      5 bo    80a07000 00003000    12288
>>      6 bo    80003000 00003000    12288
>>      7 bo    80006000 00100000  1048576
>>      8 bo    80a0a000 00001000     4096
>>      9 bo    80107000 00280000  2621440
>>     10 bo    80a0b000 00280000  2621440
>>     11 bo    80106000 00001000     4096
>>     12 bo    80607000 00400000  4194304
>>     13 bo    02700000 00258000  2457600
>>
>> Checking MMU entries... ok
>>
>

