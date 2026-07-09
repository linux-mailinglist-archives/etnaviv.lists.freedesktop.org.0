Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1WicM4f8TmqyYQIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 03:42:31 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3047172BB6A
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 03:42:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=iFipjYQT;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C113B10E697;
	Thu,  9 Jul 2026 01:42:28 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013040.outbound.protection.outlook.com
 [40.93.196.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCB210E68D;
 Thu,  9 Jul 2026 01:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCnCdcuem4tBr4eLP8PMKQdgNKerX7CgiAvMpDZWUsFdk1Jxp46amCYW+dY/3Ll9YaHbMzPHFm9bOjBZhJ6nsTBt9qYKvJW172gTm2VBLleTAEASxXBBAHqg3SxHkxY9wo9fV8mG2iDmS/LFN5D+ydAxn8E42UEVk/VKFvGWpmc7BTIrTYvB7KjDMoT/rhFWDqr61GgPyFDQVgagQITqsjUdoV8g27Dn3rf9sRBbE3xtcJdYivpOBgb1VibUMwNrtIWZHUCg7jvm4/EJQSPu3v/xh8YJylqhD2+K3s5KXUWpGV2JSIipS5lYs4l53Wx3InTLhqx1Ulk4D2FHku6mIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVIBhTpOaROuHvF6ahUTy2dAvqf31/mKwSHQfgbL6Lc=;
 b=j/oiZbB/M25WbfMqsPt6SHbr5JQ4GB+AFyLON/P31iBmGtiboVQqMcWOnU50MfRNEO5eSOJ3vysQLSXiZW8Qcq89GP/smkMMQyjEm61vls/3G6kCaiqFSLCzZIULoEdz/5XYa8cb8+EvfPr1XxsY4eAGdARFI2g34P6zjrRol6sLUVGM4NEXvC/nEIm6LbOFPveDkZWOP+vQLK5s+lHfONxstZVvqkSGT1ZpUI/slvs7nboryTufpF0enGgASfw3TrSctSQO9d9okCYmrNHz+lXvx4QOstkpSSmKH7HQy7Ii245pFrqnKZk440zWN704ujQcN+xWTUTN6i0M5n8eYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVIBhTpOaROuHvF6ahUTy2dAvqf31/mKwSHQfgbL6Lc=;
 b=iFipjYQTQqq5fs3iPcZaoPZB2RpRe/63nnG/HHtinAA4RbJ74R5DDWhY3HfUrZ5j3vtkxu9apljHFFcztnDLUoLK5xYC0wjSNrdKtvtO3Z6Hb4BRYYwXhZrD21VKBWo+L9xKO+9HB5oTIj3mUDOb43IAIx6bshVIy6tf3uvKDG3dadt//2SlIErRR1mGmgVVPprXfECxL14IBBU/xxoIcOMwSGV7ccroZbIrZbFD3SnLuq7MerZQjR22Q6fmZyaBvf1qBrO5iyQkji/D2s2DexANMU6g/XHjeBMEBWKd4UKx1kUwLoJTIJkZlRBZcwy0pRsCT7YSgnKEVi8jbG7FMw==
Received: from DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) by
 DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.10; Thu, 9 Jul 2026 01:42:13 +0000
Received: from DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a]) by DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a%3]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 01:42:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 21:42:08 -0400
Message-Id: <DJTNQ2XBNZRN.1BXP2OD707H1Z@nvidia.com>
Subject: Re: [PATCH 09/13] mm/vma: update create_init_stack_vma() to use
 vma_flags_t
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Lucas
 Stach" <l.stach@pengutronix.de>, "Inki Dae" <inki.dae@samsung.com>,
 "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin Park"
 <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Sandy Huang"
 <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Mikko Perttunen" <mperttunen@nvidia.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Gerd Hoffmann"
 <kraxel@redhat.com>, "Dmitry Osipenko" <dmitry.osipenko@collabora.com>,
 "Zack Rusin" <zack.rusin@broadcom.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Thomas Hellstrom"
 <thomas.hellstrom@linux.intel.com>, "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>, "Helge Deller" <deller@gmx.de>,
 "Benjamin LaHaise" <bcrl@kvack.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>,
 "Muchun Song" <muchun.song@linux.dev>, "Oscar Salvador"
 <osalvador@suse.de>, "David Hildenbrand" <david@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>,
 "Nico Pache" <npache@redhat.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance
 Yang" <lance.yang@linux.dev>, "Hugh Dickins" <hughd@google.com>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Jann
 Horn" <jannh@google.com>, "Pedro Falcato" <pfalcato@suse.de>, "Kees Cook"
 <kees@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-mips@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <dri-devel@lists.freedesktop.org>, <etnaviv@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
 <intel-xe@lists.freedesktop.org>, <xen-devel@lists.xenproject.org>,
 <linux-fbdev@vger.kernel.org>, <linux-aio@kvack.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-sound@vger.kernel.org>
