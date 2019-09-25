Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6316CC0667
	for <lists+etnaviv@lfdr.de>; Fri, 27 Sep 2019 15:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009CB6E136;
	Fri, 27 Sep 2019 13:36:49 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AC189E3F
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Sep 2019 12:17:13 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q1so13233966ion.1
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Sep 2019 05:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y4RvotBfrNK4XtLNNLx8Pazo7kMyOm8WMNbLFH6FEEU=;
 b=g/mM0brnYdq7cT2Yf2D2COw0n3G9fhZuUl58q4NfXvI8Q4N/Nddv76dkPK5UjTiIxi
 Ink5CfjOaXJgbdYI2/bfgF0vljXu5K8AHFJVLLMU7y5F8/JWQPmSASkUcrp/8ngQB4yw
 yWRQoGoPAjyxaLZL29eIE2fQM3OEuhwXCZfDjlxI3ZUyOMideBEzGmQKH4dMd+990iGu
 RAcDrNesPZaIzSAJZ0+JYavV8Gl0ubIrnWmveHE9suiHqHWYU5XexQWQyVOQDorJttUI
 boNDwOR9VRy8qDJisi9zb/VLf/82IOxiG3LfHIR/QgTsxlFfxAf2POBNXxtME7NLRa3v
 8SWQ==
X-Gm-Message-State: APjAAAUWq3kyKhYsQv0MTVd8naX5e+aYVCqNPEPc66DJpn9iNgVoWR3q
 IZiRiBthg72RC25Pl7v6ba1D10p+QPlk+Ogkjh4=
X-Google-Smtp-Source: APXvYqxS45l3zihhw3tYCzgwBmyCEU+INEqloepYzMma/aNO63dr/UcHcVyi8UcvHnJD8dRs3xdWT6wqG8jXwm/qXD0=
X-Received: by 2002:a02:65cd:: with SMTP id u196mr4900191jab.3.1569413832794; 
 Wed, 25 Sep 2019 05:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
In-Reply-To: <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 25 Sep 2019 07:17:02 -0500
Message-ID: <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Approved-At: Fri, 27 Sep 2019 13:36:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Y4RvotBfrNK4XtLNNLx8Pazo7kMyOm8WMNbLFH6FEEU=;
 b=iUVK92GEmBGCZJyRo/Zd1KGKYtVYyBQQZ/qadZsMHtgdBqOIEJTGes/jFXUJbsxPYf
 arbgI67CVRtjqzv9KbtoPjbnRd+NNaoZROuAK65Afp+qrjeu4taq1FiOikitUOgqwDx8
 fioo5IrGYuhVH0YvNqEwrFk0OelIti4ramwaMIdGU4NyJep+562IHM+KmC8sSycW/lGl
 6hw22I7QH199NqTHihVI1jILF/7aomQpGPobiyR3J6OdLD8RebyLMuWN2U0+NXMFCX56
 jcF4Oyc8LIMBAV7TynSwH8rI44zROllFOPxhK0YNDBYQo27LHn7/o72CQFX3jXNFDaC5
 kGHQ==
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Chris Healy <cphealy@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgNzoxMiBBTSBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQWRhbSwKPgo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0
IDY6MzggQU0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBJIGtu
b3cgaXQncyByYXRoZXIgbGF0ZSwgYnV0IHRoaXMgcGF0Y2ggYnJva2UgdGhlIEV0bmF2aXYgM0Qg
Z3JhcGhpY3MKPiA+IGluIG15IGkuTVg2US4KPiA+Cj4gPiBXaGVuIEkgdHJ5IHRvIHVzZSB0aGUg
M0QsIGl0IHJldHVybnMgc29tZSBlcnJvcnMgYW5kIHRoZSBkbWVzZyBsb2cKPiA+IHNob3dzIHNv
bWUgbWVtb3J5IGFsbG9jYXRpb24gZXJyb3JzIHRvbzoKPiA+IFsgICAgMy42ODIzNDddIGV0bmF2
aXYgZXRuYXZpdjogYm91bmQgMTMwMDAwLmdwdSAob3BzIGdwdV9vcHMpCj4gPiBbICAgIDMuNjg4
NjY5XSBldG5hdml2IGV0bmF2aXY6IGJvdW5kIDEzNDAwMC5ncHUgKG9wcyBncHVfb3BzKQo+ID4g
WyAgICAzLjY5NTA5OV0gZXRuYXZpdiBldG5hdml2OiBib3VuZCAyMjA0MDAwLmdwdSAob3BzIGdw
dV9vcHMpCj4gPiBbICAgIDMuNzAwODAwXSBldG5hdml2LWdwdSAxMzAwMDAuZ3B1OiBtb2RlbDog
R0MyMDAwLCByZXZpc2lvbjogNTEwOAo+ID4gWyAgICAzLjcyMzAxM10gZXRuYXZpdi1ncHUgMTMw
MDAwLmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+ID4gbWVtb3J5IHdpbmRvdwo+
ID4gWyAgICAzLjczMTMwOF0gZXRuYXZpdi1ncHUgMTM0MDAwLmdwdTogbW9kZWw6IEdDMzIwLCBy
ZXZpc2lvbjogNTAwNwo+ID4gWyAgICAzLjc1MjQzN10gZXRuYXZpdi1ncHUgMTM0MDAwLmdwdTog
Y29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+ID4gbWVtb3J5IHdpbmRvdwo+Cj4gVGhpcyBs
b29rcyBzaW1pbGFyIHRvIHdoYXQgd2FzIHJlcG9ydGVkIGF0Ogo+IGh0dHBzOi8vYnVncy5mcmVl
ZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMTc4OQo+Cj4gRG9lcyBpdCBoZWxwIGlmIHlv
dSB1c2UgdGhlIHNhbWUgc3VnZ2VzdGlvbiBhbmQgcGFzcyBjbWE9MjU2TSBpbiB5b3VyCj4ga2Vy
bmVsIGNvbW1hbmQgbGluZT8KCkkgdHJpZWQgY21hPTI1Nk0gYW5kIG5vdGljZWQgdGhlIGNtYSBk
dW1wIGF0IHRoZSBiZWdpbm5pbmcgZGlkbid0CmNoYW5nZS4gIERvIHdlIG5lZWQgdG8gc2V0dXAg
YSByZXNlcnZlZC1tZW1vcnkgbm9kZSBsaWtlCmlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIGRpZD8K
CmFkYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRu
YXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
