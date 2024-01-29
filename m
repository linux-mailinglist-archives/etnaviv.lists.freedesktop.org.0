Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2A8402C7
	for <lists+etnaviv@lfdr.de>; Mon, 29 Jan 2024 11:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F073E112816;
	Mon, 29 Jan 2024 10:30:26 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B3C112817
 for <etnaviv@lists.freedesktop.org>; Mon, 29 Jan 2024 10:30:20 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-7d2e15193bbso994406241.0
 for <etnaviv@lists.freedesktop.org>; Mon, 29 Jan 2024 02:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1706524159; x=1707128959;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=laogtMYkJGnbaIV+yWhqpoDmIUOyQqWLND7z4g4S1Zg=;
 b=f7sR9jBddj+Pq1JkjMS+R5/9sBdj0BQcYlKCU4ILk/CLa99CO3hPQk1IH58BWKQxLs
 QREO/uhlMTbwpR/uFiDNn6QFnKkJGVfpuwx8iUDCEHi0Rx8y1Ll7rASIRjWlriay0uFY
 Wau7+iGn0fTPIhGGd4j3r/jgmPSUNO5qcMTQVF7PuF2EKU9wXAMnQzY7vhCh17PRSixW
 N4KIQTfWrVlpyCxcrjb3pyBCi3r6gEIsUA1peWZEpwwxZN7d64bF6JTgZqSADL6zyoMA
 IF1M/jWxruoiIW6OsQmhF7NYW6bxAmgtmhRXj21u1/gT+q5F+DKF1GV8Gd96hVIohWG4
 kMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706524159; x=1707128959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=laogtMYkJGnbaIV+yWhqpoDmIUOyQqWLND7z4g4S1Zg=;
 b=hzatA6fwaropPt9zmu753ScdyLHNx6is7Ij8ldfjUVytO/wCQDYnzWHG0vFF+2CKSH
 gbuw76plYimf5dC5GZokkkqZyO7EbZjdrIgYg8CZdSRMUtP+FzK42CcU+bDC3CeLquXa
 f8PKHZLOFq1GJO8cwi40Ddw1nucJuFUL2DcRRNb96VXb/VSpiv1SGcM86b6R04R9yd32
 RjUWikIbPe1PH2WlILCW6useIA7eGAePsI/atKhhqTB9LJvAr+Gta0c9SvravNo6DTVs
 RspclUzkDFk+oKt/Fj6sdctx2YmM/akZKsF+GMLH3vXxe7AKn/dxOnN+V1ivNqFR8vF7
 7oZg==
X-Gm-Message-State: AOJu0Yys30Yi7iOO0nmM3UGScQJo/FoVQB21tWQWPaVxw+8ON4u9Mue7
 YXHcI5jqZWvue/d1gIBVeKZ8MRiscxEOc1I1EY7Q1vXM1JDh+tq0fYWSDFoBeky7e4O3twiok88
 zetZc6wXruHqyMJDdCD+RulhcGqSvqFoFJLU6Ug==
X-Google-Smtp-Source: AGHT+IG02k1D855wHGJvL/3W5YxqpMq481SOQ1eyc1YgFIpQdWBD+1lTmFmPT5LySDdWcKuUKgpUqLEQNRuRtxR4O1g=
X-Received: by 2002:a05:6122:2019:b0:4bd:6109:ab9a with SMTP id
 l25-20020a056122201900b004bd6109ab9amr1513382vkd.8.1706524159615; Mon, 29 Jan
 2024 02:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20240126165856.1199387-1-l.stach@pengutronix.de>
In-Reply-To: <20240126165856.1199387-1-l.stach@pengutronix.de>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 29 Jan 2024 10:29:08 +0000
Message-ID: <CAPj87rNOMYS7g_bU8Xjmh9xEJhuzG+BViXakC7wzgiDaG+9yCg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix DMA direction handling for cached
 read/write buffers
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Christian Gmeiner <christian.gmeiner@gmail.com>,
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Lucas,

On Fri, 26 Jan 2024 at 17:00, Lucas Stach <l.stach@pengutronix.de> wrote:
> The dma sync operation needs to be done with DMA_BIDIRECTIONAL when
> the BO is prepared for both read and write operations. With the
> current inverted if ladder it would only be synced for DMA_FROM_DEVICE.
>
> [...]
>
>  static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
>  {
> -       if (op & ETNA_PREP_READ)
> +       if (op & (ETNA_PREP_READ | ETNA_PREP_WRITE))
> +               return DMA_BIDIRECTIONAL;

This test will always be true for _either_ read or write.

Cheers,
Daniel
