Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56935328309
	for <lists+etnaviv@lfdr.de>; Mon,  1 Mar 2021 17:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098B589DD8;
	Mon,  1 Mar 2021 16:07:14 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C0389DD8
 for <etnaviv@lists.freedesktop.org>; Mon,  1 Mar 2021 16:07:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgjtLT/LXjgbwh6sVtjp7CSZ1WljCHlVJYu17VBh1o+fvNl2Q1eAKE7dN1baI6v518pY55DfoFF8EP8t1nFsiIdKfvfgo+Lg/GbObpOpdITTB2mGbHR1l/Caezcv93OFdjR2y8otOqYBwDKA0DQn9iUncaX+AaqZfBn1cAnSQOi8iSOzQy+xFAMX3weBx9FnHRt1J0bDj4kwYxUye+dqjAAVLQeG3IWYfLLxAFmz2HZPz36Pz0pBlMSc4SYQz+R9VIIGj3TMDGLVCFbzEt+pAK1L8DK/ewhbVBdoUAOTyLbtfNumWZSJtE6QyPw9jhcjeDwrMeFEyWishzESpGn8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF55qSoxQOGEbayxURNGwezG4c4OAtOW6PCmn2k3o3M=;
 b=er4TcDx8kF95tzNXyofTYpJUNqrHclPJ0nr2E1+VSsR8yNHEk28ffV+dYwceDYBoHhCAOK2LsGBZap26Qysr8mujkDDSubMQpA+ScvlBR3qSFkyy07vuSb1yr+GHJxGqEvLFw29RYCIQ3NjVTO3RDGu7N1kbOqWqp45KI+NtqVi5fERTKfBuMvg82hWojii3Rg46tOmMirAai1pCiseosGFT4n6E0D1buK92oOgD7fDECeahu6MEllJfQUPaS9y2fNiFSO0DIleCK96+NHKjhIATMiGamu1sGnFi6xPAfemH1vmECqvclr3Tsal7rSRhDzmq55WrE/fuBaukFociuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF55qSoxQOGEbayxURNGwezG4c4OAtOW6PCmn2k3o3M=;
 b=MsKP796ZTVcYnfXKmvEE8ILawMxJWbhNtz5hE5spGea3+nrp4YtLwXOKk9X+a2E54KYfMt5EeMa0sGNlUQ2qfc5gj7Uhu1VvDxeaxXo2nOaSq1y5InpCfiZljds5fpTY+r5HBXDxN8Al7tDZhe83rAr+Vt8Fu9XRqK7pli0OlUI=
Authentication-Results: x.org; dkim=none (message not signed)
 header.d=none;x.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 16:07:11 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b%3]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 16:07:11 +0000
