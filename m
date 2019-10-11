Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A239D9538
	for <lists+etnaviv@lfdr.de>; Wed, 16 Oct 2019 17:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061866E99F;
	Wed, 16 Oct 2019 15:15:01 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C146EC4D;
 Fri, 11 Oct 2019 15:03:43 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w144so8244820oia.6;
 Fri, 11 Oct 2019 08:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zf/wVL1pxkzfv+aCf542wtXl7xxXSJSAoS259hxFzdU=;
 b=BxiedRh162w5WDByjQ9DX97V2z5NVxmALC9C18JhrQ4MhCp7R9nVF95oQVeCsEobkW
 gl9OAVaATHZUkhapLQodZCCP0kS+H3mSvWM38CjyiVcoU1U3uoMA6jAoBU71LNCSjaNF
 BRSlAoSDSUKtCSKdFe/PMqSRrtpouPyxHjyHxUVZGfCJYjOuGS4I49EYlMlJlCadlvXy
 LE7uD2dDL44X6P9bdEDbHwjR4DC1v2ODwbMC6J0aPCv0kcJgBgmAUHA0xQrLncWMDFd7
 SPyTTsOW12ngrnhFQhIP4VTtE8GT4PPEIfV4IEL1y3UwbTDATWwYKE+nV+2nEIM3RQcm
 po9g==
X-Gm-Message-State: APjAAAUpTwLYEMHoyUsGZJrlwIIswnG3DwcF6sw/1j/eU8V+eLehWaJD
 rqRTQ9zrjDTaymiy6gAMIE9hSH4=
X-Google-Smtp-Source: APXvYqyV76Nvy442IRIoZov+TB1OwfgmfaBvOSHiGvU7dcH19CN5WjOOfWxDjsuT1iB1kLR3NqyaCA==
X-Received: by 2002:aca:5786:: with SMTP id l128mr12933151oib.34.1570806222672; 
 Fri, 11 Oct 2019 08:03:42 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l47sm2791691ota.56.2019.10.11.08.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:03:39 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:03:39 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Convert Generic Power Domain
 bindings to json-schema
