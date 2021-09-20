Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD5341117C
	for <lists+etnaviv@lfdr.de>; Mon, 20 Sep 2021 10:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B903A6E44C;
	Mon, 20 Sep 2021 08:59:03 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30137.outbound.protection.outlook.com [40.107.3.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998A96E44C
 for <etnaviv@lists.freedesktop.org>; Mon, 20 Sep 2021 08:59:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IB/Tf8+vFIvF3sgmC+bA0l7e5I4XYLMJeISUbs4NDDSqIRF+mvGh/YAKwwxTFt+n+7cq5JxF7tJu71bz9SgkNiUP0flsIKv+qFccFBduS79Mm75EPseNKzjY6ZXUFOcVBV+LhZAd+WLqtI+ZABVWkfS1Fxwbp7xsUajZViLXe7KmQJkRLAbpA4oqdEMV5siJQixqyYqzrk8IArw2O27IV2ScdktGUovHxJcht22AQVAUMObD3Z2iDMSyW+a4eXn1etLXUotSOVYefk0FyYNSzjIUS/V+e4Ip2D7qlocntezSaUF+Wb4nLFhZUDesE3m9uzxKpekC6sQyJOOko5j/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=OK1CKfh/Zk4pQIX+I3LMVfHHaDkugF84a0BmDeuce+U=;
 b=gdu7fPaRnDvG88i/KFLji+Enqj0vllHt6yG1u4LOISMjOfaRNmizFoC/svHbaEOFLdDYvGxYaRPRtGCcSxPIDuMDBdDppprACDyxImtooZkYnr6i/2+gbxwjAt7I3nBTJJY/mINsP5zRPTArGBGJWrqrPTngb0RWjfdjjvOT2+dgEsl7MjL/1L3AcfKZzCdJQj/5gRrWlOEaBBKjD/KtltmfAieWh+mqTOk2Brg9k5igMOxeYIhD1VPykmP9KikhMngK/CxIBUj39vk7ofswgXUl//COrxAYA2l2miXV09VF0+aSz7BCf2IK3mTS10w53lzRhX6GmwuNMAX8lRp3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OK1CKfh/Zk4pQIX+I3LMVfHHaDkugF84a0BmDeuce+U=;
 b=ZJeFCEHE5bOa+TFDXmRMXVatsHtERQa1MI1PV1qJ23xsZFyfHjDZQ8IUDbrDiB0J9qFiH8xGYkWFQkZ4IIruzCl8+YyX834J+9yjaqG9IQgXCzEpNtqGcQwyAL7ULo3t/XehV8O5npdi/c58joGWVJkb1rcP2BXC2L3Wd2qtf/Q=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM9PR10MB4838.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:415::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 08:58:58 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e51f:c969:4825:8fc5]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e51f:c969:4825:8fc5%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 08:58:58 +0000
Message-ID: <aa2b22fb-c4d1-3a89-2111-7513ab9f2fc1@kontron.de>
Date: Mon, 20 Sep 2021 10:58:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: "l.stach@pengutronix.de" <l.stach@pengutronix.de>
Cc: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: NULL pointer dereference in etnaviv_iommu_context_init (v5.4.105)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::21) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.31.128] (80.147.118.32) by
 AM8P190CA0016.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Mon, 20 Sep 2021 08:58:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a79141f4-426d-4893-ed43-08d97c14e1ea
