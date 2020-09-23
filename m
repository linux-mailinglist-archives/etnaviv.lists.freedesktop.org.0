Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FEC2759E9
	for <lists+etnaviv@lfdr.de>; Wed, 23 Sep 2020 16:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5B46E2C7;
	Wed, 23 Sep 2020 14:27:21 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7136E199;
 Wed, 23 Sep 2020 14:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1X//5P65KqsdPzbuufxsTymxR68wjTKsLp73vcs8JkRTmS4sD7v+ouChOu3kVFQb/VA+NihzPp7O8ik4uieEtPhaEhxBpkXFhMlJam7LqXm01F3xDbpd5EmxPfjmZSk5I607NX0vuN8Y+RBbPpVZQN6ysRznqP8srI/RzBCEwrLkRgIsySodgHM2mkpZNuZsMHbVwj9YPRv6OGEGdQLmJwwZcAVo4NqR37eGW7WFgrwmc+q0U8cUbmCYMqoAb45xnvUsaP5t8deeWWiEcu1DcTs51u9XvZ+WnclP4S8/2iiNgUCzZPNCvlduUrS/6wtLeEgdrrYsi1vkaWIZUaSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaXYH/XK1LbUCphlMNfz9ZzJLkhCWtBAomROCVZiT4c=;
 b=SkEa0WgINmHLMa4022IIl3VJhDX6p3PxH9Dr4LWBcStEMZ3K0pzNiFvGtZI6sZqpXv5QPg1/GTwD102KLTUIhJW/n+H+nHGKQnqYC7eqkELaCF7WqlUD90NeIxyf1JGC2IBcuuUBrDLFyUn6NwNEQ7eiW4I2DWDH99QK1tZTkuA08s175eFI8wW1U/LdcGGPltsBJUXCFiEmnQFjfzBc91OMPK4r4Z0ISx5CpCHlhLuNy/OlYlU059z51LSSRVTJJet3YcJmUwbdnfSqKRIhQ5rDwvyzgP5upbQo1IxS/AcKok2Pb+G/Pv4i9GRpRXnvBWChCeG3Mqg2d3oerBUsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaXYH/XK1LbUCphlMNfz9ZzJLkhCWtBAomROCVZiT4c=;
 b=TXWYWObNqhuXzw7jBV3RLFZcJdSnwVijYNL7ID4oW/IOHSROihJyoVckfWXTZBNvv9yfyYWQiVMeECc/TIsoOZzh9d1hq4IYV8T4UcX6nQuShu0Rr9dmSeid7hrDOK1/jHqnhn1a8PVdWuwShoWXx7eGwwslnq3LnUVxyLXH2Ow=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 14:27:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Wed, 23 Sep 2020
 14:27:16 +0000
Subject: Re: [PATCH v2 1/3] dma-buf: Add struct dma-buf-map for storing struct
 dma_buf.vaddr_ptr
To: Thomas Zimmermann <tzimmermann@suse.de>, sumit.semwal@linaro.org,
 afd@ti.com, corbet@lwn.net, benjamin.gaignard@linaro.org,
 lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
 john.stultz@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, pawel@osciak.com,
 m.szyprowski@samsung.com, kyungmin.park@samsung.com, tfiga@chromium.org,
 mchehab@kernel.org, matthew.auld@intel.com, robin.murphy@arm.com,
 thomas.hellstrom@intel.com, sam@ravnborg.org, kraxel@redhat.com
References: <20200923123205.30671-1-tzimmermann@suse.de>
 <20200923123205.30671-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fa595f8a-3360-dc9f-2b85-0cdda28da3e5@amd.com>
