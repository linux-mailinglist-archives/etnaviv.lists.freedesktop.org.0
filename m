Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ACBC9CE24
	for <lists+etnaviv@lfdr.de>; Tue, 02 Dec 2025 21:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AADB10E525;
	Tue,  2 Dec 2025 20:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="cLxPmnoV";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012020.outbound.protection.outlook.com [52.101.43.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C884710E525
 for <etnaviv@lists.freedesktop.org>; Tue,  2 Dec 2025 20:16:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dhh7j5/XtbCkbgSYXS2m5LL/pUWdZbJ1wn4U3AF8zZeYcs2wIyyhSyLIJTCCf8ZmfBchlFnTbqf1miqnSr3GZiObDCrRlODG4j0l9wE6JctsBy2mNkgVIoA1DzVief7nw649LNm8tHw2uBkjZwxpWiBcltn3Q79YHK6z9vB2SKaPHKWYsXp80LGTqbCqTGyRCfIfTYcATDgz6CLKmjWl/tygpskepPMwVEDFEoGvxtMSu00trMlfiMsobWE2IKyUI/bi3IMvOyfVAHeKLzRyJGJ2Myh9fbJk1JptS0XePO/JcyK+j/MR0Hs2SoYFZNmqCViUJiafePDPkh/SRi7VUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgRR9AC7UWh1w/xiqcDM3eYPYinYJqm6zJPSbr1R8bA=;
 b=WEy98CesoaSwrBr2y8UX1MxQHv+bT+iVfK0/whqlrdscfs/fSMHGydNyDJoci8EDu9ldNHMe6cf3Q8yDiBqWcFYomVuWRcenPyPvguIDIlOJZhRKHcv8CdW0ZwlfANvQTJzRE2KdebQdTn7X3Udz9Y5iDT7bvlSx0Pl1Rsz/bthy7TBRemyo8z/ZxPgQq1LX8EDBpiCx3XWgOmytjkkhzqY6h2bmYsydy6e0+lvG8viCayqAr6EpsD4AnVZ6YRUGxscngUX+Chi1fCqSZBgg9lIrf/mAtBtnXcfPSjV8dR+mU4KomeB2hwNZSNMI7yO2BL2tnQ08zusvbNzCIg8dEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgRR9AC7UWh1w/xiqcDM3eYPYinYJqm6zJPSbr1R8bA=;
 b=cLxPmnoVXH/qbl7JCAQ2RTTeAUP0m5tqcFSKcUftAKsb9h59XwxasLk4N5LkpVPjkA3v1Jmg8zZ5U4P89/mDba/eqM+cOirLyO+yh0M4K1hI8jK933I4t4ypvdXBmzeA/xZUliB4Av+/BYjKnOWdt98AF9q3EbYWkCv9flpIuPM=
Received: from BN9PR03CA0466.namprd03.prod.outlook.com (2603:10b6:408:139::21)
 by DS0PR10MB6054.namprd10.prod.outlook.com (2603:10b6:8:cd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Tue, 2 Dec 2025 20:16:23 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:139:cafe::ed) by BN9PR03CA0466.outlook.office365.com
 (2603:10b6:408:139::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 20:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.0 via Frontend Transport; Tue, 2 Dec 2025 20:16:22 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 14:16:19 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 14:16:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 14:16:18 -0600
Received: from localhost ([10.249.32.106])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2KGIJw2837716;
 Tue, 2 Dec 2025 14:16:18 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 2 Dec 2025 14:16:18 -0600
Message-ID: <DEO09UE0RUGU.2FXFYHE9DZAOM@ti.com>
CC: <etnaviv@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/etnaviv: force flush on power register ops
From: Randolph Sapp <rs@ti.com>
To: Lucas Stach <l.stach@pengutronix.de>, Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013170122.1145387-2-rs@ti.com>
 <18016c25-41c2-49f1-8162-95488de7c514@ti.com>
 <f01afdef41d15bbe11c4b46d0a89dae55f1f7ed3.camel@pengutronix.de>
In-Reply-To: <f01afdef41d15bbe11c4b46d0a89dae55f1f7ed3.camel@pengutronix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|DS0PR10MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 8651feea-3a8a-4fe5-c2ac-08de31dfa998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cENSdXYyc3Aya0M4UUhmMUNKVjl4dU5lUFBoeWZ3UWhKK215ajVvbTNwNXdN?=
 =?utf-8?B?OTQyVjE3WFkzcUJNL3RRT0wzZHdwZWp0c1ovWjQ2SUdvRXNlZW94RVJMT0lE?=
 =?utf-8?B?SHF0K0V5SEx6dllnV01mL3dLaDVMQzU1bGlwUmZuS2g1Vno3bFJuR3hnbHRv?=
 =?utf-8?B?bjRwN3VuYUlPZ3crS3R2dlpKalZYbGJaRXhSOG4yL1F0NStZR3Y2TGJBaGth?=
 =?utf-8?B?NXJIQ01HQTZIZjRZQVZORFNINW1KdFNmRldwaHFpY3gzVkxRMFY4SmpTcFdB?=
 =?utf-8?B?NEg3WEhDUFFjbVJScWJFWnF2WWhCbzBJUnVvVklETm82UEpwUGJMNUpJajJE?=
 =?utf-8?B?SmViRUxnKzFLZjA0aGk3Vm1UQ3ZTdXZTVEtrV21Qd3dsL3Z2VG9Ga00wd000?=
 =?utf-8?B?b1hUZHB0TVlWMUMxejdwdkVZbnQwcStFYXl6dnFTQjJWSU5iTWRidHROWU5r?=
 =?utf-8?B?YWNtRUFUSkRmdG5zMjlZZVorQVl3ZGl3YzhFaW1scGRjSWFSKzgyYXZPY0Q0?=
 =?utf-8?B?Y0x6QVFPV3BTblRaN0d0NUMvV3U4M2dLWjJQMHVjWmZXKzk5UGp2UHNFbnBt?=
 =?utf-8?B?Ly9vck9vUUtadVVsRDVVZnFOaGt0VFVKeTd5ZXBkeGxDRkYzNnFLVGYyVE1r?=
 =?utf-8?B?M0MwbFRoSGptR0NYVDdkUGRHL2ZGcHZ4ZEVGSGpZUTNtbFptaDE1OUpxY09R?=
 =?utf-8?B?aXZ3dFJWVktqZXJ6T3I4WnJlNlRoajh4U1NsUm1sOFpvcTFldkh2b1R4a0ZE?=
 =?utf-8?B?aDU5d1RIajhreFlyditCL3g2QzN6czVNdEQ1bzhxN3NzYUpVVFdnM3poa051?=
 =?utf-8?B?ZkZnZldmd2lUd1JaZyt6VGJjUURsN3E3WkpWM3VvVE8vSStmK3ZHZjNoNVM3?=
 =?utf-8?B?Y0lpd1o3L2NnaVV0UVh5WXJvSGsxcERaaWJxTU54aFl3alBMRGFQV1lBNFg5?=
 =?utf-8?B?Slhmb2Nta1c1VFVpcnF5eHhYUXNZdytxVDNwTVZsbXErNUpuU0R3d1IzVGgx?=
 =?utf-8?B?TzRETUtnOWVnUWZ3SkxzbUNpVXN2M1lTcHpWM1duNlNVVnk5akdlZERNLzhK?=
 =?utf-8?B?L3dNeTZNWXAxZlVJc0xIdFRjMElPZzNmckdkRlZVeGNsVkpiSG9jTFpKVCtS?=
 =?utf-8?B?NHhxaFRjZXU4V3pPY2JuSE14WC9lVmpZRmpPamwyNUJDMjRJd3Bza1ljWGsx?=
 =?utf-8?B?V3dkRmRTNnBFOG9aQWpsU04ra21YZ3JBOVdyU0FKSkEraEtlQ255WmoxQi85?=
 =?utf-8?B?cWxXeE50U081RDhLekNHUkRGYjg3Y1UyMUxMQmV6NVhpYU9QZjNYdUkydzNQ?=
 =?utf-8?B?VkJYUHQ0VCtrNzR3UEFZZDhoWmIzdDhOeTgwRlhGZ1dBZnlPVkwrYnJUNGlV?=
 =?utf-8?B?eGRXdjhYMVRYalVValdyWkliSjRtQlpnY2VJa2U1ZTBQVVk5bjYyM1ZaQTJN?=
 =?utf-8?B?UVIxMWJHMC9jMzZNRFk2cEJEa2RyT2tTVy9oc3BQbEIzam82U3VKNExnK3JC?=
 =?utf-8?B?OU03UGNMU2puemtyUFZ4aVVaWGhUY1JDcTU2L20yS3I5SWxBZlhwSVlxUk9R?=
 =?utf-8?B?bTVrZDRnNlg3OXhyb3JEMmd2NVdPcGdjR1YvYm82amZkSlBYSUpoSzFVbUhT?=
 =?utf-8?B?bS9TV3NXYjdEaUJYMFZTYkVyVTV1d25xRVIwOXFlc0doRWFJZm5vQ0VNMnkr?=
 =?utf-8?B?aWFiSkRhQlBzRVBEYWFwTG03TG8zdms5T2VzU3ZqMkJ3NDVnSEN2bEFuVnR2?=
 =?utf-8?B?aUQxaG1VQTRDZTZ0MUxEL0h6RWNNb1ZYT3dkdW1PekwzdmY5d2tWb0paeU5F?=
 =?utf-8?B?YkkyYmt0WmhtZFVTRzUwTG8vMzlTVWVwcElmdGt1dVBGSzJBaUtWd01KcmJZ?=
 =?utf-8?B?N3BWLzhzemxsRE1UWTRENWsybjh6aGZFUHdOLzRYaWJvNWRSaktrNTh0WjZC?=
 =?utf-8?B?Y1N0NWMrL1crQitBVHJUM0NCOE15VUZ1dStMamRUUWdqK1M2N1g1M3U3QWEz?=
 =?utf-8?B?OCtqMXBFQThmcHFzTVVHRDNnSUN6L0xhN29ob1pWUVVZTVJ5OHJlNi81SU84?=
 =?utf-8?B?STc4d3llMFZwckZvRUdDdUNPZjJOUUEwcDU3Z2d0VEZYUTFPaVVycGlxTG1H?=
 =?utf-8?Q?MBao=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 20:16:22.5367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8651feea-3a8a-4fe5-c2ac-08de31dfa998
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6054
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

On Fri Nov 21, 2025 at 3:46 AM CST, Lucas Stach wrote:
> Hi Randolph,
>
> Am Montag, dem 27.10.2025 um 18:29 -0500 schrieb Randolph Sapp:
>> On 10/13/25 12:01, rs@ti.com wrote:
>> > From: Randolph Sapp <rs@ti.com>
>> >=20
>> > Add gpu_write_power_sync to verify that power register modifications
>> > have reached the endpoint device in sequence specific sections that do
>> > not validate device state.
>> >=20
>> > These sequence specific areas have been detected experimentally with a=
n
>> > am57xx-evm through numerous boot and module load+unload cycles.
>> >=20
>> > Signed-off-by: Randolph Sapp <rs@ti.com>
>> > ---
>> >=20
>> > v2:
>> > 	- Add an explicit gpu_write_power_sync function to handle the readbac=
k
>> > 	- Add a few more required readbacks as determined experimentally with
>> > 	  5511 reboot cycles on am57xx-evm
>> >=20
>> >   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 10 +++++-----
>> >   drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  6 ++++++
>> >   2 files changed, 11 insertions(+), 5 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_gpu.c
>> > index cf0d9049bcf1..dbbd5a8100e6 100644
>> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> > @@ -543,13 +543,13 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *=
gpu)
>> >   		u32 pulse_eater =3D 0x01590880;
>> >  =20
>> >   		/* disable clock gating */
>> > -		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
>> > +		gpu_write_power_sync(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
>> >  =20
>> >   		/* disable pulse eater */
>> >   		pulse_eater |=3D BIT(17);
>> >   		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>> >   		pulse_eater |=3D BIT(0);
>> > -		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>> > +		gpu_write_power_sync(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>> >  =20
>> >   		/* enable clock */
>> >   		control =3D VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
>> > @@ -643,7 +643,7 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv=
_gpu *gpu)
>> >   	    gpu->identity.revision =3D=3D 0x4302)
>> >   		ppc |=3D VIVS_PM_POWER_CONTROLS_DISABLE_STALL_MODULE_CLOCK_GATING;
>> >  =20
>> > -	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, ppc);
>> > +	gpu_write_power_sync(gpu, VIVS_PM_POWER_CONTROLS, ppc);
>> >  =20
>> >   	pmc =3D gpu_read_power(gpu, VIVS_PM_MODULE_CONTROLS);
>> >  =20
>> > @@ -687,7 +687,7 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv=
_gpu *gpu)
>> >   	pmc |=3D VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_HZ;
>> >   	pmc |=3D VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_EZ;
>> >  =20
>> > -	gpu_write_power(gpu, VIVS_PM_MODULE_CONTROLS, pmc);
>> > +	gpu_write_power_sync(gpu, VIVS_PM_MODULE_CONTROLS, pmc);
>> >   }
>> >  =20
>> >   void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 =
prefetch)
>> > @@ -753,7 +753,7 @@ static void etnaviv_gpu_setup_pulse_eater(struct e=
tnaviv_gpu *gpu)
>> >   		pulse_eater |=3D BIT(18);
>> >   	}
>> >  =20
>> > -	gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>> > +	gpu_write_power_sync(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>> >   }
>> >  =20
>> >   static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
>> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/e=
tnaviv/etnaviv_gpu.h
>> > index 5cb46c84e03a..e89d591d7404 100644
>> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>> > @@ -204,6 +204,12 @@ static inline u32 gpu_read_power(struct etnaviv_g=
pu *gpu, u32 reg)
>> >   	return readl(gpu->mmio + gpu_fix_power_address(gpu, reg));
>> >   }
>> >  =20
>> > +static inline void gpu_write_power_sync(struct etnaviv_gpu *gpu, u32 =
reg, u32 data)
>> > +{
>> > +	gpu_write_power(gpu, reg, data);
>> > +	gpu_read_power(gpu, reg);
>> > +}
>> > +
>> >   int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *v=
alue);
>> >  =20
>> >   int etnaviv_gpu_init(struct etnaviv_gpu *gpu);
>>=20
>> Was there any feedback regarding this change? I never heard anything on=
=20
>> my end. Wanted to be sure my mail client didn't eat it.
>
> I think the change itself is fine and I was about to apply it, but
> after testing some more I still see incomplete GPU resets. Things seem
> to be fine for the unloaded case, but when the GPU is reset while it's
> loaded or hanging after an invalid command, I see sporadic cases where
> parts of the GPU are not being properly reset. I'm currently
> investigating the issue.
>
> Regards,
> Lucas

Interesting, how are you checking the reset status? If there's some tooling=
 or
documentation you recommend I wouldn't mind poking around on my end as well=
.
This all seems to be quite unusual, and the more I look at this patch the m=
ore
uncomfortable it makes me.

- Randolph
