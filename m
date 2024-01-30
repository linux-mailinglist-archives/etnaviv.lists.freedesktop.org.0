Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D7841D50
	for <lists+etnaviv@lfdr.de>; Tue, 30 Jan 2024 09:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4562810F096;
	Tue, 30 Jan 2024 08:13:54 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail2.eaton.com (mail2.eaton.com [192.104.67.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F95112E29
 for <etnaviv@lists.freedesktop.org>; Tue, 30 Jan 2024 08:13:52 +0000 (UTC)
Received: from mail2.eaton.com (simtcimsva04.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E43A8C35A;
 Tue, 30 Jan 2024 03:13:51 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eaton.com;
 s=eaton-s2020-01; t=1706602431;
 bh=qFVSqG6+NasK4qZnZsIC38Cl5bLg/yAg5PLk99hsvqg=; h=From:To:Date;
 b=CH3LcP1s2iCYDXO87V0qB3D4ScOa/lgaLsSMP/zmJCUO0jJkQu3Shsn7hTAkdvzSK
 4VOPJAQwwVQgCt4I5usamOF6VN8z0djaoHVvacoiGs35f1GzeOVT7gcIgUrFTWzYI4
 jWOxVwyPeoNPRxVBFdvoFIU7D0UuBmXPwg5k59l4fbsfjd731Vzo13m3zaJ7HL2gHj
 xIwN4aXHU7VMkvmFnT0PHMEXj+m6B6byao4E7WLz6yXmeawndxyKGFuHSjajFViPJc
 IdjQVz4mEJz/worArVA8Ikboklg6OumK2kHaPOIR6hY7XGtd3ImyFYALSwJnBfWG01
 WljcusAfmHEHQ==
Received: from mail2.eaton.com (simtcimsva04.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E11DD8C34C;
 Tue, 30 Jan 2024 03:13:50 -0500 (EST)
Received: from USLTCSPGWY02.napa.ad.etn.com (USLTCSPGWY02.napa.ad.etn.com
 [151.110.126.210]) by mail2.eaton.com (Postfix) with ESMTPS;
 Tue, 30 Jan 2024 03:13:50 -0500 (EST)
Received: from USLTCSPGWY04.napa.ad.etn.com (151.110.126.225) by
 USLTCSPGWY02.napa.ad.etn.com (151.110.126.210) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 30 Jan 2024 03:13:50 -0500
Received: from USSTCSEXHET02.NAPA.AD.ETN.COM (151.110.240.154) by
 USLTCSPGWY04.napa.ad.etn.com (151.110.126.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 30 Jan 2024 03:13:50 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 hybridmail.eaton.com (151.110.240.154) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 30 Jan 2024 03:13:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dF9c+/UdY9FUAtMOqHmznvWR9rPNgpljx5Qb7yr42HRUaOqgPo0jsoyT68f38zxq1dUKl5rsRk4EUea9Rzcq3ETAz6vrmHPmXU1F/P49sg2bXleGyI2zPdOtM9G2tCzO/PIl4DeGAmhKygm2kQL4pBYhEP5m8L3HMc56UiCVkN3JuK2++TxQ5bPfjBSBH+NlPoWkPxt6lbtGGMzReUTwbqN9NvAmY0458FZJTILz1FxWKvF5V0BYzWKIpWbaY+C/P2/hQ3uWRjefovkmzIrCSNEVZ1qR41lMbA09TtcHeUosp5HEAqwp8LmyLFGSMU+1O67YZ4Ir88rFwTrE2Xf6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFVSqG6+NasK4qZnZsIC38Cl5bLg/yAg5PLk99hsvqg=;
 b=jizz69XUzn+mOY+SbH9V2/6bvucYf0pN5BvA0nkRIByQ2ET9J3cXLeylffaGu4xGDVQYq/b/ZxgwcxwCcYVveqygUK5sbxbO4zrAcp3y+9G/aWhPoDEGspDp+ki8mw+Y2DMI0b4ehZMRZd8F/g15W2luDzWBexHvZ3NTk0Tyc/aCuwr0uK7Xo1XbY2EWyAofhc5N5lWfVm2mbU5LIQStukpW1qSksd5U7/xOLvfyahZc8p/QbdVZ1KShz+on/b5W7CFFOY2j5cJtO2Fg4++C9XUSt3xYk6tCSTcnCISOjvVC+ARWV1YtMcVqG8RpEASJNkRS2TzITr4wN8Lq3OvTZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eaton.com; dmarc=pass action=none header.from=eaton.com;
 dkim=pass header.d=eaton.com; arc=none
Received: from SA1PR17MB5652.namprd17.prod.outlook.com (2603:10b6:806:1cf::21)
 by MW4PR17MB4291.namprd17.prod.outlook.com (2603:10b6:303:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.36; Tue, 30 Jan
 2024 08:13:48 +0000
Received: from SA1PR17MB5652.namprd17.prod.outlook.com
 ([fe80::9a89:2e27:7451:6ce4]) by SA1PR17MB5652.namprd17.prod.outlook.com
 ([fe80::9a89:2e27:7451:6ce4%6]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 08:13:48 +0000
From: "Motghare, Vishnu" <VishnuMotghare@eaton.com>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: RE: [EXTERNAL] Re: etnaviv : IMX6 Solo GPU Performance Issue With
 OpenGL ES-CM 1.1
Thread-Topic: [EXTERNAL] Re: etnaviv : IMX6 Solo GPU Performance Issue With
 OpenGL ES-CM 1.1
Thread-Index: Ado+2Gd+wxkWNUOoT+mXmiBejC8yGwAAAAAwABn5VAABSHWygAO7MAYQ
Date: Tue, 30 Jan 2024 08:13:48 +0000
Message-ID: <SA1PR17MB565294A45001941B937CA0B1D47D2@SA1PR17MB5652.namprd17.prod.outlook.com>
References: <SA1PR17MB5652020301F51E278E9C9175D467A@SA1PR17MB5652.namprd17.prod.outlook.com>
 <CAH9NwWdOcw+PF-qhZkHKhMDq2OQ=5oY1N=ibc3eX_VxX9U+Wgg@mail.gmail.com>
 <SA1PR17MB565200229CDCE858DC3ECC47D4682@SA1PR17MB5652.namprd17.prod.outlook.com>
In-Reply-To: <SA1PR17MB565200229CDCE858DC3ECC47D4682@SA1PR17MB5652.namprd17.prod.outlook.com>
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
x-ms-traffictypediagnostic: SA1PR17MB5652:EE_|MW4PR17MB4291:EE_
x-ms-office365-filtering-correlation-id: 36eddb3c-a210-453a-94b9-08dc216b62bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sOIbuHfuGuIMev3g0qVE5f4kKHPWTFXE/GwuEVeCzorYLJQ6+OI8dPoi3uwXs3rsVQEI6X5RF0ijbqUx5Lk6GPaQhaG8YGxklLaoHtsZuVvu+UTcOS08D6YcNUdQ/0mBXgMnfAO1NBWGbRkHdPOJWY9+oeqm+Ym+V3sJa4mOu0bm/Erf2B2zMXPt2d6+C83kIFD4+RIZ92jFy9O92JsoajxEpehs6T3eGV8/pQpsP8Kd48/fcmwIs519HjjBWKCLi/vH5K6O8/455hfg4I8e/g8n1kdWnWwDxYLaxvORRMOqoldZPyNArZrSZgsQmn4WoR8V4QbmOx96dr1iJdUorsPBz2SitOANkkOVEWOkKiCmAi5KZ9fr//xi/dhXKaj0P+htQK+D+nzxFqxDZ5WzXc4Aqsnva8SAHipe025J4ymrT+W5CmDeq/Ilv+dV7ei7ofDy0lXeNr8iQalhpkmlx7RSw5mPV4Hm0FZzkTNP2rLZI0P8tIcAVBlLnnURq3UYYx0JYjTc3yroZgf94vnyVOkYdsYb5JteDVyBuJ+YnQ6OSxGsvTFaHgZjUPt0J6bZHNgaE64l1AD84CNx55anftKlChkVl18foXZu7LlXCIE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR17MB5652.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(366004)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(52536014)(8936002)(8676002)(4326008)(2906002)(5660300002)(33656002)(86362001)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(316002)(38070700009)(966005)(38100700002)(122000001)(82960400001)(55236004)(7696005)(6506007)(9686003)(478600001)(71200400001)(83380400001)(26005)(41300700001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mi9hdUVqRWdMWXlTT095Q1lkQ3VzLytGSVozNXpjcXR1L0RGWkNlUEJqelhp?=
 =?utf-8?B?NGNrZTZma2N3NDZ4Sk1reDdSeU95TTNrckhkeUZXbDFzVzhuZnRxamNuaFBK?=
 =?utf-8?B?TVk3TnpkeHlBek1qYWo2SnRvVjZSUzI4MHY5VzFsdGRlVnNMSDM0RVZNMzQ1?=
 =?utf-8?B?Sk9yQW5VekNvUk80K1l1TWE4ejR2ejNTM0RIdXhSeTVvbUlaZ1J0SnM3Yk9v?=
 =?utf-8?B?T1Z4MEJ0UmhET2MwZi9lOStjMHZHd3VaTm1JUUdlV2c3dkRHdStnY0QxQzBD?=
 =?utf-8?B?UzNTS2ptZFZTZWlHOXdLS2EyR0hSc1Z2a1h3R29YbEpGT0ltZW9kVUVCRHVN?=
 =?utf-8?B?dSt4cDZ5M3dlaThDbGhjaXJoQmtheForcmVpOVl3TFc5SmVjWjZzTWtrQnNZ?=
 =?utf-8?B?UnpGZ1RNaXdxMU9yMG5PREtyTUN6bFl4SWVYdnJlUlFPOXlrdldJRS9mZEpX?=
 =?utf-8?B?Qmw1RStFaVFCelhtTTlzWHJSN0wzQ0xLK1A1SVk5UmlrMkNjMzNkSW9RSVYy?=
 =?utf-8?B?T2srQ0NZREV4dmdFUUhjZTZET1NabHE1LytvdTFES2RYZ1g3V3NCRXNVOFI3?=
 =?utf-8?B?RERDdlpFZGg0eXRIQ0VJN1dyUWUwSHArTUpQQWxub3dOVzc2MzZ2K3RYcUVy?=
 =?utf-8?B?QzFvS1JyTGVPT3o3aWRUc1BQTW9DUGRZRnEvUFhWd0dqSStlelp1WU1JSWxl?=
 =?utf-8?B?VTdwM1VpVXJDODhqSEg3Vmh5OHFyZE45UXF4Mm44Q0FCUUpQYmZaWS9zVmow?=
 =?utf-8?B?dlgyWFVNaGZydS9ranVEUXpCMUNXVHorTjZoWjBhMWVmYURsNDlDbi91Z3JD?=
 =?utf-8?B?R01JTkZuKzFFNDRhRE01ZUhEL0tiQWEwOHEvZmR6WjZobSs1czBDQTdXLzVB?=
 =?utf-8?B?b2Z3TU12c0NzekhRQ0RkajVXM0E3VGsxUkJyZzI1WGJCM0l2cml2VDY5bTI0?=
 =?utf-8?B?Tm5qeGdsdFdJRUcxQnBRcktTamRzTXNVRDYwaEFlM1RKRmdxNncwUWRyQTc3?=
 =?utf-8?B?QU0zRG9HR1gwRlhpc29PdGhQT1JtMWI3NGJ6dXBoWWZRVjdwamZDMmlzYmV5?=
 =?utf-8?B?QTRSaStHVjlDU2FtaWVhMm43dGtyRmdENmoxelF0MldDR1lrd1h3bGlaZFVx?=
 =?utf-8?B?WVJpOEljcUk2OWltQXd5R25sQmlOZjY0Nzl0YzU4UVc0YlhUMG1EWEZjekRm?=
 =?utf-8?B?NkpNSlk3WG5WNEI1Zk5VTWd6cmVCcG1sZWNWVzZ1TDVWd0ZyV2VKc0Z6cG9F?=
 =?utf-8?B?YWl5aWx3dnN1aUZRcUtqMVg4bU1rNzBjSjJ1NDlTSVVJMUd6YUdrUEpreG9O?=
 =?utf-8?B?YkJEWWdOTDlZaStqVnIrNzhvdXRLK3pPRGVGbmMvK2toWGhIc1dhZEZUQ1U1?=
 =?utf-8?B?bTZCN2FlZVNjS1JBQnk4b1dUNFVobmpvTlFkcEdCQVVyMnlGVFhkOEZGYjU2?=
 =?utf-8?B?SDlGYVE4emFLNld4RXkyM2t4UDkvS3dxdXB5KzB5Z3ZWb210RWpjcEkrRnNn?=
 =?utf-8?B?dUlkOHNiNEdGUkMxNjVYOWxSOHZVeWJ3ZXpoUzNCVjhNdlJncklWcnR1UlF0?=
 =?utf-8?B?eUlaOHRRa20zZFNGSGlCaUpxbTJWM1JuRERPQ1BZNm1QdjJVN0lsd0Y5NjNI?=
 =?utf-8?B?d0RqWGFZd3N5NHdYRjBnOWJGeklCYy9NSU5SMjBQR2prc1ZnR2FZM1lZYldM?=
 =?utf-8?B?cVhPYlRMVWZJdzY2OGF4ckxqR1dJQzVhNHh5YmNUdzRGWjNtYjA4Y1Z1cG1I?=
 =?utf-8?B?Z0FjRWUyS3U1aEw1N3Fyc0tJcXAzbmNFWTRpYTg4T2RKUXo4MGhkaWhMeDBV?=
 =?utf-8?B?M0EwYVprZi94UzVXR2hZNzJGYmovVXlxTWxmWlR2NDBHV2lZb1VUWE5ZeVJS?=
 =?utf-8?B?Q1VuKzY4clQvSTJNdGlSNE5Nbkcyd3JHanpkMEp2d3NvcmlPVWM2Ymkyajhq?=
 =?utf-8?B?SUZyVXdBcWgxc0plN0dmcDRmNGlyUkNjVzdxRE5kNXlKYXB4Q2pIeHlFVlp1?=
 =?utf-8?B?T2I0bEZIa0pEN0pIeFdkU1N2dkNDajN3N3ZPb2h6a3lqYS9GcHNkdGZNdXBw?=
 =?utf-8?B?TVBMVkJzSWwzMDlzU0VheEV4TjlpaEhtdHhobHVuWmZrdG1zT3c1eVloUllN?=
 =?utf-8?Q?2DLPcLLxj6uXQL3ShQTeG7M6c?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wmOFF7RYDzSo2L5BXeH21RuJDerxXmd4PC1Si+BOtHeVwYvFxRiPcCvQFt5wOEIT4yMDcVFEfxZRGLPmr3eoyilGWUN19N0ZRwfbvqHfAXvAxVQeuaqVzu3l3AUauK/DoEaFdzRTNETIgUfm4MdUnfJzkwAIE1A/FyEk+bKJRQZu5aVW6FuXAIm1iJaHrgNmJ55BYEVikv6YMqAnyQ5al/EQ0Qz7JGoJR2yeGx3GimVYYNpUgvqShASFYiOhNU1xTgrjT+lDR3S2dyY3Gin6+nMW8yK5KgKXOBlNInJkXLP8Xp2FLwaROPcnfUVq7VsY27QGDwZ0/or0WjUUttaUySQg1pgzaZ++maENU5SMLvpVG39SSTbPKT27M5NNgH/WZumJMDEnMTf+N4EHIWbjXyBlSUeOz3G05TRIs4luuXeSir1eetaPpAeTpByk8IyEM06FpMdEdah1oEe1p0usGSvl0qlAbTjS/uCh3k4tEroIOZQytl6JUKeyrkireur+9hpPDqAVdAcA/c48jMoQR8ca+GbeqygZo6JGwIAYg5Ro735MUHdenWpJx36iNX2OH+lSUx8ZaHBUuMbPKZ80eRMyp8JypSQ+DCsfDr0ReQPEcn+WsRPkDYnx/kaYZxhGH870PwMkj6d+IJbNz9yELA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR17MB5652.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36eddb3c-a210-453a-94b9-08dc216b62bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 08:13:48.1364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6525c95-b906-431a-b926-e9b51ba43cc4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1Si/KONQXETEiKx0XTwZFA1dVfOToLu/y1DdO462J0AbnrDrXd5BLiSQ9XYgxKVKKHmwp9XcNAry+N6YXlYVbkyql/Xh1767Q+t5k4+4QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB4291
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

SGkgQ2hyaXN0aWFuLA0KDQpXZSBoYXZlIHVwZGF0ZWQgdG8gTWVzYSAyMy4zLjMgJiB1c2VkIHRo
ZSBtb2Rlc2V0dGluZyBkcml2ZXIuIFdlIGNhbiBzZWUgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQg
d2l0aCBpdC4gDQoNCkFub3RoZXIgaXNzdWUgSSdtIGZhY2luZyBub3cgd2l0aCByb3RhdGlvbiAo
OTAgb3IgMjcwKSB0aGF0IHBlcmZvcm1hbmNlIGlzIHZlcnkgYmFkLiBJJ20gZ2V0dGluZyAyMSB0
byAyMCBGUFMgZm9yIGFsbCB0ZXN0IGNhc2VzLiBTaW1pbGFyIHJlc3VsdCBpcyBvYnNlcnZlZCB3
aXRoIGdsbWFyazINCg0KV2hhdCBjb3VsZCBiZSB0aGUgcmVhc29uIGZvciBkZWdyYWRlZCBwZXJm
b3JtYW5jZSBhZnRlciBzY3JlZW4gcm90YXRpb24/ICBBbnkgaGVscCBpcyBhcHByZWNpYXRlZC4g
VGhhbmtzIPCfmIoNCg0KSW1wcm92ZWQgUGVyZm9ybWFuY2Ugd2l0aCBOb3JtYWwgUm90YXRpb246
DQoNCkVudmlyb25tZW50IGluZm9ybWF0aW9uDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KRUdM
IHZlcnNpb24gOiAxLjQNCkdMIHZlbmRvciAgIDogTWVzYQ0KR0wgcmVuZGVyZXIgOiBWaXZhbnRl
IEdDODgwIHJldiA1MTA2DQpHTCB2ZXJzaW9uICA6IE9wZW5HTCBFUy1DTSAxLjEgTWVzYSAyMy4z
LjMNCg0KcnVuIHNjZW5lICdGbG9hdGluZyBGcmFtZTNEIFZCTycNCmluaXRpYWxpemUsIERBVEFf
U0laRToxMTI2NCwgTm8gb2YgRnJhbWVzOjUxMg0KQXZlcmFnZSBGUFMgPSA0Ny4zODU5NDYNCi0t
LQ0KDQpydW4gc2NlbmUgJ0Zsb2F0aW5nIEZyYW1lM0QnDQppbml0aWFsaXplLCBEQVRBX1NJWkU6
MTEyNjQsIE5vIG9mIEZyYW1lczo1MTINCkF2ZXJhZ2UgRlBTID0gNDIuMjUwNzA1DQotLS0NCg0K
cnVuIHNjZW5lICdGcmFtZSAzRCBGaXhlZCcNCmluaXRpYWxpemUsIERBVEFfU0laRToxMTI2NCwg
Tm8gb2YgRnJhbWVzOjUxMg0KQXZlcmFnZSBGUFMgPSA0MS4yNzE4MDINCi0tLQ0KDQpydW4gc2Nl
bmUgJ0Zsb2F0aW5nIGdyYXBoJw0KQXZlcmFnZSBGUFMgPSAxMDUuNzcyOTI2DQotLS0NCg0KcnVu
IHNjZW5lICdGaXhlZCBncmFwaCcNCkF2ZXJhZ2UgRlBTID0gMTA1LjYxMzM4Mg0KDQoNCkRlZ3Jh
ZGVkIHBlcmZvcm1hbmNlIHdpdGggOTAgb3IgMjcwIHJvdGF0aW9uOg0KDQpFbnZpcm9ubWVudCBp
bmZvcm1hdGlvbg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkVHTCB2ZXJzaW9uIDogMS40DQpH
TCB2ZW5kb3IgICA6IE1lc2ENCkdMIHJlbmRlcmVyIDogVml2YW50ZSBHQzg4MCByZXYgNTEwNg0K
R0wgdmVyc2lvbiAgOiBPcGVuR0wgRVMtQ00gMS4xIE1lc2EgMjMuMy4zDQoNCnJ1biBzY2VuZSAn
RmxvYXRpbmcgRnJhbWUzRCBWQk8nDQppbml0aWFsaXplLCBEQVRBX1NJWkU6MTEyNjQsIE5vIG9m
IEZyYW1lczo1MTINCkF2ZXJhZ2UgRlBTID0gMjEuNzMxNTA0DQotLS0NCg0KcnVuIHNjZW5lICdG
bG9hdGluZyBGcmFtZTNEJw0KaW5pdGlhbGl6ZSwgREFUQV9TSVpFOjExMjY0LCBObyBvZiBGcmFt
ZXM6NTEyDQpBdmVyYWdlIEZQUyA9IDIxLjU1MzA5MA0KLS0tDQoNCnJ1biBzY2VuZSAnRnJhbWUg
M0QgRml4ZWQnDQppbml0aWFsaXplLCBEQVRBX1NJWkU6MTEyNjQsIE5vIG9mIEZyYW1lczo1MTIN
CkF2ZXJhZ2UgRlBTID0gMjEuNTI2ODk2DQotLS0NCg0KcnVuIHNjZW5lICdGbG9hdGluZyBncmFw
aCcNCkF2ZXJhZ2UgRlBTID0gMjEuODUwNDU2DQotLS0NCg0KcnVuIHNjZW5lICdGaXhlZCBncmFw
aCcNCkF2ZXJhZ2UgRlBTID0gMjEuOTA0OTEwDQoNCj4+PiBXZSBoYXZlIGFuIElNWDYgc29sbyBj
dXN0b20gZGV2aWNlIHJ1bm5pbmcgd2l0aCBXaW5DRTcgJiBMaW51eCBvbiBpdA0KPj4+DQo+Pj4g
V2UgaGF2ZSBkZXZlbG9wZWQgYSBjdXN0b20gYmVuY2htYXJrIGFwcGxpY2F0aW9uIHVzaW5nIE9w
ZW5HTCBFUy1DTSAxLjENCj4+Pg0KDQo+PiBJcyBpdCBwb3NzaWJsZSB0byBzaGFyZSB0aGlzIHRl
c3QgYXBwbGljYXRpb24/DQoNCj4gSSBoYXZlIHBsYWNlZCB0aGUgYXBwbGljYXRpb24gaGVyZSBo
dHRwczovL2dpdGh1Yi5jb20vdmlzaG51bW90Z2hhcmUvb3BlbmdsICBpbiB0YXIgZm9ybWF0IChh
cHBsaWNhdGlvbi1vcGVuZ2wudGFyLmd6KS4gTGV0IG1lIGtub3cgaWYgeW91IGZhY2UgcHJvYmxl
bSBhY2Nlc3NpbmcgaXQuIA0KDQo+IE9uZSBvYnNlcnZhdGlvbiB0aGF0IHdoZW4gSSBydW4gdGhl
IGFwcGxpY2F0aW9uLCB0b3AgY29tbWFuZCBzaG93cyB0aGF0IGFwcGxpY2F0aW9uIHVzZXMgNzAt
ODAgJSBvZiBDUFUsIHRoYXQgaXMgc3RyYW5nZSwgSXQgc2hvdWxkIGJlIHVzaW5nIEdQVSBpbnN0
ZWFkIG9mIENQVS4gUmlnaHQ/DQoNCj4gSSBoYXZlIGFsc28gdHJpZWQgdXNpbmcgbW9kZXNldHRp
bmcgZHJpdmVyIGFuZCB3aXRoIHRoYXQgcGVyZm9ybWFuY2UgaXMgZXZlbiB3b3JzZSB0aGFuIGFy
bWFkYS4NCg0KPj4+IFdoZW4gSSByYW4gdGhlIGJlbmNobWFyayBhcHBsaWNhdGlvbiBvbiBXaW5D
RTcgdGhlIHBlcmZvcm1hbmNlIGxvb2tlZCBnb29kIGJ1dCB3aXRoIHNpbWlsYXIgYXBwbGljYXRp
b24gb24gTGludXggZ2l2ZXMgNTAgJSByZWR1Y3Rpb24gaW4gcGVyZm9ybWFuY2UuDQo+Pj4NCj4+
PiBGb2xsb3dpbmcgaXMgb3VyIGNvbmZpZ3VyYXRpb24NCj4+Pg0KPj4+IExpbnV4ICAgICAgICAg
ICAgIC0gTWFpbmxpbmUgNS4xNQ0KPj4+IEdQVSBkcml2ZXIgIC0gIEV0bmF2aXYNCj4+PiBYIERy
aXZlciAgICAgIC0gICB4Zjg2LXZpZGVvLWFybWFkYQ0KPj4+IE9wZW5HTCAgICAgIC0gICBPcGVu
R0wgRVMtQ00gMS4xDQo+Pj4NCj4+PiBXaW5DRSBSZXN1bHQ6DQo+Pj4NCj4+PiBFR0wgdmVyc2lv
biA6IDEuNA0KPj4+IEdMIHZlbmRvciAgIDogVml2YW50ZSBDb3Jwb3JhdGlvbg0KPj4+IEdMIHJl
bmRlcmVyIDogVml2YW50ZSBHQzg4MA0KPj4+IEdMIHZlcnNpb24gIDogT3BlbkdMIEVTLUNNIDEu
MSBNZXNhIDIyLjAuMw0KPj4+DQo+Pj4gcnVuIHNjZW5lICdGbG9hdGluZyBGcmFtZTNEIFZCTycN
Cj4+PiBpbml0aWFsaXplLCBEQVRBX1NJWkU6MTEyNjQsIE5vIG9mIEZyYW1lczo1MTIgQXZlcmFn
ZSBGUFMgPSA0OC4wNzUwMDUNCj4+PiAtLS0NCj4+Pg0KPj4+IHJ1biBzY2VuZSAnRmxvYXRpbmcg
RnJhbWUzRCcNCj4+PiBpbml0aWFsaXplLCBEQVRBX1NJWkU6MTEyNjQsIE5vIG9mIEZyYW1lczo1
MTIgQXZlcmFnZSBGUFMgPSAzMS45NzUwMDUNCj4+PiAtLS0NCj4+Pg0KPj4+IHJ1biBzY2VuZSAn
RnJhbWUgM0QgRml4ZWQnDQo+Pj4gaW5pdGlhbGl6ZSwgREFUQV9TSVpFOjExMjY0LCBObyBvZiBG
cmFtZXM6NTEyIEF2ZXJhZ2UgRlBTID0gMzEuNTA1NDg0DQo+Pj4gLS0tDQo+Pj4NCj4+PiBydW4g
c2NlbmUgJ0Zsb2F0aW5nIGdyYXBoJw0KPj4+IEF2ZXJhZ2UgRlBTID0gMjM4LjQwMzA5Mw0KPj4+
IC0tLQ0KPj4+DQo+Pj4gcnVuIHNjZW5lICdGaXhlZCBncmFwaCcNCj4+PiBBdmVyYWdlIEZQUyA9
IDIzOC4xODcyNzENCj4+Pg0KPj4+DQo+Pj4gTGludXggcmVzdWx0Og0KPj4+DQo+Pj4gRUdMIHZl
cnNpb24gOiAxLjQNCj4+PiBHTCB2ZW5kb3IgICA6IGV0bmF2aXYNCj4+PiBHTCByZW5kZXJlciA6
IFZpdmFudGUgR0M4ODAgcmV2IDUxMDYNCj4+PiBHTCB2ZXJzaW9uICA6IE9wZW5HTCBFUy1DTSAx
LjEgTWVzYSAyMi4wLjMNCj4+Pg0KPj4+IHJ1biBzY2VuZSAnRmxvYXRpbmcgRnJhbWUzRCBWQk8n
DQo+Pj4gaW5pdGlhbGl6ZSwgREFUQV9TSVpFOjExMjY0LCBObyBvZiBGcmFtZXM6NTEyIEF2ZXJh
Z2UgRlBTID0gMjYuODcyNjIzDQo+Pj4gLS0tDQo+Pj4NCj4+PiBydW4gc2NlbmUgJ0Zsb2F0aW5n
IEZyYW1lM0QnDQo+Pj4gaW5pdGlhbGl6ZSwgREFUQV9TSVpFOjExMjY0LCBObyBvZiBGcmFtZXM6
NTEyIEF2ZXJhZ2UgRlBTID0gMjQuMzczMzAwDQo+Pj4gLS0tDQo+Pj4NCj4+PiBydW4gc2NlbmUg
J0ZyYW1lIDNEIEZpeGVkJw0KPj4+IGluaXRpYWxpemUsIERBVEFfU0laRToxMTI2NCwgTm8gb2Yg
RnJhbWVzOjUxMiBBdmVyYWdlIEZQUyA9IDIzLjc4MzIwNQ0KPj4+IC0tLQ0KPj4+DQo+Pj4gcnVu
IHNjZW5lICdGbG9hdGluZyBncmFwaCcNCj4+PiBBdmVyYWdlIEZQUyA9IDEzNi42MjQ0NDcNCj4+
PiAtLS0NCj4+Pg0KPj4+IHJ1biBzY2VuZSAnRml4ZWQgZ3JhcGgnDQo+Pj4gQXZlcmFnZSBGUFMg
PSAxMzYuNTEwMDE2DQo+Pj4NCj4+PiBnbG1hcmsyIHdoaWNoIHVzZXMgb3BlbmdsIDIuMiBnaXZl
cyA4MCAlIHNjb3JlLiBDYW4gaXQgYmUgaXNzdWUgd2l0aCBPcGVuR2wgMS4xID8gT3IgWCBkcml2
ZXI/DQo+Pj4NCj4+PiBBdCB0aGUgbW9tZW50IG5vdCBhYmxlIHRvIGZpZ3VyZSBvdXQgd2hlcmUg
aXMgdGhlIHByb2JsZW0uICBBbnkgaGVscCBpcyBhcHByZWNpYWJsZS4NCj4+Pg0KDQpUaGFua3Ms
DQpWaXNobnUNCg==