To: "Lorenzo Stoakes" <ljs@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.21.0
References: <cover.1782760670.git.ljs@kernel.org>
 <34689784ee6856f100c02ad4eabeaa4db643713a.1782760670.git.ljs@kernel.org>
In-Reply-To: <34689784ee6856f100c02ad4eabeaa4db643713a.1782760670.git.ljs@kernel.org>
X-ClientProxiedBy: CH0PR03CA0432.namprd03.prod.outlook.com
 (2603:10b6:610:10e::20) To DS7PR12MB8371.namprd12.prod.outlook.com
 (2603:10b6:8:e9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8371:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd5ea09-0887-4050-e353-08dedd5b4c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|7416014|1800799024|366016|22082099003|11063799006|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: iDiRatKBFoWIm6T/kdGH9JywwyvyG75N7yZRXTZbHUKMqVc1qvxFNnu68X5+uwN/CjEuQ/Gw4UQyVdn3yPjee0lKSj3nPN0fRsAGEm0qrb2gg0JD5HsexinLGxYmgz6ZDgQrTUZHs4hticK3iPXOEsmSSZWI+QJjB69HSJhpgX7LABIju2O45PgqIV7mwRtn7BuieWeENDld82vKJ5quL9UZbWAgFwVzV+JKsQplbNdprqYOJd3W/pzhsJC6svOh9PUCIJtYeCk/ts2Q82cDX9GTUwc/JC9t9UcihbiGycxMgiU4F9bZdineBrPg4OWunXCQ+i9EKyBPuU2qPap/SI9uygh17IuNdAepzg4MmYWVjX/HhXKHaezFVLJtOJau15rsp+xzeLXw9xRruLFMdPB9gjA6Z/E8ET8XQ5U8AyMrley3aFby3Lg5u3ZJRN4wVteOIUdj/nMJ7QvkDtDg3t09r8cA64L26IX3mbbJr+dulpy+jxVUlO86ayU4Uijf1dkmRabMWJjK14R92nUawQJtPIISmKO6wlT7eaosuRmbLQSZaGt9tA7sXgfKUQt9O2eBQXO7sLJ5/5lW141ItfXF8avRCEClgkd+rj9mDlpuKbXJMcdMdCKotMToohdv2kB2KZH8CSX3mTG166Mf9ji5/yobdynoNa6Ptg34DNU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB8371.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(22082099003)(11063799006)(18002099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTJiUVhXUkZOSklCZnAxQ2xvNng0VXhpNDhucmorb1Nac0lUNXJlUzczaWRO?=
 =?utf-8?B?NERqb3NXaHZ1Z3pEZ0RLVU5TUCtyS3ZqR3VWWVpBRGpvckVCNnlmalIrcUFY?=
 =?utf-8?B?eWdzd2tlOWNuNGxsM29oZDZneFZXcVJkK1g5R3M3L3BHSU91aWZmZ01NOXkv?=
 =?utf-8?B?Sm1ncTNyZTREb3lrOGxEaDRqWnR3bTRSekZQdmxoTTZYQ0FjYTc2SHhkUTA1?=
 =?utf-8?B?dTNoclVkUzRHWnhUM09Ka1VHQmZ6c1p1SkdIQ1dhOFBJVmpQZDluSlJxdVhn?=
 =?utf-8?B?WXgrQ2R3TjBIK1NROEUwU3BEK3I3dDZ6WlpkWEdNZDh5UisyZDczMlowT1Zz?=
 =?utf-8?B?LzFHa0hKVyszeUxNaFlOZkhMcUcwbEt4YkdrVXMwcHR6dnVPQ1l3ZFFkdk9i?=
 =?utf-8?B?YThWdHR5a3RUSTFMaFVRQS9wZW5YRjlOSE1YUGowanU2bGE4RjQ2MitSZlAw?=
 =?utf-8?B?eUFQZ2lXOU92TVBHQ1Y1bTZIZEpCcHFJSlB6WTcxYWJtL05MZ2lvV3BsY3c3?=
 =?utf-8?B?Y2x5TzhjcWhzYmlGYmtsT21sb1d6clpJS3FBQmFiRGg0VTJ5dWwwbklXeWVy?=
 =?utf-8?B?STN6QzE5SStYNzVUekNaYmwrWGJvT2pTZGNrdERuck9JRklHQ2NsaHN0SXY5?=
 =?utf-8?B?SmhOTERHNWpCcEF1QnRIZkRzSTk0SXROb2QxQmRKTURDa3JnZFBWMStpVGhP?=
 =?utf-8?B?bjU1bUtyT0N1Q0tXeTJEZDhCTERZWG9HSWtmb3ZNNUF4b0FUVXJGeXozZnU4?=
 =?utf-8?B?RGlreWlBKys4OXVnNmYvNjl6MU8zTk9qdjlIS3dHcm45WGtsQlNMR2pkVGEx?=
 =?utf-8?B?UzgvUDdDVUFvV0dKdWlrRU9MdDFPaVpMQUFCa1d4N0FnelhFTVR5ZjJSOVc4?=
 =?utf-8?B?b0xtZncwWm8xSmlTRHZTNERJcEpYb0lTZWF2enByY2tvNFdVaWhuUmVyWHpF?=
 =?utf-8?B?WUFtSGs5SUhzY1NnTjYzL2xRRlJDK3ZNakovUXZBTUZ3TkVDMCtMQjNMbU8z?=
 =?utf-8?B?WHVLVEoyL21NWkYybzBHM0Y4czA3VWtMNWM3aEVzdnY5R0NlR3E3RDhxR0lD?=
 =?utf-8?B?TzBXN29XQzFBelMyNWhNUy85R0pDbk44RFFOeXFvdDF6Y3pwTWZNRHhUSHA2?=
 =?utf-8?B?M25tb1pMN01mSDd2Zm5Ycjd4RlhiVkJNV1l0Njg4K1djN01ldHkzdEZLQTk4?=
 =?utf-8?B?SUFjU0FpZ3dLcmtmSDN5QzRKOHRFZkhGZWI3eHgzVi9TV1c5bG5EWkNzditM?=
 =?utf-8?B?UVZhcTFCMWEvaTJRTVdrdmExSDdWRlZ2aXNUdjVBVVZFajZFRG5RT0RTMFh6?=
 =?utf-8?B?cS9HK25CRDlWeGVMTFBHbW1KRGxFOXlQbFRvV0g3TEI1QVBGTzJOaDFzdlVU?=
 =?utf-8?B?NThMSUJ4ek95dS9XZ1BhamxrRE5JRHkycW1ZeDdVa28wYnlzRXpGcVhuT3ZN?=
 =?utf-8?B?YnEwMVNmOGx6SVB1dzZjM3dseUthVE1RQ1hMd2ZjUE1wdGdkWVlzSmNSK0Vl?=
 =?utf-8?B?eVZnZzVmcTJkV285WUlIZHJPWXZVcHBoeTVRNGhIWkxXbDRaOUJWOVFqVyty?=
 =?utf-8?B?WHRTRGNMc01hRWlSZ2ZvU0Z3K0ZsY055dHRvTjUweC9jblBleVJoQ29tamFs?=
 =?utf-8?B?UVZXcjdKUjc0bDJHQlBSWFBTSUN6S0RVcFJDdFdtTmkraWRCMWhRY3ladjdJ?=
 =?utf-8?B?S1h6UGFKV3ZqUmxCeWtPdnRvazM5eTltUHpBWkpVL2lEcExDNWF4ZmhLN3lt?=
 =?utf-8?B?UVZtS1J4bHY0bm5UT1VDL2tWMmZHR3dEbEltak9TQ1B3SFJzemVuc2VnNGdI?=
 =?utf-8?B?TmxzRTZOTmVDeSsweGFBNkpUMC9qVk0yWkZuSitNYjI0bTVmSXp3NXRpajM2?=
 =?utf-8?B?MWNlTThqc3F3M2JQcXJuR3FGUmtxSGFWbXZkQkNEc05pcG8raHZhQzlzVHBm?=
 =?utf-8?B?UmNOZlloOW93Vnp4czdEbzhYN3FKd3pDenMxeUg2OXBQeTAwVlJjVm5sQm02?=
 =?utf-8?B?ZVBNeE5Dbyt6Z3Nxa09DMGEzYnNML2NRc2lsMnBJSGlnQURkKzZSMEF1WCtE?=
 =?utf-8?B?LzFCbWhNS1pnUERGVHBtTDg5Q3dKZHhGcEYvZFNCeXF6Z21nQmpWVDM3bi9n?=
 =?utf-8?B?dzNaYTN2RDJZMFFhM3BrbjVPVHlab01EbHJveTh5aGtyS3BLcEF0MytHd1c4?=
 =?utf-8?B?V3F6bWg1eWlZMEs5ZVFHOUtIVjdoTFdPSmxTVUpPOHBFV0R3RW9kSzc0R1Y4?=
 =?utf-8?B?Ym4xWS9PWXZ6dVhTRjBiSG45V3VIZE1aRHdXN3ZvZ3paRkpheDY3V2JQaTNz?=
 =?utf-8?Q?YkDc304XKvg8CW2By8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd5ea09-0887-4050-e353-08dedd5b4c5d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8371.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 01:42:12.8101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koNURsUO6db1sQKHwoSjxAarTfnslf461+ZBpMIr7QAlsBVvHV1isp9f2QO8THZW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-9.31 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3047172BB6A

On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> Replace use of the legacy vm_flags_t flags with vma_flags_t values in
> create_init_stack_vma().
>
> As part of this change we add VMA_STACK_EARLY and VMA_STACK_INCOMPLETE
> vma_flags_t defines, and slightly rework create_init_stack_vma() for
> clarity.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  include/linux/mm.h |  4 ++++
>  mm/vma_exec.c      | 18 +++++++++++-------
>  2 files changed, 15 insertions(+), 7 deletions(-)
>

LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

