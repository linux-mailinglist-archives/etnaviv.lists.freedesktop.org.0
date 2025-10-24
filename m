Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84C7C06327
	for <lists+etnaviv@lfdr.de>; Fri, 24 Oct 2025 14:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CFA10EA2B;
	Fri, 24 Oct 2025 12:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=richard-wolf.com header.i=@richard-wolf.com header.b="Lb9wUikr";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023074.outbound.protection.outlook.com [52.101.72.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5E410EA2B
 for <etnaviv@lists.freedesktop.org>; Fri, 24 Oct 2025 12:16:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eE4TGt9+niDDai3GM5CjbV5xuiL4xuzjosCWxBorKmqM4C+c5hMF9hbGy3m1i2mO6SZ5v8cAWMAfmmEzPQXmkw4uie1h5mo2R14uGleDiy4S9sv+OzOfBnCqvjEzisNdl4rj/K582W9shTsDyI77wgxZg4Fc+Exi0r4rLoswGB93eNVQ18PIqORwWtiz4IeRfxTpjO0OgXgoAMF2AHJ6m0BhDe+Kq5dT/4uEX9eWjKcnBnR4+CY4hc/WxIT1EVz+azLka4bJMTsFYRSejj1VVgLxDWIfNHju3vGe6vcmT/JEWW6V2On/8SewkVzk34XMtNL3BFKXYgqEmQ0HGv1rdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MGw7iQs1/KjNURNKPsK2a/NxGMCcabtJjJf8v1NdNI=;
 b=xmcatPjaCOLR+sE5i7IoxqSgt3uXts77joXpo6yoYoeVLpsY98FQcO3Gj7e4cyWa9d24PrC53LkCNi7XQ6g0s88gaRq50vm2xeJhnZwtIUVmr+Bh6QTmK3p2UqL/M0sKPkuJwKjxx1DMr+uqaKXxMdMYEQ5UuDAY8vw9aqp+bEYpup302CIFYTwwSzs+hNCeqJ72eogBllCRyQxTyFPigBRMIdM2ODgHvWhlMmtjaWv5Gc1KFBm7+85ppTRPaqdcD6MEOsVf/DLwXIJ7iBMr7REgNvaiP9tRk01X2rdp+mLkhX0ltHdb6dRa6YGmQqq8Zu/5MTUbS1VxJavEtuflkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.222.204) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=richard-wolf.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=richard-wolf.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richard-wolf.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MGw7iQs1/KjNURNKPsK2a/NxGMCcabtJjJf8v1NdNI=;
 b=Lb9wUikrja+LxWw//yTKHFQuwEiPd0h14YGNcqdkpaa52E95f+LpKbYvWsQUj4zuiEbH4/gMgaM8OBs+KO9H3w7X2RQbnfAhid2qGBPoQQfEMsSWi6xhgDqcBye/YlzJqgpOUVn971yveU2CwF2nzHK4wATacr2LeTmD/upm6bD5chDgTxfeAgECv+viza+Zm+hskxJFdXIrSuvk6fJg9kyO3xWOkbMiieegn46vcZQnYmtxlN6YnYJF9PiMnhYWYLYDamysxdKt+Y0JsY0kzE0+J6esn1LmhXapB+PYxjuRz+iQn29ZxoUqZP6hgBK8uVLC9YRJxxfCuh6zhE31uA==
