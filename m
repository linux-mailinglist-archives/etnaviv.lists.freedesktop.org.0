Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CnO/Om75T2p7rQIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 21:41:34 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F917351A8
	for <lists+etnaviv@lfdr.de>; Thu, 09 Jul 2026 21:41:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ATfLuWkD;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23BA10F691;
	Thu,  9 Jul 2026 19:41:32 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D89110E3EC
 for <etnaviv@lists.freedesktop.org>; Thu,  9 Jul 2026 19:41:31 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-38511175ad3so257655a91.2
 for <etnaviv@lists.freedesktop.org>; Thu, 09 Jul 2026 12:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783626091; cv=none;
 d=google.com; s=arc-20260327;
 b=bhGZuLQE8AnA4zoOtQt42NuZqawUUiNSMItxDBpwn/CMAp1WIoYVS68Q1XhBVxaz2l
 bT0adEBtqYr9lteQPUBSjh5XkQ8Us7e6Aj9J6+9PS86p4zQ7J8nayJXua+5ybXRVhd5k
 m4v2h2huphlpYld6p7zg9msRXHFs1kKYklUZWSk13S8YttACAkIUk53YjSc/hbEDaRNA
 dGR8MCLCGkun9VxEOMnwnGWcAqpV3nQPegNVAN7hvoyymm3rgeM7lcytynIjimIQB7ew
 kz1FHg86Hiq4VZzfdShE6q3IUazSKh+/eVSoxJnZ061ylUdwiywAYDqt39FLFlw8NSov
 SonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zHfbWvceYtNCdDOquHNIwQRMo++yUsptvvWFceb+UlQ=;
 fh=RljxSqptbgwQzlbanXdsm+pV9ootq2W+FZLeqzGc8KM=;
 b=eCaig0lSTu6NCumtDQcDd/kYUtjOwyUzugRwPBYpoPsxapj+RRe8qq0XzCo2kb+lcd
 PLDDZ/BK9QKAuLK8RWxcq7jqORNde3onN81Cuoo20uMr4B0nr5aJ7pyYF1mnTDmM842w
 +Zqh5OJDphVlyLjMOQDRIXNbnJ0Fud32O4WSbcPFW7nkhzugI12GV8kdt2b4EgkiIkcn
 q6pM8rJs4mO+pleXAXnMekmxhnHM4tSWPx4afpM5fjZHk2T6ceKkiDgjFUXEEBCkYe9p
 seHDsd/14xd0uYkVfL9tvXK/MlMrL+kbhGhm7sG3QiDUZ0mUGfMuj85aVqbswyebUhI/
 MZTw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783626091; x=1784230891; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zHfbWvceYtNCdDOquHNIwQRMo++yUsptvvWFceb+UlQ=;
 b=ATfLuWkDjZ8BB//UAVVK3hLXTyBt+TsVOoT5UQUAkq1QxcFzmdRH9k4t7rbzXXjCHb
 BprEOH2lnTtyERxW0p9bXwbO9BlFcSvWf8Hi/Z7QNuRVRU9KyL0EUlXHKsI7P+Hxdqag
 +ergJcYK2N+aJOB1p8wZMRVt6Gwy4KUob24RqXx5i8wPEW4QHmiA8Yhbqo0q67bVGTAm
 +bLGYIzd7B1L6cpLV/HWESvH3/z9zuewCBiV+XJinBdxxY+daaDZna1OO1Nlq3FeAOTb
 s5+8pyptXHxCCjGg8sHGM3nKxmaGJ15Os+zEheWeyh92Ikp/1wxIb9HLlfV6ldC7CoPo
 ieQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783626091; x=1784230891;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zHfbWvceYtNCdDOquHNIwQRMo++yUsptvvWFceb+UlQ=;
 b=KeXyQXuYSAda+KZ4AGXmID0cv7Dpfb5cn8pTV1IQAlgxf87yBf9wNlIfH21EpqlSMI
 5JWB9XejZVat2rnfVVTuHP+qvAFMnQICvjvix0eKOaTJwOSknKIID3UUY9qFdwwtqLFi
 UAmep7tecTJHRAsXMvSSStqrMXMHHAkK9YKX14ZXXNTDTjwowT/7Daxx1SxXx5a0uOO9
 aSY7PCv+jLuDMHWj+HO0Js3iNGlh+MXBGDc/CxtlDNMvzOzkwwNasYcp3UedZDW3tpU3
 2ViUY9nvswRHJZj9YIOVfPiEVhc7vjUpVrZnPutWlB+P1BRT6eEyI5+n2ZDZKjiwLl3J
 Vkvg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoEnsITspCf2DIDZ0SpIs0ysO9nQlsXMNIvOW+gJTwbTRnwct0dquCkr6GXbFGnXtNRxVX1Wxkw@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yykt4rdZoXbx04iFoWn/aH1tii/SKfywRbeF9x+in+/6YcYuzbI
 vOjrkBPi5m+a4BxZvEvKaHdTkmwi1pGVJO+yP0IH4lWTVVQdXm8RIwiNWBsA8OFIo/bt76TRJvK
 ZuA8Gn6fw8/s2qtS6rvE9R5cXTx+ssS0=
