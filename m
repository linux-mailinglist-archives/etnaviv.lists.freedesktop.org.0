Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEflF87wkmlA0QEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Mon, 16 Feb 2026 11:26:22 +0100
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A965A14254C
	for <lists+etnaviv@lfdr.de>; Mon, 16 Feb 2026 11:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA8E10E219;
	Mon, 16 Feb 2026 10:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HaIGUI97";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBE810E219
 for <etnaviv@lists.freedesktop.org>; Mon, 16 Feb 2026 10:26:18 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b8f86167d39so375862766b.0
 for <etnaviv@lists.freedesktop.org>; Mon, 16 Feb 2026 02:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771237577; cv=none;
 d=google.com; s=arc-20240605;
 b=LorDaxp7/JpfgwXmI8B80CwcphwsCDzfBX5K0j8qEzy4hpeIJwHChoG+02hhsUUJwe
 Lbd7r/saOT3j1lT6yx147G4x/nWx53d9vWuDunxclfYRTqPotyrnkmrTlZVAXYPIyH12
 6R9hA5CxGujj2RZlc2qKq9N+7KBQ9GU1pNa6ho4xsWQCZo48TjXBWij7IgWcryoYJqiU
 peartz9Z1p7MCSv9tBFIGWe1qUtFhfIXfBIEfIBmzr9txWovh6wmRveOXsxfNw33x/Mb
 mmkcZs8dNpur9Ildmg+0CHhVnatDj7szxF2FWONTCMi/jIB12X3yQWrp05JnuGnRp+8u
 +1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rVMUsmNMj2xMu66P1Q+qKrbz81wga8YpOKoVXQL095g=;
 fh=ZNzQhxbPgtZblrWIxA2VVnMHAJmhYAHxb2YfoNajEWc=;
 b=PbYUQlaG7W0F8TMZIKJEO/edr5i9NBBR8/SdIUtgoKKZjwyFVqNht9o4ugaI3BI78e
 sP0Pps7+3PaCKi4GZuyQ+/16UntYu347u3xzPR+tAmj50M+vU4Jwdp8I07njX27Uw6+u
 puWVvPnsL5BGyE38BHu0qmrjtEZj3kIay9K7HeuVmLsEyOJnEmyTE7OHIP4fulbvBqUo
 7/1mW5FLvkI5wSsXUKAoOgzJQEnf1zGoRoZbNv1bg8rdpyfU26fPnpNGuqWMc8K7Dq7Q
 7/RrevDZSNY+QyES8yGTsp062ZfOhDoNPaFtvut937amIzieZhEQ5w+mmg/yf8ENkyOV
 D1zg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771237577; x=1771842377; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rVMUsmNMj2xMu66P1Q+qKrbz81wga8YpOKoVXQL095g=;
 b=HaIGUI972pGJvveJM1E8fSi4kuGBWCgWbPv6DxjXWL+ogJlu2AWuPT+C+4JIgURs1g
 yT20p1gBkYnhsIUHm3/Rme7dqyfxfKwlVzZ2daZGWr5UJqToxz3HmGoghdhC63GQS4kZ
 VU+V6oMSyUetW+Ftk33UpGIVoOi972SYrxC6yMdVTO5b7h3FTX9zuTK4f28UYEZQEBWV
 AIEUEZWE3+qn5AvnrSjWk+rq3yu8ls09iCwAEfI5U05Y7N+I+K/ZKfDJoQuZAnKPGsnb
 MnbNmzn5xCzm/alzzMjrD8wKCxokmY79YKanYgKeNgMdG5AJ1bHE/LBfv5qKC+BqZz7B
 AsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771237577; x=1771842377;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rVMUsmNMj2xMu66P1Q+qKrbz81wga8YpOKoVXQL095g=;
 b=tW/0Wy05qsIhg0wqiyusIOc3FxTqzPAP6mhfe9byWN186kvBeIryEFpEE1EXxN9ou0
 FU7J5QcavA8HSAQLfA0PEmmH6VpC9EhmuRGKzTSSxnL3BOzzkQBO6xzcUMQjew/0o0C3
 ZjDVlwZh40biXLkcWSoODFZ/KvnvCsHE6TbBDpoRq2lewINltuDWMvjIHH2vcTsUI+KF
 Ln6gyY5OhwZvk5saPJ1lN1ctLfPQuNXcErHCvh9jcjKmZEqxtppbCqEU3mi65n7mV8p4
 2Jjqm4NrFrwGGDculaqfIOpbK7WzKIlAD7qUK9D61oCyeic6T3PKcyXN/ZWiVAhY1Dry
 a1MQ==
