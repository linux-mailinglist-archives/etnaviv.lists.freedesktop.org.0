Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA51B2902E4
	for <lists+etnaviv@lfdr.de>; Fri, 16 Oct 2020 12:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9808389F1B;
	Fri, 16 Oct 2020 10:39:37 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E1E89EFF;
 Fri, 16 Oct 2020 10:39:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C254AB5C;
 Fri, 16 Oct 2020 10:39:34 +0000 (UTC)
Date: Fri, 16 Oct 2020 12:39:31 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 09/10] dma-buf-map: Add memcpy and pointer-increment
 interfaces
Message-ID: <20201016123931.10dd3930@linux-uq9g>
In-Reply-To: <20201016100854.GA1042954@ravnborg.org>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-10-tzimmermann@suse.de>
 <20201016100854.GA1042954@ravnborg.org>
Organization: SUSE Software Solutions Germany GmbH
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 melissa.srw@gmail.com, ray.huang@amd.com, kraxel@redhat.com, yuq825@gmail.com,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, lima@lists.freedesktop.org,
 oleksandr_andrushchenko@epam.com, krzk@kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, luben.tuikov@amd.com,
 alyssa.rosenzweig@collabora.com, linux+etnaviv@armlinux.org.uk,
 spice-devel@lists.freedesktop.org, bskeggs@redhat.com,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 hdegoede@redhat.com, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run, apaneers@amd.com,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 tomeu.vizoso@collabora.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 kyungmin.park@samsung.com, miaoqinglang@huawei.com, kgene@kernel.org,
 alexander.deucher@amd.com, linux-media@vger.kernel.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgU2FtCgpPbiBGcmksIDE2IE9jdCAyMDIwIDEyOjA4OjU0ICswMjAwIFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4gd3JvdGU6Cgo+IEhpIFRob21hcy4KPiAKPiBPbiBUaHUsIE9jdCAx
