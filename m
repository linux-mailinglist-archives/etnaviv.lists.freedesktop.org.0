Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B467B52B51B
	for <lists+etnaviv@lfdr.de>; Wed, 18 May 2022 10:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FBC10E789;
	Wed, 18 May 2022 08:42:29 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80135.outbound.protection.outlook.com [40.107.8.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B76810E660
 for <etnaviv@lists.freedesktop.org>; Wed, 18 May 2022 08:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ez7KLwLv2F0HsdVebfhaYq7ChcU5b+tSjVsA3ruorCCgZ58Mg+b7iM4ASAxIVtY/ocprE4t4g7gSp+41Lvcb83vna3aID7Zoa5BZYkq4yMSat+vs7G51kH/bM9TGyTc2oELQnAZpGYx7PcFlvVs4C5i167dAesZFAORH8KkjnSggjceG2ixt/Max7WfYpV+1luVl/+Jsjyebb1MujSHZN1rgl9VrxDroV+RUeCF2d9xadClZPvZhOniAk+g6Z3oaT3eDL8H1LBGx9Gj2o4iS1H1oa4HDb142eELMA2zMMrPA2/RKfNVFGnrvDOTDimYpyV6tlCRFYjj6C81hShjf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bv1hjh8h5sGmiVk9WX6JmoGbNeXb2n3nMVMT5AacKrU=;
 b=HLOEZ9yfZY5EblG+dh0dSG3izgXWtXVjmi5Va1LmlUJeTFbJbNAlyuhRYHe62uyN7it1mgPLZl2UtLLY8fdOxAk2XFvUpS46Nysl2BSFoY2CTtAuiL1r+MSACCKXGFdSek2yx4nomhVGnN04+TQFeyz3SDDuzkhscJcqryN/G/lnvYJofp7GNDd9ayHDyZNocWPNlDN6+Q8gsr1xoUdz5gFNPWNaLQf/tBSl+hKDDQdVQ4mKOkYJDKWgYjii7lBi/letA816mr+6xaQKVv9NTXj44CYmz6nThfeQAsKHKWIa1dhx5J0VscMbXeufqaa2al2hurRhTrKBCwBA92u7bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ivu.de; dmarc=pass action=none header.from=ivu.de; dkim=pass
 header.d=ivu.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ivu.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bv1hjh8h5sGmiVk9WX6JmoGbNeXb2n3nMVMT5AacKrU=;
 b=Rat/FQh7CA0bFwr9qDn+qQ3q6NQcw2bi+3grb1SN0yO4pSg6dRTYYu7CF1kaeC29cwW40iw+IyBjRp3x5+vzaW1g110UyN8o3ga4qp/oWTebsaqoekIrUkonDeu8u/mc9H/rbxkWmnX6p1/HzYNYbtVXq51hlGG6eSvupeCZfZ8=
Received: from GV1P195MB1763.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:5a::10)
 by PR3P195MB0831.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 08:42:24 +0000
