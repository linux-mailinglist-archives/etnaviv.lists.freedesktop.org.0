Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D3E3B34CC
	for <lists+etnaviv@lfdr.de>; Thu, 24 Jun 2021 19:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE616EC6F;
	Thu, 24 Jun 2021 17:30:12 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299A26EC6C;
 Thu, 24 Jun 2021 17:30:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWszqQlXYZ7WngzsJnL+A7rsPEaJtZevsVxAhDZTi8A1mtEYfoHlN4tyqPVpjjvb74gHZ8fcmrJGVBEPAMbMOfjIhRZI42Tq/D1HrOKMaozf5LGiw3PRQnZbi/riAKIKe2QXqXdE/3tBgo+fvSCV2a5PHjZc+IOQB6K58npD1UdXFwi2VmHdofIiJglHJj4XSAOQhNsdBSm7FIgbVzzmN0KgmOrHesP+5LL09BOkG7NfsSWGxroSGVZOQ9tYUDYZnAus8D+NuHa5vuWQN0zVmJnQNMogxdtVSLeG3z+k9QwG5XjgrKKhLRqcMYTov/TjYDx/x8yxI48NnzWuUB5I8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IptjvwAyP4LOYa6JWdZeN9nEKeWZTi/B2gsgUWphPcw=;
 b=NLiWL5KxcNP1wtjerCxfj0ZRggs+3q/JSx5cC1r7QRVgt7BrVN5EDXDlF5DZe8XabkZEHLZqGQNiujzhjJQLu0+J17ECLRQX5vs3HEH6+59BukkA2oxovxxuW2mxRY6CET5A5zTZ6vx//NAE57/y/SR9aL+0UOm+uVB7gxH++wIJInS+nKBjCg+ELBrZtefQ85euBnfPMoVd65eIXAhh02lnjFAdc3sWrLktq9gyCKwHFzuEK8U7oKj2UWqXHFFPd7HFDLFlRjaySH6WkhRdkRmaAFI7t6rljNvFTmGOLTZsHeBggE/3/BTh2M0c9JO7/KEJEwOB6ZyDpj0PBAIG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IptjvwAyP4LOYa6JWdZeN9nEKeWZTi/B2gsgUWphPcw=;
 b=GXz9jJKLE3mP5Ks/sDqVzBg/zy8dI9MbrtI257nFzq4pnH8caMaPzBSVcywQV060STldwaBrxtAtxttzRxJUstkP7ngDPjtpGVdPHtlweSQMS/vJ+uQYKxNdmb6qobIabvArwh7NY8xyhWFgAFfVt5oy6hAPH6BGFhcmbUu6pdM=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 17:30:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 17:30:05 +0000
Subject: Re: [PATCH 01/11] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <834f5d78-9052-8e7a-fd34-c5b4f37857cf@amd.com>
Date: Thu, 24 Jun 2021 19:29:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624140025.438303-2-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c089:94ee:b4ef:e121]
X-ClientProxiedBy: PR0P264CA0195.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c089:94ee:b4ef:e121]
 (2a02:908:1252:fb60:c089:94ee:b4ef:e121) by
 PR0P264CA0195.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 17:30:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02379eb7-8744-4dc3-ab65-08d93735b460
