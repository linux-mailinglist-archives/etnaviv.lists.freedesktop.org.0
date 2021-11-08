Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB8D4478A2
	for <lists+etnaviv@lfdr.de>; Mon,  8 Nov 2021 03:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7285F6E077;
	Mon,  8 Nov 2021 02:38:47 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAF66E077
 for <etnaviv@lists.freedesktop.org>; Mon,  8 Nov 2021 02:38:46 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 h12-20020a056830034c00b0055c8458126fso4421183ote.0
 for <etnaviv@lists.freedesktop.org>; Sun, 07 Nov 2021 18:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=a8HVZSIrkDaJOnTiW93XPC7dt2xQ9ENgJMp8oEvBQ30=;
 b=KNEPPzdxNbw/6L9J+r1nUczoCpNPUtgmJs1VZTAp5BgOgSkiYgOAP8fjkNK8PATR9n
 PFRM7wv5Jatp221MHqG6mXFhZ7B8d1R4hnFCXJZtxvKgb2Y0CzY7+sUfsnyeSmdc0Jy2
 nN2lvutGW/5YXLuUKpAWqo6P9bPhkpdN+2apr7EV7W7fFKy4m+X81Rha8Z5VZazzcZy/
 si+hEcOOOCb706SI4JDP0fINiyDOLkYoZLgWhf3OLuKjCBwiXwcpK9ELyIeK+7mLF6D+
 MI/2Vx0dD3jdDrB+sNfa+gR3ox6VEvWCRxUkbFcbKXY0+DLKvn1ThNmIS2/vRscyf4pf
 dVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=a8HVZSIrkDaJOnTiW93XPC7dt2xQ9ENgJMp8oEvBQ30=;
 b=tsAYrh/I9u/yrO/LbMmTqt2uzwR9kJbEQQ/cDU0/IX0vNbZTZkcmySfBcF4eeZOrR6
 4WjRAUmbCX9vTAG1Y2ryeSKJf7balpXgUyUitRxClqG/vhvXruX+b5EOMBG4cuipmLJJ
 f/8BuXX3Ekv6gTHPxzg8411CZMvBZjUb+FQ0fXrnZ8Q0A5qsDUuT4MGZn9ZiaXOmB+dj
 yG5VzlgarK1nvo+WPr5vYWj276n5jNO3F1v0AqskMBqc8L8YiWbEwPMD2Toia5gBv8qu
 O00GgcBhErO7xX/FFgRYdL+z3IoZdqOTSi/tvCrzzgjgpamoTphJhIkkOzUXAkiOshAf
 BFrA==
X-Gm-Message-State: AOAM531ebdUFjlCFk8JAb7CxlEqrUeRuMhfWXNVA2UiNzYlM5RC/EcVk
 uhJAEMWDs8N5mLy6tpbnvBxUyNFOAck3hcyxj0irUbdu8KA=
X-Google-Smtp-Source: ABdhPJxp2vs7EddeLKXDGYKB84Z61BR7B1lE/GNa2nCUXqz0Z+0Y2rocHRWdyE0QLbh7LzGpNjbHaT7FEvQTGS7t4MM=
X-Received: by 2002:a9d:e97:: with SMTP id 23mr26734038otj.346.1636339125111; 
 Sun, 07 Nov 2021 18:38:45 -0800 (PST)
MIME-Version: 1.0
From: Kyle Russell <bkylerussell@gmail.com>
Date: Sun, 7 Nov 2021 21:38:34 -0500
Message-ID: <CAFrQVPNPAoJQehVEjtfreCTf=A=O3q254+ecWbWD95NLw6P=bg@mail.gmail.com>
Subject: glxgears corruption on gc400lt
To: etnaviv@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000048cef205d03de43c"
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

--00000000000048cef205d03de43c
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm trying to use etnadrm from xf86-video-armada and the etnaviv driver
from the 5.4.90 kernel with Xorg 1.20.8 and mesa 20.0.2, but occasionally
glxgears displays corrupt output.  When corruption occurs, it lasts for the
duration of the boot cycle.  On other boots, glxgears displays fine, though
it's very inconsistent.  The corruption is not static.  The triangular
shapes seem to correspond to the colors of the gears, and appear to rapidly
"dance" in the window.  Sometimes faint shadows of the gears can be
detected behind the corrupted region.

