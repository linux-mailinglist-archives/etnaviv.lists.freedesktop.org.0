Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76D359ECA
	for <lists+etnaviv@lfdr.de>; Fri,  9 Apr 2021 14:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D3B6EC17;
	Fri,  9 Apr 2021 12:33:21 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A956EC17
 for <etnaviv@lists.freedesktop.org>; Fri,  9 Apr 2021 12:33:20 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lUqHd-00037W-3M; Fri, 09 Apr 2021 14:30:45 +0200
Message-ID: <18d42d56167f0e2af6d0edaf596b20fcd778b96c.camel@pengutronix.de>
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
From: Lucas Stach <l.stach@pengutronix.de>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Date: Fri, 09 Apr 2021 14:30:34 +0200
In-Reply-To: <20210409112035.27221-1-david@redhat.com>
References: <20210409112035.27221-1-david@redhat.com>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
Cc: linux-fbdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Eric Anholt <eric@anholt.net>, Suman Anna <s-anna@ti.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 etnaviv@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Peter Collingbourne <pcc@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 Andrew Jeffery <andrew@aj.id.au>, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgZGVtIDA5LjA0LjIwMjEgdW0gMTM6MjAgKzAyMDAgc2NocmllYiBEYXZpZCBI
aWxkZW5icmFuZDoKPiBSYW5kb20gZHJpdmVycyBzaG91bGQgbm90IG92ZXJyaWRlIGEgdXNlciBj
b25maWd1cmF0aW9uIG9mIGNvcmUga25vYnMKPiAoZS5nLiwgQ09ORklHX0RNQV9DTUE9bikuIEFw
cGxpY2FibGUgZHJpdmVycyB3b3VsZCBsaWtlIHRvIHVzZSBETUFfQ01BLAo+IHdoaWNoIGRlcGVu
ZHMgb24gQ01BLCBpZiBwb3NzaWJsZTsgaG93ZXZlciwgdGhlc2UgZHJpdmVycyBhbHNvIGhhdmUg
dG8KPiB0b2xlcmF0ZSBpZiBETUFfQ01BIGlzIG5vdCBhdmFpbGFibGUvZnVuY3Rpb25pbmcsIGZv
ciBleGFtcGxlLCBpZiBubyBDTUEKPiBhcmVhIGZvciBETUFfQ01BIHVzZSBoYXMgYmVlbiBzZXR1
cCB2aWEgImNtYT1YIi4gSW4gdGhlIHdvcnN0IGNhc2UsIHRoZQo+IGRyaXZlciBjYW5ub3QgZG8g
aXQncyBqb2IgcHJvcGVybHkgaW4gc29tZSBjb25maWd1cmF0aW9ucy4KPiAKPiBGb3IgZXhhbXBs
ZSwgY29tbWl0IDYzZjU2Nzc1NDRiMyAoImRybS9ldG5hdml2OiBzZWxlY3QgQ01BIGFuZCBETUFf
Q01BIGlmCj4gYXZhaWxhYmxlIikgZG9jdW1lbnRzCj4gCVdoaWxlIHRoaXMgaXMgbm8gYnVpbGQg
ZGVwZW5kZW5jeSwgZXRuYXZpdiB3aWxsIG9ubHkgd29yayBjb3JyZWN0bHkKPiAJb24gbW9zdCBz
eXN0ZW1zIGlmIENNQSBhbmQgRE1BX0NNQSBhcmUgZW5hYmxlZC4gU2VsZWN0IGJvdGggb3B0aW9u
cwo+IAlpZiBhdmFpbGFibGUgdG8gYXZvaWQgdXNlcnMgZW5kaW5nIHVwIHdpdGggYSBub24td29y
a2luZyBHUFUgZHVlIHRvCj4gCWEgbGFja2luZyBrZXJuZWwgY29uZmlnLgo+IFNvIGV0bmF2aXYg
cmVhbGx5IHdhbnRzIHRvIGhhdmUgRE1BX0NNQSwgaG93ZXZlciwgY2FuIGRlYWwgd2l0aCBzb21l
IGNhc2VzCj4gd2hlcmUgaXQgaXMgbm90IGF2YWlsYWJsZS4KPiAKPiBMZXQncyBpbnRyb2R1Y2Ug
V0FOVF9ETUFfQ01BIGFuZCB1c2UgaXQgaW4gbW9zdCBjYXNlcyB3aGVyZSBkcml2ZXJzCj4gc2Vs
ZWN0IENNQS9ETUFfQ01BLCBvciBkZXBlbmQgb24gRE1BX0NNQSAoaW4gYSB3cm9uZyB3YXkgdmlh
IENNQSBiZWNhdXNlCj4gb2YgcmVjdXJzaXZlIGRlcGVuZGVuY3kgaXNzdWVzKS4KPiAKPiBXZSds
bCBhc3N1bWUgdGhhdCBhbnkgZHJpdmVyIHRoYXQgc2VsZWN0cyBEUk1fR0VNX0NNQV9IRUxQRVIg
b3IKPiBEUk1fS01TX0NNQV9IRUxQRVIgd291bGQgbGlrZSB0byB1c2UgRE1BX0NNQSBpZiBwb3Nz
aWJsZS4KPiAKPiBXaXRoIHRoaXMgY2hhbmdlLCBkaXN0cmlidXRpb25zIGNhbiBkaXNhYmxlIENP
TkZJR19DTUEgb3IKPiBDT05GSUdfRE1BX0NNQSwgd2l0aG91dCBpdCBzaWxlbnRseSBnZXR0aW5n
IGVuYWJsZWQgYWdhaW4gYnkgcmFuZG9tCj4gZHJpdmVycy4gQWxzbywgd2UnbGwgbm93IGF1dG9t
YXRpY2FsbHkgdHJ5IHRvIGVuYWJsZWQgYm90aCwgQ09ORklHX0NNQQo+IGFuZCBDT05GSUdfRE1B
X0NNQSBpZiB0aGV5IGFyZSB1bnNwZWNpZmllZCBhbmQgYW55IGRyaXZlciBpcyBhcm91bmQgdGhh
dAo+IHNlbGVjdHMgV0FOVF9ETUFfQ01BIC0tIGFsc28gaW1wbGljaXRseSB2aWEgRFJNX0dFTV9D
TUFfSEVMUEVSIG9yCj4gRFJNX0tNU19DTUFfSEVMUEVSLgo+IAo+IEZvciBleGFtcGxlLCBpZiBh
bnkgZHJpdmVyIHNlbGVjdHMgV0FOVF9ETUFfQ01BIGFuZCB3ZSBkbyBhCj4gIm1ha2Ugb2xkZGVm
Y29uZmlnIjoKPiAKPiAxLiBXaXRoICIjIENPTkZJR19DTUEgaXMgbm90IHNldCIgYW5kIG5vIHNw
ZWNpZmljYXRpb24gb2YKPiDCoMKgwqAiQ09ORklHX0RNQV9DTUEiCj4gCj4gLT4gQ09ORklHX0RN
QV9DTUEgd29uJ3QgYmUgcGFydCBvZiAuY29uZmlnCj4gCj4gMi4gV2l0aCBubyBzcGVjaWZpY2F0
aW9uIG9mIENPTkZJR19DTUEgb3IgQ09ORklHX0RNQV9DTUEKPiAKPiBDb250aWd1b3VzIE1lbW9y
eSBBbGxvY2F0b3IgKENNQSkgW1kvbi8/XSAoTkVXKQo+IERNQSBDb250aWd1b3VzIE1lbW9yeSBB
bGxvY2F0b3IgKERNQV9DTUEpIFtZL24vP10gKE5FVykKPiAKPiAzLiBXaXRoICIjIENPTkZJR19D
TUEgaXMgbm90IHNldCIgYW5kICIjIENPTkZJR19ETUFfQ01BIGlzIG5vdCBzZXQiCj4gCj4gLT4g
Q09ORklHX0RNQV9DTUEgd2lsbCBiZSByZW1vdmVkIGZyb20gLmNvbmZpZwo+IAo+IE5vdGU6IGRy
aXZlcnMvcmVtb3RlcHJvYyBzZWVtcyB0byBiZSBzcGVjaWFsOyBjb21taXQgYzUxZTg4MmNkNzEx
Cj4gKCJyZW1vdGVwcm9jL2RhdmluY2k6IFVwZGF0ZSBLY29uZmlnIHRvIGRlcGVuZCBvbiBETUFf
Q01BIikgZXhwbGFpbnMgdGhhdAo+IHRoZXJlIGlzIGEgcmVhbCBkZXBlbmRlbmN5IHRvIERNQV9D
TUEgZm9yIGl0IHRvIHdvcms7IGxlYXZlIHRoYXQgZGVwZW5kZW5jeQo+IGluIHBsYWNlIGFuZCBk
b24ndCBjb252ZXJ0IGl0IHRvIGEgc29mdCBkZXBlbmRlbmN5LgoKSG0sIHRvIG1lIHRoaXMgc291
bmRzIG11Y2ggbGlrZSB0aGUgcmVhc29uaW5nIGZvciB0aGUgZXRuYXZpdgpkZXBlbmRlbmN5LiBU
aGVyZSBpcyBubyBhY3R1YWwgYnVpbGQgZGVwZW5kZW5jeSwgYXMgdGhlIGFsbG9jYXRpb25zIGFy
ZQpkb25lIHRocm91Z2ggdGhlIERNQSBBUEksIGJ1dCBmb3IgdGhlIGFsbG9jYXRpb25zIHRvIHN1
Y2NlZWQgeW91IG1vc3QKbGlrZWx5IHdhbnQgQ01BIHRvIGJlIGVuYWJsZWQuIEJ1dCB0aGF0J3Mg
anVzdCBhbiBvYnNlcnZhdGlvbiBmcm9tIHRoZQpvdXRzaWRlLCBJIGhhdmUgbm8gcmVhbCBjbHVl
IGFib3V0IHRoZSByZW1vdGVwcm9jIGRyaXZlcnMuCgpBcyBmYXIgYXMgdGhlIGV0bmF2aXYgY2hh
bmdlcyBhcmUgY29uY2VybmVkOgpBY2tlZC1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0
cm9uaXguZGU+Cgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4g
Q2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiBDYzogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPiBDYzogQW5kcmV3IEpl
ZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4KPiBDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0
cm9uaXguZGU+Cj4gQ2M6IFJ1c3NlbGwgS2luZyA8bGludXgrZXRuYXZpdkBhcm1saW51eC5vcmcu
dWs+Cj4gQ2M6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+
Cj4gQ2M6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IENjOiBMaW51cyBX
YWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gQ2M6IENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPgo+IENjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3Vu
Zy5jb20+Cj4gQ2M6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4gQ2M6IEFu
ZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IE1pa2UgUmFwb3Bv
cnQgPHJwcHRAa2VybmVsLm9yZz4KPiBDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
PiBDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29t
Pgo+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IENjOiBNaWNoYWwgU2ltZWsg
PG1pY2hhbC5zaW1la0B4aWxpbnguY29tPgo+IENjOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJv
eUBrZXJuZWwub3JnPgo+IENjOiAiQWxleGFuZGVyIEEuIEtsaW1vdiIgPGdyYW5kbWFzdGVyQGFs
MmtsaW1vdi5kZT4KPiBDYzogUGV0ZXIgQ29sbGluZ2JvdXJuZSA8cGNjQGdvb2dsZS5jb20+Cj4g
Q2M6IFN1bWFuIEFubmEgPHMtYW5uYUB0aS5jb20+Cj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdn
QHppZXBlLmNhPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxp
bnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IENjOiBldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBs
aW51eC1taXBzQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5v
cmcKPiBDYzogaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKPiBTaWduZWQtb2ZmLWJ5
OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPiAtLS0KPiAKPiBMZXQncyBz
ZWUgaWYgdGhpcyBhcHByb2FjaCBpcyBiZXR0ZXIgZm9yIHNvZnQgZGVwZW5kZW5jaWVzIChhbmQg
aWYgd2UKPiBhY3R1YWxseSBoYXZlIHNvbWUgaGFyZCBkZXBlbmRlbmNpZXMgaW4gdGhlcmUpLiBU
aGlzIGlzIHRoZSBmb2xsb3ctdXAKPiBvZgo+IMKgwqBodHRwczovL2xrbWwua2VybmVsLm9yZy9y
LzIwMjEwNDA4MDkyMDExLjUyNzYzLTEtZGF2aWRAcmVkaGF0LmNvbQo+IMKgwqBodHRwczovL2xr
bWwua2VybmVsLm9yZy9yLzIwMjEwNDA4MTAwNTIzLjYzMzU2LTEtZGF2aWRAcmVkaGF0LmNvbQo+
IAo+IEkgd2FzIHdvbmRlcmluZyBpZiBpdCB3b3VsZCBtYWtlIHNlbnNlIGluIHNvbWUgZHJpdmVy
cyB0byB3YXJuIGlmIGVpdGhlcgo+IENPTkZJR19ETUFfQ01BIGlzIG5vdCBhdmFpbGFibGUgb3Ig
aWYgRFJNX0NNQSBoYXMgbm90IGJlZW4gY29uZmlndXJlZAo+IHByb3Blcmx5IC0ganVzdCB0byBn
aXZlIHBlb3BsZSBhIGhlYWRzIHVwIHRoYXQgc29tZXRoaW5nIG1pZ2h0IG1vcmUgbGlrZWx5Cj4g
Z28gd3Jvbmc7IHRoYXQgd291bGQsIGhvd2V2ZXIsIGJlIGZ1dHVyZSB3b3JrLgo+IAo+IHYyIC0+
IHYzOgo+IC0gRG9uJ3QgdXNlICJpbXBseSIgYnV0IGluc3RlYWQgdXNlIGEgbmV3IFdBTlRfRE1B
X0NNQSBhbmQgbWFrZSB0aGUgZGVmYXVsdAo+IMKgwqBvZiBDTUEgYW5kIERNQV9DTUEgZGVwZW5k
IG9uIGl0Lgo+IC0gQWxzbyBhZGp1c3QgaW5nZW5pYywgbWNkZSwgdHZlMjAwOyB0aGVzZSBzb3Vu
ZCBsaWtlIHNvZnQgZGVwZW5kZW5jaWVzIGFzCj4gwqDCoHdlbGwgKGFsdGhvdWdoIERNQV9DTUEg
aXMgcmVhbGx5IGRlc2lyZWQpCj4gCj4gdjEgLT4gdjI6Cj4gLSBGaXggRFJNX0NNQSAtPiBETUFf
Q01BCj4gCj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgIHwgMiArKwo+
IMKgZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9LY29uZmlnICB8IDIgLS0KPiDCoGRyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L0tjb25maWcgfCAzICstLQo+IMKgZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMv
S2NvbmZpZyB8IDEgLQo+IMKgZHJpdmVycy9ncHUvZHJtL21jZGUvS2NvbmZpZyAgICB8IDEgLQo+
IMKgZHJpdmVycy9ncHUvZHJtL3R2ZTIwMC9LY29uZmlnICB8IDEgLQo+IMKgZHJpdmVycy92aWRl
by9mYmRldi9LY29uZmlnICAgICB8IDIgKy0KPiDCoGtlcm5lbC9kbWEvS2NvbmZpZyAgICAgICAg
ICAgICAgfCA3ICsrKysrKysKPiDCoG1tL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAx
ICsKPiDCoDkgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9k
cm0vS2NvbmZpZwo+IGluZGV4IDg1Yjc5YTdmZWU2My4uNmY5OTg5YWRmYTkzIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL0tjb25m
aWcKPiBAQCAtMjAxLDEyICsyMDEsMTQgQEAgY29uZmlnIERSTV9UVE1fSEVMUEVSCj4gwqBjb25m
aWcgRFJNX0dFTV9DTUFfSEVMUEVSCj4gwqAJYm9vbAo+IMKgCWRlcGVuZHMgb24gRFJNCj4gKwlz
ZWxlY3QgV0FOVF9ETUFfQ01BCj4gwqAJaGVscAo+IMKgCSAgQ2hvb3NlIHRoaXMgaWYgeW91IG5l
ZWQgdGhlIEdFTSBDTUEgaGVscGVyIGZ1bmN0aW9ucwo+IMKgCj4gCj4gCj4gCj4gwqBjb25maWcg
RFJNX0tNU19DTUFfSEVMUEVSCj4gwqAJYm9vbAo+IMKgCWRlcGVuZHMgb24gRFJNCj4gKwlzZWxl
Y3QgV0FOVF9ETUFfQ01BCj4gwqAJc2VsZWN0IERSTV9HRU1fQ01BX0hFTFBFUgo+IMKgCWhlbHAK
PiDCoAkgIENob29zZSB0aGlzIGlmIHlvdSBuZWVkIHRoZSBLTVMgQ01BIGhlbHBlciBmdW5jdGlv
bnMKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9LY29uZmlnIGIvZHJpdmVy
cy9ncHUvZHJtL2FzcGVlZC9LY29uZmlnCj4gaW5kZXggNWU5NWJjZWE0M2U5Li5lNWZmMzNmODVm
MjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9LY29uZmlnCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9LY29uZmlnCj4gQEAgLTYsOCArNiw2IEBAIGNvbmZpZyBE
Uk1fQVNQRUVEX0dGWAo+IMKgCWRlcGVuZHMgb24gTU1VCj4gwqAJc2VsZWN0IERSTV9LTVNfSEVM
UEVSCj4gwqAJc2VsZWN0IERSTV9LTVNfQ01BX0hFTFBFUgo+IC0Jc2VsZWN0IERNQV9DTUEgaWYg
SEFWRV9ETUFfQ09OVElHVU9VUwo+IC0Jc2VsZWN0IENNQSBpZiBIQVZFX0RNQV9DT05USUdVT1VT
Cj4gwqAJc2VsZWN0IE1GRF9TWVNDT04KPiDCoAloZWxwCj4gwqAJICBDaG9zZSB0aGlzIG9wdGlv
biBpZiB5b3UgaGF2ZSBhbiBBU1BFRUQgQVNUMjUwMCBTT0MgRGlzcGxheQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvS2NvbmZpZwo+IGluZGV4IGZhYTdmYzY4YjAwOS4uYTNlNzY0OWI0NGE3IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZXRuYXZpdi9LY29uZmlnCj4gQEAgLTksOCArOSw3IEBAIGNvbmZpZyBEUk1fRVROQVZJVgo+
IMKgCXNlbGVjdCBUSEVSTUFMIGlmIERSTV9FVE5BVklWX1RIRVJNQUwKPiDCoAlzZWxlY3QgVE1Q
RlMKPiDCoAlzZWxlY3QgV0FOVF9ERVZfQ09SRURVTVAKPiAtCXNlbGVjdCBDTUEgaWYgSEFWRV9E
TUFfQ09OVElHVU9VUwo+IC0Jc2VsZWN0IERNQV9DTUEgaWYgSEFWRV9ETUFfQ09OVElHVU9VUwo+
ICsJc2VsZWN0IFdBTlRfRE1BX0NNQQo+IMKgCXNlbGVjdCBEUk1fU0NIRUQKPiDCoAloZWxwCj4g
wqAJICBEUk0gZHJpdmVyIGZvciBWaXZhbnRlIEdQVXMuCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pbmdlbmljL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9LY29uZmln
Cj4gaW5kZXggM2I1N2Y4YmUwMDdjLi4xNTZiMTFiN2JiYjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2luZ2VuaWMvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmlj
L0tjb25maWcKPiBAQCAtMiw3ICsyLDYgQEAgY29uZmlnIERSTV9JTkdFTklDCj4gwqAJdHJpc3Rh
dGUgIkRSTSBTdXBwb3J0IGZvciBJbmdlbmljIFNvQ3MiCj4gwqAJZGVwZW5kcyBvbiBNSVBTIHx8
IENPTVBJTEVfVEVTVAo+IMKgCWRlcGVuZHMgb24gRFJNCj4gLQlkZXBlbmRzIG9uIENNQQo+IMKg
CWRlcGVuZHMgb24gT0YKPiDCoAlkZXBlbmRzIG9uIENPTU1PTl9DTEsKPiDCoAlzZWxlY3QgRFJN
X0JSSURHRQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9LY29uZmlnIGIvZHJp
dmVycy9ncHUvZHJtL21jZGUvS2NvbmZpZwo+IGluZGV4IDcxYzY4OWI1NzNjOS4uMjE3ZDU0YzRi
YWJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL0tjb25maWcKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWNkZS9LY29uZmlnCj4gQEAgLTEsNyArMSw2IEBACj4gwqBjb25maWcg
RFJNX01DREUKPiDCoAl0cmlzdGF0ZSAiRFJNIFN1cHBvcnQgZm9yIFNULUVyaWNzc29uIE1DREUg
KE11bHRpY2hhbm5lbCBEaXNwbGF5IEVuZ2luZSkiCj4gwqAJZGVwZW5kcyBvbiBEUk0KPiAtCWRl
cGVuZHMgb24gQ01BCj4gwqAJZGVwZW5kcyBvbiBBUk0gfHwgQ09NUElMRV9URVNUCj4gwqAJZGVw
ZW5kcyBvbiBPRgo+IMKgCWRlcGVuZHMgb24gQ09NTU9OX0NMSwo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdHZlMjAwL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vdHZlMjAwL0tjb25m
aWcKPiBpbmRleCBlMmQxNjNjNzRlZDYuLmQwNGI3MzIyYzc3MCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdHZlMjAwL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHZlMjAw
L0tjb25maWcKPiBAQCAtMiw3ICsyLDYgQEAKPiDCoGNvbmZpZyBEUk1fVFZFMjAwCj4gwqAJdHJp
c3RhdGUgIkRSTSBTdXBwb3J0IGZvciBGYXJhZGF5IFRWIEVuY29kZXIgVFZFMjAwIgo+IMKgCWRl
cGVuZHMgb24gRFJNCj4gLQlkZXBlbmRzIG9uIENNQQo+IMKgCWRlcGVuZHMgb24gQVJNIHx8IENP
TVBJTEVfVEVTVAo+IMKgCWRlcGVuZHMgb24gT0YKPiDCoAlzZWxlY3QgRFJNX0JSSURHRQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L0tjb25maWcKPiBpbmRleCA0ZjAyZGI2NWRlZGUuLmU4YWNkNGY3N2Q0MSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L0tjb25maWcKPiBAQCAtMjE4Niw3ICsyMTg2LDcgQEAgY29uZmlnIEZCX0hZUEVSVgo+IMKg
CXNlbGVjdCBGQl9DRkJfQ09QWUFSRUEKPiDCoAlzZWxlY3QgRkJfQ0ZCX0lNQUdFQkxJVAo+IMKg
CXNlbGVjdCBGQl9ERUZFUlJFRF9JTwo+IC0Jc2VsZWN0IERNQV9DTUEgaWYgSEFWRV9ETUFfQ09O
VElHVU9VUyAmJiBDTUEKPiArCXNlbGVjdCBXQU5UX0RNQV9DTUEKPiDCoAloZWxwCj4gwqAJICBU
aGlzIGZyYW1lYnVmZmVyIGRyaXZlciBzdXBwb3J0cyBNaWNyb3NvZnQgSHlwZXItViBTeW50aGV0
aWMgVmlkZW8uCj4gwqAKPiAKPiAKPiAKPiBkaWZmIC0tZ2l0IGEva2VybmVsL2RtYS9LY29uZmln
IGIva2VybmVsL2RtYS9LY29uZmlnCj4gaW5kZXggNzdiNDA1NTA4NzQzLi45MjhmMTZkMjQ2MWQg
MTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RtYS9LY29uZmlnCj4gKysrIGIva2VybmVsL2RtYS9LY29u
ZmlnCj4gQEAgLTEwMyw4ICsxMDMsMTUgQEAgY29uZmlnIERNQV9ESVJFQ1RfUkVNQVAKPiDCoAlz
ZWxlY3QgRE1BX1JFTUFQCj4gwqAJc2VsZWN0IERNQV9DT0hFUkVOVF9QT09MCj4gwqAKPiAKPiAK
PiAKPiArY29uZmlnIFdBTlRfRE1BX0NNQQo+ICsJYm9vbAo+ICsJaGVscAo+ICsJICBEcml2ZXJz
IHNob3VsZCAic2VsZWN0IiB0aGlzIG9wdGlvbiBpZiB0aGV5IGRlc2lyZSB0byB1c2UgdGhlCj4g
KwkgIERNQV9DTUEgbWVjaGFuaXNtLgo+ICsKPiDCoGNvbmZpZyBETUFfQ01BCj4gwqAJYm9vbCAi
RE1BIENvbnRpZ3VvdXMgTWVtb3J5IEFsbG9jYXRvciIKPiArCWRlZmF1bHQgeSBpZiBXQU5UX0RN
QV9DTUEKPiDCoAlkZXBlbmRzIG9uIEhBVkVfRE1BX0NPTlRJR1VPVVMgJiYgQ01BCj4gwqAJaGVs
cAo+IMKgCSAgVGhpcyBlbmFibGVzIHRoZSBDb250aWd1b3VzIE1lbW9yeSBBbGxvY2F0b3Igd2hp
Y2ggYWxsb3dzIGRyaXZlcnMKPiBkaWZmIC0tZ2l0IGEvbW0vS2NvbmZpZyBiL21tL0tjb25maWcK
PiBpbmRleCAyNGMwNDViMjRiOTUuLjE2OTU5OGVlNTZiMSAxMDA2NDQKPiAtLS0gYS9tbS9LY29u
ZmlnCj4gKysrIGIvbW0vS2NvbmZpZwo+IEBAIC00ODUsNiArNDg1LDcgQEAgY29uZmlnIEZST05U
U1dBUAo+IMKgCj4gCj4gCj4gCj4gwqBjb25maWcgQ01BCj4gwqAJYm9vbCAiQ29udGlndW91cyBN
ZW1vcnkgQWxsb2NhdG9yIgo+ICsJZGVmYXVsdCB5IGlmIFdBTlRfRE1BX0NNQQo+IMKgCWRlcGVu
ZHMgb24gTU1VCj4gwqAJc2VsZWN0IE1JR1JBVElPTgo+IMKgCXNlbGVjdCBNRU1PUllfSVNPTEFU
SU9OCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRu
YXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2Cg==
