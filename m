Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D4744A5B6
	for <lists+etnaviv@lfdr.de>; Tue,  9 Nov 2021 05:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1692A6E255;
	Tue,  9 Nov 2021 04:14:55 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15AB6E255
 for <etnaviv@lists.freedesktop.org>; Tue,  9 Nov 2021 04:14:53 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 o15-20020a9d410f000000b0055c942cc7a0so6316860ote.8
 for <etnaviv@lists.freedesktop.org>; Mon, 08 Nov 2021 20:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xVDYXuSIF9SKGthDgtET2sLyBzWpsXHZ1Ioc/bN+7fs=;
 b=Vkg1J3DYilHlXWLwWNHRj55u91MwQieXD2HPiUuC91/r45cyDrjS2VUBWil4MvuTu2
 PxEOlV3r7pxEXwQtX/xJpXCRa23ySFYK9Tl9j4UsUBfvE3dSBV67q7stPneIuD/7Vcm+
 v+kI+13+LI8X1RT7rDPl+oAOZEQ+VQviTk4cXfO9rZerxzGXaXAZNgjMUEPdAWLdK/XX
 wtfuajAb+dhLDyS1r32H9CdpaJ7nV/eDC/2ZB72lYscr+lrbaNBfgVPySc/1uvZDZTSf
 0nyuLOmXemfpKBbnfvkwrzkHNvE3lEZgVRJWWScKI6ttFrhoSQEe9vPgLUco9WKqJtAd
 xaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xVDYXuSIF9SKGthDgtET2sLyBzWpsXHZ1Ioc/bN+7fs=;
 b=b+z3XcqrL0/Y1vOG2BwFekUXpjSU1ntmhMSOc/AfAvFIHF4Ij0tzUcgXD/yJBg+22d
 uddHxYGSVgov31vD8SNwhUQHFPFZBZCQV8/qAltkdwC1rCUyyRGjj6JsukvpjoLk9PRv
 eP6JijTvYQPFV2PHrM5v1cxzClS/3FU17/T/cGl5XKeKK4X7kUu9C6YRh3NnRJb7p/Z6
 FJAVC+j4eRQmWdkLdMVcm3t/cCjKMQHpHuiFq+ZqZ1NygccW3rykmbHpWoD0T/xKgoRn
 V4P3784XXl8SUEXZY5VO/XgBbFfsxm8nS6BR4S2qS5Vs+OXg1yx9PxgXxRmZ3p8tBDQe
 x69w==
X-Gm-Message-State: AOAM531kmB7dSUp2VZauzQPNc8QzID5BKrMyCvd2qFfnQlj4WFATiif5
 IrMD1I5ng7b6Fcg9gBBYHmUaXOcxVYmxcI4aPiE2HUXEVLI=
X-Google-Smtp-Source: ABdhPJzaFEhlcpcHVfYfDPAXEW7IxTZy5ghs43LeheklTa7vl83KsIJiuLlZI7RA5LTtIi84f99KncGVcTRQDJudyL4=
X-Received: by 2002:a05:6830:8:: with SMTP id c8mr1937529otp.115.1636431292854; 
 Mon, 08 Nov 2021 20:14:52 -0800 (PST)
MIME-Version: 1.0
References: <CAFrQVPNPAoJQehVEjtfreCTf=A=O3q254+ecWbWD95NLw6P=bg@mail.gmail.com>
 <CAH9NwWcQSZNGNrVL7H8heQ9g4qj1PzQ36zifyG6PunbxvgEj7A@mail.gmail.com>
 <CAFrQVPMSZjMgJQBADd25MW3jZe4sVxRdzfWuLN7s7M9egxMtqQ@mail.gmail.com>
In-Reply-To: <CAFrQVPMSZjMgJQBADd25MW3jZe4sVxRdzfWuLN7s7M9egxMtqQ@mail.gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Mon, 8 Nov 2021 23:14:41 -0500
Message-ID: <CAFrQVPNRViTOqFNz5ckDv9yfq+rvOu21-hnGyfM-dYNzAL4YXQ@mail.gmail.com>
Subject: Re: glxgears corruption on gc400lt
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e8f74f05d053596a"
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

--000000000000e8f74f05d053596a
Content-Type: text/plain; charset="UTF-8"

I ended up reproducing the corruption on a subsequent boot of 5.4.158.  I
captured a poor recording over VNC; it animates much faster on the actual
panel.

https://imgur.com/a/JYaOT7v

When corrupted, glxgears reports a very low fps.  FPS was much higher (near
100fps) when displaying correctly.

77 frames in 5.0 seconds = 15.340 FPS
75 frames in 5.0 seconds = 14.947 FPS
75 frames in 5.0 seconds = 14.999 FPS
76 frames in 5.0 seconds = 15.058 FPS

