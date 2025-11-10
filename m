Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F48C45E26
	for <lists+etnaviv@lfdr.de>; Mon, 10 Nov 2025 11:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B9610E2BB;
	Mon, 10 Nov 2025 10:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dlR+zjJR";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6DC10E37D
 for <etnaviv@lists.freedesktop.org>; Mon, 10 Nov 2025 10:19:36 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-340bcc92c7dso2575077a91.0
 for <etnaviv@lists.freedesktop.org>; Mon, 10 Nov 2025 02:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762769976; x=1763374776; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yDQh21I8pfRFsWyA5TVG2w4NYmxs0m9OhA+AJqfjSr8=;
 b=dlR+zjJR1GVBRrV0fq96ziGAwyUr1kltZjaaCeGVKS8e/7ZcRtXrzKqkcyinmg5KrO
 0Q1ROPCynxxw7hJgUtqMKMhl3FuDmy+BvjpaQrmmyDuyx8YOIHqqvF32BhMa5enqOLoz
 oaJe/kY3d+7YR3TbY4zXnTnD2paLAHfm+X009TmuKZCOhGNHQGRXbZYzxH6tIprcu6ju
 SgRBc64WI4/bkXhfVPu8n7ANGX6/8z0ppWAYjVaBYRP92AbeDtxb2UAtVPMMsMObj7Nd
 ykCCGt4O6kIiwLxMZS1cOrdRGhE6TbII0DMHndFJHiPf5+A6iaq5iuo/eP3kWB2+zf0T
 YmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762769976; x=1763374776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDQh21I8pfRFsWyA5TVG2w4NYmxs0m9OhA+AJqfjSr8=;
 b=w20kiTRvvhpe9dC2Z89cojhUeREVUlfZRAW2NJo2ukJoHMVpi+2FOfREYu+8rBhOcF
 KZoZAMesFOoym0MGM9DFq9PiVCfsBzGcrLNv49z6R54D/7/s3fSF4xITPBlnHJHdGqqk
 vO/Ky8mkv4a681vaRseaeLvUcz534qCtr0qFMKyHC/3tY70ACs9InWFtP95pIfb2xtIA
 rrBmSkt6yveawU226iJs9zFzHZ5jzN1djN8uqI3TczD5L+vCnNR09xG1Gyegyj3j4lwM
 aseOwSRaDME11v2i/VEroJvJqyjY1v6KNajRmr2mg4m+oDZQ9NiepgGOXar/Knp6nCHX
 /2lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGKR/vSztXygziFzmpxXpi7vVocVRfP7LeXHfY2UGXUZ+kvuhNTfs9O+zhkKBjyj9ebF/ahEBs@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAtaH61ONpdixnAUzIcWk9+l/lu0x777/F3mCzlswM8uCfu0cB
 nuIa26G8U+xp3u8ei79GnxWTZ0g3vCbDGbhNzjZ6CUc1A+tvrNx1lG9ESxIA9naBsx7O5Q1tHU1
 6hQB+bdrYE2v0f/hUFh9g3xizuCo3dRE=
X-Gm-Gg: ASbGncuqpuQMMqtFtC+aePVnmKouX6yDEWpFZW28umSGWHOIlH2aPaestZOZV+IBWlf
 OQptvGJwiRuP7FuYXlWUYcqF+yLJvcoxZBmw0Oc2345YfX+pePI8gMfnkxxHh5v9n93CG/LNQPe
 ZZK8ZVseBzeTpenKrr6to3VCwG5/HUfngJmy+DJ5c0mXSsxNBoY5YeNkq8p8hHvVCnbHkZH8cM+
 cJTeHT+jFFEdKwX01emr7iN/M99PlWdr2O5bCSQFaVJpH5wv8sXBWcPthOP6E4NniJ+7A==
X-Google-Smtp-Source: AGHT+IEicVHN1JOVxyZ73+mOpnz6YQ9CIKlxqjCHu2vhYFYCEzj9QAY4+GZrrhDmAMc5rN34bFd/3lyZ8ZC/X/x/1To=
X-Received: by 2002:a17:90b:388a:b0:343:7410:5b66 with SMTP id
 98e67ed59e1d1-34374105d13mr8548903a91.11.1762769976104; Mon, 10 Nov 2025
 02:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20251013170122.1145387-2-rs@ti.com>
In-Reply-To: <20251013170122.1145387-2-rs@ti.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 10 Nov 2025 11:19:24 +0100
X-Gm-Features: AWmQ_bmZZAUOP_2a4TeErXBt5kS1SvniQLKb8_Boxi7nLRyUZCGuXMG7WKc27qM
Message-ID: <CAH9NwWcK8KPPeLvffRLwV_KF_W+gbQ8JctnYL9Gop+X7LWgMpQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: force flush on power register ops
To: rs@ti.com
Cc: l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk, 
 etnaviv@lists.freedesktop.org, detheridge@ti.com, u-kumar1@ti.com
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

>
> From: Randolph Sapp <rs@ti.com>
>
> Add gpu_write_power_sync to verify that power register modifications
> have reached the endpoint device in sequence specific sections that do
> not validate device state.
>
> These sequence specific areas have been detected experimentally with an
> am57xx-evm through numerous boot and module load+unload cycles.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
