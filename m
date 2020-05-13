Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 423221D18B7
	for <lists+etnaviv@lfdr.de>; Wed, 13 May 2020 17:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F646EA6A;
	Wed, 13 May 2020 15:08:19 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 408 seconds by postgrey-1.36 at gabe;
 Wed, 13 May 2020 15:07:03 UTC
Received: from v6.sk (v6.sk [167.172.42.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4986EA66
 for <etnaviv@lists.freedesktop.org>; Wed, 13 May 2020 15:07:03 +0000 (UTC)
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id BEE3D610A5;
 Wed, 13 May 2020 15:00:11 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: 
Date: Wed, 13 May 2020 17:00:04 +0200
Message-Id: <20200513150007.1315395-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <[PATCH 0/3] drm/etnaviv: Clock fixes>
References: <[PATCH 0/3] drm/etnaviv: Clock fixes>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 15:08:18 +0000
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
Cc: linux-kernel@vger.kernel.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi,

please consider applying patches that are chained to this message.

They make getting/enabling the clocks in the etnaviv driver slightly nicer,
first two also fix potential problems.

Thanks
Lubo


_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
