Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6619A40
	for <lists+etnaviv@lfdr.de>; Fri, 10 May 2019 11:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAACA89A35;
	Fri, 10 May 2019 09:09:23 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C15899C4;
 Fri, 10 May 2019 09:09:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c5so6849806wrs.11;
 Fri, 10 May 2019 02:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+xgsG9psC40tI/S/srntg94Rgsj2UzHx2y1kCoBC3pU=;
 b=uaK1Rw53hM5BSROlETs70fKO95lMB7zlpN/o7BsyAaZTp3XTizkJjPN5bz6m+HAHoi
 XzJPkbytJBY8EZ3aUfvY+CUvLIzxiYtRvD7J5CF3JmhEUjRmGf+rxANRWu0YzUIHIezO
 GrljOnXEZH4VKY1SM53vV+1xP8ZiWuodtaaRqmSLu/rTMIjtBgHaj+eo6PWRRVgS7bzH
 J1RaZuXEerVYp528+yPOjcifV7BlTi157U0+Daxgc44bB5evK4RddUZbu5z+X9uH+b7a
 RcOkZnSGPG+BU5WMdSQ5tAmZWvqiz7co0aFC0h2sLHzgbMQgU1ikkdgsYXwG9kiGyJYq
 dl0A==
X-Gm-Message-State: APjAAAW3+wcsaQLn+i1+6mfFKOp5F9ZaVQeefR9Yza+5RDDDoppMek33
 BrNDaSaueQPCcBieFReIrjj9TMWRdVQ=
X-Google-Smtp-Source: APXvYqy7p8uKbky21wODRiACLacojxrH8YuRShKR2NocECOW9NFlwqJRg8ugFiFvqVAmOlHVYp3eqw==
X-Received: by 2002:a5d:4ec9:: with SMTP id s9mr7021791wrv.223.1557479360218; 
 Fri, 10 May 2019 02:09:20 -0700 (PDT)
Received: from localhost.localdomain (80-110-110-254.cgn.dynamic.surfer.at.
 [80.110.110.254])
 by smtp.gmail.com with ESMTPSA id l18sm1645344wrv.38.2019.05.10.02.09.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 02:09:19 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: mesa-dev@lists.freedesktop.org
Subject: [RFC PATCH 02/17] eir: add legalization
Date: Fri, 10 May 2019 11:09:00 +0200
Message-Id: <20190510090915.2739-3-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190510090915.2739-1-christian.gmeiner@gmail.com>
References: <20190510090915.2739-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+xgsG9psC40tI/S/srntg94Rgsj2UzHx2y1kCoBC3pU=;
 b=rrAXhowLU0jnqrKBce6xVes00R9flctViwdXThdZuUbD7r/mTTXZxTrRNeC/9Kra3Z
 qDcU0eoLh8m6r5158R+XKrrQDG8lhADOjGoVtVaGXGhpuJZplZ9kwIjijpQW+PZfz48o
 jMkkEkp0uLyBiDkCOzEe2fpaU5DnVwXJZaVS0zEmCzqBdVGkv2nVE3NV97sHCxfTwqil
 1BzOhjxeQvI2+HNRBnqjhWs8ROgp7Hqtipvgv8y5+fah79uT9Je8DlarCUjwazNL5KaA
 AIzncEb+exgK9GnkjIEp4FkN8ixlBncfXbrm5Fof+3R4BEa7N83gC4zjNsFZkltaxXft
 mgdA==
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, cphealy@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

