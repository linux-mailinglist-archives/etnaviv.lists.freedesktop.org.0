Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646513727D3
	for <lists+etnaviv@lfdr.de>; Tue,  4 May 2021 11:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6086EAA4;
	Tue,  4 May 2021 09:09:31 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40097.outbound.protection.outlook.com [40.107.4.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310A06EAA4
 for <etnaviv@lists.freedesktop.org>; Tue,  4 May 2021 09:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSb+Y3/oTWWhZdZi91Qa4msvjJM1w4dvvirBc3PLh6/Mwb7yG2F0hhvNrlBNUyRt3aqDcROwOqrhsp1a9/s2j7eQ8ndSLsjyeC/lFSjLUaGHt1GQ/j1y0QF1hLTnMlJXDJ9k2nT2C0EL4QjZmrIRvAKNvDUUQhV16h7cJBpPt6kkSIgWdhgQVcF28kYey9cHVMxGfdjdFye4V27DJ+X7Y5DNZsEarSqXigoTtbARWLvwx/g/Ztvb2PfOHmXMFuR7dqgtr3NFLbGMnK81SYFbJxveB6yY5slCfOn6TJthx/XQBiuxTLdZFcWT2lS0bsc+5nRE5a32cUIunQI3BsCtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUAbXrJ04ZjM817o2a3zDo4QXcAdrlh39vHybVJa6mc=;
 b=JfZqocqVk4DPgMB/GZWA3VMUaVTEu1uuCnCDmTo3gS0ceoh0nQEG8AlMjY5q0IUM33PE12pLFyrS2+JmYhnYLm02dxAyG9AAV4ElFCoF887yQ2xvtzS0tRaK12akAFTLqi0cVSbdmC5HmXqbDwtkEn2D4y1yDboTA7db+EcVWcibQaD3FpnMm6vjywC4ikdjwYSQGtRqjPf/QHg0W7kDhIBvF0hozppZBJLzV0VG1ytip01FOl5wAYi6V8GTCh+bDpWoeIHaUMFzfuCl6+Mb6iLX2m/jav4dnjQDd1WH3sMIoch2twCFrrawc9RIDzLB0Jl0vcAfH0QGi8rAnrUcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUAbXrJ04ZjM817o2a3zDo4QXcAdrlh39vHybVJa6mc=;
 b=i3Md6eaDVy16S3m/Hi2/INMO2CHMrnv+97H29DaN8D3za1aKaUF34N3rW1uAQYmlAbTA17kocmor4DJJPRDYmMtiOWLjLt6CNax+TG22XwYP2RbcEpLG4HluC7NVLa/VaLKK2VOd+IV3xUW4/8Dn3lB+dC8buCOd/HAbExeF6R0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB3427.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:159::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40; Tue, 4 May
 2021 09:09:26 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 09:09:26 +0000
Subject: Re: i.MX8MM Etnaviv Bus Error mit 4GB RAM
To: Lucas Stach <l.stach@pengutronix.de>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
References: <27902169-35c8-b4b1-b12b-17f8ad8531a2@kontron.de>
 <01197fdac2c5b5546f189a2f3156fe24da2b9e6e.camel@pengutronix.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <f19de98f-bb82-6edb-fe0d-e463526669ed@kontron.de>
Date: Tue, 4 May 2021 11:09:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <01197fdac2c5b5546f189a2f3156fe24da2b9e6e.camel@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [89.244.177.213]
X-ClientProxiedBy: AS8PR04CA0198.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::23) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (89.244.177.213) by
 AS8PR04CA0198.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Tue, 4 May 2021 09:09:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b84998ab-2755-4fd0-5efc-08d90edc5116
