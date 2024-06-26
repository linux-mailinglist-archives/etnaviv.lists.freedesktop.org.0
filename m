Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD70917E4F
	for <lists+etnaviv@lfdr.de>; Wed, 26 Jun 2024 12:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B270D10E270;
	Wed, 26 Jun 2024 10:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="lYfTnYXU";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E9310E09B
 for <etnaviv@lists.freedesktop.org>; Wed, 26 Jun 2024 10:39:14 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4435f782553so37310691cf.3
 for <etnaviv@lists.freedesktop.org>; Wed, 26 Jun 2024 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1719398354; x=1720003154;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0WHKZbvNuX92u84qLcbUXpAEPMgHXpjkUAo84IV0s/o=;
 b=lYfTnYXUD6j+Ahke00KqeJe/btq7xyuUaD4nLGR5/Vt/9E5XnzLh5VYhl5wwRni53B
 D1ljqMtSNsHJEQapDiiuf8P+kl4gGLoVE3jNIEtVlECXKxyPJdt4+YxuQCEljTRFTm8Q
 1tVPjiZKzlbBR0FRzkChFQGXk+w85SFVBzxGno3h20YJNiI7Zr7pgvrAAU90BtlS8iCm
 q7engeXnVnBvETNrfROS+VTlnk7cedfiogB17jKulRLob2we04O6pwVq+VicY7tVKa7K
 A0N5v5vJIrx4/pProcfM+UXfl2D2h46qHSCIm73l/QOtvinWb8dZJMuTM98mDDQUzR/U
 d9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719398354; x=1720003154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0WHKZbvNuX92u84qLcbUXpAEPMgHXpjkUAo84IV0s/o=;
 b=rkNkddmLLJ1fm25d4zBnGTLayMQUtO3kZ+yaoHboXTz/j2J0oJcV2ZDqdRXsFTjwEj
 EVnK/O8ctccFJ1hTk3zh2JFxYuA1ZVyP4wgxvrwA5obXpRwiD/dDDG9q13cnwlV6vNli
 ZvKgzU9/QaQe682UNmK/Q76qqbCM4KQznSTZtcFRUgukha9G1/BHFcJSdQSPYO5+uiT/
 yRWLz6assMtJyJozQetjg51Mq67/n8i8gPSUo6ke1oGOVd+YgTKkiWs340HeyVjLoenz
 eTSmyWAe/r7SgGMY9UrukQizZFSjQj1v84DzBESxGh4fC53zOVnztmtc4KqYU7+0w7Et
 t9Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxFgTqusOZUsrR93GxqKOqEmzTnpfy91nYzeWijT6+Fea1zRyhJf56m1Z+rKcbLd5LTvMUFZbI+5p8ULG4cYcGiRVEPlucjfMnlzD0DQ==
X-Gm-Message-State: AOJu0YwQRgBuPnaOg/KKUmBT7I8YPQET/8CyIW+SNsNCsRLgTkhIb0FL
 vZvFZ9UfKPH3BfTkyXpffzKY29Pi7dmlzUrVNynBW9jhvRc53mZy/JvZzZFXEWm7543OmNR6DuP
 3imU+3Av+PVECVwzImlEjtsm3XlcrviEDpB4OMQ==
X-Google-Smtp-Source: AGHT+IEJ812eF8zWIpx152aNazf7TkH1mzWCEt7UM4JhxnxcwMH6yI68IWE7/8fYUJAfdVLiQBlSAhQNkYlNULRX6aI=
X-Received: by 2002:a05:622a:49:b0:440:f54d:1bac with SMTP id
 d75a77b69052e-444d91a819dmr125069131cf.16.1719398353655; Wed, 26 Jun 2024
 03:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
 <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
 <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
 <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
 <CAAObsKAt563VNzDcF4rGkWPcxBPzKcq=Hj5RY6K20FWR43nvUQ@mail.gmail.com>
 <ZnvDJVeT3rz-hnv9@phenom.ffwll.local>
 <7cee6b78bc2375d9b014f9671b0d72ae65eba73c.camel@pengutronix.de>
In-Reply-To: <7cee6b78bc2375d9b014f9671b0d72ae65eba73c.camel@pengutronix.de>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 Jun 2024 11:39:01 +0100
Message-ID: <CAPj87rPB=N2vJ-5C7xXORYstK3=TpX+jZ7mCr7oxY2wpXeaTTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 linux-kernel@vger.kernel.org, 
 Oded Gabbay <ogabbay@kernel.org>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Daniel Stone <daniels@collabora.com>
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

Hi,

On Wed, 26 Jun 2024 at 09:28, Lucas Stach <l.stach@pengutronix.de> wrote:
> Mesa doesn't cope right now. Mostly because of the renderonly thing
> where we magically need to match render devices to otherwise render
> incapable KMS devices. The way this matching works is that the
> renderonly code tries to open a screen on a rendernode and if that
> succeeds we treat it as the matching render device.
>
> The core of the issue is that we have no way of specifying which kind
> of screen we need at that point, i.e. if the screen should have 3D
> render capabilities or if compute-only or even NN-accel-only would be
> okay. So we can't fail screen creation if there is no 3D engine, as
> this would break the teflon case, which needs a screen for the NN
> accel, but once we successfully create a screen reanderonly might treat
> the thing as a rendering device.
> So we are kind of stuck here between breaking one or the other use-
> case. I'm leaning heavily into the direction of just fixing Mesa, so we
> can specify the type of screen we need at creation time to avoid the
> renderonly issue, porting this change as far back as reasonably
> possible and file old userspace into shit-happens.

Yeah, honestly this sounds like the best solution to me too.

Cheers,
Daniel