We're having trouble pinpointing the cause or pattern as to when the
corruption will occur.  I wondered if there's anyone who has encountered
similar corruption with this stack who might be able to give us some
pointers.

https://imgur.com/jQIU1TJ

Thanks,

Kyle

--00000000000048cef205d03de43c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I&#39;m trying to use=
 etnadrm from xf86-video-armada and the etnaviv driver from the 5.4.90 kern=
el with Xorg 1.20.8 and mesa 20.0.2, but occasionally glxgears displays cor=
rupt output.=C2=A0 When corruption occurs, it lasts for the duration of the=
 boot cycle.=C2=A0 On other boots, glxgears displays fine, though it&#39;s =
very inconsistent.=C2=A0 The corruption is not static.=C2=A0 The triangular=
 shapes seem to correspond to the colors of the gears, and appear to rapidl=
y &quot;dance&quot; in the window.=C2=A0 Sometimes faint shadows of the gea=
rs can be detected behind the corrupted region.</div><div><br></div><div>We=
&#39;re having trouble pinpointing the cause or pattern as to when the corr=
uption will occur.=C2=A0 I wondered if there&#39;s anyone who has encounter=
ed similar corruption with this stack who might be able to give us some poi=
nters.<br></div><div><br></div><div><span style=3D"background:unset;backgro=
und-blend-mode:unset;border:unset;border-radius:unset;display:unset;float:u=
nset;clear:unset;vertical-align:unset;overflow:unset;isolation:unset;break-=
after:unset;break-before:unset;break-inside:unset;columns:unset;column-fill=
:unset;column-rule:unset;column-span:unset;opacity:unset;mix-blend-mode:uns=
et;font:unset;font-synthesis:unset;writing-mode:unset;text-orientation:unse=
t;image-orientation:unset;border-collapse:unset;empty-cells:unset;caption-s=
ide:unset;border-spacing:unset;color:unset;text-transform:unset;text-indent=
:unset;word-break:unset;text-justify:unset;text-align-last:unset;text-align=
:unset;letter-spacing:unset;word-spacing:unset;white-space:pre;text-emphasi=
s:unset;line-break:unset;text-combine-upright:unset;text-underline-position=
:unset;list-style:unset;quotes:unset;margin:unset;outline:unset;padding:uns=
et;width:unset;min-width:unset;max-width:unset;height:unset;min-height:unse=
t;max-height:unset;box-sizing:unset;object-fit:unset;object-position:unset;=
table-layout:unset;text-overflow:unset;text-decoration:unset;ime-mode:unset=
"><a href=3D"https://imgur.com/jQIU1TJ">https://imgur.com/jQIU1TJ</a></span=
></div><div><span style=3D"background:unset;background-blend-mode:unset;bor=
der:unset;border-radius:unset;display:unset;float:unset;clear:unset;vertica=
l-align:unset;overflow:unset;isolation:unset;break-after:unset;break-before=
:unset;break-inside:unset;columns:unset;column-fill:unset;column-rule:unset=
;column-span:unset;opacity:unset;mix-blend-mode:unset;font:unset;font-synth=
esis:unset;writing-mode:unset;text-orientation:unset;image-orientation:unse=
t;border-collapse:unset;empty-cells:unset;caption-side:unset;border-spacing=
:unset;color:unset;text-transform:unset;text-indent:unset;word-break:unset;=
text-justify:unset;text-align-last:unset;text-align:unset;letter-spacing:un=
set;word-spacing:unset;white-space:pre;text-emphasis:unset;line-break:unset=
;text-combine-upright:unset;text-underline-position:unset;list-style:unset;=
quotes:unset;margin:unset;outline:unset;padding:unset;width:unset;min-width=
:unset;max-width:unset;height:unset;min-height:unset;max-height:unset;box-s=
izing:unset;object-fit:unset;object-position:unset;table-layout:unset;text-=
overflow:unset;text-decoration:unset;ime-mode:unset"><br></span></div><div>=
<span style=3D"background:unset;background-blend-mode:unset;border:unset;bo=
rder-radius:unset;display:unset;float:unset;clear:unset;vertical-align:unse=
t;overflow:unset;isolation:unset;break-after:unset;break-before:unset;break=
-inside:unset;columns:unset;column-fill:unset;column-rule:unset;column-span=
:unset;opacity:unset;mix-blend-mode:unset;font:unset;font-synthesis:unset;w=
riting-mode:unset;text-orientation:unset;image-orientation:unset;border-col=
lapse:unset;empty-cells:unset;caption-side:unset;border-spacing:unset;color=
:unset;text-transform:unset;text-indent:unset;word-break:unset;text-justify=
:unset;text-align-last:unset;text-align:unset;letter-spacing:unset;word-spa=
cing:unset;white-space:pre;text-emphasis:unset;line-break:unset;text-combin=
e-upright:unset;text-underline-position:unset;list-style:unset;quotes:unset=
;margin:unset;outline:unset;padding:unset;width:unset;min-width:unset;max-w=
idth:unset;height:unset;min-height:unset;max-height:unset;box-sizing:unset;=
object-fit:unset;object-position:unset;table-layout:unset;text-overflow:uns=
et;text-decoration:unset;ime-mode:unset">Thanks,</span></div><div><span sty=
le=3D"background:unset;background-blend-mode:unset;border:unset;border-radi=
us:unset;display:unset;float:unset;clear:unset;vertical-align:unset;overflo=
w:unset;isolation:unset;break-after:unset;break-before:unset;break-inside:u=
nset;columns:unset;column-fill:unset;column-rule:unset;column-span:unset;op=
acity:unset;mix-blend-mode:unset;font:unset;font-synthesis:unset;writing-mo=
de:unset;text-orientation:unset;image-orientation:unset;border-collapse:uns=
et;empty-cells:unset;caption-side:unset;border-spacing:unset;color:unset;te=
xt-transform:unset;text-indent:unset;word-break:unset;text-justify:unset;te=
xt-align-last:unset;text-align:unset;letter-spacing:unset;word-spacing:unse=
t;white-space:pre;text-emphasis:unset;line-break:unset;text-combine-upright=
:unset;text-underline-position:unset;list-style:unset;quotes:unset;margin:u=
nset;outline:unset;padding:unset;width:unset;min-width:unset;max-width:unse=
t;height:unset;min-height:unset;max-height:unset;box-sizing:unset;object-fi=
t:unset;object-position:unset;table-layout:unset;text-overflow:unset;text-d=
ecoration:unset;ime-mode:unset"><br></span></div><div><span style=3D"backgr=
ound:unset;background-blend-mode:unset;border:unset;border-radius:unset;dis=
play:unset;float:unset;clear:unset;vertical-align:unset;overflow:unset;isol=
ation:unset;break-after:unset;break-before:unset;break-inside:unset;columns=
:unset;column-fill:unset;column-rule:unset;column-span:unset;opacity:unset;=
mix-blend-mode:unset;font:unset;font-synthesis:unset;writing-mode:unset;tex=
t-orientation:unset;image-orientation:unset;border-collapse:unset;empty-cel=
ls:unset;caption-side:unset;border-spacing:unset;color:unset;text-transform=
:unset;text-indent:unset;word-break:unset;text-justify:unset;text-align-las=
t:unset;text-align:unset;letter-spacing:unset;word-spacing:unset;white-spac=
e:pre;text-emphasis:unset;line-break:unset;text-combine-upright:unset;text-=
underline-position:unset;list-style:unset;quotes:unset;margin:unset;outline=
:unset;padding:unset;width:unset;min-width:unset;max-width:unset;height:uns=
et;min-height:unset;max-height:unset;box-sizing:unset;object-fit:unset;obje=
ct-position:unset;table-layout:unset;text-overflow:unset;text-decoration:un=
set;ime-mode:unset">Kyle<br></span></div></div>

--00000000000048cef205d03de43c--
