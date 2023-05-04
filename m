Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCCF6F6A42
	for <lists+etnaviv@lfdr.de>; Thu,  4 May 2023 13:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B89C10E0E2;
	Thu,  4 May 2023 11:41:09 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2648910E087;
 Thu,  4 May 2023 11:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Date:To:
 From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DY2Ok8279LYbukTn4RyVDpj5MbcGHsCyoi1DnlySgWk=; b=coqZ51PvbgUdFwIKttmgO2Wczt
 rNJcEsJlXANwIm5gE46wTOvrfBWb2mskizyrA1UwrsZB/iKxW5/54r63SZEFAcIdZIZ1EAPhhEUYY
 CYVzeVefmvYA63395H0nHKEB3vz3Jbzl9y0LYb4BDn4ay7pRR3rus5b6/9qO60EbBo7r7ASiegCa5
 KCLX+scCQQLqKdB69QSty1zn7PvOaKKYTpSJsGL+uiretyyQpQ8aHMcGd8K2wtX65IhlDi+lzO+Ie
 zT02dI85ukQjm6EKZLxuk1pMmIaNZYcYTMNa11dlT0UpHNuSonulW8ZXuI2HP6l4RW/S5jlGfuCkd
 mGz8l/dQ==;
Received: from 137.red-83-52-2.dynamicip.rima-tde.net ([83.52.2.137]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1puXKZ-001506-AJ; Thu, 04 May 2023 13:41:03 +0200
Message-ID: <bd27b87dc34f5ff00d346a8115cbf3bbb22b911b.camel@igalia.com>
Subject: 2023 X.Org Foundation Election vote results
From: Ricardo Garcia <rgarcia@igalia.com>
To: events@lists.x.org, xorg-devel@lists.x.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org, 
 xorg@lists.freedesktop.org
Date: Thu, 04 May 2023 13:41:02 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

The Board of Directors election and the vote on the By-laws concluded at
14:00 UTC on May 1st 2023 and these are the results:

- We had 75 members this year, of which 55 cast a vote, so the turnout
is 73.3%.

- On the question "Do you accept the proposed By-Law changes to make SFC
the new fiscal sponsor of the X.Org foundation, replacing SPI?" 52 of
the 55 members voted yes (94.5%). Among all 75 members, approval is
69.3% (52/75, over 2/3), so we can consider this change approved using
the current by-law rules.

- On the question "Do you accept the proposed By-Law changes to modify
the special voting quorum requirements to be limited to present (meaning
voting) members?" 48 of the 55 members voted yes (87.3%). Despite this,
48 votes represent only 64% of the members, which means the by-laws
change does not pass.

- In the election of the Directors to the Board of the X.Org Foundation,
the results were that Daniel Vetter, Lyude Paul, Arkadiusz Hiler and
Christopher Michael were elected for two-year terms.

The old full board is: Emma Anholt, Mark Filion, Ricardo Garcia, Samuel
Iglesias Gons=C3=A1lvez, Manasi D Navare, Lyude Paul, Alyssa Rosenzweig and
Daniel Vetter.

The new full board is: Emma Anholt, Mark Filion, Ricardo Garcia,
Arkadiusz Hiler, Christopher Michael, Lyude Paul, Alyssa Rosenzweig and
Daniel Vetter.

Full election results, sorted by points:

* Daniel Vetter (367 points)
* Lyude Paul (348 points)
* Arkadiusz Hiler (286 points)
* Christopher Michael (263 points)
* Manasi Navare (195 points)
* Uma Shankar (157 points)
* Thomas Adam (105 points)
* William Weeks-Balconi (51 points)

Thanks everyone,
-Ricardo Garcia, on behalf of the X.Org elections committee

