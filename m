Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C92342B6C
	for <lists+etnaviv@lfdr.de>; Sat, 20 Mar 2021 10:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004BE89D43;
	Sat, 20 Mar 2021 09:31:18 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE4F6EA9F
 for <etnaviv@lists.freedesktop.org>; Fri, 19 Mar 2021 19:53:13 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com
 [91.134.188.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4F2F1g5Y74z4wwdY
 for <etnaviv@lists.freedesktop.org>; Fri, 19 Mar 2021 19:53:11 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="KbloO9tz"
Date: Fri, 19 Mar 2021 19:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1616183586;
 bh=Qfmz6Kntn0ljMpCFA18Q5F+RuwU4vSgwqjgFJzNC9uI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=KbloO9tzK87GD6lD9Tik5JjKYayObpiguiuF3zfl1MT6BHPilmLkXxLeMftM9OIHj
 ZSpIF6EcG+C6TOygDIVLV3OFl4wyqd0wtvnykFuzgZ7LUVeRsFtIrXTQrqblTaNfWW
 hY8WGOa8draKUrESc79qQmbHw28vF1o5/v367bTGFmWs0yPYznBYYSWxSOnf35ZnaY
 iEafPqfSjFNELF4eOs673mOOac/rRyi2rl5YHK8tO1I3mEiLiEa/6JF4foU0OtUwey
 Vgo2cwJojiaoEUljuFv72nwBoM7CcWzit1sXCA4KvELxpsXrpt7MR4GmdRjuKpW0E1
 XJa3tB7KeOeYQ==
To: Lucas Stach <l.stach@pengutronix.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/fourcc: add Vivante TS modifiers
Message-ID: <4LQSSN-fXyGvlGD3wSNEi7_TXX1VwnyINrJ6ta9jlLsd8TE3hDf7nZHFbe1GMLu2PYHS9ju726GfQWvd_wmUmAnbojBsKeythWYAWz_k4ak=@emersion.fr>
In-Reply-To: <20210319190607.2903545-1-l.stach@pengutronix.de>
References: <20210319190607.2903545-1-l.stach@pengutronix.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Sat, 20 Mar 2021 09:31:16 +0000
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Friday, March 19th, 2021 at 8:06 PM, Lucas Stach <l.stach@pengutronix.de> wrote:

> +/*
> + * Vivante TS (tile-status) buffer modifiers. They can be combined with all of
> + * the color buffer tiling modifiers defined above. When TS is present it's a
> + * separate buffer containing the clear/compression status of each tile. The
> + * modifiers are defined as VIVANTE_MOD_TS_c_s, where c is the color buffer tile
> + * size in bytes covered by one entry in the status buffer and s is the number
> + * of status bits per entry.
> + * We reserve the top 8bits of the Vivante modifier space for TS modifiers, as
> + * future cores might add some more TS layout variations.
> + */
> +#define VIVANTE_MOD_TS_64_4               (1ULL << 48)
> +#define VIVANTE_MOD_TS_64_2               (2ULL << 48)
> +#define VIVANTE_MOD_TS_128_4              (3ULL << 48)
> +#define VIVANTE_MOD_TS_256_4              (4ULL << 48)
> +#define VIVANTE_MOD_TS_MASK               (0xffULL  << 48)

Hm, I think it's the first time we have values you can OR with modifiers to
get a new modifiers. This sounds a little bit dangerous, because all of the
fields don't get through the fourcc_mod_code mask.

Maybe it would be better to define something like this:

    #define DRM_FORMAT_MOD_VIVANTE_TS(color_tiling, ts) \
        fourcc_mod_code(VIVANTE, (color_tiling & 0xFF) | (ts & 0xFF << 48))

And then have defines for all of the possible values for color tiling and ts?
_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
