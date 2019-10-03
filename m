Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C152CB014
	for <lists+etnaviv@lfdr.de>; Thu,  3 Oct 2019 22:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D936EA77;
	Thu,  3 Oct 2019 20:24:13 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AC46EA06
 for <etnaviv@lists.freedesktop.org>; Thu,  3 Oct 2019 14:46:19 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id c25so6056022iot.12
 for <etnaviv@lists.freedesktop.org>; Thu, 03 Oct 2019 07:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TdbwXuh5bV4qEcKvgZf01HKoOU3JMuTQzHSwqy4Er+0=;
 b=sBr+i+RGOkctMwke3jS9Ci1AzdK+d8uoo9WKESovK3io6YtjyDwhbqcs8PwO+ghcL8
 7A2SuGhGrfIO8oyvdGqcw0p+92zbstI4itZgc99JxQeB+zAn6vBb7mPm88i9y1cpD30p
 YmjTM98gWpNwJEeiXmBL6atEUnBQYMKnXs5xkJmrWVfsyrQA2Pqfu0nf5upAakfBVm2b
 2ho7pxS8pMOXLV6edFPzjtGOvvb1nBvlEdSK9l2RrV43vbOUekzlnOdx1lscvox59HbS
 PXwJEjftdcIf+wonXnHDg9OYFQ7YhlIJFJdRtgUatj2LDL+PV06k+SuBTzIod0lSLCJ0
 KhyA==
X-Gm-Message-State: APjAAAW8HUNIwdiHgQmnZrORvfZMkZobcFDPX75uUAe4D2IQLSPU6xeO
 JzzW1gckMU2KzPwaGsusbzRuSoGZMQPn/cLU4ak=
X-Google-Smtp-Source: APXvYqxLMMgyZmfknk/IaEbgrSuiiQdukVSe/Iyrfs/A49rS7Vf3MxtQ6d9wEfSV7Z7KPhphxtCUN0yer77GhWPg8DM=
X-Received: by 2002:a6b:8f4b:: with SMTP id r72mr8544912iod.43.1570113978710; 
 Thu, 03 Oct 2019 07:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
 <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
 <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
 <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
 <20191002073605.GA30433@linux.ibm.com>
 <CAHCN7xL1MkJh44N3W_1+08DHmX__SqnfH6dqUzYzr2Wpg0kQyQ@mail.gmail.com>
 <20191003053451.GA23397@linux.ibm.com>
 <20191003084914.GV25745@shell.armlinux.org.uk>
In-Reply-To: <20191003084914.GV25745@shell.armlinux.org.uk>
From: Chris Healy <cphealy@gmail.com>
Date: Thu, 3 Oct 2019 07:46:06 -0700
Message-ID: <CAFXsbZrLkjsda8oM4SG6LOpfu7a=vwJ7eGM-FL8dzCKb0yzy5w@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 03 Oct 2019 20:24:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TdbwXuh5bV4qEcKvgZf01HKoOU3JMuTQzHSwqy4Er+0=;
 b=e7rKLSrBU31at0uyKHw4kyJZiHmcMTUe49QEUNESNUa9syxwp7qu4QKioB50Y7wCq8
 e5KlDYUq4dpgJ5kLM3dl/hfh2fX3F1j4aboffPUX7GAPW5zl92o09lYa891tzm2BpX4I
 yEdnK53WgNclgiJsvIDzGw4ENp33KQmOuvIYv/sHKTdZMIcjpIwFEVFTLEqZ6P6SDMGa
 w+xxvKyISxBiP1u/gKUnZNfqKHtm59VHZyTJymIAuL3jEJToUpr6dgh8WBjN9BlPLixL
 uo6ymwGL1x3mZ5xz6xA6bT2ZKN+Vh40je10c1uE2aD9aP0x4mJQ3luKQO48VbvmM+igE
 0PqQ==
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Adam Ford <aford173@gmail.com>,
 Christoph Hellwig <hch@lst.de>, arm-soc <linux-arm-kernel@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Pgo+IFRoZSBpTVg2IGRvZXMgbm90IGhhdmUgTU1VdjIgaGFyZHdhcmUsIGl0IGhhcyBNTVV2MS4g
IFdpdGggTU1VdjEKPiBoYXJkd2FyZSByZXF1aXJlcyBjb21tYW5kIGJ1ZmZlcnMgd2l0aGluIHRo
ZSBmaXJzdCAyR2lCIG9mIHBoeXNpY2FsCj4gUkFNLgo+CkkgdGhvdWdodCB0aGF0IHRoZSBpLk1Y
NnEgaGFzIHRoZSBNTVV2MSBhbmQgR0MyMDAwIEdQVSB3aGlsZSB0aGUKaS5NWDZxcCBoYXMgdGhl
IE1NVXYyIGFuZCBHQzMwMDA/ICBNZWFuaW5nIHRoZSBpLk1YNiBoYXMgYm90aCBNTVV2MQphbmQg
TU1VdjIgZGVwZW5kaW5nIG9uIHdoaWNoIGkuTVg2IHBhcnQgd2UgYXJlIHRhbGtpbmcgYWJvdXQu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYg
bWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