Message-ID: <20191011150339.GA16245@bogus>
References: <20191002160632.11140-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002160632.11140-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 16 Oct 2019 15:15:00 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pci@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, etnaviv@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-usb@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDY6MDY6MzBQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBDb252ZXJ0IEdlbmVyaWMgUG93ZXIgRG9tYWluIGJpbmRpbmdzIHRvIERU
IHNjaGVtYSBmb3JtYXQgdXNpbmcKPiBqc29uLXNjaGVtYS4gIFRoZSBjb25zdW1lciBiaW5kaW5n
cyBhcmUgc3BsaXQgdG8gc2VwYXJhdGUgZmlsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gCj4gLS0tCj4gCj4gQ2hhbmdlcyBzaW5j
ZSB2MToKPiAxLiBTZWxlY3QgYWxsIG5vZGVzIGZvciBjb25zdW1lcnMsCj4gMi4gUmVtb3ZlIGZy
b20gY29uc3VtZXJzIGR1cGxpY2F0ZWQgcHJvcGVydGllcyB3aXRoIGR0LXNjaGVtYSwKPiAzLiBG
aXggcG93ZXIgZG9tYWluIHBhdHRlcm4sCj4gNC4gUmVtb3ZlIHVubmVlZGVkIHR5cGVzLgo+IC0t
LQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLHNjbWkudHh0ICAgICAgfCAgIDIg
Ky0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxzY3BpLnR4dCAgICAgIHwgICAy
ICstCj4gIC4uLi9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0ICAgICAgICB8ICAg
MiArLQo+ICAuLi4vYmluZGluZ3MvY2xvY2svY2xrLWV4eW5vcy1hdWRzcy50eHQgICAgICAgfCAg
IDIgKy0KPiAgLi4uL2JpbmRpbmdzL2Nsb2NrL2V4eW5vczU0MzMtY2xvY2sudHh0ICAgICAgIHwg
ICA0ICstCj4gIC4uLi9iaW5kaW5ncy9jbG9jay9yZW5lc2FzLGNwZy1tc3NyLnR4dCAgICAgICB8
ICAgMiArLQo+ICAuLi4vY2xvY2svcmVuZXNhcyxyOGE3Nzc4LWNwZy1jbG9ja3MudHh0ICAgICAg
fCAgIDIgKy0KPiAgLi4uL2Nsb2NrL3JlbmVzYXMscjhhNzc3OS1jcGctY2xvY2tzLnR4dCAgICAg
IHwgICAyICstCj4gIC4uLi9jbG9jay9yZW5lc2FzLHJjYXItZ2VuMi1jcGctY2xvY2tzLnR4dCAg
ICB8ICAgMiArLQo+ICAuLi4vYmluZGluZ3MvY2xvY2svcmVuZXNhcyxyei1jcGctY2xvY2tzLnR4
dCAgfCAgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL2Nsb2NrL3RpL2RhdmluY2kvcHNjLnR4dCAgICAg
ICAgIHwgICAyICstCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2V0bmF2aXYvZXRuYXZpdi1kcm0u
dHh0ICB8ICAgMiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kcHUu
dHh0ICAgfCAgIDIgKy0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vbWRw
NS50eHQgIHwgICAyICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RzcC9mc2wsZHNwLnlh
bWwgICAgICB8ICAgMiArLQo+ICAuLi4vZmlybXdhcmUvbnZpZGlhLHRlZ3JhMTg2LWJwbXAudHh0
ICAgICAgICAgfCAgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL21lZGlhL2lteDctbWlwaS1jc2kyLnR4
dCAgICAgICAgIHwgICAzICstCj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWRl
Y29kZXIudHh0ICB8ICAgMyArLQo+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstbWRwLnR4
dCAgICAgICAgICAgfCAgIDMgKy0KPiAgLi4uL2JpbmRpbmdzL29wcC9xY29tLW52bWVtLWNwdWZy
ZXEudHh0ICAgICAgIHwgICAyICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9wY2kt
a2V5c3RvbmUudHh0ICB8ICAgMiArLQo+ICAuLi4vYmluZGluZ3MvcGh5L3RpLHBoeS1hbTY1NC1z
ZXJkZXMudHh0ICAgICAgfCAgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL3Bvd2VyL2FtbG9naWMsbWVz
b24tZ3gtcHdyYy50eHQgIHwgICAyICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2Vy
L2ZzbCxpbXgtZ3BjLnR4dCB8ICAgMiArLQo+ICAuLi4vYmluZGluZ3MvcG93ZXIvZnNsLGlteC1n
cGN2Mi50eHQgICAgICAgICAgfCAgIDIgKy0KPiAgLi4uL3Bvd2VyL3Bvd2VyLWRvbWFpbi1jb25z
dW1lcnMueWFtbCAgICAgICAgIHwgMTA1ICsrKysrKysrKwo+ICAuLi4vYmluZGluZ3MvcG93ZXIv
cG93ZXItZG9tYWluLnlhbWwgICAgICAgICAgfCAxMzQgKysrKysrKysrKysrCj4gIC4uLi9iaW5k
aW5ncy9wb3dlci9wb3dlcl9kb21haW4udHh0ICAgICAgICAgICB8IDIwNSAtLS0tLS0tLS0tLS0t
LS0tLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcWNvbSxycG1wZC50eHQgIHwg
ICAyICstCj4gIC4uLi9iaW5kaW5ncy9wb3dlci9yZW5lc2FzLHJjYXItc3lzYy50eHQgICAgICB8
ICAgMiArLQo+ICAuLi4vYmluZGluZ3MvcG93ZXIvcmVuZXNhcyxzeXNjLXJtb2JpbGUudHh0ICAg
fCAgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL3Bvd2VyL3hsbngsenlucW1wLWdlbnBkLnR4dCAgICAg
IHwgICAyICstCj4gIC4uLi9iaW5kaW5ncy9zb2MvYmNtL2JyY20sYmNtMjgzNS1wbS50eHQgICAg
ICB8ICAgMiArLQo+ICAuLi4vYmluZGluZ3Mvc29jL21lZGlhdGVrL3NjcHN5cy50eHQgICAgICAg
ICAgfCAgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL3NvYy90aS9zY2ktcG0tZG9tYWluLnR4dCAgICAg
ICAgIHwgICAyICstCj4gIC4uLi9iaW5kaW5ncy91c2IvbnZpZGlhLHRlZ3JhMTI0LXh1c2IudHh0
ICAgICB8ICAgNCArLQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0KPiAgMzcgZmlsZXMgY2hhbmdlZCwgMjc4IGluc2VydGlvbnMoKyksIDI0
MSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9wb3dlci9wb3dlci1kb21haW4tY29uc3VtZXJzLnlhbWwKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dl
ci1kb21haW4ueWFtbAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Bvd2VyL3Bvd2VyX2RvbWFpbi50eHQKCgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLWNvbnN1bWVy
cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3Bvd2VyLWRv
bWFpbi1jb25zdW1lcnMueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi5mNjUwNzhlMTI2MGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3Bvd2VyLWRvbWFpbi1jb25zdW1lcnMueWFtbAo+
IEBAIC0wLDAgKzEsMTA1IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAK
PiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L3Bvd2VyL3Bvd2VyLWRvbWFpbi1jb25zdW1lcnMueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogUE0gZG9t
YWluIGNvbnN1bWVycwo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBSYWZhZWwgSi4gV3lzb2Nr
aSA8cmp3QHJqd3lzb2NraS5uZXQ+Cj4gKyAgLSBLZXZpbiBIaWxtYW4gPGtoaWxtYW5Aa2VybmVs
Lm9yZz4KPiArICAtIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPgo+ICsKPiAr
ZGVzY3JpcHRpb246IHwrCj4gKyAgU2VlIHBvd2VyLWRvbWFpbi55YW1sCj4gKwo+ICtzZWxlY3Q6
IHRydWUKPiArCj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogL3NjaGVtYXMvcG93ZXItZG9tYWluL3Bv
d2VyLWRvbWFpbi1jb25zdW1lci55YW1sCgpJIGRvbid0IGxpa2UgdGhpcyBzcGxpdC4gV2Ugc2hv
dWxkIG1vdmUgdGhlIGNvbnRlbnRzIG9mIHRoaXMgZmlsZSB0byB0aGUgCmFib3ZlIGZpbGUuCgpJ
IGNoZWNrZWQgdGhlIGF1dGhvcnNoaXAgb2YgdGhlIHJlbGV2YW50IGxpbmVzIGFuZCB0aGV5IGFy
ZSBhbGwgZXhjZXB0IApmb3IgYSBzbWFsbCBudW1iZXIgb2YgbGluZXMgZnJvbSBMaW5hcm8gYXV0
aG9ycyAoVmlyZXNoIGFuZCBVbGYpLiBJIGhhdmUgCnBlcm1pc3Npb24gZnJvbSBMaW5hcm8gdG8g
ZHVhbCBsaWNlbnNlIExpbmFybyBhdXRob3JlZCBiaW5kaW5ncywgc28gaXQncyAKbm90IGEgcHJv
YmxlbSB0byBtb3ZlIHRoaXMuIEkgY2FuIGRvIHRoYXQgYW5kIHlvdSBjYW4ganVzdCBkcm9wIHRo
aXMgZmlsZS4KCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIHJlcXVpcmVkLW9wcHM6Cj4gKyAgICAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCj4gKyAgICBkZXNj
cmlwdGlvbjoKPiArICAgICAgVGhpcyBjb250YWlucyBwaGFuZGxlIHRvIGFuIE9QUCBub2RlIGlu
IGFub3RoZXIgZGV2aWNlJ3MgT1BQIHRhYmxlLgo+ICsgICAgICBJdCBtYXkgY29udGFpbiBhbiBh
cnJheSBvZiBwaGFuZGxlcywgd2hlcmUgZWFjaCBwaGFuZGxlIHBvaW50cyB0byBhbiBPUFAKPiAr
ICAgICAgb2YgYSBkaWZmZXJlbnQgZGV2aWNlLiBJdCBzaG91bGQgbm90IGNvbnRhaW4gbXVsdGlw
bGUgcGhhbmRsZXMgdG8gdGhlIE9QUAo+ICsgICAgICBub2RlcyBpbiB0aGUgc2FtZSBPUFAgdGFi
bGUuIFRoaXMgc3BlY2lmaWVzIHRoZSBtaW5pbXVtIHJlcXVpcmVkIE9QUAo+ICsgICAgICBvZiB0
aGUgZGV2aWNlKHMpLCB3aG9zZSBPUFAncyBwaGFuZGxlIGlzIHByZXNlbnQgaW4gdGhpcyBwcm9w
ZXJ0eSwKPiArICAgICAgZm9yIHRoZSBmdW5jdGlvbmluZyBvZiB0aGUgY3VycmVudCBkZXZpY2Ug
YXQgdGhlIGN1cnJlbnQgT1BQICh3aGVyZSB0aGlzCj4gKyAgICAgIHByb3BlcnR5IGlzIHByZXNl
bnQpLgo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICBsZWFreS1kZXZpY2VAMTIzNTAw
MDAgewo+ICsgICAgICBjb21wYXRpYmxlID0gImZvbyxpLWxlYWstY3VycmVudCI7Cj4gKyAgICAg
IHJlZyA9IDwweDEyMzUwMDAwIDB4MTAwMD47Cj4gKyAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnBv
d2VyIDA+Owo+ICsgICAgICBwb3dlci1kb21haW4tbmFtZXMgPSAiaW8iOwo+ICsgICAgfTsKPiAr
Cj4gKyAgICBsZWFreS1kZXZpY2VAMTIzNTEwMDAgewo+ICsgICAgICBjb21wYXRpYmxlID0gImZv
byxpLWxlYWstY3VycmVudCI7Cj4gKyAgICAgIHJlZyA9IDwweDEyMzUxMDAwIDB4MTAwMD47Cj4g
KyAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnBvd2VyIDA+LCA8JnBvd2VyIDE+IDsKPiArICAgICAg
cG93ZXItZG9tYWluLW5hbWVzID0gImlvIiwgImNsayI7Cj4gKyAgICB9Owo+ICsKPiArICAgIC8v
IFRoZSBmaXJzdCBleGFtcGxlIGFib3ZlIGRlZmluZXMgYSB0eXBpY2FsIFBNIGRvbWFpbiBjb25z
dW1lciBkZXZpY2UsIHdoaWNoIGlzCj4gKyAgICAvLyBsb2NhdGVkIGluc2lkZSBhIFBNIGRvbWFp
biB3aXRoIGluZGV4IDAgb2YgYSBwb3dlciBjb250cm9sbGVyIHJlcHJlc2VudGVkIGJ5IGEKPiAr
ICAgIC8vIG5vZGUgd2l0aCB0aGUgbGFiZWwgInBvd2VyIi4KPiArICAgIC8vIEluIHRoZSBzZWNv
bmQgZXhhbXBsZSB0aGUgY29uc3VtZXIgZGV2aWNlIGFyZSBwYXJ0aXRpb25lZCBhY3Jvc3MgdHdv
IFBNIGRvbWFpbnMsCj4gKyAgICAvLyB0aGUgZmlyc3Qgd2l0aCBpbmRleCAwIGFuZCB0aGUgc2Vj
b25kIHdpdGggaW5kZXggMSwgb2YgYSBwb3dlciBjb250cm9sbGVyIHRoYXQKPiArICAgIC8vIGlz
IHJlcHJlc2VudGVkIGJ5IGEgbm9kZSB3aXRoIHRoZSBsYWJlbCAicG93ZXIiLgo+ICsKPiArICAt
IHwKPiArICAgIC8vIEV4YW1wbGUgd2l0aCAgT1BQIHRhYmxlIGZvciBkb21haW4gcHJvdmlkZXIg
dGhhdCBwcm92aWRlcyB0d28gZG9tYWluczoKPiArCj4gKyAgICBkb21haW4wX29wcF90YWJsZTog
b3BwLXRhYmxlMCB7Cj4gKyAgICAgIGNvbXBhdGlibGUgPSAib3BlcmF0aW5nLXBvaW50cy12MiI7
Cj4gKwo+ICsgICAgICBkb21haW4wX29wcF8wOiBvcHAtMTAwMDAwMDAwMCB7Cj4gKyAgICAgICAg
b3BwLWh6ID0gL2JpdHMvIDY0IDwxMDAwMDAwMDAwPjsKPiArICAgICAgICBvcHAtbWljcm92b2x0
ID0gPDk3NTAwMCA5NzAwMDAgOTg1MDAwPjsKPiArICAgICAgfTsKPiArICAgICAgZG9tYWluMF9v
cHBfMTogb3BwLTExMDAwMDAwMDAgewo+ICsgICAgICAgIG9wcC1oeiA9IC9iaXRzLyA2NCA8MTEw
MDAwMDAwMD47Cj4gKyAgICAgICAgb3BwLW1pY3Jvdm9sdCA9IDwxMDAwMDAwIDk4MDAwMCAxMDEw
MDAwPjsKPiArICAgICAgfTsKPiArICAgIH07Cj4gKwo+ICsgICAgZG9tYWluMV9vcHBfdGFibGU6
IG9wcC10YWJsZTEgewo+ICsgICAgICBjb21wYXRpYmxlID0gIm9wZXJhdGluZy1wb2ludHMtdjIi
Owo+ICsKPiArICAgICAgZG9tYWluMV9vcHBfMDogb3BwLTEyMDAwMDAwMDAgewo+ICsgICAgICAg
IG9wcC1oeiA9IC9iaXRzLyA2NCA8MTIwMDAwMDAwMD47Cj4gKyAgICAgICAgb3BwLW1pY3Jvdm9s
dCA9IDw5NzUwMDAgOTcwMDAwIDk4NTAwMD47Cj4gKyAgICAgIH07Cj4gKyAgICAgIGRvbWFpbjFf
b3BwXzE6IG9wcC0xMzAwMDAwMDAwIHsKPiArICAgICAgICBvcHAtaHogPSAvYml0cy8gNjQgPDEz
MDAwMDAwMDA+Owo+ICsgICAgICAgIG9wcC1taWNyb3ZvbHQgPSA8MTAwMDAwMCA5ODAwMDAgMTAx
MDAwMD47Cj4gKyAgICAgIH07Cj4gKyAgICB9Owo+ICsKPiArICAgIHBvd2VyOiBwb3dlci1jb250
cm9sbGVyQDEyMzQwMDAwIHsKPiArICAgICAgY29tcGF0aWJsZSA9ICJmb28scG93ZXItY29udHJv
bGxlciI7Cj4gKyAgICAgIHJlZyA9IDwweDEyMzQwMDAwIDB4MTAwMD47Cj4gKyAgICAgICNwb3dl
ci1kb21haW4tY2VsbHMgPSA8MT47Cj4gKyAgICAgIG9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmRv
bWFpbjBfb3BwX3RhYmxlPiwgPCZkb21haW4xX29wcF90YWJsZT47Cj4gKyAgICB9Owo+ICsKPiAr
ICAgIGxlYWt5LWRldmljZTBAMTIzNTAwMDAgewo+ICsgICAgICBjb21wYXRpYmxlID0gImZvbyxp
LWxlYWstY3VycmVudCI7Cj4gKyAgICAgIHJlZyA9IDwweDEyMzUwMDAwIDB4MTAwMD47Cj4gKyAg
ICAgIHBvd2VyLWRvbWFpbnMgPSA8JnBvd2VyIDA+Owo+ICsgICAgICByZXF1aXJlZC1vcHBzID0g
PCZkb21haW4wX29wcF8wPjsKPiArICAgIH07Cj4gKwo+ICsgICAgbGVha3ktZGV2aWNlMUAxMjM1
MDAwMCB7Cj4gKyAgICAgIGNvbXBhdGlibGUgPSAiZm9vLGktbGVhay1jdXJyZW50IjsKPiArICAg
ICAgcmVnID0gPDB4MTIzNTAwMDAgMHgxMDAwPjsKPiArICAgICAgcG93ZXItZG9tYWlucyA9IDwm
cG93ZXIgMT47Cj4gKyAgICAgIHJlcXVpcmVkLW9wcHMgPSA8JmRvbWFpbjFfb3BwXzE+Owo+ICsg
ICAgfTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRu
YXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
