Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45D5B022A5
	for <lists+etnaviv@lfdr.de>; Fri, 11 Jul 2025 19:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8898810E2C6;
	Fri, 11 Jul 2025 17:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bWo2gf6c";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F5010E2C6
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 17:35:59 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-60c51860bf5so3867338a12.1
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 10:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752255358; x=1752860158;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6Y7KQBMvE5wPTJUBRle+pzVi+8DRYqjxpjSZtude4vk=;
 b=bWo2gf6cZhnPyFaSE4T3J1lvbVnG0Ds2vVTcBBXsebf7SX/pQdmOQSAqthLiMyTz93
 +RRxOJPCpdbAn8g9NwfpL4UlQdYczkd2qK1L7aMtGGyiuUPWL+wJHuRheuEcOYoItaj5
 widFMavknUh3QwUKLNuLV9VESAUtZRXoJmyfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752255358; x=1752860158;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Y7KQBMvE5wPTJUBRle+pzVi+8DRYqjxpjSZtude4vk=;
 b=MZ3HVJB9yqNWnUec7PrVSmPMLsSqkwGvuvUsAq4/Lj+q0TxFjZ/ly5bZT2VD13xt5u
 HnV1Ji0QS5NvP5WkuUBmIt6/rvQu72NP6fb0OCAq7q00TFjfQCmiJr+SKDxuN8HkvhMn
 FwnzYdwGfhrejFoYTbmXYvO5XpaI4CGYl2Q/gc7lmm6X2pSOzhXXcQr8qlPfTUivVsGC
 yqEuoa5t/3Wzww4XKUF2POea/VfykJpT4xAgfhrhVHi1B3yZ0cUys2uGmsJYyX17DUza
 qG3dgnlz9wWCFZ7jjEfIlrNrMk5fs1eRFSXF+oRCfJWefjFF9mwlA6HNIfHoB2lCK9if
 c1Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX+hbK/aYR358VCqHxcJpokfecs0BtXZQifNLxZz9wHo/F8js02Ge45E60yLoUj4x7pFs2s1nJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycnCgLf+WERTnLie/pIF43Cz8Ku+qqLd5cA2swbhG1OnoA5/Ab
 9NJYjCaJMIVV5yQ1hvgrVcvpcQg14COzc8CRK8irI2rKxuX9REIZpRhJk4eQ1j1zMFJb/SdHvZL
 hVzuKgxsRCg==
X-Gm-Gg: ASbGnctSUBZffCguYEu7iQk1f5P0z1mICZUIuMylf9wx+rW0TV+QyeKyZJdTgTW4j63
 E4hrs4V56E0i1xo8jLMlJzonh3d+okp4wP7dfngFeUbX5nB4TRITF1PnTPwyl3sfCorfouXU2BR
 EjoTZh4y4YccyfWKTWuyNB9B54aRpB9NgNxcjZMPXcXQsvz3a/fkv4qi0RTwGNUv9tiuHelEpV8
 MhjA5n9i21s/7VYs1fkcNsvqzsppy34gQj9fzMFZkuL+smW6xcKWaIjt+H5b0LcFK+HGDcP2HwV
 Q2yrcZ5+z1IRPknYDffY4d4eB1W6VB0E8KzZVa8UKX2ZUCOoYV8UVstc83sJ8O/jdiE5pDrbSVE
 cmzye8yGBR/DOy3+sUqddiKFJQz/XYJcnBTlH/6xp1vkJCk6NokgjbeScBjM4fLM3yzoL59COgx
 hmLdnxu+M=
X-Google-Smtp-Source: AGHT+IFjbI33JMrjr4pCAMvuf9ERPDV8vLEqJnykfTN9uR737zoaxIA00mTxXA3p7LoBn3wyiqr8PA==
X-Received: by 2002:a17:907:c12:b0:ae3:ed39:89ba with SMTP id
 a640c23a62f3a-ae7010b7e8fmr312258366b.11.1752255357813; 
 Fri, 11 Jul 2025 10:35:57 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c94f48eesm2437150a12.3.2025.07.11.10.35.56
 for <etnaviv@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 10:35:56 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-60c5b8ee2d9so5121803a12.2
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 10:35:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCnCfllV1W3YZwqBva4QYjWc5+SCnIamImyvzCQkQI0BCSdEyWTopjpi2sG9//TuzzCyMVk4qJ@lists.freedesktop.org
X-Received: by 2002:a05:6402:13ca:b0:60e:9e2:5844 with SMTP id
 4fb4d7f45d1cf-611ed137bffmr3157234a12.32.1752255355632; Fri, 11 Jul 2025
 10:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
In-Reply-To: <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 10:35:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wif6u3C4gk7BtR1M+0SvHruXZ7xycP5oDdg-SF1D=ELqQ@mail.gmail.com>
X-Gm-Features: Ac12FXz0Cw3UTlua4uIPZpLiT2Oslevjx3UEJS8nAOMBtacwuTkVhrNGLknGSuI
Message-ID: <CAHk-=wif6u3C4gk7BtR1M+0SvHruXZ7xycP5oDdg-SF1D=ELqQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, l.stach@pengutronix.de, 
 linux+etnaviv@armlinux.org.uk, kraxel@redhat.com, christian.gmeiner@gmail.com, 
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org, olvaffe@gmail.com, 
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
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

On Fri, 11 Jul 2025 at 08:48, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Background for others: current -git ends up having odd hangs when
> Xwayland starts for me (not at boot, but when I log in). It seems to
> be very timing-dependent, so presumably I'm just unlucky with my
> hardware.

Update for this thread as well: it looks like I'm just being unlucky,
and there are two independent problems. The drm problem *may* be just
the warning issue that has been reported by others.

I'm hoping the login time timeout / hang ends up being due to a known
netlink regression, and it just happened to look like a drm issue
because it exposes itself as a hang at the first graphical login

A netlink regression *might* fit the pattern, in that it might just
cause first login dependency issues and resulting timeouts.

After what has felt like a very smooth release cycle so far, having
what looks like two entirely independent issues strikes me as
unlikely, but hey, unlikely clearly does occasionally happen.

           Linus
