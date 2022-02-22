Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7524BEEF5
	for <lists+etnaviv@lfdr.de>; Tue, 22 Feb 2022 02:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CE610E36D;
	Tue, 22 Feb 2022 01:46:09 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC60F10E32D
 for <etnaviv@lists.freedesktop.org>; Tue, 22 Feb 2022 01:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645494367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=96JzHwNa1B2QXjUWnZ374iz4+U14qI3CRmOmAH0GIUs=;
 b=GR86eLuCAKaKf8mfVDoiR9gq24pPPXEfSiv1205zJAPaato6aoM7qlFHTCJpEmz2DoVC74
 dJwxulaMztFhriH3jcx4vOFIfBwh/8kplBFPDm88yovfFM92kpZ1neoKGd3zyICKukS0WI
 uqMixBOY/Lvu8DXTh6tPC0xF669PL6I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-fCZ297BEPxOucWbprKjjSQ-1; Mon, 21 Feb 2022 20:46:01 -0500
X-MC-Unique: fCZ297BEPxOucWbprKjjSQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 7-20020a05620a048700b00648b76040f6so7114879qkr.9
 for <etnaviv@lists.freedesktop.org>; Mon, 21 Feb 2022 17:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=96JzHwNa1B2QXjUWnZ374iz4+U14qI3CRmOmAH0GIUs=;
 b=JbbJv4HuhBAEBzc4zZ6vn1AnBYl2T96ok2Sux/Hvv0Yo/npLoSAgs7iSM7bIrLJyjI
 n81Owm/m4Zt0kYWwdSfcT40VY1PSINeY6v+w0u8L2u/jkJJK45NBJzRhV2zopeCTovlh
 kZF219HUGaAGfQA46uDKKaCVFtjTH3vcXopT0HhSXGEMZTLCvupjvqS8jo+ZqS2gFqN3
 Kkm4RvPiLAfgwGsreMk08x3KKEm9GX+uhd2sPTXrfrrXyy3N5FfQUneDNeAuHauA5ssG
 cwb8Uc6iGsUqstfQPm9Ew0JNChYuEte+7lQOSxxyLOqAgjg5iU2JOGu0+3/YNq/yLpH1
 sTAg==
X-Gm-Message-State: AOAM5303Eyq4/X0DGYtzNZEoHAHeoCd29wneXU0tJotqVJW8O3y1s2oz
 sar2ZyNjuCUXJiAhMdyg/qWenmXe6ynX2YY5bETW6vKGOtSakjHYkpdTC4nsoBtat8/S6SgFFMh
 90bWQ5Ehhmv6gS4a/7RFu7n69Jw==
X-Received: by 2002:a0c:bec2:0:b0:42d:7a97:7c50 with SMTP id
 f2-20020a0cbec2000000b0042d7a977c50mr17596031qvj.64.1645494360786; 
 Mon, 21 Feb 2022 17:46:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRyX/nST1Psi3yWzhSr7BZIQG7ecyOcllTfLzjLqbPHMXIvAV7C+vXZhS0bg1zhOmNbnqosg==
X-Received: by 2002:a0c:bec2:0:b0:42d:7a97:7c50 with SMTP id
 f2-20020a0cbec2000000b0042d7a977c50mr17596017qvj.64.1645494360574; 
 Mon, 21 Feb 2022 17:46:00 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id j128sm6512810qkd.61.2022.02.21.17.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 17:46:00 -0800 (PST)
Message-ID: <e93170406e5ea46e95f44d4e33f0c86a78c0623a.camel@redhat.com>
Subject: 2022 X.Org Board of Directors Elections Nomination period is NOW
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Mon, 21 Feb 2022 20:45:58 -0500
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

We are seeking nominations for candidates for election to the X.Org Foundation
Board of Directors. All X.Org Foundation members are eligible for election to
the board.

Nominations for the 2022 election are now open and will remain open until
23:59 UTC on 06 March 2022.

The Board consists of directors elected from the membership. Each year, an
election is held to bring the total number of directors to eight. The four
members receiving the highest vote totals will serve as directors for two year
terms.

The directors who received two year terms starting in 2021 were Lyude Paul,
Samuel Iglesias Gonsálvez, Manasi D Navare and Daniel Vetter. They will
continue to serve until their term ends in 2023. Current directors whose term
expires in 2022 are Emma Anholt, Keith Packard, Harry Wentland and Mark
Filion.

A director is expected to participate in the fortnightly IRC meeting to
discuss current business and to attend the annual meeting of the X.Org
Foundation, which will be held at a location determined in advance by the
Board of Directors.

A member may nominate themselves or any other member they feel is qualified.
Nominations should be sent to the Election Committee at elections at x.org.

Nominees shall be required to be current members of the X.Org Foundation, and
submit a personal statement of up to 200 words that will be provided to
prospective voters. The collected statements, along with the statement of
contribution to the X.Org Foundation in the member's account page on
http://members.x.org, will be made available to all voters to help them make
their voting decisions.

Nominations, membership applications or renewals and completed personal
statements must be received no later than 23:59 UTC on 6th March 2022.

The slate of candidates will be published 14 March 2022 and candidate Q&A will
begin then. The deadline for Xorg membership applications and renewals is 17
March 2022.

Cheers, Lyude Paul, on behalf of the X.Org BoD