LSBpZiBzaGFkZXIgaXMgZW1wdHkgYWRkIGEgTk9QIGluc3RydWN0aW9uCi0gYXZvaWQgbXVsdGlw
bGUgdW5pZm9ybSBzcmMgZm9yIGFsdSBvcHMKLSByZXNvbHZlIGp1bXAgdGFyZ2V0CgpTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgot
LS0KIHNyYy9ldG5hdml2L2NvbXBpbGVyL2Vpci5oICAgICAgICAgICAgICAgICAgfCAgIDMgKwog
c3JjL2V0bmF2aXYvY29tcGlsZXIvZWlyX2xlZ2FsaXplLmMgICAgICAgICB8IDE3NyArKysrKysr
KysrKysrKysrKysrKwogc3JjL2V0bmF2aXYvY29tcGlsZXIvbWVzb24uYnVpbGQgICAgICAgICAg
ICB8ICAgMSArCiBzcmMvZXRuYXZpdi9jb21waWxlci90ZXN0cy9laXJfbGVnYWxpemUuY3BwIHwg
MTM2ICsrKysrKysrKysrKysrKwogc3JjL2V0bmF2aXYvY29tcGlsZXIvdGVzdHMvbWVzb24uYnVp
bGQgICAgICB8ICAxMCArKwogNSBmaWxlcyBjaGFuZ2VkLCAzMjcgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHNyYy9ldG5hdml2L2NvbXBpbGVyL2Vpcl9sZWdhbGl6ZS5jCiBjcmVh
dGUgbW9kZSAxMDA2NDQgc3JjL2V0bmF2aXYvY29tcGlsZXIvdGVzdHMvZWlyX2xlZ2FsaXplLmNw
cAoKZGlmZiAtLWdpdCBhL3NyYy9ldG5hdml2L2NvbXBpbGVyL2Vpci5oIGIvc3JjL2V0bmF2aXYv
Y29tcGlsZXIvZWlyLmgKaW5kZXggZTIxODViMDA0ZjEuLmEwNWIxMmRlOTRiIDEwMDY0NAotLS0g
YS9zcmMvZXRuYXZpdi9jb21waWxlci9laXIuaAorKysgYi9zcmMvZXRuYXZpdi9jb21waWxlci9l
aXIuaApAQCAtMjgyLDYgKzI4Miw5IEBAIGVpcl9hc3NpZ25fb3V0cHV0KHN0cnVjdCBlaXIgKmly
LCB1bnNpZ25lZCBpZHgsIHVuc2lnbmVkIHNsb3QsIHVuc2lnbmVkIG5jb21wKQogICAgaXItPm51
bV9vdXRwdXRzID0gTUFYMihpci0+bnVtX291dHB1dHMsIGlkeCArIDEpOwogfQogCit2b2lkCitl
aXJfbGVnYWxpemUoc3RydWN0IGVpciAqaXIpOworCiB2b2lkCiBlaXJfY2FsY3VsYXRlX2xpdmVf
aW50ZXJ2YWxzKHN0cnVjdCBlaXIgKmlyKTsKIApkaWZmIC0tZ2l0IGEvc3JjL2V0bmF2aXYvY29t
cGlsZXIvZWlyX2xlZ2FsaXplLmMgYi9zcmMvZXRuYXZpdi9jb21waWxlci9laXJfbGVnYWxpemUu
YwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMC4uOTRmNWMyYmQxMmIKLS0t
IC9kZXYvbnVsbAorKysgYi9zcmMvZXRuYXZpdi9jb21waWxlci9laXJfbGVnYWxpemUuYwpAQCAt
MCwwICsxLDE3NyBAQAorLyoKKyAqIENvcHlyaWdodCAoYykgMjAxOCBFdG5hdml2IFByb2plY3QK
KyAqIENvcHlyaWdodCAoQykgMjAxOCBab2RpYWMgSW5mbGlnaHQgSW5ub3ZhdGlvbnMKKyAqCisg
KiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBl
cnNvbiBvYnRhaW5pbmcgYQorICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVk
IGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwKKyAqIHRvIGRlYWwgaW4gdGhl
IFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRp
b24KKyAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBk
aXN0cmlidXRlLCBzdWIgbGljZW5zZSwKKyAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29m
dHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZQorICogU29mdHdhcmUgaXMg
ZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoK
KyAqCisgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5v
dGljZSAoaW5jbHVkaW5nIHRoZQorICogbmV4dCBwYXJhZ3JhcGgpIHNoYWxsIGJlIGluY2x1ZGVk
IGluIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMKKyAqIG9mIHRoZSBTb2Z0d2Fy
ZS4KKyAqCisgKiBUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJS
QU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgorICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBO
T1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisgKiBGSVRO
RVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OLUlORlJJTkdFTUVOVC4gSU4gTk8g
RVZFTlQgU0hBTEwKKyAqIFRIRSBBVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJM
RSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSCisgKiBMSUFCSUxJVFksIFdIRVRIRVIg
SU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORworICog
RlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVT
RSBPUiBPVEhFUgorICogREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorICoKKyAqIEF1dGhvcnM6
CisgKiAgICBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgor
ICovCisKKyNpbmNsdWRlICJlaXIuaCIKKyNpbmNsdWRlICJldG5hdml2L2djL2djX2luc3RyLmgi
CisKK3N0YXRpYyBpbnQKK2ludmFsaWRfdW5pZm9ybV91c2FnZShjb25zdCBzdHJ1Y3QgZWlyX2lu
c3RydWN0aW9uICppbnN0KQoreworICAgY29uc3Qgc3RydWN0IGdjX2luc3RyICpnYyA9ICZpbnN0
LT5nYzsKKyAgIGludCBpbnZhbGlkID0gMDsKKyAgIGJvb2wgZmlyc3RfdW5pZm9ybSA9IHRydWU7
CisgICBpbnQgaW5kZXg7CisKKyAgIGlmIChnYy0+dHlwZSAhPSBHQ19PUF9UWVBFX0FMVSkKKyAg
ICAgIHJldHVybiAwOworCisgICBmb3IgKHVuc2lnbmVkIGkgPSAwOyBpIDwgZ2Nfb3BfbnVtX3Ny
YyhnYy0+b3Bjb2RlKTsgaSsrKSB7CisgICAgICBjb25zdCBzdHJ1Y3QgZWlyX3JlZ2lzdGVyICpz
cmMgPSAmaW5zdC0+c3JjW2ldOworCisgICAgICBpZiAoc3JjLT50eXBlICE9IEVJUl9SRUdfVU5J
Rk9STSkKKyAgICAgICAgIGNvbnRpbnVlOworCisgICAgICBpZiAoZmlyc3RfdW5pZm9ybSkgewor
ICAgICAgICAgaW5kZXggPSBzcmMtPmluZGV4OworICAgICAgICAgZmlyc3RfdW5pZm9ybSA9IGZh
bHNlOworICAgICAgICAgY29udGludWU7CisgICAgICB9CisKKyAgICAgIGlmIChzcmMtPmluZGV4
ID09IGluZGV4KQorICAgICAgICAgY29udGludWU7CisKKyAgICAgIGludmFsaWQgfD0gMSA8PCBp
OworICAgfQorCisgICByZXR1cm4gaW52YWxpZDsKK30KKworc3RhdGljIHZvaWQKK2xlZ2FsaXpl
X3VuaWZvcm1fdXNhZ2Uoc3RydWN0IGVpcl9ibG9jayAqYmxvY2ssIHN0cnVjdCBlaXJfaW5zdHJ1
Y3Rpb24gKmluc3QpCit7CisgICAvKgorICAgKiBUaGUgaGFyZHdhcmUgZG9lcyBub3QgYWxsb3cg
dHdvIG9yIG1vcmUgZGlmZmVyZW50IHVuaWZvcm0gcmVnaXN0ZXJzIHRvIGJlIHVzZWQgYXMKKyAg
ICogc291cmNlcyBpbiB0aGUgc2FtZSBBTFUgaW5zdHJ1Y3Rpb24uIEVtaXQgbW92IGluc3RydWN0
aW9ucyB0byB0ZW1wb3JhcnkgcmVnaXN0ZXJzCisgICAqIGZvciBhbGwgYnV0IG9uZSB1bmlmb3Jt
IHJlZ2lzdGVyIGluIHRoaXMgY2FzZS4KKyAgICovCisgICBpbnQgbWFzayA9IGludmFsaWRfdW5p
Zm9ybV91c2FnZShpbnN0KTsKKworICAgd2hpbGUgKG1hc2spIHsKKyAgICAgIGNvbnN0IGludCBp
ID0gZmZzKG1hc2spIC0gMTsKKyAgICAgIHN0cnVjdCBlaXJfcmVnaXN0ZXIgKnNyYyA9ICZpbnN0
LT5zcmNbaV07CisgICAgICBzdHJ1Y3QgZWlyX3JlZ2lzdGVyIHRtcCA9IGVpcl90ZW1wX3JlZ2lz
dGVyKGJsb2NrLT5pciwgNCk7CisKKyAgICAgIHRtcC53cml0ZW1hc2sgPSAweGY7IC8qIFRPRE8g
Ki8KKworICAgICAgZWlyX01PVihibG9jaywgJnRtcCwgc3JjKTsKKyAgICAgIHNyYy0+dHlwZSA9
IEVJUl9SRUdfVEVNUDsKKyAgICAgIHNyYy0+aW5kZXggPSB0bXAuaW5kZXg7CisKKyAgICAgIG1h
c2sgJj0gfigxIDw8IGkpOworICAgfQorfQorCitzdGF0aWMgdm9pZAorbGVnYWxpemVfYmxvY2so
c3RydWN0IGVpcl9ibG9jayAqYmxvY2spCit7CisgICBzdHJ1Y3QgbGlzdF9oZWFkIGluc3RyX2xp
c3Q7CisKKyAgIC8qCisgICAgKiBSZW1vdmUgYWxsIHRoZSBpbnN0cnVjdGlvbnMgZnJvbSB0aGUg
bGlzdCwgd2UnbGwgYmUgYWRkaW5nCisgICAgKiB0aGVtIGJhY2sgaW4gYXMgd2UgZ28KKyAgICAq
LworICAgbGlzdF9yZXBsYWNlKCZibG9jay0+aW5zdHJfbGlzdCwgJmluc3RyX2xpc3QpOworICAg
bGlzdF9pbml0aGVhZCgmYmxvY2stPmluc3RyX2xpc3QpOworCisgICBsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3NhZmUgKHN0cnVjdCBlaXJfaW5zdHJ1Y3Rpb24sIGluc3QsICZpbnN0cl9saXN0LCBub2Rl
KSB7CisgICAgICBsZWdhbGl6ZV91bmlmb3JtX3VzYWdlKGJsb2NrLCBpbnN0KTsKKyAgICAgIGxp
c3RfYWRkdGFpbCgmaW5zdC0+bm9kZSwgJmJsb2NrLT5pbnN0cl9saXN0KTsKKyAgIH0KK30KKwor
c3RydWN0IGJsb2NrX2RhdGEgeworICAgdW5zaWduZWQgc3RhcnRfaXA7CisgICB1bnNpZ25lZCBl
bmRfaXA7Cit9OworCitzdGF0aWMgdm9pZAorcmVzb2x2ZV9qdW1wcyhzdHJ1Y3QgZWlyICppcikK
K3sKKyAgIHZvaWQgKm1lbV9jdHggPSByYWxsb2NfY29udGV4dChOVUxMKTsKKyAgIHVuc2lnbmVk
IGlwID0gMDsKKyAgIGFzc2VydChtZW1fY3R4KTsKKworICAgZWlyX2Zvcl9lYWNoX2Jsb2NrKGJs
b2NrLCBpcikgeworICAgICAgc3RydWN0IGJsb2NrX2RhdGEgKmJkID0gcnphbGxvYyhtZW1fY3R4
LCBzdHJ1Y3QgYmxvY2tfZGF0YSk7CisKKyAgICAgIGFzc2VydChiZCk7CisgICAgICBhc3NlcnQo
IWJsb2NrLT5kYXRhKTsKKyAgICAgIGJsb2NrLT5kYXRhID0gYmQ7CisKKyAgICAgIC8qIGRldGVy
bWluZSBzdGFydCBhbmQgZW5kIElQIGZvciB0aGlzIGJsb2NrICovCisgICAgICBiZC0+c3RhcnRf
aXAgPSBpcDsKKyAgICAgIGVpcl9mb3JfZWFjaF9pbnN0KGluc3QsIGJsb2NrKSB7CisgICAgICAg
ICBpcCsrOworICAgICAgfQorICAgICAgYmQtPmVuZF9pcCA9IGlwOworICAgfQorCisgICBlaXJf
Zm9yX2VhY2hfYmxvY2soYmxvY2ssIGlyKSB7CisgICAgICBjb25zdCBzdHJ1Y3QgYmxvY2tfZGF0
YSAqYmQ7CisKKyAgICAgIC8qIHRoZSBlbmQgYmxvY2sgb2YgdGhlIHByb2dyYW0gaGFzIG5vIGJy
YW5jaCAqLworICAgICAgaWYgKCFibG9jay0+c3VjY2Vzc29yc1swXSkKKyAgICAgICAgIGNvbnRp
bnVlOworCisgICAgICBiZCA9IGJsb2NrLT5zdWNjZXNzb3JzWzBdLT5kYXRhOworCisgICAgICBl
aXJfZm9yX2VhY2hfaW5zdChpbnN0LCBibG9jaykgeworICAgICAgICAgaWYgKGluc3QtPmdjLnR5
cGUgIT0gR0NfT1BfVFlQRV9CUkFOQ0gpCisgICAgICAgICAgICBjb250aW51ZTsKKworICAgICAg
ICAgaW5zdC0+Z2MuYnJhbmNoLmltbSA9IGJkLT5zdGFydF9pcDsKKworICAgICAgICAgLyoKKyAg
ICAgICAgICAqIGlmIHRoZXJlIGlzIGEgZW1wdHkgYmxvY2sgYXQgdGhlIGVuZCBvZiB0aGUgc2hh
ZGVyIGFuCisgICAgICAgICAgKiBleHRyYSBOT1Agc2hvdWxkIGJlIGdlbmVyYXRlZCBhcyBqdW1w
IHRhcmdldAorICAgICAgICAgICovCisgICAgICAgICBpZiAobGlzdF9lbXB0eSgmYmxvY2stPnN1
Y2Nlc3NvcnNbMF0tPmluc3RyX2xpc3QpKQorICAgICAgICAgICAgZWlyX05PUChibG9jay0+c3Vj
Y2Vzc29yc1swXSk7CisgICAgICB9CisgICB9CisKKyAgIHJhbGxvY19mcmVlKG1lbV9jdHgpOwor
ICAgZWlyX2Zvcl9lYWNoX2Jsb2NrKGJsb2NrLCBpcikKKyAgICAgIGJsb2NrLT5kYXRhID0gTlVM
TDsKK30KKwordm9pZAorZWlyX2xlZ2FsaXplKHN0cnVjdCBlaXIgKmlyKQoreworICAgZWlyX2Zv
cl9lYWNoX2Jsb2NrKGJsb2NrLCBpcikKKyAgICAgIGxlZ2FsaXplX2Jsb2NrKGJsb2NrKTsKKwor
ICAgcmVzb2x2ZV9qdW1wcyhpcik7CisKKyAgIC8qIGFkZCBOT1AgaWYgdGhlIG9ubHkgYmxvY2sg
aGFzIG5vIGluc3RydWN0aW9ucyAqLworICAgaWYgKGlyLT5ibG9ja3MgPT0gMSkgeworICAgICAg
c3RydWN0IGVpcl9ibG9jayAqYmxvY2sgPSBsaXN0X2ZpcnN0X2VudHJ5KCZpci0+YmxvY2tfbGlz
dCwgc3RydWN0IGVpcl9ibG9jaywgbm9kZSk7CisKKyAgICAgIGlmIChsaXN0X2VtcHR5KCZibG9j
ay0+aW5zdHJfbGlzdCkpCisgICAgICAgICBlaXJfTk9QKGJsb2NrKTsKKyAgIH0KK30KZGlmZiAt
LWdpdCBhL3NyYy9ldG5hdml2L2NvbXBpbGVyL21lc29uLmJ1aWxkIGIvc3JjL2V0bmF2aXYvY29t
cGlsZXIvbWVzb24uYnVpbGQKaW5kZXggOGFmZmU2ZWJkNDguLmM4MzM5OWQ1Mjk3IDEwMDY0NAot
LS0gYS9zcmMvZXRuYXZpdi9jb21waWxlci9tZXNvbi5idWlsZAorKysgYi9zcmMvZXRuYXZpdi9j
b21waWxlci9tZXNvbi5idWlsZApAQCAtMjMsNiArMjMsNyBAQAogbGliZXRuYXZpdl9jb21waWxl
cl9maWxlcyA9IGZpbGVzKAogICAnZWlyLmMnLAogICAnZWlyLmgnLAorICAnZWlyX2xlZ2FsaXpl
LmMnLAogICAnZWlyX3VuaWZvcm0uYycsCiApCiAKZGlmZiAtLWdpdCBhL3NyYy9ldG5hdml2L2Nv
bXBpbGVyL3Rlc3RzL2Vpcl9sZWdhbGl6ZS5jcHAgYi9zcmMvZXRuYXZpdi9jb21waWxlci90ZXN0
cy9laXJfbGVnYWxpemUuY3BwCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAw
Li43OTY4Y2NjOTc4MwotLS0gL2Rldi9udWxsCisrKyBiL3NyYy9ldG5hdml2L2NvbXBpbGVyL3Rl
c3RzL2Vpcl9sZWdhbGl6ZS5jcHAKQEAgLTAsMCArMSwxMzYgQEAKKy8qCisgKiBDb3B5cmlnaHQg
KGMpIDIwMTcgRXRuYXZpdiBQcm9qZWN0CisgKiBDb3B5cmlnaHQgKEMpIDIwMTcgWm9kaWFjIElu
ZmxpZ2h0IElubm92YXRpb25zCisgKgorICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwg
ZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKKyAqIGNvcHkgb2YgdGhp
cyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3
YXJlIiksCisgKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBp
bmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCisgKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwg
bW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3ViIGxpY2Vuc2UsCisgKiBhbmQv
b3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8g
d2hvbSB0aGUKKyAqIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0
aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisgKgorICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3Rp
Y2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2UgKGluY2x1ZGluZyB0aGUKKyAqIG5leHQgcGFy
YWdyYXBoKSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBv
cnRpb25zCisgKiBvZiB0aGUgU29mdHdhcmUuCisgKgorICogVEhFIFNPRlRXQVJFIElTIFBST1ZJ
REVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyAq
IElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0Yg
TUVSQ0hBTlRBQklMSVRZLAorICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5E
IE5PTi1JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMCisgKiBUSEUgQVVUSE9SUyBPUiBD
T1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhF
UgorICogTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBP
UiBPVEhFUldJU0UsIEFSSVNJTkcKKyAqIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJ
VEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIKKyAqIERFQUxJTkdTIElOIFRIRSBT
T0ZUV0FSRS4KKyAqCisgKiBBdXRob3JzOgorICogICAgQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlz
dGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4KKyAqLworCisjaW5jbHVkZSA8Z3Rlc3QvZ3Rlc3QuaD4K
KyNpbmNsdWRlICJldG5hdml2L2NvbXBpbGVyL2Vpci5oIgorCitURVNUIChMZWdhbGl6ZVRlc3Qs
IEVtcHR5U2hhZGVyKQoreworICAgc3RydWN0IGVpciAqaXIgPSBlaXJfY3JlYXRlKCk7CisgICBz
dHJ1Y3QgZWlyX2Jsb2NrICpibG9jayA9IGVpcl9ibG9ja19jcmVhdGUoaXIpOworCisgICBlaXJf
bGVnYWxpemUoaXIpOworCisgICBBU1NFUlRfRVEobGlzdF9sZW5ndGgoJmJsb2NrLT5pbnN0cl9s
aXN0KSwgMSk7CisgICBzdHJ1Y3QgZWlyX2luc3RydWN0aW9uICpub3AgPSBsaXN0X2ZpcnN0X2Vu
dHJ5KCZibG9jay0+aW5zdHJfbGlzdCwgc3RydWN0IGVpcl9pbnN0cnVjdGlvbiwgbm9kZSk7Cisg
ICBBU1NFUlRfRVEobm9wLT5nYy5vcGNvZGUsIEdDX05PUCk7CisKKyAgIGVpcl9kZXN0cm95KGly
KTsKK30KKworVEVTVCAoTGVnYWxpemVUZXN0LCBVbmlmb3Jtc1R3b1NhbWUpCit7CisgICBzdHJ1
Y3QgZWlyICppciA9IGVpcl9jcmVhdGUoKTsKKyAgIHN0cnVjdCBlaXJfYmxvY2sgKmJsb2NrID0g
ZWlyX2Jsb2NrX2NyZWF0ZShpcik7CisgICBzdHJ1Y3QgZWlyX3JlZ2lzdGVyIGRzdCA9IGVpcl90
ZW1wX3JlZ2lzdGVyKGlyLCA0KTsKKyAgIHN0cnVjdCBlaXJfcmVnaXN0ZXIgc3JjID0gZWlyX3Vu
aWZvcm1fcmVnaXN0ZXJfdWkoaXIsIDEpOworCisgICBkc3Qud3JpdGVtYXNrID0gMHhmOworCisg
ICBlaXJfQUREKGJsb2NrLCAmZHN0LCAmc3JjLCAmc3JjKTsKKworICAgZWlyX2xlZ2FsaXplKGly
KTsKKworICAgQVNTRVJUX0VRKGxpc3RfbGVuZ3RoKCZibG9jay0+aW5zdHJfbGlzdCksIDEpOwor
ICAgc3RydWN0IGVpcl9pbnN0cnVjdGlvbiAqYWRkID0gbGlzdF9maXJzdF9lbnRyeSgmYmxvY2st
Pmluc3RyX2xpc3QsIHN0cnVjdCBlaXJfaW5zdHJ1Y3Rpb24sIG5vZGUpOworICAgQVNTRVJUX0VR
KGFkZC0+Z2Mub3Bjb2RlLCBHQ19BREQpOworCisgICBlaXJfZGVzdHJveShpcik7Cit9CisKK1RF
U1QgKExlZ2FsaXplVGVzdCwgVW5pZm9ybXNUaHJlZVNhbWUpCit7CisgICBzdHJ1Y3QgZWlyICpp
ciA9IGVpcl9jcmVhdGUoKTsKKyAgIHN0cnVjdCBlaXJfYmxvY2sgKmJsb2NrID0gZWlyX2Jsb2Nr
X2NyZWF0ZShpcik7CisgICBzdHJ1Y3QgZWlyX3JlZ2lzdGVyIGRzdCA9IGVpcl90ZW1wX3JlZ2lz
dGVyKGlyLCA0KTsKKyAgIHN0cnVjdCBlaXJfcmVnaXN0ZXIgc3JjID0gZWlyX3VuaWZvcm1fcmVn
aXN0ZXJfdWkoaXIsIDEpOworCisgICBkc3Qud3JpdGVtYXNrID0gMHhmOworCisgICBlaXJfTUFE
KGJsb2NrLCAmZHN0LCAmc3JjLCAmc3JjLCAmc3JjKTsKKworICAgZWlyX2xlZ2FsaXplKGlyKTsK
KworICAgQVNTRVJUX0VRKGxpc3RfbGVuZ3RoKCZibG9jay0+aW5zdHJfbGlzdCksIDEpOworICAg
c3RydWN0IGVpcl9pbnN0cnVjdGlvbiAqbWFkID0gbGlzdF9maXJzdF9lbnRyeSgmYmxvY2stPmlu
c3RyX2xpc3QsIHN0cnVjdCBlaXJfaW5zdHJ1Y3Rpb24sIG5vZGUpOworICAgQVNTRVJUX0VRKG1h
ZC0+Z2Mub3Bjb2RlLCBHQ19NQUQpOworCisgICBlaXJfZGVzdHJveShpcik7Cit9CisKKworVEVT
VCAoTGVnYWxpemVUZXN0LCBVbmlmb3Jtc1R3b0RpZmZlcmVudCkKK3sKKyAgIHN0YXRpYyBjb25z
dCB1aW50MzJfdCB2YWwwW10gPSB7IDAsIDEsIDIsIDMgfTsKKyAgIHN0YXRpYyBjb25zdCB1aW50
MzJfdCB2YWwxW10gPSB7IDQsIDUsIDYsIDcgfTsKKyAgIHN0cnVjdCBlaXIgKmlyID0gZWlyX2Ny
ZWF0ZSgpOworICAgc3RydWN0IGVpcl9ibG9jayAqYmxvY2sgPSBlaXJfYmxvY2tfY3JlYXRlKGly
KTsKKyAgIHN0cnVjdCBlaXJfcmVnaXN0ZXIgZHN0ID0gZWlyX3RlbXBfcmVnaXN0ZXIoaXIsIDQp
OworICAgc3RydWN0IGVpcl9yZWdpc3RlciBzcmMwID0gZWlyX3VuaWZvcm1fcmVnaXN0ZXJfdmVj
NF91aShpciwgNCwgdmFsMCk7CisgICBzdHJ1Y3QgZWlyX3JlZ2lzdGVyIHNyYzEgPSBlaXJfdW5p
Zm9ybV9yZWdpc3Rlcl92ZWM0X3VpKGlyLCA0LCB2YWwxKTsKKworICAgZHN0LndyaXRlbWFzayA9
IDB4ZjsKKworICAgZWlyX0FERChibG9jaywgJmRzdCwgJnNyYzAsICZzcmMxKTsKKworICAgZWly
X2xlZ2FsaXplKGlyKTsKKworICAgQVNTRVJUX0VRKGxpc3RfbGVuZ3RoKCZibG9jay0+aW5zdHJf
bGlzdCksIDIpOworICAgc3RydWN0IGVpcl9pbnN0cnVjdGlvbiAqbW92ID0gbGlzdF9maXJzdF9l
bnRyeSgmYmxvY2stPmluc3RyX2xpc3QsIHN0cnVjdCBlaXJfaW5zdHJ1Y3Rpb24sIG5vZGUpOwor
ICAgQVNTRVJUX0VRKG1vdi0+Z2Mub3Bjb2RlLCBHQ19NT1YpOworICAgQVNTRVJUX0VRKG1vdi0+
c3JjWzBdLmluZGV4LCAxKTsKKyAgIEFTU0VSVF9FUShtb3YtPnNyY1swXS50eXBlLCBlaXJfcmVn
aXN0ZXI6OkVJUl9SRUdfVU5JRk9STSk7CisKKyAgIGVpcl9kZXN0cm95KGlyKTsKK30KKworVEVT
VCAoTGVnYWxpemVUZXN0LCBVbmlmb3Jtc1RocmVlRGlmZmVyZW50KQoreworICAgc3RhdGljIGNv
bnN0IHVpbnQzMl90IHZhbDBbXSA9IHsgMCwgMSwgMiwgMyB9OworICAgc3RhdGljIGNvbnN0IHVp
bnQzMl90IHZhbDFbXSA9IHsgNCwgNSwgNiwgNyB9OworICAgc3RhdGljIGNvbnN0IHVpbnQzMl90
IHZhbDJbXSA9IHsgOCwgOSwgMTAsIDExIH07CisgICBzdHJ1Y3QgZWlyICppciA9IGVpcl9jcmVh
dGUoKTsKKyAgIHN0cnVjdCBlaXJfYmxvY2sgKmJsb2NrID0gZWlyX2Jsb2NrX2NyZWF0ZShpcik7
CisgICBzdHJ1Y3QgZWlyX3JlZ2lzdGVyIGRzdCA9IGVpcl90ZW1wX3JlZ2lzdGVyKGlyLCA0KTsK
KyAgIHN0cnVjdCBlaXJfcmVnaXN0ZXIgc3JjMCA9IGVpcl91bmlmb3JtX3JlZ2lzdGVyX3ZlYzRf
dWkoaXIsIDQsIHZhbDApOworICAgc3RydWN0IGVpcl9yZWdpc3RlciBzcmMxID0gZWlyX3VuaWZv
cm1fcmVnaXN0ZXJfdmVjNF91aShpciwgNCwgdmFsMSk7CisgICBzdHJ1Y3QgZWlyX3JlZ2lzdGVy
IHNyYzIgPSBlaXJfdW5pZm9ybV9yZWdpc3Rlcl92ZWM0X3VpKGlyLCA0LCB2YWwyKTsKKworICAg
ZHN0LndyaXRlbWFzayA9IDB4ZjsKKworICAgZWlyX01BRChibG9jaywgJmRzdCwgJnNyYzAsICZz
cmMxLCAmc3JjMik7CisKKyAgIGVpcl9sZWdhbGl6ZShpcik7CisKKyAgIEFTU0VSVF9FUShsaXN0
X2xlbmd0aCgmYmxvY2stPmluc3RyX2xpc3QpLCAzKTsKKyAgIHN0cnVjdCBlaXJfaW5zdHJ1Y3Rp
b24gKm1vdiA9IGxpc3RfZmlyc3RfZW50cnkoJmJsb2NrLT5pbnN0cl9saXN0LCBzdHJ1Y3QgZWly
X2luc3RydWN0aW9uLCBub2RlKTsKKyAgIEFTU0VSVF9FUShtb3YtPmdjLm9wY29kZSwgR0NfTU9W
KTsKKyAgIEFTU0VSVF9FUShtb3YtPnNyY1swXS5pbmRleCwgMSk7CisgICBBU1NFUlRfRVEobW92
LT5zcmNbMF0udHlwZSwgZWlyX3JlZ2lzdGVyOjpFSVJfUkVHX1VOSUZPUk0pOworCisgICBlaXJf
ZGVzdHJveShpcik7Cit9CmRpZmYgLS1naXQgYS9zcmMvZXRuYXZpdi9jb21waWxlci90ZXN0cy9t
ZXNvbi5idWlsZCBiL3NyYy9ldG5hdml2L2NvbXBpbGVyL3Rlc3RzL21lc29uLmJ1aWxkCmluZGV4
IGM3NTA2ZjA0ZWQ1Li5mODJhY2FlNWYxYSAxMDA2NDQKLS0tIGEvc3JjL2V0bmF2aXYvY29tcGls
ZXIvdGVzdHMvbWVzb24uYnVpbGQKKysrIGIvc3JjL2V0bmF2aXYvY29tcGlsZXIvdGVzdHMvbWVz
b24uYnVpbGQKQEAgLTQyLDMgKzQyLDEzIEBAIHRlc3QoCiAgICkKICkKIAordGVzdCgKKyAgJ2Vp
cl9sZWdhbGl6ZScsCisgIGV4ZWN1dGFibGUoCisgICAgJ2Vpcl9sZWdhbGl6ZScsICdlaXJfbGVn
YWxpemUuY3BwJywKKyAgICBjcHBfYXJncyA6IFtjcHBfdmlzX2FyZ3MsIGNwcF9tc3ZjX2NvbXBh
dF9hcmdzXSwKKyAgICBsaW5rX3dpdGg6IFtsaWJldG5hdml2X2djLCBsaWJldG5hdml2X2NvbXBp
bGVyLCBsaWJtZXNhX3V0aWxdLAorICAgIGluY2x1ZGVfZGlyZWN0b3JpZXM6IFtpbmNfY29tbW9u
LCBpbmNfZXRuYXZpdl0sCisgICAgZGVwZW5kZW5jaWVzIDogW2RlcF9jbG9jaywgZGVwX3RocmVh
ZCwgaWRlcF9ndGVzdF0sCisgICkKKykKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ldG5hdml2
