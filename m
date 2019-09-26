Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8037C0666
	for <lists+etnaviv@lfdr.de>; Fri, 27 Sep 2019 15:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B906E134;
	Fri, 27 Sep 2019 13:36:48 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F586ED1A
 for <etnaviv@lists.freedesktop.org>; Thu, 26 Sep 2019 13:10:04 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id v2so6261508iob.10
 for <etnaviv@lists.freedesktop.org>; Thu, 26 Sep 2019 06:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FZIPxOACSyBTtRH5A7Lgyz9YR30y4W13jpD2I+1mgJM=;
 b=saJ2dxVMFfbRZ1+VgrGX+iGV9H3uEMyqLUN2ymP+r3ebteXPfQsyR8XU64UUXrtdpB
 SSIOaFnUfEvoCCsO3kxip63lyW0aWUV/UiAGd6orhFcQrv1Y8KqMhnGKf/J9o67AElGx
 BnBYpqPaH0SVYL86RcMZh5BNXkiqEujqqJWN4RjtVoI0uLzeNTrX8l7YfKysQvu3vsw2
 OiJqYZH7ZTEoeVOIavGUzDHAcM8lSd/+OkbRZzfUsTQbEX0K2CPXdL0H0qvFjjVSrPWX
 QktP2owGCDpr4lWlQ2ckc97Nxg2ClV/xatBhRVNxojQXAr2fjLSDq36YQca9cJF/rvIt
 PCPg==
X-Gm-Message-State: APjAAAVqtFTiNFP4biZN8IsI0EANTKjztjoKQwAmcPTGW9P9wJTxxa4+
 loKMtpkbw0kP8ILwuTurXqttOlwZP4J98qnGxpM=
X-Google-Smtp-Source: APXvYqzlyCi4JSGY6XghEeQ/E8vAIH7ViuIHrzxvUyMsua1GZWLVjXjlSiGwrvjIiebbaCWFI8rRhtB8cjRotnhYNKg=
X-Received: by 2002:a6b:d601:: with SMTP id w1mr3118098ioa.158.1569503404009; 
 Thu, 26 Sep 2019 06:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
In-Reply-To: <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 26 Sep 2019 08:09:52 -0500
Message-ID: <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Approved-At: Fri, 27 Sep 2019 13:36:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FZIPxOACSyBTtRH5A7Lgyz9YR30y4W13jpD2I+1mgJM=;
 b=M0MOZVUz4t6WU55SoJjNSOp7QYn65o/NCOkDutq5p4891fxVHa6jIYc0GzSPoE5NgC
 Y/F31CMUMd8X4Qdqfc4MGmYyhNuR+uHG233WadTHQa0xsWxFJv5rl8RVwaE3bu3pB7qr
 wri0795JXn4yi9BdL9A4kIX8Eq3Xd1Myt3BkKJ+99RFh8if3n6D0lMDd1/A4PUTHHLSY
 mi041pBhTLwJRt9cj7XQ/sDkCPZZAFKFgXm6Ri5VzL7A0Gk1JZg/oHQRycR2/sZb03c2
 lzEE4rwwCW+uRuqgQOz+nrJU3ZVzQbE+b9nB1IS53yKZV5lYYrQXdFhuW1+ZKBjhKOVA
 lysg==
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

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTA6MTcgQU0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDk6MTcgQU0gQWRh
bSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBJIHRyaWVkIGNtYT0yNTZN
IGFuZCBub3RpY2VkIHRoZSBjbWEgZHVtcCBhdCB0aGUgYmVnaW5uaW5nIGRpZG4ndAo+ID4gY2hh
bmdlLiAgRG8gd2UgbmVlZCB0byBzZXR1cCBhIHJlc2VydmVkLW1lbW9yeSBub2RlIGxpa2UKPiA+
IGlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIGRpZD8KPgo+IEkgZG9uJ3QgdGhpbmsgc28uCj4KPiBX
ZXJlIHlvdSBhYmxlIHRvIGlkZW50aWZ5IHdoYXQgd2FzIHRoZSBleGFjdCBjb21taXQgdGhhdCBj
YXVzZWQgc3VjaCByZWdyZXNzaW9uPwoKSSB3YXMgYWJsZSB0byBuYXJyb3cgaXQgZG93biB0aGUg
OTJkMTJmOTU0NGI3ICgibWVtYmxvY2s6IHJlZmFjdG9yCmludGVybmFsIGFsbG9jYXRpb24gZnVu
Y3Rpb25zIikgdGhhdCBjYXVzZWQgdGhlIHJlZ3Jlc3Npb24gd2l0aApFdG5hdml2LgoKSSBhbHNv
IG5vdGljZWQgdGhhdCBpZiBJIGNyZWF0ZSBhIHJlc2VydmVkIG1lbW9yeSBub2RlIGFzIHdhcyBk
b25lIG9uZQppbXg2dWwtY2NpbXg2dWxzb20uZHRzaSB0aGUgM0Qgc2VlbXMgdG8gd29yayBhZ2Fp
biwgYnV0IHdpdGhvdXQgaXQsIEkKd2FzIGdldHRpbmcgZXJyb3JzIHJlZ2FyZGxlc3Mgb2YgdGhl
ICdjbWE9MjU2TScgb3Igbm90LgpJIGRvbid0IGhhdmUgYSBwcm9ibGVtIHVzaW5nIHRoZSByZXNl
cnZlZCBtZW1vcnksIGJ1dCBJIGd1ZXNzIEkgYW0gbm90CnN1cmUgd2hhdCB0aGUgYW1vdW50IHNo
b3VsZCBiZS4gIEkga25vdyBmb3IgdGhlIHZpZGVvIGRlY29kaW5nIDEwODBwLApJIGhhdmUgaGlz
dG9yaWNhbGx5IHVzZWQgY21hPTEyOE0sIGJ1dCB3aXRoIHRoZSAzRCBhbHNvIG5lZWRpbmcgc29t
ZQptZW1vcnkgYWxsb2NhdGlvbiwgaXMgdGhhdCBlbm91Z2ggb3Igc2hvdWxkIEkgdXNlIDI1Nk0/
CgphZGFtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0
bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
