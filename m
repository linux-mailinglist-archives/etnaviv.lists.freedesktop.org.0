Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F5D443E1F
	for <lists+etnaviv@lfdr.de>; Wed,  3 Nov 2021 09:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF376734B8;
	Wed,  3 Nov 2021 08:12:37 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E39734B6;
 Wed,  3 Nov 2021 08:12:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t30so2203357wra.10;
 Wed, 03 Nov 2021 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uh0NRCclsAKfVxkerpNkq71adkos81CcdIhWKjRw+6Y=;
 b=mr5PnPgRO8OzuCvJMvW5hnrKT6fvInL0UAalZ989hyaB3jvVYItDW8ou3liJfIJoNr
 hvWaf54dIpbnxdcc373Xcvqh9M6HM18knXjMfLH8s9y9SqdcLaOWvj2x7DpcCaGzVFbZ
 lRKQhbmITsNkhjsS4nGlQr7p3Lx9KbhcIkcbZuEMqIiRnZFQq9nQAgmb7jI6kyyIYGVr
 8DuN2xfiamK0PB5ZXxLNCXVJmkxa0CufWXYNL8NcvGDnhKDuJsd3OrctTS27BMaV18TM
 rng6LYJfdT4RIcJrOUvee5IGHT8G8Pg1qV1oMpUStS5iXhzHspZdxG0dOEiTdyYrycJK
 yKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uh0NRCclsAKfVxkerpNkq71adkos81CcdIhWKjRw+6Y=;
 b=HGJvOrpwED7SiLPwF7BLyqzA+9qhiptUlsz0Icl+z5M1wM6sImchOzL3SrUgMWYd2J
 s0cSaLWBU5ZarHKuQ0U2zef6b7rqVSgxOTtXxXXcUoUzxkkjjfU4kzvM0+Eb8nNjUqMv
 y0GiKb48ue91kiM06AiZGnykZgFABvP73QzC+j4/2VEd/4fe0vlodnchcgbJnWB2B6hc
 +IatfmlMSY5No94nMPKxu/yC4bX0Dv1drD+/C+JGz0ehVgpFfDu7YKSEEcuF6mFjUqin
 U6WYbxAYDmhLskR6ZIV+LcCYvn8MWSb4flZkfxpXvaGTe35mVaR2Vd4yXmNQxbRIa9DD
 vVsw==
X-Gm-Message-State: AOAM533RSXoEaQ+SqqKuQCKr7gAwfNhLT+ajn1v7O4o9L2YwTrhIjTJu
 SB6OlfMKyocGmFmcpWtURqo=
X-Google-Smtp-Source: ABdhPJw1BshvZSVxZm2e89H/8z2XLrQccFGIz7m0oW1jDggouT+C66c3Yi239msG+Ek/pKeY2cfj0A==
X-Received: by 2002:adf:fe88:: with SMTP id l8mr33010703wrr.208.1635927154697; 
 Wed, 03 Nov 2021 01:12:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l7sm1450088wry.86.2021.11.03.01.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:12:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, etnaviv@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org
Subject: DMA-buf debugfs cleanups
Date: Wed,  3 Nov 2021 09:12:27 +0100
Message-Id: <20211103081231.18578-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: sumit.semwal@linaro.org, daniel@ffwll.ch, l.stach@pengutronix.de
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi guys,

second round for those four patches adding some simple yet useful DMA-buf helper functions for debugfs prints.

Fixed some missing includes and typos in commit messages.

Please review and/or comment,
Christian.