NSwgMjAyMCBhdCAwMjozODowNVBNICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiA+
IFRvIGRvIGZyYW1lYnVmZmVyIHVwZGF0ZXMsIG9uZSBuZWVkcyBtZW1jcHkgZnJvbSBzeXN0ZW0g
bWVtb3J5IGFuZCBhCj4gPiBwb2ludGVyLWluY3JlbWVudCBmdW5jdGlvbi4gQWRkIGJvdGggaW50
ZXJmYWNlcyB3aXRoIGRvY3VtZW50YXRpb24uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IAo+IExvb2tzIGdvb2QuCj4gUmV2
aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KClRoYW5rcy4gSWYgeW91
IGhhdmUgdGhlIHRpbWUsIG1heSBJIGFzayB5b3UgdG8gdGVzdCB0aGlzIHBhdGNoc2V0IG9uIHRo
ZQpib2Nocy9zcGFyYzY0IHN5c3RlbSB0aGF0IGZhaWxlZCB3aXRoIHRoZSBvcmlnaW5hbCBjb2Rl
PwoKQmVzdCByZWdhcmRzClRob21hcwoKPiAKPiA+IC0tLQo+ID4gIGluY2x1ZGUvbGludXgvZG1h
LWJ1Zi1tYXAuaCB8IDcyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmggYi9pbmNsdWRlL2xp
bnV4L2RtYS1idWYtbWFwLmgKPiA+IGluZGV4IDJlOGJiZWNiNTA5MS4uNmNhMGYzMDRkZGEyIDEw
MDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtYnVmLW1hcC5oCj4gPiArKysgYi9pbmNs
dWRlL2xpbnV4L2RtYS1idWYtbWFwLmgKPiA+IEBAIC0zMiw2ICszMiwxNCBAQAo+ID4gICAqIGFj
Y2Vzc2luZyB0aGUgYnVmZmVyLiBVc2UgdGhlIHJldHVybmVkIGluc3RhbmNlIGFuZCB0aGUgaGVs
cGVyCj4gPiBmdW5jdGlvbnMKPiA+ICAgKiB0byBhY2Nlc3MgdGhlIGJ1ZmZlcidzIG1lbW9yeSBp
biB0aGUgY29ycmVjdCB3YXkuCj4gPiAgICoKPiA+ICsgKiBUaGUgdHlwZSA6Yzp0eXBlOmBzdHJ1
Y3QgZG1hX2J1Zl9tYXAgPGRtYV9idWZfbWFwPmAgYW5kIGl0cyBoZWxwZXJzCj4gPiBhcmUKPiA+
ICsgKiBhY3R1YWxseSBpbmRlcGVuZGVudCBmcm9tIHRoZSBkbWEtYnVmIGluZnJhc3RydWN0dXJl
LiBXaGVuIHNoYXJpbmcKPiA+IGJ1ZmZlcnMKPiA+ICsgKiBhbW9uZyBkZXZpY2VzLCBkcml2ZXJz
IGhhdmUgdG8ga25vdyB0aGUgbG9jYXRpb24gb2YgdGhlIG1lbW9yeSB0bwo+ID4gYWNjZXNzCj4g
PiArICogdGhlIGJ1ZmZlcnMgaW4gYSBzYWZlIHdheS4gOmM6dHlwZTpgc3RydWN0IGRtYV9idWZf
bWFwIDxkbWFfYnVmX21hcD5gCj4gPiArICogc29sdmVzIHRoaXMgcHJvYmxlbSBmb3IgZG1hLWJ1
ZiBhbmQgaXRzIHVzZXJzLiBJZiBvdGhlciBkcml2ZXJzIG9yCj4gPiArICogc3ViLXN5c3RlbXMg
cmVxdWlyZSBzaW1pbGFyIGZ1bmN0aW9uYWxpdHksIHRoZSB0eXBlIGNvdWxkIGJlCj4gPiBnZW5l
cmFsaXplZAo+ID4gKyAqIGFuZCBtb3ZlZCB0byBhIG1vcmUgcHJvbWluZW50IGhlYWRlciBmaWxl
Lgo+ID4gKyAqCj4gPiAgICogT3Blbi1jb2RpbmcgYWNjZXNzIHRvIDpjOnR5cGU6YHN0cnVjdCBk
bWFfYnVmX21hcCA8ZG1hX2J1Zl9tYXA+YCBpcwo+ID4gICAqIGNvbnNpZGVyZWQgYmFkIHN0eWxl
LiBSYXRoZXIgdGhlbiBhY2Nlc3NpbmcgaXRzIGZpZWxkcyBkaXJlY3RseSwgdXNlCj4gPiBvbmUK
PiA+ICAgKiBvZiB0aGUgcHJvdmlkZWQgaGVscGVyIGZ1bmN0aW9ucywgb3IgaW1wbGVtZW50IHlv
dXIgb3duLiBGb3IgZXhhbXBsZSwKPiA+IEBAIC01MSw2ICs1OSwxNCBAQAo+ID4gICAqCj4gPiAg
ICoJZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyX2lvbWVtKCZtYXAuIDB4ZGVhZGJlYWYpOwo+ID4gICAq
Cj4gPiArICogSW5zdGFuY2VzIG9mIHN0cnVjdCBkbWFfYnVmX21hcCBkbyBub3QgaGF2ZSB0byBi
ZSBjbGVhbmVkIHVwLCBidXQKPiA+ICsgKiBjYW4gYmUgY2xlYXJlZCB0byBOVUxMIHdpdGggZG1h
X2J1Zl9tYXBfY2xlYXIoKS4gQ2xlYXJlZCBtYXBwaW5ncwo+ID4gKyAqIGFsd2F5cyByZWZlciB0
byBzeXN0ZW0gbWVtb3J5Lgo+ID4gKyAqCj4gPiArICogLi4gY29kZS1ibG9jazo6IGMKPiA+ICsg
Kgo+ID4gKyAqCWRtYV9idWZfbWFwX2NsZWFyKCZtYXApOwo+ID4gKyAqCj4gPiAgICogVGVzdCBp
ZiBhIG1hcHBpbmcgaXMgdmFsaWQgd2l0aCBlaXRoZXIgZG1hX2J1Zl9tYXBfaXNfc2V0KCkgb3IK
PiA+ICAgKiBkbWFfYnVmX21hcF9pc19udWxsKCkuCj4gPiAgICoKPiA+IEBAIC03MywxNyArODks
MTkgQEAKPiA+ICAgKglpZiAoZG1hX2J1Zl9tYXBfaXNfZXF1YWwoJnN5c19tYXAsICZpb19tYXAp
KQo+ID4gICAqCQkvLyBhbHdheXMgZmFsc2UKPiA+ICAgKgo+ID4gLSAqIEluc3RhbmNlcyBvZiBz
dHJ1Y3QgZG1hX2J1Zl9tYXAgZG8gbm90IGhhdmUgdG8gYmUgY2xlYW5lZCB1cCwgYnV0Cj4gPiAt
ICogY2FuIGJlIGNsZWFyZWQgdG8gTlVMTCB3aXRoIGRtYV9idWZfbWFwX2NsZWFyKCkuIENsZWFy
ZWQgbWFwcGluZ3MKPiA+IC0gKiBhbHdheXMgcmVmZXIgdG8gc3lzdGVtIG1lbW9yeS4KPiA+ICsg
KiBBIHNldCB1cCBpbnN0YW5jZSBvZiBzdHJ1Y3QgZG1hX2J1Zl9tYXAgY2FuIGJlIHVzZWQgdG8g
YWNjZXNzIG9yCj4gPiBtYW5pcHVsYXRlCj4gPiArICogdGhlIGJ1ZmZlciBtZW1vcnkuIERlcGVu
ZGluZyBvbiB0aGUgbG9jYXRpb24gb2YgdGhlIG1lbW9yeSwgdGhlCj4gPiBwcm92aWRlZAo+ID4g
KyAqIGhlbHBlcnMgd2lsbCBwaWNrIHRoZSBjb3JyZWN0IG9wZXJhdGlvbnMuIERhdGEgY2FuIGJl
IGNvcGllZCBpbnRvIHRoZQo+ID4gbWVtb3J5Cj4gPiArICogd2l0aCBkbWFfYnVmX21hcF9tZW1j
cHlfdG8oKS4gVGhlIGFkZHJlc3MgY2FuIGJlIG1hbmlwdWxhdGVkIHdpdGgKPiA+ICsgKiBkbWFf
YnVmX21hcF9pbmNyKCkuCj4gPiAgICoKPiA+IC0gKiBUaGUgdHlwZSA6Yzp0eXBlOmBzdHJ1Y3Qg
ZG1hX2J1Zl9tYXAgPGRtYV9idWZfbWFwPmAgYW5kIGl0cyBoZWxwZXJzCj4gPiBhcmUKPiA+IC0g
KiBhY3R1YWxseSBpbmRlcGVuZGVudCBmcm9tIHRoZSBkbWEtYnVmIGluZnJhc3RydWN0dXJlLiBX
aGVuIHNoYXJpbmcKPiA+IGJ1ZmZlcnMKPiA+IC0gKiBhbW9uZyBkZXZpY2VzLCBkcml2ZXJzIGhh
dmUgdG8ga25vdyB0aGUgbG9jYXRpb24gb2YgdGhlIG1lbW9yeSB0bwo+ID4gYWNjZXNzCj4gPiAt
ICogdGhlIGJ1ZmZlcnMgaW4gYSBzYWZlIHdheS4gOmM6dHlwZTpgc3RydWN0IGRtYV9idWZfbWFw
IDxkbWFfYnVmX21hcD5gCj4gPiAtICogc29sdmVzIHRoaXMgcHJvYmxlbSBmb3IgZG1hLWJ1ZiBh
bmQgaXRzIHVzZXJzLiBJZiBvdGhlciBkcml2ZXJzIG9yCj4gPiAtICogc3ViLXN5c3RlbXMgcmVx
dWlyZSBzaW1pbGFyIGZ1bmN0aW9uYWxpdHksIHRoZSB0eXBlIGNvdWxkIGJlCj4gPiBnZW5lcmFs
aXplZAo+ID4gLSAqIGFuZCBtb3ZlZCB0byBhIG1vcmUgcHJvbWluZW50IGhlYWRlciBmaWxlLgo+
ID4gKyAqIC4uIGNvZGUtYmxvY2s6OiBjCj4gPiArICoKPiA+ICsgKgljb25zdCB2b2lkICpzcmMg
PSAuLi47IC8vIHNvdXJjZSBidWZmZXIKPiA+ICsgKglzaXplX3QgbGVuID0gLi4uOyAvLyBsZW5n
dGggb2Ygc3JjCj4gPiArICoKPiA+ICsgKglkbWFfYnVmX21hcF9tZW1jcHlfdG8oJm1hcCwgc3Jj
LCBsZW4pOwo+ID4gKyAqCWRtYV9idWZfbWFwX2luY3IoJm1hcCwgbGVuKTsgLy8gZ28gdG8gZmly
c3QgYnl0ZSBhZnRlciB0aGUKPiA+IG1lbWNweSAqLwo+ID4gIAo+ID4gIC8qKgo+ID4gQEAgLTIx
MCw0ICsyMjgsMzggQEAgc3RhdGljIGlubGluZSB2b2lkIGRtYV9idWZfbWFwX2NsZWFyKHN0cnVj
dAo+ID4gZG1hX2J1Zl9tYXAgKm1hcCkgfQo+ID4gIH0KPiA+ICAKPiA+ICsvKioKPiA+ICsgKiBk
bWFfYnVmX21hcF9tZW1jcHlfdG8gLSBNZW1jcHkgaW50byBkbWEtYnVmIG1hcHBpbmcKPiA+ICsg
KiBAZHN0OglUaGUgZG1hLWJ1ZiBtYXBwaW5nIHN0cnVjdHVyZQo+ID4gKyAqIEBzcmM6CVRoZSBz
b3VyY2UgYnVmZmVyCj4gPiArICogQGxlbjoJVGhlIG51bWJlciBvZiBieXRlIGluIHNyYwo+ID4g
KyAqCj4gPiArICogQ29waWVzIGRhdGEgaW50byBhIGRtYS1idWYgbWFwcGluZy4gVGhlIHNvdXJj
ZSBidWZmZXIgaXMgaW4gc3lzdGVtCj4gPiArICogbWVtb3J5LiBEZXBlbmRpbmcgb24gdGhlIGJ1
ZmZlcidzIGxvY2F0aW9uLCB0aGUgaGVscGVyIHBpY2tzIHRoZQo+ID4gY29ycmVjdAo+ID4gKyAq
IG1ldGhvZCBvZiBhY2Nlc3NpbmcgdGhlIG1lbW9yeS4KPiA+ICsgKi8KPiA+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgZG1hX2J1Zl9tYXBfbWVtY3B5X3RvKHN0cnVjdCBkbWFfYnVmX21hcCAqZHN0LCBj
b25zdAo+ID4gdm9pZCAqc3JjLCBzaXplX3QgbGVuKSArewo+ID4gKwlpZiAoZHN0LT5pc19pb21l
bSkKPiA+ICsJCW1lbWNweV90b2lvKGRzdC0+dmFkZHJfaW9tZW0sIHNyYywgbGVuKTsKPiA+ICsJ
ZWxzZQo+ID4gKwkJbWVtY3B5KGRzdC0+dmFkZHIsIHNyYywgbGVuKTsKPiA+ICt9Cj4gPiArCj4g
PiArLyoqCj4gPiArICogZG1hX2J1Zl9tYXBfaW5jciAtIEluY3JlbWVudHMgdGhlIGFkZHJlc3Mg
c3RvcmVkIGluIGEgZG1hLWJ1ZiBtYXBwaW5nCj4gPiArICogQG1hcDoJVGhlIGRtYS1idWYgbWFw
cGluZyBzdHJ1Y3R1cmUKPiA+ICsgKiBAaW5jcjoJVGhlIG51bWJlciBvZiBieXRlcyB0byBpbmNy
ZW1lbnQKPiA+ICsgKgo+ID4gKyAqIEluY3JlbWVudHMgdGhlIGFkZHJlc3Mgc3RvcmVkIGluIGEg
ZG1hLWJ1ZiBtYXBwaW5nLiBEZXBlbmRpbmcgb24gdGhlCj4gPiArICogYnVmZmVyJ3MgbG9jYXRp
b24sIHRoZSBjb3JyZWN0IHZhbHVlIHdpbGwgYmUgdXBkYXRlZC4KPiA+ICsgKi8KPiA+ICtzdGF0
aWMgaW5saW5lIHZvaWQgZG1hX2J1Zl9tYXBfaW5jcihzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCwg
c2l6ZV90IGluY3IpCj4gPiArewo+ID4gKwlpZiAobWFwLT5pc19pb21lbSkKPiA+ICsJCW1hcC0+
dmFkZHJfaW9tZW0gKz0gaW5jcjsKPiA+ICsJZWxzZQo+ID4gKwkJbWFwLT52YWRkciArPSBpbmNy
Owo+ID4gK30KPiA+ICsKPiA+ICAjZW5kaWYgLyogX19ETUFfQlVGX01BUF9IX18gKi8KPiA+IC0t
IAo+ID4gMi4yOC4wCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCgoKCi0tIApUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQpHZXNjaMOk
ZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZXRuYXZpdgo=
