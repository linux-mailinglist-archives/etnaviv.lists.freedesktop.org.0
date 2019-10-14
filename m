Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF98D9536
	for <lists+etnaviv@lfdr.de>; Wed, 16 Oct 2019 17:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2486E99C;
	Wed, 16 Oct 2019 15:15:00 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF596E343
 for <etnaviv@lists.freedesktop.org>; Mon, 14 Oct 2019 22:44:25 +0000 (UTC)
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74E6F21835;
 Mon, 14 Oct 2019 22:44:24 +0000 (UTC)
Date: Mon, 14 Oct 2019 15:44:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] mm: memblock: do not enforce current limit for
 memblock_phys* family
Message-Id: <20191014154423.a472315834ce6a730ccbaf3f@linux-foundation.org>
In-Reply-To: <1570915861-17633-1-git-send-email-rppt@kernel.org>
References: <1570915861-17633-1-git-send-email-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Oct 2019 15:15:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571093064;
 bh=bR1w6UoSnX74UluDNWX1wTa+jYiev1lVKk27mIadYqc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VX64SZlgGVvm8FdahZlm6oDXPO4gIeEsrTnQbPR3Va+ueoUcERwlEsVXpOMlAnrdy
 a9qqXuO57/DkfQ3i24e7ANndxhlSTJQfn+0uTQD2YJnB07dpkZUaj401Z9AWJdNQyN
 CmskUWlecnXShZvGIg08xYVXTDI9siwDaYwyu5dc=
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

T24gU3VuLCAxMyBPY3QgMjAxOSAwMDozMTowMSArMDMwMCBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBVbnRpbCBjb21taXQgOTJkMTJmOTU0NGI3ICgibWVtYmxvY2s6
IHJlZmFjdG9yIGludGVybmFsIGFsbG9jYXRpb24KPiBmdW5jdGlvbnMiKSB0aGUgbWF4aW1hbCBh
ZGRyZXNzIGZvciBtZW1ibG9jayBhbGxvY2F0aW9ucyB3YXMgZm9yY2VkIHRvCj4gbWVtYmxvY2su
Y3VycmVudF9saW1pdCBvbmx5IGZvciB0aGUgYWxsb2NhdGlvbiBmdW5jdGlvbnMgcmV0dXJuaW5n
IHZpcnR1YWwKPiBhZGRyZXNzLiBUaGUgY2hhbmdlcyBpbnRyb2R1Y2VkIGJ5IHRoYXQgY29tbWl0
IG1vdmVkIHRoZSBsaW1pdCBlbmZvcmNlbWVudAo+IGludG8gdGhlIGFsbG9jYXRpb24gY29yZSBh
bmQgYXMgYSByZXN1bHQgdGhlIGFsbG9jYXRpb24gZnVuY3Rpb25zIHJldHVybmluZwo+IHBoeXNp
Y2FsIGFkZHJlc3MgYWxzbyBzdGFydGVkIHRvIGxpbWl0IGFsbG9jYXRpb25zIHRvCj4gbWVtYmxv
Y2suY3VycmVudF9saW1pdC4KPiAKPiBUaGlzIGNhdXNlZCBicmVha2FnZSBvZiBldG5hdml2IEdQ
VSBkcml2ZXI6Cj4gCj4gLi4uCj4KClNvIEknbGwgYWRkIGEgY2M6c3RhYmxlLCB5ZXM/Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGlu
ZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