Received: from GV1P195MB1763.EURP195.PROD.OUTLOOK.COM
 ([fe80::e8b6:1c7e:8005:f5c3]) by GV1P195MB1763.EURP195.PROD.OUTLOOK.COM
 ([fe80::e8b6:1c7e:8005:f5c3%6]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 08:42:24 +0000
From: Christian Gudrian <CGU@ivu.de>
To: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Subject: Hangcheck Recovery triggers CPU lockup?
Thread-Topic: Hangcheck Recovery triggers CPU lockup?
Thread-Index: AdhqkzGOP9Egu8vkSQ6/atJsULgXcA==
Date: Wed, 18 May 2022 08:42:24 +0000
Message-ID: <GV1P195MB176334C137CEC2C8FB199EF6CED19@GV1P195MB1763.EURP195.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ivu.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b7c8303-9222-4c7d-0c15-08da38aa54c0
x-ms-traffictypediagnostic: PR3P195MB0831:EE_
x-microsoft-antispam-prvs: <PR3P195MB08312BC3AA5AA6EA555FEF05CED19@PR3P195MB0831.EURP195.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AN48mpiytBdryP6oXDh3DcHE9MSh3RFZU27sDBHVwszWWHoAqK1i55ytwPQYlldHK91d6ku9oXgJrixVT8YWynoB7HI9qBzj13nMDG7SH+9z0KIkVa1dYM5m7TCFqjLaDCoNAc3WR37G89SQcQ/8Xt6ih08zYYBahZCsnPOLp1jYioxfwCscHrQRXj12XqXmfnoP89rcrP+YCrVEfj5qlMZ1hNeiRkeelIr7VvLf4VwZZsWI+tLEBfTw4r7PhJSa44AHYAooftGNhTse0VcY8Rrd4bQNJdmriEMTB6ChWVpbwCWLZ5h/pcF+i9nrQTcUFEQ6uEnC6vxot/vwr4oHZXAhayobbxVnwxciZhBbqX/lafCK4iDxeCBJFEd8xmMf/A6FSFfwSrPHlpyAJEImg1CbrGci62jhbo90+WUmSoX7qaMH5W8eOqcAHmpacETVe8//fKSOfOmZ6gfwFsG5c7S/HHwoes2wHA8xUBfikMp6j0g6KV9XIUyAZyQ/euAbLI1dSwNzS6TUN0BhVejA5Fy2FfJ/MK7LRe+aOajVPlooSpRyJ5sDlKceH1/AyrENwYUUKOfMFGYlSH58gw5XvqSXuPERQEwqFJL5TecEUNKN/YscDnsL2Z7SlXcRgtEnse94XL2wOh4rVfcnuZWwVHAN7VecFRocVAhmEYIFe7oext6MsdxL6K5chx/ZBVPTCoqFBsiRaTTIo6vMQtKWKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1P195MB1763.EURP195.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(66446008)(55016003)(508600001)(66946007)(64756008)(66556008)(66476007)(71200400001)(186003)(6506007)(4744005)(26005)(9686003)(83380400001)(6916009)(7696005)(8676002)(5660300002)(316002)(19627235002)(52536014)(8936002)(86362001)(38070700005)(2906002)(38100700002)(122000001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r4l1nl+CIS2bEUKgKUMt5ABSaDVZBj3XZe8huWEq9ey/HCbi+l5D2N2AP6SU?=
 =?us-ascii?Q?Yw3uTQ2hJoPNlrf2ED22TWkXF4XtSSY574+sx4IYZUAiuXEAekRK3wR35ojf?=
 =?us-ascii?Q?OYhBB0dBYlrDMRCsAb4eiEJmgZq5XefQ4OTMTMmxRkPNN6Z9ZiwiYQrVP7tI?=
 =?us-ascii?Q?xT/EppGnFiaSZItnAjET4d0kCSjj5HKqXjfNtIyGB9aykqOoX5THxM0FNYuC?=
 =?us-ascii?Q?tMvvfpkRpdaFbOJpDbz5w4JHIB34+Jm7mCST6rMA3f0ShujYHOofwpQQVxP3?=
 =?us-ascii?Q?4A8PyMVaCL/rP5nxSMFafD258DXjzsvGoO+lKja3zFuhkvrELBXo4d90j/gF?=
 =?us-ascii?Q?wu4tKoLnvDAYK53isONqIhw2d29D79M0r4CzefZ5Mk/O48v9QQXtzPYp9V4G?=
 =?us-ascii?Q?0Ovn8nLbgI52HG8IvGSZvEnNAE5Sd1MOjUUAl33hHgjtbpIjvpDwi6gVv0y6?=
 =?us-ascii?Q?ydfXjPXhOshbfrLfpZDcJbvlbnhpcpeu0DvrAkvsVegnIixcLnEeONx+UGQL?=
 =?us-ascii?Q?mAZHxbuXOkI/75NZMO9ZvpL52A9/EoirY2N/KOVW1X21lUKj+WaiYfFlKZGP?=
 =?us-ascii?Q?4Ba9IfvZ/CGd1SgqHjhju1dubSFkPMm0T+iFJCWakemVeLsFFzoEEZCxghUJ?=
 =?us-ascii?Q?5bD5qRss/KjOhTU1Ke+pgOzXCGMKSb4Q6bYi71Ma+y6Do/AFrKskwWnW8jg5?=
 =?us-ascii?Q?+xRYpQCLQAlhgoqjCaAnRVvGh79TKJ7JLv8sXLpBAxBhPOF1QAWjRO5vJY2n?=
 =?us-ascii?Q?An4ycCsDEg0jV6UtW4Nit7Db0HUk+OohH6WAJZ9fj3SxWbmAtUvJIrLemIl5?=
 =?us-ascii?Q?SdVTKMEKrjZKh+O9LAg3hobEf0wABFgSAfWdK0te5Z4vI9YZHoJOSoTmCnvz?=
 =?us-ascii?Q?XQ1qPhPqfib8zd1w+5dMr4oESVpMndZHW5n8Uu/IRjm5rDF69552E8ROjhZj?=
 =?us-ascii?Q?krhpy6QN8RQ/jL+NIp52XBTVOY64C7qaElVhfLKYId2tKlUDeNQ5xAgrrkcx?=
 =?us-ascii?Q?gNquZ2EmPoOsOxE6Ltu8yDwJE8Lv4C+dWd7fHLvznzgr2kwLmDwVQwC2tU26?=
 =?us-ascii?Q?gzmJIEmsLwOV/ZvWEypnr3E4K5KTiW0VeM2XBQTbzctsLwyX85DZYv1OddQW?=
 =?us-ascii?Q?cbZpKtB4KxICwMkA8I1CwJRBSSY2qHiktprdZWPSPZiTZJWznb92uKpjjSiO?=
 =?us-ascii?Q?qun9WO75yzjyPLqAXxVLitG8Ms6m08iTtDigVE2WABHzdjnRxA8ZxXAkPA/f?=
 =?us-ascii?Q?rdibv+BYBxJ+x47RKPGbV1gWCQxKCgTqW6lNP9XIpDJxmz6tAwOf/ataHIzE?=
 =?us-ascii?Q?AG5TRbHzQ2WfQpZTiyw2DBTUg5hqK++g3FagDkzrSyUJ/F02ENTFfCmR/ehW?=
 =?us-ascii?Q?eBx17qL4F4ZUcaoY66wgQfsJDimiiYpUOwjzakMsvw1E1ea9jiPNcmrgmunw?=
 =?us-ascii?Q?8Ooo8hdVvA1kyzqU1mzmW4N79iiHUFY4GntWlzhV07ehH/r5mzeZljP1hGQj?=
 =?us-ascii?Q?jsiJ3FE6DBMSvzLSpa6brruPJv71eVefvgx5TNQPAQ4YSJ/cObTMotGcuK9o?=
 =?us-ascii?Q?EP++FHaLe9G9KPoz3iyDw3LLJKXW7tAMjwymHVceE5wWludOXjoI7oA06Ynm?=
 =?us-ascii?Q?6MAXZeNdtke36jVXOc7mtg+M85D8WVWU3WOAoONTgtv+H8GljNwwfOn1beIJ?=
 =?us-ascii?Q?pCDCpXQ4n4zL57Qswj4DGFy8l5XF0Y03H6nc0rVxnWXz1HPo?=
Content-Type: multipart/alternative;
 boundary="_000_GV1P195MB176334C137CEC2C8FB199EF6CED19GV1P195MB1763EURP_"
MIME-Version: 1.0
X-OriginatorOrg: ivu.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1P195MB1763.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7c8303-9222-4c7d-0c15-08da38aa54c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 08:42:24.3658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0161bba8-a41c-41d1-a282-2a1de8f1e082
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LrUM7XQmGrrfyVo8h5o8oGGJbmch/4qVlw48TPjQa46pcuqta+of2EsUmCgYH+Pn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0831
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

--_000_GV1P195MB176334C137CEC2C8FB199EF6CED19GV1P195MB1763EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello!

I am currently investigating mysterious device lockups on an i.MX6Quad with=
 a Kernel 4.14.134. The symptom is a complete CPU halt with not even a JTAG=
 debugger being able to connect. Right before the lockups (as far as the lo=
gs can tell me) the etnaviv driver determined a GPU lockup and issued a res=
et. Most of the time the recovery works without a problem. But apparently, =
it's the last thing the system does before it locks up. Have there already =
been reports regarding GPU resets triggering CPU lockups?

Christian

--_000_GV1P195MB176334C137CEC2C8FB199EF6CED19GV1P195MB1763EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am currently investigating my=
sterious device lockups on an i.MX6Quad with a Kernel 4.14.134. The symptom=
 is a complete CPU halt with not even a JTAG debugger being able to connect=
. Right before the lockups (as far as
 the logs can tell me) the etnaviv driver determined a GPU lockup and issue=
d a reset. Most of the time the recovery works without a problem. But appar=
ently, it&#8217;s the last thing the system does before it locks up. Have t=
here already been reports regarding GPU
 resets triggering CPU lockups?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Christian<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_GV1P195MB176334C137CEC2C8FB199EF6CED19GV1P195MB1763EURP_--
