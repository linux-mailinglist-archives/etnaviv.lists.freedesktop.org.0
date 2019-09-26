Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07857C0668
	for <lists+etnaviv@lfdr.de>; Fri, 27 Sep 2019 15:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41DD6E140;
	Fri, 27 Sep 2019 13:36:49 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E4C8945A
 for <etnaviv@lists.freedesktop.org>; Thu, 26 Sep 2019 19:36:06 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n197so9592889iod.9
 for <etnaviv@lists.freedesktop.org>; Thu, 26 Sep 2019 12:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uv8sypDhr4ui+8J14AcrUpiwkTC+Ius1tZ05+vuLNHk=;
 b=ik7wGpLIDab9MsM7MsVF5u0QxFbSNp0med2naEQ4CcskopD7yq+aZ9bneyWRdmgVb6
 KjWFQR8TKSy2rvdJi0Jvv0i8jKZvxTSTRgfMwlp1bcpnyZNKlwmhNf8ggIOznTRVFyz9
 5b4aqH6LvSkc8ubkENqqaVhc6VFtamJVYjC/eOOe8SbNyL10t+kGiXbS3g3D+sIfjAx9
 XS9yW1xd7m4yASFw/Xz9roqFjohmSRysWEzEU5EisLtNT/oweSAsOyWNY+5RQckKdWSZ
 U+Y4VLxC8qq3HTJ0QR+qzlZnHVDO1uPVWXW2jZ2oJVt7kHdYZK0R/cD5YH4161KfJ7Se
 KZwA==
X-Gm-Message-State: APjAAAUgRhwX/dI72JONxt5fImStu9/0pr8Lfe43KPxsCjxNUq6q2GpQ
 J8bFI3jLTBXCf8ytvjXR32m+g9qx1Gi8SUv39H0=
X-Google-Smtp-Source: APXvYqz6Gzzz4fph8SDTgwR3nXuuRIG8y0wd6XvcO9/S+doLjWzArUyv9IHucQgjs6f3GvWFnHs+ZCUo69B6L3/gML4=
X-Received: by 2002:a92:9912:: with SMTP id p18mr378753ili.78.1569526565531;
 Thu, 26 Sep 2019 12:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
