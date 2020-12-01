Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107F52C9F56
	for <lists+etnaviv@lfdr.de>; Tue,  1 Dec 2020 11:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67C16E52F;
	Tue,  1 Dec 2020 10:33:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397886E52F
 for <etnaviv@lists.freedesktop.org>; Tue,  1 Dec 2020 10:33:39 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kk2yX-0000TZ-Pq; Tue, 01 Dec 2020 11:33:37 +0100
Message-ID: <aae1aea6ce45048253cb329b73bd16793e90404b.camel@pengutronix.de>
Subject: Re: GC300 2D unit won't work with GC2000 3D disabled on MMP3
From: Lucas Stach <l.stach@pengutronix.de>
To: Lubomir Rintel <lkundrak@v3.sk>, etnaviv@lists.freedesktop.org
Date: Tue, 01 Dec 2020 11:33:36 +0100
In-Reply-To: <20201130170745.GA1666321@demiurge.local>
References: <20201130170745.GA1666321@demiurge.local>
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Ivan Najdanovic <najdanovicivan@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

SGkgTHVib21pciwKCkFtIE1vbnRhZywgZGVuIDMwLjExLjIwMjAsIDE4OjA3ICswMTAwIHNjaHJp
ZWIgTHVib21pciBSaW50ZWw6CkhlbGxvLAoKKGFkZGluZyBJdmFuIHRvIENjLCBzaW5jZSBoZSBi
cm91Z2h0IHRoZSBpc3N1ZSB1cCBwcml2YXRlbHkuIEl2YW4sCmV0bmF2aXZAIGlzIGEgbW9kZXJh
dGVkIGxpc3QsIHBsZWFzZSBzdWJzY3JpYmUgaWYgeW91J3JlIGdvaW5nIHRvCnJlcGx5LikKCkkn
bSB3b25kZXJpbmcgaWYgYW55b25lIGNhbiBoZWxwIG1lIHVuZGVyc3RhbmQgd2hhdCBpcyBnb2lu
ZyB3aXRoClZpdmFudGUKR0MzMDAgb24gYSBNTVAzIGFuZCBmaW5kIGEgcmVhc29uYWJsZSBmaXgu
IE1NUDMgaGFzIHRoZXNlIHR3byBHUFUKY29yZXM6CgrCoCBbwqDCoMKgIDIuMTQyNTQ1XSBldG5h
dml2LWdwdSBkNDIwZDAwMC5ncHU6IG1vZGVsOiBHQzIwMDAsIHJldmlzaW9uOgo1MDI2CsKgIFvC
oMKgwqAgMi4xNTQ0NjhdIGV0bmF2aXYtZ3B1IGQ0MjBmMDAwLmdwdTogbW9kZWw6IEdDMzAwLCBy
ZXZpc2lvbjogNDYzNArCoCBbwqDCoMKgIDIuMTY2ODA4XSBbZHJtXSBJbml0aWFsaXplZCBldG5h
dml2IDEuMy4wIDIwMTUxMjE0IGZvciBldG5hdml2Cm9uIG1pbm9yIDAKCkN1cnJlbnRseSwgY2xp
ZW50cyB0aGF0IHRyeSB0byB1c2UgdGhlIEdDMzAwIDJEIHVuaXQgLS0gbGliZHJtJ3MKZXRuYXZp
dl8yZAp0ZXN0IG9yIHRoZSB4b3JnLXgxMS1kcnYtYXJtYWRhIGRkeCBvbiBhIE1NUDMgZG9uJ3Qg
d29yayBhbmQgZXRuYXZpdgpjb21wbGFpbnM6CgrCoCBbwqAgMjk1LjA3Nzc3MF0gZXRuYXZpdi1n
cHUgZDQyMGQwMDAuZ3B1OiByZWNvdmVyIGh1bmcgR1BVIQoKVGhhdCBpcywgdW50aWwgdGhlIGNs
b2NrIHRoYXQncyBzdXBwb3NlZGx5IGZvciB0aGUgR0MyMDAwIDNEIHVuaXQgYXJlCnR1cm5lZCBv
bi4gVGhlbiB0aGluZ3Mgd29yayBmaW5lLgoKSSBiZWxpZXZlIHRoZSBhYm92ZSBzcGxhdCBpcyB3
aXRoIHRoZSBldG5hdml2XzJkX3Rlc3Q/IFRoaXMgdGVzdCBpcwpicm9rZW4gaW4gdGhhdCBpdCB3
aWxsIGp1c3QgcGljayB0aGUgZmlyc3QgR1BVIGNvcmUgKGluIHlvdXIgY2FzZSB0aGUKR0MyMDAw
KSBpbnN0ZWFkIG9mIGxvb2tpbmcgZm9yIGEgY29yZSB3aXRoIDJEIGNhcGFiaWxpdGllcy4gU3Vi
bWl0dGluZwoyRCBqb2JzIGludG8gdGhlIDNEIEdQVSB3aWxsIGRvIG5vdGhpbmcgb3IgaGFuZyB0
aGUgR1BVLCBkZXBlbmRpbmcgb24KdGhlIHNwZWNpZmljIEdQVSBnZW5lcmF0aW9uLgoKSSBkb24n
dCBrbm93IGV4YWN0bHkgd2hhdCB0aGUgYXJtYWRhIGRyaXZlciBpcyBkb2luZywgSUlSQyBpdCBw
cm9wZXJseQpsb29rcyBmb3IgYSAyRCBHUFUgY29yZS4KCklzIHRoZSBzeW1wdG9tIHRoZSBzYW1l
IGlmIHRoZSAyZF90ZXN0IGlzIGZpeGVkIHRvIHN1Ym1pdCBpbnRvIHRoZQpyaWdodCBHUFUgY29y
ZT8KClJlZ2FyZHMsCkx1Y2FzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpldG5hdml2IG1haWxpbmcgbGlzdApldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2V0bmF2
aXYK
