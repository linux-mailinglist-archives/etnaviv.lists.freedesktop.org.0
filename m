Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95E265C32B
	for <lists+etnaviv@lfdr.de>; Tue,  3 Jan 2023 16:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7FC10E1FE;
	Tue,  3 Jan 2023 15:40:26 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C7E10E2FA
 for <etnaviv@lists.freedesktop.org>; Mon,  2 Jan 2023 10:30:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bs20so23833587wrb.3
 for <etnaviv@lists.freedesktop.org>; Mon, 02 Jan 2023 02:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o3pnp00fAFbCsjrwHeYydTcNOrlFzBbyWXdERp2QJas=;
 b=nDp7cO36WKjes1Izcci1OZT/KlGLELLQ9Al9dmcUPZK1X1kRSyE+4XNsVd+fPNdoo6
 Q2753XPoSR3z6VUXYvNp1a0u5NLVEQayrD4YTdAtQVE3iT9+VXEqV4/OUY5s515JHQlp
 IpFIZLQ4VSKcorsvXHH+dTvXyOHYHSRpzXwkuvZPpL071MfrczEg+55sFkN8o59Ico3J
 PAfoWUI60jYkusOv0KBtsrok/CgbzkUQ9zTXcYXjrfEilpy8+aqkc4fMfrBE237c9DVb
 g5rieZWGpAk3GUNI7momneQNCf54Vq67nrXds/J4B1QFHqd1b3wI2mSYUKEHAdfJGXlZ
 8JwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o3pnp00fAFbCsjrwHeYydTcNOrlFzBbyWXdERp2QJas=;
 b=AHwDYIjhww2Jfi07s5RWFZvmE9xqayUDT8uD+NzfF4Lh4Q43MReaXS2Gt6eMnqzDQO
 v6wTQEiXVEzzi9EZYsS2sVi4hzbj87ja053hjpAxlX40oRfxghzE3tTlMkwmCOJMTpkE
 K5H6g1abM23QTcQ5wYQTGPDmiGdcKEWsi2xsxIbbuCyeb53l9HXp4jDUSxA7VKweX2ha
 VOTd+qZKVqSOyVQ7oQOSZvI6bg0qvXWPB8bmmBdAMaLzU9pXQC75WB3wd9ygyx8cOodc
 MMN6rStEAIvYzjNQEr55uKSeIg88h9dNXxyEDWTNhPCX4N0NTlmJ/bIjBsKyEYsemrjt
 Va0w==
X-Gm-Message-State: AFqh2kpUh/jWoFAPMkJonuuqwOFfo2+seVyCvTOt0oS+5NfzIIhUYj3U
 PVqcNPZjLReyAwNuY0uS3kzqvQ==
X-Google-Smtp-Source: AMrXdXu3JhHyb5jnLxTpAVovV90esQPMUhxrIbYN2ov3dmss4CzYWAETVnJ3KJrM+Cv2iPnI6yfXUA==
X-Received: by 2002:a5d:624d:0:b0:242:4d70:7882 with SMTP id
 m13-20020a5d624d000000b002424d707882mr24814292wrv.15.1672655407012; 
 Mon, 02 Jan 2023 02:30:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm15263318wri.30.2023.01.02.02.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 02:30:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
Subject: Re: (subset) [PATCH v6 0/8] Support for the NPU in Vim3
Message-Id: <167265540588.368935.8530142567394825177.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:30:05 +0100
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
 <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, italonicola@collabora.com,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@gmail.com>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
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

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/bindings)

[1/8] dt-bindings: reset: meson-g12a: Add missing NNA reset
      https://git.kernel.org/amlogic/c/a439267609f9d57b15991c55550956d7cc5404d8
[2/8] dt-bindings: power: Add G12A NNA power domain
      https://git.kernel.org/amlogic/c/340ea839b4306335bd627fe0dd6789df803aef58

These changes has been applied on the intermediate git tree [1].

The v6.3/bindings branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
