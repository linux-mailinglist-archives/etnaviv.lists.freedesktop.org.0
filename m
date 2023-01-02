Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A095065C32D
	for <lists+etnaviv@lfdr.de>; Tue,  3 Jan 2023 16:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4545A10E26B;
	Tue,  3 Jan 2023 15:40:27 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534DB10E2FB
 for <etnaviv@lists.freedesktop.org>; Mon,  2 Jan 2023 10:34:01 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id l26so18526291wme.5
 for <etnaviv@lists.freedesktop.org>; Mon, 02 Jan 2023 02:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8mgGt+WDil8dXaAkpJ8qZ0avMhy4Myb58QPGVDym6jk=;
 b=yNsiE5cnW7N2EYqUIgR6oylWXDpokhhUBC++Hyr5GSKhbbGYxxLF6AxDzhQlxgp8bB
 iP9FHXzLpMBT4+H0U+GeaOZgaqPkosrF71zTJbgP0DTCTH9Iep+XVGkqJPQ1AOwrWdKi
 gyUCqDrOD0r3EbPZfuAHfx4yVfSW0Ww1GfTy/GOP7wWX+VgUzWfWDepBAvPLMOsoNCmn
 0CJyADgaPbJFbsBqtM5gEmmtlJ+ndqG80yihZN4wiwzcNdNQv/eJbAfTVlioeKWnBQ8g
 u7Mk+2qHk6PzpoxLBm+ikqT+ux1UVPpr6X6D0Oxepk3AV8ORdC3Fqr22906Vtn31Ju5R
 mL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8mgGt+WDil8dXaAkpJ8qZ0avMhy4Myb58QPGVDym6jk=;
 b=Gp3M7sthj58hJ4QSpU0d/wlGc0TYOTW2k24Z+/1VfILfzHUr0/i0DBqfeG7yHdrmbg
 9mCy9Y8rc+p0GwQ1rR7xklT4DiRexQHttX7h7vNEhEkJl0DYcgb3Ow4u9ar2lJBAvDCn
 ATiDjU4JcMuUhNo4aqgN2alLTDnCKZKL+zEPl2ZNBkrydCi6HtPX2lVSt6gsr0FmEp4S
 8SxTAPqp1bFTVocEE0G4ssTjqRoq0o2Eq9mbJTnP9TfsBtZSE7vZa8ipeUXzT8BG5rMJ
 mTbj3rJwf3hprolwDlgGNEb09WQOTiYhmvYX7ue5XXC2O8IN64OS3fhiDX52n3WIMMZm
 6gZA==
X-Gm-Message-State: AFqh2kpANK9Jjv2P7CtHpa0+om75hPm+mGqPA2PhTFpv4PFmh7SbmvoT
 Bo9Z84i/HqguKKQxLMB3lDItew==
X-Google-Smtp-Source: AMrXdXtR8Zpqr1OOrcZbsXvxGi2rMh686vRDHyobS4MDPmdqNXmhUxFGkbSoZEpsVKm7yR6UFphmcg==
X-Received: by 2002:a05:600c:1e09:b0:3cf:b73f:bf8f with SMTP id
 ay9-20020a05600c1e0900b003cfb73fbf8fmr28237316wmb.7.1672655639818; 
 Mon, 02 Jan 2023 02:33:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b003d96efd09b7sm39558447wmp.19.2023.01.02.02.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 02:33:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
Subject: Re: (subset) [PATCH v6 0/8] Support for the NPU in Vim3
Message-Id: <167265563884.375287.14738065029964626826.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:33:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Tue, 03 Jan 2023 15:40:24 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, italonicola@collabora.com,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi,

On Fri, 2 Dec 2022 12:52:12 +0100, Tomeu Vizoso wrote:
> This series adds support for the Verisilicon VIPNano-QI NPU in the A311D
> as in the VIM3 board.
> 
> The IP is very closely based on previous Vivante GPUs, so the etnaviv
> kernel driver works basically unchanged.
> 
> The userspace part of the driver is being reviewed at:
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/drivers)

[3/8] soc: amlogic: meson-pwrc: Add NNA power domain for A311D
      https://git.kernel.org/amlogic/c/9a217b7e895313a4d42f7a6c48b6237a595945f4

These changes has been applied on the intermediate git tree [1].

The v6.3/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil
