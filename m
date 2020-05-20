Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DDC1DB13F
	for <lists+etnaviv@lfdr.de>; Wed, 20 May 2020 13:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824486E5CF;
	Wed, 20 May 2020 11:15:21 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7FF6E5CF
 for <etnaviv@lists.freedesktop.org>; Wed, 20 May 2020 11:15:20 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 82so2078290lfh.2
 for <etnaviv@lists.freedesktop.org>; Wed, 20 May 2020 04:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flowbird.group; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5g/o8PUZPrNAJIWyoOWEybfjQaVuCtrfU+HgSjaoumw=;
 b=kea5AkX0ou1aP/8ibJ65TsXqG7JKMLU5s5e4R3yHJGH+a+ozn11pQBzKtTGq34DtKo
 RpweiZTOmY7YZ4KFVqDxsCSVe2OZjBDZBVBIn/jeg4Qwn1W5PwPPJokOlzpOoj3vqshv
 cmORZuq7e91IWNiG9pAOQMeA6/vJ6mMkgATPDXMJg/5XElENes0TWwKd7wN3jFB9mLuO
 BQys++AIoeAGlaFcfW9EcbCvm3aHIe78PLHpGSPlZyBWp3wlWqbLeZ3RiP1G7rqRx0jJ
 lg4doC3DKqJzQHczPWTl76Im8fzgIXX6vJTOHa+LhhD+oYvNwbksAc+SLjunjyGdow94
 JBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5g/o8PUZPrNAJIWyoOWEybfjQaVuCtrfU+HgSjaoumw=;
 b=XAUxwVzt6ldyIwvROYhZNH+K2+gYi3ORmbC+LRYiOZejw8IJqK2JlHMTdLAENcEJYp
 SSocBPbXsNo/djGFWzoLMV+oK04hhDy/N20D2rEdPLmiqG+wBzKxk3xjhLOEVF6w20le
 xfywg2UUUWndwxNB05k4gDUlkui+Lm4BpxfCamS6OHimo1o0wTI+sxVK4T77X8ghz7lL
 ftytgm86FDLDBgIaBGLmXmUI5Skp9Ai/Tcw+nsjP2gPW6/bRvZSuTRKV0w9G6JozHQO1
 B/i8GNJaq47O4hjB8PfXB3HgYOgqs/pTSkrdeCjYtej7BWBkjK5NR3THz6jCqvFFZWJE
 iDiQ==
X-Gm-Message-State: AOAM530g0TuJW6zOR9QvoNKyhvRWrH+kv3LNRSwByo5YCZ+VN/1e3BtG
 B3oM+jX1Mf+hCanjrjiLmYK8MA73JKfXt8HFGMREyA==
X-Google-Smtp-Source: ABdhPJy255WD8U21Ushovf34k+G+2sKMGyfVGQ6u/StQOpa9NwmtllVnOahvkS7bR02qE6ErmJ0TOwu/zbsjmgOWYM8=
X-Received: by 2002:ac2:4d1c:: with SMTP id r28mr2303943lfi.45.1589973318888; 
 Wed, 20 May 2020 04:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <1589969500-6554-1-git-send-email-martin.fuzzey@flowbird.group>
 <d7a0646840374e1d7515bfea7da2badd94df0042.camel@pengutronix.de>
In-Reply-To: <d7a0646840374e1d7515bfea7da2badd94df0042.camel@pengutronix.de>
From: "Fuzzey, Martin" <martin.fuzzey@flowbird.group>
Date: Wed, 20 May 2020 13:15:07 +0200
Message-ID: <CANh8Qzz4bx8scFdF3Hhe0UsojEyBswBuwiJQ0UW9HPUjrjpd_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix memory leak when mapping prime imported
 buffers
To: Lucas Stach <l.stach@pengutronix.de>
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
 The etnaviv authors <etnaviv@lists.freedesktop.org>, stable@vger.kernel.org,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Lucas,

> Am Mittwoch, den 20.05.2020, 12:10 +0200 schrieb Martin Fuzzey:
> What's the use-case where you did hit this issue? mmap'ing of imported
> buffers through the etnaviv DRM device is currently not well defined
> and I was pondering the idea of forbidding it completely by not
> returning a mmap offset for those objects.
>

I hit this on Android 8 (on i.MX6 using mesa 20.0.6 with gbm gralloc
and drm hwcomposer)  and had a memory leak every time an activity was
started.
I'm not sure exactly why but Android does a gralloc.lock() and
gralloc.unlock() on every activity startup.
Those map and unmap the buffer.

Under Android (at least in 8+) the actual graphics buffer allocations
are done by a dedicated process
(android.hardware.graphics.allocator@2.0-service)
because it uses a "binderized HAL" for the allocation
[https://source.android.com/devices/architecture/hal-types]
This means that buffers are *always* imported (though they are usually
only mmaped for SW rendering or screen shots).

Regards,

Martin
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
