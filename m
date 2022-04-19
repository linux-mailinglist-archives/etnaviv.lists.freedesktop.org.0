Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC7E507AFA
	for <lists+etnaviv@lfdr.de>; Tue, 19 Apr 2022 22:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA0E10EAA3;
	Tue, 19 Apr 2022 20:31:07 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A97610E92F
 for <etnaviv@lists.freedesktop.org>; Tue, 19 Apr 2022 20:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650400264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=be6VP4VL+z444uHhPHKMJh9PH6wDtAablx8mg5VMxYw=;
 b=cGSHDlSCAKOJvA7meram2okhf1Z9IWqZgn1tuGcENIW62ESkhcqw6IDPnvAh/boKESXvBC
 FN6cORlHlA3/TTcqr5jjqWwY8gf6QTIzPuo4mhEGWe4nvHyQIkuxeX57mvRcR4/RHeQo04
 5+JX6Q4GdQUXLhtxMDYmJ9mydKVG0KQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-o7VYFFAPP8GzHYBHaRfHJQ-1; Tue, 19 Apr 2022 16:31:02 -0400
X-MC-Unique: o7VYFFAPP8GzHYBHaRfHJQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 p3-20020a05621421e300b0044427d0ab90so15284933qvj.17
 for <etnaviv@lists.freedesktop.org>; Tue, 19 Apr 2022 13:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=be6VP4VL+z444uHhPHKMJh9PH6wDtAablx8mg5VMxYw=;
 b=oSPo9HtKjQkZ7Gqn40QOdsBjoQGTxKtEsKc1DkDhbd4iX1BubaU5itkbVumxHcFKZz
 GAF9YKSt5UMEjm7BjNfCpfGOJT3hX704LIl9dvwTnFtzo1+vEe82P6E26Uj9zuQNHoPW
 xgqW6970oJTuC3NVCZfafS8oRrENtgruoEs5KNhTAjY9mz5rX/APznXmjhDy2bP7Ct9e
 JthdLW2nGqlKlHRirFtQLJfTiwDLXEiSWN+A97rmKmIbaWivdLm5kMPi32VW60nZZz7w
 CFRPwwSvTuXHu6t8x7oMj00Ta6A6yQNrj7G6C8k6nWYKVqlQ7m4yDpgRAY9ldBqsENYU
 5QVg==
X-Gm-Message-State: AOAM532Er4IjzHVfo28oOnslsxZhIWz5ndwTDSaNvSODcohcOvr6Hu8V
 K5Mcx28trj5XPUj1qNIAEd7yhOBwDVpu42GBdlJ/nmqE09VbG/UmTMnlBEwOC2tFjM4u3q/Sw39
 GtDknINPb4Yla2aL/FbSoegnjyA==
X-Received: by 2002:a37:510:0:b0:69e:8868:c691 with SMTP id
 16-20020a370510000000b0069e8868c691mr8634589qkf.731.1650400261797; 
 Tue, 19 Apr 2022 13:31:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/S5ftop0ghBWPqC6VcdbCKk2EHMRpvcn+OOjAta4APIO+s/kcOllMhR+W7PX4+MaicfOv5Q==
X-Received: by 2002:a37:510:0:b0:69e:8868:c691 with SMTP id
 16-20020a370510000000b0069e8868c691mr8634569qkf.731.1650400261514; 
 Tue, 19 Apr 2022 13:31:01 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 f16-20020a05622a105000b002ed4688f116sm612817qte.86.2022.04.19.13.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 13:31:00 -0700 (PDT)
Message-ID: <55713be81efe8d2b9d19f6e4ad8d64a88087289f.camel@redhat.com>
Subject: 2022 X.Org Foundation Election vote results
From: Lyude Paul <lyude@redhat.com>
To: elections@foundation.x.org, events@lists.x.org, 
 xorg-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, libre-soc-dev@lists.libre-soc.org, 
 members@x.org
Date: Tue, 19 Apr 2022 16:30:59 -0400
In-Reply-To: <b75862cc1cb0a05b02c9249bb4858e8d9013be30.camel@redhat.com>
References: <b75862cc1cb0a05b02c9249bb4858e8d9013be30.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
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

The Board of Directors election and the vote on the By-laws concluded at
23:59 UTC on 18 April 2022. There are 80 current Members of the X.Org
Foundation, and 52 Members cast votes. This is a 65.0% turn out.

In the election of the Directors to the Board of the X.Org Foundation,
the results were that Emma Anholt, Alyssa Rosenzweig, Mark Filion and
Ricardo Garcia were elected for two year terms.

The old full board is: Emma Anholt, Samuel Iglesias Gonsálvez, Mark
Filion, Manasi D Navare, Keith Packard, Lyude Paul, Daniel Vetter, Harry
Wentland

The new full board is: Emma Anholt, Samuel Iglesias Gonsálvez, Mark
Filion, Manasi D Navare, Alyssa Rosenzweig, Lyude Paul, Daniel Vetter,
and Ricardo Garcia

The full election results were as follows:

           Option | Rank 1 | Rank 2 | Rank 3 | Rank 4 | Rank 5 | Rank 6 | Final Score
      Emma Anholt |     21 |     16 |      4 |      1 |      5 |      5 |         240
Alyssa Rosenzweig |      4 |     10 |     17 |      7 |     11 |      3 |         188
      Mark Filion |      8 |     12 |      7 |     10 |      5 |     10 |         186
   Ricardo Garcia |      9 |      4 |      5 |     17 |     10 |      7 |         172
      Lucas Stach |      4 |      5 |     14 |      9 |     11 |      9 |         163
  Shashank Sharma |      6 |      5 |      5 |      8 |     10 |     18 |         143

Lyude Paul, on behalf of the X.Org elections committee

