Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A021FC9AA6
	for <lists+etnaviv@lfdr.de>; Thu,  3 Oct 2019 11:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3C86E98F;
	Thu,  3 Oct 2019 09:18:13 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907A989E3E;
 Wed,  2 Oct 2019 14:11:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2019 07:11:54 -0700
X-IronPort-AV: E=Sophos;i="5.64,574,1559545200"; d="scan'208";a="366716873"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2019 07:11:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/9] drm/print: add and use drm_debug_enabled()
In-Reply-To: <cover.1569329774.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1569329774.git.jani.nikula@intel.com>
Date: Wed, 02 Oct 2019 17:11:45 +0300
Message-ID: <87v9t79qzi.fsf@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Oct 2019 09:18:09 +0000
X-BeenThere: etnaviv@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <etnaviv.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/etnaviv>
List-Post: <mailto:etnaviv@lists.freedesktop.org>
List-Help: <mailto:etnaviv-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=subscribe>
Cc: David Zhou <David1.Zhou@amd.com>, Francisco Jerez <currojerez@riseup.net>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Eric Engestrom <eric.engestrom@intel.com>,
 Rob Clark <robdclark@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-arm-msm@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gVHVlLCAyNCBTZXAgMjAxOSwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4g
d3JvdGU6Cj4gICBkcm0vcHJpbnQ6IG1vdmUgZHJtX2RlYnVnIHZhcmlhYmxlIHRvIGRybV9wcmlu
dC5bY2hdCj4gICBkcm0vcHJpbnQ6IGFkZCBkcm1fZGVidWdfZW5hYmxlZCgpCj4gICBkcm0vZXRu
YXZpdjogdXNlIGRybV9kZWJ1Z19lbmFibGVkKCkgdG8gY2hlY2sgZm9yIGRlYnVnIGNhdGVnb3Jp
ZXMKPiAgIGRybS9pMmMvc2lsMTY0OiB1c2UgZHJtX2RlYnVnX2VuYWJsZWQoKSB0byBjaGVjayBm
b3IgZGVidWcgY2F0ZWdvcmllcwo+ICAgZHJtL21zbTogdXNlIGRybV9kZWJ1Z19lbmFibGVkKCkg
dG8gY2hlY2sgZm9yIGRlYnVnIGNhdGVnb3JpZXMKClB1c2hlZCB0aGUgYWJvdmUgcGF0Y2hlcyB0
byBkcm0tbWlzYy1uZXh0LCB0aGFua3MgZm9yIHRoZSByZXZpZXdzIGFuZAphY2tzIQoKVGhlIGJl
bG93IGk5MTUgYW5kIGFtZGdwdSBwYXRjaGVzIGNvbmZsaWN0IG9uIGRybS1taXNjLW5leHQsIGFu
ZCBJCmhhdmVuJ3QgcmVjZWl2ZWQgYW55IGZlZWRiYWNrIG9uIG5vdXZlYXUuCgo+ICAgZHJtL2k5
MTU6IHVzZSBkcm1fZGVidWdfZW5hYmxlZCgpIHRvIGNoZWNrIGZvciBkZWJ1ZyBjYXRlZ29yaWVz
Cj4gICBkcm0vbm91dmVhdTogdXNlIGRybV9kZWJ1Z19lbmFibGVkKCkgdG8gY2hlY2sgZm9yIGRl
YnVnIGNhdGVnb3JpZXMKPiAgIGRybS9hbWRncHU6IHVzZSBkcm1fZGVidWdfZW5hYmxlZCgpIHRv
IGNoZWNrIGZvciBkZWJ1ZyBjYXRlZ29yaWVzCj4gICBkcm0vcHJpbnQ6IHJlbmFtZSBkcm1fZGVi
dWcgdG8gX19kcm1fZGVidWcgdG8gZGlzY291cmFnZSB1c2UKCkJSLApKYW5pLgoKCi0tIApKYW5p
IE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0
bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
