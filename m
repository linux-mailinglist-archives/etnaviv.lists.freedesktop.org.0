Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC892D9EF
	for <lists+etnaviv@lfdr.de>; Wed, 29 May 2019 12:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80AC6E0CC;
	Wed, 29 May 2019 10:04:27 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DC46E0D3
 for <etnaviv@lists.freedesktop.org>; Wed, 29 May 2019 10:04:26 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id c3so1436221otr.3
 for <etnaviv@lists.freedesktop.org>; Wed, 29 May 2019 03:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13c0mbC7+ds2yXXJ3DaA+L1/U9A1BELXbFm0LH4rlTA=;
 b=lbK8c0gYnsTzSAM7uAqHWnFIWxLnZWA0Xp38JBBEEZoqbDHHhvhYiU5XxllsGTC1eA
 EwG16GW8vfhhykCixgfi0v0hHIXjN8m/KUxBnWvZh1YAKBch9WzqnTDWQRbmcsMof9od
 EqmOtBCr4k1AUuRg60KStnduIVSNarwhFHyHinncsc11LBNUztZ4YStB7YiAVxR3Xv3s
 2iTvGLznk/qRWa30aQ+LAoNHetUMy8OXHDuawaTHM+QUhKEcCHRCkosxeNLd7tVBjH10
 wXb++XZdrvs6Q6IubSIwZUEzQJyrttnXAUR3a6sB6toFK165fILQ7X/UgtfulaYZFU7O
 R/Vg==
X-Gm-Message-State: APjAAAVB2TBMPwY2L2fLxteHoyqxuyjdh9baPoZ5rCo44EGs6yDN43bC
 sXw1gLd15oeh8DyRNjGdOOe6UY+3WkBYxucSmrts/g==
X-Google-Smtp-Source: APXvYqzxEHZ2F8popm7OudJh2V+jExOKmzFaydsKhIyP4x2zc24+wXDtrJxOiJVSODv7slaOIvJI9btC80pHmoEyqdY=
X-Received: by 2002:a9d:7414:: with SMTP id n20mr30364245otk.106.1559124265751; 
 Wed, 29 May 2019 03:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <1545938887-22901-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1545938887-22901-1-git-send-email-andrey.grodzovsky@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 29 May 2019 12:04:14 +0200