X-MS-TrafficTypeDiagnostic: MN2PR12MB4440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4440FC0231EB04CE4C1E3B2583079@MN2PR12MB4440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QQcwwNyBm1lz+lAP+9TbEAB0LbxgRG2uY3vcW2uRLR37dO71kNC/e/r5Z55Cx8C4gxmYlnfiCBj5T7xNY8dQZP7idQu+FszRArZz/HdGLDPmrFT96R9OllA+GE2JJl8kz3Cgl6jNXojloGInHXuWikILLrNP2t/A6vqJEItnAAdPhd+zEcCCMItI2QOXUXabVR6LyekmJ73fWjMqpT5r+7xKXdX3g4Hsjq/WJJFDlZpIAJA7gojDL6ElAWMl8MIV0Ys9bprfQjpRIsuHmCKm4b30z+2H/0/s+wniV72Co+9qhUmm5DpGbGS7fkv/88qqCSFtCTAWMGdKw/NvjceKj9NT7qMB3sejjSFCRSyMKFzbAM/cPESD16vz3XsmDoKPfh6PO1PyOdB3YGfOQs0i/H6APxYpacC13tvdVneSSxAobJr/sOUsg4J8f7zQJ0vgPDXaR5RRVF4T2hsWKUj3/5GEzVIHjsxlvqCdeH9kF/8WB3gBGxe5nwOBTO8PPVgIzmzYwWSgNqwn2XK4Niru+PSQNCRQbXCwH5+YL5BlE74pd6ZFCmvAIkG4Su/gp9QC+p+Yv5o9/s5raWkYFB98G/noBIH1Ws3b6ePYoJA36C12Q938Daf/idCCEiISuSwH4qIVpO+SnDZkJmbTfNU9Fgm5N3S4C+Tv/fj0HuKJFXwQF8EtTLbuNf1Jg6tbXcPi4MihVPcz2q60KOrzApayrQBMDVR7+NbzWR+Kg5xSfig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(5660300002)(8936002)(6666004)(8676002)(30864003)(83380400001)(66574015)(66476007)(6486002)(36756003)(2906002)(16526019)(478600001)(86362001)(186003)(4326008)(31686004)(31696002)(38100700002)(7416002)(7406005)(316002)(110136005)(54906003)(2616005)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTdFeWd6WEtvc3BydkZGMzBHUHZXbjJqQVJldDdyWmVueFlmcVR2TVA0YURi?=
 =?utf-8?B?VWlISmV3YjhsaWxncFFGWXJPbURrcGZPU25EaEJESFhybzFBRVZ3NmRxYVkv?=
 =?utf-8?B?TndHNXZCVnZSSlEwUitCWDdpTW91YUNDaTZBVEh3eVVqUXFTVlFxcVc5TDBF?=
 =?utf-8?B?MDYrbC80c0ZmMWkvTTBka1l2a3VEWFFzWDBQNnNwQkhSMW00c0NROVJuMkNV?=
 =?utf-8?B?a3Q2SGo3OWhQNVVHbkZyMyt1dTBJdWM1NmdlNHAwTS9hUDVpcVVNQk84NXAw?=
 =?utf-8?B?aW9hVUVZZjF1Q0dpcmFKS09hT1ErZGloMWxEa1hyazFPZDczYW1UNFZWS2pQ?=
 =?utf-8?B?M0lqNHdrQVdRUFJPc3lVV1I3WlVGTFoxZ2YxNlFiMWUyWDl6bDFaZFhpeTVW?=
 =?utf-8?B?NDZZS2gxKzFtLzhPcytDdGkrUWNUZ3ZRdGdEdm5zY2tLRzVkK1RMY1l1MVRK?=
 =?utf-8?B?NTdmUWk5UjJHV2lHcjRicDY0V2dLY0lZWVQwUTdYUFJmdkM4V2lnM0R4OXhu?=
 =?utf-8?B?d2lybmRiNTdZLyt1TEtDd2NLR2Mvai8xWjdrVEdqV0tYT3JremtWejNzUUpX?=
 =?utf-8?B?V1BCc0RaZmtHeHpKWWJFZndJR2lPUUJ6MGkrWmJIR0hGblVtdUJhOHJCZG8w?=
 =?utf-8?B?Tkx1UjltNUVmK2hKRFdBTGd4YmhaRVhwdHBtcmZwV3FqVzBqRXNmdVFyN3Qx?=
 =?utf-8?B?Q3Axc1ZibUpmODRNWTJ4amIvU3R1T0hTSHF5Kzk0Rlh0T0Y4MDlUbE5uMFhM?=
 =?utf-8?B?WTBac0tCTHZPV3JkUktRMGVqcXVUODNCU3kvRWxLRDJncTBka2pHaGJSUm9q?=
 =?utf-8?B?TmRTdGRZRnF0N2VQU3pmTnBQZVFwRk5WTFhIVlllWHhvcTZkK1BEYlBYN3ZG?=
 =?utf-8?B?SVZMV0thaCs1MWJXTExEbWRoQ2V3Vk9aNTJkYzZqVjUzN2haMGg5aHV0RGdO?=
 =?utf-8?B?MjZZVDVZM0NuZS9Hd0tGU0tJWU9rK3lLYUlhakhlcERRcmZFTk1GeFc3ZFJn?=
 =?utf-8?B?d1MyMU8rNVp5b29SOU9WNjdzL2djL0k4SnhUcm5mZ3pOTkVQSEcwaVNTNVdw?=
 =?utf-8?B?dGhVV01uMEJNbTdnRHZZY2JtZkhobUFVQXVrY241bGZZbHNvRXpZMTMrc3RS?=
 =?utf-8?B?bG9Rd2VOZGc1WkR2R2tFQTYyZGZQTGFlOTUwNElDcUViWktVckxNSUJxQXl2?=
 =?utf-8?B?Z1FDNExFTngrUjExbkhheU1iYk0rWHFEaStrNVBMTlViY1V6a01kd3A2cEtZ?=
 =?utf-8?B?dFQ4ODRxb3BkZHJCa01KZ3JTMlllNmlYUjFSeGdoeE1YWDRNMkgxdEl3MGR6?=
 =?utf-8?B?U3doc3JWRGUyK2RtbGZBNEgySmZFdENkSTEyWHR1N05FeFhMRVdlbVdkUWx5?=
 =?utf-8?B?b1hJU2lVRjNZY2lFVUFMdmkzeGs4d09CZlV5NXk4aDBnUDQ1VVNJRTN3ZHR4?=
 =?utf-8?B?cHRxdWlGWXU5U2czbFFFQ3pZbW5BMDRRZzdzU04vN0syWUh2b0VnQlA5YUZv?=
 =?utf-8?B?bHFoWWNQQkJuVEdGVjl2OG1sblhMU1NCbGd0UEM5ekVxYjNTQ3JnQmNlZUlY?=
 =?utf-8?B?b21xQzRMTlV5bGJEVmt5czJCRDB3L3U0bW9oMkxVdFNPZEVzcHpheW10QUZ3?=
 =?utf-8?B?WnIzSExwdTNabkFtYXJtc1g5V1g4WTRPWFg5eUJUeVVQdE1tdjJvS3VFOUlJ?=
 =?utf-8?B?R1hhUTV5amhuRFBSUkZBOEdWdzRCckZ2VnRpcXZLR1JRcjd5T0RaWWNwVG9G?=
 =?utf-8?B?SjM5TUhyNEpDd2IzdExUQ21qdm91MnkyWDRxeHJjMmVpNzZGSmZQRWNVZk5j?=
 =?utf-8?B?UWNuL3RQWm8zQ09CUHB3RndzT05tVFdjRDE5U3F5OHl0OW1rcGU0Y2Y2blgr?=
 =?utf-8?Q?E2kEzEYl2Wd+z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02379eb7-8744-4dc3-ab65-08d93735b460
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 17:30:05.2622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2HbGBuzP9JptYReDcG48C3FZ0Je9oZEGoEniIX/nQUWTZF82jhha9jZXspawBZc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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
Cc: Adam Borowski <kilobyte@angband.pl>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sonny Jiang <sonny.jiang@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Rob Herring <robh@kernel.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 lima@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nick Terrell <terrelln@fb.com>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-media@vger.kernel.org,
 Lucas Stach <l.stach@pengutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gMjQuMDYuMjEgdW0gMTY6MDAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IFRoaXMgaXMgYSB2
