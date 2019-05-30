Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3943430BE6
	for <lists+etnaviv@lfdr.de>; Fri, 31 May 2019 11:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13F889233;
	Fri, 31 May 2019 09:44:06 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9559389346;
 Thu, 30 May 2019 06:26:57 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hWEWS-0006ir-UP; Thu, 30 May 2019 06:26:44 +0000
Date: Wed, 29 May 2019 23:26:44 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 1/2] mm: cma: export functions to get CMA base and size
Message-ID: <20190530062644.GA20133@infradead.org>
References: <20190529104312.27835-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529104312.27835-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Fri, 31 May 2019 09:44:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nIiCMY3JsQadXOBewqvsYP0/w5h7JL3rPxkhn+Tzu2Q=; b=hC2RgOug0p2SCJXT6WId54KYZ
 v+nobRuR3mH8lkQdzbw3GRGrGXL36RcXf+S1IvOq3wwzeEcXxmTx0/5VfoaIk5wrOE9C0ueIe4pBB
 FUHhDeeqJ0gc26hf9TnS8BTkU0bkb1Al35adx+XB2zakVTJRbVXBNBjXezVRhvyl8Ua+k5Q6sw+Zd
 krQ0bkX4dB2nu+L2GxdJUMDNOIpY9gibsE2B7/kY12MlJd85SaR3S5PeWpZGI1lVbqLLg8V9w2xN6
 zdIxrfTikliPWXb1R8Ok2wTLVU0UACNGmhYIMMEtvFHagDEhBJJoYcpDvHZsulSmwMQWdQU5b8PCM
 n0tHsmioA==;
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
Cc: etnaviv@lists.freedesktop.org,
 =?utf-8?Q?Micha=C5=82?= Nazarewicz <mina86@mina86.com>,
 patchwork-lst@pengutronix.de, linux-mm@kvack.org, Yue Hu <huyue2@yulong.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTI6NDM6MTFQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gTWFrZSB0aGVtIHVzYWJsZSBpbiBtb2R1bGVzLiBTb21lIGRyaXZlcnMgd2FudCB0byBr
bm93IHdoZXJlIHRoZWlyCj4gZGV2aWNlIENNQSBhcmVhIGlzIGxvY2F0ZWQgdG8gbWFrZSBiZXR0
ZXIgZGVjaXNpb25zIGFib3V0IHRoZSBETUEKPiBwcm9ncmFtbWluZy4KCk5BSy4gIFRoaXMgaXMg
dmVyeSBtdWNoIGEgbGF5ZXJpbmcgdmlvbGF0aW9uLiAgQXQgdmVyeSBsZWFzdCB5b3UnZApuZWVk
IHRvIHdpcmUgdGhpcyB1cCB0aHJvdWdoIHRoZSBETUEgQVBJIGFuZCBkZWFsIHdpdGggZG1hX2Fk
ZHJfdAphZGRyZXNzZXMgaW5zdGVhZCBvZiBwaHlzaWNhbCBhZGRyZXNzZXMsIHdoaWNoIGFyZSBv
cGFxdWUgdG8gRE1BCnVzaW5nIGRyaXZlcnMuICBCdXQgZXZlbiBmb3IgdGhhdCB3ZSdkIG5lZWQg
YSByZWFsbHkgZ29vZCByYXRpb25hbGUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZXRuYXZpdg==