Message-ID: <CAKMK7uG=DUmwg85oe08PhfLHxxv9tp_et2LSjZLKeaf_o-6c-g@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] drm/sched: Refactor ring mirror list handling.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=13c0mbC7+ds2yXXJ3DaA+L1/U9A1BELXbFm0LH4rlTA=;
 b=GAAxJAvhUhXQjgHIhQcBWYFst6/n8mATFLrJiyqhgaLMmncR14wh+CsOaGjjvHODQs
 sj9bhqaRZB4OtPYOvrXB2XY/NsbWbv1A2bnNwHETaqxhYb82NZYmzukgwUpx2TFN4vEI
 BOsRX6WYQPG/cviKLvSNIZDXjGvoRNekutsYM=
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Anholt, Eric" <eric@anholt.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Liu, Monk" <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgMjcsIDIwMTggYXQgODoyOCBQTSBBbmRyZXkgR3JvZHpvdnNreQo8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4gd3JvdGU6Cj4KPiBEZWNhdXBsZSBzY2hlZCB0aHJlYWRzIHN0
b3AgYW5kIHN0YXJ0IGFuZCByaW5nIG1pcnJvcgo+IGxpc3QgaGFuZGxpbmcgZnJvbSB0aGUgcG9s
aWN5IG9mIHdoYXQgdG8gZG8gYWJvdXQgdGhlCj4gZ3VpbHR5IGpvYnMuCj4gV2hlbiBzdG9wcHBp
bmcgdGhlIHNjaGVkIHRocmVhZCBhbmQgZGV0YWNoaW5nIHNjaGVkIGZlbmNlcwo+IGZyb20gbm9u
IHNpZ25hbGVkIEhXIGZlbmVzIHdhaXQgZm9yIGFsbCBzaWduYWxlZCBIVyBmZW5jZXMKPiB0byBj
b21wbGV0ZSBiZWZvcmUgcmVydW5uaW5nIHRoZSBqb2JzLgo+Cj4gdjI6IEZpeCByZXN1Ym1pc3Np
b24gb2YgZ3VpbHR5IGpvYiBpbnRvIEhXIGFmdGVyIHJlZmFjdG9yaW5nLgo+Cj4gdjQ6Cj4gRnVs
bCByZXN0YXJ0IGZvciBhbGwgdGhlIGpvYnMsIG5vdCBvbmx5IGZyb20gZ3VpbHR5IHJpbmcuCj4g
RXh0cmFjdCBrYXJtYSBpbmNyZWFzZSBpbnRvIHN0YW5kYWxvbmUgZnVuY3Rpb24uCj4KPiB2NToK
PiBSZXdvcmsgd2FpdGluZyBmb3Igc2lnbmFsZWQgam9icyB3aXRob3V0IHJlbHlpbmcgb24gdGhl
IGpvYgo+IHN0cnVjdCBpdHNlbGYgYXMgdGhvc2UgbWlnaHQgYWxyZWFkeSBiZSBmcmVlZCBmb3Ig
bm9uICdndWlsdHknCj4gam9iJ3Mgc2NoZWR1bGVycy4KPiBFeHBvc2Uga2FybWEgaW5jcmVhc2Ug
dG8gZHJpdmVycy4KPgo+IHY2Ogo+IFVzZSBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmVfY29udGlu
dWUgYW5kIGRybV9zY2hlZF9wcm9jZXNzX2pvYgo+IGluIGNhc2UgZmVuY2UgYWxyZWFkeSBzaWdu
YWxlZC4KPiBDYWxsIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSBvbmx5IG9uY2UgZm9yIGFtZGdw
dSBhbmQgYWRkIGRvY3VtZW50YXRpb24uCj4KPiBTdWdnZXN0ZWQtYnk6IENocmlzdGlhbiBLb2Vu
aWcgPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3Jv
ZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KCi4vZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmM6NDI5OiB3YXJuaW5nOiBGdW5jdGlvbgpwYXJhbWV0ZXIgb3Ig
bWVtYmVyICdmdWxsX3JlY292ZXJ5JyBub3QgZGVzY3JpYmVkIGluICdkcm1fc2NoZWRfc3RhcnQn
CgpQbGVhc2UgZml4LCB0aGFua3MuCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8ICAyMCArKy0KPiAgZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9zY2hlZC5jICAgIHwgIDExICstCj4gIGRyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jICAgICB8IDE5NSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jICAgICAgICAgICAgfCAgMTIgKy0K
PiAgaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oICAgICAgICAgICAgICAgIHwgICA4ICstCj4g
IDUgZmlsZXMgY2hhbmdlZCwgMTU3IGluc2VydGlvbnMoKyksIDg5IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IDk4ZGY4
ZTQuLjZhMDYwMWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCj4gQEAgLTMyOTgsMTcgKzMyOTgsMTUgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNl
X3ByZV9hc2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgICAgICAgICAg
ICAgICBpZiAoIXJpbmcgfHwgIXJpbmctPnNjaGVkLnRocmVhZCkKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBjb250aW51ZTsKPgo+IC0gICAgICAgICAgICAgICBrdGhyZWFkX3BhcmsocmluZy0+
c2NoZWQudGhyZWFkKTsKPiAtCj4gLSAgICAgICAgICAgICAgIGlmIChqb2IgJiYgam9iLT5iYXNl
LnNjaGVkICE9ICZyaW5nLT5zY2hlZCkKPiAtICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPiAtCj4gLSAgICAgICAgICAgICAgIGRybV9zY2hlZF9od19qb2JfcmVzZXQoJnJpbmctPnNj
aGVkLCBqb2IgPyAmam9iLT5iYXNlIDogTlVMTCk7Cj4gKyAgICAgICAgICAgICAgIGRybV9zY2hl
ZF9zdG9wKCZyaW5nLT5zY2hlZCwgam9iID8gJmpvYi0+YmFzZSA6IE5VTEwpOwo+Cj4gICAgICAg
ICAgICAgICAgIC8qIGFmdGVyIGFsbCBodyBqb2JzIGFyZSByZXNldCwgaHcgZmVuY2UgaXMgbWVh
bmluZ2xlc3MsIHNvIGZvcmNlX2NvbXBsZXRpb24gKi8KPiAgICAgICAgICAgICAgICAgYW1kZ3B1
X2ZlbmNlX2RyaXZlcl9mb3JjZV9jb21wbGV0aW9uKHJpbmcpOwo+ICAgICAgICAgfQo+Cj4gKyAg
ICAgICBpZihqb2IpCj4gKyAgICAgICAgICAgICAgIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSgm
am9iLT5iYXNlKTsKPiArCj4KPgo+ICAgICAgICAgaWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikp
IHsKPiBAQCAtMzQ1NCwxNCArMzQ1MiwxMCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZGV2aWNlX3Bv
c3RfYXNpY19yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICAgICAgICAgICAg
ICAgaWYgKCFyaW5nIHx8ICFyaW5nLT5zY2hlZC50aHJlYWQpCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgY29udGludWU7Cj4KPiAtICAgICAgICAgICAgICAgLyogb25seSBuZWVkIHJlY292ZXJ5
IHNjaGVkIG9mIHRoZSBnaXZlbiBqb2IncyByaW5nCj4gLSAgICAgICAgICAgICAgICAqIG9yIGFs
bCByaW5ncyAoaW4gdGhlIGNhc2UgQGpvYiBpcyBOVUxMKQo+IC0gICAgICAgICAgICAgICAgKiBh
ZnRlciBhYm92ZSBhbWRncHVfcmVzZXQgYWNjb21wbGlzaGVkCj4gLSAgICAgICAgICAgICAgICAq
Lwo+IC0gICAgICAgICAgICAgICBpZiAoKCFqb2IgfHwgam9iLT5iYXNlLnNjaGVkID09ICZyaW5n
LT5zY2hlZCkgJiYgIWFkZXYtPmFzaWNfcmVzZXRfcmVzKQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGRybV9zY2hlZF9qb2JfcmVjb3ZlcnkoJnJpbmctPnNjaGVkKTsKPiArICAgICAgICAgICAg
ICAgaWYgKCFhZGV2LT5hc2ljX3Jlc2V0X3JlcykKPiArICAgICAgICAgICAgICAgICAgICAgICBk
cm1fc2NoZWRfcmVzdWJtaXRfam9icygmcmluZy0+c2NoZWQpOwo+Cj4gLSAgICAgICAgICAgICAg
IGt0aHJlYWRfdW5wYXJrKHJpbmctPnNjaGVkLnRocmVhZCk7Cj4gKyAgICAgICAgICAgICAgIGRy
bV9zY2hlZF9zdGFydCgmcmluZy0+c2NoZWQsICFhZGV2LT5hc2ljX3Jlc2V0X3Jlcyk7Cj4gICAg
ICAgICB9Cj4KPiAgICAgICAgIGlmICghYW1kZ3B1X2RldmljZV9oYXNfZGNfc3VwcG9ydChhZGV2
KSkgewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3NjaGVk
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3NjaGVkLmMKPiBpbmRleCA0OWE2
NzYzLi42ZjEyNjhmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfc2NoZWQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfc2NoZWQu
Ywo+IEBAIC0xMDksMTYgKzEwOSwxOSBAQCBzdGF0aWMgdm9pZCBldG5hdml2X3NjaGVkX3RpbWVk
b3V0X2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQo+ICAgICAgICAgfQo+Cj4g
ICAgICAgICAvKiBibG9jayBzY2hlZHVsZXIgKi8KPiAtICAgICAgIGt0aHJlYWRfcGFyayhncHUt
PnNjaGVkLnRocmVhZCk7Cj4gLSAgICAgICBkcm1fc2NoZWRfaHdfam9iX3Jlc2V0KCZncHUtPnNj
aGVkLCBzY2hlZF9qb2IpOwo+ICsgICAgICAgZHJtX3NjaGVkX3N0b3AoJmdwdS0+c2NoZWQsIHNj
aGVkX2pvYik7Cj4gKwo+ICsgICAgICAgaWYoc2NoZWRfam9iKQo+ICsgICAgICAgICAgICAgICBk
cm1fc2NoZWRfaW5jcmVhc2Vfa2FybWEoc2NoZWRfam9iKTsKPgo+ICAgICAgICAgLyogZ2V0IHRo
ZSBHUFUgYmFjayBpbnRvIHRoZSBpbml0IHN0YXRlICovCj4gICAgICAgICBldG5hdml2X2NvcmVf
ZHVtcChncHUpOwo+ICAgICAgICAgZXRuYXZpdl9ncHVfcmVjb3Zlcl9oYW5nKGdwdSk7Cj4KPiAr
ICAgICAgIGRybV9zY2hlZF9yZXN1Ym1pdF9qb2JzKCZncHUtPnNjaGVkKTsKPiArCj4gICAgICAg
ICAvKiByZXN0YXJ0IHNjaGVkdWxlciBhZnRlciBHUFUgaXMgdXNhYmxlIGFnYWluICovCj4gLSAg
ICAgICBkcm1fc2NoZWRfam9iX3JlY292ZXJ5KCZncHUtPnNjaGVkKTsKPiAtICAgICAgIGt0aHJl
YWRfdW5wYXJrKGdwdS0+c2NoZWQudGhyZWFkKTsKPiArICAgICAgIGRybV9zY2hlZF9zdGFydCgm
Z3B1LT5zY2hlZCwgdHJ1ZSk7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBldG5hdml2X3NjaGVkX2Zy
ZWVfam9iKHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmMKPiBpbmRleCBkYmI2OTA2Li41NGU4MDliIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiBAQCAtNjAsOCArNjAsNiBAQAo+Cj4g
IHN0YXRpYyB2b2lkIGRybV9zY2hlZF9wcm9jZXNzX2pvYihzdHJ1Y3QgZG1hX2ZlbmNlICpmLCBz
dHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYik7Cj4KPiAtc3RhdGljIHZvaWQgZHJtX3NjaGVkX2V4cGVs
X2pvYl91bmxvY2tlZChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IpOwo+IC0KPiAgLyoqCj4g
ICAqIGRybV9zY2hlZF9ycV9pbml0IC0gaW5pdGlhbGl6ZSBhIGdpdmVuIHJ1biBxdWV1ZSBzdHJ1
Y3QKPiAgICoKPiBAQCAtMzM1LDYgKzMzMyw1MSBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfam9i
X3RpbWVkb3V0KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgICAgICAgIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7Cj4gIH0KPgo+ICsgLyoq
Cj4gKyAgKiBkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWEgLSBVcGRhdGUgc2NoZWRfZW50aXR5IGd1
aWx0eSBmbGFnCj4gKyAgKgo+ICsgICogQGJhZDogVGhlIGpvYiBndWlsdHkgb2YgdGltZSBvdXQK
PiArICAqCj4gKyAgKiBJbmNyZW1lbnQgb24gZXZlcnkgaGFuZyBjYXVzZWQgYnkgdGhlICdiYWQn
IGpvYi4gSWYgdGhpcyBleGNlZWRzIHRoZSBoYW5nCj4gKyAgKiBsaW1pdCBvZiB0aGUgc2NoZWR1
bGVyIHRoZW4gdGhlIHJlc3BlY3RpdmUgc2NoZWQgZW50aXR5IGlzIG1hcmtlZCBndWlsdHkgYW5k
Cj4gKyAgKiBqb2JzIGZyb20gaXQgd2lsbCBub3QgYmUgc2NoZWR1bGVkIGZ1cnRoZXIKPiArICAq
Lwo+ICt2b2lkIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYShzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAq
YmFkKQo+ICt7Cj4gKyAgICAgICBpbnQgaTsKPiArICAgICAgIHN0cnVjdCBkcm1fc2NoZWRfZW50
aXR5ICp0bXA7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5Owo+ICsg
ICAgICAgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCA9IGJhZC0+c2NoZWQ7Cj4gKwo+
ICsgICAgICAgLyogZG9uJ3QgaW5jcmVhc2UgQGJhZCdzIGthcm1hIGlmIGl0J3MgZnJvbSBLRVJO
RUwgUlEsCj4gKyAgICAgICAgKiBiZWNhdXNlIHNvbWV0aW1lcyBHUFUgaGFuZyB3b3VsZCBjYXVz
ZSBrZXJuZWwgam9icyAobGlrZSBWTSB1cGRhdGluZyBqb2JzKQo+ICsgICAgICAgICogY29ycnVw
dCBidXQga2VlcCBpbiBtaW5kIHRoYXQga2VybmVsIGpvYnMgYWx3YXlzIGNvbnNpZGVyZWQgZ29v
ZC4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKGJhZC0+c19wcmlvcml0eSAhPSBEUk1fU0NI
RURfUFJJT1JJVFlfS0VSTkVMKSB7Cj4gKyAgICAgICAgICAgICAgIGF0b21pY19pbmMoJmJhZC0+
a2FybWEpOwo+ICsgICAgICAgICAgICAgICBmb3IgKGkgPSBEUk1fU0NIRURfUFJJT1JJVFlfTUlO
OyBpIDwgRFJNX1NDSEVEX1BSSU9SSVRZX0tFUk5FTDsKPiArICAgICAgICAgICAgICAgICAgICBp
KyspIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycSA9
ICZzY2hlZC0+c2NoZWRfcnFbaV07Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNwaW5f
bG9jaygmcnEtPmxvY2spOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGxpc3RfZm9yX2VhY2hf
ZW50cnlfc2FmZShlbnRpdHksIHRtcCwgJnJxLT5lbnRpdGllcywgbGlzdCkgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGJhZC0+c19mZW5jZS0+c2NoZWR1bGVkLmNvbnRl
eHQgPT0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnRpdHktPmZlbmNl
X2NvbnRleHQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYg
KGF0b21pY19yZWFkKCZiYWQtPmthcm1hKSA+Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBiYWQtPnNjaGVkLT5oYW5nX2xpbWl0KQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChlbnRpdHktPmd1aWx0eSkKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGF0
b21pY19zZXQoZW50aXR5LT5ndWlsdHksIDEpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0K
PiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3Bp
bl91bmxvY2soJnJxLT5sb2NrKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoJmVudGl0
eS0+bGlzdCAhPSAmcnEtPmVudGl0aWVzKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiArfQo+ICtFWFBPUlRf
U1lNQk9MKGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYSk7Cj4gKwo+ICAvKioKPiAgICogZHJtX3Nj
aGVkX2h3X2pvYl9yZXNldCAtIHN0b3AgdGhlIHNjaGVkdWxlciBpZiBpdCBjb250YWlucyB0aGUg
YmFkIGpvYgo+ICAgKgo+IEBAIC0zNDIsMTMgKzM4NSwyMiBAQCBzdGF0aWMgdm9pZCBkcm1fc2No
ZWRfam9iX3RpbWVkb3V0KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgICogQGJhZDogYmFk
IHNjaGVkdWxlciBqb2IKPiAgICoKPiAgICovCj4gLXZvaWQgZHJtX3NjaGVkX2h3X2pvYl9yZXNl
dChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkLCBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAq
YmFkKQo+ICt2b2lkIGRybV9zY2hlZF9zdG9wKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2No
ZWQsIHN0cnVjdCBkcm1fc2NoZWRfam9iICpiYWQpCj4gIHsKPiAtICAgICAgIHN0cnVjdCBkcm1f
c2NoZWRfam9iICpzX2pvYjsKPiAtICAgICAgIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRp
dHksICp0bXA7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IsICp0bXA7Cj4g
ICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+IC0gICAgICAgaW50IGk7Cj4gKyAgICAgICBz
dHJ1Y3QgZG1hX2ZlbmNlICp3YWl0X2ZlbmNlID0gIE5VTEw7Cj4gKyAgICAgICBpbnQgcjsKPiAr
Cj4gKyAgICAgICBrdGhyZWFkX3Bhcmsoc2NoZWQtPnRocmVhZCk7Cj4KPiArICAgICAgIC8qCj4g
KyAgICAgICAgKiBWZXJpZnkgYWxsIHRoZSBzaWduYWxlZCBqb2JzIGluIG1pcnJvciBsaXN0IGFy
ZSByZW1vdmVkIGZyb20gdGhlIHJpbmcKPiArICAgICAgICAqIGJ5IHdhaXRpbmcgZm9yIHRoZWly
IHJlc3BlY3RpdmUgc2NoZWR1bGVyIGZlbmNlcyB0byBzaWduYWwuCj4gKyAgICAgICAgKiBDb250
aW51YWxseSAgcmVwZWF0IHRyYXZlcnNpbmcgdGhlIHJpbmcgbWlycm9yIGxpc3QgdW50aWwgbm8g
bW9yZSBzaWduYWxlZAo+ICsgICAgICAgICogZmVuY2VzIGFyZSBmb3VuZAo+ICsgICAgICAgICov
Cj4gK3JldHJ5X3dhaXQ6Cj4gICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9s
aXN0X2xvY2ssIGZsYWdzKTsKPiAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfcmV2ZXJzZShz
X2pvYiwgJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0LCBub2RlKSB7Cj4gICAgICAgICAgICAgICAg
IGlmIChzX2pvYi0+c19mZW5jZS0+cGFyZW50ICYmCj4gQEAgLTM1NywzNSArNDA5LDQzIEBAIHZv
aWQgZHJtX3NjaGVkX2h3X2pvYl9yZXNldChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVk
LCBzdHJ1Y3QgZHJtX3NjaGVkX2pvCj4gICAgICAgICAgICAgICAgICAgICAgICAgZG1hX2ZlbmNl
X3B1dChzX2pvYi0+c19mZW5jZS0+cGFyZW50KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBz
X2pvYi0+c19mZW5jZS0+cGFyZW50ID0gTlVMTDsKPiAgICAgICAgICAgICAgICAgICAgICAgICBh
dG9taWNfZGVjKCZzY2hlZC0+aHdfcnFfY291bnQpOwo+ICsgICAgICAgICAgICAgICB9IGVsc2Ug
ewo+ICsgICAgICAgICAgICAgICAgICAgICAgICB3YWl0X2ZlbmNlID0gZG1hX2ZlbmNlX2dldCgm
c19qb2ItPnNfZmVuY2UtPmZpbmlzaGVkKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPiAtICAgICAgIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7Cj4KPiAtICAgICAgIGlm
IChiYWQgJiYgYmFkLT5zX3ByaW9yaXR5ICE9IERSTV9TQ0hFRF9QUklPUklUWV9LRVJORUwpIHsK
PiAtICAgICAgICAgICAgICAgYXRvbWljX2luYygmYmFkLT5rYXJtYSk7Cj4gLSAgICAgICAgICAg
ICAgIC8qIGRvbid0IGluY3JlYXNlIEBiYWQncyBrYXJtYSBpZiBpdCdzIGZyb20gS0VSTkVMIFJR
LAo+IC0gICAgICAgICAgICAgICAgKiBiZWN1YXNlIHNvbWV0aW1lcyBHUFUgaGFuZyB3b3VsZCBj
YXVzZSBrZXJuZWwgam9icyAobGlrZSBWTSB1cGRhdGluZyBqb2JzKQo+IC0gICAgICAgICAgICAg
ICAgKiBjb3JydXB0IGJ1dCBrZWVwIGluIG1pbmQgdGhhdCBrZXJuZWwgam9icyBhbHdheXMgY29u
c2lkZXJlZCBnb29kLgo+IC0gICAgICAgICAgICAgICAgKi8KPiAtICAgICAgICAgICAgICAgZm9y
IChpID0gRFJNX1NDSEVEX1BSSU9SSVRZX01JTjsgaSA8IERSTV9TQ0hFRF9QUklPUklUWV9LRVJO
RUw7IGkrKyApIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX3Jx
ICpycSA9ICZzY2hlZC0+c2NoZWRfcnFbaV07Cj4gKyAgICAgICAvKiBObyBzaWduYWxlZCBqb2Jz
IGluIHRoZSByaW5nLCBpdHMgc2FmZSB0byBwcm9jZWVkIHRvIEFTSUMgcmVzZXQgKi8KPiArICAg
ICAgIGlmICghd2FpdF9mZW5jZSkgewo+ICsgICAgICAgICAgICAgICBzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwo+ICsgICAgICAgICAgICAgICBy
ZXR1cm47Cj4gKyAgICAgICB9Cj4KPiAtICAgICAgICAgICAgICAgICAgICAgICBzcGluX2xvY2so
JnJxLT5sb2NrKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5
X3NhZmUoZW50aXR5LCB0bXAsICZycS0+ZW50aXRpZXMsIGxpc3QpIHsKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGlmIChiYWQtPnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0ID09
IGVudGl0eS0+ZmVuY2VfY29udGV4dCkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChhdG9taWNfcmVhZCgmYmFkLT5rYXJtYSkgPiBiYWQtPnNjaGVkLT5oYW5nX2xp
bWl0KQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlm
IChlbnRpdHktPmd1aWx0eSkKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGF0b21pY19zZXQoZW50aXR5LT5ndWlsdHksIDEpOwo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgICAgICAgICAgICB9Cj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKPiAtICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoJmVudGl0eS0+bGlzdCAhPSAmcnEtPmVudGl0aWVzKQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAvKiBSZXN0b3JlIHJlbW92
ZWQgY2Igc2luY2UgcmVtb3ZpbmcgYWdhaW4gYWxyZWFkeSByZW1vdmVkIGNiIGlzIHVuZGVmaW5l
ZCAqLwo+ICsgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlX2NvbnRpbnVlKHNfam9iLCB0
bXAsICZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwgbm9kZSkgewo+ICsKPiArICAgICAgICAgICAg
ICAgaWYgKHNfam9iLT5zX2ZlbmNlLT5wYXJlbnQpIHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICByID0gZG1hX2ZlbmNlX2FkZF9jYWxsYmFjayhzX2pvYi0+c19mZW5jZS0+cGFyZW50LAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzX2pvYi0+
c19mZW5jZS0+Y2IsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZHJtX3NjaGVkX3Byb2Nlc3Nfam9iKTsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBpZiAociA9PSAtRU5PRU5UKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJt
X3NjaGVkX3Byb2Nlc3Nfam9iKHNfam9iLT5zX2ZlbmNlLT5wYXJlbnQsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnNfam9iLT5zX2ZlbmNl
LT5jYik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZWxzZSBpZiAocikKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigiZmVuY2UgYWRkIGNhbGxiYWNrIGZhaWxl
ZCAoJWQpXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHIp
Owo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4gKyAgICAgICBzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwo+ICsKPiArICAgICAgIGRt
YV9mZW5jZV93YWl0KHdhaXRfZmVuY2UsIGZhbHNlKTsKPiArICAgICAgIGRtYV9mZW5jZV9wdXQo
d2FpdF9mZW5jZSk7Cj4gKyAgICAgICB3YWl0X2ZlbmNlID0gTlVMTDsKPiArCj4gKyAgICAgICBn
b3RvIHJldHJ5X3dhaXQ7Cj4gIH0KPiAtRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfaHdfam9iX3Jl
c2V0KTsKPiArCj4gK0VYUE9SVF9TWU1CT0woZHJtX3NjaGVkX3N0b3ApOwo+Cj4gIC8qKgo+ICAg
KiBkcm1fc2NoZWRfam9iX3JlY292ZXJ5IC0gcmVjb3ZlciBqb2JzIGFmdGVyIGEgcmVzZXQKPiBA
QCAtMzkzLDMzICs0NTMsMjEgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfaHdfam9iX3Jlc2V0
KTsKPiAgICogQHNjaGVkOiBzY2hlZHVsZXIgaW5zdGFuY2UKPiAgICoKPiAgICovCj4gLXZvaWQg
ZHJtX3NjaGVkX2pvYl9yZWNvdmVyeShzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQo+
ICt2b2lkIGRybV9zY2hlZF9zdGFydChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkLCBi
b29sIGZ1bGxfcmVjb3ZlcnkpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBkcm1fc2NoZWRfam9iICpz
X2pvYiwgKnRtcDsKPiAtICAgICAgIGJvb2wgZm91bmRfZ3VpbHR5ID0gZmFsc2U7Cj4gICAgICAg
ICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICAgICAgICAgaW50IHI7Cj4KPiArICAgICAgIGlmICgh
ZnVsbF9yZWNvdmVyeSkKPiArICAgICAgICAgICAgICAgZ290byB1bnBhcms7Cj4gKwo+ICAgICAg
ICAgc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7Cj4gICAg
ICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoc19qb2IsIHRtcCwgJnNjaGVkLT5yaW5nX21p
cnJvcl9saXN0LCBub2RlKSB7Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fc2NoZWRfZmVu
Y2UgKnNfZmVuY2UgPSBzX2pvYi0+c19mZW5jZTsKPiAtICAgICAgICAgICAgICAgc3RydWN0IGRt
YV9mZW5jZSAqZmVuY2U7Cj4gLSAgICAgICAgICAgICAgIHVpbnQ2NF90IGd1aWx0eV9jb250ZXh0
Owo+IC0KPiAtICAgICAgICAgICAgICAgaWYgKCFmb3VuZF9ndWlsdHkgJiYgYXRvbWljX3JlYWQo
JnNfam9iLT5rYXJtYSkgPiBzY2hlZC0+aGFuZ19saW1pdCkgewo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGZvdW5kX2d1aWx0eSA9IHRydWU7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgZ3Vp
bHR5X2NvbnRleHQgPSBzX2pvYi0+c19mZW5jZS0+c2NoZWR1bGVkLmNvbnRleHQ7Cj4gLSAgICAg
ICAgICAgICAgIH0KPiAtCj4gLSAgICAgICAgICAgICAgIGlmIChmb3VuZF9ndWlsdHkgJiYgc19q
b2ItPnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0ID09IGd1aWx0eV9jb250ZXh0KQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVk
LCAtRUNBTkNFTEVEKTsKPiAtCj4gLSAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7Cj4gLSAgICAgICAgICAgICAgIGZlbmNl
ID0gc2NoZWQtPm9wcy0+cnVuX2pvYihzX2pvYik7Cj4gLSAgICAgICAgICAgICAgIGF0b21pY19p
bmMoJnNjaGVkLT5od19ycV9jb3VudCk7Cj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfZmVu
Y2UgKmZlbmNlID0gc19qb2ItPnNfZmVuY2UtPnBhcmVudDsKPgo+ICAgICAgICAgICAgICAgICBp
ZiAoZmVuY2UpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBzX2ZlbmNlLT5wYXJlbnQgPSBk
bWFfZmVuY2VfZ2V0KGZlbmNlKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICByID0gZG1hX2Zl
bmNlX2FkZF9jYWxsYmFjayhmZW5jZSwgJnNfZmVuY2UtPmNiLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9zY2hlZF9wcm9jZXNzX2pvYik7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHIgPT0gLUVOT0VOVCkKPiBAQCAtNDI3LDE4
ICs0NzUsNDcgQEAgdm9pZCBkcm1fc2NoZWRfam9iX3JlY292ZXJ5KHN0cnVjdCBkcm1fZ3B1X3Nj
aGVkdWxlciAqc2NoZWQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgZWxzZSBpZiAocikKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigiZmVuY2UgYWRkIGNhbGxi
YWNrIGZhaWxlZCAoJWQpXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHIpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGRtYV9mZW5jZV9wdXQoZmVuY2Up
Owo+IC0gICAgICAgICAgICAgICB9IGVsc2Ugewo+IC0gICAgICAgICAgICAgICAgICAgICAgIGlm
IChzX2ZlbmNlLT5maW5pc2hlZC5lcnJvciA8IDApCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkcm1fc2NoZWRfZXhwZWxfam9iX3VubG9ja2VkKHNfam9iKTsKPiArICAgICAgICAg
ICAgICAgfSBlbHNlCj4gICAgICAgICAgICAgICAgICAgICAgICAgZHJtX3NjaGVkX3Byb2Nlc3Nf
am9iKE5VTEwsICZzX2ZlbmNlLT5jYik7Cj4gLSAgICAgICAgICAgICAgIH0KPiAtICAgICAgICAg
ICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7Cj4g
ICAgICAgICB9Cj4gKwo+ICAgICAgICAgZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2NoZWQpOwo+
ICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZs
YWdzKTsKPiArCj4gK3VucGFyazoKPiArICAgICAgIGt0aHJlYWRfdW5wYXJrKHNjaGVkLT50aHJl
YWQpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZHJtX3NjaGVkX3N0YXJ0KTsKPiArCj4gKy8qKgo+
ICsgKiBkcm1fc2NoZWRfcmVzdWJtaXRfam9icyAtIGhlbHBlciB0byByZWx1bmNoIGpvYiBmcm9t
IG1pcnJvciByaW5nIGxpc3QKPiArICoKPiArICogQHNjaGVkOiBzY2hlZHVsZXIgaW5zdGFuY2UK
PiArICoKPiArICovCj4gK3ZvaWQgZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoc3RydWN0IGRybV9n
cHVfc2NoZWR1bGVyICpzY2hlZCkKPiArewo+ICsgICAgICAgc3RydWN0IGRybV9zY2hlZF9qb2Ig
KnNfam9iLCAqdG1wOwo+ICsgICAgICAgdWludDY0X3QgZ3VpbHR5X2NvbnRleHQ7Cj4gKyAgICAg
ICBib29sIGZvdW5kX2d1aWx0eSA9IGZhbHNlOwo+ICsKPiArICAgICAgIC8qVE9ETyBETyB3ZSBu
ZWVkIHNwaW5sb2NrIGhlcmUgPyAqLwo+ICsgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
KHNfam9iLCB0bXAsICZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwgbm9kZSkgewo+ICsgICAgICAg
ICAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICpzX2ZlbmNlID0gc19qb2ItPnNfZmVuY2U7
Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoIWZvdW5kX2d1aWx0eSAmJiBhdG9taWNfcmVhZCgm
c19qb2ItPmthcm1hKSA+IHNjaGVkLT5oYW5nX2xpbWl0KSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZm91bmRfZ3VpbHR5ID0gdHJ1ZTsKPiArICAgICAgICAgICAgICAgICAgICAgICBndWls
dHlfY29udGV4dCA9IHNfam9iLT5zX2ZlbmNlLT5zY2hlZHVsZWQuY29udGV4dDsKPiArICAgICAg
ICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgaWYgKGZvdW5kX2d1aWx0eSAmJiBzX2pv
Yi0+c19mZW5jZS0+c2NoZWR1bGVkLmNvbnRleHQgPT0gZ3VpbHR5X2NvbnRleHQpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5jZS0+ZmluaXNoZWQs
IC1FQ0FOQ0VMRUQpOwo+ICsKPiArICAgICAgICAgICAgICAgc19qb2ItPnNfZmVuY2UtPnBhcmVu
dCA9IHNjaGVkLT5vcHMtPnJ1bl9qb2Ioc19qb2IpOwo+ICsgICAgICAgICAgICAgICBhdG9taWNf
aW5jKCZzY2hlZC0+aHdfcnFfY291bnQpOwo+ICsgICAgICAgfQo+ICB9Cj4gLUVYUE9SVF9TWU1C
T0woZHJtX3NjaGVkX2pvYl9yZWNvdmVyeSk7Cj4gK0VYUE9SVF9TWU1CT0woZHJtX3NjaGVkX3Jl
c3VibWl0X2pvYnMpOwo+Cj4gIC8qKgo+ICAgKiBkcm1fc2NoZWRfam9iX2luaXQgLSBpbml0IGEg
c2NoZWR1bGVyIGpvYgo+IEBAIC02MzQsMjYgKzcxMSwxNCBAQCBzdGF0aWMgaW50IGRybV9zY2hl
ZF9tYWluKHZvaWQgKnBhcmFtKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJN
X0VSUk9SKCJmZW5jZSBhZGQgY2FsbGJhY2sgZmFpbGVkICglZClcbiIsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcik7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgZG1hX2ZlbmNlX3B1dChmZW5jZSk7Cj4gLSAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKHNfZmVuY2UtPmZpbmlzaGVkLmVycm9yIDwgMCkKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9zY2hlZF9leHBlbF9qb2JfdW5sb2Nr
ZWQoc2NoZWRfam9iKTsKPiArICAgICAgICAgICAgICAgfSBlbHNlCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgZHJtX3NjaGVkX3Byb2Nlc3Nfam9iKE5VTEwsICZzX2ZlbmNlLT5jYik7Cj4gLSAg
ICAgICAgICAgICAgIH0KPgo+ICAgICAgICAgICAgICAgICB3YWtlX3VwKCZzY2hlZC0+am9iX3Nj
aGVkdWxlZCk7Cj4gICAgICAgICB9Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLXN0YXRp
YyB2b2lkIGRybV9zY2hlZF9leHBlbF9qb2JfdW5sb2NrZWQoc3RydWN0IGRybV9zY2hlZF9qb2Ig
KnNfam9iKQo+IC17Cj4gLSAgICAgICBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkID0g
c19qb2ItPnNjaGVkOwo+IC0KPiAtICAgICAgIHNwaW5fbG9jaygmc2NoZWQtPmpvYl9saXN0X2xv
Y2spOwo+IC0gICAgICAgbGlzdF9kZWxfaW5pdCgmc19qb2ItPm5vZGUpOwo+IC0gICAgICAgc3Bp
bl91bmxvY2soJnNjaGVkLT5qb2JfbGlzdF9sb2NrKTsKPiAtfQo+IC0KPiAgLyoqCj4gICAqIGRy
bV9zY2hlZF9pbml0IC0gSW5pdCBhIGdwdSBzY2hlZHVsZXIgaW5zdGFuY2UKPiAgICoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2Rfc2NoZWQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS92M2QvdjNkX3NjaGVkLmMKPiBpbmRleCA0NDViMmVmLi5mNzZkOWVkIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX3NjaGVkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
djNkL3YzZF9zY2hlZC5jCj4gQEAgLTE3OCwxOCArMTc4LDIyIEBAIHYzZF9qb2JfdGltZWRvdXQo
c3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKPiAgICAgICAgIGZvciAocSA9IDA7IHEg
PCBWM0RfTUFYX1FVRVVFUzsgcSsrKSB7Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fZ3B1
X3NjaGVkdWxlciAqc2NoZWQgPSAmdjNkLT5xdWV1ZVtxXS5zY2hlZDsKPgo+IC0gICAgICAgICAg
ICAgICBrdGhyZWFkX3Bhcmsoc2NoZWQtPnRocmVhZCk7Cj4gLSAgICAgICAgICAgICAgIGRybV9z
Y2hlZF9od19qb2JfcmVzZXQoc2NoZWQsIChzY2hlZF9qb2ItPnNjaGVkID09IHNjaGVkID8KPiAr
ICAgICAgICAgICAgICAgZHJtX3NjaGVkX3N0b3Aoc2NoZWQsIChzY2hlZF9qb2ItPnNjaGVkID09
IHNjaGVkID8KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNjaGVkX2pvYiA6IE5VTEwpKTsKPiArCj4gKyAgICAgICAgICAgICAgIGlmKHNjaGVkX2pvYikK
PiArICAgICAgICAgICAgICAgICAgICAgICBkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWEoc2NoZWRf
am9iKTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgLyogZ2V0IHRoZSBHUFUgYmFjayBpbnRvIHRo
ZSBpbml0IHN0YXRlICovCj4gICAgICAgICB2M2RfcmVzZXQodjNkKTsKPgo+ICsgICAgICAgZm9y
IChxID0gMDsgcSA8IFYzRF9NQVhfUVVFVUVTOyBxKyspCj4gKyAgICAgICAgICAgICAgIGRybV9z
Y2hlZF9yZXN1Ym1pdF9qb2JzKHNjaGVkX2pvYi0+c2NoZWQpOwo+ICsKPiAgICAgICAgIC8qIFVu
YmxvY2sgc2NoZWR1bGVycyBhbmQgcmVzdGFydCB0aGVpciBqb2JzLiAqLwo+ICAgICAgICAgZm9y
IChxID0gMDsgcSA8IFYzRF9NQVhfUVVFVUVTOyBxKyspIHsKPiAtICAgICAgICAgICAgICAgZHJt
X3NjaGVkX2pvYl9yZWNvdmVyeSgmdjNkLT5xdWV1ZVtxXS5zY2hlZCk7Cj4gLSAgICAgICAgICAg
ICAgIGt0aHJlYWRfdW5wYXJrKHYzZC0+cXVldWVbcV0uc2NoZWQudGhyZWFkKTsKPiArICAgICAg
ICAgICAgICAgZHJtX3NjaGVkX3N0YXJ0KCZ2M2QtPnF1ZXVlW3FdLnNjaGVkLCB0cnVlKTsKPiAg
ICAgICAgIH0KPgo+ICAgICAgICAgbXV0ZXhfdW5sb2NrKCZ2M2QtPnJlc2V0X2xvY2spOwo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmggYi9pbmNsdWRlL2RybS9ncHVf
c2NoZWR1bGVyLmgKPiBpbmRleCA0N2UxOTc5Li40ZjIxZmFmIDEwMDY0NAo+IC0tLSBhL2luY2x1
ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIu
aAo+IEBAIC0yOTgsOSArMjk4LDExIEBAIGludCBkcm1fc2NoZWRfam9iX2luaXQoc3RydWN0IGRy
bV9zY2hlZF9qb2IgKmpvYiwKPiAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKm93bmVyKTsK
PiAgdm9pZCBkcm1fc2NoZWRfam9iX2NsZWFudXAoc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYik7
Cj4gIHZvaWQgZHJtX3NjaGVkX3dha2V1cChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVk
KTsKPiAtdm9pZCBkcm1fc2NoZWRfaHdfam9iX3Jlc2V0KHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxl
ciAqc2NoZWQsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fc2NoZWRf
am9iICpqb2IpOwo+IC12b2lkIGRybV9zY2hlZF9qb2JfcmVjb3Zlcnkoc3RydWN0IGRybV9ncHVf
c2NoZWR1bGVyICpzY2hlZCk7Cj4gK3ZvaWQgZHJtX3NjaGVkX3N0b3Aoc3RydWN0IGRybV9ncHVf
c2NoZWR1bGVyICpzY2hlZCwKPiArICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fc2NoZWRf
am9iICpqb2IpOwo+ICt2b2lkIGRybV9zY2hlZF9zdGFydChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVs
ZXIgKnNjaGVkLCBib29sIGZ1bGxfcmVjb3ZlcnkpOwo+ICt2b2lkIGRybV9zY2hlZF9yZXN1Ym1p
dF9qb2JzKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpOwo+ICt2b2lkIGRybV9zY2hl
ZF9pbmNyZWFzZV9rYXJtYShzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqYmFkKTsKPiAgYm9vbCBkcm1f
c2NoZWRfZGVwZW5kZW5jeV9vcHRpbWl6ZWQoc3RydWN0IGRtYV9mZW5jZSogZmVuY2UsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHkg
KmVudGl0eSk7Cj4gIHZvaWQgZHJtX3NjaGVkX2ZhdWx0KHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxl
ciAqc2NoZWQpOwo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2aXY=
