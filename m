Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A96CB4931
	for <lists+etnaviv@lfdr.de>; Tue, 17 Sep 2019 10:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54796EB56;
	Tue, 17 Sep 2019 08:21:26 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A386EF23;
 Fri, 13 Sep 2019 11:52:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:03 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="176262198"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:51:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] drm/print: add and use drm_debug_enabled()
Date: Fri, 13 Sep 2019 14:51:37 +0300
Message-Id: <cover.1568375189.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Tue, 17 Sep 2019 08:21:25 +0000
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
 jani.nikula@intel.com, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-arm-msm@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgYWxsLCBqdXN0IGEgbGl0dGxlIHJlZmFjdG9yaW5nIGFyb3VuZCBkcm1fZGVidWcgYWNjZXNz
IHRvIGFic3RyYWN0IGl0CmJldHRlci4gVGhlcmUgc2hvdWxkbid0IGJlIGFueSBmdW5jdGlvbmFs
IGNoYW5nZXMuCgpJJ2QgYXBwcmVjaWF0ZSBhY2tzIGZvciBtZXJnaW5nIHRoZSBsb3QgdmlhIGRy
bS1taXNjLiBJZiB0aGVyZSBhcmUgYW55Cm9iamVjdGlvbnMgdG8gdGhhdCwgd2UnbGwgbmVlZCB0
byBwb3N0cG9uZSB0aGUgbGFzdCBwYXRjaCB1bnRpbApldmVyeXRoaW5nIGhhcyBiZWVuIG1lcmdl
ZCBhbmQgY29udmVydGVkIGluIGRybS1uZXh0LgoKQlIsCkphbmkuCgoKQ2M6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIChDaHVuTWluZykgWmhvdSA8RGF2aWQxLlpo
b3VAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBCZW4gU2tl
Z2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFu
QHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogZnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogRnJhbmNpc2NvIEplcmV6IDxjdXJyb2plcmV6
QHJpc2V1cC5uZXQ+CkNjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KQ2M6
IFJ1c3NlbGwgS2luZyA8bGludXgrZXRuYXZpdkBhcm1saW51eC5vcmcudWs+CkNjOiBDaHJpc3Rp
YW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgpDYzogZXRuYXZpdkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKCgpKYW5pIE5pa3VsYSAoOSk6CiAgZHJtL3ByaW50OiBtb3ZlIGRy
bV9kZWJ1ZyB2YXJpYWJsZSB0byBkcm1fcHJpbnQuW2NoXQogIGRybS9wcmludDogYWRkIGRybV9k
ZWJ1Z19lbmFibGVkKCkKICBkcm0vZXRuYXZpdjogdXNlIGRybV9kZWJ1Z19lbmFibGVkKCkgdG8g
Y2hlY2sgZm9yIGRlYnVnIGNhdGVnb3JpZXMKICBkcm0vaTJjL3NpbDE2NDogdXNlIGRybV9kZWJ1
Z19lbmFibGVkKCkgdG8gY2hlY2sgZm9yIGRlYnVnIGNhdGVnb3JpZXMKICBkcm0vaTkxNTogdXNl
IGRybV9kZWJ1Z19lbmFibGVkKCkgdG8gY2hlY2sgZm9yIGRlYnVnIGNhdGVnb3JpZXMKICBkcm0v
bXNtOiB1c2UgZHJtX2RlYnVnX2VuYWJsZWQoKSB0byBjaGVjayBmb3IgZGVidWcgY2F0ZWdvcmll
cwogIGRybS9ub3V2ZWF1OiB1c2UgZHJtX2RlYnVnX2VuYWJsZWQoKSB0byBjaGVjayBmb3IgZGVi
dWcgY2F0ZWdvcmllcwogIGRybS9hbWRncHU6IHVzZSBkcm1fZGVidWdfZW5hYmxlZCgpIHRvIGNo
ZWNrIGZvciBkZWJ1ZyBjYXRlZ29yaWVzCiAgZHJtL3ByaW50OiByZW5hbWUgZHJtX2RlYnVnIHRv
IF9fZHJtX2RlYnVnIHRvIGRpc2NvdXJhZ2UgdXNlCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc211X3YxMV8wX2kyYy5jICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21p
Y191YXBpLmMgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jICAgICAgICB8ICA2ICsrLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jICAg
ICAgICAgICAgICAgICAgICB8IDE3IC0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2Ry
bV9lZGlkLmMgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkX2xvYWQuYyAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2RybV9taXBp
X2RiaS5jICAgICAgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50
LmMgICAgICAgICAgICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrKy0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX3ZibGFuay5jICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2J1ZmZlci5jICAgICB8ICA4ICsrKy0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9pMmMvc2lsMTY0X2Rydi5jICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgIDQgKystLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kcnYuYyAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9nZW0uaCAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV91dGlscy5jICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfcG0uYyAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2ttcy5oICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNw
bnY1MC9kaXNwLmggICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfZHJ2LmggICAgICAgIHwgIDQgKystLQogaW5jbHVkZS9kcm0vZHJtX2Rydi5oICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMiAtLQogaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggICAgICAgICAg
ICAgICAgICAgICAgfCAgOCArKysrKysrCiAyMiBmaWxlcyBjaGFuZ2VkLCA2MCBpbnNlcnRpb25z
KCspLCA1MiBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZXRuYXZpdg==
