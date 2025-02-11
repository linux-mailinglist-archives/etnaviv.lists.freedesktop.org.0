Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB4BA30F16
	for <lists+etnaviv@lfdr.de>; Tue, 11 Feb 2025 16:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A05A10E6DC;
	Tue, 11 Feb 2025 15:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a38kv9CF";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B463310E6DC
 for <etnaviv@lists.freedesktop.org>; Tue, 11 Feb 2025 15:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739286222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
 b=a38kv9CFs1Tdiv9UCWkKAoZn1GRjzub9XvQ/Htqr3Wj94oiJ00nbiGjzLajRC/1NRacxTN
 b4+bCay3YrP9wJx6zrn01Nzgc3kgdB2L5qBeNPrzF8/f7wyvRGh3Z/m/2zzHcg1CtM3usu
 7pAYd9U+E1PU9wwAo+aR3pK+7H/Kbn0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-qoQSDuaQPMaxSSEzHh73qA-1; Tue, 11 Feb 2025 10:03:41 -0500
X-MC-Unique: qoQSDuaQPMaxSSEzHh73qA-1
X-Mimecast-MFC-AGG-ID: qoQSDuaQPMaxSSEzHh73qA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43935bcec74so16084945e9.3
 for <etnaviv@lists.freedesktop.org>; Tue, 11 Feb 2025 07:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739286220; x=1739891020;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
 b=OcWH1EH1acEPL1lxTo0lqwLU4fB5kKFTM+pgl9VsIth5feEigeQ8HZvbqNGNqPGAOU
 0VUW7sJxt49jjjKCd/Ay77YSrKBosF5x1DxlA3IedXxHXBPJWaCtxX7hlA+vqrkvENTt
 omz75ZJeALZURX/OHlteAk5oMZglJlVAnw0n/tGn6/NKMNKFmONuofJxCGcsryHBkTbP
 dQ9G15DkcgOt09eG8WJxqoa41DIB8UKJ60oJkfpAzhmzfeSI9evvhoNSOQbhOplZsS5D
 iU/cPGn0+ICFjJ5DO11X0DWjckcsZWZdaRWUfqJF1Vd7aLyv7DBLeI1gmE2x88CPblb5
 IOTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVevjEnGPJD5fBNJNFj8zFRWnyJ1DGFym6FbZ8yU75Qeq4R3sKcJo7UZXgH6XGeRloUKeTnNsso@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNstukq9LPnMM2zdqwTYei30GF8G0ixbEd11fbNdZUWsAxvxcy
 wkdW78Ju3WwSIZDLeEgvNQY9wNfspD5FnrjF0DI0axuop3Vq5mckkLTn1yy4LJ/cK0fyuUTtM4Y
 G55R7mOkFeaGnCpLol6VzDUXXuqVjg2+u+PDAdiXC07PPqqqIwB0LQKabFNr6Ud8=
X-Gm-Gg: ASbGncv33QYAvRncI8gQkL211wrri6MJISNXwNe6NP7OSPA/Wc/FpGd3BxWQAEVKWo8
 JgGvIgkLzbTVk/7rmDuOJkSFYpBQau+/Uf+DWfpo5uPzuPGMc4rAPUCCBH+OMG7ZJtZdfSdz59P
 ASI3+yKdebHu4rr6rLgiYK2H+6jkqiuL8/5BWKLJ+ZYsCOzaC3lImSDnvuFJ0kVHvyUem+ETbYy
 Qp+8+OHXnH3AtMuEofyYgOeV7gd1S9tYu3zC4LBh+uVnkpivj2vMWk/lYXyVvVUTTVX1w==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id
 5b1f17b1804b1-4394c853a2dmr42857765e9.29.1739286220019; 
 Tue, 11 Feb 2025 07:03:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN7+RaFI8Q1DlET/AqPOd5Q7ETC0Cm6eLK5eh5/vnngjAmjHCWD7Z20lqQzfUQw3dEBz+m0g==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id
 5b1f17b1804b1-4394c853a2dmr42856745e9.29.1739286219388; 
 Tue, 11 Feb 2025 07:03:39 -0800 (PST)
Received: from pollux ([2a00:79c0:65c:c300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc5c8c37esm13267156f8f.2.2025.02.11.07.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 07:03:38 -0800 (PST)
Date: Tue, 11 Feb 2025 16:03:36 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Christian Gmeiner <cgmeiner@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH v4] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z6tmyHpqnpkP2gKq@pollux>
References: <20250211111422.21235-2-phasta@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250211111422.21235-2-phasta@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sUuz1wnz1Je1efpyJtY9NqN69W4fJr5xf7r8PyzbStE_1739286220
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Tue, Feb 11, 2025 at 12:14:23PM +0100, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming, addressed in:
> 
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> nouveau_sched_init()").
> 
> Introduce a new struct for the scheduler init parameters and port all
> users.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com> # for Xe
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # for Panfrost and Panthor
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com> # for Etnaviv
> Reviewed-by: Frank Binns <frank.binns@imgtec.com> # for Imagination
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> # for Sched
> Reviewed-by: Maíra Canal <mcanal@igalia.com> # for v3d

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

