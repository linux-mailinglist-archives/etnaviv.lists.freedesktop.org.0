Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FE490BA
	for <lists+etnaviv@lfdr.de>; Mon, 17 Jun 2019 22:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E41189DD8;
	Mon, 17 Jun 2019 20:02:56 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6181E892BB;
 Mon, 17 Jun 2019 17:58:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h19so513248wme.0;
 Mon, 17 Jun 2019 10:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RA99XH++ZeHo9lFJDfpQ1th6xBYVyCVIO6aT2ccvLfQ=;
 b=N9TePG3l/RgsXRKp6a5Mhfjv28rF03x6aYZULT+l1d+dNrbopjYIWl45iDFpR30dKp
 UlJmwAx7s4Sm0VNtmQip7N/mOd+cmjBB9usU/3efRziWHv7byETFHx7lySCKjfIfaCjl
 mKGvkG0BPo5u5v2MzIqkotnoPpdKIuiPPHvWslLgf4bV/vSAlppYYD9aifPb8rW2tH1Y
 b8/i84jwSuYuMX7M6J+pN2nC/0sO8gJl4lUEVU5Fbc3s51MBGcO18prO4dXjJ76gEd7i
 6u9zuWduzNWorLjcw1mB2ZqAEImGqxg99BWPX0/iVSHvqF+Bm1K4VK87eZ8/7NVQ+ZyG
 ArSg==
X-Gm-Message-State: APjAAAXpTGarPYS2J8irQ9r/UgPFH50bOOzZXqis4+Tt09Mkwb9XFDuN
 EKcalSYsht6dowkzTWy2GgR9mAUk
X-Google-Smtp-Source: APXvYqxzwMRI3pC9nLxx+cmi8fX06IrtlUhdDEcmz2BcTfXpaVk8v0SGvmPS+vZF06+nGUJcsaBAYg==
X-Received: by 2002:a1c:343:: with SMTP id 64mr21050453wmd.116.1560794289646; 
 Mon, 17 Jun 2019 10:58:09 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id s188sm13333537wmf.40.2019.06.17.10.58.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 10:58:08 -0700 (PDT)
Date: Mon, 17 Jun 2019 18:56:06 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 06/59] drm/prime: Actually remove DRIVER_PRIME everywhere
Message-ID: <20190617175606.GE26766@arch-x1c3>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-7-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-7-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 17 Jun 2019 20:02:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RA99XH++ZeHo9lFJDfpQ1th6xBYVyCVIO6aT2ccvLfQ=;
 b=iir/cwro3Uo0pydX2p6MssHcUcKCWLi3F0aRNfT9oiuPoCu3KzQi3D++TfCMCA5kbq
 UhdVsSno+MyWwqU7UMla2YRrjl3vooBFlx0nKtYTh44mvlxTjTeU/ZMsoTFT3Na0Nbo8
 zbXVWPc9pfLCEz8akgJpe2z9seqCP2z2haWgAfsi9/bgn50zH7bOZc5jW9vXW8SMk4Rt
 tx2lTCVIciiKlEe6uGemUYOgLdxEayja9E1N+noF29tOg7VjKlKwytO7pxFuV7oS4QEN
 rJlpCllgKrwVj7eJfedrwSjRfOJSjzakYsBlPrwpP8+Cypssx+Hl6JwcIa7W9QWRzmBt
 BA8g==
X-BeenThere: etnaviv@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <etnaviv.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/etnaviv>
List-Post: <mailto:etnaviv@lists.freedesktop.org>
List-Help: <mailto:etnaviv-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/etnaviv>,
 <mailto:etnaviv-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 lima@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, xen-devel@lists.xenproject.org,
 linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8xNCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBTcGxpdCBvdXQgdG8gbWFrZSB0
aGUgZnVuY3Rpb25hbCBjaGFuZ2VzIHN0aWNrIG91dCBtb3JlLgo+IApTaW5jZSB0aGlzIHBhdGNo
IGZsZXctYnksIGFzIHN0YW5kYWxvbmUgb25lIChpbnRlbnRpb25hbGx5IG9yIG5vdCkgSSdkCmFk
ZCwgYW55dGhpbmcgdmFndWVseSBsaWtlOgoKIkNvcmUgdXNlcnMgb2YgRFJJVkVSX1BSSU1FIHdl
cmUgcmVtb3ZlZCBmcm9tIGNvcmUgd2l0aCBwcmlvciBwYXRjaGVzLiIKCkhUSApFbWlsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmV0bmF2aXYgbWFpbGlu
ZyBsaXN0CmV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRuYXZpdg==
