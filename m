Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A6A286142
	for <lists+etnaviv@lfdr.de>; Wed,  7 Oct 2020 16:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A372F6E8FA;
	Wed,  7 Oct 2020 14:31:09 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804476E8FA
 for <etnaviv@lists.freedesktop.org>; Wed,  7 Oct 2020 14:31:08 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id o20so672566ook.1
 for <etnaviv@lists.freedesktop.org>; Wed, 07 Oct 2020 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NbLfbOo6rBgplKLLXUM/j+UjD/0nZV6znJNM3tEznfE=;
 b=NTYqZ7f5B5Gq+gYWGOBHXox72i8QP8xJnVDXz/XMzy4PD5+aheXfQ9douo1x8qBJaA
 t3MCm6+mQ2l2Te5LxUMufA52jrfxXGUuS3Ub9jWGPX7BUN7lOtXCgszdLolU9WucZHoq
 TGkYA7/fPKQfpc9yG3h/xdIDNv02YJCEcWu2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NbLfbOo6rBgplKLLXUM/j+UjD/0nZV6znJNM3tEznfE=;
 b=BCksQcy8gEr7a+QMv5QP1I4BBUkbBAo/AUt4O3HqJjs3YEUfpsKc2aXLh7AEM6XpcI
 MstpRpHfHOEiovTFUyEJPzzG63dhqWemusHiDJQxo5WhbA4nJViuqecuSpNFsSS6fGYU
 hI0sVjFZanI2rs7iy60j+kBXys7+RQMkrcIHHCa0ULs8tfAtXqh3MoywUWD4UVHZfbZW
 6aUJSdHsz7pq+gFmddtbG4ZzdmvmdAtJiYMiU/4TP9Hg4xt8EwDueF5CwWz300J0RQOE
 xjKCN61N85a979xWTnCLhpnkoVDqgHPr0JYmverppGAuAltkgmG1SHrmgkeQxkxRKKup
 bBVg==
X-Gm-Message-State: AOAM533OFup0Bt3iUnjGZwpgL5rS2rB88Pi02fmz7L5/eryRzkkNt2RW
 RD9gFAkaK3le9Ztv+E46qTXqxguy2f4Qyf5CPDz6jg==
X-Google-Smtp-Source: ABdhPJzZpewR2804aqDvAhxBrbs0NiPUuiLxDsRE6uB5xKlkNmt5x5H5vW7ze9MuHc5XJfLaMcC98vFOmMc7laRKCrA=
X-Received: by 2002:a4a:e592:: with SMTP id o18mr2238606oov.28.1602081067392; 
 Wed, 07 Oct 2020 07:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
 <20200930094712.GW438822@phenom.ffwll.local>
 <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
 <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
 <20201002095830.GH438822@phenom.ffwll.local>
 <5bf40546-8da9-1649-22da-a982f1e8d9c3@suse.de>
 <CAKMK7uEu0vwiG9Uz0_Ysyus0ZAF-1HNxvPZjcG3xZS=gkKgJLw@mail.gmail.com>
 <26ac0446-9e16-1ca1-7407-3d0cd7125e0e@suse.de>
 <09d634d0-f20a-e9a9-d8d2-b50e8aaf156f@amd.com>
