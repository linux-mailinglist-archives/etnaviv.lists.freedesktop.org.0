Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I2XO7NnuGlEdgEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Mon, 16 Mar 2026 21:27:32 +0100
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8192A02E5
	for <lists+etnaviv@lfdr.de>; Mon, 16 Mar 2026 21:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C08510E4C9;
	Mon, 16 Mar 2026 20:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Alrf+2ZC";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011056.outbound.protection.outlook.com [40.107.208.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB31210E3E4;
 Mon, 16 Mar 2026 20:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e49udXZ9a/xaX0RXlncKfgc0MX7P3XF5b7o7SoKL7h3R+6h0j7CzQvYgjgjDZbeS+SZWeBYQozOlGdHavnGRODIlGIIgodQUWo522K5JY7qFPt82pkg1psTdcp1REPNu9g/gczzOh+RyuKIH2LRdlKCyRKEA+hl7fjzDhBGEget9J9ifionaOKXPbviYfRbUKzM4dE7cKSfknuaXkphyifpmJ39pgOGrSF6zzbKSUOdQ4NdrhL0R0Mv50nrXxt87b4HBlcR7Mi+0bTQ1GL+7RSEndeDbvFrk6hihilPbgZZq+Jkdv6NgRsEYketXFBgIVEdGm9aTFkDGvp30aY5WSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2Q9U4nOt5xSn5bsEzaMhE24wWKf079WQKeXu0l8qyY=;
 b=F3bbGs1m79qJgz6qgd/61+bcP6HuT3DS+L23okEbtURJ8SHTc/Fp6MvSKGGEnthv6pKXkKhcpOdHXamMmouNVMlva5yw22FBgTSnoBvcMqtMPnDHHdJCsONTyLrInAzwf0ItJEHaHO6OynslbGyYtJrHk1TkEdWYevRAmFFkYmIRLm5Lr9kgTVIJsXud3X2p3oNq8XlGCPhF20yphTiCkrXr4uAPX5m3T5lrlAn89+27fThXEJ0nqRSqiqsxCCJ+fOwuovJGaUp8DN8m09ZA/6ZbuvyO6z6mOaQgtrDrKwnE3r//K3o3GsN284cMABYeqW/7GFMLn3789AawNHlLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2Q9U4nOt5xSn5bsEzaMhE24wWKf079WQKeXu0l8qyY=;
 b=Alrf+2ZCLszV7h8rH0LYfg4IMQBXcJzZ8pLbiaTe4HbJygDsxyUh/EkzP4mGgAQvCGmDlyUl/G4gYzdFYY67c/hQWPgHfO2Ikokmqo57FyUBeHZ62jy9FSs2375+DGsXuLKXdgNcPFfEq4LfFogEfR6dSvY4421xI8yCKV8eA8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by PH0PR12MB8032.namprd12.prod.outlook.com (2603:10b6:510:26f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 20:27:21 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 20:27:21 +0000
Message-ID: <fb406515-8184-4e22-81a5-27d92a2114c8@amd.com>
Date: Mon, 16 Mar 2026 16:27:16 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: events@lists.x.org, xorg-devel@lists.x.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 elections@x.org, members@x.org, xorg@lists.freedesktop.org
From: Harry Wentland <harry.wentland@amd.com>
Subject: Announcement: 2026 X.Org Foundation Election Candidates
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::11) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|PH0PR12MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c41b60-e8ba-4553-f29d-08de839a6d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|56012099003|18002099003|921020; 
X-Microsoft-Antispam-Message-Info: HrG30cK29w6BuhZ3BrBA1rtIuUFQ7US+MKd+6bPkB3ATUftjoQYZt5dh92usstUZMeTRVmg932WYbix5cTvgO2xU6R9uJ4zGXyVFL6qHAaxlE4GJEtJ7HrRYrptp7a0qDUrFhVag1Tm768CBY2Vx8OBVfIqSvza7Lvmz9UQ4oVbaM4H1IRPTYvxosC5TWuW3FXTZt46rJKIjSGz93xe+deid/if0WjS5mbGGbPeBOwZL2glqZiJAdDiyz9O0BhA0dSKlrgXZYj5saHmDJn2BNmGaEDM12LjTtCyqTZns8+teOQdLYK6IE5SWs98uJLG4rnwG5NsaR9r8WJ5Nnrm6TOKKLrNbQLTdvtj8STGlKlJsA+anHSAZINv76AdR9xFSIAMt6DlT8c28e9lQfq1w8kp7j2kZnQ+5EVQmr55s3OXjI8A69JR8GPpOsuKLxoko0uoZBulYdlYLrYB0H++bxHh24BCQ1VBn184Qc8Y1gpIZ+Flit/fB9OtPjztM3bZ5Lb67FRdXpbJx7uySC+AlumERinWxZ35DipBwnPkqrxnVOO71LP5tRZYocqISnZRqEnoJduuQp8VyqmTQ76FHPxzq9lZY2Oo4jFLQpywTMyPAOks7mmfdp8dhcHQlB13iOI7kcxCuMd8j9DltF2dU24xRxW4soZS9sjRsJZEdN75HMDXp455iDvx/cnZmVCOzQ6rCNv3c/8NNKQ8FHaHE2Gk0y1cQnEZqzjw/L5QMsYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(56012099003)(18002099003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEhLczhZRFF2YmxPT25UdzlPa0Y0SmVoSmhQdTcwaDd5NUNRczRXTWkyK3JT?=
 =?utf-8?B?bXlYK1VXeitkYWd0bTdGL2p1Q0lrVHRybWV0LzFmdnJlMWtaeUMvUWI4QnQx?=
 =?utf-8?B?VGEvRlhITDliRTVzeGgwSHJYckNOWGw5WDE3cVlwcC81TTNCNXBPOWtCS1VJ?=
 =?utf-8?B?cEY0QTVvU3A0ZHBCcERoa1JSQWlialFQdnU3TDRoOHRRYnJRcWpFcUxWc3Rh?=
 =?utf-8?B?dTRZQ0YvMXNXVFFBalNsbFFzTUVZV2lwSGE1Z1ZNT1FXQ1NhU1BOYStaaXpt?=
 =?utf-8?B?TndhK3dtOS9aQnd4WSsrZUFZZWYvMHBWVFNpRXYrbDA2T3pqeGVXTDR6K1Yx?=
 =?utf-8?B?QTdLNW1taXBkZHlUR3NLeng5bDl4ZzRYOVJzM3l6amhmZzBXWGJKWkIrZDU0?=
 =?utf-8?B?VEM3OXlidWsrNTFmTGYxK0pjTkFrYkpxelczdit3L2ZBVGxzQmlmaVFnTlNL?=
 =?utf-8?B?ckt6SG5TaG5yM2FPR2o3ZFg1UTNnaXZBLzMyWXVOZzFOSldjNk1aL21rNmxC?=
 =?utf-8?B?WUU5SkRLWjI4WEFSVmkrMXFUMzVQSjREYlVrMEFUVjBoTFh1S2s5VndBN3Zs?=
 =?utf-8?B?NlpMYTJBRXJXQ2xsSTFIQUNOQ2x1THFUenpYVlZ1NkdmelpFREFueFZhaGwr?=
 =?utf-8?B?ZnVwb2MzODZzQkZZV2REaXM4VUkyWDRMdHdCV09VYlVTZ1owM1VwTUQ5bEh5?=
 =?utf-8?B?cGMycXlmWE9GSG9qODZSVHkrM3gxMmp0ckZkTisyc3ZSWG91SndhRjBrYkNO?=
 =?utf-8?B?Sy92NWM0OTJIRjJYenBmYTNYK21UQlcyUVVtdXNPYkg2Q0hWNVdBU092L2Fj?=
 =?utf-8?B?UUlCR0FmTUxXbmNLVXJ5NUI2dkNKeU5XZGw1c01hVWJRWk5pRTJveml6UjlE?=
 =?utf-8?B?TjcyQUlobSs5QnFrSVlVL0FDRTFudk5qOTVjNk11OGJLdmtySXFCTWJVRlpQ?=
 =?utf-8?B?eVp3NHZsZVZjbTVYR1J5Y2kxaVlsbEMzN2VYaTk5eFZFT3o3bzE5cnRVcDEz?=
 =?utf-8?B?NFVwYUpEcFdrenpNWXMyWGpOb2hIUlpUQnlTWXBLK1ZSY0RZclNNWmg5NDhR?=
 =?utf-8?B?Y1JqMHRTTWJuUnQxSGxKZXQ3VWN2SFZvK2RWbFo1MkQ2L0t2MW9KdnZHMkxW?=
 =?utf-8?B?Sjg4a0hHcFhXNTQxL2RZWnpuS3FxSzBtaVlkNjU0YkNHWjI1dEFaTFlzVzF5?=
 =?utf-8?B?Ri8yaGxsRWVoaGsxUWtuaVQyVXhzd05RUExmSmgxNEhlcFNaVCtOKzNKRy91?=
 =?utf-8?B?MXVJWWhwTWR2a0tYcTdGRXduK09rckxwUjMxY3pUSmUzN29hR2FDaGJmajVy?=
 =?utf-8?B?N05HTDJhYm1JUFZVL1U3V3E1UWpXSWgzNGc5YUdWZ1VaVUF2dFVzbXdIaFRV?=
 =?utf-8?B?b2VkL3VSMFFWSUVBY1dWRldkS0tHYTVGSzdJZ1lmejQ1L2dZNmpqa2ZQdG0w?=
 =?utf-8?B?UU8rSXUwUEpqMmpMUWFib3FUMnk4a1MzYkd4TWdGcnpQbHh5a2hmWGw1SFo3?=
 =?utf-8?B?Ui9oU3JtNWlFbmpDYkZ5L2VMR25DVUk0bnJMRHM0KzBEWVhMcE5lTVQ1VzV1?=
 =?utf-8?B?TnN6YlI1Sy8zTmwvY2ZVN3NDWThZeDhZdTJtK05Qd0YreHducDMvMXgzSXQr?=
 =?utf-8?B?L3V4cXBMSTlkL21SUGpUNUFUUE5kMlRwbUErRHdNOTBGOWoyOFVZdnhSQkxx?=
 =?utf-8?B?OXJFd0ZLZndVMGR5RSsySS96Y0h4dGg2ZVVidm1oQ1RWbTAxWi9MSVZPWnJk?=
 =?utf-8?B?akR3dWNTR1k3aUVsSk40cXBpTXlNWUhTZFpCaHQ2Rkc1M095elFZOUJGYXdw?=
 =?utf-8?B?RU5YdUorUEw4SDBLb1hacng2QnBRRVRCd3hhb2h0Z0hSSTVMYVd3QXY1KzZw?=
 =?utf-8?B?aTFkOURIM3Z6WTZvVHEwWjJPMmFOSXRuNGExQnd4Qk9MeXU5VStENTBqd3hw?=
 =?utf-8?B?WERteHVBMVlIYU1scHg2QTNoeFNXS1phaW1JazFneTVLUWhNUld4b2FFMGtE?=
 =?utf-8?B?SDJydlZTQ0QzdGcyZlU3UG9jV3dBYzE0VmJ1WEJmT2VQZzk3Nm96R1QwckdW?=
 =?utf-8?B?ZE9qQzVWcmQ3WENCYTN0TU9TNHE0QzV2ejJNcVFaamR0UmFGTU9qQ3A0ZUJj?=
 =?utf-8?B?NGdBZ2QwNkc1bFJKWGxmNVMzRElveWdFTmVuMnMybnZFVW90MkFBZUJUa3Vp?=
 =?utf-8?B?dmtYOXZJZEpLRXNrOTFjWTlhMll6SnZvUHVnWXlmRXVCSGIzcmYvTlhoMld0?=
 =?utf-8?B?NFJmbTAvOXYxNTRtY3NpZnRUTEFjUUVxN3Z3ZEdsMnZIU3pzUzBqWE1CMEt0?=
 =?utf-8?B?Q1YvdGVkTXZQai84YmpIWm5kT2dzbW82Qy8zN1djTXZqb2Q3azBBZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c41b60-e8ba-4553-f29d-08de839a6d1d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 20:27:21.3082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTGGPSZocrpqQ0pAxkr80O5HjKO8TTtwv1nzIGI3qOCw0uGXOPl1UgQsX1Ao2O2fUijLhZn8dybEAUXAwCQ9LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8032
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 9E8192A02E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To all X.Org Foundation Members:

The election for the X.Org Foundation Board of Directors will begin on March 23rd and end on April 13th.

The election will include a vote for a change in our bylaws to align our fiscal year with SFC's fiscal year and make the life of our treasurer a bit easier:
https://gitlab.freedesktop.org/xorgfoundation/bylaws/-/merge_requests/3/diffs

We have seven candidates who are running for four seats. They are (in alphabetical order):

- Erik Faye-Lund
- Mark Filion
- Neal Gompa
- Timur Kristóf
- Manasi D Navare
- Alyssa Rosenzweig
- Simon Ser

Attached below are the Personal Statements each candidate submitted for your consideration along with their Statements of Contribution that they submitted with the membership application. Please review each of the candidates' statements to help you decide whom to vote for during the upcoming election.

If you have questions of the candidates, you should feel free to ask them here on the mailing list.

The election committee will provide detailed instructions on how the voting system will work when the voting period begins.

Please note: With the announcement of candidates the membership sign-up period also closes. It will re-open after the election.

Cheers,
Harry

# Nominees (in alphabetical order)

## Erik Faye-Lund

__Current Affiliation:__ Collabora

__Personal Statement:__

Hey, I'm Erik and I work at Collabora as a principal engineer. My work there mostly evolves around Mesa, Panfrost, and open-source graphics in general. I also currently serve on the X.Org board.

I've been in the graphics industry for over two decades now, and I have some experience with organizational work as well. I've been arranging demoscene parties since the late 90s, and are on the board of a Norwegian demoscene interest organization as well.

If elected, I plan on trying to help out wherever I can. I have no big ambitions for radical change, but I'm also not opposed to modernizing things a bit where it makes sense.

__Statement of Contribution:__

I've been actively contributing to Mesa and the related projects since early 2013, touching almost every part of the stack on the way, from drivers to documentation.

I've also regularly attended XDC since 2018, and I usually come with some sort of presentation. It's one of my favorite conferences, and I would love to contribute to ensuring its future.

## Mark Filion

__Current Affiliation:__ Collabora

__Personal Statement:__

I have served on the X.Org board since 2020, elected as the first non-technical member (I am not a developer but a marketing guy). I organized the 2019 and 2024 editions of XDC in Montreal. In recent years, I have also taken on a recurring role in sponsorship renewals and have acted as an advisor to the organizers of both XDC 2025 and XDC 2026, helping ensure continuity and shared knowledge across events.

I have assisted with a number of tasks on the board including elections and the recurring sponsor drive. It has been really great to see open source graphics drivers flourish in recent years, and if re-elected, I hope to continue putting my marketing knowledge to use to make more noise for X.Org and support its ongoing growth. I am also proud to have played a role in the successful completion of X.Org's transition to a new fiscal sponsor, a key milestone for the Foundation.

__Statement of Contribution:__

Senior Marketing Manager @ Collabora. Organizer of XDC 2019 & 2024 in Montreal.

## Neal Gompa

__Current Affiliation:__ Velocity Limitless

__Personal Statement:__

I'm a big believer in trying to contribute to the success of what I use as a way to pay things forward. Admittedly, I'm no amazingly super-wise desktop developer (though I do get around and contribute code to a variety of projects...), but I've been a Linux desktop user for most of my life now, and I appreciate all the amazing work everyone does. If my being part of the X.Org Board of Directors can help with the growth and success of the FOSS desktop community, then I'm happy to step up and help out.

__Statement of Contribution:__

In the context of the Xorg/FreeDesktop space, I participate in the
Wayland protocol discussions and help with reviews in various
components in the graphics stack. I also attempt to contribute to a
variety of projects in order to support the growth and adoption of the
next generation of FOSS desktops. I am also one of the lead
maintainers for Wayback.

## Timur Kristóf

__Current Affiliation:__ Valve (contractor)

__Personal Statement:__

My goal is to improve the Linux open source driver stack to make gaming on
Linux more viable for a wider audience and make the drivers more stable and
fully featured. We've experienced an unprecedented growth in this space in the
past few years. I've been at it since 2019. When I started, it was rare for a
game to perform well (or even work well) on Linux. Thanks to the efforts of our
community, it is now the norm.

I am looking forward to contributing more than just code and learning about
the organizational aspects of X.org too. I'd be happy to help organize events
such as XDC and more.

__Statement of Contribution:__

I've been working on Mesa professionally since 2019 as a contractor for Valve.
I've participated in the development of the ACO backend compiler, the RADV
Vulkan driver, as well as the NIR compiler infrastructure. I led the
development of mesh shading in Mesa. Starting from 2025 I also contribute to
the amdgpu kernel driver. My latest pet project is making the driver stack
work better on older AMD GPUs so that Linux gaming becomes feasible for an
even wider user base.

## Manasi D Navare

__Current Affiliation:__ Graphics Software Engineer @Google

__Personal Statement:__

I have passionately contributed to open source for the last 12 years, working on the Intel Linux Graphics kernel driver to upstream DRM support for VESA display features like Display Stream Compression, Adaptive Sync, enabling DP 2.1 UHBR rates for Intel platforms and worked on enabling these on Chromium OS for Google Chromebooks.

I previously served on the X.org Board of Directors where I helped review XDC submissions. I was also on the Freedesktop Code of Conduct committee and served as Treasurer. I have also worked to mentor upstream contributors at Intel and Google.

If I get elected again, I aim to continue foster a collaborative and inclusive environment in open source graphics community by helping with Code of Conduct and help with XDC planning/reviewing/organizing.

__Statement of Contribution:__

I am a Graphics Software Engineer at Google and an open source contributor to enable and upstream display features in DRM and enable them in Chromium OS. Recently I have also been contributing to the upstream DRM Hardware Composer HAL to interface with DRM/KMS.
My most favorite contribution has been to fix the Linux black screen issues by adding DRM KMS property to signal link training failures which is now used by all Open source drivers.

## Alyssa Rosenzweig

__Personal Statement:__

I've been in the Mesa community since 2018, when I brought up the free
OpenGL drivers for contemporary Mali GPUs (Panfrost). After a five year
detour reverse-engineering Apple's GPU and bringing conformant
OpenGL/Vulkan/OpenCL to Apple Silicon via Asahi Linux, I'm now hacking
on Mesa's Intel drivers.

I see software freedom as one prong of a collective fight for a better
world in the digital era. While small, our community has a role to play.
Our work matters. Doing our jobs well while staying true to our values
matters. Above all, our values matter.

I previously served on the X.Org Foundation board from 2022-2024. Due to
personal reasons I did not run again in 2024.

## Simon Ser

__Personal statement:__

I've been involved in FreeDesktop.Org for a few years now, starting with
Wayland then DRM + Mesa. I'm part of the sysadmin and CoC teams. I've
been serving in the BoD for the last two years, with a focus on securing
sponsors for XDC. I'd like to continue helping out for the next two
years!
