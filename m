Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMwVLJO0sWnbEgAAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Wed, 11 Mar 2026 19:29:39 +0100
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE382689B0
	for <lists+etnaviv@lfdr.de>; Wed, 11 Mar 2026 19:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA9810E3D3;
	Wed, 11 Mar 2026 18:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t+F5MHqB";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013009.outbound.protection.outlook.com
 [40.93.196.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1946710E023;
 Wed, 11 Mar 2026 18:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsFtj9Dd2O61UNzKmiOxtnh8yMdAct/HLqfxOPVsyueVZas72ZrqCOQN89APhX0+hRdId2OlB0C2y8U2yNwoK5ahuFmUDO63jFaksbhhl2xWte/ANQDsxmk4fsIDJEpXUSWfy5GeZd2aiUOwQhj9pqMjbO510h9hsQMN1r5qC0xbmWez7KThHMXjLeQRj3U4WROYh1FGBaKxXexlAV5Jm26I10bqgNEpPYWa+E9loPvacnjq7ygEWNcSApZWazm/Ldv58sZFo5y5MrVSv1kpetBZC26IngnnLO0PXxCJ+dMN0cQhQqpskxFvfhAy8mZMfXD17OWkgdPCrO30rMyoug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbR+eotuoDEs1OTvVtkfbEyufqa5FpbDj3T+cHR6Co4=;
 b=CSOKIUF56NdmB3LYKVuMc7vc67cjsqD9UG1tUxUcxdBmIXfFbJcyy2+oR5XEocn98eGQ8PDpQRUzZs05DBDDsoP+qr/IWmd7dElPlvdJMUi4F57izLiOmpiYnJkofDRSmSFTdBOGQn0UYyeQHuZ0tH3Hiv+31Q+Zy15xqToZR7gcxK65EZL2UN4vPop4m5EutCKnte1fSxVITcysKFu0hUJwJy3wYMMTZpYFpQtoaXhxPALpeUaHN5Kymlc0ZmU3HQ+acDmkE1vx0XDMATcheod2foC3lTOx+as2dvYsOU3sF6W7fOqX8EJf9eeZLAp95JsnTPEDdNseQo+OSN+dBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbR+eotuoDEs1OTvVtkfbEyufqa5FpbDj3T+cHR6Co4=;
 b=t+F5MHqBDoR7blUPpKX7bgne14vXTLtEIZVv4vLyqJm6d6Bj2Hh2iMui2x/II6xoVPDlkl/S0x2CaGk8MSU84rcLkULAaqYL7tVcOtqrK4ac5DF84m7wRE1xHYcANLv0nyyZKRnWnMcTTK8wTV4ZhX0TkmGGKJ4TNDx7DF0Cc2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Wed, 11 Mar
 2026 18:29:31 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 18:29:30 +0000
Message-ID: <dbb69222-a579-475a-ad20-1904e76b4609@amd.com>
Date: Wed, 11 Mar 2026 14:29:26 -0400
User-Agent: Mozilla Thunderbird
Subject: 2nd Reminder: Deadline to renew X.Org memberships for 2026 is March
 16.
To: Mark Filion <mark.filion@collabora.com>, events@lists.x.org,
 xorg-devel@lists.x.org, wayland-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, elections@x.org, members@x.org,
 xorg@lists.freedesktop.org
References: <0070f3dd-a521-40ee-b6e7-8b1f82e48b66@amd.com>
 <77e280436ec5b54973a11303dd0446e9f3ab2ba1.camel@collabora.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <77e280436ec5b54973a11303dd0446e9f3ab2ba1.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0030.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::28) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|CH2PR12MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: 8534240b-a7d3-41b7-f8fe-08de7f9c22b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|921020|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Clton1Ebb0SMOo3myKgBpRk7E3DtN2zUQeNfkijEyr1aMb80pRciOUfjoYcm6qi3eJsb1CvNkUcIJQrS2cO/9lLHYbsg2KaxsYEonkEO62CikkNDM+pjFW6hcz55EKJrN035JpfQCHzfteKpMWMO0mjmfETbdO4HhPbSUmJ3KvOrsfXNWYKIGuzJgjkVlx8v9UOC2L5lZy2XxjP5kJO4P9jN6fpCctgnBvK8WHKt0EJ62Tv/yN3aIHNt9yJhOfWF5WaXTbA0quWfsEdwefYLHiRN0iaQ8cEnRFL1y1aFmBbjznhNygMOv+jc1XldvqJoRaaVYr6T/Ig9CVtaqlTpp3u86ou7A7ItZabHEocnkvg3xpNxSDmAoiFGBGOsHPSWVO4FyZ24+UT15Pb7VMUYM8OGrY70H80eRqml//eUu1BTivnsKY2M/1vNYWd2oGJeeYbuRpKeON2gB+WTj6tr5rQwVxse/drgYuWpCGpsZIwnIQD92YZgtgEZiGcg4jA0ACZh+hwngFAZwInSN4XVr26xFLz6gDFg+Soiyri69j9SCMaFDHq8zr5gjLPF1fZ8ef0SM9WEP99q8UTaihkbn4HKiqWCT0KwRKpA/CpuLu9CrRYVI1Z3dd1BsR4daYvxkOyDnKr03lTpe4NWrSiPd7mvYaTA62QAsZEH0ddFiwYYxdNqUEHsDiTEM0KW544A+5HVaqlLSGaDzICbjsN8rOWytrdeZGX6+l3JJ8TtDO0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020)(13003099007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTZBcXhyUjJvc1ZUV0p2Zm5Dd29mODRDSEJKUWZqUTRSMzhSczBwcnV1Y2xp?=
 =?utf-8?B?NDB3WjNXZ0tnVWZKZmFDMGJOVVVkOE1ETjd4bDl1bnhCVWhBN3l3NEhOOThO?=
 =?utf-8?B?akl5OEI4NHYrSnFSODFxMkFkeU1qSnk0VFk0WWlSTkdoenQyUWx6M1cwWFp1?=
 =?utf-8?B?L3lhUXlHSUUrMU5nWXE3OXRVT2FIRHBOU1NXcUhzaTdEQ1R1RTJmMkRjOWZQ?=
 =?utf-8?B?NWJKL1RZQi9JVlpWQUhORFl1cE1DYzNXNGlNSVpQZjJEWmJSa1B4cjNwRldw?=
 =?utf-8?B?Yll6Sm5PaXd5RDZYSFFvSnhNMVpHdUpJRzQzbkJoREU1RHd1dkNENE9SNXdX?=
 =?utf-8?B?a3lJS0hQSFltU0kyNXQ0TlJyN2dwRVpSemxWeUNpU3pGTG5SRWV2ZzhaUkhY?=
 =?utf-8?B?TTZnM2RXOCtXbmtzVUdyNlV3WC8yMXlDWWVQMGN4RC9ITlBpNUxQdmJqT2pl?=
 =?utf-8?B?TURHWmJaMUFjLzBjbnZVUlRlOVY3cVhoVHphM2dlUzJ2TWpyNk8vNTFWc0Rx?=
 =?utf-8?B?UlJ5RlI1MDJTKzBZMG5oOWZZVFpyeEw3RE5FcXhZSlQ2ZU5XRTkxQk1jV3Y3?=
 =?utf-8?B?SDVHTVUwbFZzNkx1UVNySCtUUEtUYUNLd1ZQTTJQUU5pTFV0b3BYYko2SlRk?=
 =?utf-8?B?ZE00UytWVGo2cy8xRWJ2RDE4M3FQOXJSOUlEZDR5aDBuSTlibHZWbEtjdmt1?=
 =?utf-8?B?MmQ0ZFdxa0svN1Z1eUMvQWNza01PcVRJSVBqUDJPeUlaMVFxSitLdXBCS2dj?=
 =?utf-8?B?YzdSVXh4T0orRUxoQ1JBRHJINGhmK09vZUtUWUhUZ3JLOG9paWJkQytzYUZX?=
 =?utf-8?B?Mlp6U2ltOWMveXpXRGFNbUl0VXhXd0xaVEN1OXBMTEUxbUtxMkpHNVR3c1B5?=
 =?utf-8?B?SENxTnB5cThiVEJJUHF6OERaY3lFM1NRS3RmR3lSdFcxb1gxbm1HWmYzY0c0?=
 =?utf-8?B?Mkt0UWlDV3Y2alV6QUVZVUQvLzdvaktFYktaaUcwNy9ybUVEc2Y0bGRuQURy?=
 =?utf-8?B?TjJYc0pkdFpsMmRZMWd2UVh4VTkrczlCQkJFQmxtRWpNUVhZT0Q5bkdta3Ns?=
 =?utf-8?B?ZmY4bmFvTGl4SU55WlRHZnFrNS9nUGxWZTIxOG1pM042MkY4SWpzaS9JTTM5?=
 =?utf-8?B?bDFsZEN2dUthcE1RS1k3a1lwYzEvR2NmWS9iYXdyemo1VEJyR2hoMktZb0lW?=
 =?utf-8?B?OGNpWmUwbmllVUI0TmxEUk4yaEwwaHhMWHJrMkpxVmJDc3krUm1TQUo1QUVL?=
 =?utf-8?B?UUFRN1FxSG5KV1d5dzdDWnplemtvZXV5UHpacGVXRjdzWnl3TEhkc2dHcFVj?=
 =?utf-8?B?VXl6TkNoRFR6NUdnUG01aThNdXhZOEl6enVyaU9mcWdlY0dQbDBSUjFOK29q?=
 =?utf-8?B?eG5VcDA0TVpkSXdkcEx0NkFFSjNleFhDWmYvMUNpQkVXZi9JTDF6MzIwcVhM?=
 =?utf-8?B?MVIzYWtMaHFnSlVrWlNQcHhkWm5NNE84QlRpVzBuS29HZ3M5bHFBQndOa1hk?=
 =?utf-8?B?eDg2WnIvaU5Ua1hHeGdNOXNJaExRUzFlbHRqRUV0TXlleC8wT090c2FCVnJO?=
 =?utf-8?B?aVFPd1dyVmRHck5mZmNsYXo5VDY0VXZrdDd2RDcrM2J1LzZocnV6TzZ6WERK?=
 =?utf-8?B?WUNTbUZTSUt2YXM0NVA1OE9jMjhhRnlSZlN6WkJGVStOOHIxZVN5S0xlS0Mv?=
 =?utf-8?B?bWo0VE5Gblh0SEhKWnE2SG55SGVTcTdjVzFmdnp3Q1d0Rnd0RDNYN2xGU3pn?=
 =?utf-8?B?d0JlZ0hSdVVCakN4eVFTeUVIdHhkeFpDVG1Qd3JzampPbHpNRXRYeWtwOHhG?=
 =?utf-8?B?MDhHWFQxa3Y5UVZZZ215bVladmh3TFhTVlRmNm01ZEUvMlpUekZOQUFuaHRN?=
 =?utf-8?B?MUpFQ1RnMzJJMCtFTnNlVU1qdGJSUzdHUnNrSnJJeWZUajAyUElNSzBSc1BX?=
 =?utf-8?B?YXRNTUQvVGVVZ1FxODQ1cTE1RmhVV2MvWXlLcGRBT2hUM3VINGd2cUo3M3FM?=
 =?utf-8?B?NzF6eCtQQnA5VjBObnhPSmNLeXZkQWJoSkNaYTZ4Y2VRb0pYZmtpajdtMi8z?=
 =?utf-8?B?VHFRMVNad3V3WklkSDhFNmtYekQ0Y2llK2NGMlNybGQ0MkFMWUM2Rmc0akFk?=
 =?utf-8?B?MWkrY0hJVmI1SWxBU243Qnh1TUdEcElwcmt0UXpOK3I4NTVSajViUklwTlRX?=
 =?utf-8?B?MjJuN3liSXh3RUxrc01tQU8rTzF5SzNPeEN1clRxbzJqeWFJckZxUitpVkFL?=
 =?utf-8?B?blZ2eitNK2x1WExKRU5JS3JvMjZ4NlZHbXRlMTRYeWFYOFQxeExmMkpqbFA1?=
 =?utf-8?B?TjNQRU50K1dyYkV4Rmo2L2NIbUUveFFWeDdpUVg2b3B5c1prNDJPZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8534240b-a7d3-41b7-f8fe-08de7f9c22b9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:29:30.8676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BC9suXy2+tlIiECc8DJlyQwOD0j3r6IocQcbxeuGEpP1SnHLoOEnIhOYqikk2Xd06VKBCZuDh3Ggu48vxYV1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: BCE382689B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