Received: from AS4PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::15)
 by AM7PR03MB6328.eurprd03.prod.outlook.com (2603:10a6:20b:141::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 24 Oct
 2025 12:16:34 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::67) by AS4PR10CA0012.outlook.office365.com
 (2603:10a6:20b:5dc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 12:16:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=richard-wolf.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=richard-wolf.com;
Received-SPF: Pass (protection.outlook.com: domain of richard-wolf.com
 designates 20.79.222.204 as permitted sender)
 receiver=protection.outlook.com; client-ip=20.79.222.204;
 helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 12:16:34 +0000
Received: from DUZPR08CU001.outbound.protection.outlook.com (40.93.64.67) by
 de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Fri, 24 Oct 2025 12:16:33 +0000
Received: from DBBPR03MB10462.eurprd03.prod.outlook.com (2603:10a6:10:532::9)
 by VI1PR03MB6367.eurprd03.prod.outlook.com (2603:10a6:800:19c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 12:16:30 +0000
Received: from DBBPR03MB10462.eurprd03.prod.outlook.com
 ([fe80::3e01:5bef:b8e9:b291]) by DBBPR03MB10462.eurprd03.prod.outlook.com
 ([fe80::3e01:5bef:b8e9:b291%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 12:16:30 +0000
From: Wagner Andre <andre.wagner@richard-wolf.com>
To: moderated for non-subscribers <etnaviv@lists.freedesktop.org>
Subject: SimpleDRM an imx-drm/etnaviv handover: Is this even possible? If yes
 how?
Thread-Topic: SimpleDRM an imx-drm/etnaviv handover: Is this even possible? If
 yes how?
Thread-Index: AQHcRDRKODQPMLZuZEOognfkdHRsrg==
Date: Fri, 24 Oct 2025 12:16:30 +0000
Message-ID: <DBBPR03MB10462E2FD56F6C2EC274A8FC8B7F0A@DBBPR03MB10462.eurprd03.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=richard-wolf.com;
x-ms-traffictypediagnostic: DBBPR03MB10462:EE_|VI1PR03MB6367:EE_|AMS1EPF0000004C:EE_|AM7PR03MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 158b980d-88d1-4b06-5a35-08de12f72c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|8096899003; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?CWYXEEaPSAC7a4vQjBsQ3pgubc+MaeS3sLPpV1rurle0MccUVFYoLUI7AqJT?=
 =?us-ascii?Q?Uxihvzi4cFa1Ks0MOgySpv1J6a/NAYz+kLcrkBOGbTq/A9mLoAXkslPMcI+m?=
 =?us-ascii?Q?rK/H5z4H8yGHt0T8EwsawlpqT4TO9eWNU+aOopCjO1biW8RoY7j+4VcSVhQL?=
 =?us-ascii?Q?cKFeKNtiP2KaR46AOj//eWm2zvd937VsutyuLJMcwpzhJbiluUaCDnWAPmGN?=
 =?us-ascii?Q?TbzhqGs9dS9WOjobUP9i85r0tOuM/KCMgDTMB4fTkrfjeZO1xb3kdWmSXm+b?=
 =?us-ascii?Q?/VPrO3N4vvJlQRzYb+3sSS+aE+e5FJFOtiuSeoNHtc1Nq2fRwnGJDNq9Hy0d?=
 =?us-ascii?Q?bJb0D/dkuHuQ+3gwPg6+9Y+mBcg2V7AcI81r4xoJOVjJHaTHt92+F4VExbrt?=
 =?us-ascii?Q?OkfkdCMpk3Ok/LTga5st7oj1LN6g6HW5dNy3/f83czhTeHBTuNhaSkYSC3VT?=
 =?us-ascii?Q?ieGUKBPks8zvK9OyDDT240JwuEKKgu+jQZdJTj8pG73HVT+VR/4gOrmY8HXs?=
 =?us-ascii?Q?5uOWq6XpM+kJI3pkGe5k9zV71nUIBYWMYVMjwXjnebTBop56QlR9ksJZV7MG?=
 =?us-ascii?Q?odNDQdOokvkSRlyaY3IvJ6zTLsRf7CVhS2rSq0UymQiE4/843hRPJjxK+6L5?=
 =?us-ascii?Q?DYIRRnYO78nw7Iq0a42iXICzabiGZ+WalPHclfT/dAAQvH+JDuO2ZJU9HToL?=
 =?us-ascii?Q?G8h7fH6LsHj2LeO8reIVzABlWwCeqSCC0LhDwRk61Gvn5nPzg7NynLLLIT7r?=
 =?us-ascii?Q?bnMb+0QU9ytSL/T1uAyUheC7Fmw1//KEyJbqTLE0S4u1VaSJj0s0KtQYjJzx?=
 =?us-ascii?Q?fnF1dGSIKKkXyqtdzIEaCwvFKYU8aJPaHYikM6pNhZG48ttlh+HthlgJRrtk?=
 =?us-ascii?Q?qASCNrfhOgKEKjNMoSrjpZnSSpaPOSWyoou9qyIBHK31DfQ429eZ6MdI0Rad?=
 =?us-ascii?Q?TCwMCnQ+EedAzbjwtY0quVeBb89ygJlbZc3hN39nNwqG70amvnzIzslTuAKU?=
 =?us-ascii?Q?VbEOSbBIaq9ay2/nIX9vJmKVqdp+VWJmu1OfAeNMlf/uJxX7qO6UFpDH+d64?=
 =?us-ascii?Q?wYU64mzp7GD+laCEsVgIaE4yZgka+9VTlVhbB9d6xo23gXmVNyts2dvh2XRU?=
 =?us-ascii?Q?1PKWAY9VkPnVOOwKMzEqhgDlvaS2VnPGxLXEGOkXOb+WrqIcDST8QF9RN11N?=
 =?us-ascii?Q?j16EF2d9AAl//2ueLssDJeE9R0qmkrIm0XU6jMyYy87JcZz9h1+qJSDr8LNG?=
 =?us-ascii?Q?Upc/Klbp1Y/hH6LQ8a0Ip8MwfVdLqWKnkt98jNFERnzpH3ESlfY4mgLke6xA?=
 =?us-ascii?Q?Cwh4K4dMdi/2pC9cyw17KulWKbU2Vc8UJPamUFwwN+UcbTLxlVTow68qEQLh?=
 =?us-ascii?Q?7vkCG3/ws+8wiZnFzepDIDvOqju1G0LBqcBMTLzSs7cQFxoP+kiBYsykbSGE?=
 =?us-ascii?Q?NFuK9ShqerNFZynj63Glik57tvNgHj0YPvZXe1h5XepzAIS705JQHyP9Ki/U?=
 =?us-ascii?Q?9NjbwizkKugyw824WEZEPt0Gk21mud0+Yd67?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DBBPR03MB10462.eurprd03.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(8096899003); DIR:OUT;
 SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DBBPR03MB10462E2FD56F6C2EC274A8FC8B7F0ADBBPR03MB10462eu_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6367
X-CodeTwo-MessageID: 1abdc0c2-58ce-4768-8ce4-474c3ced2420.20251024121633@de2-emailsignatures-cloud.codetwo.com
References: <c4e6fa63-22af-4704-8cd8-60695c6a1d9b.481ae2fa-6fa2-407d-9d99-af8d6430072f.26b5ac5c-c171-44c1-95a0-c5dc15b1f6fa@emailsignatures365.codetwo.com>
 <c4e6fa63-22af-4704-8cd8-60695c6a1d9b.a45007e2-be76-4ed0-b1ad-172f8b66e281.faef79c4-35ac-4c31-b189-98f88b0aba8b@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e88cfc4a-ff76-439a-9c8e-08de12f729dc
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|1032899013|1800799024|69100299015|14060799003|82310400026|36860700013|13003099007|2066899003|4076899003|8096899003;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SV/VWwumKWIl6+Q5HKm2zVPMdKD6fXu/lvJ0+fpZljkbbNc3WA6rB7WY8o?=
 =?iso-8859-1?Q?jTSLuAcVIPCt+LoQ5iJpcwl0MnNlPcLkI7qfbsQJlZq74fuC5sPTswUbx4?=
 =?iso-8859-1?Q?bB3WjJwZx+6RxkCZ4RawaaZ7ThA/e3fEs9t6uMAjqJyPRxOCbZ/hnZZ8Tt?=
 =?iso-8859-1?Q?rIFtE/X4Zqc78AmakT33IulgBZWIQSAo8D2UU5oL97pWiaZm/Q1iKBNGvs?=
 =?iso-8859-1?Q?MjuayFSZjzPOcDUS1Phh4BHvrAw1Q9sleZbv4U2sD1wtFqK1rAkJi6qnfY?=
 =?iso-8859-1?Q?/RYz9qDy1fm02bkQ5IOSHBqBoURwTP4XVUIzQ6EB3SRkK21D409+bvttLv?=
 =?iso-8859-1?Q?yc5DiEWKb21EYiLyNO8qkQH8iQOdgX8J/Is+DQJJROxaPG0EnhXBY/fil+?=
 =?iso-8859-1?Q?tJwH02hArM74bb4zNhTOwdNUqXg/2ZYg9dDSE3QCXV7UsqQHIMrWw20W69?=
 =?iso-8859-1?Q?/nJVws8Vg2ysLZ17zb7rltK4XNxLmmfJvYJMOWwVFVF1xPsIc2O3LrBN9J?=
 =?iso-8859-1?Q?jxhgwu9bsyI+DcNA8XI24FZ7I0BK7B144G88lV7+N5H2mb+gsEVB0N0z7O?=
 =?iso-8859-1?Q?uNN2O7zAvVQWHRYlPqZDQ79tMHmeDk3eDhhxY1hE6Sdvs1bCXn3CUgdnrl?=
 =?iso-8859-1?Q?eWrNnCP0miBV6ukqXui4Kx8u/ShH9lIZhKBMcHItxfLFerNTMDCMYfwnun?=
 =?iso-8859-1?Q?/o5SN9jld3fQkbn0R62G9v7llsh7rDssKmKAdua2gLDOY50sMzZ34TCFEJ?=
 =?iso-8859-1?Q?qB6wIEBjmplsZ+bHqc0V/FxqgJ3nZBXfPBfsEYXenTLzRKCLlBFSCsFJ98?=
 =?iso-8859-1?Q?tIbkRMJ+YiH/blUM083ysZGrFTmKM+IkjMtS9UetfBM2zoShdnWjS3uuax?=
 =?iso-8859-1?Q?qqjX5FD4bELaAK02Kfzm5xhKy3aY5TtoKy1jURoPHcSvy1ntoxaKz/FWpS?=
 =?iso-8859-1?Q?MTALJrmWu6UbvmmZ7k8Tkr5DBrvp2qH3HbAoTLHMRy1eLSicy5pIjkZ21l?=
 =?iso-8859-1?Q?QIBtp+lcwXOgOLW4644NYGOIAHj+hP4zYorC7iJrsJik0D5PhPga9Tvazv?=
 =?iso-8859-1?Q?Zx8TrEzXc2j33PI4fkNkFhsxywfNEK54tPfDRDtE9y+fQrUAB+ZXRdvL5/?=
 =?iso-8859-1?Q?zpZMQEgJ3adwBpOK3zlHT7p9lUMRYA5jo1b/yAdmgrz0cMfQs2drIetX42?=
 =?iso-8859-1?Q?q8HVpuN7eOQRrGwUG4/tmOdNlA25Vijl894UywVl2jYHlOB7y1IvA5Zb2w?=
 =?iso-8859-1?Q?/dfdBstmqjUmvQU12S87aB4JXYwjKDAoLylLRbsR2FhvuygVR3xmJ03KS1?=
 =?iso-8859-1?Q?2Il4e5ujW7yInamCZ/DZX9eLcIL9JzkE+qBF4nbIfuTpemlOauzwLxOwVw?=
 =?iso-8859-1?Q?c10c+gK8yPIQxMb6VjM+XJpTqZZflnzJUA2XL5PiS8gwc/kVDS5nVuxXTC?=
 =?iso-8859-1?Q?l7i4yMRjQvwDQ5d3PgiVeGY9rgY/XwrnwH1moDxCDwKSLv3so1B+KLFr41?=
 =?iso-8859-1?Q?l5KnAbO1aM1nJBETOkuyzm/ahdweslBjRRmsgc6m2QlBwjmWWR9H7uOkhl?=
 =?iso-8859-1?Q?UiwUEJ3yjQE98B+2bfm7U5GG0vnCqbtkdVsov47VHaCkZ5pTsDIKdhMl0t?=
 =?iso-8859-1?Q?5ejB4oz5wZI4hoPyzOS6nozY3spx/7JQYb?=
X-Forefront-Antispam-Report: CIP:20.79.222.204; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:de2-emailsignatures-cloud.codetwo.com;
 PTR:de2-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(1032899013)(1800799024)(69100299015)(14060799003)(82310400026)(36860700013)(13003099007)(2066899003)(4076899003)(8096899003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: richard-wolf.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 12:16:34.0289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 158b980d-88d1-4b06-5a35-08de12f72c2c
X-MS-Exchange-CrossTenant-Id: 44917025-d156-49c4-a9b3-aed2b6aef1b4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=44917025-d156-49c4-a9b3-aed2b6aef1b4; Ip=[20.79.222.204];
 Helo=[de2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6328
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

--_000_DBBPR03MB10462E2FD56F6C2EC274A8FC8B7F0ADBBPR03MB10462eu_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello everyone,
I try to implement flickerfree boot on a i.MX6 DualLite based board with Li=
nux 5.15.148 and u-boot 2018.03. I made already some progress but my Simple=
DRM crashes on startup, i guess due to the fact the hardware is already occ=
upied by imx-drm/etnaviv. My problem is that i don't really understand how =
the handover from SimpleDRM to imx-drm/etnaviv works and how it is managed =
or even recognized that two different drivers claim the same hardware.

I did already some debugging:

 1.
In U-Boot console I could extract the U-Boot Framebuffer successfully and a=
fter conversion from color format r5g6b5 to r8g8b8 i could verify it on my =
PC that it is the bootlogo i put to u-boot
 2.
After booting to Linux i could extract the framebuffer with dd from /dev/me=
m too. Also after converting it from r5g6b5 to r8g8b8 i could verify that t=
he framebuffer still looks the same as the framebuffer in u-boot. So i coul=
d verify that memory was not used by something else

Can someone of you give me some general advice howto do this and/or explain=
 how this should work?

Thank you very very much in advance.

Greetings,
Andr=E9


#################################################################

The relevant part of the device tree:
{
     ....
       reserved-memory {
                ....
                framebuffer@0x4F368C40 {
                        reg =3D <0x4f368c40 0xea600>;
                        phandle =3D <0x68>;
                };
        };

        framebuffer@0x4F368C40 {
                compatible =3D "simple-framebuffer";
                reg =3D <0x4f368c40 0xea600>;
                memory-region =3D <0x68>;
                width =3D <0x320>;
                height =3D <0x258>;
                stride =3D <0x640>;
                format =3D "r5g6b5";
                display =3D <0x69>;
        };
       ....
                   ipu@2400000 {
                             ....
                              port@2 {
                                 ....
                                    phandle =3D <0x69>;
                              };
                        };

                      gpu@130000 {
                        compatible =3D "vivante,gc";
                        reg =3D <0x130000 0x4000>;
                        interrupts =3D <0x00 0x09 0x04>;
                        clocks =3D <0x02 0x1b 0x02 0x7a 0x02 0x4a>;
                        clock-names =3D "bus\0core\0shader";
                        power-domains =3D <0x10>;
                        #cooling-cells =3D <0x02>;
                        status =3D "okay";
                };

                gpu@134000 {
                        compatible =3D "vivante,gc";
                        reg =3D <0x134000 0x4000>;
                        interrupts =3D <0x00 0x0a 0x04>;
                        clocks =3D <0x02 0x1a 0x02 0x79>;
                        clock-names =3D "bus\0core";
                        power-domains =3D <0x10>;
                        #cooling-cells =3D <0x02>;
                        status =3D "okay";
                };
}

###########################################################################=
#####

The console output is:
....
imx sema4 driver is registered.
imx-ipuv3 2400000.ipu: IPUv3H probed
etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
etnaviv-gpu 130000.gpu: model: GC880, revision: 5106
etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on minor 0
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at arch/arm/mm/ioremap.c:288 __arm_ioremap_pfn_calle=
r+0xb8/0x194
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.148-F+S #1
Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[<8010d474>] (unwind_backtrace) from [<801091e8>] (show_stack+0x10/0x14)
[<801091e8>] (show_stack) from [<80999ed0>] (dump_stack_lvl+0x40/0x4c)
[<80999ed0>] (dump_stack_lvl) from [<80996370>] (__warn+0x80/0xb4)
[<80996370>] (__warn) from [<8099641c>] (warn_slowpath_fmt+0x78/0xb0)
[<8099641c>] (warn_slowpath_fmt) from [<8011305c>] (__arm_ioremap_pfn_calle=
r+0xb8/0x194)
[<8011305c>] (__arm_ioremap_pfn_caller) from [<80113178>] (__arm_ioremap_ca=
ller+0x40/0x48)
[<80113178>] (__arm_ioremap_caller) from [<80447dfc>] (__devm_ioremap+0x9c/=
0xa8)
[<80447dfc>] (__devm_ioremap) from [<805b9520>] (simpledrm_probe+0x64c/0x88=
c)
[<805b9520>] (simpledrm_probe) from [<805c6254>] (platform_probe+0x58/0xa8)
[<805c6254>] (platform_probe) from [<805c4094>] (really_probe+0x170/0x300)
[<805c4094>] (really_probe) from [<805c4390>] (__driver_probe_device+0x16c/=
0x18c)
[<805c4390>] (__driver_probe_device) from [<805c43ec>] (driver_probe_device=
+0x3c/0xbc)
[<805c43ec>] (driver_probe_device) from [<805c4848>] (__driver_attach+0xd0/=
0xe4)
[<805c4848>] (__driver_attach) from [<805c2594>] (bus_for_each_dev+0x64/0xa=
8)
[<805c2594>] (bus_for_each_dev) from [<805c3490>] (bus_add_driver+0xac/0x1b=
c)
[<805c3490>] (bus_add_driver) from [<805c5110>] (driver_register+0xac/0xf0)
[<805c5110>] (driver_register) from [<80101854>] (do_one_initcall+0x74/0x1b=
8)
[<80101854>] (do_one_initcall) from [<80f0134c>] (kernel_init_freeable+0x20=
c/0x258)
[<80f0134c>] (kernel_init_freeable) from [<809a2e6c>] (kernel_init+0x10/0x1=
24)
[<809a2e6c>] (kernel_init) from [<80100154>] (ret_from_fork+0x14/0x20)
Exception stack(0x81461fb0 to 0x81461ff8)
1fa0:                                     00000000 00000000 00000000 000000=
00
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
---[ end trace 5add232bcf522bae ]---
simple-framebuffer: probe of 4f368c40.framebuffer failed with error -12
....



[https://www.richard-wolf.com/mam/data/Typo3/banner/Masterclass-Mailand-25-=
e-mail-banner-500x100px.jpg]<https://www.richard-wolf.com/de/international-=
masterclass-workshop-aeep-mailand-2025>

Richard Wolf GmbH, Pforzheimer Strasse 32, 75438 Knittlingen
Managing Directors: Juergen Pfab, Juergen Steinbeck. Trade Register: Mannhe=
im HRB 510031

Richard Wolf GmbH routinely monitors the content of e-mail sent and receive=
d via its network for the purposes of ensuring compliance with its policies=
 and procedures. Richard Wolf GmbH is not responsible for any changes made =
to the message after it has been sent. Where opinions are expressed, they a=
re not necessarily those of Richard Wolf GmbH. This e-mail and any files tr=
ansmitted with it are confidential and intended solely for the use of the i=
ndividual or entity to which they are addressed. If you are not the intende=
d addressee, or the person responsible for delivering it to them, you may n=
ot copy, forward, disclose, or otherwise use it or any part of it in any wa=
y. To do so may be unlawful. If you receive this e-mail by mistake, please =
advise the sender immediately.

Data Protection Policy<https://www.richard-wolf.com/en/data-protection-poli=
cy>  |  Legal Information<https://www.richard-wolf.com/en/legal-information=
/>  |  Terms & Conditions<https://www.richard-wolf.com/en/terms-conditions/=
>

--_000_DBBPR03MB10462E2FD56F6C2EC274A8FC8B7F0ADBBPR03MB10462eu_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Hello everyone,</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
I try to implement flickerfree boot on a i.MX6 DualLite based board with Li=
nux 5.15.148 and u-boot 2018.03. I made already some progress but my Simple=
DRM crashes on startup, i guess due to the fact the hardware is already occ=
upied by imx-drm/etnaviv. My problem
 is that i don't really understand how the handover from SimpleDRM to imx-d=
rm/etnaviv works and how it is managed or even recognized that two differen=
t drivers claim the same hardware.</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
I did already some debugging:</div>
<ol data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;o=
rderedStyleType&quot;:1}" style=3D"margin-top: 0px; margin-bottom: 0px; lis=
t-style-type: decimal;" start=3D"1">
<li style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apto=
s_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; col=
or: rgb(0, 0, 0);">
<div role=3D"presentation">In U-Boot console I could extract the U-Boot Fra=
mebuffer successfully and after conversion from color format r5g6b5 to r8g8=
b8 i could verify it on my PC that it is the bootlogo i put to u-boot</div>
</li><li style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot=
;Aptos_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" role=3D"presentation">After booting to Linux =
i could extract the framebuffer with dd from /dev/mem too. Also after conve=
rting it from r5g6b5 to r8g8b8 i could verify that the framebuffer still lo=
oks the same as the framebuffer in u-boot.
 So i could verify that memory was not used by something else</div>
</li></ol>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Can someone of you give me some general advice howto do this and/or explain=
 how this should work?</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Thank you very very much in advance.</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Greetings,</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Andr=E9</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
#################################################################</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
The relevant part of the device tree:</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
{</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp;....</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;reserved-memory {</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ....</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; framebuffer@0x4F368=
C40 {</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; reg =3D &lt;0x4f368c40 0xea600&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; phandle =3D &lt;0x68&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; framebuffer@0x4F368C40 {</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compatible =3D &quo=
t;simple-framebuffer&quot;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;0x4f368=
c40 0xea600&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; memory-region =3D &=
lt;0x68&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; width =3D &lt;0x320=
&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; height =3D &lt;0x25=
8&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; stride =3D &lt;0x64=
0&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; format =3D &quot;r5=
g6b5&quot;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; display =3D &lt;0x6=
9&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;....</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipu@24=
00000 {</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;....</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; port@2 {</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;....</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; phandle =3D &lt;0x69&gt;=
;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; };</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; gpu@130000 {</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; compatible =3D &quot;vivante,gc&quot;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; reg =3D &lt;0x130000 0x4000&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; interrupts =3D &lt;0x00 0x09 0x04&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; clocks =3D &lt;0x02 0x1b 0x02 0x7a 0x02 0x4a&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; clock-names =3D &quot;bus\0core\0shader&quot;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; power-domains =3D &lt;0x10&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; #cooling-cells =3D &lt;0x02&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; status =3D &quot;okay&quot;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gpu@134000 {</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; compatible =3D &quot;vivante,gc&quot;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; reg =3D &lt;0x134000 0x4000&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; interrupts =3D &lt;0x00 0x0a 0x04&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; clocks =3D &lt;0x02 0x1a 0x02 0x79&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; clock-names =3D &quot;bus\0core&quot;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; power-domains =3D &lt;0x10&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; #cooling-cells =3D &lt;0x02&gt;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; status =3D &quot;okay&quot;;</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
}</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
###########################################################################=
#####</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
The console output is:</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
....</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
imx sema4 driver is registered.</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
imx-ipuv3 2400000.ipu: IPUv3H probed</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
etnaviv-gpu 130000.gpu: model: GC880, revision: 5106</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
etnaviv-gpu 134000.gpu: model: GC320, revision: 5007</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on minor 0</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
------------[ cut here ]------------</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
WARNING: CPU: 0 PID: 1 at arch/arm/mm/ioremap.c:288 __arm_ioremap_pfn_calle=
r+0xb8/0x194</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Modules linked in:</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.148-F+S #1</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;8010d474&gt;] (unwind_backtrace) from [&lt;801091e8&gt;] (show_stack+0=
x10/0x14)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;801091e8&gt;] (show_stack) from [&lt;80999ed0&gt;] (dump_stack_lvl+0x4=
0/0x4c)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;80999ed0&gt;] (dump_stack_lvl) from [&lt;80996370&gt;] (__warn+0x80/0x=
b4)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;80996370&gt;] (__warn) from [&lt;8099641c&gt;] (warn_slowpath_fmt+0x78=
/0xb0)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;8099641c&gt;] (warn_slowpath_fmt) from [&lt;8011305c&gt;] (__arm_iorem=
ap_pfn_caller+0xb8/0x194)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;8011305c&gt;] (__arm_ioremap_pfn_caller) from [&lt;80113178&gt;] (__ar=
m_ioremap_caller+0x40/0x48)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;80113178&gt;] (__arm_ioremap_caller) from [&lt;80447dfc&gt;] (__devm_i=
oremap+0x9c/0xa8)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;80447dfc&gt;] (__devm_ioremap) from [&lt;805b9520&gt;] (simpledrm_prob=
e+0x64c/0x88c)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;805b9520&gt;] (simpledrm_probe) from [&lt;805c6254&gt;] (platform_prob=
e+0x58/0xa8)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;805c6254&gt;] (platform_probe) from [&lt;805c4094&gt;] (really_probe+0=
x170/0x300)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;805c4094&gt;] (really_probe) from [&lt;805c4390&gt;] (__driver_probe_d=
evice+0x16c/0x18c)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;805c4390&gt;] (__driver_probe_device) from [&lt;805c43ec&gt;] (driver_=
probe_device+0x3c/0xbc)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;805c43ec&gt;] (driver_probe_device) from [&lt;805c4848&gt;] (__driver_=
attach+0xd0/0xe4)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;805c4848&gt;] (__driver_attach) from [&lt;805c2594&gt;] (bus_for_each_=
dev+0x64/0xa8)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;805c2594&gt;] (bus_for_each_dev) from [&lt;805c3490&gt;] (bus_add_driv=
er+0xac/0x1bc)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;805c3490&gt;] (bus_add_driver) from [&lt;805c5110&gt;] (driver_registe=
r+0xac/0xf0)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;805c5110&gt;] (driver_register) from [&lt;80101854&gt;] (do_one_initca=
ll+0x74/0x1b8)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;80101854&gt;] (do_one_initcall) from [&lt;80f0134c&gt;] (kernel_init_f=
reeable+0x20c/0x258)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;80f0134c&gt;] (kernel_init_freeable) from [&lt;809a2e6c&gt;] (kernel_i=
nit+0x10/0x124)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
[&lt;809a2e6c&gt;] (kernel_init) from [&lt;80100154&gt;] (ret_from_fork+0x1=
4/0x20)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Exception stack(0x81461fb0 to 0x81461ff8)</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
1fa0: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 00000000 00000000 =
00000000 00000000</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
---[ end trace 5add232bcf522bae ]---</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
simple-framebuffer: probe of 4f368c40.framebuffer failed with error -12</di=
v>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
....</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<p style=3D"margin: 0.1pt; font-family: Arial; font-size: 10pt;"><a href=3D=
"https://www.richard-wolf.com/de/international-masterclass-workshop-aeep-ma=
iland-2025" title=3D""><img src=3D"https://www.richard-wolf.com/mam/data/Ty=
po3/banner/Masterclass-Mailand-25-e-mail-banner-500x100px.jpg" id=3D"0.zdod=
epk29o8"></a></p>=0A=
=0A=
=0A=
<p style=3D"margin-bottom: 1pt;"><span style=3D"font-size:8.0pt;font-family=
:&quot;Arial&quot;,sans-serif;color:black">Richard=0A=
Wolf GmbH, Pforzheimer Strasse 32, 75438 Knittlingen<br>=0A=
Managing Directors: Juergen Pfab, Juergen Steinbeck. Trade Register: Mannhe=
im=0A=
HRB 510031 </span><o:p></o:p></p><p>=0A=
=0A=
</p><p style=3D"margin-bottom: 0pt;"><span style=3D"font-size:8.0pt;font-fa=
mily:&quot;Arial&quot;,sans-serif;color:darkgray">Richard=0A=
Wolf GmbH routinely monitors the content of e-mail sent and received via it=
s=0A=
network for the purposes of ensuring compliance with its policies and=0A=
procedures. Richard Wolf GmbH is not responsible for any changes made to th=
e=0A=
message after it has been sent. Where opinions are expressed, they are not=
=0A=
necessarily those of Richard Wolf GmbH. This e-mail and any files transmitt=
ed=0A=
with it are confidential and intended solely for the use of the individual =
or=0A=
entity to which they are addressed. If you are not the intended addressee, =
or=0A=
the person responsible for delivering it to them, you may not copy, forward=
,=0A=
disclose, or otherwise use it or any part of it in any way. To do so may be=
=0A=
unlawful. If you receive this e-mail by mistake, please advise the sender=
=0A=
immediately.<br></span><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:darkgray"><br>=0A=
<a href=3D"https://www.richard-wolf.com/en/data-protection-policy" title=3D=
" Data Protection Policy" style=3D"color: rgb(169, 169, 169);"> Data Protec=
tion Policy</a></span><span style=3D"font-size:8.0pt;font-family:&quot;Aria=
l&quot;,sans-serif;color:#9A9A9A">&nbsp;=0A=
|&nbsp; </span><a href=3D"https://www.richard-wolf.com/en/legal-information=
/" title=3D"Legal Information" style=3D"font-size: 8pt; color: rgb(169, 169=
, 169);">Legal Information</a><span style=3D"font-size:8.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:#9A9A9A">&nbsp;=0A=
|&nbsp; </span><a href=3D"https://www.richard-wolf.com/en/terms-conditions/=
" title=3D"Terms &amp; Conditions" style=3D"font-size: 8pt; color: rgb(154,=
 156, 158);">Terms &amp; Conditions</a></p>=0A=
</body>
</html>

--_000_DBBPR03MB10462E2FD56F6C2EC274A8FC8B7F0ADBBPR03MB10462eu_--
