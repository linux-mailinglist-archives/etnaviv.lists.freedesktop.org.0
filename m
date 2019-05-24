Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A529784
	for <lists+etnaviv@lfdr.de>; Fri, 24 May 2019 13:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362C76E0FE;
	Fri, 24 May 2019 11:48:09 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92346E0D8;
 Fri, 24 May 2019 11:48:07 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id d128so5506153vsc.10;
 Fri, 24 May 2019 04:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JaaVD7BS0DFQOC/cZSLy88og4PwcqMW/kelh77DQNCE=;
 b=Zcwv5SyTFzSCdU2uX58qJzGP9JRTAi6vVvJMHlrPNy82+gvVRf+Q+7KLnaBWT/Wpce
 R5VaKc3HGUI0WAfpslh29KQ7ttWo2JPopS798b8ka3TTYs58LGURULS7jHtZq/dE/MT4
 j4h5heyZL1lPj+rH2a7HcX2U+IIAhniMQCALNocq77EthRuooFXFqgBIa7sbUBqxqvp/
 m9Nq5Ixgq+IKfAIJRUxTc4UjFkbyYg6FCSX7HstAH1EnMKAF615LLhzLpQ+JKcHHlNll
 vhaV8p3AFrBnKJUoL8hVG4sXFBDjaIwUiMBtfx9BAAJ4uY6eQZ8H6Ok8fQOBBMdPqL8U
 dxCA==
X-Gm-Message-State: APjAAAUqt9YDrwWF+NIxqCt3ljmrfCHJvV+OVq6ill3laeazVHSPvM0a
 yeyijYUyRuz30Wh/jdOX+KxeDtazbKtCQF4ao38=
X-Google-Smtp-Source: APXvYqwDiWO1PI/k3HR618fH6iOfSIIVh1EBOoqXO5DuyCEsg5jUCQ9j1jc366UKo6huJoirgLwZJGakzDZ1n6gqrUY=
X-Received: by 2002:a67:f547:: with SMTP id z7mr11016267vsn.72.1558698486799; 
 Fri, 24 May 2019 04:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190524104520.5706-1-christian.gmeiner@gmail.com>
 <20190524104520.5706-2-christian.gmeiner@gmail.com>
 <CAOMZO5AHuAFyej62wApPZ+iJ09UhpncWExFBHqONfOJk90DsKw@mail.gmail.com>
