Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70856C0670
	for <lists+etnaviv@lfdr.de>; Fri, 27 Sep 2019 15:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4906E136;
	Fri, 27 Sep 2019 13:37:15 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9887289D2E
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Sep 2019 15:17:21 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v24so6087907ljj.3
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Sep 2019 08:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTBq6P5OxsGLjoGVhyAwZM8k0vklyHGTB2oJI82Er7M=;
 b=oEMyFVRjG8jRwqqq79nDwbyjSjDMHOGMNSJu1Nr3CA6VQd97DV+Whc3oDvhmBc1/CJ
 B8O45OdWLAh5Ry0+VNkmtS8+3vna8B80BOkqzlA99mbJhiClqVgMXrsXMX+DkFpXdBSa
 NaYLT+JgMymS3IhUPObBKvHmGb7P4V+kmB0xeVYYW73VuL55sonI0Co0PNt7H2yKwDtP
 HHuOKV3TVJjzvM/JzVj//VL/xJMBVwyYogg+wjoVvta/9NviIW2Sat4POtNSLYRSphEx
 7OeMcm+w++O0UV3MK/XPXMFlmBVUj2SjBrKZjYBoXzEtuwsmW8tdQmDZOFYCyZU77C/N
 /7sA==
X-Gm-Message-State: APjAAAUJwWe+d1BqKsO9nzNFytiDbK8PT8fwg5K8FDcG7KO1PEDKy7C+
 ISXgUv+aOU/E1VFo5TPuH4O/MWP4zf0WErtoji0=
X-Google-Smtp-Source: APXvYqzF1RqhBAB47TPrTDl3zKUBxVzKbXcvNvcrU2oxqh5sJKOV3USfSG9GeeJJkpUMrG8FnoJZki1WHtkUnydqfw8=
X-Received: by 2002:a2e:b0f4:: with SMTP id h20mr1893730ljl.10.1569424639817; 
 Wed, 25 Sep 2019 08:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
In-Reply-To: <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Sep 2019 12:17:28 -0300
Message-ID: <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
To: Adam Ford <aford173@gmail.com>
X-Mailman-Approved-At: Fri, 27 Sep 2019 13:37:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rTBq6P5OxsGLjoGVhyAwZM8k0vklyHGTB2oJI82Er7M=;
 b=eghD7xF1O36vsBrF3R1Ol+O9tfU+0jO9JXTPAGDQj/eD9TEB4fS0VQFijoygPStgr3
 10lJjOrWc1bicRYqBtncYZdXUVZQzGo/mCRUFcwwwv+kexKbN1ES5l5Ac30Iyy/VSy6b
 zUdkmBZi6iQtLRd1ksj9hb1AR/76sVMVefmq8BgklCKkDi+tVqaxFM4AvBWSG3sKDCRC
 NPA4lDaeoCpS8CsgLxRZg802nWrQPQecGCdXqYctiynPyMIAzYncAW7BXnLuqZdmqiq7
 lmNY1mZLDVoPD5SAcNNPdqQCcypDkXcAg+PaiFPMbfZqC2X+xM6M1pHyx+WOo3XdPYs0
 eCpw==
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

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgOToxNyBBTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWls
LmNvbT4gd3JvdGU6Cgo+IEkgdHJpZWQgY21hPTI1Nk0gYW5kIG5vdGljZWQgdGhlIGNtYSBkdW1w
IGF0IHRoZSBiZWdpbm5pbmcgZGlkbid0Cj4gY2hhbmdlLiAgRG8gd2UgbmVlZCB0byBzZXR1cCBh
IHJlc2VydmVkLW1lbW9yeSBub2RlIGxpa2UKPiBpbXg2dWwtY2NpbXg2dWxzb20uZHRzaSBkaWQ/
CgpJIGRvbid0IHRoaW5rIHNvLgoKV2VyZSB5b3UgYWJsZSB0byBpZGVudGlmeSB3aGF0IHdhcyB0
aGUgZXhhY3QgY29tbWl0IHRoYXQgY2F1c2VkIHN1Y2ggcmVncmVzc2lvbj8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QK
ZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
