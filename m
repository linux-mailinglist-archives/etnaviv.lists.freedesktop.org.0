Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ADC82487E
	for <lists+etnaviv@lfdr.de>; Thu,  4 Jan 2024 20:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D199910E527;
	Thu,  4 Jan 2024 19:00:49 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4828C10E541
 for <etnaviv@lists.freedesktop.org>; Thu,  4 Jan 2024 19:00:49 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-204235d0913so457495fac.1
 for <etnaviv@lists.freedesktop.org>; Thu, 04 Jan 2024 11:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704394848; x=1704999648; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3J6pm8ToTAU8tLPlepkXfUVX4zAX4Ty0atRRFPTABlI=;
 b=D+HJnrB8DatJFp7Co5+Gv5OrDXsuPgLEZWUiJYCoS8w1OvMjI8klgJ992YytawZjRx
 L3S9CshDg9OZXNsT3uO69xFTgo0fh5gL32mPl6wExZoZE5elmWpwtHwLjmAGjxrjEfaG
 La2Ts7fv01mvcZRk5fzT/kAkESCxMku9z7wtfEtmlnyQsfeHGWgBKmiCGiPmkvsZVwhD
 6CSrcpfdZLSfwYQ9vRGSUZbbqhD9dptNJoSz5GBSTAFjoyCAbfESIR4Ej6ZHyLgSclSy
 j3PXH+JXIYCrb0EG2KAGyMNrX30sIKTBR8/ZdGh/xo2vYS4oENf5HAvnnxcU4ruLnW+T
 IaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704394848; x=1704999648;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3J6pm8ToTAU8tLPlepkXfUVX4zAX4Ty0atRRFPTABlI=;
 b=u6CEkhm+zwQtgHENsPmctxQDN+ous4LIoodc6KYVepX9zmeP5Huk5oOeY0MKTKFP0b
 KoHkjEY2RtII9cyZMqpNi3Z4sZFyFnSpQRqcZZJ7gR9mM/lq7G6CGQ04PCdibj3M5ta3
 Ui40muYamxunHrfdS9zuyOM2wi6lQSetEr73jdRYYx7aFu82HiJRKfQF4zm8u4eUTOIi
 932oO8KPron16GTMevFgA0J/3WMFEpaMoYkZn3+yV4a0IMMU+37BQay+owslpzgLtblp
 F01UtO/ky2BqCHONTDIc8XJ6wC9+vma+u8VuwhNM4GxIkeJkeIcyXiXDu7ZwpYq5Wo7j
 /1dQ==
X-Gm-Message-State: AOJu0Yy6RkaMeES/+nsB7X843G2g+ritpTw+LrXNC8csuqTEeRbFqseT
 cuHKW5uGJQjT598hP7piyk6V+fQtlElvUgP1yc8=
X-Google-Smtp-Source: AGHT+IEH0Nz4WqS89oeCXOZXqnhqordtjlv6/U9bt4R21OzWMSs7ZAPNGEsgVz+sruog8yE8o7G+RvwPcpf9EEkV/9s=
X-Received: by 2002:a05:6870:812:b0:204:aeb:3d33 with SMTP id
 fw18-20020a056870081200b002040aeb3d33mr1156354oab.40.1704394848345; Thu, 04
 Jan 2024 11:00:48 -0800 (PST)
MIME-Version: 1.0
References: <SA1PR17MB5652020301F51E278E9C9175D467A@SA1PR17MB5652.namprd17.prod.outlook.com>
In-Reply-To: <SA1PR17MB5652020301F51E278E9C9175D467A@SA1PR17MB5652.namprd17.prod.outlook.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 4 Jan 2024 20:00:36 +0100
Message-ID: <CAH9NwWdOcw+PF-qhZkHKhMDq2OQ=5oY1N=ibc3eX_VxX9U+Wgg@mail.gmail.com>
Subject: Re: etnaviv : IMX6 Solo GPU Performance Issue With OpenGL ES-CM 1.1
To: "Motghare, Vishnu" <VishnuMotghare@eaton.com>
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
Cc: "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Vishnu

> We have an IMX6 solo custom device running with WinCE7 & Linux on it
>
> We have developed a custom benchmark application using OpenGL ES-CM 1.1
>

Is it possible to share this test application?

> When I ran the benchmark application on WinCE7 the performance looked good but with similar application on Linux gives 50 % reduction in performance.
>
> Following is our configuration
>
> Linux             - Mainline 5.15
> GPU driver  -  Etnaviv
> X Driver      -   xf86-video-armada
> OpenGL      -   OpenGL ES-CM 1.1
>
> WinCE Result:
>
> EGL version : 1.4
> GL vendor   : Vivante Corporation
> GL renderer : Vivante GC880
> GL version  : OpenGL ES-CM 1.1 Mesa 22.0.3
>
> run scene 'Floating Frame3D VBO'
> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS = 48.075005
> ---
>
> run scene 'Floating Frame3D'
> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS = 31.975005
> ---
>
> run scene 'Frame 3D Fixed'
> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS = 31.505484
> ---
>
> run scene 'Floating graph'
> Average FPS = 238.403093
> ---
>
> run scene 'Fixed graph'
> Average FPS = 238.187271
>
>
> Linux result:
>
> EGL version : 1.4
> GL vendor   : etnaviv
> GL renderer : Vivante GC880 rev 5106
> GL version  : OpenGL ES-CM 1.1 Mesa 22.0.3
>
> run scene 'Floating Frame3D VBO'
> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS = 26.872623
> ---
>
> run scene 'Floating Frame3D'
> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS = 24.373300
> ---
>
> run scene 'Frame 3D Fixed'
> initialize, DATA_SIZE:11264, No of Frames:512 Average FPS = 23.783205
> ---
>
> run scene 'Floating graph'
> Average FPS = 136.624447
> ---
>
> run scene 'Fixed graph'
> Average FPS = 136.510016
>
> glmark2 which uses opengl 2.2 gives 80 % score. Can it be issue with OpenGl 1.1 ? Or X driver?
>
> At the moment not able to figure out where is the problem.  Any help is appreciable.
>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
