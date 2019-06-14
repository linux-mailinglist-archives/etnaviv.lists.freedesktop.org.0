Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84974585D
	for <lists+etnaviv@lfdr.de>; Fri, 14 Jun 2019 11:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFF2895B9;
	Fri, 14 Jun 2019 09:15:04 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD64895B9
 for <etnaviv@lists.freedesktop.org>; Fri, 14 Jun 2019 09:15:02 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id o2so640804uae.10
 for <etnaviv@lists.freedesktop.org>; Fri, 14 Jun 2019 02:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DVFWGKqJ2Yjfa5/UY/Bcvg5YowbNVkhzH96AiIsZJ8s=;
 b=AdJ2AP0RsIfxAUUh08ZsWkJYf/+qCQRlsHI2NkSnKGUzk8/M7dNLQxbENjOpnXQ9WP
 mRZjo0YgWRPaq+BWzF7ylN0vkVgcFb1R57EAOZlX1j6BWm0JmRlod4DOgfWjMfINwsqc
 hKFoRQQXZQLTcADBaM7lbpEpZxQrS2WiIb1jJCs1qaL/DDyYGX7wkkRDm9ahuHyV+t+o
 0Q4ugoNnrAIWi8+OCBK12FLRzJACLVMW2ymihhNAXGUH1QdyXE3BTOudQ2UnhPiopakV
 PwooI9nx/Y38P8TeZo/t16NpEIUOeTiVaVuQz7oenOkDo9vrR4ax5NIhNkPt1722parI
 BpGQ==
X-Gm-Message-State: APjAAAWjV0cj9YuD99xXwTxWtNm6zc6VPJYt9kpx8gbcpDhe8mgEEnnn
 /sKctd73DQPTTomu5s7oCGaWoHOouPqaHghODbQPznUrNGA=
X-Google-Smtp-Source: APXvYqyn9MYCvK+T1sbU0jEq6Bv8hohpPDFBLY8dAVcMSIiJL54rKIgXENCncYJFpge8vEvOt5k0KnqACsCeEUXE+wY=
X-Received: by 2002:ab0:2810:: with SMTP id w16mr8283546uap.118.1560503701290; 
 Fri, 14 Jun 2019 02:15:01 -0700 (PDT)
MIME-Version: 1.0
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 14 Jun 2019 11:15:24 +0200
Message-ID: <CAH9NwWecBNtnjFkFt5KdarGHUCHeJ5RX8bFqyUY3T8Yow-orZQ@mail.gmail.com>
Subject: [MR] etnaviv: add OES_texture_half_float support
To: The etnaviv authors <etnaviv@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DVFWGKqJ2Yjfa5/UY/Bcvg5YowbNVkhzH96AiIsZJ8s=;
 b=d6vETRyHv2bhPnF/5/YxyuRg07NBSxFdMpwC3HnKMvmWj53TxMXkL3qFEvokciRSOO
 /Xwb+tx7NmGpqmCuDATimj+t8/lh6lik+t+9W8OQC5EfunrGm0NUvZR0eigisz98mwoD
 C1DSgU3GW/gaufPncu8cqcQkDa9Z1K+0SFSnkPlKJbUnatBFIsIAe0/hk25cjbMOjd4e
 0aFgg3Qf0b9PyGEPtgLbU/nlp2G8hSGVlLutxwhhWOVCckt2gfczKnhUS5DGKobs5ofs
 NxUaitjejTFny43YY2cWsusquuZLCjzNuM3vHBGvaL7S6t9Xk3C2z67pi12K3keKRkCi
 hHnw==
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

SGkgYWxsLAoKdGhpcyBNUiBhZGRzIHN1cHBvcnQgZm9yIE9FU190ZXh0dXJlX2hhbGZfZmxvYXQg
c3VwcG9ydCAuCgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL21lcmdl
X3JlcXVlc3RzLzExMDAKLS0gCmdyZWV0cwotLQpDaHJpc3RpYW4gR21laW5lciwgTVNjCgpodHRw
czovL2NocmlzdGlhbi1nbWVpbmVyLmluZm8vcHJpdmFjeXBvbGljeQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5h
dml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