X-Gm-Message-State: AOJu0YyVgkki1sPmVRoqNqzUcyazX0fUUsVYRZbp3TF5jR+zpRua092u
 gzyw8UUCW0sJoLuQhXp155vQTnzejLpE0YBxderBjrJ80ZDP6v4w61mKRPA6qj3Ice4Nzb4wst4
 Liq3OMKlfHwQlUqfN3LRCaimhxLgU9v3hwLO/
X-Gm-Gg: AZuq6aLNJAd0OAsB7E/TXqU6L3hdzxvDU6qF1METn5WUGJWMto6byMp5fcBVjVcDOWN
 JhunajpGMZhJWO/D4v2yK2SVOlQ4hZYxDyoyxRFbCuJUw6wVEEgHtck+X0w/nhEtrjaLBeJh0uC
 aoYSfLgL0OU60A/GPA58i4RDBlqyaAty6e9QIBmbQhvzu0MIQiJ/vEGEcgxXbgXCJWNroXAc7Ew
 hueZg5h22buxfma4LzClErUQdO1iGCXJk/oTlpBJ22pjv0PPOQ5lKoYRgZfUWy4tR5G+Ml9RyW6
 m9k4bQ==
X-Received: by 2002:a17:907:86a9:b0:b87:d722:f824 with SMTP id
 a640c23a62f3a-b8fb477963cmr494457666b.63.1771237576805; Mon, 16 Feb 2026
 02:26:16 -0800 (PST)
MIME-Version: 1.0
References: <03653d4c-2e80-44c8-9562-84fad2ef4271@debevv.com>
 <20b6c6b9-f105-4de1-b330-2c3ce5c08ca8@debevv.com>
In-Reply-To: <20b6c6b9-f105-4de1-b330-2c3ce5c08ca8@debevv.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 16 Feb 2026 11:26:01 +0100
X-Gm-Features: AaiRm52ED08jG02Mx0Ecy5CoxH6uhQqMjeGBYxxg7T4s1ADMaj5okNhl5A46ZFk
Message-ID: <CAH9NwWeK0iT99O=J3avMRPFg-FeqxPmF-pS5a7+cCUkSpX0vRg@mail.gmail.com>
Subject: Re: LVDS display rotation
To: Valerio De Benedetto <posta@debevv.com>
Cc: etnaviv@lists.freedesktop.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:posta@debevv.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.60:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christiangmeiner@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,christian-gmeiner.info:url]
X-Rspamd-Queue-Id: A965A14254C
X-Rspamd-Action: no action

Hi

>
> our application needs a 10" LVDS display, connected to our i.MX6 board,
> to be in "portrait" mode, so rotated by 90 degrees in either direction.
> I tried booting the kernel with the 'video=1920x1200@60,rotate=90'
> argument, but looks like it is being ignored.
> Delving into the drivers/gpu/drm part of the kernel I noticed some
> drivers actually handling properties like DRM_MODE_ROTATE_90, but looks
> like etnaviv is not one of them.
>
> Am I correct in assuming that this driver does not handle the rotate=90
> parameter? If yes, can you briefly advise me on how to proceed to
> implement it?
>

etnaviv is just a render-only GPU and you need to check if your used kms driver
supports DRM_MODE_ROTATE_90.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