I'll be happy to capture more useful debug, but I'm not quite sure what's
most relevant at this point.

On Mon, Nov 8, 2021 at 10:23 PM Kyle Russell <bkylerussell@gmail.com> wrote:

> Thanks for the suggestion.  I updated to 5.4.158 and the initial test
> seems to be positive, though I wasn't able to consistently reproduce the
> error before updating.  Do you have any hints that might help me to
> validate the problem I was hitting is actually related to one of the fixes
> in the latest 5.4 release?
>
> On Mon, Nov 8, 2021 at 5:06 AM Christian Gmeiner <
> christian.gmeiner@gmail.com> wrote:
>
>> Hi,
>>
>> >
>> > I'm trying to use etnadrm from xf86-video-armada and the etnaviv driver
>> from the 5.4.90 kernel with Xorg 1.20.8 and mesa 20.0.2, but occasionally
>> glxgears displays corrupt output.  When corruption occurs, it lasts for the
>> duration of the boot cycle.  On other boots, glxgears displays fine, though
>> it's very inconsistent.  The corruption is not static.  The triangular
>> shapes seem to correspond to the colors of the gears, and appear to rapidly
>> "dance" in the window.  Sometimes faint shadows of the gears can be
>> detected behind the corrupted region.
>> >
>>
>> Please update your kernel to the latest 5.4 kernel (5.4.158) - there
>> were some MMU fixes on the kernel side.
>>
>> --
>> greets
>> --
>> Christian Gmeiner, MSc
>>
>> https://christian-gmeiner.info/privacypolicy
>>
>

--000000000000e8f74f05d053596a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I ended up reproducing the corruption on a subsequent=
 boot of 5.4.158.=C2=A0 I captured a poor recording over VNC; it animates m=
uch faster on the actual panel.<br></div><div><br></div><div><a href=3D"htt=
ps://imgur.com/a/JYaOT7v">https://imgur.com/a/JYaOT7v</a></div><div><br></d=
iv><div>When corrupted, glxgears reports a very low fps.=C2=A0 FPS was much=
 higher (near 100fps) when displaying correctly.<br></div><div><br></div><d=
iv>77 frames in 5.0 seconds =3D 15.340 FPS<br>75 frames in 5.0 seconds =3D =
14.947 FPS<br>75 frames in 5.0 seconds =3D 14.999 FPS<br>76 frames in 5.0 s=
econds =3D 15.058 FPS<br></div><div><br></div><div>I&#39;ll be happy to cap=
ture more useful debug, but I&#39;m not quite sure what&#39;s most relevant=
 at this point.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Nov 8, 2021 at 10:23 PM Kyle Russell &lt;<=
a href=3D"mailto:bkylerussell@gmail.com">bkylerussell@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr">Thanks for the suggestion.=C2=A0 I updated to 5.4.158 and the initial =
test seems to be positive, though I wasn&#39;t able to consistently reprodu=
ce the error before updating.=C2=A0 Do you have any hints that might help m=
e to validate the problem I was hitting is actually related to one of the f=
ixes in the latest 5.4 release?<br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 8, 2021 at 5:06 AM Christian=
 Gmeiner &lt;<a href=3D"mailto:christian.gmeiner@gmail.com" target=3D"_blan=
k">christian.gmeiner@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi,<br>
<br>
&gt;<br>
&gt; I&#39;m trying to use etnadrm from xf86-video-armada and the etnaviv d=
river from the 5.4.90 kernel with Xorg 1.20.8 and mesa 20.0.2, but occasion=
ally glxgears displays corrupt output.=C2=A0 When corruption occurs, it las=
ts for the duration of the boot cycle.=C2=A0 On other boots, glxgears displ=
ays fine, though it&#39;s very inconsistent.=C2=A0 The corruption is not st=
atic.=C2=A0 The triangular shapes seem to correspond to the colors of the g=
ears, and appear to rapidly &quot;dance&quot; in the window.=C2=A0 Sometime=
s faint shadows of the gears can be detected behind the corrupted region.<b=
r>
&gt;<br>
<br>
Please update your kernel to the latest 5.4 kernel (5.4.158) - there<br>
were some MMU fixes on the kernel side.<br>
<br>
-- <br>
greets<br>
--<br>
Christian Gmeiner, MSc<br>
<br>
<a href=3D"https://christian-gmeiner.info/privacypolicy" rel=3D"noreferrer"=
 target=3D"_blank">https://christian-gmeiner.info/privacypolicy</a><br>
</blockquote></div>
</blockquote></div>

--000000000000e8f74f05d053596a--
