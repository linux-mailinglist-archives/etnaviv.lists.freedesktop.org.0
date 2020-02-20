Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BFA166390
	for <lists+etnaviv@lfdr.de>; Thu, 20 Feb 2020 17:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0C189E35;
	Thu, 20 Feb 2020 16:56:40 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44EA6E22E
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Feb 2020 13:02:24 +0000 (UTC)
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 2723067A8C2
 for <etnaviv@lists.freedesktop.org>; Thu, 20 Feb 2020 13:52:52 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 20 Feb
 2020 13:52:51 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Thu, 20 Feb 2020 13:52:51 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Subject: Etnaviv issues on i.MX8M-Mini
Thread-Topic: Etnaviv issues on i.MX8M-Mini
Thread-Index: AQHV5+yplA/1sTzXA027Bdn9yaxzng==
Date: Thu, 20 Feb 2020 12:52:51 +0000
Message-ID: <2704d3bd-5563-8951-58f7-75a906782754@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <86CFE9E1F9733B44BCA7617F9E40E8CA@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 2723067A8C2.A9FEE
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: etnaviv@lists.freedesktop.org
X-Spam-Status: No
X-Mailman-Approved-At: Thu, 20 Feb 2020 16:56:39 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi,

according to the documents, the i.MX8M-Mini features a GC320 and a 
GCNanoUltra. I tried to run the etnaviv drivers and the following GPUs 
are detected:

	etnaviv-gpu 38000000.gpu: model: GC600, revision: 4653
	etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341

Running some demos and tests with mesa 19.1.6 most things seem to work. 
Still I currently have two issues, while the first one is kind of a 
show-stopper and the second one is not really important as it seems to 
affect shaders only.

1. When running any QtQuick applications, all transformations like 
moving elements are really jerky and not smooth at all as it should be. 
Any ideas what the reason could be, or how to get more information about 
this problem?

2. With some demos (e.g. with 'glmark2-es2-drm -b terrain') I get:

	error: compile failed!
	etna_draw_vbo:222: compiled shaders are not okay

Can this be fixed somehow, or is this due to the limitations of the GPU?

Thanks,
Frieder
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