In-Reply-To: <20190926160433.GD32311@linux.ibm.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 26 Sep 2019 14:35:53 -0500
Message-ID: <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
To: Mike Rapoport <rppt@linux.ibm.com>
X-Mailman-Approved-At: Fri, 27 Sep 2019 13:36:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uv8sypDhr4ui+8J14AcrUpiwkTC+Ius1tZ05+vuLNHk=;
 b=lFVH4DJZInfXaRXpqmiMEK9WpeSM/1iq4W9bn5uziJHuNnpDS5uJfwrrSMkKUYaoWu
 tjIzRew236DgZA4ISwubGuuzdkMEJIbQ8yLo4Gw4blLNNqTUJXJQc2T8EmFOMMaE/MZN
 TWI21uIOpWZV0B6kiTUPUzXP+86XUqzfSXBes1IbztoB6sCaCe2+0vHVrK7I1YSyHTRf
 vUusvWxQUo6svZWbb5qWyg1vE5i/0/5lEgToMxkxJ7QF/bNuxlBlDbD6OXf3ku60x8mI
 qYDnylEQgvdyDcRtg2M6u1XUP8jT9lELn92+Mho67HMmT8OkOdOtqWogr7E2TIwC5RUe
 rt7w==
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
 Fabio Estevam <festevam@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org,
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

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTE6MDQgQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51
eC5pYm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDg6
MDk6NTJBTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkg
YXQgMTA6MTcgQU0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgOToxNyBBTSBBZGFtIEZvcmQgPGFmb3Jk
MTczQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gSSB0cmllZCBjbWE9MjU2TSBhbmQg
bm90aWNlZCB0aGUgY21hIGR1bXAgYXQgdGhlIGJlZ2lubmluZyBkaWRuJ3QKPiA+ID4gPiBjaGFu
Z2UuICBEbyB3ZSBuZWVkIHRvIHNldHVwIGEgcmVzZXJ2ZWQtbWVtb3J5IG5vZGUgbGlrZQo+ID4g
PiA+IGlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIGRpZD8KPiA+ID4KPiA+ID4gSSBkb24ndCB0aGlu
ayBzby4KPiA+ID4KPiA+ID4gV2VyZSB5b3UgYWJsZSB0byBpZGVudGlmeSB3aGF0IHdhcyB0aGUg
ZXhhY3QgY29tbWl0IHRoYXQgY2F1c2VkIHN1Y2ggcmVncmVzc2lvbj8KPiA+Cj4gPiBJIHdhcyBh
YmxlIHRvIG5hcnJvdyBpdCBkb3duIHRoZSA5MmQxMmY5NTQ0YjcgKCJtZW1ibG9jazogcmVmYWN0
b3IKPiA+IGludGVybmFsIGFsbG9jYXRpb24gZnVuY3Rpb25zIikgdGhhdCBjYXVzZWQgdGhlIHJl
Z3Jlc3Npb24gd2l0aAo+ID4gRXRuYXZpdi4KPgo+Cj4gQ2FuIHlvdSBwbGVhc2UgdGVzdCB3aXRo
IHRoaXMgY2hhbmdlOgo+CgpUaGF0IGFwcGVhcnMgdG8gaGF2ZSBmaXhlZCBteSBpc3N1ZS4gIEkg
YW0gbm90IHN1cmUgd2hhdCB0aGUgaW1wYWN0CmlzLCBidXQgaXMgdGhpcyBhIHNhZmUgb3B0aW9u
PwoKCmFkYW0KCj4gZGlmZiAtLWdpdCBhL21tL21lbWJsb2NrLmMgYi9tbS9tZW1ibG9jay5jCj4g
aW5kZXggN2Q0ZjYxYS4uMWY1YTBlYiAxMDA2NDQKPiAtLS0gYS9tbS9tZW1ibG9jay5jCj4gKysr
IGIvbW0vbWVtYmxvY2suYwo+IEBAIC0xMzU2LDkgKzEzNTYsNiBAQCBzdGF0aWMgcGh5c19hZGRy
X3QgX19pbml0IG1lbWJsb2NrX2FsbG9jX3JhbmdlX25pZChwaHlzX2FkZHJfdCBzaXplLAo+ICAg
ICAgICAgICAgICAgICBhbGlnbiA9IFNNUF9DQUNIRV9CWVRFUzsKPiAgICAgICAgIH0KPgo+IC0g
ICAgICAgaWYgKGVuZCA+IG1lbWJsb2NrLmN1cnJlbnRfbGltaXQpCj4gLSAgICAgICAgICAgICAg
IGVuZCA9IG1lbWJsb2NrLmN1cnJlbnRfbGltaXQ7Cj4gLQo+ICBhZ2FpbjoKPiAgICAgICAgIGZv
dW5kID0gbWVtYmxvY2tfZmluZF9pbl9yYW5nZV9ub2RlKHNpemUsIGFsaWduLCBzdGFydCwgZW5k
LCBuaWQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFn
cyk7Cj4KPiA+IEkgYWxzbyBub3RpY2VkIHRoYXQgaWYgSSBjcmVhdGUgYSByZXNlcnZlZCBtZW1v
cnkgbm9kZSBhcyB3YXMgZG9uZSBvbmUKPiA+IGlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIHRoZSAz
RCBzZWVtcyB0byB3b3JrIGFnYWluLCBidXQgd2l0aG91dCBpdCwgSQo+ID4gd2FzIGdldHRpbmcg
ZXJyb3JzIHJlZ2FyZGxlc3Mgb2YgdGhlICdjbWE9MjU2TScgb3Igbm90Lgo+ID4gSSBkb24ndCBo
YXZlIGEgcHJvYmxlbSB1c2luZyB0aGUgcmVzZXJ2ZWQgbWVtb3J5LCBidXQgSSBndWVzcyBJIGFt
IG5vdAo+ID4gc3VyZSB3aGF0IHRoZSBhbW91bnQgc2hvdWxkIGJlLiAgSSBrbm93IGZvciB0aGUg
dmlkZW8gZGVjb2RpbmcgMTA4MHAsCj4gPiBJIGhhdmUgaGlzdG9yaWNhbGx5IHVzZWQgY21hPTEy
OE0sIGJ1dCB3aXRoIHRoZSAzRCBhbHNvIG5lZWRpbmcgc29tZQo+ID4gbWVtb3J5IGFsbG9jYXRp
b24sIGlzIHRoYXQgZW5vdWdoIG9yIHNob3VsZCBJIHVzZSAyNTZNPwo+ID4KPiA+IGFkYW0KPgo+
IC0tCj4gU2luY2VyZWx5IHlvdXJzLAo+IE1pa2UuCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ldG5hdml2
