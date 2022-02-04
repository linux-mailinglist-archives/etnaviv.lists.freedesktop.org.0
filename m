Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F64A9DD4
	for <lists+etnaviv@lfdr.de>; Fri,  4 Feb 2022 18:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7DA10EEDC;
	Fri,  4 Feb 2022 17:40:14 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8CC10E485
 for <etnaviv@lists.freedesktop.org>; Fri,  4 Feb 2022 17:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643996411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Fgk2tPp8Iez8ffo3teobZs6lfET8NrmEOulKtLL6l8=;
 b=hgu4N+S2gNdG1xMhXdat5E6BCLq/KTAMIgvMNi0eK4csndApUPlZp0/k0dlKHe6jbeZJdm
 Ade/UI/wsT6mi0oG5a5pqi1KLVLaexIvOr1LzNja1AKUhUofqDKluRX+tBetqc/l0phA5P
 1h/vBToWtlExXnm1DgcDuSjqS9KBhk0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-jSFNb2I1NDKwTNyB6--ZPQ-1; Fri, 04 Feb 2022 12:40:09 -0500
X-MC-Unique: jSFNb2I1NDKwTNyB6--ZPQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 s1-20020ac85ec1000000b002cf7c93d56dso5159565qtx.21
 for <etnaviv@lists.freedesktop.org>; Fri, 04 Feb 2022 09:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=+Fgk2tPp8Iez8ffo3teobZs6lfET8NrmEOulKtLL6l8=;
 b=V02bfAH4gUop2l4FB2vqrDxEtgDrghKoN4INv0h91GXk6KkJ3x1fiILKIa93vec0Lt
 scgR2BF2FwKz/9UIzQvIx3GVJ4JfuDC2S5bdAZUpE5livyAt6Bzv7OHt22hK/7Z4FPbr
 cJcwvTzThgipMg7EJTR9DRPoSkguxKtkcJ2NqUn83/2OD12+Vjy0+AGhmdrCX4yzVkMR
 FBrnjt5/CBnutcCvPBImJOtzJpz0iL2s8NcGP0FrCHCMNlwA+Yg8CfAUICOZAa1Ixt3P
 /UQHCcDGxjUsJUZ+49nd1hCRjhtBbTArwcbgNJGqLz+xmBUP1l2Bxkofv8YM38FHo6zw
 YP4Q==
X-Gm-Message-State: AOAM532Ermf17jm71Gs0kDljvmlu64X2N0GH2AXA5tiegUTrASvckYLB
 ZMpzaL5CgRKK7aA/o7zzq6bX3C/7evdCbjcAZOJzoJzAoqwIWFiiViVS6+rBcgCzY9PwVO6jEcC
 sEpV5oFKZmGOrwWgAdzUWUQ8rHQ==
X-Received: by 2002:ac8:578a:: with SMTP id v10mr76249qta.148.1643996409331;
 Fri, 04 Feb 2022 09:40:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKdGHijSYkEZ0PZ6zI7XULxLGuuiXeTX+kTLZtxdulDdoNZ2sUxc4s+6mCyl5zpu6dwwjJCg==
X-Received: by 2002:ac8:578a:: with SMTP id v10mr76176qta.148.1643996408156;
 Fri, 04 Feb 2022 09:40:08 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id w22sm1599186qtk.7.2022.02.04.09.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:40:07 -0800 (PST)
Message-ID: <8db37efd8113f33107175b353f1f996523db7b9c.camel@redhat.com>
Subject: [Important!] 2022 X.Org Foundation Membership deadline for voting
 in the election
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Fri, 04 Feb 2022 12:40:05 -0500
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

The 2022 X.Org Foundation elections are rapidly approaching. We will be
forwarding instructions on the nomination process to membership in the
near future.

Please note that only current members can vote in the upcoming election,
and that the deadline for new memberships or renewals to vote in the
upcoming election is March 17th 2022 at 23:59 UTC.

If you are interested in joining the X.Org Foundation or in renewing
your membership, please visit the membership system site at:

https://members.x.org/

You can find the current election schedule here:

https://www.x.org/wiki/BoardOfDirectors/Elections/2022/

        Lyude Paul,
        On behalf of the X.Org elections committee


