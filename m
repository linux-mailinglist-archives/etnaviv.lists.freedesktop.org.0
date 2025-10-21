Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A93BF5A51
	for <lists+etnaviv@lfdr.de>; Tue, 21 Oct 2025 11:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377AC10E2F3;
	Tue, 21 Oct 2025 09:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eaTUWinI";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09A910E2E5
 for <etnaviv@lists.freedesktop.org>; Tue, 21 Oct 2025 09:52:10 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-33d896debe5so3141963a91.0
 for <etnaviv@lists.freedesktop.org>; Tue, 21 Oct 2025 02:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761040330; x=1761645130; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K8jwCSDNhGwJHggzSQN1M2tcia9PBWtTMzqgZ2U6K50=;
 b=eaTUWinIzQxqY7aiRT6ulqdkyQgJh0PB8Qx8Ws4n7ubhZJvYOWTETiFH5ozgqEg3F5
 mDRD3RvfOZOWn9hHzHmDfzx06ZSW2L96JpUX3lmd/sQ59gBDCh9JG9nrnCLP55soiOwV
 nMEpQ4JG+/55uqb5UnNJoHM92x93zp1k6q6n586zUxVmxu3oX3tFwxJHsnk+rcUhJvGH
 8onlKJLA8sjymbBF7WFBmt6mLQn8qcct3CNV3u2uNtlMnYKN0lgdi+oV6+9384dUYXPv
 njusAXbv2CB5FOZQ/G4pETw5wIQAAPYlw7cR2QGtd3QlLMUPI8JxxTKQeJWpBSSdPvYG
 K4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761040330; x=1761645130;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K8jwCSDNhGwJHggzSQN1M2tcia9PBWtTMzqgZ2U6K50=;
 b=PWQEYWvOr5Cf3CnSxSzpYsRt/Wn9KDuB70u5n1ebQdc2Zyo1aVJ5RRXlcQo23sFSQm
 loHMMXCjRKWa1OW8Eq30E45XCj9Uv1zNyc8cjcSyki29fsyNaGyfpfbN7nCBl7KxuYm8
 yde6/5aXsWqnwCyHgWlXzq6lllT2Frg4iNidyyyuWGNJrGTjgA24qpvHDeO9riIR9Aqv
 hghxl4/oF7XH3jqSyCnTRhAjhmXj/oPp+EIVd7jk/jv6b3dygkIgNgG0jITXESRJT5i0
 ti/iwRutsY4hzoRVpGc7T7fivHSPm5TGyeg4gkQCbO+Qg1/MSC1ZwAKTrjh1jpZTCZCj
 FYog==
X-Gm-Message-State: AOJu0YwsZao9uwtXfOGDa+gfox9AoJwLOAt3OKfUQeI6wo2BJHZ7AwKO
 e0NpiH2Phd19aEgnA30dov9Wo5uZvRaCjpbdWYfQRjCa+H2f/Nx5C+IBwA1hYFxXjgZlfWuLpRJ
 Hqy6RIUbVrGtNMwnrsypV9u18OdrN0XNIRX57
X-Gm-Gg: ASbGncu9X+w0v4AFY+eSKaEMPa8Oz3MtyUPhdkdbgNRzAaiDUcKCWrgDh2urHqmb9wh
 LqoNci1wiUJiDr8CkNbRb9PRykzlfqHVne9lqaIsIgaKSKaOQJZVDkHOeOds5j7ZgjgldAnfOtS
 sdhPhDK9UuY4p7dW554ZlJW7f3hqvEi37gmWwtFedB/9JdLcwRrHzDrbmVm5C/EHvMFoc8tRTdi
 etD0+83Jn7g4E9ArSov0sOq2FLomR1NAZ7G900WU77f4t3dplyNshEz99WFsllte5TwDw==
X-Google-Smtp-Source: AGHT+IG23FxeOHCoMqTfhFgLarGEk0iZCA29r/9imOIOPJUHrjyHV2ZDMGJ7QYTK8sEdU0yOMeCneV8tQoishg1dTC4=
X-Received: by 2002:a17:90b:248f:b0:33b:cfae:3621 with SMTP id
 98e67ed59e1d1-33bcfae47d8mr12840569a91.32.1761040330410; Tue, 21 Oct 2025
 02:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251021093723.3887980-1-l.stach@pengutronix.de>
In-Reply-To: <20251021093723.3887980-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 21 Oct 2025 11:51:58 +0200
X-Gm-Features: AS18NWD4zdSyZ7dAT--Q7ATUT1K_RvSYXFdN1uFlkuPoTveP-glb9vojpIzg8po
Message-ID: <CAH9NwWfEYJLF2L4=uXs0Dv61TkYsGsGLHohRrgPRi6c3n99YQA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/etnaviv: fix flush sequence logic
To: Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

>
> From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>
> The current logic uses the flush sequence from the current address
> space. This is harmless when deducing the flush requirements for the
> current submit, as either the incoming address space is the same one
> as the currently active one or we switch context, in which case the
> flush is unconditional.
>
> However, this sequence is also stored as the current flush sequence
> of the GPU. If we switch context the stored flush sequence will no
> longer belong to the currently active address space. This incoherency
> can then cause missed flushes, resulting in translation errors.
>
> Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
