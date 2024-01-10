Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E330829E7B
	for <lists+etnaviv@lfdr.de>; Wed, 10 Jan 2024 17:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA02910E644;
	Wed, 10 Jan 2024 16:24:40 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C13A10E644
 for <etnaviv@lists.freedesktop.org>; Wed, 10 Jan 2024 16:24:39 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e4d64a3d8so28850215e9.0
 for <etnaviv@lists.freedesktop.org>; Wed, 10 Jan 2024 08:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704903878; x=1705508678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R6/BfkOB3X/a4RKJT/vAJvs9aWAmPw+IY2BZPxEX1WY=;
 b=vF5PYCjldXXSOH5MfXA01w4cGetxVMD+VZiweaLoDG2jWa1XDCHNU+y58DbPu5vJvZ
 aBWll9Q+0UqYLT79ugDaMQBjwjZNo3u3CcL2s2YNKddEKBaOa8mpi3WrddMZ7/9F7zEs
 SNTfG7rvkLdYy9Z2c2jyg/BVwNAdshDO5RPeXT4EHZqJoYgpD6bQtC4lZVEsVlMydQES
 9oLzUKuMScTgujFcp/yOUvj1pon/NGWmBXkAkXA1s4xhJRQsGV4QgDrgudJcnHJt4S4Q
 5JHiDLK/gJy86LW3+GwGPT6n1+11Y2Zd7mVCs01QJ74kPl1KY3lStWf1h+Yr/0Pxn6Jl
 uAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704903878; x=1705508678;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6/BfkOB3X/a4RKJT/vAJvs9aWAmPw+IY2BZPxEX1WY=;
 b=kZrnPSg0J5QjRYQHlcgE70/pmGHyBMCKTxoRaEbn6RoH55tWeOAu8Tmeh+a9QvBX6n
 9THU8x8m1Vk7MSZzF51IZ+lX68WjmCzsF3Bg0wSFGr2yLQjLQy+Qva0wmRZeKTaK0WJW
 GkUqVPXpFChG1ucaT4aHt4ssMMY9J0RWJr1NXCLhmLqHDHBHac9R1+m3z1aKfokrmiQj
 HZsIZB0D8XK5ZIzl3vPBqes+n2NqkzmoERC1ab6NLPRRka4Ysb4e8ItUYR/dfmsdqXLf
 EUHhjf6VPgnUv0BqB3WTKivTz4OkMgsDPtEN/4RLAwBg0ygCrGYfE3rw3vBR8ka6aCA+
 LB0Q==
X-Gm-Message-State: AOJu0Yyko6Au9xHzKMUFXxxszy9qpV4aFAr1GbadimtQarORMgVQYUi7
 SVsj6CzCz+6r6ZaZD7KsY/A1g9JXdHjWpw==
X-Google-Smtp-Source: AGHT+IFGJW2y/e3roICrA8K9wFuh4EUFJkXNrLyEpHPqRYRlYSswh+UYKkdhr0qfFvxHn8GQE/wsvg==
X-Received: by 2002:a05:600c:5208:b0:40e:3654:29f4 with SMTP id
 fb8-20020a05600c520800b0040e365429f4mr665511wmb.32.1704903877854; 
 Wed, 10 Jan 2024 08:24:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a05600c311500b0040d30af488asm2686451wmo.40.2024.01.10.08.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 08:24:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
In-Reply-To: <20240110153704.1364073-1-tomeu@tomeuvizoso.net>
References: <20240110153704.1364073-1-tomeu@tomeuvizoso.net>
Subject: Re: [PATCH 1/2] drm/etnaviv: Expose a few more chipspecs to userspace
Message-Id: <170490387684.1887297.10058632363349793019.b4-ty@linaro.org>
Date: Wed, 10 Jan 2024 17:24:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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
Cc: Christian Gmeiner <cgmeiner@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 etnaviv@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi,

On Wed, 10 Jan 2024 16:37:00 +0100, Tomeu Vizoso wrote:
> These ones will be needed to make use fo the NN and TP units in the NPUs
> based on Vivante IP.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.9/arm64-dt)

[1/2] drm/etnaviv: Expose a few more chipspecs to userspace
      (no commit info)
[2/2] arm64: dts: amlogic: meson-g12-common: Set the rates of the clocks for the NPU
      https://git.kernel.org/amlogic/c/507b3e756ffcb174d383dd05df5084aed9bb6d14

These changes has been applied on the intermediate git tree [1].

The v6.9/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

