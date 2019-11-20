Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF3105127
	for <lists+etnaviv@lfdr.de>; Thu, 21 Nov 2019 12:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5906EDDD;
	Thu, 21 Nov 2019 11:10:30 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFC96E9A3;
 Wed, 20 Nov 2019 01:27:05 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 429CF2245C;
 Wed, 20 Nov 2019 01:27:05 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id r14so12121352lff.3;
 Tue, 19 Nov 2019 17:27:05 -0800 (PST)
X-Gm-Message-State: APjAAAUPvfLsSz366UaPA2vhNr5qtbaGp0TNEXUUtq4OyAQavojYXmXB
 t1q0QvtE8TmrvRclPkBwl61o6k3SgkWtbLgVrII=
X-Google-Smtp-Source: APXvYqwRCZuOLwwW4yV+7MFk/VIFl8MVP82eHlcf4qaQKdX30EKfsryD1YdVJwUyn/6jRxu7hGaF3j94H2BVMIxjCZE=
X-Received: by 2002:a19:da1a:: with SMTP id r26mr450883lfg.60.1574213223486;
 Tue, 19 Nov 2019 17:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20191119144315.11261-1-krzk@kernel.org>
 <CAL_Jsq+1hHneSW5DzLNxU00AqQJ49chTyULJ0S3JR-CqfOfTgA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+1hHneSW5DzLNxU00AqQJ49chTyULJ0S3JR-CqfOfTgA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 20 Nov 2019 09:26:51 +0800
X-Gmail-Original-Message-ID: <CAJKOXPep1ftnw0gGEtzmSZaZBaAiyDhCsVygRfNAQ4egiJK1tA@mail.gmail.com>
Message-ID: <CAJKOXPep1ftnw0gGEtzmSZaZBaAiyDhCsVygRfNAQ4egiJK1tA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Fix path to power-domain.txt bindings
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Thu, 21 Nov 2019 11:10:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574213225;
 bh=D7abHCeD4TPvV2CC5GlYUE+dpzX7mKsMT4oa0/yvIRw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eOnkCcpi3XzYZrccf26EVRVyjaGrzkJM2FuzIDz2a6nLVVzbAKGJvodiPcmIUpL3n
 gvLbf/JklQkvF0ImVVa7jx4efmK2auYAzjeEnnvBU1Q65nizUJ4S0UKbhUJEeKDjdz
 rdCWWF+ApEM0lz17r/TTjMw7fMaTerpB/fD8csH0=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 Linux USB List <linux-usb@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, PCI <linux-pci@vger.kernel.org>,
 linux-tegra@vger.kernel.org, freedreno <freedreno@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gV2VkLCAyMCBOb3YgMjAxOSBhdCAwMTowMiwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE5vdiAxOSwgMjAxOSBhdCA4OjQzIEFNIEtyenlzenRvZiBL
b3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gV2l0aCBzcGxpdCBvZiBw
b3dlciBkb21haW4gY29udHJvbGxlciBiaW5kaW5ncyB0byBwb3dlci1kb21haW4ueWFtbCwgdGhl
Cj4gPiBjb25zdW1lciBwYXJ0IHdhcyByZW5hbWVkIHRvIHBvd2VyLWRvbWFpbi50eHQuICBVcGRh
dGUgdGhlIHJlZmVyZW5jZXMgaW4KPiA+IG90aGVyIGJpbmRpbmdzLgo+ID4KPiA+IFJlcG9ydGVk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+ID4gRml4ZXM6
IGFiYjQ4MDVlMzQzYSAoImR0LWJpbmRpbmdzOiBwb3dlcjogQ29udmVydCBTYW1zdW5nIEV4eW5v
cyBQb3dlciBEb21haW4gYmluZGluZ3MgdG8ganNvbi1zY2hlbWEiKQo+ID4gU2lnbmVkLW9mZi1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Nsay1leHlub3MtYXVkc3MudHh0
ICB8IDIgKy0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svZXh5
bm9zNTQzMy1jbG9jay50eHQgIHwgMiArLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Ns
b2NrL3JlbmVzYXMscjhhNzc3OC1jcGctY2xvY2tzLnR4dCAgfCAyICstCj4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svcmVuZXNhcyxyOGE3Nzc5LWNwZy1jbG9ja3MudHh0ICB8IDIg
Ky0KPiA+ICAuLi4vYmluZGluZ3MvY2xvY2svcmVuZXNhcyxyY2FyLWdlbjItY3BnLWNsb2Nrcy50
eHQgICAgICAgICAgIHwgMiArLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3Jl
bmVzYXMscnotY3BnLWNsb2Nrcy50eHQgICAgICAgfCAyICstCj4gPiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9ldG5hdml2L2V0bmF2aXYtZHJtLnR4dCAgICAgICB8IDIgKy0KPiA+
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHB1LnR4dCAg
ICAgICAgIHwgMiArLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9tZHA1LnR4dCAgICAgICAgfCAyICstCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2RzcC9mc2wsZHNwLnlhbWwgICAgICAgICAgICB8IDIgKy0KPiA+ICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaW14Ny1taXBpLWNzaTIudHh0ICAg
IHwgMiArLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLWpwZWct
ZGVjb2Rlci50eHQgICAgICAgfCAyICstCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL21lZGlhdGVrLW1kcC50eHQgICAgICB8IDIgKy0KPiA+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvb3BwL3Fjb20tbnZtZW0tY3B1ZnJlcS50eHQgIHwgMiAr
LQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvcGNpLWtleXN0b25l
LnR4dCAgICAgICAgfCAyICstCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BoeS90aSxwaHktYW02NTQtc2VyZGVzLnR4dCB8IDIgKy0KPiA+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcWNvbSxycG1wZC50eHQgICAgICAgIHwgMiArLQo+ID4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9yZW5lc2FzLHJjYXItc3lz
Yy50eHQgfCAyICstCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL252aWRpYSx0ZWdy
YTEyNC14dXNiLnR4dCAgICAgICAgICB8IDQgKystLQo+ID4gIDE5IGZpbGVzIGNoYW5nZWQsIDIw
IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+Cj4gUGxlYXNlIG5vLiBDYW4geW91IGp1
c3QgdW5kbyB0aGUgcmVuYW1pbmcgYmFjayB0byBwb3dlcl9kb21haW4udHh0CgpUaGUgcmVuYW1p
bmcgd2FzIGRvbmUgdG8gbWFrZSBpdCBjb25zaXN0ZW50IHdpdGggeWFtbCBhbmQgb3RoZXIKYmlu
ZGluZ3MgYnV0IGluZGVlZCBpdCBjcmVhdGVzIHNvbWUgY2h1cm4uLi4gSSdsbCBzZW5kIHJlbmFt
ZS11bmRvCnRoZW4uCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2V0bmF2aXY=
