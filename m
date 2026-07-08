Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xt9TE8awTWr48wEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Wed, 08 Jul 2026 04:07:02 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5C4720F68
	for <lists+etnaviv@lfdr.de>; Wed, 08 Jul 2026 04:07:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=TQB45CXy;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D843510EF6C;
	Wed,  8 Jul 2026 02:06:59 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012047.outbound.protection.outlook.com
 [40.107.200.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0222510EF67;
 Wed,  8 Jul 2026 02:06:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDwLDSUw+IeP6Zq0PpjhOkFDOi0ADTY6sYbGnsZbiwyBhgUNFivWcqXcshfoKHYaXd8tIE2EIPV7G3Axrx1jMNFlOhNEJr5XeCWlILsKGRWWE7knLDUANNmbOU62x/Pp96Z7vaUs28UEUA/U/D3VAXokKhxiuXFBIIGjPeatulygyHJqswqs30+5lL+97+tpGwidvArsDuPDkLeBck0xidag2MaiOYCHHnuJPJj24f7CpBV7MvGZslv3fRHcKHzQogVfvG1xUVJHfQNE0KGa7wqAfuOIfkNmLU6bIM5Vie1fjZD58fxxNoIRIUiniuBDWAw+Dc6Q9Xka2kzD50yrIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fxkh07Qy3vfJQz6eckpUMmnibc6JICptSkx8IL0VI+4=;
 b=eynz3YDdxgirvdmsUHHCUndJtuyPKtLoXcdm0CRk4Q9rCQP9Ucm+sqf2qQYCsb83egpD6uLBFs+dZ5b7I/AP59Uk6OBUg+VqKbnK/2GIc8y0772AycBUZz/Oe2GIQNmk5KAmYJezjbq8wxOiylaWzenXKhFXEaFdplUL41SsypMf6tXYWiO3mh/WsF0KVFPQ9TCgn/E807ZvaCXyZPzrgoD3SZgQEE/WX/zvlTSokpP25sYv5ABv4eggWN9/GcVZIUq9S+7KVaE4ZaztgCNQ56Wtq1LtMm+tSj1g9C2wHECAWQNdRV2gHtDHfD3arHXqnDdNTzXYpsRFluqcL3T/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxkh07Qy3vfJQz6eckpUMmnibc6JICptSkx8IL0VI+4=;
 b=TQB45CXydMl+HmnMfcz5R23gRQbCpfOYoyTTpdrxZBMCaKlMuiXnz4gy7ozMvP4V/T9BLsDCio/HU5ksZcF+8E3b3dF9KR1TlEeVCBirhk6N5ZBP1vsod8PmT4fIiP0cvK+QoffU4JfL8hf/1kNuZDgGvNLDrkxl6Xx+NB3ViGtqRzkhNrU3ACAPBNkXCuOaUDXgBbvcMta1zc6eMtQa2TZD0CR9JyK0FXLnrbroI4k7a5wP+cvm51ZddI+nYhTtuiJ/o75HoGBmjQcQWOLA5lyiLu/5ZQyftgD6uQ+hI9mWJJ2w1ErIlMHK330fObXuOQzB5DzB5aGq+gaeKXgxWA==
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SN7PR12MB8002.namprd12.prod.outlook.com (2603:10b6:806:34b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 02:06:40 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 02:06:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 22:06:37 -0400
Message-Id: <DJSTMAD98OD5.3JRZ25CI375A2@nvidia.com>
Subject: Re: [PATCH 05/13] mm: prefer mm->def_vma_flags in mm logic
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
 <3b4ccdc38819b42ddc79ee5a795831208ac7986c.1782760670.git.ljs@kernel.org>
In-Reply-To: <3b4ccdc38819b42ddc79ee5a795831208ac7986c.1782760670.git.ljs@kernel.org>
X-ClientProxiedBy: BL1P221CA0040.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:5b5::15) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SN7PR12MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: ac094335-3773-468a-5753-08dedc958c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|7416014|376014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: iMFI8np7I/AWw64xPVM6y4lT8ZkON4Jwo2t9b13ONoVnmdxjRp8aQV0PhZ+Adop8d6jiZC8phMVWRPVhBMfC0WO2TQobowJGP5wIPf1p7WdNDGMGENRQS0OwXX6vFWO8r117+nVgBh+0e90vB78pYp9GhNwGC1Lecu51r+UKVcv8IrKLtdiNlI6if8HcL9Hmdv8saPByxgwi/qpjbtfQ8Z7LoN2/Jk0ew8+LcIxa9wrKUHtftobfOSSHfpmDR9XPJt6im/YqVMuR4DAhGZPxTQAfJJNP+XR/u8G9zAfYvJvFXAHbkIxwWKm/iHGKB8cDgKGpLeQXtzBjxhkjEXzVRwgGcmCY4TP517Ste4nk8v3alhVAPYn9r8ZZMF/+cws7rI7SuUfOuyx/d4RfekMdZdvXu4rcEPmU986X8ehuh02Qe7Kf92+UGOPv6+wvUHMaPzxqdJlg7U0lN6XgG2ytbMxRskoB6gR7Km4wQ3L8S0ayJR4EQVyj1V1i+bU4DW2nPXpTxFwquzyfH1mQdbVTG6YQMKKc2kSAqbXhYMyX10LeRSTn2b+DYDzrP5uzqgm1ptirAmbZa7EUh/jzdaf4cQznFUfUE6SIHcerOPU6bJyv3362A9/Wm/TFsZhV+sf1qEgCwif6Y548IjdizZ1kUdBASBTXmUmVubj+hPai1nE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR12MB8374.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0hPSDIyZlRCdkgyUTdVanZjOWlRY1doTjJvNzZ2Y3ZocC9NdlM3S3owVlR6?=
 =?utf-8?B?UnNUU1JQeVpiUEtMelZlWjdOYnQ2L3dSemFUSFVMalB0NC9CVHJGWXplc2Jj?=
 =?utf-8?B?U2hTUUhMRFFHSHlIdFZ6QkVmWHNwajdHWFBlcEZRT29jaTV4eU50OFc2OWRq?=
 =?utf-8?B?WUVzZGFWQjQ4Q3p6U3hzVDdFZzlzZGRvUmxlT0NIVlRWYVVXaUlDd01PdHMz?=
 =?utf-8?B?WUpxTmpyYUoxTHN4ZzJvNGZHZFBLZ2lXT1FKSGwvUnM1aHM3V1NnNktmYkpY?=
 =?utf-8?B?T2JoYXVIQzd5YVdvMVZmQ3Jud2ptVTdhZUNyYmt3ZGQxQjdSWWNPZERaVnVJ?=
 =?utf-8?B?STB2VGh4ZDVadmRUV0ZyV3I0N05ZeU5PdGlDQlpIVlB5YSt3ZzNwTFJuV0RC?=
 =?utf-8?B?QUY3bERGVGNJSjRQMjFkYVZ1cjkrUGpkcmpHZjB6ZExuMEI5TjdUZjE4V3Nt?=
 =?utf-8?B?bitPY3krZDVySmh5OTNWYjNFMVAyWmMzZlFvb0F0TEtqdkljS0k5cWVJVGF3?=
 =?utf-8?B?TVBiYU94L0RvNDZEdVN0TC85OEpKdmJncENwQTB0ZG5mcE90RVJrU3NISHVq?=
 =?utf-8?B?Q1ZqSHYwK0FhV1dJdEJCalYvSHZJMXNBTERwNU5xcjV5M3R4WFpGVlFoS1hs?=
 =?utf-8?B?OVhxaENZODFOQjlZUlRBSGhwelUrRFRrQlhMUnA2eSt1ZGkyMWJrZU1yMVVC?=
 =?utf-8?B?NUF4aHJIcjRoRXlDYStxOUpXb1o1dVdCM1BheElYREJSQUxaTlh0NnN5SUl6?=
 =?utf-8?B?ZmdMVElBZXQ4QmtFVjZBaVlqMmd5ZTVyRnZtd0lSVGJRbHNPZTdLWldwUXA1?=
 =?utf-8?B?L1hHM09QR3h4ZDBPRXY3cmU5Ykc4UGJkaVBna2h6ZzV6NVVlVVRwRllMWW9o?=
 =?utf-8?B?NUh3TjlHWFhqQmJSdjlWQUFEZ0hMQ3ZROEM3bG1QMjcyL0pBNzNxTkFHYlVo?=
 =?utf-8?B?WEZ6bDk2MDEwTWpKVHF5TTV0K3h6MUd2eGVOa1VFVmliczRGOE1wUENLRWp1?=
 =?utf-8?B?aHBCWVZGdG5mRGtCKzU2S3R2WlZBQ1Ewek4wWVN5cXM0ei85elRCemxyY2Y4?=
 =?utf-8?B?UG5ETDdPQ3I2T0xWRTdFWmc2QUluTWxvemJRbmtRUHFONTZCZVVzVmd2bTRs?=
 =?utf-8?B?clRPNnU3RHcrOE5ZQWZacWZqWnBjM0ExZHJhR3orUEM0WEFZUFQrZHk2RVNC?=
 =?utf-8?B?TmZiRlVFbDRuOXhzOVZ5YzZvNVcyaTR0WURHbUhZYjR3ZjdjN0tpdGIzVWxX?=
 =?utf-8?B?RzMzRTJaSmp5TTA4YzJGaEx4ZE5BbHBjVkM5anRYcFZHVFh4K0t3TCtVTW95?=
 =?utf-8?B?UmNPVnE5QXJydDR4bG1PWXNyQTg4SnVnWFQ5RFhQRlhxSTk4Q2ZGdWVHVGlU?=
 =?utf-8?B?aDNySS81N1E2ZG9HYUZjL3B0TVhDM1h3bjdPenBvRmFvV2NHMjVWMndjTEpi?=
 =?utf-8?B?YjBJcGgyRTBDbGhkdHVsWTRXbXRWUTNFdGJ1aHgvNXcyUHcwUW5oUkNTdTlv?=
 =?utf-8?B?WGd1azRHNEZ6dlVvRy9naEh4aVMvWDErd3ZoS2lFTmZvNWlrM0pMSFFYcDU2?=
 =?utf-8?B?dHFpODc2REVVQnNlckxyUGVWdTZaVUVJUmM5VzVGLzh6QnFyR2d0bndGY1Ix?=
 =?utf-8?B?eklkWU1XRlFPa0ttU2E5b3dXMGJmUmdUMnZDTkE5cWRHclNua3ZpK0J0OTU1?=
 =?utf-8?B?cURjMThKc04yblc4ZGp0VmRjM3NqMlpZekUxU1VvRk9ENWdiL0QvQjRQeEpy?=
 =?utf-8?B?bDNPb3FWbm5wWWdBZHlOSFRlN25IOTZOZW10ZmlWaDV3UmZLVnVUUUpzRGNS?=
 =?utf-8?B?RUU2d1dFdFZSeis3YWU1TitpcmJuOTVkY0xuV1RwaHQ5SFdMa1JueXhxQ1RP?=
 =?utf-8?B?TUFFakZQMzRyYlFoOU5LQzdXTmdFclkrbisxRXUrcVlhUW5hZzc4Nkh6TVlY?=
 =?utf-8?B?T2FTdlNLeUxNSUJwS01zVk5tLy9VUCtxM0p1eWJ2WU5lQmtRRGRxdHZ0S1g0?=
 =?utf-8?B?RVc4U1NoTDN3NlNTUWhleGRwR20zcUVQTDhydGxQdXZ6Qy9Xb3pQRXlXQlpy?=
 =?utf-8?B?a2JjaXVFb1l4LzV1RjFwcjBJK05FUEFVMnBVeHVKeS9yMXNlanBBTmZYQVRK?=
 =?utf-8?B?Q3l4cEFWRGNmbmJmbGh0TVJXZ1BQb2hXTWhxOFZKdDBKOHV4SisrcFhiMHdh?=
 =?utf-8?B?YzR1M1J2ZjUzLytZRVI3STFCZU9uRWFKWVpJOW5HL3h5ODdjaTJwOHNCYitD?=
 =?utf-8?B?WFpTRmNqaGoxelpvZUszbWRHR3dCd0xDUzhYWTlMcXlNbklmdWRRQm5ScVRL?=
 =?utf-8?Q?f6CEVTaQcxx00X3U5/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac094335-3773-468a-5753-08dedc958c92
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 02:06:40.1798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gu7sX/Z7mv4RuOC95YjYOLCi9nGkXpxnvm0lhGfXg4m4cYNnRv/RF7+fqebqkUqo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8002
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E5C4720F68

On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> Currently mm->def_flags (of type vm_flags_t) is union'd with
> mm->def_vma_flags (of type vma_flags_t).
>
> As part of the effort to convert vm_flags_t usage to vma_flags_t (in orde=
r
> to no longer be arbitrarily limited to a system word size for VMA flags),
> prefer mm->def_vma_flags to mm->def_flags throughout the mm logic.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  mm/debug.c |  2 +-
>  mm/mlock.c | 13 +++++++------
>  mm/mmap.c  | 11 ++++++-----
>  mm/vma.c   |  4 ++--
>  4 files changed, 16 insertions(+), 14 deletions(-)
>

LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

