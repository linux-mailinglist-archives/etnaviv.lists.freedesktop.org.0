Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA714AE69
	for <lists+etnaviv@lfdr.de>; Tue, 28 Jan 2020 04:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298E86EC7B;
	Tue, 28 Jan 2020 03:33:30 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB0A6EAF8;
 Mon, 27 Jan 2020 21:07:15 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4487B24687;
 Mon, 27 Jan 2020 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580159235;
 bh=tAX6yDr0IhujvnZ6kLXHg9mvJe9D611oaH/B6mkzBbU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Dayd5ALxnRvjcmd6CdVdAnAeHlsKPu8amrIZXBRoRG/qDNJYwb+aGAXwJUE87oJnZ
 zexYy+8zr3ZQZpF6JREvfjVWNvAez7vq/2a/faB3lWJXSqKkBhqfGK4BfJWTE6nJgp
 5PlPwz4EVva39REDLIN3r45rr6Z7CxVxpm4LTEYA=
Received: by mail-qt1-f169.google.com with SMTP id e25so8541250qtr.13;
 Mon, 27 Jan 2020 13:07:15 -0800 (PST)
X-Gm-Message-State: APjAAAWC5bVHPu7edVhdRBHmXrQam5LVTPxhu5n6rEgYaPOFMe7BX4qm
 NZMFIHlNxybICgB3QiPje0JF3Eq292TvWrk61A==
X-Google-Smtp-Source: APXvYqz6TcnGjayCnrZyiOhSkagdqkmRPHWtYG3imaw/anjUcBcBkDZwHIlxd5O98Ut5vvyzcURPSnzpyZ2XVj/mInc=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr17990875qtj.300.1580159234323; 
 Mon, 27 Jan 2020 13:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20200127145223.8283-1-benjamin.gaignard@st.com>
In-Reply-To: <20200127145223.8283-1-benjamin.gaignard@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 27 Jan 2020 15:07:02 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+702FHQtgSu-c7M8j-4G578Ce1x3WhhQY2OCpq8APi5A@mail.gmail.com>
Message-ID: <CAL_Jsq+702FHQtgSu-c7M8j-4G578Ce1x3WhhQY2OCpq8APi5A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Convert etnaviv to json-schema
To: Benjamin Gaignard <benjamin.gaignard@st.com>
X-Mailman-Approved-At: Tue, 28 Jan 2020 03:33:29 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 etnaviv@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Mon, Jan 27, 2020 at 8:52 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert etnaviv bindings to yaml format.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/display/etnaviv/etnaviv-drm.txt       | 36 -----------
>  .../bindings/display/etnaviv/etnaviv-drm.yaml      | 72 ++++++++++++++++++++++
>  2 files changed, 72 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
>  create mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.yaml

Looks good, but can you move this to bindings/gpu/vivante,gc.yaml.

Rob
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
