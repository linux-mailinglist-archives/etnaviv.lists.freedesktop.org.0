Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D263B4E7F
	for <lists+etnaviv@lfdr.de>; Sat, 26 Jun 2021 14:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631E66EE58;
	Sat, 26 Jun 2021 12:55:13 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3DC5F6EC09;
 Thu, 24 Jun 2021 14:32:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6223CED1;
 Thu, 24 Jun 2021 07:32:13 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9A8A3F718;
 Thu, 24 Jun 2021 07:32:07 -0700 (PDT)
Subject: Re: [PATCH 01/11] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-2-daniel.vetter@ffwll.ch>
From: Steven Price <steven.price@arm.com>
Message-ID: <22cb9d54-bf8a-57d7-452d-565d4886cad0@arm.com>
Date: Thu, 24 Jun 2021 15:32:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624140025.438303-2-daniel.vetter@ffwll.ch>
Content-Language: en-GB
X-Mailman-Approved-At: Sat, 26 Jun 2021 12:55:12 +0000
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
Cc: Adam Borowski <kilobyte@angband.pl>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sonny Jiang <sonny.jiang@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Rob Herring <robh@kernel.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 lima@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nick Terrell <terrelln@fb.com>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gMjQvMDYvMjAyMSAxNTowMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBUaGlzIGlzIGEgdmVy
eSBjb25mdXNpbmdseSBuYW1lZCBmdW5jdGlvbiwgYmVjYXVzZSBub3QganVzdCBkb2VzIGl0Cj4g
aW5pdCBhbiBvYmplY3QsIGl0IGFybXMgaXQgYW5kIHByb3ZpZGVzIGEgcG9pbnQgb2Ygbm8gcmV0
dXJuIGZvcgo+IHB1c2hpbmcgYSBqb2IgaW50byB0aGUgc2NoZWR1bGVyLiBJdCB3b3VsZCBiZSBu
aWNlIGlmIHRoYXQncyBhIGJpdAo+IGNsZWFyZXIgaW4gdGhlIGludGVyZmFjZS4KPiAKPiBCdXQg
dGhlIHJlYWwgcmVhc29uIGlzIHRoYXQgSSB3YW50IHRvIHB1c2ggdGhlIGRlcGVuZGVuY3kgdHJh
Y2tpbmcKPiBoZWxwZXJzIGludG8gdGhlIHNjaGVkdWxlciBjb2RlLCBhbmQgdGhhdCBtZWFucyBk
cm1fc2NoZWRfam9iX2luaXQKPiBtdXN0IGJlIGNhbGxlZCBhIGxvdCBlYXJsaWVyLCB3aXRob3V0
IGFybWluZyB0aGUgam9iLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25p
eC5kZT4KPiBDYzogUnVzc2VsbCBLaW5nIDxsaW51eCtldG5hdml2QGFybWxpbnV4Lm9yZy51az4K
PiBDYzogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4KPiBD
YzogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Cj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+
Cj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gQ2M6IEFseXNzYSBS
b3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IE1hc2Fo
aXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cj4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nv
b2tAY2hyb21pdW0ub3JnPgo+IENjOiBBZGFtIEJvcm93c2tpIDxraWxvYnl0ZUBhbmdiYW5kLnBs
Pgo+IENjOiBOaWNrIFRlcnJlbGwgPHRlcnJlbGxuQGZiLmNvbT4KPiBDYzogTWF1cm8gQ2FydmFs
aG8gQ2hlaGFiIDxtY2hlaGFiK2h1YXdlaUBrZXJuZWwub3JnPgo+IENjOiBQYXVsIE1lbnplbCA8
cG1lbnplbEBtb2xnZW4ubXBnLmRlPgo+IENjOiBTYW1pIFRvbHZhbmVuIDxzYW1pdG9sdmFuZW5A
Z29vZ2xlLmNvbT4KPiBDYzogVmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4K
PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiBEYXZl
IEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IENjOiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFz
QGFtZC5jb20+Cj4gQ2M6IERlZXBhayBSIFZhcm1hIDxtaDEyZ3gyODI1QGdtYWlsLmNvbT4KPiBD
YzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiBDYzogS2V2aW4gV2FuZyA8a2V2
aW4xLndhbmdAYW1kLmNvbT4KPiBDYzogQ2hlbiBMaSA8Y2hlbmxpQHVuaW9udGVjaC5jb20+Cj4g
Q2M6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+Cj4gQ2M6ICJNYXJlayBPbMWh
w6FrIiA8bWFyZWsub2xzYWtAYW1kLmNvbT4KPiBDYzogRGVubmlzIExpIDxEZW5uaXMuTGlAYW1k
LmNvbT4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4KPiBDYzogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Cj4gQ2M6IFNvbm55IEppYW5nIDxzb25ueS5qaWFuZ0BhbWQuY29tPgo+IENjOiBCb3JpcyBC
cmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IENjOiBUaWFuIFRhbyA8
dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4KPiBDYzogSmFjayBaaGFuZyA8SmFjay5aaGFuZzFAYW1k
LmNvbT4KPiBDYzogZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGltYUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6
IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IC0tLQo+ICAuZ2l0aWdub3JlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3MuYyAgIHwgIDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2pvYi5jICB8ICAyICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
c2NoZWQuYyAgfCAgMiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3NjaGVkLmMgICAg
ICAgIHwgIDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jICB8
ICAyICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfCAgNiAr
KystLS0KPiAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9mZW5jZS5jICB8IDE1ICsr
KysrKysrKystLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyAg
IHwgMjMgKysrKysrKysrKysrKysrKysrKysrKy0KPiAgaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxl
ci5oICAgICAgICAgICAgICB8ICA2ICsrKysrLQo+ICAxMCBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvLmdpdGlnbm9yZSBi
Ly5naXRpZ25vcmUKPiBpbmRleCA3YWZkNDEyZGFkZDIuLjUyNDMzYTkzMDI5OSAxMDA2NDQKPiAt
LS0gYS8uZ2l0aWdub3JlCj4gKysrIGIvLmdpdGlnbm9yZQo+IEBAIC02Niw2ICs2Niw3IEBAIG1v
ZHVsZXMub3JkZXIKPiAgL21vZHVsZXMuYnVpbHRpbgo+ICAvbW9kdWxlcy5idWlsdGluLm1vZGlu
Zm8KPiAgL21vZHVsZXMubnNkZXBzCj4gKyouYnVpbHRpbgoKSSBkb24ndCB0aGluayB0aGlzIGJl
bG9uZ3MgaW4gdGhpcyBwYXRjaCEKClsuLi5dCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9qb2IuYwo+IGluZGV4IGJlYjYyYzhmYzg1MS4uMWU5NTA1MzRiOWIwIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+IEBAIC0yNDQsNiArMjQ0LDggQEAg
aW50IHBhbmZyb3N0X2pvYl9wdXNoKHN0cnVjdCBwYW5mcm9zdF9qb2IgKmpvYikKPiAgCQlnb3Rv
IHVubG9jazsKPiAgCX0KPiAgCj4gKwlkcm1fc2NoZWRfam9iX2FybSgmam9iLT5iYXNlKTsKPiAr
Cj4gIAlqb2ItPnJlbmRlcl9kb25lX2ZlbmNlID0gZG1hX2ZlbmNlX2dldCgmam9iLT5iYXNlLnNf
ZmVuY2UtPmZpbmlzaGVkKTsKPiAgCj4gIAlyZXQgPSBwYW5mcm9zdF9hY3F1aXJlX29iamVjdF9m
ZW5jZXMoam9iLT5ib3MsIGpvYi0+Ym9fY291bnQsCgpBY2tlZC1ieTogU3RldmVuIFByaWNlIDxz
dGV2ZW4ucHJpY2VAYXJtLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5h
dml2Cg==
