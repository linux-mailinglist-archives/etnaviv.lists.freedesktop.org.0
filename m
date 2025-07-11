Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672A1B020D9
	for <lists+etnaviv@lfdr.de>; Fri, 11 Jul 2025 17:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C725510E3A1;
	Fri, 11 Jul 2025 15:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TVdJuxik";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628E110E2B1
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 15:49:00 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ae3a604b43bso376598466b.0
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 08:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752248939; x=1752853739;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=flK+SksbT18bLb3jG4ILK6UNz0qu/K2MvbsIMeVlTeI=;
 b=TVdJuxik8+52iE1O/uBRtZu0rCPjBcMFL4PONId33wHz5ixGdY6ExbH6bBpJoOhAOe
 iD5IY2TY5KFOdCGFRxdpGj692ySDWXlTPbeTOB5PI1VNtp83xGcdDtbn3TcXRAU+b6Cx
 kHoZHDyOFm+56WQerZOVQv77APh7E10YEeoWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752248939; x=1752853739;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=flK+SksbT18bLb3jG4ILK6UNz0qu/K2MvbsIMeVlTeI=;
 b=kxLOY/BqFFICSq0KMDoMgWUnOw4mI/mC+GtZhBV+iXrBVTNhr0h97RVjW7VmwPxMwk
 RrpG9XUFdiQCwwtWdJabg52f7TPtzs1r0FYfrLJNJrkvDWzReTw3WPjUs/0QOLTMfPcX
 ZEMkbVFq+aNs7cIMHfPP83gxluPL1ekqKlDocxjIeK9iLgkuI054zhM+/DI0vh70JqFP
 F4biOmC3D9ajXt9y2a/wFkWLqnvkZZMPDJKtOvJ5nJYvv3o6vlN8t1K80Pl2cv3O3lBX
 1WOSZ45cD2rbI7BA5vZPgrIQuB9qRjpw8ZHFHhss+tP5dZuqMKVT8NHyqp5cHiq/SDTn
 5eUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2oQBG4Fo1g//mjm2e2dwgky6r6P3vfRtAiqj2vCghK6/uSKCUviJRZwf3svX4dZfvVRUWy/ip@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyncIXI8pndHNIONPTrc1c/QiAeq4U4ECy2D6pMAQHbD4UQPApu
 U4hTGbvC700+5flzW2VnQ4MsLKlo9l+GA0PFJiHVZO0OMLljlWB+Jcp9ThWyTFMAW5T5p3mg6EA
 NcqFGFGQyyw==
X-Gm-Gg: ASbGncseUo7wRP4hCWJ7wDCgvBzJZvDWBTwky7vZOyjyWDoO/GGgrOyg31jPnu2jLfP
 V9RA+f7fmFr3EOlmj6O/V2W4feD56HGkXTYHNmuYce6zbvNr/+tVO8mq+eTCvml8/I9JMfzu0Vf
 +ekfe5buRJqRTr/7/a1AV0Ksv/Dmh+KIJxyh4xAFf3WL0EIcZFUgzOylxZ9nUCl9S84avEqdDIr
 H/Vr/pmsluoib00b2GMA2xoaC0oQQqhMRJQapCPWU6tjX5TDINdG1CfKeBVPeHQmktZ1cLLBxG6
 /QQU4Dv3lhAsHnorKrq6tOqlbvfUYo4dbYcRIgyoNOK3/tddFGGfjz+gosQMwgHzCbxOIaSelp7
 N6XxJVfkWuA6SevMRmDDCvEATiYyiXUYLQRFpi5aWiAW667tomenT3yRbegVjtYPOq0Hs8h31
X-Google-Smtp-Source: AGHT+IG5qXPt5otOkGCp4aleg9mXgE00Cf59UhAZLNNZpedpUe34EIueFBC7WkI6fqwaE3WwGW8JEQ==
X-Received: by 2002:a17:907:7e5b:b0:ae6:e688:3269 with SMTP id
 a640c23a62f3a-ae6fc0aa9d6mr398361666b.42.1752248938533; 
 Fri, 11 Jul 2025 08:48:58 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82e518bsm318083666b.149.2025.07.11.08.48.56
 for <etnaviv@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 08:48:58 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so3835979a12.2
 for <etnaviv@lists.freedesktop.org>; Fri, 11 Jul 2025 08:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPUlscbIT+Gqh35wW6kMZDDxRD6vEyFzQlzC/ZvIcfZY471KOUQUZKDh5naCvumvhJdjq2pwrj@lists.freedesktop.org
X-Received: by 2002:a05:6402:2345:b0:606:df70:7a9f with SMTP id
 4fb4d7f45d1cf-611e84881c0mr3248744a12.19.1752248936308; Fri, 11 Jul 2025
 08:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250711093744.120962-1-tzimmermann@suse.de>
In-Reply-To: <20250711093744.120962-1-tzimmermann@suse.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 08:48:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
X-Gm-Features: Ac12FXxfNX9iFY-MTPcFF9E1sp2PSMV-QdcnP7if0RVZKfq1TRX51YyGvLKD3nY
Message-ID: <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
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

On Fri, 11 Jul 2025 at 02:40, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Reverting the whole thing is the only sensible action here.

I'm assuming this is against some current drm tree, not mine, because
it doesn't apply here.

I'll try the smaller set of reverts that Simona suggested for my
testing, and will get back to you on that.

Background for others: current -git ends up having odd hangs when
Xwayland starts for me (not at boot, but when I log in). It seems to
be very timing-dependent, so presumably I'm just unlucky with my
hardware.

The timing-dependence has made my attempts to bisect it very
frustrating and non-conclusive, but reverting 5307dce878d4 ("drm/gem:
Acquire references on GEM handles for framebuffers") made things work
_better_, to the point where I thought it was fixed.

Until the hang came back.

The "hang" is not some kind of kernel hang, it seems to be user-space
getting confused by the changes. Because I can still switch back to a
text VT, and there are no messages in the kernel logs. And the system
"recovers", in that after a 30-second timeout (it feels like a minute,
but logs seem to imply it really is just half a minute), I get

   gnome-session-manager@gnome.service: start operation timed out. Terminating.
   gnome-session-manager@gnome.service: Failed with result 'timeout'.

and it restarts, and things work fine on the second try. Except when
they don't - on one reboot it went through this twice, and

Now, because it's obviously timing-sensitive, it might be something
entirely different going on and I have no guarantees, but it does seem
to be related to that commit 5307dce878d4.

And I only see this on one of my machines. Again, might be timing, but
might also be that it only shows up on certain hardware (in my case:
Radeon RX 580).

           Linus