X-Gm-Gg: AfdE7clWcR+SggC+3zt7jvaIr3HJDdfw9Agx2ZEP5BjaBFxEUZouQZ3qY8CQAJVsUlY
 aml+MvNe1S6neWajxQI+JWIvmi2X04J0W3LGMOuMwviqCPJz95mIOSd+BItnUT46hsJme8mzpH3
 64zoEfG3flRbQAYxlNdO2B2Pq4/EnrBoesIlw+DWB3qlNe8iP0LRoT2SfUCjl2lcVQ/PHVujUA2
 wT7KlLd2urzwqzOKfveKBnrs4BN1xFxQwYB32WzDMVzMJh5ROEzJhEIAaf4afL+vNrh8sRNlda5
 g10uzzWQGIfIUfWChFGSzWzgkH8=
X-Received: by 2002:a17:90b:1cc6:b0:381:a766:efcb with SMTP id
 98e67ed59e1d1-3893f694da8mr9270487a91.4.1783626090656; Thu, 09 Jul 2026
 12:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260709-etnaviv-reset-notification-v1-0-64c617496958@igalia.com>
 <20260709-etnaviv-reset-notification-v1-2-64c617496958@igalia.com>
 <bb5b8c8ff15f8d8b9ad9a61e4887c14b9f77f3d6.camel@pengutronix.de>
In-Reply-To: <bb5b8c8ff15f8d8b9ad9a61e4887c14b9f77f3d6.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 9 Jul 2026 21:41:18 +0200
X-Gm-Features: AVVi8CeFeKNUemL2fppBxdxfNYVr5yohb1CGwVI71F0h_5DHOML4Od8oL69mxy0
Message-ID: <CAH9NwWe9gDjg-6_e1KHdUQ8_Pi2sjhfDizZGzWavQAnnuymQ2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/etnaviv: Add GPU reset counters
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, Christian Gmeiner <cgmeiner@igalia.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel-dev@igalia.com,m:cgmeiner@igalia.com,m:linux@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,igalia.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37F917351A8

Hi Lucas,

> > The OpenGL and Vulkan robustness extensions let an application detect a
> > GPU reset and check if its own context caused it, so the application can
> > drop the broken context and build a new one. The kernel knows both
> > facts, but etnaviv has no way to report them to userspace.
> >
> > Add two counters and expose them through GET_PARAM: a per-GPU counter
> > that counts every reset of that GPU, and a per-context counter that only
> > counts the resets this context was guilty of. Userspace compares the
> > counters with saved values: if the context counter moved the context was
> > guilty, if only the GPU counter moved the context was an innocent
> > victim.
>
> I don't really agree with the design of exposing this through
> GET_PARAM.
>
>
> First it assumes that each etnaviv_file_private can only have a single
> context, something that is true today but which I would very much like
> to change to rid of false dependencies when the application uses
> multiple GL contexts through the same screen. I have a rework to do
> this in the pipe, which I didn't get around to finish, yet. While I
> don't want to block any of your work on this rework, I also wouldn't
> like to see UAPI land which bakes in the single context per file
> private assumption.
>

Makes sense. I only picked it because msm and v3d expose their fault
counters that way.

For v2 I have replaced the two params with a dedicated ioctl:

struct drm_etnaviv_reset_query {
    __u32 pipe;            /* in */
    __u32 flags;            /* in, must be 0 */
    __u64 global_reset_counter;    /* out */
    __u64 context_reset_counter;    /* out */
};

flags must be zero for now and is rejected with EINVAL otherwise, so
your multi context rework can later add a flag plus a context field to
query a specific context.

>
> Second, with this design each userspace query incurs two roundtrips
> into the kernel, as userspace needs to know both counter values to tell
> innocent vs guilty resets apart.
>
> My vote would be on adding a new ioctl to query both reset counters at
> the same time, with a flags argument baked in, so it can be extended
> once I manage to finish the multi context rework.
>

One thing to note: the global counter is per GPU core, so a context
that uses more than one pipe still needs one query per pipe. I think
that is fine for the robustness use case, but tell me if you would
rather have a variant that returns all pipes at once.

Will send v2 shortly.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
