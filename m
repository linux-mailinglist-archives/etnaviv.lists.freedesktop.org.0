Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B371B4930
	for <lists+etnaviv@lfdr.de>; Tue, 17 Sep 2019 10:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63696EB55;
	Tue, 17 Sep 2019 08:21:26 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2C46EF2C;
 Fri, 13 Sep 2019 11:52:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:20 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="190282804"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/etnaviv: use drm_debug_enabled() to check for debug
 categories
Date: Fri, 13 Sep 2019 14:51:40 +0300
Message-Id: <1c06c0432d8ad1edc286da2df806b26b468ada79.1568375189.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1568375189.git.jani.nikula@intel.com>
References: <cover.1568375189.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QWxsb3cgYmV0dGVyIGFic3RyYWN0aW9uIG9mIHRoZSBkcm1fZGVidWcgZ2xvYmFsIHZhcmlhYmxl
IGluIHRoZQpmdXR1cmUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KCkNjOiBMdWNhcyBTdGFjaCA8
bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KQ2M6IFJ1c3NlbGwgS2luZyA8bGludXgrZXRuYXZpdkBh
cm1saW51eC5vcmcudWs+CkNjOiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJA
Z21haWwuY29tPgpDYzogZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1i
eTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZXRuYXZpdi9ldG5hdml2X2J1ZmZlci5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2J1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYv
ZXRuYXZpdl9idWZmZXIuYwppbmRleCA3ZTRlMjk1OWJmNGYuLjMyZDlmYWM1ODdmOSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9idWZmZXIuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2J1ZmZlci5jCkBAIC0zMjYsNyArMzI2LDcgQEAg
dm9pZCBldG5hdml2X2J1ZmZlcl9xdWV1ZShzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwgdTMyIGV4
ZWNfc3RhdGUsCiAKIAlsb2NrZGVwX2Fzc2VydF9oZWxkKCZncHUtPmxvY2spOwogCi0JaWYgKGRy
bV9kZWJ1ZyAmIERSTV9VVF9EUklWRVIpCisJaWYgKGRybV9kZWJ1Z19lbmFibGVkKERSTV9VVF9E
UklWRVIpKQogCQlldG5hdml2X2J1ZmZlcl9kdW1wKGdwdSwgYnVmZmVyLCAwLCAweDUwKTsKIAog
CWxpbmtfdGFyZ2V0ID0gZXRuYXZpdl9jbWRidWZfZ2V0X3ZhKGNtZGJ1ZiwKQEAgLTQ1OSwxMyAr
NDU5LDEzIEBAIHZvaWQgZXRuYXZpdl9idWZmZXJfcXVldWUoc3RydWN0IGV0bmF2aXZfZ3B1ICpn
cHUsIHUzMiBleGVjX3N0YXRlLAogCQkgZXRuYXZpdl9jbWRidWZfZ2V0X3ZhKGJ1ZmZlciwgJmdw
dS0+bW11X2NvbnRleHQtPmNtZGJ1Zl9tYXBwaW5nKQogCQkgKyBidWZmZXItPnVzZXJfc2l6ZSAt
IDQpOwogCi0JaWYgKGRybV9kZWJ1ZyAmIERSTV9VVF9EUklWRVIpCisJaWYgKGRybV9kZWJ1Z19l
bmFibGVkKERSTV9VVF9EUklWRVIpKQogCQlwcl9pbmZvKCJzdHJlYW0gbGluayB0byAweCUwOHgg
QCAweCUwOHggJXBcbiIsCiAJCQlyZXR1cm5fdGFyZ2V0LAogCQkJZXRuYXZpdl9jbWRidWZfZ2V0
X3ZhKGNtZGJ1ZiwgJmdwdS0+bW11X2NvbnRleHQtPmNtZGJ1Zl9tYXBwaW5nKSwKIAkJCWNtZGJ1
Zi0+dmFkZHIpOwogCi0JaWYgKGRybV9kZWJ1ZyAmIERSTV9VVF9EUklWRVIpIHsKKwlpZiAoZHJt
X2RlYnVnX2VuYWJsZWQoRFJNX1VUX0RSSVZFUikpIHsKIAkJcHJpbnRfaGV4X2R1bXAoS0VSTl9J
TkZPLCAiY21kICIsIERVTVBfUFJFRklYX09GRlNFVCwgMTYsIDQsCiAJCQkgICAgICAgY21kYnVm
LT52YWRkciwgY21kYnVmLT5zaXplLCAwKTsKIApAQCAtNDg0LDYgKzQ4NCw2IEBAIHZvaWQgZXRu
YXZpdl9idWZmZXJfcXVldWUoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUsIHUzMiBleGVjX3N0YXRl
LAogCQkJCSAgICBWSVZfRkVfTElOS19IRUFERVJfUFJFRkVUQ0gobGlua19kd29yZHMpLAogCQkJ
CSAgICBsaW5rX3RhcmdldCk7CiAKLQlpZiAoZHJtX2RlYnVnICYgRFJNX1VUX0RSSVZFUikKKwlp
ZiAoZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VUX0RSSVZFUikpCiAJCWV0bmF2aXZfYnVmZmVyX2R1
bXAoZ3B1LCBidWZmZXIsIDAsIDB4NTApOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5h
dml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