Date: Wed, 23 Sep 2020 16:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923123205.30671-2-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend
 Transport; Wed, 23 Sep 2020 14:27:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c661b9fd-a0e8-4f63-dd7d-08d85fccc53e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4549:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4549F3F5D665B5651028330383380@MN2PR12MB4549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kPugTbrBBSNXya66m+Lb5EUXaR5uGbOCRf0waWV5tTuc6SQR/yC4GxduCMP6eo59vwAG4q7BzWXWdc8AQMOJXSIp6BNk1CoFsALyhQDFno2knBd+KKfIVezoz1iYzj3UCI/VJheKPxYfQoTYZor3/mUijzE8wOrXXmTwe+eH/c8qGfTtvdURZ6BKVbTs18T+8nvfif70WBbVOnr5XowWhUdZozXshHUulmb32lJkcIxlI3cYG3F8pzOo4eZtlAaHdej1PefrWZ6TNOdcy2OZ3xegxKkjQSi309Zkqmp767ZiGglHsaOATVY2YUjLgQNAWSKwFb23Stcvy2031qDWxoooJ8FF8UZonmu6auk2T4oefMwbt9GKTwvL5gG/+NfRZi0GeTXz50wNlqQH22sS7QlgkzEZOakqj6tGB7YW+AjGs0cETV9z272MQZlTT4KnoxEFxmnVez1Wj38XCwRTqQiaqrWZEdPk78IISmFjVKAI1YRat/IOleiu1IVYlER5TsPKf+Aki1qpRUwv0WtgvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(66574015)(8936002)(52116002)(66476007)(316002)(7406005)(7416002)(66556008)(66946007)(4326008)(8676002)(478600001)(6666004)(6486002)(966005)(16526019)(2616005)(186003)(36756003)(2906002)(45080400002)(31686004)(5660300002)(86362001)(83380400001)(31696002)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: UmuEnI9s+zF65p6wRtgZ4ObO4hvZZtLdgF9+yEYIOthYnduYIIU3x1PwdgTD68d8FGXDth2gIl9TBsUrpJQUbz1xRgcCPUJO/kI7rtDBxSlFxmZwHKDY3bjfxHtD3Q2YP+soAjXRweTEEXEVzHNgt31WfOK0ga1lFHvmkfh6wQyxywCHafE6Mt4QeDBQEAWF3NbIi/pVX0oAuKU8mhTrUUVXIfKvCiRNSqSOJrHjipZfssmbvzk+BDyiH7SnghtZxN34HkMbtkCBsJYUjwW4ZJR23AoiV0T2RKzHqkowvRPJ/64N1GXbbYNtJGE6g/+4xLnU8XW75bHDYjlIEDEAMpOpBVnGsLJGZSxXFuKAnyN/LY/e7oc5M/VNHCeqooxTizxZRa3MlWKOTsz1A3xWnSHQLVaRQilbszJ10Z/sCC4qcEWUnk3zrET5+o1nOcx01imiIpOUD8gkRzPhUMMCTMtkOqeayjusSJjD2A8HZSXjxsxilcOorpRDJTDbnbxmNfWpZ2fS2pVeBLG/nLu4vEUohSbrn5sGD7xOdpkaYWQto9HHxMwmo2oezj5v3IVkrBwz5MUjfIqicwB7Mm5zu9xCsKMXzn8bFMjQU6RIu5BcsZfm0ohi17hVBNk9+h9V8GPejQukk1JhWVmsrXEZm8aOQEkUAdRPmwdUItYpGwtna4UBVwjuboYe9BrM5ZrJFy9Furacakao4/Mt/JgMow==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c661b9fd-a0e8-4f63-dd7d-08d85fccc53e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 14:27:16.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frsM6rtND0ARZimtYaNIwLddoVbGfdgpQq/EHmoSu6l+JR/c/peobcBZdxuy1/TE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
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
Cc: linux-doc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gMjMuMDkuMjAgdW0gMTQ6MzIgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBUaGUgbmV3
IHR5cGUgc3RydWN0IGRtYV9idWZfbWFwIHJlcHJlc2VudHMgYSBtYXBwaW5nIG9mIGRtYS1idWYg
bWVtb3J5Cj4gaW50byBrZXJuZWwgc3BhY2UuIEl0IGNvbnRhaW5zIGEgZmxhZywgaXNfaW9tZW0s
IHRoYXQgc2lnbmFscyB1c2VycyB0bwo+IGFjY2VzcyB0aGUgbWFwcGVkIG1lbW9yeSB3aXRoIEkv
TyBvcGVyYXRpb25zIGluc3RlYWQgb2YgcmVndWxhciBsb2Fkcwo+IGFuZCBzdG9yZXMuCj4KPiBJ
dCB3YXMgYXNzdW1lZCB0aGF0IERNQSBidWZmZXIgbWVtb3J5IGNhbiBiZSBhY2Nlc3NlZCB3aXRo
IHJlZ3VsYXIgbG9hZAo+IGFuZCBzdG9yZSBvcGVyYXRpb25zLiBTb21lIGFyY2hpdGVjdHVyZXMs
IHN1Y2ggYXMgc3BhcmM2NCwgcmVxdWlyZSB0aGUKPiB1c2Ugb2YgSS9PIG9wZXJhdGlvbnMgdG8g
YWNjZXNzIGRtYS1tYXAgYnVmZmVycyB0aGF0IGFyZSBsb2NhdGVkIGluIEkvTwo+IG1lbW9yeS4g
UHJvdmlkaW5nIHN0cnVjdCBkbWFfYnVmX21hcCBhbGxvd3MgZHJpdmVycyB0byBpbXBsZW1lbnQg
dGhpcy4KPiBUaGlzIHdhcyBzcGVjaWZpY2FsbHkgYSBwcm9ibGVtIHdoZW4gcmVmcmVzaGluZyB0
aGUgZ3JhcGhpY3MgZnJhbWVidWZmZXIKPiBvbiBzdWNoIHN5c3RlbXMuIFsxXQo+Cj4gQXMgdGhl
IGZpcnN0IHN0ZXAsIHN0cnVjdCBkbWFfYnVmIHN0b3JlcyBhbiBpbnN0YW5jZSBvZiBzdHJ1Y3Qg
ZG1hX2J1Zl9tYXAKPiBpbnRlcm5hbGx5LiBBZnRlcndhcmRzLCBkbWEtYnVmJ3Mgdm1hcCBhbmQg
dnVubWFwIGludGVyZmFjZXMgYXJlIGJlCj4gY29udmVydGVkLiBGaW5hbGx5LCBhZmZlY3RlZCBk
cml2ZXJzIGNhbiBiZSBmaXhlZC4KPgo+IFsxXSBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90
ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsb3JlLmtlcm5lbC5vcmclMkZk
cmktZGV2ZWwlMkYyMDIwMDcyNTE5MTAxMi5HQTQzNDk1NyU0MHJhdm5ib3JnLm9yZyUyRiZhbXA7
ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M1NDQ4NmI5NjgyNjU0
ZjM5NTBiODA4ZDg1ZmJjYjFkMyU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdD
MCU3QzAlN0M2MzczNjQ2MTEzMzgxNTMyMDkmYW1wO3NkYXRhPSUyQlptN3Q4T2Nna0l4blklMkZk
WlNMaFNiS0M3dDF5NFZXNWxJTkZLd0NRdjNBJTNEJmFtcDtyZXNlcnZlZD0wCgpPbmx5IHR3byBu
aXQgcGlja3MgYmVsb3csIGFwYXJ0IGZyb20gdGhhdCBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvD
tm5pZyAKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBBY2tlZC1ieTogU3VtaXQgU2Vt
d2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiAtLS0KPiAgIERvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS9kbWEtYnVmLnJzdCB8ICAzICsKPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMg
ICAgICAgICAgICB8IDE0ICsrLS0tCj4gICBpbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmggICAg
ICAgICAgfCA4NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBpbmNsdWRlL2xpbnV4
L2RtYS1idWYuaCAgICAgICAgICAgICAgfCAgMyArLQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA5OSBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS9kbWEtYnVmLnJzdCBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJz
dAo+IGluZGV4IDEzZWEwY2MwYTNmYS4uMzI0NGM2MDBhOWExIDEwMDY0NAo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS9kbWEtYnVmLnJzdAo+IEBAIC0xMTUsNiArMTE1LDkgQEAgS2VybmVsIEZ1bmN0aW9u
cyBhbmQgU3RydWN0dXJlcyBSZWZlcmVuY2UKPiAgIC4uIGtlcm5lbC1kb2M6OiBpbmNsdWRlL2xp
bnV4L2RtYS1idWYuaAo+ICAgICAgOmludGVybmFsOgo+ICAgCj4gKy4uIGtlcm5lbC1kb2M6OiBp
bmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmgKPiArICAgOmludGVybmFsOgo+ICsKPiAgIFJlc2Vy
dmF0aW9uIE9iamVjdHMKPiAgIC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+
IGluZGV4IDU4NTY0ZDgyYTNhMi4uNWU4NDljYTI0MWEwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
ZG1hLWJ1Zi9kbWEtYnVmLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gQEAg
LTEyMDcsMTIgKzEyMDcsMTIgQEAgdm9pZCAqZG1hX2J1Zl92bWFwKHN0cnVjdCBkbWFfYnVmICpk
bWFidWYpCj4gICAJbXV0ZXhfbG9jaygmZG1hYnVmLT5sb2NrKTsKPiAgIAlpZiAoZG1hYnVmLT52
bWFwcGluZ19jb3VudGVyKSB7Cj4gICAJCWRtYWJ1Zi0+dm1hcHBpbmdfY291bnRlcisrOwo+IC0J
CUJVR19PTighZG1hYnVmLT52bWFwX3B0cik7Cj4gLQkJcHRyID0gZG1hYnVmLT52bWFwX3B0cjsK
PiArCQlCVUdfT04oZG1hX2J1Zl9tYXBfaXNfbnVsbCgmZG1hYnVmLT52bWFwX3B0cikpOwo+ICsJ
CXB0ciA9IGRtYWJ1Zi0+dm1hcF9wdHIudmFkZHI7Cj4gICAJCWdvdG8gb3V0X3VubG9jazsKPiAg
IAl9Cj4gICAKPiAtCUJVR19PTihkbWFidWYtPnZtYXBfcHRyKTsKPiArCUJVR19PTihkbWFfYnVm
X21hcF9pc19zZXQoJmRtYWJ1Zi0+dm1hcF9wdHIpKTsKPiAgIAo+ICAgCXB0ciA9IGRtYWJ1Zi0+
b3BzLT52bWFwKGRtYWJ1Zik7Cj4gICAJaWYgKFdBUk5fT05fT05DRShJU19FUlIocHRyKSkpCj4g
QEAgLTEyMjAsNyArMTIyMCw3IEBAIHZvaWQgKmRtYV9idWZfdm1hcChzdHJ1Y3QgZG1hX2J1ZiAq
ZG1hYnVmKQo+ICAgCWlmICghcHRyKQo+ICAgCQlnb3RvIG91dF91bmxvY2s7Cj4gICAKPiAtCWRt
YWJ1Zi0+dm1hcF9wdHIgPSBwdHI7Cj4gKwlkbWFidWYtPnZtYXBfcHRyLnZhZGRyID0gcHRyOwo+
ICAgCWRtYWJ1Zi0+dm1hcHBpbmdfY291bnRlciA9IDE7Cj4gICAKPiAgIG91dF91bmxvY2s6Cj4g
QEAgLTEyMzksMTUgKzEyMzksMTUgQEAgdm9pZCBkbWFfYnVmX3Z1bm1hcChzdHJ1Y3QgZG1hX2J1
ZiAqZG1hYnVmLCB2b2lkICp2YWRkcikKPiAgIAlpZiAoV0FSTl9PTighZG1hYnVmKSkKPiAgIAkJ
cmV0dXJuOwo+ICAgCj4gLQlCVUdfT04oIWRtYWJ1Zi0+dm1hcF9wdHIpOwo+ICsJQlVHX09OKGRt
YV9idWZfbWFwX2lzX251bGwoJmRtYWJ1Zi0+dm1hcF9wdHIpKTsKPiAgIAlCVUdfT04oZG1hYnVm
LT52bWFwcGluZ19jb3VudGVyID09IDApOwo+IC0JQlVHX09OKGRtYWJ1Zi0+dm1hcF9wdHIgIT0g
dmFkZHIpOwo+ICsJQlVHX09OKCFkbWFfYnVmX21hcF9pc192YWRkcigmZG1hYnVmLT52bWFwX3B0
ciwgdmFkZHIpKTsKPiAgIAo+ICAgCW11dGV4X2xvY2soJmRtYWJ1Zi0+bG9jayk7Cj4gICAJaWYg
KC0tZG1hYnVmLT52bWFwcGluZ19jb3VudGVyID09IDApIHsKPiAgIAkJaWYgKGRtYWJ1Zi0+b3Bz
LT52dW5tYXApCj4gICAJCQlkbWFidWYtPm9wcy0+dnVubWFwKGRtYWJ1ZiwgdmFkZHIpOwo+IC0J
CWRtYWJ1Zi0+dm1hcF9wdHIgPSBOVUxMOwo+ICsJCWRtYV9idWZfbWFwX2NsZWFyKCZkbWFidWYt
PnZtYXBfcHRyKTsKPiAgIAl9Cj4gICAJbXV0ZXhfdW5sb2NrKCZkbWFidWYtPmxvY2spOwo+ICAg
fQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmggYi9pbmNsdWRlL2xp
bnV4L2RtYS1idWYtbWFwLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAwMC4uZDRiMWJiM2NjNGIwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2luY2x1ZGUvbGludXgv
ZG1hLWJ1Zi1tYXAuaAo+IEBAIC0wLDAgKzEsODcgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb25seSAqLwo+ICsvKgo+ICsgKiBQb2ludGVyIHRvIGRtYS1idWYtbWFw
cGVkIG1lbW9yeSwgcGx1cyBoZWxwZXJzLgo+ICsgKi8KPiArCj4gKyNpZm5kZWYgX19ETUFfQlVG
X01BUF9IX18KPiArI2RlZmluZSBfX0RNQV9CVUZfTUFQX0hfXwo+ICsKPiArI2luY2x1ZGUgPGxp
bnV4L2lvLmg+Cj4gKwo+ICsvKioKPiArICogc3RydWN0IGRtYV9idWZfbWFwIC0gUG9pbnRlciB0
byB2bWFwJ2VkIGRtYS1idWYgbWVtb3J5Lgo+ICsgKiBAdmFkZHJfaW9tZW06CVRoZSBidWZmZXIn
cyBhZGRyZXNzIGlmIGluIEkvTyBtZW1vcnkKPiArICogQHZhZGRyOgkJVGhlIGJ1ZmZlcidzIGFk
ZHJlc3MgaWYgaW4gc3lzdGVtIG1lbW9yeQo+ICsgKiBAaXNfaW9tZW06CQlUcnVlIGlmIHRoZSBk
bWEtYnVmIG1lbW9yeSBpcyBsb2NhdGVkIGluIEkvTwo+ICsgKgkJCW1lbW9yeSwgb3IgZmFsc2Ug
b3RoZXJ3aXNlLgo+ICsgKgo+ICsgKiBDYWxsaW5nIGRtYS1idWYncyB2bWFwIG9wZXJhdGlvbiBy
ZXR1cm5zIGEgcG9pbnRlciB0byB0aGUgYnVmZmVyLgo+ICsgKiBEZXBlbmRpbmcgb24gdGhlIGxv
Y2F0aW9uIG9mIHRoZSBidWZmZXIsIHVzZXJzIG1heSBoYXZlIHRvIGFjY2VzcyBpdAo+ICsgKiB3
aXRoIEkvTyBvcGVyYXRpb25zIG9yIG1lbW9yeSBsb2FkL3N0b3JlIG9wZXJhdGlvbnMuIHN0cnVj
dCBkbWFfYnVmX21hcAo+ICsgKiBzdG9yZXMgdGhlIGJ1ZmZlciBhZGRyZXNzIGFuZCBhIGZsYWcg
dGhhdCBzaWduYWxzIHRoZSByZXF1aXJlZCBhY2Nlc3MuCj4gKyAqLwo+ICtzdHJ1Y3QgZG1hX2J1
Zl9tYXAgewo+ICsJdW5pb24gewo+ICsJCXZvaWQgX19pb21lbSAqdmFkZHJfaW9tZW07Cj4gKwkJ
dm9pZCAqdmFkZHI7Cj4gKwl9Owo+ICsJYm9vbCBpc19pb21lbTsKPiArfTsKPiArCj4gKy8qIEFQ
SSB0cmFuc2l0aW9uIGhlbHBlciAqLwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgZG1hX2J1Zl9tYXBf
aXNfdmFkZHIoY29uc3Qgc3RydWN0IGRtYV9idWZfbWFwICptYXAsIGNvbnN0IHZvaWQgKnZhZGRy
KQo+ICt7Cj4gKwlyZXR1cm4gIW1hcC0+aXNfaW9tZW0gJiYgKG1hcC0+dmFkZHIgPT0gdmFkZHIp
Owo+ICt9Cj4gKwo+ICsvKioKPiArICogZG1hX2J1Zl9tYXBfaXNfbnVsbCAtIFRlc3RzIGZvciBh
IGRtYS1idWYgbWFwcGluZyB0byBiZSBOVUxMCj4gKyAqIEBtYXA6CVRoZSBkbWEtYnVmIG1hcHBp
bmcgc3RydWN0dXJlCj4gKyAqCj4gKyAqIERlcGVuZGluZyBvbiB0aGUgc3RhdGUgb2Ygc3RydWN0
IGRtYV9idWZfbWFwLmlzX2lvbWVtLCB0ZXN0cyBpZiB0aGUKPiArICogbWFwcGluZyBpcyBOVUxM
Lgo+ICsgKgo+ICsgKiBSZXR1cm5zOgo+ICsgKiBUcnVlIGlmIHRoZSBtYXBwaW5nIGlzIE5VTEws
IG9yIGZhbHNlIG90aGVyd2lzZS4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBkbWFfYnVm
X21hcF9pc19udWxsKGNvbnN0IHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKQo+ICt7Cj4gKwlpZiAo
bWFwLT5pc19pb21lbSkKPiArCQlyZXR1cm4gbWFwLT52YWRkcl9pb21lbSA9PSBOVUxMOwo+ICsJ
cmV0dXJuIG1hcC0+dmFkZHIgPT0gTlVMTDsKClRoaXMgbG9va3MgbGlrZSBvdmVya2lsbCBzaW5j
ZSBib3RoIHBvaW50ZXJzIGFyZSBwYXJ0IG9mIHRoZSBzYW1lIHVuaW9uLgoKSSBzdWdnZXN0IHRv
IHRlc3Qgb25seSBvbmUgYW5kIGFkZCBhIGNvbW1lbnQuCgo+ICt9Cj4gKwo+ICsvKioKPiArICog
ZG1hX2J1Zl9tYXBfaXNfc2V0IC0gVGVzdHMgaXMgdGhlIGRtYS1idWYgbWFwcGluZyBoYXMgYmVl
biBzZXQKPiArICogQG1hcDoJVGhlIGRtYS1idWYgbWFwcGluZyBzdHJ1Y3R1cmUKPiArICoKPiAr
ICogRGVwZW5kaW5nIG9uIHRoZSBzdGF0ZSBvZiBzdHJ1Y3QgZG1hX2J1Zl9tYXAuaXNfaW9tZW0s
IHRlc3RzIGlmIHRoZQo+ICsgKiBtYXBwaW5nIGhhcyBiZWVuIHNldC4KPiArICoKPiArICogUmV0
dXJuczoKPiArICogVHJ1ZSBpZiB0aGUgbWFwcGluZyBpcyBiZWVuIHNldCwgb3IgZmFsc2Ugb3Ro
ZXJ3aXNlLgo+ICsgKi8KPiArc3RhdGljIGlubGluZSBib29sIGRtYV9idWZfbWFwX2lzX3NldChj
b25zdCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCkKPiArewo+ICsJcmV0dXJuICFkbWFfYnVmX21h
cF9pc19udWxsKG1hcCk7Cj4gK30KPiArCj4gKy8qKgo+ICsgKiBkbWFfYnVmX21hcF9jbGVhciAt
IENsZWFycyBhIGRtYS1idWYgbWFwcGluZyBzdHJ1Y3R1cmUKPiArICogQG1hcDoJVGhlIGRtYS1i
dWYgbWFwcGluZyBzdHJ1Y3R1cmUKPiArICoKPiArICogQ2xlYXJzIGFsbCBmaWVsZHMgdG8gemVy
bzsgaW5jbHVkaW5nIHN0cnVjdCBkbWFfYnVmX21hcC5pc19pb21lbS4gU28KPiArICogbWFwcGlu
ZyBzdHJ1Y3R1cmVzIHRoYXQgd2VyZSBzZXQgdG8gcG9pbnQgdG8gSS9PIG1lbW9yeSBhcmUgcmVz
ZXQgZm9yCj4gKyAqIHN5c3RlbSBtZW1vcnkuIFBvaW50ZXJzIGFyZSBjbGVhcmVkIHRvIE5VTEwu
IFRoaXMgaXMgdGhlIGRlZmF1bHQuCj4gKyAqLwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZG1hX2J1
Zl9tYXBfY2xlYXIoc3RydWN0IGRtYV9idWZfbWFwICptYXApCj4gK3sKPiArCWlmIChtYXAtPmlz
X2lvbWVtKSB7Cj4gKwkJbWFwLT52YWRkcl9pb21lbSA9IE5VTEw7Cj4gKwkJbWFwLT5pc19pb21l
bSA9IGZhbHNlOwo+ICsJfSBlbHNlIHsKPiArCQltYXAtPnZhZGRyID0gTlVMTDsKPiArCX0KCk1h
eWJlIGp1c3QgdXNlIG1lbXNldCgpIG9uIHRoZSBzdHJ1Y3R1cmUuCgpDaHJpc3RpYW4uCgo+ICt9
Cj4gKwo+ICsjZW5kaWYgLyogX19ETUFfQlVGX01BUF9IX18gKi8KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9kbWEtYnVmLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaAo+IGluZGV4IDk1
N2IzOThkMzBlNS4uZmNjMmRkZmI2ZDE4IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1h
LWJ1Zi5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgKPiBAQCAtMTMsNiArMTMsNyBA
QAo+ICAgI2lmbmRlZiBfX0RNQV9CVUZfSF9fCj4gICAjZGVmaW5lIF9fRE1BX0JVRl9IX18KPiAg
IAo+ICsjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi1tYXAuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9m
aWxlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvc2Nh
dHRlcmxpc3QuaD4KPiBAQCAtMzA5LDcgKzMxMCw3IEBAIHN0cnVjdCBkbWFfYnVmIHsKPiAgIAlj
b25zdCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgKm9wczsKPiAgIAlzdHJ1Y3QgbXV0ZXggbG9jazsKPiAg
IAl1bnNpZ25lZCB2bWFwcGluZ19jb3VudGVyOwo+IC0Jdm9pZCAqdm1hcF9wdHI7Cj4gKwlzdHJ1
Y3QgZG1hX2J1Zl9tYXAgdm1hcF9wdHI7Cj4gICAJY29uc3QgY2hhciAqZXhwX25hbWU7Cj4gICAJ
Y29uc3QgY2hhciAqbmFtZTsKPiAgIAlzcGlubG9ja190IG5hbWVfbG9jazsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0
CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdgo=