ZXJ5IGNvbmZ1c2luZ2x5IG5hbWVkIGZ1bmN0aW9uLCBiZWNhdXNlIG5vdCBqdXN0IGRvZXMgaXQK
PiBpbml0IGFuIG9iamVjdCwgaXQgYXJtcyBpdCBhbmQgcHJvdmlkZXMgYSBwb2ludCBvZiBubyBy
ZXR1cm4gZm9yCj4gcHVzaGluZyBhIGpvYiBpbnRvIHRoZSBzY2hlZHVsZXIuIEl0IHdvdWxkIGJl
IG5pY2UgaWYgdGhhdCdzIGEgYml0Cj4gY2xlYXJlciBpbiB0aGUgaW50ZXJmYWNlLgoKV2Ugb3Jp
Z2luYWxseSBoYWQgdGhhdCBpbiB0aGUgcHVzaF9qb2IgaW50ZXJmYWNlLCBidXQgbW92ZWQgdGhh
dCB0byBpbml0IApmb3Igc29tZSByZWFzb24gSSBkb24ndCByZW1lbWJlci4KCj4gQnV0IHRoZSBy
ZWFsIHJlYXNvbiBpcyB0aGF0IEkgd2FudCB0byBwdXNoIHRoZSBkZXBlbmRlbmN5IHRyYWNraW5n
Cj4gaGVscGVycyBpbnRvIHRoZSBzY2hlZHVsZXIgY29kZSwgYW5kIHRoYXQgbWVhbnMgZHJtX3Nj
aGVkX2pvYl9pbml0Cj4gbXVzdCBiZSBjYWxsZWQgYSBsb3QgZWFybGllciwgd2l0aG91dCBhcm1p
bmcgdGhlIGpvYi4KCkknbSByZWFsbHkgcXVlc3Rpb25pbmcgbXlzZWxmIGlmIEkgbGlrZSB0aGF0
IG5hbWluZy4KCldoYXQgYWJvdXQgdXNpbmcgZHJtX3NjaGVkX2pvYl9hZGRfZGVwZW5kZW5jeSBp
bnN0ZWFkPwoKQ2hyaXN0aWFuLgoKPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRy
b25peC5kZT4KPiBDYzogUnVzc2VsbCBLaW5nIDxsaW51eCtldG5hdml2QGFybWxpbnV4Lm9yZy51
az4KPiBDYzogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4K
PiBDYzogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5j
b20+Cj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gQ2M6IEFseXNz
YSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBD
YzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IE1h
c2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cj4gQ2M6IEtlZXMgQ29vayA8a2Vl
c2Nvb2tAY2hyb21pdW0ub3JnPgo+IENjOiBBZGFtIEJvcm93c2tpIDxraWxvYnl0ZUBhbmdiYW5k
LnBsPgo+IENjOiBOaWNrIFRlcnJlbGwgPHRlcnJlbGxuQGZiLmNvbT4KPiBDYzogTWF1cm8gQ2Fy
dmFsaG8gQ2hlaGFiIDxtY2hlaGFiK2h1YXdlaUBrZXJuZWwub3JnPgo+IENjOiBQYXVsIE1lbnpl
bCA8cG1lbnplbEBtb2xnZW4ubXBnLmRlPgo+IENjOiBTYW1pIFRvbHZhbmVuIDxzYW1pdG9sdmFu
ZW5AZ29vZ2xlLmNvbT4KPiBDYzogVmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9y
Zz4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiBE
YXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IENjOiBOaXJtb3kgRGFzIDxuaXJtb3ku
ZGFzQGFtZC5jb20+Cj4gQ2M6IERlZXBhayBSIFZhcm1hIDxtaDEyZ3gyODI1QGdtYWlsLmNvbT4K
PiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiBDYzogS2V2aW4gV2FuZyA8
a2V2aW4xLndhbmdAYW1kLmNvbT4KPiBDYzogQ2hlbiBMaSA8Y2hlbmxpQHVuaW9udGVjaC5jb20+
Cj4gQ2M6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+Cj4gQ2M6ICJNYXJlayBP
bMWhw6FrIiA8bWFyZWsub2xzYWtAYW1kLmNvbT4KPiBDYzogRGVubmlzIExpIDxEZW5uaXMuTGlA
YW1kLmNvbT4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KPiBDYzogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFt
ZC5jb20+Cj4gQ2M6IFNvbm55IEppYW5nIDxzb25ueS5qaWFuZ0BhbWQuY29tPgo+IENjOiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IENjOiBUaWFuIFRh
byA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4KPiBDYzogSmFjayBaaGFuZyA8SmFjay5aaGFuZzFA
YW1kLmNvbT4KPiBDYzogZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGltYUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4g
Q2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IC0tLQo+ICAgLmdpdGlnbm9yZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9jcy5jICAgfCAgMiArKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2pvYi5jICB8ICAyICsrCj4gICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X3NjaGVkLmMgIHwgIDIgKysKPiAgIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfc2No
ZWQuYyAgICAgICAgfCAgMiArKwo+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2pvYi5jICB8ICAyICsrCj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0
eS5jIHwgIDYgKysrLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2ZlbmNl
LmMgIHwgMTUgKysrKysrKysrKy0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX21haW4uYyAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKy0KPiAgIGluY2x1ZGUvZHJt
L2dwdV9zY2hlZHVsZXIuaCAgICAgICAgICAgICAgfCAgNiArKysrKy0KPiAgIDEwIGZpbGVzIGNo
YW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
Ly5naXRpZ25vcmUgYi8uZ2l0aWdub3JlCj4gaW5kZXggN2FmZDQxMmRhZGQyLi41MjQzM2E5MzAy
OTkgMTAwNjQ0Cj4gLS0tIGEvLmdpdGlnbm9yZQo+ICsrKyBiLy5naXRpZ25vcmUKPiBAQCAtNjYs
NiArNjYsNyBAQCBtb2R1bGVzLm9yZGVyCj4gICAvbW9kdWxlcy5idWlsdGluCj4gICAvbW9kdWxl
cy5idWlsdGluLm1vZGluZm8KPiAgIC9tb2R1bGVzLm5zZGVwcwo+ICsqLmJ1aWx0aW4KPiAgIAo+
ICAgIwo+ICAgIyBSUE0gc3BlYyBmaWxlIChtYWtlIHJwbS1wa2cpCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2NzLmMKPiBpbmRleCBjNTM4NmQxM2ViNGEuLmE0ZWMwOTJhZjlhNyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCj4gQEAgLTEyMjYsNiAr
MTIyNiw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3N1Ym1pdChzdHJ1Y3QgYW1kZ3B1X2NzX3Bh
cnNlciAqcCwKPiAgIAlpZiAocikKPiAgIAkJZ290byBlcnJvcl91bmxvY2s7Cj4gICAKPiArCWRy
bV9zY2hlZF9qb2JfYXJtKCZqb2ItPmJhc2UpOwo+ICsKPiAgIAkvKiBObyBtZW1vcnkgYWxsb2Nh
dGlvbiBpcyBhbGxvd2VkIHdoaWxlIGhvbGRpbmcgdGhlIG5vdGlmaWVyIGxvY2suCj4gICAJICog
VGhlIGxvY2sgaXMgaGVsZCB1bnRpbCBhbWRncHVfY3Nfc3VibWl0IGlzIGZpbmlzaGVkIGFuZCBm
ZW5jZSBpcwo+ICAgCSAqIGFkZGVkIHRvIEJPcy4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2pvYi5jCj4gaW5kZXggZDMzZTZkOTdjYzg5Li41ZGRiOTU1ZDIzMTUgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCj4gQEAgLTE3MCw2ICsxNzAsOCBA
QCBpbnQgYW1kZ3B1X2pvYl9zdWJtaXQoc3RydWN0IGFtZGdwdV9qb2IgKmpvYiwgc3RydWN0IGRy
bV9zY2hlZF9lbnRpdHkgKmVudGl0eSwKPiAgIAlpZiAocikKPiAgIAkJcmV0dXJuIHI7Cj4gICAK
PiArCWRybV9zY2hlZF9qb2JfYXJtKCZqb2ItPmJhc2UpOwo+ICsKPiAgIAkqZiA9IGRtYV9mZW5j
ZV9nZXQoJmpvYi0+YmFzZS5zX2ZlbmNlLT5maW5pc2hlZCk7Cj4gICAJYW1kZ3B1X2pvYl9mcmVl
X3Jlc291cmNlcyhqb2IpOwo+ICAgCWRybV9zY2hlZF9lbnRpdHlfcHVzaF9qb2IoJmpvYi0+YmFz
ZSwgZW50aXR5KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZp
dl9zY2hlZC5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9zY2hlZC5jCj4gaW5k
ZXggMTk4MjZlNTA0ZWZjLi5hZjE2NzFmMDFjN2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2V0bmF2aXYvZXRuYXZpdl9zY2hlZC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9zY2hlZC5jCj4gQEAgLTE2Myw2ICsxNjMsOCBAQCBpbnQgZXRuYXZpdl9zY2hl
ZF9wdXNoX2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqc2NoZWRfZW50aXR5LAo+ICAgCWlm
IChyZXQpCj4gICAJCWdvdG8gb3V0X3VubG9jazsKPiAgIAo+ICsJZHJtX3NjaGVkX2pvYl9hcm0o
JnN1Ym1pdC0+c2NoZWRfam9iKTsKPiArCj4gICAJc3VibWl0LT5vdXRfZmVuY2UgPSBkbWFfZmVu
Y2VfZ2V0KCZzdWJtaXQtPnNjaGVkX2pvYi5zX2ZlbmNlLT5maW5pc2hlZCk7Cj4gICAJc3VibWl0
LT5vdXRfZmVuY2VfaWQgPSBpZHJfYWxsb2NfY3ljbGljKCZzdWJtaXQtPmdwdS0+ZmVuY2VfaWRy
LAo+ICAgCQkJCQkJc3VibWl0LT5vdXRfZmVuY2UsIDAsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9saW1hL2xpbWFfc2NoZWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfc2No
ZWQuYwo+IGluZGV4IGVjZjMyNjczMzRmZi4uYmQxYWYxZmQ4YzBmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfc2NoZWQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9s
aW1hL2xpbWFfc2NoZWQuYwo+IEBAIC0xMjksNiArMTI5LDggQEAgaW50IGxpbWFfc2NoZWRfdGFz
a19pbml0KHN0cnVjdCBsaW1hX3NjaGVkX3Rhc2sgKnRhc2ssCj4gICAJCXJldHVybiBlcnI7Cj4g
ICAJfQo+ICAgCj4gKwlkcm1fc2NoZWRfam9iX2FybSgmdGFzay0+YmFzZSk7Cj4gKwo+ICAgCXRh
c2stPm51bV9ib3MgPSBudW1fYm9zOwo+ICAgCXRhc2stPnZtID0gbGltYV92bV9nZXQodm0pOwo+
ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+IGluZGV4IGJlYjYy
YzhmYzg1MS4uMWU5NTA1MzRiOWIwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9qb2IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9qb2IuYwo+IEBAIC0yNDQsNiArMjQ0LDggQEAgaW50IHBhbmZyb3N0X2pvYl9wdXNoKHN0
cnVjdCBwYW5mcm9zdF9qb2IgKmpvYikKPiAgIAkJZ290byB1bmxvY2s7Cj4gICAJfQo+ICAgCj4g
Kwlkcm1fc2NoZWRfam9iX2FybSgmam9iLT5iYXNlKTsKPiArCj4gICAJam9iLT5yZW5kZXJfZG9u
ZV9mZW5jZSA9IGRtYV9mZW5jZV9nZXQoJmpvYi0+YmFzZS5zX2ZlbmNlLT5maW5pc2hlZCk7Cj4g
ICAKPiAgIAlyZXQgPSBwYW5mcm9zdF9hY3F1aXJlX29iamVjdF9mZW5jZXMoam9iLT5ib3MsIGpv
Yi0+Ym9fY291bnQsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfZW50aXR5LmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCj4g
aW5kZXggNzk1NTRhYTRkYmIxLi5mNzM0N2MyODQ4ODYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKPiBAQCAtNDg1LDkgKzQ4NSw5IEBAIHZvaWQgZHJtX3Nj
aGVkX2VudGl0eV9zZWxlY3RfcnEoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkKPiAg
ICAqIEBzY2hlZF9qb2I6IGpvYiB0byBzdWJtaXQKPiAgICAqIEBlbnRpdHk6IHNjaGVkdWxlciBl
bnRpdHkKPiAgICAqCj4gLSAqIE5vdGU6IFRvIGd1YXJhbnRlZSB0aGF0IHRoZSBvcmRlciBvZiBp
bnNlcnRpb24gdG8gcXVldWUgbWF0Y2hlcwo+IC0gKiB0aGUgam9iJ3MgZmVuY2Ugc2VxdWVuY2Ug
bnVtYmVyIHRoaXMgZnVuY3Rpb24gc2hvdWxkIGJlCj4gLSAqIGNhbGxlZCB3aXRoIGRybV9zY2hl
ZF9qb2JfaW5pdCB1bmRlciBjb21tb24gbG9jay4KPiArICogTm90ZTogVG8gZ3VhcmFudGVlIHRo
YXQgdGhlIG9yZGVyIG9mIGluc2VydGlvbiB0byBxdWV1ZSBtYXRjaGVzIHRoZSBqb2Incwo+ICsg
KiBmZW5jZSBzZXF1ZW5jZSBudW1iZXIgdGhpcyBmdW5jdGlvbiBzaG91bGQgYmUgY2FsbGVkIHdp
dGggZHJtX3NjaGVkX2pvYl9hcm0oKQo+ICsgKiB1bmRlciBjb21tb24gbG9jay4KPiAgICAqCj4g
ICAgKiBSZXR1cm5zIDAgZm9yIHN1Y2Nlc3MsIG5lZ2F0aXZlIGVycm9yIGNvZGUgb3RoZXJ3aXNl
Lgo+ICAgICovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
ZmVuY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZmVuY2UuYwo+IGluZGV4
IDY5ZGUyYzc2NzMxZi4uMGJhODEwYzE5OGJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfZmVuY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfZmVuY2UuYwo+IEBAIC0xNTIsMTEgKzE1MiwxMCBAQCBzdHJ1Y3QgZHJtX3NjaGVk
X2ZlbmNlICp0b19kcm1fc2NoZWRfZmVuY2Uoc3RydWN0IGRtYV9mZW5jZSAqZikKPiAgIH0KPiAg
IEVYUE9SVF9TWU1CT0wodG9fZHJtX3NjaGVkX2ZlbmNlKTsKPiAgIAo+IC1zdHJ1Y3QgZHJtX3Nj
aGVkX2ZlbmNlICpkcm1fc2NoZWRfZmVuY2VfY3JlYXRlKHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5
ICplbnRpdHksCj4gLQkJCQkJICAgICAgIHZvaWQgKm93bmVyKQo+ICtzdHJ1Y3QgZHJtX3NjaGVk
X2ZlbmNlICpkcm1fc2NoZWRfZmVuY2VfYWxsb2Moc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVu
dGl0eSwKPiArCQkJCQkgICAgICB2b2lkICpvd25lcikKPiAgIHsKPiAgIAlzdHJ1Y3QgZHJtX3Nj
aGVkX2ZlbmNlICpmZW5jZSA9IE5VTEw7Cj4gLQl1bnNpZ25lZCBzZXE7Cj4gICAKPiAgIAlmZW5j
ZSA9IGttZW1fY2FjaGVfemFsbG9jKHNjaGVkX2ZlbmNlX3NsYWIsIEdGUF9LRVJORUwpOwo+ICAg
CWlmIChmZW5jZSA9PSBOVUxMKQo+IEBAIC0xNjYsMTMgKzE2NSwxOSBAQCBzdHJ1Y3QgZHJtX3Nj
aGVkX2ZlbmNlICpkcm1fc2NoZWRfZmVuY2VfY3JlYXRlKHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5
ICplbnRpdHksCj4gICAJZmVuY2UtPnNjaGVkID0gZW50aXR5LT5ycS0+c2NoZWQ7Cj4gICAJc3Bp
bl9sb2NrX2luaXQoJmZlbmNlLT5sb2NrKTsKPiAgIAo+ICsJcmV0dXJuIGZlbmNlOwo+ICt9Cj4g
Kwo+ICt2b2lkIGRybV9zY2hlZF9mZW5jZV9pbml0KHN0cnVjdCBkcm1fc2NoZWRfZmVuY2UgKmZl
bmNlLAo+ICsJCQkgIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHkpCj4gK3sKPiArCXVu
c2lnbmVkIHNlcTsKPiArCj4gICAJc2VxID0gYXRvbWljX2luY19yZXR1cm4oJmVudGl0eS0+ZmVu
Y2Vfc2VxKTsKPiAgIAlkbWFfZmVuY2VfaW5pdCgmZmVuY2UtPnNjaGVkdWxlZCwgJmRybV9zY2hl
ZF9mZW5jZV9vcHNfc2NoZWR1bGVkLAo+ICAgCQkgICAgICAgJmZlbmNlLT5sb2NrLCBlbnRpdHkt
PmZlbmNlX2NvbnRleHQsIHNlcSk7Cj4gICAJZG1hX2ZlbmNlX2luaXQoJmZlbmNlLT5maW5pc2hl
ZCwgJmRybV9zY2hlZF9mZW5jZV9vcHNfZmluaXNoZWQsCj4gICAJCSAgICAgICAmZmVuY2UtPmxv
Y2ssIGVudGl0eS0+ZmVuY2VfY29udGV4dCArIDEsIHNlcSk7Cj4gLQo+IC0JcmV0dXJuIGZlbmNl
Owo+ICAgfQo+ICAgCj4gICBtb2R1bGVfaW5pdChkcm1fc2NoZWRfZmVuY2Vfc2xhYl9pbml0KTsK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IGluZGV4IDYxNDIwYTljMTAy
MS4uNzBlZWZlZDE3ZTA2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWlu
LmMKPiBAQCAtNDgsOSArNDgsMTEgQEAKPiAgICNpbmNsdWRlIDxsaW51eC93YWl0Lmg+Cj4gICAj
aW5jbHVkZSA8bGludXgvc2NoZWQuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9jb21wbGV0aW9uLmg+
Cj4gKyNpbmNsdWRlIDxsaW51eC9kbWEtcmVzdi5oPgo+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgv
c2NoZWQvdHlwZXMuaD4KPiAgIAo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiArI2lu
Y2x1ZGUgPGRybS9kcm1fZ2VtLmg+Cj4gICAjaW5jbHVkZSA8ZHJtL2dwdV9zY2hlZHVsZXIuaD4K
PiAgICNpbmNsdWRlIDxkcm0vc3BzY19xdWV1ZS5oPgo+ICAgCj4gQEAgLTU5NCw3ICs1OTYsNyBA
QCBpbnQgZHJtX3NjaGVkX2pvYl9pbml0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2IsCj4gICAJ
am9iLT5zY2hlZCA9IHNjaGVkOwo+ICAgCWpvYi0+ZW50aXR5ID0gZW50aXR5Owo+ICAgCWpvYi0+
c19wcmlvcml0eSA9IGVudGl0eS0+cnEgLSBzY2hlZC0+c2NoZWRfcnE7Cj4gLQlqb2ItPnNfZmVu
Y2UgPSBkcm1fc2NoZWRfZmVuY2VfY3JlYXRlKGVudGl0eSwgb3duZXIpOwo+ICsJam9iLT5zX2Zl
bmNlID0gZHJtX3NjaGVkX2ZlbmNlX2FsbG9jKGVudGl0eSwgb3duZXIpOwo+ICAgCWlmICgham9i
LT5zX2ZlbmNlKQo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAgIAlqb2ItPmlkID0gYXRvbWljNjRf
aW5jX3JldHVybigmc2NoZWQtPmpvYl9pZF9jb3VudCk7Cj4gQEAgLTYwNSw2ICs2MDcsMjUgQEAg
aW50IGRybV9zY2hlZF9qb2JfaW5pdChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iLAo+ICAgfQo+
ICAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfam9iX2luaXQpOwo+ICAgCj4gKy8qKgo+ICsgKiBk
cm1fc2NoZWRfam9iX2FybSAtIGFybSBhIHNjaGVkdWxlciBqb2IgZm9yIGV4ZWN1dGlvbgo+ICsg
KiBAam9iOiBzY2hlZHVsZXIgam9iIHRvIGFybQo+ICsgKgo+ICsgKiBUaGlzIGFybXMgYSBzY2hl
ZHVsZXIgam9iIGZvciBleGVjdXRpb24uIFNwZWNpZmljYWxseSBpdCBpbml0aWFsaXplcyB0aGUK
PiArICogJmRybV9zY2hlZF9qb2Iuc19mZW5jZSBvZiBAam9iLCBzbyB0aGF0IGl0IGNhbiBiZSBh
dHRhY2hlZCB0byBzdHJ1Y3QgZG1hX3Jlc3YKPiArICogb3Igb3RoZXIgcGxhY2VzIHRoYXQgbmVl
ZCB0byB0cmFjayB0aGUgY29tcGxldGlvbiBvZiB0aGlzIGpvYi4KPiArICoKPiArICogUmVmZXIg
dG8gZHJtX3NjaGVkX2VudGl0eV9wdXNoX2pvYigpIGRvY3VtZW50YXRpb24gZm9yIGxvY2tpbmcK
PiArICogY29uc2lkZXJhdGlvbnMuCj4gKyAqCj4gKyAqIFRoaXMgY2FuIG9ubHkgYmUgY2FsbGVk
IGlmIGRybV9zY2hlZF9qb2JfaW5pdCgpIHN1Y2NlZWRlZC4KPiArICovCj4gK3ZvaWQgZHJtX3Nj
aGVkX2pvYl9hcm0oc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYikKPiArewo+ICsJZHJtX3NjaGVk
X2ZlbmNlX2luaXQoam9iLT5zX2ZlbmNlLCBqb2ItPmVudGl0eSk7Cj4gK30KPiArRVhQT1JUX1NZ
TUJPTChkcm1fc2NoZWRfam9iX2FybSk7Cj4gKwo+ICAgLyoqCj4gICAgKiBkcm1fc2NoZWRfam9i
X2NsZWFudXAgLSBjbGVhbiB1cCBzY2hlZHVsZXIgam9iIHJlc291cmNlcwo+ICAgICoKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oIGIvaW5jbHVkZS9kcm0vZ3B1X3Nj
aGVkdWxlci5oCj4gaW5kZXggZDE4YWY0OWZkMDA5Li44MDQzOGQxMjZjOWQgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZ3B1X3Nj
aGVkdWxlci5oCj4gQEAgLTMxMyw2ICszMTMsNyBAQCB2b2lkIGRybV9zY2hlZF9maW5pKHN0cnVj
dCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpOwo+ICAgaW50IGRybV9zY2hlZF9qb2JfaW5pdChz
dHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iLAo+ICAgCQkgICAgICAgc3RydWN0IGRybV9zY2hlZF9l
bnRpdHkgKmVudGl0eSwKPiAgIAkJICAgICAgIHZvaWQgKm93bmVyKTsKPiArdm9pZCBkcm1fc2No
ZWRfam9iX2FybShzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iKTsKPiAgIHZvaWQgZHJtX3NjaGVk
X2VudGl0eV9tb2RpZnlfc2NoZWQoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSwKPiAg
IAkJCQkgICAgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICoqc2NoZWRfbGlzdCwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG51bV9zY2hlZF9saXN0
KTsKPiBAQCAtMzUyLDggKzM1MywxMSBAQCB2b2lkIGRybV9zY2hlZF9lbnRpdHlfc2V0X3ByaW9y
aXR5KHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHksCj4gICAJCQkJICAgZW51bSBkcm1f
c2NoZWRfcHJpb3JpdHkgcHJpb3JpdHkpOwo+ICAgYm9vbCBkcm1fc2NoZWRfZW50aXR5X2lzX3Jl
YWR5KHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHkpOwo+ICAgCj4gLXN0cnVjdCBkcm1f
c2NoZWRfZmVuY2UgKmRybV9zY2hlZF9mZW5jZV9jcmVhdGUoCj4gK3N0cnVjdCBkcm1fc2NoZWRf
ZmVuY2UgKmRybV9zY2hlZF9mZW5jZV9hbGxvYygKPiAgIAlzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0
eSAqc19lbnRpdHksIHZvaWQgKm93bmVyKTsKPiArdm9pZCBkcm1fc2NoZWRfZmVuY2VfaW5pdChz
dHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICpmZW5jZSwKPiArCQkJICBzdHJ1Y3QgZHJtX3NjaGVkX2Vu
dGl0eSAqZW50aXR5KTsKPiArCj4gICB2b2lkIGRybV9zY2hlZF9mZW5jZV9zY2hlZHVsZWQoc3Ry
dWN0IGRybV9zY2hlZF9mZW5jZSAqZmVuY2UpOwo+ICAgdm9pZCBkcm1fc2NoZWRfZmVuY2VfZmlu
aXNoZWQoc3RydWN0IGRybV9zY2hlZF9mZW5jZSAqZmVuY2UpOwo+ICAgCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApl
dG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXYK
