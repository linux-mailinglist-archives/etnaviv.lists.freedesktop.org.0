Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAA27A7589
	for <lists+etnaviv@lfdr.de>; Wed, 20 Sep 2023 10:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBAB10E450;
	Wed, 20 Sep 2023 08:13:27 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com
 [IPv6:2607:f8b0:4864:20::149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458EA10E066
 for <etnaviv@lists.freedesktop.org>; Mon, 18 Sep 2023 13:34:10 +0000 (UTC)
Received: by mail-il1-x149.google.com with SMTP id
 e9e14a558f8ab-34fbf731604so27695125ab.2
 for <etnaviv@lists.freedesktop.org>; Mon, 18 Sep 2023 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695044049; x=1695648849;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=F+MBClngMcUOr7b7qdytwU8fTtdqU1XKfB8/O+XIG6U=;
 b=NNcj6jhtvNWN+7qFg0VvHiAqpc8FRSteKkeS6Zspn/a6ygsdM9jO3ijaM4uHw9LHGb
 +bhms3MFC1FI9/h6mhWw7ZY/ZEyyi/Fc9/z/IdahtTUQy+yJSvkmEaK86Hen8Ex2G1yW
 12ymyzIfSlJAKa8MBkyJFrwKj/IioTviLUBEA/sNQW4lQCMdZCdQCdxB/ySEq6flmRPi
 7r2N0l7ElS8z2tYD6Hd7aO8kgenbSfV7R9Ql5XQnwWK5GjSh4QKyolgMzCCk8Tx0EUku
 m1CHrLDk2gdtL8JdcEz9vluLL+LgWyPEERKZocBK/5pJIeBG5AtQ9lG8H0CHQfbBZHJs
 qFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695044049; x=1695648849;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+MBClngMcUOr7b7qdytwU8fTtdqU1XKfB8/O+XIG6U=;
 b=aTlJywGdFuR2ouXMF2UmD4HomyUR/thIaDM9UFnTDJEY75tctePgGz+NvkDHUW91o6
 tbGZJSXIAq4DrXhMVDLUbdGV6llqPIthl+xpEGyumLeUoXHIOPnXYp7DltuIrFiQm5mz
 DM8crHK47GXI32fb/W3aPCGiVpqa4S7g+b03kbnHW2clnAXTeD9AGiHsBmnovBr3+nPK
 8EyB6+8CHBYBjbqsym9MqBjgu4Kblt313VbVdJ3WZ49JArW/HrZP6rG0idsoz3kolzIv
 ve1O2iRsBHwkyKkLDpLY6LSqxn9OsiLRsWAV7I4zRp8139WkIwyMIyjzbZFPyvFcEUzI
 5prw==
X-Gm-Message-State: AOJu0YwOmVHmmO9l/ITcUN1IvTHQgcVMVZK3EEofYRr6SjaQS8MZ7z2D
 ti3g9XymjTNWPNoCAyyUIvAC9ibhx+NOSnQH4w==
X-Google-Smtp-Source: AGHT+IFx+dhs1ghSv6J0x7wA6J8v7WrrS+S5R+5vJdKZOMsman1WY1Cvst7HgY5gcbhc6ib4nHGqzP6AJ94fFa9fOg==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a92:cc08:0:b0:34f:3625:1f7c with SMTP
 id s8-20020a92cc08000000b0034f36251f7cmr313453ilp.6.1695044049344; Mon, 18
 Sep 2023 06:34:09 -0700 (PDT)
Date: Mon, 18 Sep 2023 13:34:08 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM9RCGUC/6WOQQ6CMBREr0K69htaYFFX3sMQg/2/5SfSkhYbC
 eHuVhJP4GrmzWJmNpEoMiVxqTYRKXPi4AuoUyXMOHhHwFhYqFo1tZYtpCV6M6+AkTPFBG5+FT8
 BLX7InH96nynaKXgwgFjrrtUSLZIovXMky+9j89YXHjktIa7HhSy/6T9rWYKEZkCjUD+s6dTVh
 eCedDZhEv2+7x/V2XQM8wAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695044048; l=2172;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=BYAYvIXxKCiuJsxwGROrIkadcvOKOHta7W0JbQ3yjqg=;
 b=I3ANWTTsDplq5xjROtlm2F8vtEaDSVUD2T6JSL9ds4y15JqL/K+3vCvuA291BuccAqEoa9+qe
 L0x+yCghW0/DGmMteuN7B/YPtb8+LCHeWHitjIQFLRm4jUKQapdjdAe
X-Mailer: b4 0.12.3
Message-ID: <20230918-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v2-1-8ae12071c138@google.com>
Subject: [PATCH v2] drm/etnaviv: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Wed, 20 Sep 2023 08:13:27 +0000
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Justin Stitt <justinstitt@google.com>, Bo YU <tsu.yubo@gmail.com>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

A suitable replacement is `strscpy_pad` due to the fact that it
guarantees NUL-termination on the destination buffer whilst maintaining
the NUL-padding behavior that strncpy provides.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Cc: Bo YU <tsu.yubo@gmail.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- use strscpy_pad (thanks Kees)
- Link to v1: https://lore.kernel.org/r/20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v1-1-3adc2d9bfc52@google.com
---
Similar to [2] which was never picked up. Let's prefer strscpy_pad to strlcpy, though

[2]: https://lore.kernel.org/all/20190328080918.9290-1-tsu.yubo@gmail.com/
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index bafdfe49c1d8..dc9dea664a28 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -511,7 +511,7 @@ int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
 
 	domain->id = domain->iter;
 	domain->nr_signals = dom->nr_signals;
-	strncpy(domain->name, dom->name, sizeof(domain->name));
+	strscpy_pad(domain->name, dom->name, sizeof(domain->name));
 
 	domain->iter++;
 	if (domain->iter == nr_domains)
@@ -540,7 +540,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
 	sig = &dom->signal[signal->iter];
 
 	signal->id = signal->iter;
-	strncpy(signal->name, sig->name, sizeof(signal->name));
+	strscpy_pad(signal->name, sig->name, sizeof(signal->name));
 
 	signal->iter++;
 	if (signal->iter == dom->nr_signals)

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-dd095491dfde

Best regards,
--
Justin Stitt <justinstitt@google.com>

