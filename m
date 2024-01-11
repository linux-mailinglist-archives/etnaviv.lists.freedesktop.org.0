Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D603C82A88B
	for <lists+etnaviv@lfdr.de>; Thu, 11 Jan 2024 08:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BECA10E7F2;
	Thu, 11 Jan 2024 07:51:47 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.eaton.com (mail.eaton.com [192.104.67.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965BB10E7F2
 for <etnaviv@lists.freedesktop.org>; Thu, 11 Jan 2024 07:51:46 +0000 (UTC)
Received: from mail.eaton.com (simtcimsva01.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E9BA9620E;
 Thu, 11 Jan 2024 02:51:45 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eaton.com;
 s=eaton-s2020-01; t=1704959505;
 bh=8S5e2mDT9EiUh47BlkLkrb4JRFthV1Ippm5iZRmOXZ4=; h=From:To:Date;
 b=acQiaA4GiDEkcCfB4ZOx9X69rb9zdpoboUzrzSPkKFJmsqdRypo6r82nraSJ1nwzm
 1w2BzHY6naiaYRXS0zApZ842FRYq61M5pWy48V3XlNzY50iJGGEcxiDqrkhKTp1kqA
 Al66VfaLtkWdCJxfC2cF0OgOn5qH1LRuRDhzzn3fwn20QYK+i/4fk+dKeCiqWQaPvr
 j6RkpNOQ9ZcbPsF5u/+XsiKMha9B/XUvjc2lKcm7G2RXdDgwIXKvYJcL//LO3xrlwg
 V/rrnCHkY0KxqquONxpOtAIH2FKJDQWQTcaOSdS6W5xiciWUb71uuDXMDic48NNnYh
 lpZZi8ak1bp0w==
Received: from mail.eaton.com (simtcimsva01.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35CBC961AE;
 Thu, 11 Jan 2024 02:51:45 -0500 (EST)
Received: from USLTCSPGWY04.napa.ad.etn.com (USLTCSPGWY04.napa.ad.etn.com
 [151.110.126.225]) by mail.eaton.com (Postfix) with ESMTPS;
 Thu, 11 Jan 2024 02:51:45 -0500 (EST)
Received: from USSTCSPGWY01.napa.ad.etn.com (151.110.126.224) by
 USLTCSPGWY04.napa.ad.etn.com (151.110.126.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 11 Jan 2024 02:51:44 -0500
Received: from USSTCSEXHET02.NAPA.AD.ETN.COM (151.110.240.154) by
 USSTCSPGWY01.napa.ad.etn.com (151.110.126.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 11 Jan 2024 02:51:44 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by hybridmail.eaton.com (151.110.240.154) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 11 Jan 2024 02:51:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awUKTyhapo7j299waMVkA/FVtiJhiBvKs1a2vH0ecCeIgOzOPTPZhT9SYmDitarksoUvEv/DwRb09/VIUuVEn1So2ABmMOc1h2sEG1FdNoPtkTQylC7Nh1aNNCDU0xMOkhHGJJ5qxkf9izi2t3kKHe+rLKpoGZhmJmEcx0aH1iUOhD11pmEOqQyzLKklyvv38j0pJK9CA2CoYUUItruosM3uov530CF/G+A8uFpBSCKmsZSl7PZ0fU/Ydi6XCHNDlBopK1SikIoMKiAM1S/ynu19ed/7OGRXhZVBbiJcfb3bQH8/lPr3wkHFMDdKIC8nTAzoKhmS45ly1ODanfCC9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S5e2mDT9EiUh47BlkLkrb4JRFthV1Ippm5iZRmOXZ4=;
 b=b5781fmRSYhTErj4svS1iXxvUxvYlszvITlzjYP/NF4V5ZRkg6056nCDA2lE4B7d9KaZFQswLkQpMAs3c9Cif/gGJdDdx5zzqKsGFWOsTWAvStp8GQEhgYk4ZthnV9Ib4EawXvNnccRLXp6QwY7AanhzNJ1yi6AHb54QAFzQHdWjimRzKIAI4HLeIolmtIVu6p5dLQF3Ms27EGeU9zjCPUZHPyZV8VDYLpX9H1f0wX8fSTa2XiEFC2rxdK8ZbI+DD+wPhbu/yQsz6JD891iHWtDn3XV+LSIujqK+qi/6RvDOTDESqxJw+vgOvlFkeItTpHNNzlwv9CW0WvrBeRZt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eaton.com; dmarc=pass action=none header.from=eaton.com;
 dkim=pass header.d=eaton.com; arc=none
Received: from SA1PR17MB5652.namprd17.prod.outlook.com (2603:10b6:806:1cf::21)
 by MN2PR17MB4064.namprd17.prod.outlook.com (2603:10b6:208:208::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 07:51:43 +0000
Received: from SA1PR17MB5652.namprd17.prod.outlook.com
 ([fe80::9a89:2e27:7451:6ce4]) by SA1PR17MB5652.namprd17.prod.outlook.com
 ([fe80::9a89:2e27:7451:6ce4%6]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 07:51:42 +0000
From: "Motghare, Vishnu" <VishnuMotghare@eaton.com>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: RE: [EXTERNAL] Re: etnaviv : IMX6 Solo GPU Performance Issue With
 OpenGL ES-CM 1.1
Thread-Topic: [EXTERNAL] Re: etnaviv : IMX6 Solo GPU Performance Issue With
 OpenGL ES-CM 1.1
Thread-Index: Ado+2Gd+wxkWNUOoT+mXmiBejC8yGwAAAAAwABn5VAABSHWygA==
Date: Thu, 11 Jan 2024 07:51:41 +0000
Message-ID: <SA1PR17MB565200229CDCE858DC3ECC47D4682@SA1PR17MB5652.namprd17.prod.outlook.com>
References: <SA1PR17MB5652020301F51E278E9C9175D467A@SA1PR17MB5652.namprd17.prod.outlook.com>
 <CAH9NwWdOcw+PF-qhZkHKhMDq2OQ=5oY1N=ibc3eX_VxX9U+Wgg@mail.gmail.com>
In-Reply-To: <CAH9NwWdOcw+PF-qhZkHKhMDq2OQ=5oY1N=ibc3eX_VxX9U+Wgg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_ActionId=8a1f0a42-2907-441b-b4df-08efb36bd73a;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_ContentBits=0;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_Enabled=true;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_Method=Standard;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_Name=Eaton
 Internal Only (IP2);
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_SetDate=2024-01-11T07:45:25Z;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_SiteId=d6525c95-b906-431a-b926-e9b51ba43cc4;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eaton.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR17MB5652:EE_|MN2PR17MB4064:EE_
x-ms-office365-filtering-correlation-id: 3be45406-fbb2-49aa-bcd0-08dc127a2678
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Scp+nwgnApsa86AfRAhStCKPG1oFQ3sVKh65u78LuijUeOailUHdFb9tN4mAq3O3WiPHPv2qrYhqpxdgM8IFYGdtSQ5t3oSvtfD/uKBRPv/wzyIxfri6z2UwgMMeoNvg+hL63N4DM1r47W2B7qzp+JhODP5v7u0CFqUNe2FNdF/OjTJDHzeb+QmnvyO1NVG9bYZPQUmCqt9F8Ur16X/o2tecHz6SF7KM/oYKvPMnviZnrEGMPc2II5AM8nPLjJvRbXicWJPL9UfVO72bdS2PcE7LdyzTR6munTrX9OGh+r7+aQtzMrkzeGnJtguMCGSp4LCP38W2WpXPYARjbjhbPXZ8pSCjfJFd2GEPr6YdSB7AtNbsR9Ch/xQ4qCHD/uKttPcnGb+e/5ukrNNGeEBubxpDiHchTy93FQyXgFoPTsSKB59Avm5UoPpbqka188gmZr7jLdHUFRklAvx1hHCbLUPUme7q4kJf/Btaz8U9wM4TM8mXtQT0GsH15mjW4HduKLtBBTQhg7ETe7WopyQLoLJ1ixLsoGiTLG47Slt3+7gvPmlB0F5CyLwcBSl7rWhe/4FMHfMPXFwRScFZ1LRosxHzdLuy43/XhCbWjod+ZJM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR17MB5652.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6506007)(966005)(478600001)(5660300002)(82960400001)(7696005)(86362001)(9686003)(66946007)(76116006)(8936002)(66556008)(8676002)(66446008)(33656002)(71200400001)(41300700001)(64756008)(6916009)(66476007)(38100700002)(122000001)(316002)(83380400001)(26005)(4326008)(38070700009)(52536014)(55016003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WgZk84250/nxCkWv2N+/T7BmlEHV/0w0SP3BKIbYL1MXoxWwFS+d16qjkt4H?=
 =?us-ascii?Q?A8U1JmaLESZW5q4ggZUowdqLcD+lWWe7A56RMHHaMqAa81J9lj6Nq27hJEop?=
 =?us-ascii?Q?SYBWBET5wgMIev7jL9HQ/1k0Vitn5h1s1e0E1ZmYrrdg7QVK9TqWyPneT+Aa?=
 =?us-ascii?Q?z2PTcOw9NQDYM5y/805Fm9zSjrXMKTrx0HFe1F6br5iOaDouW5EDPnqjkuCH?=
 =?us-ascii?Q?W7XRKha78zwcWeFpIF+ttAhRLZa+102RhZjT4bFMW5BDTTauYcU3303O6LfN?=
 =?us-ascii?Q?EsJGu93J0yp0zvTchtkreheDLW9h27SkctoymsScs3tFNUOfimu7LOg4c9a7?=
 =?us-ascii?Q?CRZsK9BqRPQvbx2r/leEL6eWvDSV2oH7/GviEFHDKt6nD7TItgV8mUGVbQbs?=
 =?us-ascii?Q?aSNG0U6y3wogOn5c8yjTO32mgWVnWvmhncz1u/2wibm3mL40sOkkrRTXDlJ7?=
 =?us-ascii?Q?ZNEERNADjRoiZyHNXHmhq/Iuk+j4RyR6O41sOahVN4vbgWoCnbPOOBQjUBOo?=
 =?us-ascii?Q?uZj5eLESpNRhhafNDtpRLkd+9X1uoMpE/hGAwvnCmOwntiiMB6NolYz6BVa2?=
 =?us-ascii?Q?xSi0FMcogq6C9FgeSy/lqrqGJNRuEGT++W77EpVhTrTdRts6/wmc2O1v+/aP?=
 =?us-ascii?Q?31QCHxuFHyhe6AhepXCI+b82rjuINYvB/qsXJAJ8WRNptugrvLrMxmrFYv3S?=
 =?us-ascii?Q?kRbso9H6HaHB0XZzucrHhZhAdyWIWJ6iVYVcLEGuwQRHoLBJ1yNQGZefUQsI?=
 =?us-ascii?Q?M3HISUtQgo1mp7WLkqsbORBg0zd3pxDBnT+0GwdhfJcBdxBQfTYJkNXulxVD?=
 =?us-ascii?Q?xE4Fh/X9wYh1Hlu/m3Va891HM9Lqu56LG3Wpj/DLpRSDgRHPhiFO4cpvrSw7?=
 =?us-ascii?Q?oPGpthipTBK015q6DA5OeCUzwzrnn+ZOPUPd0xqnwgz3itZVqvw2kMdXkIsw?=
 =?us-ascii?Q?fMprKRJsRBg38mnLzP6auUT9QkJoAoDDAv6Jh83KeX0Ldha6OuI03sHvnyyc?=
 =?us-ascii?Q?M2DutC8eiJFUHIYcEB+hyYw+MZ5cVN1TPBKj7rcd9IoDzRE9krEmXi9nc0zH?=
 =?us-ascii?Q?kMgD3FvvikOG38NMK+MfsC7N+din1es7Jqaj/xV41IxyBp6XNWQ4chuB1aPa?=
 =?us-ascii?Q?rX+WZ++cpfwQFLknAVx7gob64JqPJ72UPxnVbMmv0Cy21/Pf9zQn6mt0W3uq?=
 =?us-ascii?Q?nMaABPAfurlokP0Sk4YbRrXY1inixwJtgD/mKpTMwNTAQpH4JFyDN3HfBv7V?=
 =?us-ascii?Q?hSB0X520wGmHibWr8wjjSRge9gOC09ykRtJHIva5TZ2boyfXDQbFH96TciAo?=
 =?us-ascii?Q?AGXJ+BmqTLJe7Bpl3rdngvdotdT0R+KpGCeycYczV2pgSMWn6GXNGY0g8JTR?=
 =?us-ascii?Q?7EfOTmvNIX8gg+fShgsovx8sW6f5YfikWcC/jfJYW6v9V7z8VRVe8t/gtscP?=
 =?us-ascii?Q?/lgMevPXip5LXRWd2+Uayljdhm39uxRzShzxKXhirbXGflSNSwHEvVbr3IzT?=
 =?us-ascii?Q?m+uB2abt/s6viM897ECNQZQMlRu9h8OSJQIO9H5whq3jevkcpu0B3qO0Rbha?=
 =?us-ascii?Q?lyBraFgi79NtHIoNjVP9YF9av15AnCfil5AF9E7X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: d0SlfM1HFRHEkAY9m5DUKY1fOqN6s8w3lsZvrAKYxBF/tsAN+LbXi8rrwfjrgX3jt+xbPV24zLK7naEQv/9+/jPWYh2vKi0I99MgnPpcMWkk6hOlEkcsZe161lSj2kGfNK0FsrvTF+HN7wr5k2/0pOffkMrbqY829aM+7XhAER1hoNKNIKILMmxRgqaTESsujInXkdFwk/z7FbbNcR4x7uLHbiYmjECrFiPLcEtVrY7/ijI/h4OZnQ8a7VSe8bmj/03zEopNvVkMohDMloumxpgL5QEohYPFqbLvlqlRDEKEIOJwNhUCN1TW3A6Rb/7sw74OkMVcM9TwcaIFxgcZiD144In7O8rHbamzzF27mSL7E9Mq1pppYzazvoa198Y/yZcBn8v6mFOgcqlxSgWpTKoCepEuSFVIyJQugghub4gEJYVBZKDOuQMipuFxd8Ito4Vo6oxwSGGGcr483iegurZG9zcjfghxswbA7utwAKfiDJqUU0t/oOLHz5p+JENA1Pm2iKH3vC9aYjjP+aIES5IlISH59X3RNiAxFVQ3q6vjfSp3xPrJPKf4L4TAWBLi69QcKl65Tx7GLQvWMms7U9TjPdWxGkPWnzFpAowjKponELwEpkMXtTO6TQI+6XrzjI+0YHcndDPc7V5ZjYhEDQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR17MB5652.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be45406-fbb2-49aa-bcd0-08dc127a2678
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 07:51:41.9904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6525c95-b906-431a-b926-e9b51ba43cc4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: It95Q7cad8l7U5bb8brKaVeYuNtdQqP1HHJ/XiA9Jt1CD6LFbZNNBgoW+p17eIa/cI7PWfQcFLiNCOJls9lLKGNw38H8yPO0dnXnYULE0hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR17MB4064
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
Cc: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Christian,

>> We have an IMX6 solo custom device running with WinCE7 & Linux on it
>>
>> We have developed a custom benchmark application using OpenGL ES-CM 1.1
>>

> Is it possible to share this test application?

I have placed the application here https://github.com/vishnumotghare/opengl=
  in tar format (application-opengl.tar.gz). Let me know if you face proble=
m accessing it.=20

One observation that when I run the application, top command shows that app=
lication uses 70-80 % of CPU, that is strange, It should be using GPU inste=
ad of CPU. Right?

I have also tried using modesetting driver and with that performance is eve=
n worse than armada.

>> When I ran the benchmark application on WinCE7 the performance looked go=
od but with similar application on Linux gives 50 % reduction in performanc=
e.
>>
>> Following is our configuration
>>
>> Linux             - Mainline 5.15
>> GPU driver  -  Etnaviv
>> X Driver      -   xf86-video-armada
>> OpenGL      -   OpenGL ES-CM 1.1
>>
>> WinCE Result:
>>
>> EGL version : 1.4
>> GL vendor   : Vivante Corporation
>> GL renderer : Vivante GC880
>> GL version  : OpenGL ES-CM 1.1 Mesa 22.0.3
>>
>> run scene 'Floating Frame3D VBO'
>> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 48.075005
>> ---
>>
>> run scene 'Floating Frame3D'
>> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 31.975005
>> ---
>>
>> run scene 'Frame 3D Fixed'
>> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 31.505484
>> ---
>>
>> run scene 'Floating graph'
>> Average FPS =3D 238.403093
>> ---
>>
>> run scene 'Fixed graph'
>> Average FPS =3D 238.187271
>>
>>
>> Linux result:
>>
>> EGL version : 1.4
>> GL vendor   : etnaviv
>> GL renderer : Vivante GC880 rev 5106
>> GL version  : OpenGL ES-CM 1.1 Mesa 22.0.3
>>
>> run scene 'Floating Frame3D VBO'
>> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 26.872623
>> ---
>>
>> run scene 'Floating Frame3D'
>> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 24.373300
>> ---
>>
>> run scene 'Frame 3D Fixed'
>> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS =3D 23.783205
>> ---
>>
>> run scene 'Floating graph'
>> Average FPS =3D 136.624447
>> ---
>>
>> run scene 'Fixed graph'
>> Average FPS =3D 136.510016
>>
>> glmark2 which uses opengl 2.2 gives 80 % score. Can it be issue with Ope=
nGl 1.1 ? Or X driver?
>>
>> At the moment not able to figure out where is the problem.  Any help is =
appreciable.
>>

Thanks,
Vishnu