To: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
From: Harry Wentland <harry.wentland@amd.com>
Subject: 2021 X.Org Board of Directions Nomination period ends next Sunday
Message-ID: <24bb7537-9ccc-377a-c1d6-f3d65e9b019f@amd.com>
Date: Mon, 1 Mar 2021 11:06:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.24 via Frontend Transport; Mon, 1 Mar 2021 16:07:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 457607d6-0589-4aa3-1f34-08d8dccc120f
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4553FD50C78477F02AF2B30F8C9A9@MW3PR12MB4553.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +lpyHi05mYkvneLxdzRN1/4KCg7L8vJwEesJ8rYQSf1oePWtdaBQgB4k09WDaDBtniLdP4PfPQ+BbHSs14opx64WWbBmQx8d94muoh6zFKjZEBZQa1HcUBN4hMscMBd0vnEQ2JnEghW7GufoPQZcgd9yWHKFIbFJAsq4yXF2IAh2Wd5wK9w4hmqVGBQG7zL5A+7hnuQD/QBvj4v8q0ArGehyN4zrEhJfzWcuKkM/2thsOlblNayiBT0PwHKunG9q7jfUmfFhZ4s9kzvp+WeW7vk35YX4Sz/qIe6o1wpi/EB2IWHNr638M7kSkJ6Bg5FBhJ71Oh4QV9VhEKUUgd2KDkpJTQ3jw0V4I5E6bg1yTyBMaclL6Sx8t2ZS4p8TjyvIArYBD+udc7t41C5zO5zO74kS+G+0pb+ADEzdf3bkHyK57+2pLVW0SzGQTSZ/f5taWk8agmgEVg68O+NiP/DRSGdKFeguKb8JcMxIAs7NzSAvr6fUfxyGV+kXIkHnGJw2S8HvyWdIW4efJvk3mvzUC1IgOdGzTBn3iGQKkuPy3V10CigxrqJ8hRsbigM5q7ZE1+xlV5TMIDeMnRmi1bT+6ncwjKxM5Vdi7071cGZ344o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(86362001)(316002)(186003)(478600001)(6486002)(36756003)(26005)(16576012)(16526019)(52116002)(31686004)(6666004)(31696002)(66476007)(66556008)(5660300002)(956004)(2906002)(2616005)(4326008)(4744005)(44832011)(6916009)(8676002)(66946007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TkdnaXFwbVFkQ3QyeWpzelRXUTBzUWNGS3BsRXJuanhTY09XZGp0OHFtUzRP?=
 =?utf-8?B?cG1FZkFYc2xWNTU5d2xTeFRMZzZBSTNNRldhOXhwR1pLQWVwTlJQSllBNWJy?=
 =?utf-8?B?VzEwcCtIdytpOXN1bVRPdW9tSHhVT0g3OGZKS3gvT3Q2aEc5Z3FyMGthbi9n?=
 =?utf-8?B?dFlqdUFUYVlkb0s2bGMvOUd2czZyWGdkMnRnRW9PenhoRi9UekUxYi9rbzdt?=
 =?utf-8?B?RjFaWUtkUXdrVkxMQnRNdDJVdGhkTHVSM2tYYWd1czdYQUpaVUpLazl2VmxT?=
 =?utf-8?B?L09PTjJ3dkpZV0lIMHFtaGVaeEtEVFVUVlludERnWU8rNSs4ejJqdmUwSktR?=
 =?utf-8?B?UEd0WHhkUlorbk1jeE1ZR2lhalhLL2NtSmx3N1FTNHFvajUwejN6a2xiVTkx?=
 =?utf-8?B?K2JnY0xVU0xJZllKNjRFb1VLY1llUTNEbkJ3VjZIdzJ4YWxiaFdLeWF5MWVt?=
 =?utf-8?B?RzhFQU9NUXNPR2RtdHpDVWdPK3EzVmZUVTA2ck8wdG9uMCtNM25ZMXU5azQ1?=
 =?utf-8?B?OVBTWlByMW1wbm9jVk80RjJSYllIVFpCZFhwNDFKMHRQMFhrbmlxSzNDN3Qx?=
 =?utf-8?B?bGVjTlEzdW5rdXVrckZ1YWtFNkd6WTNkVDRqcWh3MUVCWC9ZbEpxY3BNcFVx?=
 =?utf-8?B?TkQ4NkFYTjVlaUhpYW16MDZSeS8xa0Fncy9kdXllWUNsRzRXZ2hPREFBNllx?=
 =?utf-8?B?VWs5clUxTU4rYXJ1blZsdEFFbXhvZkhLM2QrRHNONlZIODIvS0FVcDQyMDMy?=
 =?utf-8?B?RHNSb0pTQmhnQ2piR1BIcStTblhrM0VNd3JqWHZVRDc1c0NqZVFaRGUxVkE5?=
 =?utf-8?B?RkJrOXljb2kvdnJCYzBRK0dnYlpTbmlFKzdxQ0N2aS9wR0RFQm1DOHorUk0w?=
 =?utf-8?B?UGhsRE9SZ3A2cC90U2lpTDJwYkNYRXE0UjFXUEtLSTVEV0F6Y1U5bWRWNGIz?=
 =?utf-8?B?dnFSUC9vZDZpdnJkdDRNYXN5dmJ2dGdoTFZJU1FlTWJHaks2SWJJSmFnN1Y4?=
 =?utf-8?B?eFhjQUw1aW1LMHZCOXpKZUk5U1R5bDlqK1hhTm5lb2RiQ3FJczROUkFrSnBr?=
 =?utf-8?B?NDlybHJmb3VIRW9MOHU2czhVcDhWL3hxanFTRFBEZEc3KzJjRkwwd1M5bC92?=
 =?utf-8?B?TmNFUkVwdGJ3a3hmSmtEMmxYNExnaitrazJMbS9XQytWSnVIVldTREpuWWJP?=
 =?utf-8?B?UER3NUlHaDZ0cStkQVRzNHdrRjY5c0VFdlY5alhxeWQ3Z2xYYWY5OG1abElR?=
 =?utf-8?B?VHNGMms3WXZWYlBEcldzMUM5b1NDZWdER3g1Z01lVVl2RFdkT0lUbTlsbXNr?=
 =?utf-8?B?WUNXVmJoSUF0eWxrZXQ2TmdsRHVlRWlPblFjN1lNR1FKUUVLZWR4aG5lcHpH?=
 =?utf-8?B?Zml1OXJPTHNEYVN4UTl0S1l3cVFrdHNoYXdXZkw4QWZCZCtnMTF6TlQ3Q2wr?=
 =?utf-8?B?Rys4NTZZbFpHT0ZralhvcU94OTJxZDBPU1ZabGp2VlRYa3ZESjk2UnNSbUJl?=
 =?utf-8?B?Q0NXVkhuanlsS2pxQmtkMXJ4Y2RaZkZGNFFlZ2cwWFFabFZvRmxLSUsyTDdy?=
 =?utf-8?B?c3NXRzRJY2orV1J3SUEvSGMrT2g4N09EVDNQYmx2RnhTcjI4Nnp0UytZdDRX?=
 =?utf-8?B?VytBSmNxc3FEcWJ2YWFtTCtaYW90WCtBYVUxVDQyM1haNCtEdHQ0TnZUd2VV?=
 =?utf-8?B?dzFSYVJ0R050TS82VzU2OWRDd013QjFhRUxCb3EwdWkwbnNtSjl4UWpRbHJV?=
 =?utf-8?Q?qZdSp60hs/JkJFsFrjph92z7HyI25Xv1jGeimdV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457607d6-0589-4aa3-1f34-08d8dccc120f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 16:07:11.7530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+PlNafr4EnVUDcVda/qQ8kxtrWAVRDctxFr9vn/Px+WuK72NvPaaX3xrCi097iVNf4cE9ekY0dx19WD9MT4Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4553
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
Cc: elections <elections@x.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Unfortunately my previous email seems to not have been received by many 
people. I will send this email separately to each mailing list to 
hopefully get better coverage.

The nomination period is currently ongoing. So far we have received 3 
nominations and will need at least 4 to fill the vacant spots on the 
board. We hope you will consider putting your nomination forward.

To nominate yourself or someone else please send the nomination, along 
with a personal statement to elections at x dot org.

** Election Schedule **

Nomination period Start: Mon 22nd February
Nomination period End: Sun 7th March
Deadline of X.Org membership application or renewal: Thu 11th March
Publication of Candidates & start of Candidate QA: Mon 15th March
Election Planned Start: Mon 22nd March anywhere on earth
Election Planned End: Sun 4th April anywhere on earth

** Election Committee **

* Eric Anholt
* Mark Filion
* Keith Packard
* Harry Wentland

Cheers,
Harry Wentland,
on behalf of the X.Org elections committee
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
