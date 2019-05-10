Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B1619A4A
	for <lists+etnaviv@lfdr.de>; Fri, 10 May 2019 11:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C410989BC0;
	Fri, 10 May 2019 09:09:38 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CE089BB3;
 Fri, 10 May 2019 09:09:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h4so6877374wre.7;
 Fri, 10 May 2019 02:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bLYTv7dZ5cUacjbrHpiT854BU6s1J7/ISpPi8mnk4bQ=;
 b=XzFJ6uDj7veBeeNz615GqtkVweuzHpq9N/4bGZXYl4V1QJqkZ+Krbhjh40rlqJ6ecq
 QF+6YPvjIV4oLrf3uIX1voP03sAmuYkCYjkOhbTZl/Gx6Brrhe4KkU9gMQbPS20dnaWs
 fCuo8Uuy18ahFyLrZGU5zJrJ0KzQxVxsCZM9PouViEP+8/MIq/upPa2Xfc81uNfr7Ndf
 NP2Qsrw5toR89JbLbdZOHzwTkof1HhndRJHsrYThCqqW5rWYOBzQZAhfrubxem2X0u9Z
 226xseOBCAq6bWcAiZ1IE1TfmIftL1CU/t0ufuBAWFFZe9Iom6IA+UBduFgp5Qy6RJvG
 1iZw==
X-Gm-Message-State: APjAAAXlkEbkrjSLdXZO2FIIQEYlqbSx2mf+ESHmaEFj8s5KMqhxt9HS
 a4c5K+BPV59RG2H9kqBoIYSCCet9Gn0=
X-Google-Smtp-Source: APXvYqwSzmaNMS/o9wc5gZ4D/SBSDpoEJg56P5esR/WnLu+1D/zkhGz053t2KhttqocDp9mf7UlVbw==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr7171053wrn.175.1557479372814; 
 Fri, 10 May 2019 02:09:32 -0700 (PDT)
Received: from localhost.localdomain (80-110-110-254.cgn.dynamic.surfer.at.
 [80.110.110.254])
 by smtp.gmail.com with ESMTPSA id l18sm1645344wrv.38.2019.05.10.02.09.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 02:09:32 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: mesa-dev@lists.freedesktop.org
Subject: [RFC PATCH 12/17] etnaviv: add debug option to report NIR as
 supported and preferred shader IR
Date: Fri, 10 May 2019 11:09:10 +0200
Message-Id: <20190510090915.2739-13-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190510090915.2739-1-christian.gmeiner@gmail.com>
References: <20190510090915.2739-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bLYTv7dZ5cUacjbrHpiT854BU6s1J7/ISpPi8mnk4bQ=;
 b=rws5ALZ8WOoBdtTXPoqEWR/MCU4ADzdIMaPWi7H0Emqn+Rl6Nazh4a5SHOMXTNs+TX
 IOQ+qzSKu+WPQNUjYYM2W3xsZrEUhLsSw9b8zRj++MpDAq5ybG2+RzLSAajptyncBon/
 zVJCReWl+eornnhVgpAOpNwBanz3Tx72vAvWaW+HYzPN/9PBZBfRHv7fl7jBH9aQf8Os
 OChpBa5mBurSu6KUemH7erpZuZyxCSTVQtV4y879fg8Jg5XBi7ObrmcI+IUXax6KpiOs
 asz+oTOh3ZUm9gSZbid8NfaPlyhtig13GV+GU08O2AVAoXqz497zaS1l7oKN/3Dh9WGt
 z2fg==
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, etnaviv@lists.freedesktop.org,
 cphealy@gmail.com, Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

