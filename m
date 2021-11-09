Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A544A54F
	for <lists+etnaviv@lfdr.de>; Tue,  9 Nov 2021 04:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5A589DF7;
	Tue,  9 Nov 2021 03:23:53 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0FD89DF7
 for <etnaviv@lists.freedesktop.org>; Tue,  9 Nov 2021 03:23:53 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 q33-20020a056830442100b0055abeab1e9aso28873707otv.7
 for <etnaviv@lists.freedesktop.org>; Mon, 08 Nov 2021 19:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DSx4vsX040ccMi/2JYYzzGkHMf0IM13AnRqZGuPKO5E=;
 b=Min5BkMDBrwGcElwRC63UI/ixrF8KP5xgntWL1M7nt7bL+XMLGW5a3OtqaMlT8cCCo
 DER7zgNdFwbPdFB6l+1GpiQqzEflkRuPgAd2Dhmi85lD8q7E3Y9hcTHy9PspSDm9F8L/
 YgHU1k0gIUsPkI4MTOpx/cGU9BN/ag78LoY4VAyVTpma0aGfcYjUXQBzz8NRYMv8ZlCh
 9IEtWEr2BPPXUp6B4rtigvhgxIsU46e9gSgGXKwuJH2rihPP2xgExNkb07i/g28mfijZ
 r9CKhfRE4Hmyd1d0Cdax6+ZSulWopt5NnPZX77oTUJy0c5wLeM7kClr11nfBYK8JA2Ak
 mVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DSx4vsX040ccMi/2JYYzzGkHMf0IM13AnRqZGuPKO5E=;
 b=q3+Vml+8fh2J9gCrXiF1stxpng9t6kuFmO3BPyiy+KdyG3Sm80QLBkG8DPSwYtF5CT
 3xsZBQdl/Oi6qeDdywqCWODXriKs/a61Qqs9ZRuRcHl0vnZWJ/eD/Uj7Pg3Qfw0LnxcP
 3Z8xXWYGMAnw2pXeAXKHAlhcqmUCxePZt17ymogvnkEMcjTirbG5mQ0snFKWucs2ScFo
 h/LARK0vJZeJeTHK2PZtyiOmvbFVx8p5wDSbbZJngz/d5IPzCqTE7GGKW5gAVQHFyE5U
 3amBF3rrO8YkNMU/Lj0F4WzV3hPDs35AkUAgX7pN2vtjp977gXx77Zvz/bSlTi86e6mk
 9+IA==
X-Gm-Message-State: AOAM533Xo9hfTI5s6rb1s97bL+NNsSDWHTk+sdmbE3KUREJ9Yd0e57L0
 ojFw0mt0W+yk2LFh1SRj8zsbiP7WiJTxmira+RA=
X-Google-Smtp-Source: ABdhPJzf5Qa0lI2sCWdrZl1JfiSkaTY7AbWLUE3CawYtul/odDbCz4mkGrkIU7pfISLr1IMWjumnhwDWyX/teE/8z+U=
X-Received: by 2002:a9d:e97:: with SMTP id 23mr3367233otj.346.1636428232172;
 Mon, 08 Nov 2021 19:23:52 -0800 (PST)
MIME-Version: 1.0
References: <CAFrQVPNPAoJQehVEjtfreCTf=A=O3q254+ecWbWD95NLw6P=bg@mail.gmail.com>
 <CAH9NwWcQSZNGNrVL7H8heQ9g4qj1PzQ36zifyG6PunbxvgEj7A@mail.gmail.com>
In-Reply-To: <CAH9NwWcQSZNGNrVL7H8heQ9g4qj1PzQ36zifyG6PunbxvgEj7A@mail.gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Mon, 8 Nov 2021 22:23:41 -0500
Message-ID: <CAFrQVPMSZjMgJQBADd25MW3jZe4sVxRdzfWuLN7s7M9egxMtqQ@mail.gmail.com>
Subject: Re: glxgears corruption on gc400lt
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007aa8e605d052a3b0"
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

--0000000000007aa8e605d052a3b0
Content-Type: text/plain; charset="UTF-8"

Thanks for the suggestion.  I updated to 5.4.158 and the initial test seems
to be positive, though I wasn't able to consistently reproduce the error
before updating.  Do you have any hints that might help me to validate the
problem I was hitting is actually related to one of the fixes in the latest
5.4 release?

On Mon, Nov 8, 2021 at 5:06 AM Christian Gmeiner <
christian.gmeiner@gmail.com> wrote:

> Hi,
>
> >
> > I'm trying to use etnadrm from xf86-video-armada and the etnaviv driver
> from the 5.4.90 kernel with Xorg 1.20.8 and mesa 20.0.2, but occasionally
> glxgears displays corrupt output.  When corruption occurs, it lasts for the
> duration of the boot cycle.  On other boots, glxgears displays fine, though
> it's very inconsistent.  The corruption is not static.  The triangular
> shapes seem to correspond to the colors of the gears, and appear to rapidly
> "dance" in the window.  Sometimes faint shadows of the gears can be
> detected behind the corrupted region.
> >
>
> Please update your kernel to the latest 5.4 kernel (5.4.158) - there
> were some MMU fixes on the kernel side.
>
> --
> greets
> --
> Christian Gmeiner, MSc
>
> https://christian-gmeiner.info/privacypolicy
>

--0000000000007aa8e605d052a3b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the suggestion.=C2=A0 I updated to 5.4.158 and =
the initial test seems to be positive, though I wasn&#39;t able to consiste=
ntly reproduce the error before updating.=C2=A0 Do you have any hints that =
might help me to validate the problem I was hitting is actually related to =
one of the fixes in the latest 5.4 release?<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 8, 2021 at 5:06 =
AM Christian Gmeiner &lt;<a href=3D"mailto:christian.gmeiner@gmail.com">chr=
istian.gmeiner@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi,<br>
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

--0000000000007aa8e605d052a3b0--
