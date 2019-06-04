Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D11347AC
	for <lists+etnaviv@lfdr.de>; Tue,  4 Jun 2019 15:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C76897E3;
	Tue,  4 Jun 2019 13:09:21 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F8A897FD
 for <etnaviv@lists.freedesktop.org>; Tue,  4 Jun 2019 13:09:19 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id 7so7773611uah.1
 for <etnaviv@lists.freedesktop.org>; Tue, 04 Jun 2019 06:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MFgjKdKCUkOPnUMNd2UjPbdf4teurKxNvEqioulpBgU=;
 b=paLAH+y0mGJfS7O/ZfvOUgH/OsHm6dHcFeAahQN3p9h6gaLW1Qj15drcwZMZlcnH7Z
 7J6GSW8xAuib5GRsCDJUZigVjhOfwks2FqEm4PtMeN/lDIPJea5p4nQVKaI2rrVuciPU
 LkT+S7S3AKNY0rnMuVENiQB3M/jqRfn2CUcF0TashnBEdLtLLcdc99vLgMzyENt//ETS
 FZrD+sCoonMUXBJWOGpLd3OXMLFa+TS+7RUvyFDXrza9Q9fCvguVMymcUM3RI016eg14
 2kljYVT7i5wEP/Uy+y+bOIhPvwnurI3WH01g5v6RAYoDDC75R88zsNKpOdMz7q4LOyr6
 09ig==
X-Gm-Message-State: APjAAAXyws0dIntaibh+MpaQVW6b8ZCxmDHpNfiYxrpfK07IkpZqYNNc
 8m8TdHMV/JiLB+hf9/NfJ+iIVdIAg3s0kIdnwF9PVL0u
X-Google-Smtp-Source: APXvYqzifOD5JpJXghQP8gSdQVyzrtjSE047ZuXJzjF3/KtPv9wnmfFtxrQbapC9Ac5GUzmq2CMpkwksY7AC4ynsFNk=
X-Received: by 2002:ab0:5ad0:: with SMTP id x16mr15294459uae.124.1559653758540; 
 Tue, 04 Jun 2019 06:09:18 -0700 (PDT)
MIME-Version: 1.0
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 4 Jun 2019 15:09:07 +0200
Message-ID: <CAH9NwWd29gJwr-fF5=3MmWMFv=d26rmKgkgXkf+xrmw5Z_+MuA@mail.gmail.com>
Subject: [MR] etnaviv: seamless cube map
To: The etnaviv authors <etnaviv@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MFgjKdKCUkOPnUMNd2UjPbdf4teurKxNvEqioulpBgU=;
 b=Zmm+ghdqBjNUrMXRD+0yXQe1nfUdcUFCvFJebNk3SCg9CIrg7Lc8D0JcZt7+8x1+e9
 irdbdSV/8wmoGtPGZZsIF3ht2i+Or/L7gp9q+L5eUwBPtTSXGJ0ShIs6rHDhd1+vM4+C
 cf65xb3xKDdwE1SLJNMSUHZh3/iGQ5S+BnKpT7j7fqh0a3oBLsYRWncSGdnyyDNBA7H1
 cB4cEpMOEXJL2A0xmwBiosiB3c58IvDJXeQdRV/S3w70ftfVgl1v4+0BxbrQA+8kVenC
 +zonU313veytTsXF62CnGUOA0Ql7/r2zDeQa4cd+Y4IbspxDePngkvgloffDnRUtf2k8
 i7fg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgYWxsLAoKdGhpcyBNUiBhZGRzIHN1cHBvcnQgZm9yIEdMX0FSQl9zZWFtbGVzc19jdWJlbWFw
X3Blcl90ZXh0dXJlIGFuZApzaG91bGQgYnJpbmcgdXMgaW50byBodHRwczovL21lc2FtYXRyaXgu
bmV0CgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL21lcmdlX3JlcXVl
c3RzLzk5NwoKLS0gCmdyZWV0cwotLQpDaHJpc3RpYW4gR21laW5lciwgTVNjCgpodHRwczovL2No
cmlzdGlhbi1nbWVpbmVyLmluZm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZXRuYXZpdiBtYWlsaW5nIGxpc3QKZXRuYXZpdkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ldG5h
dml2
