Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74419BC452F
	for <lists+etnaviv@lfdr.de>; Wed, 08 Oct 2025 12:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C96110E7B9;
	Wed,  8 Oct 2025 10:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UQclxZnd";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C580010E7BC
 for <etnaviv@lists.freedesktop.org>; Wed,  8 Oct 2025 10:31:57 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-33082aed31dso8390339a91.3
 for <etnaviv@lists.freedesktop.org>; Wed, 08 Oct 2025 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759919517; x=1760524317; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f6LZkodDEq1HIxCXkobbf13l6U/GJUVBzoud6sJa3VY=;
 b=UQclxZndgONbsS4hhke3sosOw5t154y5KwFi9/gGB93AMISrWwNITrSVAzBcqWXXiK
 VtDg1p7JFrpBD7g9RkhCtkLTJcz/l1qK1s5NmiiVfG1YSutGSbcOkEB/QHZvFBAEyoUV
 gMkuYXfN+b6ZVVZ65tXViGynmARQiC8LeKI6lx/98x0xcUuuYy+Rm7KBDYkieW8/cH6h
 4/7sPeU+THr6MGDhlgPvks8ogSC/A5HFPyGO39d1N3HInSOzD4DLn3oG0b71DStfWpl6
 EbgSzjc5+04k4YmjT3QP5HwJBxyYfdMTuR6yRIh8x8isWqX5iqTbaMuyawL1Mya5UMLg
 YJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759919517; x=1760524317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f6LZkodDEq1HIxCXkobbf13l6U/GJUVBzoud6sJa3VY=;
 b=K5J5E+lAX+fBe7AadPshwxrq96O92v87wyHKaOcr1WwjrczufFKAiSjNWEmsUs37pn
 OYtw0BK0LcLYFsfEaFdP4w6FZ1z2+C3H5C8XkhC3MGU7ho9dnfsC4hfZWnEr/yjV/xN/
 BJurM+C502wd0ZvKl+O8XgHA/3lSjXNK1hS8aMShoHDht63O1s9a9p34FJRqmciN+1JT
 lgxsZVF6Tv7Tu53tF4JJMXoA8/NINS7pKwruMMO8ogFDHdR0te6P3sD5HdARm8xh0qe6
 0qb3yBDmz4bLAvkTlKVqCB51AUiq3V0tI0JgCfr7TcMTX8tv1T6cL78fuIdfkLyyUm9H
 jqng==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+SdSqh4UPGBW+7hEJb3fa/Z2O1Wp15JBfM2QFD1bR7C9bG/wEujGrsghwn7PqfpX3HUtwHiks@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwU2okq7YE8CjJzSJ10w797ZgYHRiTZGTXp+44XHH/PmWu4cFBZ
 wUeYpSi1bN1S3ERNhbztg+3srCIPxr4hyW8n+diiloLq3MvE8x6F5sBbG3nZruBzeYRSu6Tx8Mr
 XIm7iaW/NP7uFXGvFjyZIhtRKVZ4yuIM=
X-Gm-Gg: ASbGncuGCQj/uwEihy7Mk+CBwwGHSbY9hgiZrQ1b5VkC1bILJSkHgcxczzJhT8Aqeu2
 HPY5QL1WrYSCggbb26ip6rcLaEJJMGYPD9GVzS03QwPOQK+vC98TK5BN6O4xtDcfqPP+lufPRMN
 dJAMzynIBF0gCAQ7pRMp0q0kM7cPBdpupj0hfYiLLPOQbGv+iDSrORKGEo0FcC+8x8dpLitbjGQ
 YGdEK3fj9gvjESDoGlESu995t8b9g==
X-Google-Smtp-Source: AGHT+IF14AhZT9buSbXWxBQj5IqiSkq7Ctbzzynaj0/ilXj75RIGaxagvOzHwMf1yydBcpOxbxFs4BVRVEGf1xQ5Pq0=
X-Received: by 2002:a17:90b:4b8c:b0:32b:6cf2:a2cf with SMTP id
 98e67ed59e1d1-33b5111895amr3871446a91.14.1759919517166; Wed, 08 Oct 2025
 03:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-19-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251008085359.52404-19-tvrtko.ursulin@igalia.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 8 Oct 2025 12:31:45 +0200
X-Gm-Features: AS18NWA5_CTsZJVKKZZArYCDqLMe_ZXWxpoEel2YI71aNaG-kPc51XfoHb4pNy0
Message-ID: <CAH9NwWdStMzwzhhpbJrsX42_gffD4hFkyy7QErJvPOCtZSRf=g@mail.gmail.com>
Subject: Re: [PATCH 18/28] drm/etnaviv: Remove drm_sched_init_args->num_rqs
 usage
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, etnaviv@lists.freedesktop.org
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
> Remove member no longer used by the scheduler core.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
