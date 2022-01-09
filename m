Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50F84889EB
	for <lists+etnaviv@lfdr.de>; Sun,  9 Jan 2022 15:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF9410E1E7;
	Sun,  9 Jan 2022 14:49:54 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4673810E1E7
 for <etnaviv@lists.freedesktop.org>; Sun,  9 Jan 2022 14:49:52 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id m4so1768535edb.10
 for <etnaviv@lists.freedesktop.org>; Sun, 09 Jan 2022 06:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SHY8jALKtaO5XWJLIKzSyeD8eMj+sZLnByWrmOMA7AU=;
 b=H9lJAl2mEgnGoHf/GX7vSsR0YiEY1z8/RF02dgDgbaw39Xz/r6IDIfE3cJYJEaHD89
 9yDwy9vj5T9fl4duUo/w/da7cbcoMFaTM9ZnbkK0VPnqDU49WqjucvXoVAgZt75P//YP
 3DyHA7p7/y4aQbjI+mjCBo0cO3YJVu2nLZAt6rsLPDreX4AQ4Hm67AqiTqL6IE3iEaQl
 IXRJgvb57JsNfec5OBkOGM2hA4thzd2FTlREUowDlriHyVU/0W77MhCOepzeWk8aszBQ
 uD6FR1CMNbksjBB3sbPKQ2yVQz9aetOGGBcwqRvGjvJHUP456kR1+tQBna0UPt+2uIZp
 Or1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SHY8jALKtaO5XWJLIKzSyeD8eMj+sZLnByWrmOMA7AU=;
 b=12L0GsYHCWi4mAD4hSyIM7fNrOyEmcflQqfcM2vanAiWO6mliMw63Y5tPYBV1RbxJq
 l6ViKwZgKlhqlHtUk3yFKiJAogNbIncvnKP6baINUsD9C40IUVk5G793ml1ECI93eyha
 +wohfzy94RqRItc8Jo/XljL0DUeiO59c0qiAR7EdGZRuJasWD+KXy+hdKf+Mt6lmX1lC
 R5Fxav9VFAdZOmdWNUXQVB3J1AvaFENn/B7qewVB+d8p3yk739+F81LzJjsOylIsa2EW
 tcw3lOtIG11kG0pfpJt9mU4TaZ+lq5BYhNQNNZOFxwCRjx33VPwW+eIMGOFOoVA29Cob
 vr9w==
X-Gm-Message-State: AOAM533cgT4MZTRdqhQ4yTfmi0I9VJJ4a8wX1Qofo5hLTWjeJ62pDoV2
 Vfq/DmEFWAYRDQQxrHoRsp2XK58qQDas7eReyr1DRXqOEME=
X-Google-Smtp-Source: ABdhPJwqTEYmMuYh1NaO1MzKbUYSQb1QWDichAUGSrdXunLNrAuv+HKeTecislDmCAqwumwrB0cv9Rj4Pcjf+MQiQVc=
X-Received: by 2002:a17:907:6e01:: with SMTP id
 sd1mr4206681ejc.311.1641739790722; 
 Sun, 09 Jan 2022 06:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20211217205936.153220-1-l.stach@pengutronix.de>
In-Reply-To: <20211217205936.153220-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 9 Jan 2022 15:49:39 +0100
Message-ID: <CAH9NwWcYHOSv=okUex4e=70otPwDPQDuZf1Eui0H+UKTp+a2wA@mail.gmail.com>
Subject: Re: [PATCH RFT] drm/etnaviv: reap idle softpin mappings when necessary
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
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Fr., 17. Dez. 2021 um 22:10 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Right now the only point where softpin mappings get removed from the
> MMU context is when the mapped GEM object is destroyed. However,
> userspace might want to reuse that address space before the object
> is destroyed, which is a valid usage, as long as all mapping in that
> region of the address space are no longer used by any GPU jobs.
>
> Implement reaping of idle MMU mappings that would otherwise
> prevent the insertion of a softpin mapping.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
