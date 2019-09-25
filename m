Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB5C066F
	for <lists+etnaviv@lfdr.de>; Fri, 27 Sep 2019 15:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922C56E134;
	Fri, 27 Sep 2019 13:37:14 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED556E02A
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Sep 2019 12:12:11 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y23so5368907lje.9
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Sep 2019 05:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hUmVUwvSY/aeCErtOWtkiU7kxhgjU/DkZwXUVKfeXYI=;
 b=CbaBFx/qfXMfLnTra+sba9XuEmHcnLC2IevXAXYliMtvFA31ROA4Wv0Oqz8RFYEJCn
 NllcF49UK6ngpO1K57/8IYwFlwGw3ItdMD+uZisNDClVDJPy7xYfVJ6laClfGkb2Cgpd
 JxbdtOQiOzJK3j5cbSJUpiAePSMiRbHvgPuoFUm+9NfD0y38bH4S9Ikf9oTG82wBSua5
 VpVe9yz/VCFuVjzcgU0oZCHqL09u9h6qyaDwvRzC2AFowxD6KgCfGHRos+e4Jm9PQlIg
 AgbmdsW1cIDiGRjgvJpmyHpfsl2ApSUWSHPVU+jD4Pq9yj5lMVhVyBo5BEovNuTllAH2
 y+Jw==
X-Gm-Message-State: APjAAAUnV8zPkg5V418RMCfXylOIkS0cihFukyDKduvjA73xVKinhZru
 JVXCrYfva2ypaRz+cdnBmBleFSWyIu2lvafKRF4=
X-Google-Smtp-Source: APXvYqyQ9DDK1T7Dnq+bpI71Ik4P0Io7FbZdAq9brFueaElkRY2A7GJR4saQwrvMTiDWN1ujjgcBluE//8NebHfr57o=
X-Received: by 2002:a2e:a316:: with SMTP id l22mr6207823lje.211.1569413529490; 
 Wed, 25 Sep 2019 05:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
In-Reply-To: <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Sep 2019 09:12:18 -0300
Message-ID: <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
To: Adam Ford <aford173@gmail.com>
X-Mailman-Approved-At: Fri, 27 Sep 2019 13:37:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hUmVUwvSY/aeCErtOWtkiU7kxhgjU/DkZwXUVKfeXYI=;
 b=e0naPQpnh4JE/4pzdBeJlRoIgqUi6C/PmOHgsKHfsCSmwrfN9C/j9k46bbLakdQgtK
 NzyyALh2M4uqHkB4On8gEHIrvbwKUNNiu3zZ2lOeoXUiFudrKwoaCTbU97PgilT1l5iG
 BNvpNxJ3L2WwmKsrub8I/gHS221tUzLfviv94tbG+vMGMDoFLa5u8CB7VOGTEKPYce1l
 Cf3u6sYzxHRkaIjp/6i4jUz79T0kliSiD1RIQYnsEdRcWu0lLuAcfKmvxGsweCWvJ0nX
 0eOjvMQ1r+HHshdYbA3cDvsghoueNpOxeniug7pMPTULgl1lMmy+tRc55+GZxrbOt31A
 IWMQ==
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

SGkgQWRhbSwKCk9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDY6MzggQU0gQWRhbSBGb3JkIDxhZm9y
ZDE3M0BnbWFpbC5jb20+IHdyb3RlOgoKPiBJIGtub3cgaXQncyByYXRoZXIgbGF0ZSwgYnV0IHRo
aXMgcGF0Y2ggYnJva2UgdGhlIEV0bmF2aXYgM0QgZ3JhcGhpY3MKPiBpbiBteSBpLk1YNlEuCj4K
PiBXaGVuIEkgdHJ5IHRvIHVzZSB0aGUgM0QsIGl0IHJldHVybnMgc29tZSBlcnJvcnMgYW5kIHRo
ZSBkbWVzZyBsb2cKPiBzaG93cyBzb21lIG1lbW9yeSBhbGxvY2F0aW9uIGVycm9ycyB0b286Cj4g
WyAgICAzLjY4MjM0N10gZXRuYXZpdiBldG5hdml2OiBib3VuZCAxMzAwMDAuZ3B1IChvcHMgZ3B1
X29wcykKPiBbICAgIDMuNjg4NjY5XSBldG5hdml2IGV0bmF2aXY6IGJvdW5kIDEzNDAwMC5ncHUg
KG9wcyBncHVfb3BzKQo+IFsgICAgMy42OTUwOTldIGV0bmF2aXYgZXRuYXZpdjogYm91bmQgMjIw
NDAwMC5ncHUgKG9wcyBncHVfb3BzKQo+IFsgICAgMy43MDA4MDBdIGV0bmF2aXYtZ3B1IDEzMDAw
MC5ncHU6IG1vZGVsOiBHQzIwMDAsIHJldmlzaW9uOiA1MTA4Cj4gWyAgICAzLjcyMzAxM10gZXRu
YXZpdi1ncHUgMTMwMDAwLmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+IG1lbW9y
eSB3aW5kb3cKPiBbICAgIDMuNzMxMzA4XSBldG5hdml2LWdwdSAxMzQwMDAuZ3B1OiBtb2RlbDog
R0MzMjAsIHJldmlzaW9uOiA1MDA3Cj4gWyAgICAzLjc1MjQzN10gZXRuYXZpdi1ncHUgMTM0MDAw
LmdwdTogY29tbWFuZCBidWZmZXIgb3V0c2lkZSB2YWxpZAo+IG1lbW9yeSB3aW5kb3cKClRoaXMg
bG9va3Mgc2ltaWxhciB0byB3aGF0IHdhcyByZXBvcnRlZCBhdDoKaHR0cHM6Ly9idWdzLmZyZWVk
ZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExNzg5CgpEb2VzIGl0IGhlbHAgaWYgeW91IHVz
ZSB0aGUgc2FtZSBzdWdnZXN0aW9uIGFuZCBwYXNzIGNtYT0yNTZNIGluIHlvdXIKa2VybmVsIGNv
bW1hbmQgbGluZT8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
