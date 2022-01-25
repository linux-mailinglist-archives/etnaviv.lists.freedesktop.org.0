Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 365E849BB09
	for <lists+etnaviv@lfdr.de>; Tue, 25 Jan 2022 19:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE95610E3EA;
	Tue, 25 Jan 2022 18:13:37 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F55310E34A
 for <etnaviv@lists.freedesktop.org>; Tue, 25 Jan 2022 18:13:37 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nCQJz-0005Uv-9w; Tue, 25 Jan 2022 19:13:35 +0100
Message-ID: <8c2cb3e3a702be86db9d43ca8927b6b78ac2b1d2.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-fixes for 5.17-rc2
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 25 Jan 2022 19:13:34 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

this patch relaxes the submit size checks added in the last merge
window. Turns out that we have existing userspace that overruns its max
size target due to a bug and thus gets denied now.

Regards,
Lucas

The following changes since commit
e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux etnaviv/fixes

for you to fetch changes up to
e3d26528e083e612314d4dcd713f3d5a26143ddc:

  drm/etnaviv: relax submit size limits (2022-01-25 19:03:11 +0100)

----------------------------------------------------------------
Lucas Stach (1):
      drm/etnaviv: relax submit size limits

 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


