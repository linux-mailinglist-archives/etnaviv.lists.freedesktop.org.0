Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF7E1F881A
	for <lists+etnaviv@lfdr.de>; Sun, 14 Jun 2020 11:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754BE899B3;
	Sun, 14 Jun 2020 09:29:36 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sonic314-19.consmr.mail.gq1.yahoo.com
 (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BAA6E180
 for <etnaviv@lists.freedesktop.org>; Sat, 13 Jun 2020 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1592062656; bh=EdQ6J0sRRv3XBxt3j7IlulUVvRg4uKdicik//r5GkY8=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject;
 b=jdMj1Pf+aKosqFxPEGZAr0J19u8TFSylDMIC1K3j/TJ3gcVp7p0LSZ9KnrV/qUZY5zFM4oTv9l0dZ4CQdVIWmMyE5oJjRv3taLPo9h6vfwH6hjje6r6ERkzuMkJq5lWHxZRzqUhQ3rtThDvyflqLqckldxCgof8HFs5vflWifOTZmbfAHcTxE+bx4REROLycN7p7oH1mxNsDQJnb9aityeQBs2eB6ctN5qOvG1s18gLBBL42hC+mIPyL89Ii4E74YxdnJJMSTElHcPvD0YAfUNE1qCX2MxQ5uE3bkzqYnBVp6nXJ3w2M+NbLoq8ZWiFrcJZl1t7obRYl6Yb2LvWMvQ==
X-YMail-OSG: 426Ijf8VM1mV_kgIKsodz0fmPJHRsO.w4nhJnOThikY89sZz8FQR714CTDcreNt
 TxrzcbRG8BrIiRXYwlfLUIX8P8q4g3P5gm3fd2fpXr_bPxJlIPPGBPcXm_lNTKVGccPH.qFSXqZu
 KdtgVFhLJEkbqs5G929j4aV9NAm4n1VbW8fS4xrtRbuUzfLKKLNza_2bGXDGB2BiRfnazmRJ20xc
 pejDtF6TAS9cepvhGWdiPxu.f_f8hjlMAxgpwyjsSNJZjxAdT2mNtZHh06gQPzcXel70WNkSwBQJ
 Y2dq_0kRl1fWRwBlGu7ccLlyrnaxCmniTjtQ23BAbisXgEjZuPiSn2pJJUKjIb4OvAnuh5G1gwTy
 x98GWSqU6qvIf7Y0evEAdmwvFze12ZLQx1cPZNy3PfQ39EqOheMn.7aqo7sAZlOF05vNu1HvgooV
 OR.4w_Z.fj9cEt18KsvHCnvK2aeEhWw2lFnBZlziH6IshZm39yAGQg7vMgbl1kb4twZ.BoqGAJ9N
 a9_4v0bgh82GHKtdnGyc8iLF5j3AvJSk51NgzeRMXzMTySSuB3il25w3AbLSiem5YjXgq6wy2OrZ
 qD1wjijJZohheSPfZqPvH44mswKHai86S8oH3Jt1xZJXsPrPKieTFWJnVAZGb6cBQiiNlMVRX70y
 Yeu1UVzUyd9nz.1FuZz1npijOn7bbLqSgRM73VmhkHlqS2Yoq.pNfH3lR1RqXzDXRn2FcqOWYIco
 WokrJ5BMcpjtMEStBKOpWAhMO3aYXFQrRcBJTKtWbNTIpPqodLAQUo5.XL7k14AwLBieM17cBilP
 kZehbCLXFMcK_.psnrw4aoJEAHQmx_AqxKkDRFTwolmA2MUXdtY_uoYACEuLt6nzOHpNmC.OU_cs
 4lRCxloiVABt_gfT9HX09RhPC_OZSpm48FE_ewr70.qlNIcrZhvbHqJHym8NCnox80kakIWzucZM
 qt5wl631AxbM2YBubH1L4SDbQQrBHmQyjODdid7cBkaMlX5MzcxDa8OmbwFpXD.g2JKtq_y9ZbM0
 hmNmIf0d_zz_xUxc.z58PetElfgjsyWPBaDybVhm5whY6TPgvVSTbJ4qYg87w52uyvS4wvx57Wvo
 mlhe_juGV2c6VQ_UrEbXI6TybCeia2bPMzmpH9mzyFmjx4t5HniHxqO4EWdusOij926b2b56Ecn0
 yZesPIvK6_QMd2eLFo52NoQzl9cBTFDUBklfg9CL2L41xZCy2zzy7dHWo9oqWv.EA6qzxrvMVvid
 ItWJrIazP1sxYrIqMRRM9BtD.jw.gxvXQqMA5bZQyO9jBcogU36jf3UBSSWBk8w--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Sat, 13 Jun 2020 15:37:36 +0000
Date: Sat, 13 Jun 2020 15:37:34 +0000 (UTC)
From: Rose Gomo <rose_gomo101@yahoo.com>
To: rose_gomo101@yahoo.com
Message-ID: <457052051.273526.1592062654796@mail.yahoo.com>
Subject: Dear Good Friend.
MIME-Version: 1.0
References: <457052051.273526.1592062654796.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16119 YMailNodin Mozilla/4.0 (compatible; MSIE 8.0;
 Windows NT 6.1; Trident/4.0; GTB7.5; SLCC2; .NET CLR 2.0.50727;
 .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2)
X-Mailman-Approved-At: Sun, 14 Jun 2020 09:29:35 +0000
X-BeenThere: etnaviv@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <etnaviv.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/etnaviv>
List-Post: <mailto:etnaviv@lists.freedesktop.org>
List-Help: <mailto:etnaviv-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=subscribe>
Reply-To: rose_gomo101@yahoo.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

RGVhciBHb29kIEZyaWVuZC4KClBsZWFzZSBjYW4geW91IGhlbHAgbWUgdG8gcmVjZWl2ZSB0aGUg
ZnVuZCBJIGluaGVyaXRlZCBmcm9tIG15IGZhdGhlciB0byB5b3VyIGFjY291bnQgaW4geW91ciBj
b3VudHJ5IGZvciBidXNpbmVzcyBpbnZlc3RtZW50PyBSaWdodCBub3cgdGhlIGZ1bmQgaXMgaW4g
dGhlIGJhbmsgaGVyZSB3aGVyZSBteSBmYXRoZXIgZGVwb3NpdGVkIGl0IGJlZm9yZSBoZSBkaWVk
IGFuZCB0aGUgYW1vdW50IGlzIOKCrDIuNW1pbGxpb24gRXVyb3MgKFR3byBNaWxsaW9uIEZpdmUg
SHVuZHJlZCBUaG91c2FuZCBFdXJvcykKClBsZWFzZSBpZiB5b3UgYXJlIGludGVyZXN0ZWQgeW91
IGNhbiBjb250YWN0IG1lIGFzIHNvb24gYXMgcG9zc2libGUgZm9yIG1vcmUgZGV0YWlscy4KCkJl
c3QgcmVnYXJkcwpSb3NlIEdvbW8uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmV0bmF2aXYgbWFpbGluZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRu
YXZpdgo=