X-MS-TrafficTypeDiagnostic: AM9PR10MB4838:
X-Microsoft-Antispam-PRVS: <AM9PR10MB48384B0B5855C160681B981BE9A09@AM9PR10MB4838.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cgfOPI4yx5f6dyxg5uMndcJYZsP1gbzL2Ed/DwKDaEzJFoZitx6+wO8fAYsbxiDIV9a6xmSbU4VAfLV/NSHHwJfYxqgL28OR1ZcLeGhf/G+G8fLT+TC5hK0WHHp8kMmzfkPgu3j17XQ8tyWHi85YQAB21wRuQwOXWDd0K1mHr4sT74WR6lPBAt4c8+3t7tkMPzlWU5ghbZdykeTNmeLi3k6PHLiZhM58EjnaMJRW+tpXJvjmEABqTnbgBLycNRshoWFMxCibvAQeMfyZkS9enSfYefClPW/MIyluL8DMP7vNuGCZ6yYqa3vsCSyUULxTdfRX1rdSYUjAXWAZqKDCu9QhVg2rJBJTgyda00KmtCVM7XYlS7e9aXWWhANHpjmGKVcpWdy5b4kWdBlftK2306d52GDiPzKcNYOe+6+n086Tjh0lFTlW8MRlRFfvqkIpod6wUZ1FxQIP/Ir+a5qkbdP3egGL0tY3LuDmzBiHT0cKlpvM2193PZRy5JRfiFNGpyFpnbp7dY4kaAS4tLTU70z3OZmqq72ZjrueziNh8vQJDPd+R/07kckX1KsEmMLwPDUNbVvjTPqUSqqku3QDrMavO7nhX8UtwDsZzriAXcfwf7VvjwJO1IhmZivZ3OiPr6hFCk/b+Vjb5drepOx61lY83HNv5nTCEI48VxSlaltxn1LOSQ3NZFZJLjDp3epIz04t5DOsZ1xPCj9gFS723bepSL/37By2lrvpFmnmcmQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(31696002)(38100700002)(2906002)(66556008)(66476007)(45080400002)(66946007)(86362001)(2616005)(956004)(26005)(44832011)(8676002)(4326008)(36756003)(508600001)(6486002)(31686004)(83380400001)(6916009)(5660300002)(16576012)(316002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3pPNGZXNVR4U2JsRU45RThHRGR4RC9PZlNRTEVpSVdnK3ZHVlZDdXhhMFpi?=
 =?utf-8?B?L3g1ZWFYYnJBLzVkWXdVTzc0dnpTUlMzVzc3V0ZhREFsaGp1bzAzbUR3THJK?=
 =?utf-8?B?NnFuQW5aankyVWIrUEt0S1cySitiSENnbWJVR0dtN0pmUlp2b09mR09Dc2lM?=
 =?utf-8?B?WGl0c3hxUlZlOHMrVVZPY3ArWUhuS1JRNEszRjkvUTc2MHUxK0pRVHpDZC96?=
 =?utf-8?B?LzNzdmVRZEd5MHNidnp5M3orS1NEdGxHdHp3bm1NY1dueDNRM3cxNDBUOFNX?=
 =?utf-8?B?VXdTdk5JSCtYYzhNcWk3M0hKcEdqWU52K1BGaG12R1hzaW1yd2w1UGdrdWRL?=
 =?utf-8?B?Yndyc29LcHhobVQwYzdyVi9ZbnIvWGhzNDJWTWpnM255ei9adktvMVlkZzJ4?=
 =?utf-8?B?ZEcwYzhiSzZkRXJWcE4xczlKemFzV3NhdVpnUkc4VktURkN1TEZmaGIyeDZi?=
 =?utf-8?B?czl6ZWdXOEhlNVNERWZHQmtHb3NML3pZcjJyVVl2QVYxVWQrUTZOc1N3Znlq?=
 =?utf-8?B?bDBXTVFITDZEeDlGZlh1Y0lXd2lSU1V5c3Y4bzR5cmpHMWs0aVdyZFFlOXlr?=
 =?utf-8?B?VXV1c3UrdEpKL3BjUDY0OXE3eGFjM3BHMkkzMnViWGROUWlwc2ZuMXpkbklZ?=
 =?utf-8?B?UFp1UWZLdWpqZTBXRWM2Z0krUXBRd2RPa3hJRmVpcVp3TVhadDFubTgvTjd0?=
 =?utf-8?B?YnpnSEJOTTk3ekpvNThIVHRmYmRWNmtGVWMxMXRQS09QSGE2Y0M3bTJjcGdv?=
 =?utf-8?B?ZTlJTG0vWW1idWg3MGZJdit5YUxQVnE5RFowTUZRcFpqbEpGc0p4QWdpVnc1?=
 =?utf-8?B?UXpKWCt6K3BlaUZwQjhUZS9vbEl0clJvUjE1bXljbzRpV2ZZN0dQMXFkSisv?=
 =?utf-8?B?TUlLU3JuMmtGeDMwdEJ1U0c0VjQxMDFLMlJwRWV5UCs0OUxCVXJ4eGI4NG5m?=
 =?utf-8?B?cEFwMno4L1pHSXNCejVMeDR0R3VqVlNsK2k0cjBnQWZGdFhIemtFR2tVQjNK?=
 =?utf-8?B?VXFoQVFkRzBMUWhZQ3d0T0p4VFhzc2NKUjVlNkc2bUc0aXZXNlR3SVJjU2JO?=
 =?utf-8?B?ajlBc3lkRFJuSHRJYm4yMWtrUjA4VC9TT2ZpbFNSNHFFUXdYeE9HYnNCK0FJ?=
 =?utf-8?B?TVhYZmI2MHFsbVIwTWVWSkU5czFieG1sSG1DRGRXc2M1aDV0M0l2Y1B0RmJm?=
 =?utf-8?B?WTJjNjRSeFRTZXhJb0VsTGN1WG9qd01iUUhYL1NhNW1MNGQyUDFoVHZzc29U?=
 =?utf-8?B?VVFMN0JXMDVkeEpIdVEzaWhlbUNyalpKQit0SzlkUXhBbmI0eW9rcHVmcnVZ?=
 =?utf-8?B?eWZBWGphcG9IK3FpcW1rSWtxNDB5NXZJa041NjNyTnM0T3JnaG4zSUI0OGdj?=
 =?utf-8?B?L3pBeVBQSkJlK3VieHMzNXhla2NDTWFaQThQTWRCWkJkOEZudnBtdWhYb2ZF?=
 =?utf-8?B?eDkvNGZKRndBZ204OXUyNXNkNVlaNUdBTk12TXZWUGVPQitsS3I1ZkJkVlA5?=
 =?utf-8?B?YlovckNZSlVpLzRjdVFNL292ZFl5aHN1ZEhNU0svdEErcGdMcFNVT1MrUGN3?=
 =?utf-8?B?NU1Hb3VBUHJoamNHZ0ZsWXg1UWQrVXdIZUFOMEcrejdGZVFYd0htQXllQnU3?=
 =?utf-8?B?T1FLVklvMVdXWUxydmMwdE1KV3VRZVJ5ajQ1OWUrclg2dXdzb2ZoZHRrZHhX?=
 =?utf-8?B?eTdIMWQ1eXlIRk5sSEV1eGpqZHliSEJFcTJxZmkvd1NZdXhvUVlxazdTNEtS?=
 =?utf-8?Q?QeTi78umuBfMFtn/o3fuI1r/RbocMoD1PUt4XoN?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a79141f4-426d-4893-ed43-08d97c14e1ea
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 08:58:58.2704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+uOwATGoCDTCKKbyRTk0K9zniN+d2LlE1PA/eDCAM5txXYDr4pIRbXeinfFZii5/bFvgxUomGNtMzpxTIcsNxl+9BC22GliydDcyryJVuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4838
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

I have a report from a customer running kernel 5.4.105 on i.MX8MM with
the stack trace below. Do you know something about this or can you give
a guess?

I saw that there are fixes from you targeting MMU context handling that
were merged recently, but aren't in the stable tree, yet. Could this be
related?

Thanks
Frieder

[    5.172688] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000008
[    5.172697] Mem abort info:
[    5.172699]   ESR = 0x96000004
[    5.172702]   EC = 0x25: DABT (current EL), IL = 32 bits
[    5.172704]   SET = 0, FnV = 0
[    5.172706]   EA = 0, S1PTW = 0
[    5.172707] Data abort info:
[    5.172709]   ISV = 0, ISS = 0x00000004
[    5.172710]   CM = 0, WnR = 0
[    5.172714] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000b7e01000
[    5.172716] [0000000000000008] pgd=0000000000000000
[    5.172721] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    5.178295] Modules linked in: powersupply(O) nsam(O) egalax_i2c(O)
GobiSerial(O) GobiNet(O)
[    5.186762] CPU: 2 PID: 313 Comm: Xorg Tainted: G           O
5.4.105-gnt #1
[    5.194265] Hardware name: ## redacted ##
[    5.194269] pstate: 40000005 (nZcv daif -PAN -UAO)
[    5.194281] pc : etnaviv_iommu_context_init+0x18/0xc8
[    5.194291] lr : etnaviv_open+0x50/0xe8
[    5.213198] sp : ffff800011b43a00
[    5.213204] x29: ffff800011b43a00 x28: 0000000000000000
[    5.221850] x27: 0000000000000002 x26: ffff800011b43d10
[    5.221855] x25: 0000000000000000 x24: ffff00007a1c3200
[    5.221858] x23: 000000007c2e0100 x22: ffff000077e08000
[    5.221861] x21: ffff00007c2e0400 x20: 0000000000000000
[    5.221864] x19: ffff00007c2e0380 x18: 0000000000000000
[    5.221867] x17: 0000000000000000 x16: 0000000000000000
[    5.221870] x15: 0000000000000000 x14: 0000000000000000
[    5.221873] x13: ffff000077e08000 x12: 0000000000000000
[    5.221876] x11: 0000000000000001 x10: 0000000000000040
[    5.221878] x9 : 0000000000000000 x8 : ffff00007a317400
[    5.221881] x7 : 0000000000000000 x6 : 000000000000003f
[    5.221884] x5 : 0000000000000040 x4 : 0000000000000000
[    5.221887] x3 : 0000000000000004 x2 : 0000000000000000
[    5.221890] x1 : ffff00007c2e0400 x0 : 0000000000000000
[    5.221894] Call trace:
[    5.221906]  etnaviv_iommu_context_init+0x18/0xc8
[    5.221911]  etnaviv_open+0x50/0xe8
[    5.221917]  drm_file_alloc+0x11c/0x1e0
[    5.221920]  drm_open+0x94/0x198
[    5.221924]  drm_stub_open+0xb4/0xf8
[    5.221930]  chrdev_open+0xa0/0x198
[    5.221934]  do_dentry_open+0x110/0x3b0
[    5.221936]  vfs_open+0x28/0x30
[    5.221940]  path_openat+0x4b8/0x1280
[    5.221943]  do_filp_open+0x74/0xf8
[    5.221946]  do_sys_open+0x168/0x218
[    5.221949]  __arm64_sys_openat+0x20/0x28
[    5.221955]  el0_svc_common.constprop.0+0x68/0x160
[    5.221958]  el0_svc_handler+0x20/0x80
[    5.221962]  el0_svc+0x8/0x204
[    5.221970] Code: a90153f3 aa0003f4 a9025bf5 aa0103f5 (b9400801)
[    5.221975] ---[ end trace 0d8e2dcf004ee953 ]---
