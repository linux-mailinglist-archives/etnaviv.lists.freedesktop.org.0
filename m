Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE601732E2
	for <lists+etnaviv@lfdr.de>; Wed, 24 Jul 2019 17:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A376E5D5;
	Wed, 24 Jul 2019 15:37:06 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCD96E5D5
 for <etnaviv@lists.freedesktop.org>; Wed, 24 Jul 2019 15:37:05 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hqJKC-0007dk-1M; Wed, 24 Jul 2019 17:37:04 +0200
Message-ID: <1563982623.2914.16.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/8] drm/etnaviv: share a single cmdbuf suballoc
 region across all GPUs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Wed, 24 Jul 2019 17:37:03 +0200
In-Reply-To: <20190705171727.27501-3-l.stach@pengutronix.de>
References: <20190705171727.27501-1-l.stach@pengutronix.de>
 <20190705171727.27501-3-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA3LTA1IGF0IDE5OjE3ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBU
aGVyZSBpcyBubyBuZWVkIGZvciBlYWNoIEdQVSB0byBoYXZlIGl0J3Mgb3duIGNtZGJ1ZiBzdWJh
bGxvY2F0aW9uCj4gcmVnaW9uLiBPbmx5IGFsbG9jYXRlIGEgc2luZ2xlIG9uZSBmb3IgdGhlIHRo
ZSBldG5hdml2IHZpcnR1YWwgZGV2aWNlCj4gYW5kIHNoYXJlIGl0IGFjcm9zcyBhbGwgR1BVcy4K
PiAKPiBBcyB0aGUgc3ViYWxsb2Mgc3BhY2UgaXMgbm93IHBvdGVudGlhbGx5IHNoYXJlZCBieSBt
b3JlIGhhcmR3YXJlIGpvYnMKPiBydW5uaW5nIGluIHBhcmFsbGVsLCBkb3VibGUgaXRzIHNpemUg
dG8gNTEyS0IgdG8gYXZvaWQgY29udGVudGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBT
dGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVs
IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0
bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
