Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2837265F
	for <lists+etnaviv@lfdr.de>; Tue,  4 May 2021 09:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6416E6EA8D;
	Tue,  4 May 2021 07:13:54 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2136.outbound.protection.outlook.com [40.107.21.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29E76EA8D
 for <etnaviv@lists.freedesktop.org>; Tue,  4 May 2021 07:13:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRNGwxAPabC50DEBt2TO8perO/CP8+T8iV2qXaDNTzd1Z/0ZmU6j64tPa/z3lxRD8ZEWGDHgs1uR5t/9hDqYl6NXX/RW+yADGwiGUIuKMYAcOcsBCS3LAHM+KxvWAP6RRyWOKJwq3cKnNRkyh3+ICQJcWK1R8VHFC+I8H0HMmqsWW0UPN3WSGkbX3QHA3pgXhe9wWZRJdXSwoJ6/lm40+PLiinM8pBGPYJ4ysabO04Dphw3vEkQWqpAAIhfE2rZb0XYKifGzTmI56UYDJzcbClZxYm40TVMD/jdBFlCG6DnbHWtRGDp4pQxmIElFhR1klKybD+3raAenOL/JVd5i4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkVVGra8mHwhqV9OFM0LMEUSBomXoIhJsFZEmC00BgE=;
 b=n4lLcQBOLGc5dEgocrcWaglbDHDqzcVvBx/BwnJhn2xwvewB3AXNwluFFhixxlZte5JkyCOkfK8M348FN5fi4paNKsijvx3kefEuqYXkSU4gP8Hy22dMPVFhEBKZ4jpMlV5kTtorOeGvTdiHhgf8B+MBIqbCV0dpwWW+6vMUQG7ClpcDiRJqpT1jZCSVNElzgHP74EHAMSdCmukMBpSrb15lCjN/tOoKOLtCs7c7tCE2xq4bvUOJRNzWTVnoc0G1um5rVqjkvlVtFxEwIfiRZzbZDPayipkJ8oKpEZ4Rf9ZDtmbYCCyYCjMnGERTaV70uerhU4uuWGhYSpGuTQZblg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkVVGra8mHwhqV9OFM0LMEUSBomXoIhJsFZEmC00BgE=;
 b=daFW7IqVtgl2N2VE3c/vSV8RMMKZL4rID0648bbT7uvewtbq/MEJ921GxZNl/YB8BBnuUwart5+vL/xDFNzTG9OMaBneT43jc2Gcl+NRLW77JwNRr2UXQEDnQm6UDrnJJLD4Fi/SyQl4lZvK8wH2wq6JP/RASWHBVlLUh6D25/8=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2322.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 07:13:50 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 07:13:50 +0000
To: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: i.MX8MM Etnaviv Bus Error mit 4GB RAM
Message-ID: <27902169-35c8-b4b1-b12b-17f8ad8531a2@kontron.de>
Date: Tue, 4 May 2021 09:13:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Content-Language: en-US
X-Originating-IP: [89.244.177.213]
X-ClientProxiedBy: AM6PR08CA0047.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::35) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (89.244.177.213) by
 AM6PR08CA0047.eurprd08.prod.outlook.com (2603:10a6:20b:c0::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 07:13:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a813e437-948a-4630-44c8-08d90ecc2adf
X-MS-TrafficTypeDiagnostic: AM0PR10MB2322:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2322B5CC8C03B0F764B3F1E9E95A9@AM0PR10MB2322.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L4yQwTfGu94kV0yLx5eDfSUmM7EfSo7X+HBhdnPw8VHLL2gGaHAnOQ6itmvNlaxXDt7EimZt+ixxEHvHSvZ5FAXb8HatsKSSCzql3iJa6J84xuVhKOzUb9j9CamQbGdNzmzbvl+omREjNvhFwJQURpoUfAgQl/PM0o2owy3A5bLEKX4LhXgVUH3FF+sLuTHCVeSr/eOJYDw/vStxqpWmwThyg0ekisWe4xPmy2J14473xgIBdeg4g5WPEfDR57Zcj54jBay3QrfD0JgLpD1KdN5/KvZj80bM4i2MeQywPoMgxKdU4TYnkCJABoZaHWH9zQ5EzAIK46NhfGQvYZUwHBanWrWotvWdFZXZcbgQNIYWotcUpP/re0Km2FAq0X8eJ52E5S20Pl3Hb5m8/e/9OascKr4nweOQEnzysY+3O75ArSraDziEfMXcTsBukGc8DVpw1JmySfHcqXtFhYMQ7Rvgiww3Bxn1N9+8gIhi3MVDfP4h+7TwtgJrJYBPqY2/TO7la4oCdU1a89USQHbzbc2c1tu2+tIMWoHQJKNDqxAH+kG3kaycVaoxQ5VnR2EW4YxSHyYf9t+3UsHpGUy+VvJ7qf0RJyGStlbpn2wTtZlewB9KgEhK86wYmUUV9H6LtCjUiWfh3mz5r77ihM1wvQ2c0rGIqjqK/3qPMWS4I8/d5DuLW5l+uHBXQLONUcwY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(478600001)(2616005)(66476007)(31686004)(956004)(316002)(66946007)(31696002)(86362001)(8676002)(2906002)(110136005)(66556008)(16576012)(186003)(16526019)(83380400001)(44832011)(6486002)(38100700002)(26005)(36756003)(8936002)(4744005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDNMTDg0Sks2b2Vid2NlN09aZnVwMm9YdjBHRHRZTWhHRXZwQ2NSdGZOaE4x?=
 =?utf-8?B?KzFZaWRnSlZqS2dyYkVsRGxJTG9kWitEY1YydUF4cDR5bzJTTzJQQWw5Tzd3?=
 =?utf-8?B?MktFNWdWMVY4eUtQOUJJS2JVSnRQeENhakREaGpUS0w0ZnpCSDlFbENRMGYw?=
 =?utf-8?B?RS81QmxhSTFlckhxOStWd0RXN3QvaUNpMC85b1JaZ2p1QU5DNHNKUU55VytE?=
 =?utf-8?B?cTRoUGM4S210Q2Q0SDZ5VEl5QStrNTk4WkcyYW9nVHkweG80WWVOYmtjRzli?=
 =?utf-8?B?ai9acFZYSzlxV3RUVnZ0M3kxN2gzSFhwSEFBWXdONk5Cd1o1L0RNMUZ6MXhP?=
 =?utf-8?B?SXkwMXB4bW5NWlRBclhHRFl0a0h4NkIrZ0hvYnluNWR6dEtqcVFWZ2hWR1FO?=
 =?utf-8?B?NjdzZHBlWS85QkE4THM0eHZPUGlZSFFzQ2dGY2NtSHBWVzZ3bVI4cC9Nb2o3?=
 =?utf-8?B?ZmdxbkZQYjJSSmVTZDl2cHNxRU9TQ0ZsRXBFQU9Ia2NIYVRDc0VpQm1na1pS?=
 =?utf-8?B?WldYcnNlWUt1bHR6RCsxaEJRYWhnR3Y2RW1NZytvbGtXdWs5UCtxdUlxNzhG?=
 =?utf-8?B?Y2xpK3JvYnFnRVRMWkdWaVVhNUVFL2lnZHlUV3BRaXJ4ZFc1VnRRSWora3Fq?=
 =?utf-8?B?TCtvdlpJZFJYQ2tDZmJBZHRtbmtyakdKQ2gzeTlIUGY5Nk5MbXh4ZWZoRGhv?=
 =?utf-8?B?RWhtak5UTm5uQmdEVTFVeDQzN2RUVzY2bC9lV1A4N2hDRDRyYi85bDczcU96?=
 =?utf-8?B?Vm1yWGhZZVZwd2JOTGhpd0huT0N3NkVYeWw3NlpPNzV5OWI0KzZJWW5aeDlR?=
 =?utf-8?B?WTBJTHdoNDhlUkFlMWQwYzVoL2RYWmJnNlZsaS9uZk5wWkRyRGJrVjN0MXVI?=
 =?utf-8?B?K0xTdXlRRGtOV1RucUdSY3R0K0c0ME9CVy9ZM2xtenhXbU9UYnZON2VweVha?=
 =?utf-8?B?WW5FeFRpbnZXcHQ0cXEyNG1oL2N6dlBjWHhkbnp2cHJETTN1YWN4ejM0cWtq?=
 =?utf-8?B?c2RadDcveGIrNzQ0UUpmdnhzekd1MTNLbGExTjV1d1ZpLzNkWVBva1Vvd0lu?=
 =?utf-8?B?M1UxOU5USmxkSVR0cXRjbGtsT2lxNGlkdlZraEd4VkhNQVdpbnBMcjF3YzB2?=
 =?utf-8?B?R1M4aWVwNzZqdUsvMmdxSmw0aGhDVWlILzM5NFp2bHBHQUhmdk9RMHh1YmFz?=
 =?utf-8?B?dktwaWJEanlvZDBiMENucjc3Q1dyc21JVFNnV3oyVHJzMHdLV241dFdtRTBL?=
 =?utf-8?B?bnVzTUlkRENsbUlvd1dVMVdzbU9MeDc1VmE1d05ZNUgxaUtzbWx1NEZGM1pY?=
 =?utf-8?B?WEc5UHgvU3A4V2o5Z2FCbVFHc25BSXRRaHZGcWtWeVhQUkNzSnVHVWh4enFv?=
 =?utf-8?B?SWhENyt3M2VuVDJNNUR2SGY2eklSZ25vSjQyR1dZYVdYMk03dmd1MXlPNUox?=
 =?utf-8?B?Q3NqTkR2MXYwbmZQWG1mcVdHalBtUjZWSUxIdWhtTlQzcXJ3d01zRWZEaHR3?=
 =?utf-8?B?MnU2WDZON25BMmNzZnl3c21iVlRVMUtISXFhVkpsbExNSnphcmxJYmpsZk5P?=
 =?utf-8?B?M0l5c1ArRlZCTHNocCtqKzg1UEt5ZExmUHo2OHY0VkFtUVJLdUlhaWpzdFdT?=
 =?utf-8?B?aXdSSlVHNDB3UGV5OTVKMHFzUG1TbzdRL0dlUnUzMElGUEp3akZzdlVaVCtU?=
 =?utf-8?B?V3E4dERlaVZkSzEyUlBqZXRJOU5qRXVQdGRnajZRbkVKTnB4bGk5dkVLaWRN?=
 =?utf-8?Q?27oR2ccLDrCB2XkpJFLnHQKQDsHq4WW0XHhnJEB?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a813e437-948a-4630-44c8-08d90ecc2adf
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 07:13:50.7157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYICzSP3qGM/rkEsxlLvbRqk1R23RbhUr/q4mQ8AWSrKtJMXdAPjVtJcCrgO5+LYQpo2De15nFMDTVIzICJAmB/c1mjHVBOf+3NvojlJElI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2322
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

I'm seeing the following messages on a system with i.MX8MM with 4GB of 
RAM. When I limit the RAM to 3GB (mem=3G) it doesn't happen anymore.

   etnaviv-gpu 38000000.gpu: AXI bus error
   etnaviv-gpu 38000000.gpu: MMU fault status 0x00000000
   etnaviv-gpu 38000000.gpu: recover hung GPU!

Is this something that needs to be fixed on Etnaviv-level or on 
SoC-level? And how could a solution look like?

Thanks
Frieder
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
