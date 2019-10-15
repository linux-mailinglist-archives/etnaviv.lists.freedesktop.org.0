Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A1D953A
	for <lists+etnaviv@lfdr.de>; Wed, 16 Oct 2019 17:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC33D6E9A1;
	Wed, 16 Oct 2019 15:15:01 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53A16E5F6
 for <etnaviv@lists.freedesktop.org>; Tue, 15 Oct 2019 06:42:14 +0000 (UTC)
Received: from [172.20.185.47] (unknown [151.9.251.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E23320872;
 Tue, 15 Oct 2019 06:42:13 +0000 (UTC)
Date: Tue, 15 Oct 2019 08:42:07 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <20191014154423.a472315834ce6a730ccbaf3f@linux-foundation.org>
References: <1570915861-17633-1-git-send-email-rppt@kernel.org>
 <20191014154423.a472315834ce6a730ccbaf3f@linux-foundation.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mm: memblock: do not enforce current limit for
 memblock_phys* family
To: Andrew Morton <akpm@linux-foundation.org>
From: Mike Rapoport <rppt@kernel.org>
Message-ID: <43610D35-58EE-4019-B979-EAE3F4781EAA@kernel.org>
X-Mailman-Approved-At: Wed, 16 Oct 2019 15:15:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571121734;
 bh=rysVRgS2FyWINWo6N494AjxosS0+rfoIKEY8cnAlqSA=;
 h=Date:In-Reply-To:References:Subject:To:CC:From:From;
 b=WJ1RiJWg0ldBHseqfrvp5PmB2jl/7wc3M+Lc/btmiZF+qOzXjamufdias7ll/sXEJ
 QwS1noye5k0R7HoaydsDEqHqK5e/mvsfAeXgrBzGgtAaYQ5tDA/4/k6x302+mFvcxj
 QnD2Xs8HFk6dR3yYBKakkri/5m/87RAUPZ70FxNQ=
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Fabio Estevam <festevam@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Adam Ford <aford173@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gT2N0b2JlciAxNSwgMjAxOSAxMjo0NDoyMyBBTSBHTVQrMDI6MDAsIEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+T24gU3VuLCAxMyBPY3QgMjAxOSAw
MDozMTowMSArMDMwMCBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+Cj53cm90ZToKPgo+
PiBVbnRpbCBjb21taXQgOTJkMTJmOTU0NGI3ICgibWVtYmxvY2s6IHJlZmFjdG9yIGludGVybmFs
IGFsbG9jYXRpb24KPj4gZnVuY3Rpb25zIikgdGhlIG1heGltYWwgYWRkcmVzcyBmb3IgbWVtYmxv
Y2sgYWxsb2NhdGlvbnMgd2FzIGZvcmNlZAo+dG8KPj4gbWVtYmxvY2suY3VycmVudF9saW1pdCBv
bmx5IGZvciB0aGUgYWxsb2NhdGlvbiBmdW5jdGlvbnMgcmV0dXJuaW5nCj52aXJ0dWFsCj4+IGFk
ZHJlc3MuIFRoZSBjaGFuZ2VzIGludHJvZHVjZWQgYnkgdGhhdCBjb21taXQgbW92ZWQgdGhlIGxp
bWl0Cj5lbmZvcmNlbWVudAo+PiBpbnRvIHRoZSBhbGxvY2F0aW9uIGNvcmUgYW5kIGFzIGEgcmVz
dWx0IHRoZSBhbGxvY2F0aW9uIGZ1bmN0aW9ucwo+cmV0dXJuaW5nCj4+IHBoeXNpY2FsIGFkZHJl
c3MgYWxzbyBzdGFydGVkIHRvIGxpbWl0IGFsbG9jYXRpb25zIHRvCj4+IG1lbWJsb2NrLmN1cnJl
bnRfbGltaXQuCj4+IAo+PiBUaGlzIGNhdXNlZCBicmVha2FnZSBvZiBldG5hdml2IEdQVSBkcml2
ZXI6Cj4+IAo+PiAuLi4KPj4KPgo+U28gSSdsbCBhZGQgYSBjYzpzdGFibGUsIHllcz8KClllYWgs
IHJpZ2h0LiBTb21laG93IEkndmUgbWlzc2VkIHRoYXQuLi4KCi0tIApTaW5jZXJlbHkgeW91cnMs
Ck1pa2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRu
YXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
