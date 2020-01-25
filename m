Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6163014A81D
	for <lists+etnaviv@lfdr.de>; Mon, 27 Jan 2020 17:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A686E0F0;
	Mon, 27 Jan 2020 16:32:51 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092073083.outbound.protection.outlook.com [40.92.73.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A9C6E8B0
 for <etnaviv@lists.freedesktop.org>; Sat, 25 Jan 2020 17:28:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XE3s+GtFlRIiXHo2ITDHPR5c6WGqFwiVq/3uC1cSMqu7pCFFHjUIcCxgteih3tr3hscU4qT59AAVJu8MrIw+tjyq+cgRO3LMZYzeD+o2O68cM9x+MFskO/zEED7OaNFLTnbVZgE9oX7for/G4IDJzyxoGc54WizjbXm+vrPwr1xV+K0D8urXhg75aSQvXn9fY5qivog/ptfVxwrG5W8Fd43PsPiofoF+2dKVwGP1lBQW5sUDakJxY+nqCfFdcRw23o+HXpMax+w9H/YVQp/ZIYu8FkJan5J90PVS8tRwSto1u/jNb1mm/Wp9kCP1m2sI2Lql2Z2nN2lZF6ygYjqJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjptHWMsN6IbaHvq5oi9NtLEZttVzTtqtUGzpHTOggk=;
 b=i25J9X+z6fl7eekYVQf8oo9p7BZmSF5A2fJebQtiPcDWH5fEn9IPSaXISoP3Lh7o5cjcI4XQhDsMGfJKyUnxW2JehkKZJanLEUHjfTcFl7GAgeV+KUS9kbdhfIvmulUw/nAaIhoByhWXSHdskoISs28C/nqFPeABD/rh1JFbqF4m0+7qPVBQPqGJr4opfpQgaWBBRknXanXMMq87L2924LL906Qtp2O93fIP9QJn+6f+sB0JPm2P6uEFN32EGMMMCAJe1fdPLjxrTqWubq2W7OUo5gemQSgR3z5UVM9SCX+lbkYOYM+/EuM87BzyztgH86eyzo7ezMZuB6JS0qCm4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hotmail.fr; dmarc=pass action=none header.from=hotmail.fr;
 dkim=pass header.d=hotmail.fr; arc=none
Received: from HE1EUR04FT010.eop-eur04.prod.protection.outlook.com
 (10.152.26.52) by HE1EUR04HT138.eop-eur04.prod.protection.outlook.com
 (10.152.26.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.18; Sat, 25 Jan
 2020 17:28:18 +0000
Received: from VI1PR07MB3997.eurprd07.prod.outlook.com (10.152.26.51) by
 HE1EUR04FT010.mail.protection.outlook.com (10.152.27.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Sat, 25 Jan 2020 17:28:18 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1D86030617DBB0016F4A945C7CDC31D0AE83D1821FDFAC6488D086269F70FA98;
 UpperCasedChecksum:1F367D42726C27034E24262637DF677D41EA0E1C78FE1826AC5F5D9E0715F3A2;
 SizeAsReceived:8656; Count:46
Received: from VI1PR07MB3997.eurprd07.prod.outlook.com
 ([fe80::4d6:ab66:671c:cf25]) by VI1PR07MB3997.eurprd07.prod.outlook.com
 ([fe80::4d6:ab66:671c:cf25%5]) with mapi id 15.20.2686.018; Sat, 25 Jan 2020
 17:28:18 +0000
To: etnaviv@lists.freedesktop.org
From: nanaki89 <nanaki89@hotmail.fr>
Subject: Vivante GC7000UL
Message-ID: <VI1PR07MB39979776FF3B325DE5A69413B9090@VI1PR07MB3997.eurprd07.prod.outlook.com>
Date: Sat, 25 Jan 2020 18:28:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Content-Language: en-US
X-ClientProxiedBy: PR2P264CA0019.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::31)
 To VI1PR07MB3997.eurprd07.prod.outlook.com
 (2603:10a6:803:39::17)
X-Microsoft-Original-Message-ID: <c94d4e3c-ff56-f8fd-0955-9a9b8b5ada4c@hotmail.fr>
MIME-Version: 1.0
Received: from [IPv6:2a01:e35:2fb4:eb90:bdb3:dcba:a00d:2a7f]
 (2a01:e35:2fb4:eb90:bdb3:dcba:a00d:2a7f) by
 PR2P264CA0019.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20 via Frontend Transport; Sat, 25 Jan 2020 17:28:18 +0000
X-Microsoft-Original-Message-ID: <c94d4e3c-ff56-f8fd-0955-9a9b8b5ada4c@hotmail.fr>
X-TMN: [no1Ay8higr5YJWzNgIl5VuchDHSo1x6zT+cg+3idPJzzhfrAEkGjr9e0aklfH64f]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 540e7b59-561f-4416-8b36-08d7a1bbf7c0
X-MS-TrafficTypeDiagnostic: HE1EUR04HT138:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +6VUc/mcs83ZM+uR7KE80s0FGSUlMEf3jXldHauTMOwhJAb5NzcBUZWwlEXP9Ra+XrOWN6XUqWLfBqnW4nmrnFFcVk7kJnwAjcUmGi3yxTr+ldLT2D9xeErxNgMBa/za8VaJ5UOkE5XvM7DuctxnWuIjIAnO61mYt4hpFSJ6DDosY2pGXcxYbL6PxU4BZGWT
X-MS-Exchange-AntiSpam-MessageData: Le0ElOPLFqrnCvBBXnIEXIgiy51Pgri80ZIaDG6KF+a2IAfJRfY7p2zreeENwmMudOFIS4JILPizTd9rNv2UJMvG/gUpDhL0smhT+nT75wPZLpeLC8SYma+T8ciu3+7xPwnH4N8utBQRkUZrto+RH8G6Rtpf+Gv1fiPE6A4pgFdiqZdQxl6Q121bnc/dZwFikbhOFQ5hFnjwzRJmFm7Euw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540e7b59-561f-4416-8b36-08d7a1bbf7c0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2020 17:28:18.6500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT138
X-Mailman-Approved-At: Mon, 27 Jan 2020 16:32:50 +0000
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

Hi,

I'm building android for an old device, samsung galaxy grand prime 
(grandprimevelte), mainly to play with it rather than making it usable 
again, its old and slow.

I was looking for some Vivante kernel driver and it appears this device 
uses a SoC Marvell PXA1908 and a GPU Vivante GC7000UL, do you think the 
etnaviv could be used on this device ?

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