QWRkIGEgZGVidWcgb3B0aW9uIEVUTkFfTUVTQV9ERUJVRz0ibmlyIiB0aGF0IHdpbGwgY2F1c2Ug
dGhlIGV0bmF2aXYKZ2FsbGl1bSBwaXBlIGRyaXZlciB0byBhZHZlcnRpc2Ugc3VwcG9ydCBhbmQg
cHJlZmVyZW5jZSBmb3IgTklSIHNoYWRlcnMuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFphYmVs
IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRyZXR0ZXIg
PG0udHJldHRlckBwZW5ndXRyb25peC5kZT4KLS0tCiBzcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2
aXYvZXRuYXZpdl9kZWJ1Zy5oICB8ICAzICsrKwogc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2
L2V0bmF2aXZfc2NyZWVuLmMgfCAxMSArKysrKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NyYy9nYWxsaXVtL2Ry
aXZlcnMvZXRuYXZpdi9ldG5hdml2X2RlYnVnLmggYi9zcmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2
aXYvZXRuYXZpdl9kZWJ1Zy5oCmluZGV4IDQwNTFlOTVkZDVmLi44ZGFjZjZiMjQzMyAxMDA2NDQK
LS0tIGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfZGVidWcuaAorKysgYi9z
cmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9kZWJ1Zy5oCkBAIC01NCw2ICs1NCw5
IEBACiAjZGVmaW5lIEVUTkFfREJHX1NIQURFUkRCICAgICAgICAweDgwMDAwMCAvKiBkdW1wIHBy
b2dyYW0gY29tcGlsZSBpbmZvcm1hdGlvbiAqLwogI2RlZmluZSBFVE5BX0RCR19OT19TSU5HTEVC
VUYgICAgMHgxMDAwMDAwIC8qIGRpc2FibGUgc2luZ2xlIGJ1ZmZlciBmZWF0dXJlICovCiAKKy8q
IEV4cGVyaW1lbnRhbCBmZWF0dXJlcyAqLworI2RlZmluZSBFVE5BX0RCR19OSVIJCTB4MTAwMDAw
MDAgLyogRW5hYmxlIE5JUiBjb21waWxlciAqLworCiBleHRlcm4gaW50IGV0bmFfbWVzYV9kZWJ1
ZzsgLyogc2V0IGluIGV0bmFfc2NyZWVuLmMgZnJvbSBFVE5BX0RFQlVHICovCiAKICNkZWZpbmUg
REJHX0VOQUJMRUQoZmxhZykgdW5saWtlbHkoZXRuYV9tZXNhX2RlYnVnICYgKGZsYWcpKQpkaWZm
IC0tZ2l0IGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ldG5hdml2L2V0bmF2aXZfc2NyZWVuLmMgYi9z
cmMvZ2FsbGl1bS9kcml2ZXJzL2V0bmF2aXYvZXRuYXZpdl9zY3JlZW4uYwppbmRleCA2NDFlZTgw
OTQ4Yy4uM2UxNTFlNzUxNTkgMTAwNjQ0Ci0tLSBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvZXRuYXZp
di9ldG5hdml2X3NjcmVlbi5jCisrKyBiL3NyYy9nYWxsaXVtL2RyaXZlcnMvZXRuYXZpdi9ldG5h
dml2X3NjcmVlbi5jCkBAIC02OSw2ICs2OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGVidWdf
bmFtZWRfdmFsdWUgZGVidWdfb3B0aW9uc1tdID0gewogICAgeyJjZmx1c2hfYWxsIiwgICAgIEVU
TkFfREJHX0NGTFVTSF9BTEwsICJGbHVzaCBldmVyeSBjYWNoZSBiZWZvcmUgc3RhdGUgdXBkYXRl
In0sCiAgICB7Im1zYWEyeCIsICAgICAgICAgRVROQV9EQkdfTVNBQV8yWCwgIkZvcmNlIDJ4IG1z
YWEifSwKICAgIHsibXNhYTR4IiwgICAgICAgICBFVE5BX0RCR19NU0FBXzRYLCAiRm9yY2UgNHgg
bXNhYSJ9LAorICAgeyJuaXIiLCAgICAgICAgICAgIEVUTkFfREJHX05JUiwgIkVuYWJsZSBleHBl
cmltZW50YWwgTklSIGNvbXBpbGVyIn0sCiAgICB7ImZsdXNoX2FsbCIsICAgICAgRVROQV9EQkdf
RkxVU0hfQUxMLCAiRmx1c2ggYWZ0ZXIgZXZlcnkgcmVuZGVyZWQgcHJpbWl0aXZlIn0sCiAgICB7
Inplcm8iLCAgICAgICAgICAgRVROQV9EQkdfWkVSTywgIlplcm8gYWxsIHJlc291cmNlcyBhZnRl
ciBhbGxvY2F0aW9uIn0sCiAgICB7ImRyYXdfc3RhbGwiLCAgICAgRVROQV9EQkdfRFJBV19TVEFM
TCwgIlN0YWxsIEZFL1BFIGFmdGVyIGVhY2ggcmVuZGVyZWQgcHJpbWl0aXZlIn0sCkBAIC00ODYs
NyArNDg3LDEwIEBAIGV0bmFfc2NyZWVuX2dldF9zaGFkZXJfcGFyYW0oc3RydWN0IHBpcGVfc2Ny
ZWVuICpwc2NyZWVuLAogICAgICAgICAgICAgICAgID8gc2NyZWVuLT5zcGVjcy5mcmFnbWVudF9z
YW1wbGVyX2NvdW50CiAgICAgICAgICAgICAgICAgOiBzY3JlZW4tPnNwZWNzLnZlcnRleF9zYW1w
bGVyX2NvdW50OwogICAgY2FzZSBQSVBFX1NIQURFUl9DQVBfUFJFRkVSUkVEX0lSOgotICAgICAg
cmV0dXJuIFBJUEVfU0hBREVSX0lSX1RHU0k7CisgICAgICBpZiAoZXRuYV9tZXNhX2RlYnVnICYg
RVROQV9EQkdfTklSKQorICAgICAgICAgcmV0dXJuIFBJUEVfU0hBREVSX0lSX05JUjsKKyAgICAg
IGVsc2UKKyAgICAgICAgIHJldHVybiBQSVBFX1NIQURFUl9JUl9UR1NJOwogICAgY2FzZSBQSVBF
X1NIQURFUl9DQVBfTUFYX0NPTlNUX0JVRkZFUl9TSVpFOgogICAgICAgcmV0dXJuIDQwOTY7CiAg
ICBjYXNlIFBJUEVfU0hBREVSX0NBUF9UR1NJX0RST1VORF9TVVBQT1JURUQ6CkBAIC00OTYsNyAr
NTAwLDEwIEBAIGV0bmFfc2NyZWVuX2dldF9zaGFkZXJfcGFyYW0oc3RydWN0IHBpcGVfc2NyZWVu
ICpwc2NyZWVuLAogICAgY2FzZSBQSVBFX1NIQURFUl9DQVBfVEdTSV9BTllfSU5PVVRfREVDTF9S
QU5HRToKICAgICAgIHJldHVybiBmYWxzZTsKICAgIGNhc2UgUElQRV9TSEFERVJfQ0FQX1NVUFBP
UlRFRF9JUlM6Ci0gICAgICByZXR1cm4gMDsKKyAgICAgIGlmIChldG5hX21lc2FfZGVidWcgJiBF
VE5BX0RCR19OSVIpCisgICAgICAgICByZXR1cm4gKDEgPDwgUElQRV9TSEFERVJfSVJfVEdTSSkg
fCAoMSA8PCBQSVBFX1NIQURFUl9JUl9OSVIpOworICAgICAgZWxzZQorICAgICAgICAgcmV0dXJu
ICgxIDw8IFBJUEVfU0hBREVSX0lSX1RHU0kpOwogICAgY2FzZSBQSVBFX1NIQURFUl9DQVBfTUFY
X1VOUk9MTF9JVEVSQVRJT05TX0hJTlQ6CiAgICAgICByZXR1cm4gMzI7CiAgICBjYXNlIFBJUEVf
U0hBREVSX0NBUF9NQVhfU0hBREVSX0JVRkZFUlM6Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0
bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