the nomination period is now over. We'll be announcing the candidates next Monday, March 16.

That is also the date for the membership renewal deadline in order to vote in this year's elections. Even if you were a member in the past you'll need to log in to https://members.x.org/ and renew your membership. The button to do so will be visible after you log in.

Election details can be found at https://wiki.x.org/wiki/BoardOfDirectors/Elections/2026/

Thanks,
Harry

On 2026-03-04 11:12, Mark Filion wrote:
> Hi everyone,
> 
> Just a friendly reminder that the deadline to renew X.Org memberships for 2026 is March 16.
> 
> Membership renewal ensures you maintain your voting rights in the upcoming foundation elections, but also helps strengthen the foundation by giving it more credibility.
> 
> https://members.x.org/ <https://members.x.org/>
> 
> Thank you for your continued support of the X.Org Foundation.
> 
> Best,
> 
> Mark
> 
> On Wed, 2026-02-04 at 16:22 -0500, Harry Wentland wrote:
>> Hi all,
>>
>> it's a new year and with that a new X.Org Board of Directors
>> election. Please take the time to log in to members.x.org
>> and renew your membership for the new period or sign up for
>> the first time.
>>
>> These board members' periods will end this year:
>> - Mark Filion
>> - Erik Faye-Lund
>> - Simon Ser
>> - Neal Gompa
>>
>> The election dates will be as follows:
>>     Nomination period Start: Mon February 9th
>>     Nomination period End: Mon March 9th
>>     Publication of Candidates & start of Candidate QA: Mon March 16th
>>     Deadline of X.Org membership application or renewal: Mon March 16th
>>     Election Planned Start: Mon March 23rd
>>     Election Planned End: Mon April 13th
>>
>> If you have questions or encounter issues don't hesitate
>> to reach out the Elections Committee at elections@x.org <mailto:elections@x.org>.
>>
>> Best Regards,
>> Harry
> 