In-Reply-To: <09d634d0-f20a-e9a9-d8d2-b50e8aaf156f@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 7 Oct 2020 16:30:56 +0200
Message-ID: <CAKMK7uEPn=q1J50koveE+b49r=SE0eh5nTrxWOVRN2grdyNPTA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Qiang Yu <yuq825@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Steven Price <steven.price@arm.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Sean Paul <sean@poorly.run>, apaneers@amd.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Kukjin Kim <kgene@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgNywgMjAyMCBhdCAzOjI1IFBNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBBbSAwNy4xMC4yMCB1bSAxNToyMCBzY2hyaWVi
IFRob21hcyBaaW1tZXJtYW5uOgo+ID4gSGkKPiA+Cj4gPiBBbSAwNy4xMC4yMCB1bSAxNToxMCBz
Y2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPj4gT24gV2VkLCBPY3QgNywgMjAyMCBhdCAyOjU3IFBN
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToKPiA+Pj4gSGkK
PiA+Pj4KPiA+Pj4gQW0gMDIuMTAuMjAgdW0gMTE6NTggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+
ID4+Pj4gT24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDI6NTE6NDZQTSArMDIwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiA+Pj4+PiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBhdCAyOjM0IFBNIENocmlz
dGlhbiBLw7ZuaWcKPiA+Pj4+PiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiA+
Pj4+Pj4gQW0gMzAuMDkuMjAgdW0gMTE6NDcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+ID4+Pj4+
Pj4gT24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMTA6MzQ6MzFBTSArMDIwMCwgQ2hyaXN0aWFuIEvD
tm5pZyB3cm90ZToKPiA+Pj4+Pj4+PiBBbSAzMC4wOS4yMCB1bSAxMDoxOSBzY2hyaWViIFRob21h
cyBaaW1tZXJtYW5uOgo+ID4+Pj4+Pj4+PiBIaQo+ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+PiBBbSAz
MC4wOS4yMCB1bSAxMDowNSBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gPj4+Pj4+Pj4+PiBB
bSAyOS4wOS4yMCB1bSAxOTo0OSBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+ID4+Pj4+Pj4+
Pj4+IEhpIENocmlzdGlhbgo+ID4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4gQW0gMjkuMDkuMjAg
dW0gMTc6MzUgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+ID4+Pj4+Pj4+Pj4+PiBBbSAyOS4w
OS4yMCB1bSAxNzoxNCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+ID4+Pj4+Pj4+Pj4+Pj4g
VGhlIG5ldyBoZWxwZXIgdHRtX2ttYXBfb2JqX3RvX2RtYV9idWYoKSBleHRyYWN0cyBhZGRyZXNz
IGFuZCBsb2NhdGlvbgo+ID4+Pj4+Pj4+Pj4+Pj4gZnJvbSBhbmQgaW5zdGFuY2Ugb2YgVFRNJ3Mg
a21hcF9vYmogYW5kIGluaXRpYWxpemVzIHN0cnVjdCBkbWFfYnVmX21hcAo+ID4+Pj4+Pj4+Pj4+
Pj4gd2l0aCB0aGVzZSB2YWx1ZXMuIEhlbHBmdWwgZm9yIFRUTS1iYXNlZCBkcml2ZXJzLgo+ID4+
Pj4+Pj4+Pj4+PiBXZSBjb3VsZCBjb21wbGV0ZWx5IGRyb3AgdGhhdCBpZiB3ZSB1c2UgdGhlIHNh
bWUgc3RydWN0dXJlIGluc2lkZSBUVE0gYXMKPiA+Pj4+Pj4+Pj4+Pj4gd2VsbC4KPiA+Pj4+Pj4+
Pj4+Pj4KPiA+Pj4+Pj4+Pj4+Pj4gQWRkaXRpb25hbCB0byB0aGF0IHdoaWNoIGRyaXZlciBpcyBn
b2luZyB0byB1c2UgdGhpcz8KPiA+Pj4+Pj4+Pj4+PiBBcyBEYW5pZWwgbWVudGlvbmVkLCBpdCdz
IGluIHBhdGNoIDMuIFRoZSBUVE0tYmFzZWQgZHJpdmVycyB3aWxsCj4gPj4+Pj4+Pj4+Pj4gcmV0
cmlldmUgdGhlIHBvaW50ZXIgdmlhIHRoaXMgZnVuY3Rpb24uCj4gPj4+Pj4+Pj4+Pj4KPiA+Pj4+
Pj4+Pj4+PiBJIGRvIHdhbnQgdG8gc2VlIGFsbCB0aGF0IGJlaW5nIG1vcmUgdGlnaHRseSBpbnRl
Z3JhdGVkIGludG8gVFRNLCBidXQKPiA+Pj4+Pj4+Pj4+PiBub3QgaW4gdGhpcyBzZXJpZXMuIFRo
aXMgb25lIGlzIGFib3V0IGZpeGluZyB0aGUgYm9jaHMtb24tc3BhcmM2NAo+ID4+Pj4+Pj4+Pj4+
IHByb2JsZW0gZm9yIGdvb2QuIFBhdGNoIDcgYWRkcyBhbiB1cGRhdGUgdG8gVFRNIHRvIHRoZSBE
Uk0gVE9ETyBsaXN0Lgo+ID4+Pj4+Pj4+Pj4gSSBzaG91bGQgaGF2ZSBhc2tlZCB3aGljaCBkcml2
ZXIgeW91IHRyeSB0byBmaXggaGVyZSA6KQo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+IEluIHRo
aXMgY2FzZSBqdXN0IGtlZXAgdGhlIGZ1bmN0aW9uIGluc2lkZSBib2NocyBhbmQgb25seSBmaXgg
aXQgdGhlcmUuCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4gQWxsIG90aGVyIGRyaXZlcnMgY2Fu
IGJlIGZpeGVkIHdoZW4gd2UgZ2VuZXJhbGx5IHB1bXAgdGhpcyB0aHJvdWdoIFRUTS4KPiA+Pj4+
Pj4+Pj4gRGlkIHlvdSB0YWtlIGEgbG9vayBhdCBwYXRjaCAzPyBUaGlzIGZ1bmN0aW9uIHdpbGwg
YmUgdXNlZCBieSBWUkFNCj4gPj4+Pj4+Pj4+IGhlbHBlcnMsIG5vdXZlYXUsIHJhZGVvbiwgYW1k
Z3B1IGFuZCBxeGwuIElmIHdlIGRvbid0IHB1dCBpdCBoZXJlLCB3ZQo+ID4+Pj4+Pj4+PiBoYXZl
IHRvIGR1cGxpY2F0ZSB0aGUgZnVuY3Rpb25hbGl0eSBpbiBlYWNoIGlmIHRoZXNlIGRyaXZlcnMu
IEJvY2hzCj4gPj4+Pj4+Pj4+IGl0c2VsZiB1c2VzIFZSQU0gaGVscGVycyBhbmQgZG9lc24ndCB0
b3VjaCB0aGUgZnVuY3Rpb24gZGlyZWN0bHkuCj4gPj4+Pj4+Pj4gQWgsIG9rIGNhbiB3ZSBoYXZl
IHRoYXQgdGhlbiBvbmx5IGluIHRoZSBWUkFNIGhlbHBlcnM/Cj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+
PiBBbHRlcm5hdGl2ZSB5b3UgY291bGQgZ28gYWhlYWQgYW5kIHVzZSBkbWFfYnVmX21hcCBpbiB0
dG1fYm9fa21hcF9vYmoKPiA+Pj4+Pj4+PiBkaXJlY3RseSBhbmQgZHJvcCB0aGUgaGFjayB3aXRo
IHRoZSBUVE1fQk9fTUFQX0lPTUVNX01BU0suCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBXaGF0IEkg
d2FudCB0byBhdm9pZCBpcyB0byBoYXZlIGFub3RoZXIgY29udmVyc2lvbiBmdW5jdGlvbiBpbiBU
VE0gYmVjYXVzZQo+ID4+Pj4+Pj4+IHdoYXQgaGFwcGVucyBoZXJlIGlzIHRoYXQgd2UgYWxyZWFk
eSBjb252ZXJ0IGZyb20gdHRtX2J1c19wbGFjZW1lbnQgdG8KPiA+Pj4+Pj4+PiB0dG1fYm9fa21h
cF9vYmogYW5kIHRoZW4gdG8gZG1hX2J1Zl9tYXAuCj4gPj4+Pj4+PiBIbSBJJ20gbm90IHJlYWxs
eSBzZWVpbmcgaG93IHRoYXQgaGVscHMgd2l0aCBhIGdyYWR1YWwgY29udmVyc2lvbiBvZgo+ID4+
Pj4+Pj4gZXZlcnl0aGluZyBvdmVyIHRvIGRtYV9idWZfbWFwIGFuZCBhc3NvcnRlZCBoZWxwZXJz
IGZvciBhY2Nlc3M/IFRoZXJlJ3MKPiA+Pj4+Pj4+IHRvbyBtYW55IHBsYWNlcyBpbiB0dG0gZHJp
dmVycyB3aGVyZSBpc19pb21lbSBhbmQgcmVsYXRlZCBzdHVmZiBpcyB1c2VkIHRvCj4gPj4+Pj4+
PiBiZSBhYmxlIHRvIGNvbnZlcnQgaXQgYWxsIGluIG9uZSBnby4gQW4gaW50ZXJtZWRpYXRlIHN0
YXRlIHdpdGggYSBidW5jaCBvZgo+ID4+Pj4+Pj4gY29udmVyc2lvbnMgc2VlbXMgZmFpcmx5IHVu
YXZvaWRhYmxlIHRvIG1lLgo+ID4+Pj4+PiBGYWlyIGVub3VnaC4gSSB3b3VsZCBqdXN0IGhhdmUg
c3RhcnRlZCBib3R0b20gdXAgYW5kIG5vdCB0b3AgZG93bi4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gQW55
d2F5IGZlZWwgZnJlZSB0byBnbyBhaGVhZCB3aXRoIHRoaXMgYXBwcm9hY2ggYXMgbG9uZyBhcyB3
ZSBjYW4gcmVtb3ZlCj4gPj4+Pj4+IHRoZSBuZXcgZnVuY3Rpb24gYWdhaW4gd2hlbiB3ZSBjbGVh
biB0aGF0IHN0dWZmIHVwIGZvciBnb29kLgo+ID4+Pj4+IFllYWggSSBndWVzcyBib3R0b20gdXAg
d291bGQgbWFrZSBtb3JlIHNlbnNlIGFzIGEgcmVmYWN0b3JpbmcuIEJ1dCB0aGUKPiA+Pj4+PiBt
YWluIG1vdGl2YXRpb24gdG8gbGFuZCB0aGlzIGhlcmUgaXMgdG8gZml4IHRoZSBfX21taW8gdnMg
bm9ybWFsCj4gPj4+Pj4gbWVtb3J5IGNvbmZ1c2lvbiBpbiB0aGUgZmJkZXYgZW11bGF0aW9uIGhl
bHBlcnMgZm9yIHNwYXJjIChhbmQKPiA+Pj4+PiBhbnl0aGluZyBlbHNlIHRoYXQgbmVlZHMgdGhp
cykuIEhlbmNlIHRoZSB0b3AgZG93biBhcHByb2FjaCBmb3IKPiA+Pj4+PiByb2xsaW5nIHRoaXMg
b3V0Lgo+ID4+Pj4gT2sgSSBzdGFydGVkIHJldmlld2luZyB0aGlzIGEgYml0IG1vcmUgaW4tZGVw
dGgsIGFuZCBJIHRoaW5rIHRoaXMgaXMgYSBiaXQKPiA+Pj4+IHRvbyBtdWNoIG9mIGEgZGUtdG91
ci4KPiA+Pj4+Cj4gPj4+PiBMb29raW5nIHRocm91Z2ggYWxsIHRoZSBjYWxsZXJzIG9mIHR0bV9i
b19rbWFwIGFsbW9zdCBldmVyeW9uZSBtYXBzIHRoZQo+ID4+Pj4gZW50aXJlIG9iamVjdC4gT25s
eSB2bXdnZnggdXNlcyB0byBtYXAgbGVzcyB0aGFuIHRoYXQuIEFsc28sIGV2ZXJ5b25lIGp1c3QK
PiA+Pj4+IGltbWVkaWF0ZWx5IGZvbGxvd3MgdXAgd2l0aCBjb252ZXJ0aW5nIHRoYXQgZnVsbCBv
YmplY3QgbWFwIGludG8gYQo+ID4+Pj4gcG9pbnRlci4KPiA+Pj4+Cj4gPj4+PiBTbyBJIHRoaW5r
IHdoYXQgd2UgcmVhbGx5IHdhbnQgaGVyZSBpczoKPiA+Pj4+IC0gbmV3IGZ1bmN0aW9uCj4gPj4+
Pgo+ID4+Pj4gaW50IHR0bV9ib192bWFwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0
cnVjdCBkbWFfYnVmX21hcCAqbWFwKTsKPiA+Pj4+Cj4gPj4+PiAgICBfdm1hcCBuYW1lIHNpbmNl
IHRoYXQncyBjb25zaXN0ZW50IHdpdGggYm90aCBkbWFfYnVmIGZ1bmN0aW9ucyBhbmQKPiA+Pj4+
ICAgIHdoYXQncyB1c3VhbGx5IHVzZWQgdG8gaW1wbGVtZW50IHRoaXMuIE91dHNpZGUgb2YgdGhl
IHR0bSB3b3JsZCBrbWFwCj4gPj4+PiAgICB1c3VhbGx5IGp1c3QgbWVhbnMgc2luZ2xlLXBhZ2Ug
bWFwcGluZ3MgdXNpbmcga21hcCgpIG9yIGl0J3MgaW9tZW0KPiA+Pj4+ICAgIHNpYmxpbmcgaW9f
bWFwcGluZ19tYXAqIHNvIHJhdGhlciBjb25mdXNpbmcgbmFtZSBmb3IgYSBmdW5jdGlvbiB3aGlj
aAo+ID4+Pj4gICAgdXN1YWxseSBpcyBqdXN0IHVzZWQgdG8gc2V0IHVwIGEgdm1hcCBvZiB0aGUg
ZW50aXJlIGJ1ZmZlci4KPiA+Pj4+Cj4gPj4+PiAtIGEgaGVscGVyIHdoaWNoIGNhbiBiZSB1c2Vk
IGZvciB0aGUgZHJtX2dlbV9vYmplY3RfZnVuY3Mgdm1hcC92dW5tYXAKPiA+Pj4+ICAgIGZ1bmN0
aW9ucyBmb3IgYWxsIHR0bSBkcml2ZXJzLiBXZSBzaG91bGQgYmUgYWJsZSB0byBtYWtlIHRoaXMg
ZnVsbHkKPiA+Pj4+ICAgIGdlbmVyaWMgYmVjYXVzZSBhKSB3ZSBub3cgaGF2ZSBkbWFfYnVmX21h
cCBhbmQgYikgZHJtX2dlbV9vYmplY3QgaXMKPiA+Pj4+ICAgIGVtYmVkZGVkIGluIHRoZSB0dG1f
Ym8sIHNvIHdlIGNhbiB1cGNhc3QgZm9yIGV2ZXJ5b25lIHdobydzIGJvdGggYSB0dG0KPiA+Pj4+
ICAgIGFuZCBnZW0gZHJpdmVyLgo+ID4+Pj4KPiA+Pj4+ICAgIFRoaXMgaXMgbWF5YmUgYSBnb29k
IGZvbGxvdy11cCwgc2luY2UgaXQgc2hvdWxkIGFsbG93IHVzIHRvIGRpdGNoIHF1aXRlCj4gPj4+
PiAgICBhIGJpdCBvZiB0aGUgdnJhbSBoZWxwZXIgY29kZSBmb3IgdGhpcyBtb3JlIGdlbmVyaWMg
c3R1ZmYuIEkgYWxzbyBtaWdodAo+ID4+Pj4gICAgaGF2ZSBtaXNzZWQgc29tZSBzcGVjaWFsLWNh
c2VzIGhlcmUsIGJ1dCBmcm9tIGEgcXVpY2sgbG9vayBldmVyeXRoaW5nCj4gPj4+PiAgICBqdXN0
IHBpbnMgdGhlIGJ1ZmZlciB0byB0aGUgY3VycmVudCBsb2NhdGlvbiBhbmQgdGhhdCdzIGl0Lgo+
ID4+Pj4KPiA+Pj4+ICAgIEFsc28gdGhpcyBvYnZpb3VzbHkgcmVxdWlyZXMgQ2hyaXN0aWFuJ3Mg
Z2VuZXJpYyB0dG1fYm9fcGluIHJld29yawo+ID4+Pj4gICAgZmlyc3QuCj4gPj4+Pgo+ID4+Pj4g
LSByb2xsIHRoZSBhYm92ZSBvdXQgdG8gZHJpdmVycy4KPiA+Pj4+Cj4gPj4+PiBDaHJpc3RpYW4v
VGhvbWFzLCB0aG91Z2h0cyBvbiB0aGlzPwo+ID4+PiBJIGFncmVlIG9uIHRoZSBnb2FscywgYnV0
IHdoYXQgaXMgdGhlIGltbWVkaWF0ZSBvYmplY3RpdmUgaGVyZT8KPiA+Pj4KPiA+Pj4gQWRkaW5n
IHR0bV9ib192bWFwKCkgZG9lcyBub3Qgd29yayBvdXQgZWFzaWx5LCBhcyBzdHJ1Y3QgdHRtX2Jv
X2ttYXBfb2JqCj4gPj4+IGlzIGEgY2VudHJhbCBwYXJ0IG9mIHRoZSBpbnRlcm5hbHMgb2YgVFRN
LiBzdHJ1Y3QgdHRtX2JvX2ttYXBfb2JqIGhhcwo+ID4+PiBtb3JlIGludGVybmFsIHN0YXRlIHRo
YXQgc3RydWN0IGRtYV9idWZfbWFwLCBzbyB0aGV5IGFyZSBub3QgZWFzaWx5Cj4gPj4+IGNvbnZl
cnRpYmxlIGVpdGhlci4gV2hhdCB5b3UgcHJvcG9zZSBzZWVtcyB0byByZXF1aXJlIGEgcmVpbXBs
ZW1lbnRhdGlvbgo+ID4+PiBvZiB0aGUgZXhpc3RpbmcgdHRtX2JvX2ttYXAoKSBjb2RlLiBUaGF0
IGlzIGl0J3Mgb3duIHBhdGNoIHNlcmllcy4KPiA+Pj4KPiA+Pj4gSSdkIHJhdGhlciBnbyB3aXRo
IHNvbWUgdmFyaWFudCBvZiB0aGUgZXhpc3RpbmcgcGF0Y2ggYW5kIGFkZAo+ID4+PiB0dG1fYm9f
dm1hcCgpIGluIGEgZm9sbG93LXVwLgo+ID4+IHR0bV9ib192bWFwIHdvdWxkIHNpbXBseSB3cmFw
IHdoYXQgeW91IGN1cnJlbnRseSBvcGVuLWNvZGUgYXMKPiA+PiB0dG1fYm9fa21hcCArIHR0bV9r
bWFwX29ial90b19kbWFfYnVmX21hcC4gUmVtb3ZpbmcgdHRtX2ttYXBfb2JqIHdvdWxkCj4gPj4g
YmUgYSBtdWNoIGxhdGVyIHN0ZXAuIFdoeSBkbyB5b3UgdGhpbmsgYWRkaW5nIHR0bV9ib192bWFw
IGlzIG5vdAo+ID4+IHBvc3NpYmxlPwo+ID4gVGhlIGNhbGxzIHRvIHR0bV9ib19rbWFwL19rdW5t
YXAoKSByZXF1aXJlIGFuIGluc3RhbmNlIG9mIHN0cnVjdAo+ID4gdHRtX2JvX2ttYXBfb2JqIHRo
YXQgaXMgc3RvcmVkIGluIGVhY2ggZHJpdmVyJ3MgcHJpdmF0ZSBibyBzdHJ1Y3R1cmUKPiA+IChl
LmcuLCBzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCwgc3RydWN0IHJhZGVvbl9ibywgZXRjKS4g
V2hlbiBJIG1hZGUKPiA+IHBhdGNoIDMsIEkgZmxpcnRlZCB3aXRoIHRoZSBpZGVhIG9mIHVuaWZ5
aW5nIHRoZSBkcml2ZXIncyBfdm1hcCBjb2RlIGluCj4gPiBhIHNoYXJlZCBoZWxwZXIsIGJ1dCBJ
IGNvdWxkbid0IGZpbmQgYSBzaW1wbGUgd2F5IG9mIGRvaW5nIGl0LiBUaGF0J3MKPiA+IHdoeSBp
dCdzIG9wZW4tY29kZWQgaW4gdGhlIGZpcnN0IHBsYWNlLgoKWWVhaCB3ZSdkIG5lZWQgYSB0dG1f
Ym9fdnVubWFwIEkgZ3Vlc3MgdG8gbWFrZSB0aGlzIHdvcmsuIFdoaWNoCnNob3VsZG4ndCBiZSBt
b3JlIHRoYW4gYSBmZXcgbGluZXMsIGJ1dCBtYXliZSB0b28gbXVjaCB0byBkbyBpbiB0aGlzCnNl
cmllcy4KCj4gV2VsbCB0aGF0IG1ha2VzIGtpbmQgb2Ygc2Vuc2UuIEtlZXAgaW4gbWluZCB0aGF0
IHR0bV9ib19rbWFwIGlzCj4gY3VycmVudGx5IHdheSB0byBjb21wbGljYXRlZC4KClllYWgsIHNp
bXBsaWZ5aW5nIHRoaXMgaW50byBhIHR0bV9ib192bWFwIG9uIG9uZSBzaWRlLCBhbmQgYSBzaW1w
bGUKMS1wYWdlIGttYXAgaGVscGVyIG9uIHRoZSBvdGhlciBzaG91bGQgaGVscCBhIGxvdC4KLURh
bmllbAoKPgo+IENocmlzdGlhbi4KPgo+ID4KPiA+IEJlc3QgcmVnYXJkcwo+ID4gVGhvbWFzCj4g
Pgo+ID4+IC1EYW5pZWwKPiA+Pgo+ID4+Cj4gPj4+IEJlc3QgcmVnYXJkcwo+ID4+PiBUaG9tYXMK
PiA+Pj4KPiA+Pj4+IEkgdGhpbmsgZm9yIHRoZSBpbW1lZGlhdGUgbmVlZCBvZiByb2xsaW5nIHRo
aXMgb3V0IGZvciB2cmFtIGhlbHBlcnMgYW5kCj4gPj4+PiBmYmRldiBjb2RlIHdlIHNob3VsZCBi
ZSBhYmxlIHRvIGRvIHRoaXMsIGJ1dCBqdXN0IHBvc3Rwb25lIHRoZSBkcml2ZXIgd2lkZQo+ID4+
Pj4gcm9sbC1vdXQgZm9yIG5vdy4KPiA+Pj4+Cj4gPj4+PiBDaGVlcnMsIERhbmllbAo+ID4+Pj4K
PiA+Pj4+PiAtRGFuaWVsCj4gPj4+Pj4KPiA+Pj4+Pj4gQ2hyaXN0aWFuLgo+ID4+Pj4+Pgo+ID4+
Pj4+Pj4gLURhbmllbAo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+PiBUaGFua3MsCj4gPj4+Pj4+Pj4gQ2hy
aXN0aWFuLgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+IEJlc3QgcmVnYXJkcwo+ID4+Pj4+Pj4+PiBU
aG9tYXMKPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+IFJlZ2FyZHMsCj4gPj4+Pj4+Pj4+PiBDaHJp
c3RpYW4uCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+IEJlc3QgcmVnYXJkcwo+ID4+Pj4+Pj4+
Pj4+IFRob21hcwo+ID4+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4+IFJlZ2FyZHMsCj4gPj4+Pj4+
Pj4+Pj4+IENocmlzdGlhbi4KPiA+Pj4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4+Pj4+Pj4+
Pj4+Pj4gLS0tCj4gPj4+Pj4+Pj4+Pj4+PiAgICAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBp
LmggfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiA+Pj4+Pj4+Pj4+Pj4+ICAgICAgaW5j
bHVkZS9saW51eC9kbWEtYnVmLW1hcC5oICB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gPj4+
Pj4+Pj4+Pj4+PiAgICAgIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+ID4+Pj4+
Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRt
X2JvX2FwaS5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+ID4+Pj4+Pj4+Pj4+Pj4g
aW5kZXggYzk2YTI1ZDU3MWM4Li42MmQ4OWYwNWE4MDEgMTAwNjQ0Cj4gPj4+Pj4+Pj4+Pj4+PiAt
LS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4gPj4+Pj4+Pj4+Pj4+PiArKysgYi9p
bmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4gPj4+Pj4+Pj4+Pj4+PiBAQCAtMzQsNiArMzQs
NyBAQAo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICAjaW5jbHVkZSA8ZHJtL2RybV9nZW0uaD4KPiA+Pj4+
Pj4+Pj4+Pj4+ICAgICAgI2luY2x1ZGUgPGRybS9kcm1faGFzaHRhYi5oPgo+ID4+Pj4+Pj4+Pj4+
Pj4gICAgICAjaW5jbHVkZSA8ZHJtL2RybV92bWFfbWFuYWdlci5oPgo+ID4+Pj4+Pj4+Pj4+Pj4g
KyNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLW1hcC5oPgo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICAjaW5j
bHVkZSA8bGludXgva3JlZi5oPgo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICAjaW5jbHVkZSA8bGludXgv
bGlzdC5oPgo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICAjaW5jbHVkZSA8bGludXgvd2FpdC5oPgo+ID4+
Pj4+Pj4+Pj4+Pj4gQEAgLTQ4Niw2ICs0ODcsMjkgQEAgc3RhdGljIGlubGluZSB2b2lkICp0dG1f
a21hcF9vYmpfdmlydHVhbChzdHJ1Y3QKPiA+Pj4+Pj4+Pj4+Pj4+IHR0bV9ib19rbWFwX29iaiAq
bWFwLAo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgcmV0dXJuIG1hcC0+dmlydHVhbDsKPiA+Pj4+
Pj4+Pj4+Pj4+ICAgICAgfQo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICArLyoqCj4gPj4+Pj4+Pj4+Pj4+
PiArICogdHRtX2ttYXBfb2JqX3RvX2RtYV9idWZfbWFwCj4gPj4+Pj4+Pj4+Pj4+PiArICoKPiA+
Pj4+Pj4+Pj4+Pj4+ICsgKiBAa21hcDogQSBzdHJ1Y3QgdHRtX2JvX2ttYXBfb2JqIHJldHVybmVk
IGZyb20gdHRtX2JvX2ttYXAuCj4gPj4+Pj4+Pj4+Pj4+PiArICogQG1hcDogUmV0dXJucyB0aGUg
bWFwcGluZyBhcyBzdHJ1Y3QgZG1hX2J1Zl9tYXAKPiA+Pj4+Pj4+Pj4+Pj4+ICsgKgo+ID4+Pj4+
Pj4+Pj4+Pj4gKyAqIENvbnZlcnRzIHN0cnVjdCB0dG1fYm9fa21hcF9vYmogdG8gc3RydWN0IGRt
YV9idWZfbWFwLiBJZiB0aGUgbWVtb3J5Cj4gPj4+Pj4+Pj4+Pj4+PiArICogaXMgbm90IG1hcHBl
ZCwgdGhlIHJldHVybmVkIG1hcHBpbmcgaXMgaW5pdGlhbGl6ZWQgdG8gTlVMTC4KPiA+Pj4+Pj4+
Pj4+Pj4+ICsgKi8KPiA+Pj4+Pj4+Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgdHRtX2ttYXBf
b2JqX3RvX2RtYV9idWZfbWFwKHN0cnVjdCB0dG1fYm9fa21hcF9vYmoKPiA+Pj4+Pj4+Pj4+Pj4+
ICprbWFwLAo+ID4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBkbWFfYnVmX21hcCAqbWFwKQo+ID4+Pj4+Pj4+Pj4+Pj4gK3sKPiA+Pj4+Pj4+Pj4+Pj4+ICsg
ICAgYm9vbCBpc19pb21lbTsKPiA+Pj4+Pj4+Pj4+Pj4+ICsgICAgdm9pZCAqdmFkZHIgPSB0dG1f
a21hcF9vYmpfdmlydHVhbChrbWFwLCAmaXNfaW9tZW0pOwo+ID4+Pj4+Pj4+Pj4+Pj4gKwo+ID4+
Pj4+Pj4+Pj4+Pj4gKyAgICBpZiAoIXZhZGRyKQo+ID4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgZG1h
X2J1Zl9tYXBfY2xlYXIobWFwKTsKPiA+Pj4+Pj4+Pj4+Pj4+ICsgICAgZWxzZSBpZiAoaXNfaW9t
ZW0pCj4gPj4+Pj4+Pj4+Pj4+PiArICAgICAgICBkbWFfYnVmX21hcF9zZXRfdmFkZHJfaW9tZW0o
bWFwLCAodm9pZCBfX2ZvcmNlIF9faW9tZW0gKil2YWRkcik7Cj4gPj4+Pj4+Pj4+Pj4+PiArICAg
IGVsc2UKPiA+Pj4+Pj4+Pj4+Pj4+ICsgICAgICAgIGRtYV9idWZfbWFwX3NldF92YWRkcihtYXAs
IHZhZGRyKTsKPiA+Pj4+Pj4+Pj4+Pj4+ICt9Cj4gPj4+Pj4+Pj4+Pj4+PiArCj4gPj4+Pj4+Pj4+
Pj4+PiAgICAgIC8qKgo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICAgKiB0dG1fYm9fa21hcAo+ID4+Pj4+
Pj4+Pj4+Pj4gICAgICAgKgo+ID4+Pj4+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvZG1hLWJ1Zi1tYXAuaCBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaAo+ID4+Pj4+Pj4+
Pj4+Pj4gaW5kZXggZmQxYWJhNTQ1ZmRmLi4yZThiYmVjYjUwOTEgMTAwNjQ0Cj4gPj4+Pj4+Pj4+
Pj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmgKPiA+Pj4+Pj4+Pj4+Pj4+ICsr
KyBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaAo+ID4+Pj4+Pj4+Pj4+Pj4gQEAgLTQ1LDYg
KzQ1LDEyIEBACj4gPj4+Pj4+Pj4+Pj4+PiAgICAgICAqCj4gPj4+Pj4+Pj4+Pj4+PiAgICAgICAq
ICAgIGRtYV9idWZfbWFwX3NldF92YWRkcigmbWFwLiAweGRlYWRiZWFmKTsKPiA+Pj4+Pj4+Pj4+
Pj4+ICAgICAgICoKPiA+Pj4+Pj4+Pj4+Pj4+ICsgKiBUbyBzZXQgYW4gYWRkcmVzcyBpbiBJL08g
bWVtb3J5LCB1c2UgZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyX2lvbWVtKCkuCj4gPj4+Pj4+Pj4+Pj4+
PiArICoKPiA+Pj4+Pj4+Pj4+Pj4+ICsgKiAuLiBjb2RlLWJsb2NrOjogYwo+ID4+Pj4+Pj4+Pj4+
Pj4gKyAqCj4gPj4+Pj4+Pj4+Pj4+PiArICogICAgZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyX2lvbWVt
KCZtYXAuIDB4ZGVhZGJlYWYpOwo+ID4+Pj4+Pj4+Pj4+Pj4gKyAqCj4gPj4+Pj4+Pj4+Pj4+PiAg
ICAgICAqIFRlc3QgaWYgYSBtYXBwaW5nIGlzIHZhbGlkIHdpdGggZWl0aGVyIGRtYV9idWZfbWFw
X2lzX3NldCgpIG9yCj4gPj4+Pj4+Pj4+Pj4+PiAgICAgICAqIGRtYV9idWZfbWFwX2lzX251bGwo
KS4KPiA+Pj4+Pj4+Pj4+Pj4+ICAgICAgICoKPiA+Pj4+Pj4+Pj4+Pj4+IEBAIC0xMTgsNiArMTI0
LDIwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkbWFfYnVmX21hcF9zZXRfdmFkZHIoc3RydWN0Cj4g
Pj4+Pj4+Pj4+Pj4+PiBkbWFfYnVmX21hcCAqbWFwLCB2b2lkICp2YWRkcikKPiA+Pj4+Pj4+Pj4+
Pj4+ICAgICAgICAgIG1hcC0+aXNfaW9tZW0gPSBmYWxzZTsKPiA+Pj4+Pj4+Pj4+Pj4+ICAgICAg
fQo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICArLyoqCj4gPj4+Pj4+Pj4+Pj4+PiArICogZG1hX2J1Zl9t
YXBfc2V0X3ZhZGRyX2lvbWVtIC0gU2V0cyBhIGRtYS1idWYgbWFwcGluZyBzdHJ1Y3R1cmUgdG8K
PiA+Pj4+Pj4+Pj4+Pj4+IGFuIGFkZHJlc3MgaW4gSS9PIG1lbW9yeQo+ID4+Pj4+Pj4+Pj4+Pj4g
KyAqIEBtYXA6ICAgICAgICBUaGUgZG1hLWJ1ZiBtYXBwaW5nIHN0cnVjdHVyZQo+ID4+Pj4+Pj4+
Pj4+Pj4gKyAqIEB2YWRkcl9pb21lbTogICAgQW4gSS9PLW1lbW9yeSBhZGRyZXNzCj4gPj4+Pj4+
Pj4+Pj4+PiArICoKPiA+Pj4+Pj4+Pj4+Pj4+ICsgKiBTZXRzIHRoZSBhZGRyZXNzIGFuZCB0aGUg
SS9PLW1lbW9yeSBmbGFnLgo+ID4+Pj4+Pj4+Pj4+Pj4gKyAqLwo+ID4+Pj4+Pj4+Pj4+Pj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBkbWFfYnVmX21hcF9zZXRfdmFkZHJfaW9tZW0oc3RydWN0IGRtYV9i
dWZfbWFwICptYXAsCj4gPj4+Pj4+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCBfX2lvbWVtICp2YWRkcl9pb21lbSkKPiA+Pj4+Pj4+Pj4+Pj4+ICt7Cj4gPj4+Pj4+Pj4+
Pj4+PiArICAgIG1hcC0+dmFkZHJfaW9tZW0gPSB2YWRkcl9pb21lbTsKPiA+Pj4+Pj4+Pj4+Pj4+
ICsgICAgbWFwLT5pc19pb21lbSA9IHRydWU7Cj4gPj4+Pj4+Pj4+Pj4+PiArfQo+ID4+Pj4+Pj4+
Pj4+Pj4gKwo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICAvKioKPiA+Pj4+Pj4+Pj4+Pj4+ICAgICAgICog
ZG1hX2J1Zl9tYXBfaXNfZXF1YWwgLSBDb21wYXJlcyB0d28gZG1hLWJ1ZiBtYXBwaW5nIHN0cnVj
dHVyZXMKPiA+Pj4+Pj4+Pj4+Pj4+IGZvciBlcXVhbGl0eQo+ID4+Pj4+Pj4+Pj4+Pj4gICAgICAg
KiBAbGhzOiAgICBUaGUgZG1hLWJ1ZiBtYXBwaW5nIHN0cnVjdHVyZQo+ID4+Pj4+Pj4+Pj4+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+Pj4+Pj4+
Pj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPj4+Pj4+Pj4+Pj4+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiA+Pj4+Pj4+Pj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0
b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRldmVsJmFtcDtkYXRhPTAyJTdDMDEl
N0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzQ3MmMzZDY1NWE2MTQxMWRlYjY3MDhkODY1
MjVkMWI4JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM3
MDU2MDQzODk2NTAxMyZhbXA7c2RhdGE9SGRIT0ElMkYxVmNJWCUyRjdZdGZZVGlBcVlFdnc3QWcl
MkZTJTJCeFM1VndKS092NXkwJTNEJmFtcDtyZXNlcnZlZD0wCj4gPj4+Pj4+Pj4+Pj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+Pj4+Pj4+Pj4+PiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+ID4+Pj4+Pj4+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gPj4+Pj4+Pj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFp
bG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtv
ZW5pZyU0MGFtZC5jb20lN0M0NzJjM2Q2NTVhNjE0MTFkZWI2NzA4ZDg2NTI1ZDFiOCU3QzNkZDg5
NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzczNzA1NjA0Mzg5NjUwMTMm
YW1wO3NkYXRhPUglMkI1SEtDc1Rya3NSVjJFeUVpRkdTVHlTNzlqc1dDbUppbVNNb0pZdXN4OCUz
RCZhbXA7cmVzZXJ2ZWQ9MAo+ID4+Pj4+Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+Pj4+Pj4+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiA+Pj4+Pj4+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+Pj4+Pj4+Pj4+
IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRy
aS1kZXZlbCZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M0
NzJjM2Q2NTVhNjE0MTFkZWI2NzA4ZDg2NTI1ZDFiOCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgy
ZDk5NGUxODNkJTdDMCU3QzAlN0M2MzczNzA1NjA0Mzg5NjUwMTMmYW1wO3NkYXRhPUhkSE9BJTJG
MVZjSVglMkY3WXRmWVRpQXFZRXZ3N0FnJTJGUyUyQnhTNVZ3SktPdjV5MCUzRCZhbXA7cmVzZXJ2
ZWQ9MAo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+Pj4+Pj4+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+
Pj4+Pj4+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+Pj4+Pj4+Pj4gaHR0cHM6
Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJG
JTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZh
bXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M0NzJjM2Q2NTVh
NjE0MTFkZWI2NzA4ZDg2NTI1ZDFiOCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNk
JTdDMCU3QzAlN0M2MzczNzA1NjA0Mzg5NjUwMTMmYW1wO3NkYXRhPUglMkI1SEtDc1Rya3NSVjJF
eUVpRkdTVHlTNzlqc1dDbUppbVNNb0pZdXN4OCUzRCZhbXA7cmVzZXJ2ZWQ9MAo+ID4+Pj4+Cj4g
Pj4+Pj4gLS0KPiA+Pj4+PiBEYW5pZWwgVmV0dGVyCj4gPj4+Pj4gU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCj4gPj4+Pj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKPiA+Pj4gLS0K
PiA+Pj4gVGhvbWFzIFppbW1lcm1hbm4KPiA+Pj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcgo+
ID4+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKPiA+Pj4gTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gPj4+IChIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykKPiA+Pj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgo+ID4+Pgo+
ID4+Cj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ldG5hdml2Cg==