X-MS-TrafficTypeDiagnostic: AM0PR10MB3427:
X-Microsoft-Antispam-PRVS: <AM0PR10MB342774D39C0A917CB8749D9EE95A9@AM0PR10MB3427.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+PbM4MPyszi/GYh3uC0iTt2LBSBmyKFHlbvquxkfDail7sc0StLC75n15L3hE4IgnWcfZx9XxBMtIaA5hyN9033kgaCV2Zyf2W7AN/otnp0Jttg7P5knYtg7T7gO21wmE1YxRSVpXXvIYeRFcGGNSHvAyX5bRNYVYqOvk9zLlBhe89zmKISLMOa5/1uFCJDeSnFjl35aQkI+VTldOwvzMeIAvS8GCAUaz106nhwIGTEpY8U/iD0qa8dz7OPNkHjr3H9bjCQFalMqoUHpho6VhxLIdW8JOcFbrkj//Co7puZVMTm4/ZlFwabMqotEWXoeYAbKrNOZquhjl09GX5NerviVHyS+kTrZtQU7L7r3sLnr7ydz4143wG9s4X3ALl1LYFq7jJchP8FihvotSYgqJXFh0jSBPy9pK/6zSWASqzi1iZi9o/U7vlDRJngxJ3AbonCwkU4ofnmm5r27rptZDn2sIg8Vg28zILvc8FKUsSv3yT8uB2zNqeuuIOw5h3I2TEqCfXeES4KwyO9VfTI2kjsliLnAO8BzKyZtgtgB6ynOButwoSC86gWi73kv53a3Yrr+01kYk+TC22wOyRqYGGGvvpkYm0y4NzLp7iA9NI7Ff06jdOEGLer6NHALJVHqwyCes1gZTpfNV25zzINRJhKYQlQkUNv6isnbofOfe/Hlul7MYSXOl5eX7sToBIE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39850400004)(83380400001)(8936002)(2906002)(5660300002)(8676002)(31686004)(26005)(31696002)(66476007)(66946007)(16526019)(66556008)(86362001)(956004)(186003)(316002)(2616005)(4744005)(38100700002)(6486002)(16576012)(44832011)(53546011)(36756003)(478600001)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NW81THNob1VUZExzWjhrd0dybmpKbjROU1ZTN0NOOXFKMWZiVzl6MCtFbTVn?=
 =?utf-8?B?RlFOMzF4Nkx5bzdBRXJwMHhrcW90b3VZeDBSNUhWQkZiZG5oMUlHTmVwdURs?=
 =?utf-8?B?YlZEU3hLRnpHRm1YVEt6UlF6SGZKb1VHbTNzaHRxMzhwZGJQVVRGR05xR1lu?=
 =?utf-8?B?Z1cyWDRTR3M5MGM4WjMyc3BTTWxjZ1NZTDlTb3ZjUjcyb3l0VHdZdXRWak1i?=
 =?utf-8?B?K21BWmFxWUo5aFQ3eERIVUV2SVBBQnNudlpkL2YyZittcmNPbWRwMVhsVFY2?=
 =?utf-8?B?L0lWTHBzNUNPN3Q1TjZwRS9jK3RjdVUxcTlPc1E4Q3pOUkREVnZ6VUlFU3Fj?=
 =?utf-8?B?YlQ1MGw4SXVaMlYzd3A3VzAzaXVNa3ZQMjNJcnl2RER6eHVGOUNJN2lUSzFG?=
 =?utf-8?B?SEwyRGt1TkhLU3llRkZmWDYzY3JkcXRVYnpPNTVSaTdWbXZwd09PNGN3bXBT?=
 =?utf-8?B?bWdYeFNKZERwMEZ3OUw1Sm1qVG1tNGsrTzdQc2NPMTZQbGE0T1R5RTlnK3hR?=
 =?utf-8?B?TUtHRnpER3hsbHQ5LzViVHpMb2t2R2hkUHI3YWpXb2srV3JEak9QVW5zR3hC?=
 =?utf-8?B?UnZrQ01aaDFuMkhLcTByY3ZZaWxqOXZFekxwQTFsMThHcWd0bFphQ2NmelVC?=
 =?utf-8?B?UmtsdlB1aFRwTDlvNFMwMlFZWkJzc1dHelViYWM0Z3J1NlVXcDY2Y2VyYXo5?=
 =?utf-8?B?SUw2TlJCTkhZeGxMbVlKNnNPTW5GSFdsNkhXQVBJZVpwOGo2WVFGZzVpaVIx?=
 =?utf-8?B?dnkwbXVnTnZlR2VPeWIwUmRkTlkvSFVjWFQ4TXlSMG9YazNVQjJkc0thdWl4?=
 =?utf-8?B?bzNpUUVxV3NFMWwwdDd1VWdWeG0xeTExVEEvTXh0SUFJdlVpWEcrVFIzMy9E?=
 =?utf-8?B?cUdFckZlZVNSNURDaFA0dGlZNWxCYnAreVJldWpRNzR1cDlvM0E4RngwbFZN?=
 =?utf-8?B?NHpDNnBHWXQxVW50VmcvK0NEOTFYR3VtYU5vOU9GUXZIeWJheCsxZGxMaEU1?=
 =?utf-8?B?Y2tSK0orNzI4RTRKU0U2bWwvd3h3YkxhMHhabHRld0cvNWMzU1RnWGVLcG1F?=
 =?utf-8?B?djl0eHluN1FDMjhHdVlRTGxoVkxxbXljSXZFQlYrRHdCK0Q1UGdkWGVlRnJL?=
 =?utf-8?B?YnBhL2EwSHVxaUNZaXFjcEpZOXZ3VldsOHMxRGMwWVpVenBockw1OXBuY3F0?=
 =?utf-8?B?N2pMVi9zTlZRcU1VcG5VSHRCVTMvWVF4VXFJaHdybzlKSk9ZcjZWSEdKYklS?=
 =?utf-8?B?VWtaUmtxck9UaVVCWmJlU20zdXVuQkVPSDMzZFhkQXgxdzhHSm1CZEJneUhN?=
 =?utf-8?B?Wk9tS1prWlYvQjYrRnJpeEkyWVgrQmJBaTZPVEJ3NnUrTGZTL2hFc0orUTMx?=
 =?utf-8?B?T09RNWs1dEluR1JDeHNOUERYSHFuL1ZpSWNQdnlOd3ZlaWRCanJxbU9DZGs5?=
 =?utf-8?B?bmtLUHNpdElHcDBDUkxyTU0rRmN6VHU3c2ZhWUtVZlBHRVlVS3FCYlFiRVBO?=
 =?utf-8?B?VVc5T2plTUsySkNBUE4vV2Zub0lVQXBiZG53M0lRTW41RkR2d0dVL1hQNXFi?=
 =?utf-8?B?UGxwc2ozOXNUTkFzU0ZGTFc3TkNXdjhpM0ozbm9wdWE3TVA0a3FTR1RwNjlU?=
 =?utf-8?B?d0NqMUU4SDZvcVdXWVgvQkg2UWxmaXk1RDRxVEErVVUvYTJjTEEwV3JCNHdF?=
 =?utf-8?B?bFN2QU90amM0V3dCRFl4ZWxPams5SUF1dmF1THBONVZteExaTmdCZGNuaytX?=
 =?utf-8?Q?btCeWAIoQDlCiObpDzoLDte6XvnzMj/wo4sBdzp?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b84998ab-2755-4fd0-5efc-08d90edc5116
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:09:26.7329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Syzuaq/Bk5ZlsV0bDb9PBkBxXcAVU4xveTg3ej11u4JwE9b0jdkH1+UIRKLPiuTNbLMgBC2HdtzqEDXQGkngp2nptitSP7CnvT9LwOu1L8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3427
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gMDQuMDUuMjEgMTA6MjIsIEx1Y2FzIFN0YWNoIHdyb3RlOgo+IEhpIEZyaWVkZXIsCj4gCj4g
QW0gRGllbnN0YWcsIGRlbSAwNC4wNS4yMDIxIHVtIDA5OjEzICswMjAwIHNjaHJpZWIgRnJpZWRl
ciBTY2hyZW1wZjoKPj4gSGksCj4+Cj4+IEknbSBzZWVpbmcgdGhlIGZvbGxvd2luZyBtZXNzYWdl
cyBvbiBhIHN5c3RlbSB3aXRoIGkuTVg4TU0gd2l0aCA0R0Igb2YKPj4gUkFNLiBXaGVuIEkgbGlt
aXQgdGhlIFJBTSB0byAzR0IgKG1lbT0zRykgaXQgZG9lc24ndCBoYXBwZW4gYW55bW9yZS4KPj4K
Pj4gIMKgwqDCoGV0bmF2aXYtZ3B1IDM4MDAwMDAwLmdwdTogQVhJIGJ1cyBlcnJvcgo+PiAgwqDC
oMKgZXRuYXZpdi1ncHUgMzgwMDAwMDAuZ3B1OiBNTVUgZmF1bHQgc3RhdHVzIDB4MDAwMDAwMDAK
Pj4gIMKgwqDCoGV0bmF2aXYtZ3B1IDM4MDAwMDAwLmdwdTogcmVjb3ZlciBodW5nIEdQVSEKPj4K
Pj4gSXMgdGhpcyBzb21ldGhpbmcgdGhhdCBuZWVkcyB0byBiZSBmaXhlZCBvbiBFdG5hdml2LWxl
dmVsIG9yIG9uCj4+IFNvQy1sZXZlbD8gQW5kIGhvdyBjb3VsZCBhIHNvbHV0aW9uIGxvb2sgbGlr
ZT8KPiAKPiBUaGlzIGlzIGEgcGxhdGZvcm0gbGV2ZWwgaXNzdWUuIEkndmUgQ0MnZWQgeW91IG9u
IHR3byBwYXRjaGVzIEkganVzdAo+IHNlbnQgb3V0IHRoYXQgc2hvdWxkIGZpeCB0aGlzIGlzc3Vl
LgoKVGhhbmtzIGEgbG90ISBJIHdhcyBzdXNwZWN0aW5nIHNvbWV0aGluZyBsaWtlIHRoaXMgYW5k
IHNvb25lciBvciBsYXRlciBJIApwcm9iYWJseSB3b3VsZCBoYXZlIGNvbWUgYWNyb3NzIHRoaXMg
c29sdXRpb24sIGJ1dCBJIHdhcyBwcmV0dHkgc3VyZSAKdGhhdCB5b3Ugd291bGQgYWxyZWFkeSBr
bm93IHdoYXQgbmVlZHMgdG8gYmUgZG9uZS4gOykKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ldG5hdml2Cg==