In-Reply-To: <CAOMZO5AHuAFyej62wApPZ+iJ09UhpncWExFBHqONfOJk90DsKw@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 24 May 2019 13:47:57 +0200
Message-ID: <CAH9NwWdzk-x=_YBGO2N+BhWzj0B2NwWRDskWdGkEvmWgjdXxXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] etnaviv: blt: s/TRUE/true && s/FALSE/false
To: Fabio Estevam <festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JaaVD7BS0DFQOC/cZSLy88og4PwcqMW/kelh77DQNCE=;
 b=qOvzd95OJifDPeW8e54Nt/V0BXsdKW9joCGDhyUSRb/vam81Gf+NonffcptqV58ghI
 lAXZYmuaDtFQWyHDxWeeK2qwfLAFY7KKwEFVO2HDkE7K/133bfbUu4+g3+Zr/Uu6CT0r
 3WTDrU1uqN0bNGwgpt2Xhb05TLCE1DQ6YUxmPn/8du0rKaPcLHCVoVJMAkiy47YiG9Jb
 iMu/5h7Fx2N9eBjBRBIEhsWO+hmvg/rYhX8q4V+1cKS+XcAoQZbY/q23lJ8EbvAEWsw9
 09qmJuh2vjMLgv18auK8sTNUo0lpfIduwLjhsVTUAONNH/Lz8kLlIUNuVt3L1EFnHDyY
 XbPg==
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgRmFiaW8sCgpBbSBGci4sIDI0LiBNYWkgMjAxOSB1bSAxMzoxMCBVaHIgc2NocmllYiBGYWJp
byBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Ogo+Cj4gSGkgQ2hyaXN0aWFuLAo+Cj4gT24g
RnJpLCBNYXkgMjQsIDIwMTkgYXQgNzo1MiBBTSBDaHJpc3RpYW4gR21laW5lcgo+IDxjaHJpc3Rp
YW4uZ21laW5lckBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+Cj4KPiBNYXliZSB5b3Ug
Y291bGQgcmVtb3ZlIHRoZSAnJiYgcy9GQUxTRS9mYWxzZScgZnJvbSB0aGUgU3ViamVjdCBzaW5j
ZQo+IHlvdSBhcmUgb25seSByZXBsYWNpbmcgdGhlIFRSVUUgb2NjdXJyZW5jZXMgaW4gdGhpcyBw
YXRjaC4KCkkgZm9yZ290IHRvIHNhdmUgdGhlIGZpbGUgZHVyaW5nIEZBTFNFIHJlcGxhY2VtZW50
LiBJIGhhdmUgdGhpcwp2ZXJzaW9uIGxvY2FsbHkgbm93OgoKLS0tLTg8LS0tLQoKLS0tIGEvc3Jj
L2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfYmx0LmMKKysrIGIvc3JjL2dhbGxpdW0v
ZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfYmx0LmMKQEAgLTM2Nyw3ICszNjcsNyBAQCBldG5hX3Ry
eV9ibHRfYmxpdChzdHJ1Y3QgcGlwZV9jb250ZXh0ICpwY3R4LAogICAgYXNzZXJ0KGJsaXRfaW5m
by0+ZHN0LmxldmVsIDw9IGRzdC0+YmFzZS5sYXN0X2xldmVsKTsKCiAgICBpZiAoIXRyYW5zbGF0
ZV9zYW1wbGVzX3RvX3h5c2NhbGUoc3JjLT5iYXNlLm5yX3NhbXBsZXMsCiZtc2FhX3hzY2FsZSwg
Jm1zYWFfeXNjYWxlLCBOVUxMKSkKLSAgICAgIHJldHVybiBGQUxTRTsKKyAgICAgIHJldHVybiBm
YWxzZTsKCiAgICAvKiBUaGUgd2lkdGgvaGVpZ2h0IGFyZSBpbiBwaXhlbHM7IHRoZXkgZG8gbm90
IGNoYW5nZSBhcyBhIHJlc3VsdCBvZgogICAgICogbXVsdGktc2FtcGxpbmcuIFNvLCB3aGVuIGJs
aXR0aW5nIGZyb20gYSA0eCBtdWx0aXNhbXBsZWQgc3VyZmFjZQpAQCAtMzc5LDE0ICszNzksMTQg
QEAgZXRuYV90cnlfYmx0X2JsaXQoc3RydWN0IHBpcGVfY29udGV4dCAqcGN0eCwKICAgICAgIERC
Rygic2NhbGluZyByZXF1ZXN0ZWQ6IHNvdXJjZSAlZHglZCBkZXN0aW5hdGlvbiAlZHglZCIsCiAg
ICAgICAgICAgYmxpdF9pbmZvLT5zcmMuYm94LndpZHRoLCBibGl0X2luZm8tPnNyYy5ib3guaGVp
Z2h0LAogICAgICAgICAgIGJsaXRfaW5mby0+ZHN0LmJveC53aWR0aCwgYmxpdF9pbmZvLT5kc3Qu
Ym94LmhlaWdodCk7Ci0gICAgICByZXR1cm4gRkFMU0U7CisgICAgICByZXR1cm4gZmFsc2U7CiAg
ICB9CgogICAgLyogTm8gbWFza3MgLSBub3Qgc3VyZSBpZiBCTFQgY2FuIGNvcHkgaW5kaXZpZHVh
bCBjaGFubmVscyAqLwogICAgdW5zaWduZWQgbWFzayA9IHV0aWxfZm9ybWF0X2dldF9tYXNrKGJs
aXRfaW5mby0+ZHN0LmZvcm1hdCk7CiAgICBpZiAoKGJsaXRfaW5mby0+bWFzayAmIG1hc2spICE9
IG1hc2spIHsKICAgICAgIERCRygic3ViLW1hc2sgcmVxdWVzdGVkOiAweCUwMnggdnMgZm9ybWF0
IG1hc2sgMHglMDJ4IiwKYmxpdF9pbmZvLT5tYXNrLCBtYXNrKTsKLSAgICAgIHJldHVybiBGQUxT
RTsKKyAgICAgIHJldHVybiBmYWxzZTsKICAgIH0KCiAgICAvKiBUT0RPOiAxIGJ5dGUgcGVyIHBp
eGVsIGZvcm1hdHMgYXJlbid0IGhhbmRsZWQgYnkKZXRuYV9jb21wYXRpYmxlX3JzX2Zvcm1hdCBu
b3IKQEAgLTQwMiw3ICs0MDIsNyBAQCBldG5hX3RyeV9ibHRfYmxpdChzdHJ1Y3QgcGlwZV9jb250
ZXh0ICpwY3R4LAogICAgICAgIGJsaXRfaW5mby0+c2Npc3Nvcl9lbmFibGUgfHwKICAgICAgICBi
bGl0X2luZm8tPmRzdC5ib3guZGVwdGggIT0gYmxpdF9pbmZvLT5zcmMuYm94LmRlcHRoIHx8CiAg
ICAgICAgYmxpdF9pbmZvLT5kc3QuYm94LmRlcHRoICE9IDEpIHsKLSAgICAgIHJldHVybiBGQUxT
RTsKKyAgICAgIHJldHVybiBmYWxzZTsKICAgIH0KCiAgICAvKiBFbnN1cmUgdGhhdCB0aGUgWiBj
b29yZGluYXRlIGlzIHNhbmUgKi8KQEAgLTQxOSw3ICs0MTksNyBAQCBldG5hX3RyeV9ibHRfYmxp
dChzdHJ1Y3QgcGlwZV9jb250ZXh0ICpwY3R4LAogICAgICAgLyogUmVzb2x2ZS1pbi1wbGFjZSAq
LwogICAgICAgYXNzZXJ0KCFtZW1jbXAoJmJsaXRfaW5mby0+c3JjLCAmYmxpdF9pbmZvLT5kc3Qs
CnNpemVvZihibGl0X2luZm8tPnNyYykpKTsKICAgICAgIGlmICghc3JjX2xldi0+dHNfc2l6ZSB8
fCAhc3JjX2xldi0+dHNfdmFsaWQpIC8qIE5vIFRTLCBubyB3b3JyaWVzICovCi0gICAgICAgICBy
ZXR1cm4gVFJVRTsKKyAgICAgICAgIHJldHVybiB0cnVlOwogICAgICAgc3RydWN0IGJsdF9pbnBs
YWNlX29wIG9wID0ge307CgogICAgICAgb3AuYWRkci5ibyA9IHNyYy0+Ym87CkBAIC01MTYsNyAr
NTE2LDcgQEAgZXRuYV90cnlfYmx0X2JsaXQoc3RydWN0IHBpcGVfY29udGV4dCAqcGN0eCwKICAg
IGRzdC0+c2Vxbm8rKzsKICAgIGRzdF9sZXYtPnRzX3ZhbGlkID0gZmFsc2U7CgotICAgcmV0dXJu
IFRSVUU7CisgICByZXR1cm4gdHJ1ZTsKIH0KCiBzdGF0aWMgdm9pZAoKLS0tLTg8LS0tLQoKLS0g
CmdyZWV0cwotLQpDaHJpc3RpYW4gR21laW5lciwgTVNjCgpodHRwczovL2NocmlzdGlhbi1nbWVp
bmVyLmluZm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5hdml2
