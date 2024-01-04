Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3F823C55
	for <lists+etnaviv@lfdr.de>; Thu,  4 Jan 2024 07:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523B110E05A;
	Thu,  4 Jan 2024 06:45:47 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 496 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jan 2024 06:45:46 UTC
Received: from mail.eaton.com (mail.eaton.com [192.104.67.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D9210E05A
 for <etnaviv@lists.freedesktop.org>; Thu,  4 Jan 2024 06:45:45 +0000 (UTC)
Received: from mail.eaton.com (loutcimsva01.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92811961D1
 for <etnaviv@lists.freedesktop.org>; Thu,  4 Jan 2024 01:37:28 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eaton.com;
 s=eaton-s2020-01; t=1704350248;
 bh=9B7TGlnrzzOFOsbGRDuiLd8cswtOJ0QxN0NZ27zGFlA=; h=From:To:Date;
 b=iv70A2sV31A1oxQr+QImukjKR+bRYohT06CwNsKRghbbGMXvZnsPSiZZPIK8dxs8y
 yzAuheO/YM7bSLmtNKkAlYBtRJ46KFY+PLFiN5bcFtL+jMKW6zMl3hcM/pAeMRGKoD
 aTsydtoGo5nsHTtHnxusk9aRpTWaVy/EoLLidWZ5AQoLOgESBBtZb8wGez4Gx3yuQK
 FQbkvfRBtFY6Lqk6q7tD4UjYuTSjFfcUslRmyPxHgn9+ncSZSHuuMnT6hzAYeEt+zg
 Nynl25i+08Os7iTTjBM/SbDSVDR9gHWHVPRQQcimU6HO/Ai3HEzUxnQmlgqOkTt/2U
 IAl/e9B7xtkaA==
Received: from mail.eaton.com (loutcimsva01.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B7A8961C5
 for <etnaviv@lists.freedesktop.org>; Thu,  4 Jan 2024 01:37:28 -0500 (EST)
Received: from USLTCSPGWY04.napa.ad.etn.com (USLTCSPGWY04.napa.ad.etn.com
 [151.110.126.225]) by mail.eaton.com (Postfix) with ESMTPS
 for <etnaviv@lists.freedesktop.org>; Thu,  4 Jan 2024 01:37:28 -0500 (EST)
Received: from USSTCSPGWY01.napa.ad.etn.com (151.110.126.224) by
 USLTCSPGWY04.napa.ad.etn.com (151.110.126.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 4 Jan 2024 01:37:28 -0500
Received: from USSTCSEXHET01.NAPA.AD.ETN.COM (151.110.240.153) by
 USSTCSPGWY01.napa.ad.etn.com (151.110.126.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 4 Jan 2024 01:37:28 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by hybridmail.eaton.com (151.110.240.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 4 Jan 2024 01:37:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wo7iqt+Z8rH8p9f0gtmsIBsEfNq8tYCWj29Ai6lIwMe4LhtA0s2ZX2QgyHkZxt9qanDHUdekCKxRkC1+qcYHC/ysnPANvdoYOLRWYhzJWpDbohMI7FuzHBmeJD5wyo5gFMc8ZCKApFR/L743mfC9Lz4R+k3MBah2n3PGjXV3Dtan6zNJHdoLjPnXWyP+yP5blXFCnUoyzhdQ+d1YfmWO3Ccu7RzE6qCGfPP0rSOyT+6zXv3nZAWt+T2C4Q7BBJJr/UXnxES9V/Y/lcMOcu8Z2/F/Ib8Y3DW2jotannvsTsYq0+K/AbhvjaJ1zoxV4Ka2a+BuS13+3LHk7k8DXZP5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9B7TGlnrzzOFOsbGRDuiLd8cswtOJ0QxN0NZ27zGFlA=;
 b=CCqgTSI1KOiaNwRSEmjrPk22r9wXZXk4JzVDfuFqu1s+wQALLUmuJKPkF/V0/bnmvsuVT7GNTrjnwpLbUco7Ur5AMft0G3gulPtBa7Fqv31Kk8m6ioc/a2EKLuKkOZCYmKSeAzlDNkapUxFFKT+ZGNNhaoOhS4Sd0Mso7jfhvvaO9d1LnTtdwoyJNPWch1OiyEFsznfIejeEp165nN9LR8gWevvrOXEoEq8IBx6u+N5h9mW/QJTwCNr3FokpXtXJdzObxoQcgm5BAjixfuYZfdGL+y66I2WD4GwmCBMuhCFP8JJm/f0NM/TPkT4/xlJsGi0O9ybu4Iui4hNHUZY6sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eaton.com; dmarc=pass action=none header.from=eaton.com;
 dkim=pass header.d=eaton.com; arc=none
Received: from SA1PR17MB5652.namprd17.prod.outlook.com (2603:10b6:806:1cf::21)
 by MN2PR17MB4063.namprd17.prod.outlook.com (2603:10b6:208:204::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Thu, 4 Jan
 2024 06:37:20 +0000
Received: from SA1PR17MB5652.namprd17.prod.outlook.com
 ([fe80::3134:8ecf:430:518]) by SA1PR17MB5652.namprd17.prod.outlook.com
 ([fe80::3134:8ecf:430:518%6]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 06:37:20 +0000
From: "Motghare, Vishnu" <VishnuMotghare@eaton.com>
To: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Subject: etnaviv : IMX6 Solo GPU Performance Issue With OpenGL ES-CM 1.1
Thread-Topic: etnaviv : IMX6 Solo GPU Performance Issue With OpenGL ES-CM 1.1
Thread-Index: Ado+2Gd+wxkWNUOoT+mXmiBejC8yGwAAAAAw
Date: Thu, 4 Jan 2024 06:37:20 +0000
Message-ID: <SA1PR17MB5652020301F51E278E9C9175D467A@SA1PR17MB5652.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_ActionId=ed095f1e-443d-44a7-9de6-713270e8cd8b;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_ContentBits=0;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_Enabled=true;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_Method=Standard;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_Name=Eaton
 Internal Only (IP2);
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_SetDate=2024-01-04T06:14:11Z;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_SiteId=d6525c95-b906-431a-b926-e9b51ba43cc4;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eaton.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR17MB5652:EE_|MN2PR17MB4063:EE_
x-ms-office365-filtering-correlation-id: e2ae440c-69bf-47ca-a186-08dc0cef9a6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LNonD0K3GCchhK+B0vYoQDhhGBk+GQzpJ3Ya+3IYU6x9vRZr102kYOcfLy46yEhEYsc2o5BCXjTWSeNu9vGYjaNCwIFpQXrTQZyNkxv9V9tbS1y2fQSUj5qCV0Pb9VwabZOcS85M9WUcojdglNZ7Z4vlrN/vkwdJFEUqfGUQH+YpcunIjLtEF/czqpRNGRwZ1c8gycI+2zxMJDyQpZy2SkQitNjSDvcdyCfSXh3zp64VryGWsZK/0CJU48Rn1OgTjlnemhQ537MybJIbCKS5XdfxbMDxkh6zKLR89eNi6Wruq/4LF5aM1V4bgr/okLelGWL2J70XcoP2lWG0B8hbBfz9cKYBmGaZbQ8VOOczKU2nnEY1Md+EEYhhBvo2vqpioieRapO5ncpDZKgX3NP7tLKlKVXQ6vL4acOtBEd/TLuSrTQzN5GvNEW8su3amyvh7SjGkJzfMPQAJDBgvRDu8t1D0LWGHiOif2VZrTXc7rbdnw84yqApUURiP5rS9QKC5qzDOFO+uaySz/snyNg5SZFBSJWwqpS4tt7I2VKrPIDE9wz6mP3Y1UPPb9wla48s58oI4UTH15/ZZm2wd0WC/x6/Q9h7yMwtasQ9M+1pQVIHU0YiNxaa511K3IY1ee/l
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR17MB5652.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(122000001)(82960400001)(83130400002)(38070700009)(55016003)(86362001)(7696005)(478600001)(71200400001)(6506007)(52536014)(9686003)(66446008)(76116006)(66556008)(66946007)(66476007)(64756008)(26005)(6916009)(8936002)(316002)(8676002)(33656002)(41300700001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a0yhIHCypVrXcafca1hWM6p8Ol2fyQp9KhJsCXlRTwkwiLk5dc59/ecsHD2N?=
 =?us-ascii?Q?i1HJHGjRRzWIgFtWH2cUem+rqzaz0/enLYaEboTWpoOIPCe4YYpBNNTpBlWe?=
 =?us-ascii?Q?p0PFLWCrZNazQ2f1B6Vs5KHIzlvLTSIvwUpTlalutuJ6La9L/6Tw0cgKC3eF?=
 =?us-ascii?Q?ragsxQhXEeMMdZZrC2akVFvAMUwPGdyMCKn/q/ohwgf8zS0Kqf6YidB8mv1y?=
 =?us-ascii?Q?wOnhxk1Bx+q+FziW27ZHMA3zDxlhJjnR5SVyq9jRZFHyDobFSu/XfRWqnEqg?=
 =?us-ascii?Q?qBXN2exzHqeddDdJuY/7QQauS9Q5oprIbBKmKv4M8FnP3G571AWoDdkhOH+8?=
 =?us-ascii?Q?Xenjnn0qJFzHYN+NmeTiv9WQ2oqehQc8RLepHTVKteZZVek4fVQjZz/S80Oi?=
 =?us-ascii?Q?NJKFFqVtaUnwg4HlQCKGA+lwWVw6yK1+YlKoX3pzc2t8h/oKT6ucIEuv5Mo5?=
 =?us-ascii?Q?+KmbjgkPs9x0mcOlpqXq/D5oSPgpJ0EWUof3V7i1gLNG1SZSezTM+q923bnS?=
 =?us-ascii?Q?6xAmp0/wEq+Vkc/99jMtncm+Khdbccu3J/8LXmB1N9ZM/JLJh1gYjtKaKjWn?=
 =?us-ascii?Q?bDsTsaRgfP/nanYY1UMQSnsYgVSte1/n4LwjLQJiOjHIZNvlfuxH1y28V8MS?=
 =?us-ascii?Q?lOSzI9+JMKmjCGcG5dKhpJDCUn9hK+xguCdCMQZNNF/k5oKLUKA61KctdaAX?=
 =?us-ascii?Q?3jQZDhfh0yOnGSupw1Vwa0/MK+1fvG0GhU0l9ElqpyeMLxjYFNae0WGJyY6+?=
 =?us-ascii?Q?YjrCwkWW0sWvdMe2NSycvDQQdyFBCsV6uHhU6BeMionWaxv67Rubg1RNdvYf?=
 =?us-ascii?Q?f7iQDa+qgOEeSws+t6oxISeJhg67QkcMPoXfP/fWZ8VPLCEmvao4+HoZgKmh?=
 =?us-ascii?Q?gwKyxzCTAX+4JiO+a6g/sJmAy9leklayV5VVlrY6hBY6N14BLV9qpopIqeW9?=
 =?us-ascii?Q?ef8jRW8ndtBJnKH4lB4qgPtCuKet+pjUIR0hZtc06/ZPh4pTnxo7Hr8j9mTe?=
 =?us-ascii?Q?LXaWNLY3dOHSyNuDKzA4hzOf1SCwnPeLmTRpKgPbvY4LVckTrPrRTD7+6y3a?=
 =?us-ascii?Q?80g8HK2TGgdConPwnJJw7pUlor3TlnOZxFt9hFKD0vyfj7oSC83yQ7nddG+s?=
 =?us-ascii?Q?PHtUWfVkgl1ITNSBrMA4TtjQKjaB8VUk5HxE6sGim/cC1Hm1CuL5hcbIpfNY?=
 =?us-ascii?Q?wEV83gd8I+ilqFIucpwDbAo2ziwHnKfJmWaGRRaoKb9gWreWFah+aymqzdoB?=
 =?us-ascii?Q?yImdZRr1pp03jFgiv9WVUN2UbXmoF2l2QSDsOK2t6VB41RwDhdykEBIawbTY?=
 =?us-ascii?Q?QGe2YzX2Z8KdyyTxwTQdx6KeKcssEogZphHFB1z/Nj0Qgf41yadpZdD5imlS?=
 =?us-ascii?Q?rAl1cfRIKhRASYsHf/1T90V/+dTZG9T1YGj128x/fauxX6c9UEtX4+qOTgYF?=
 =?us-ascii?Q?EeIjXUvVnqcw8J1DO/5I6bowcvDV+rNfzEKhy8rhKOppSM8TI+bXr8AqF34g?=
 =?us-ascii?Q?EeUYwh49opnr7rQ6ZuMLefObQs2G8U7qmMsKYesNxVa4+CnHTH0qvU5FjuTK?=
 =?us-ascii?Q?3C4h6fh4JJClx32SkQMyjAH3sE3r/P3ij8Ra3hUB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fL3gf4nVdhbC6ScpONuk9cUsUb4zPHYtTAAzggKa2wRJWbqMIfKjvyeBeCSPLY/I+4hFYAOobqRNdMso7HKS8MQV5WFYKioO4Gz1ITN07VA4SDOmzgXPCnEL9sfMFfHzSaRFas/YK20vykrj+M30A9+gTCpBOzUy4vKFYouRQMccbGmIMF3jRzNADAWr1tyYhWr1J0njgEMTHtgY1PnF2A6qpDRaQEh924lJv7Sv2FijoZWBwd1NEeAOwuiB9XNDKtDLpmMOz+Wd3dZthPDF2A6G2dsLv7CjFy+y88URQNZ25Zp/hBBgEK/gIw5uqN/va4clwocXiaCpvEdvIP7UFDdt0/lmT+OsjxMT15NHPxFHcNARBhEwcECQCvSU+66sNfSMpz1i6LNbqhGjO1F/leqP6/sQo1mmN2GhmMbBPQzLy44lYYjMKrKA9ikFaOWO2EgCvdmN+k5M/H4OODHcdfbybFJqitqVU0ec9gB4vKgtuAjux9kjGr6FSGUpGlMu9QZ2DVMQ94St6TQE8Kg8YzG4MEDV50/t5W0GDvcGMskUsOwQw4kv3NcHJQiS5h3hzWKuMZHONuzv5VyXhSx/O35CwAmdOgqe77054RVEDnRGeDVXma38/u7rYa0/8755aKQt0p7yNUUW1AfYmR1wwg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR17MB5652.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ae440c-69bf-47ca-a186-08dc0cef9a6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 06:37:20.6914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6525c95-b906-431a-b926-e9b51ba43cc4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S0v/VTGdH+urmozuR6Z4rHaPDM8PuWtceDiY5Rn3+Q+vbgsuRo7GlRxr1jGosByxw1DwVCnFvDKVCGaI1ldefQnvaZCWOQc39UHZP7F6yUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR17MB4063
X-OriginatorOrg: eaton.com
X-EXCLAIMER-MD-CONFIG: 96b59d02-bc1a-4a40-8c96-611cac62bce9
X-on-prem-Exchange: True
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

We have an IMX6 solo custom device running with WinCE7 & Linux on it

We have developed a custom benchmark application using OpenGL ES-CM 1.1

When I ran the benchmark application on WinCE7 the performance looked good =
but with similar application on Linux gives 50 % reduction in performance.

Following is our configuration
=20
Linux             - Mainline 5.15
GPU driver  -  Etnaviv
X Driver      -   xf86-video-armada
OpenGL      -   OpenGL ES-CM 1.1

WinCE Result:

EGL version : 1.4
GL vendor   : Vivante Corporation
GL renderer : Vivante GC880
GL version  : OpenGL ES-CM 1.1 Mesa 22.0.3
=20
run scene 'Floating Frame3D VBO'
initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 48.075005
---
=20
run scene 'Floating Frame3D'
initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 31.975005
---
=20
run scene 'Frame 3D Fixed'
initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 31.505484
---
=20
run scene 'Floating graph'
Average FPS =3D 238.403093
---
=20
run scene 'Fixed graph'
Average FPS =3D 238.187271


Linux result:

EGL version : 1.4
GL vendor   : etnaviv
GL renderer : Vivante GC880 rev 5106
GL version  : OpenGL ES-CM 1.1 Mesa 22.0.3
=20
run scene 'Floating Frame3D VBO'
initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 26.872623
---
=20
run scene 'Floating Frame3D'
initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 24.373300
---
=20
run scene 'Frame 3D Fixed'
initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 23.783205
---
=20
run scene 'Floating graph'
Average FPS =3D 136.624447
---
=20
run scene 'Fixed graph'
Average FPS =3D 136.510016

glmark2 which uses opengl 2.2 gives 80 % score. Can it be issue with OpenGl=
 1.1 ? Or X driver?=20

At the moment not able to figure out where is the problem.  Any help is app=
reciable.

Thanks,
Vishnu
