Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CCBB1C962
	for <lists+etnaviv@lfdr.de>; Wed,  6 Aug 2025 17:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CA110E7A3;
	Wed,  6 Aug 2025 15:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="InZqtYF5";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DF710E7A3
 for <etnaviv@lists.freedesktop.org>; Wed,  6 Aug 2025 15:57:05 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-af968aa2de4so2220666b.1
 for <etnaviv@lists.freedesktop.org>; Wed, 06 Aug 2025 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754495824; x=1755100624; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wtIZVswjOfZUhAJFsLRc8b+Viop5qwKZOtEsXo6Fwo4=;
 b=InZqtYF5CsMU9soIhJO3aVmcCDWX7CvSqYaXmVg1eTYqXRlHqm7HVw5FtKhV9fsHk4
 o2qNO4OCq1Vv0AEVCh5R9YS4ZILGbTNnSsp8Evd9GfRZA/rwSsxQi2GUAwJ6F6Zn8h0k
 yslvMTs0dOXFvxnK9RWIvIW/74/UzA0GSINxXlZIPor+f0OwUW/tDFylToxEECvNpfGW
 Y3VC9w0PmfiA5bDdMO0YA9mElq+4Fthv9SvVkgCMCOh/9kgD37KHd+fyTVOJU46oTf1L
 YeFAQ2iFsHH/aw1pgchSU0ZXWnjnBSFE1GDRpJPfvw4rQD6iSGUrdOTgsljtGWORJPal
 ttvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754495824; x=1755100624;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wtIZVswjOfZUhAJFsLRc8b+Viop5qwKZOtEsXo6Fwo4=;
 b=rOVrqreGE03hoKnPApRxjVwiOpe+YMcoDarCd1HfxrLRVKzP5XqWJWpN6SHcN4UcTm
 SsmY+HS0zJCx8yScRUVIU/6FQYrniOYSyc5FvCf5d/ebwzk6QqilLVOJZceOgK6VO4/C
 suVrxHoEa7RZq7TPMNckcVJoeTEEGjdMVcGm1+YmGqqSKb6EYlfo3YswpkqB590JdgPs
 lFfcyUOj6pk2jQRQetkXW1TzyupUIxnZFXRdwG0D68gl10ZWJ1JxmnzSMXk70UDe6Sfe
 9geSlBK53rPO5Q+FSf1TdFHqn0qZ60dsiwR9aQhT7QiDsyaRwmFgjJ0ixUESpzG3UDu7
 u3bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlAIC8pOIShLKCs4fDydAZG2yCEzxI4j7U4r13/jr9YhMSpJaT083+1KYDIq8XOgWeUm1BkNOz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKycfRZADk4dFewFMDDTu4rO2vqjQdcj+fsqxidDfqNpip0pWh
 H5I3eWzRqXJgIn/6gDmB0TxFW45ftowFrjUzr5l04lhjcq5E9NUrsJfdIl6kuCnPN5Ud2Q8G0+X
 oLUcnP8MyEvGP3aeJ6RE7Q76w8FKG5Ke9j4M7
X-Gm-Gg: ASbGnctXVz10z7rOVKbsS2W+G6pkelmaqcNAIVH7TmMc3IpQHJnyFVzLlXAuW9ZmNau
 vYh72xOGS8wCnSb3PjiQy1NoLPHRRHmKT1eBh54Ag12FRcLIk6cuzH8/r3/JsnWWz2ECYhbowXo
 k6IWW0V7PLnV46UrPPid+KgumovmwgqxhwdfKZaKG6g8CntWzRX3DMU+ch2bPk6RmkGIvWUZUXo
 McIv0emiZe2XwJNupIWAsnQYdSE7UnAr2MWDt9Ltg==
X-Google-Smtp-Source: AGHT+IEODRrUOCgPqhD+8gC/BurrozWu3yk0g7lT5EZ5HsgeaIo+JJpRHJubjXBj1akRM8UyJyqS6KRI87NL2i2ZV8Q=
X-Received: by 2002:a17:907:d24:b0:af9:4fa9:b132 with SMTP id
 a640c23a62f3a-af992b6b597mr294252766b.33.1754495823292; Wed, 06 Aug 2025
 08:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <c4e6fa63-22af-4704-8cd8-60695c6a1d9b.6e2e464b-d864-4023-9e6f-7b1f7b7b3187.ecd3e5e5-68d5-465d-8973-f436b71c74fa@emailsignatures365.codetwo.com>
 <c4e6fa63-22af-4704-8cd8-60695c6a1d9b.a45007e2-be76-4ed0-b1ad-172f8b66e281.6ecc422e-3d59-4178-8377-cef24856beea@emailsignatures365.codetwo.com>
 <DBBPR03MB10462C52F7A92D60E5FC55515B723A@DBBPR03MB10462.eurprd03.prod.outlook.com>
 <CAOMZO5CvZoaj+nODZV0vfRK5ucOJ33bCtaZOgGSvciY-AJtGFA@mail.gmail.com>
 <DBBPR03MB1046232B226FA8719CAAFAEE5B723A@DBBPR03MB10462.eurprd03.prod.outlook.com>
 <CAOMZO5AgBWRvPLi-ZvGsD0nGLMD+bO9fDbymjOpfwcU0-x5YRQ@mail.gmail.com>
 <DBBPR03MB10462D0932F2045396A2A5E97B72DA@DBBPR03MB10462.eurprd03.prod.outlook.com>
In-Reply-To: <DBBPR03MB10462D0932F2045396A2A5E97B72DA@DBBPR03MB10462.eurprd03.prod.outlook.com>
From: Chris Healy <cphealy@gmail.com>
Date: Wed, 6 Aug 2025 08:56:51 -0700
X-Gm-Features: Ac12FXxQoKmu6XL1RnRe0k9IbSdqFiQAAcZ5NgRBi39ulDmAwPl475MgUZkIq5g
Message-ID: <CAFXsbZobSt-2wZVLMJKksrpw-PUsibZei_YYOgBOs=hkqHtURQ@mail.gmail.com>
Subject: Re: running etnaviv driver on i.mx6
To: Wagner Andre <andre.wagner@richard-wolf.com>
Cc: Fabio Estevam <festevam@gmail.com>, 
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="0000000000004eb0bf063bb46467"
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

--0000000000004eb0bf063bb46467
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm not sure what your goal is but I would recommend using a newer version
of Mesa than 23.2.1.  Many changes have landed in Mesa over the last 2
years related to etnaviv bringing features, performance, and bug fixes.

On Wed, Aug 6, 2025 at 8:49=E2=80=AFAM Wagner Andre <andre.wagner@richard-w=
olf.com>
wrote:

> Hi Fabio,
>
> I got it working! I didn't port everything to the mainline kernel but I
> ensured that drivers/gpu/drm/etnaviv and drivers/gpu/drm/imx match the
> mainline kernel and I ported the devicetree to mainline style for the gpu
> node and the ldb node (LVDS device bridge). Then i realized that i need t=
o
> compile mesa different:
>
> I used:
> *meson setup <build dir> \*
> *  -Dplatforms=3Dwayland \*
> *  -Degl-native-platform=3Ddrm \*
> *  -Dgallium-drivers=3Detnaviv,kmsro \*
> *  -Ddri3=3Denabled \*
> *  -Dvulkan-drivers=3D \*
> *  -Dllvm=3Ddisabled \*
> *  -Dshared-llvm=3Ddisabled \*
> *  -Dshared-glapi=3Denabled \*
> *  -Dgles1=3Denabled \*
> *  -Dgles2=3Denabled \*
> *  -Dopengl=3Dfalse \*
> *  -Degl=3Denabled \*
> *  -Dgbm=3Denabled \*
> *  -Dglx=3Ddisabled \*
> *  -Dglvnd=3Dtrue \*
> *  -Dbuild-tests=3Dtrue \*
> *  -Dtools=3D \*
> *  -Db_ndebug=3Dtrue \*
> *  -Ddri-drivers-path=3D/usr/lib/$(DEB_HOST_MULTIARCH)/dri \*
> *
> -Ddri-search-path=3D'/usr/lib/$(DEB_HOST_MULTIARCH)/dri:\$$$${ORIGIN}/dri=
:/usr/lib/dri'*
>
> On my first run I didn't set egl's native platform to drm and compared to
> your old article (i tested the buildroot you meantioned there) i used dri=
3
> and disabled dri2 completly.
>
> So my running setup is now:
>
>    - Linux 5.15.148, NXP branch with mainline
>    /driver/gpu/drm/{etnaviv,imx} of mainline branch
>    - Custom devicetree for NXP branch with adapted gpu- and lbd-node to
>    mainline branch
>    - Mesa 23.2.1 with dri3, egl on drm using gbm
>    - Qt Application 5.15 with eglfs platform
>
>
> Greetings,
> Andr=C3=A9
>
> <https://www.richard-wolf.com/de/unternehmen/kongresse/messe-detail/77-ko=
ngress-der-deutschen-gesellschaft-fuer-urologie-dgu>
> <https://www.richard-wolf.com/de/academy-prima-vista/masterclass-workshop=
s/masterclass-workshop-minimally-invasive-upper-gi-surgery-2>
> <https://www.richard-wolf.com/en/company/congresses/congress-detail/arab-=
health-2025>
>
> Richard Wolf GmbH, Pforzheimer Strasse 32, 75438 Knittlingen
> Managing Directors: Juergen Pfab, Juergen Steinbeck. Trade Register:
> Mannheim HRB 510031
>
> Richard Wolf GmbH routinely monitors the content of e-mail sent and
> received via its network for the purposes of ensuring compliance with its
> policies and procedures. Richard Wolf GmbH is not responsible for any
> changes made to the message after it has been sent. Where opinions are
> expressed, they are not necessarily those of Richard Wolf GmbH. This e-ma=
il
> and any files transmitted with it are confidential and intended solely fo=
r
> the use of the individual or entity to which they are addressed. If you a=
re
> not the intended addressee, or the person responsible for delivering it t=
o
> them, you may not copy, forward, disclose, or otherwise use it or any par=
t
> of it in any way. To do so may be unlawful. If you receive this e-mail by
> mistake, please advise the sender immediately.
>
> Data Protection Policy
> <https://www.richard-wolf.com/en/data-protection-policy>  |  Legal
> Information <https://www.richard-wolf.com/en/legal-information/>  |  Term=
s
> & Conditions <https://www.richard-wolf.com/en/terms-conditions/>
> ------------------------------
> *Von:* etnaviv <etnaviv-bounces@lists.freedesktop.org> im Auftrag von
> Fabio Estevam <festevam@gmail.com>
> *Gesendet:* Montag, 4. August 2025 21:50
> *An:* Wagner Andre <andre.wagner@richard-wolf.com>
> *Cc:* etnaviv@lists.freedesktop.org <etnaviv@lists.freedesktop.org>
> *Betreff:* Re: running etnaviv driver on i.mx6
>
> Hi Andre,
>
> On Mon, Aug 4, 2025 at 12:39=E2=80=AFPM Wagner Andre
> <andre.wagner@richard-wolf.com> wrote:
> >
> > Hi Fabio,
> >
> > thanks for your fast answer!
> > A few hours ago, i just found an old article of you where you  describe=
d
> howto do it ;):
> >
> >
> https://imxdev.gitlab.io/tutorial/Running_kmscube_with_Etnaviv_on_mx6sabr=
esd_board/
> >
> > I try to do the setup you described there, but i still got no plan how
> to port the devicetree i got for my board from the NXP kernel variant to
> the mainline, without causing a bunch of new problems.
>
> The display subsystem representation in the devicetree is different
> between the mainline kernel and the NXP kernel.
>
> Try getting the i.MX6 display interface to work with the mainline kernel
> first.
>
> There are many i.MX6-based boards are supported by the mainline
> kernel, which you can use as a reference for adapting your devicetree.
>

--0000000000004eb0bf063bb46467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not sure what your goal is but I would recommend u=
sing a newer version of Mesa than 23.2.1.=C2=A0 Many changes have landed in=
 Mesa over the last 2 years related to etnaviv bringing features, performan=
ce, and bug fixes.</div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 6, 2025 at 8:49=E2=80=
=AFAM Wagner Andre &lt;<a href=3D"mailto:andre.wagner@richard-wolf.com">and=
re.wagner@richard-wolf.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"msg8467096408946725261">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Fabio,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I got it working! I didn&#39;t port everything to the mainline kernel but I=
 ensured that drivers/gpu/drm/etnaviv and drivers/gpu/drm/imx match the mai=
nline kernel and I ported the devicetree to mainline style for the gpu node=
 and the ldb node (LVDS device bridge).
 Then i realized that i need to compile mesa different:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I=C2=A0used:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>meson setup &lt;build dir&gt; \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dplatforms=3Dwayland \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Degl-native-platform=3Ddrm \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dgallium-drivers=3Detnaviv,kmsro \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Ddri3=3Denabled \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dvulkan-drivers=3D \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dllvm=3Ddisabled \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dshared-llvm=3Ddisabled \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dshared-glapi=3Denabled \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dgles1=3Denabled \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dgles2=3Denabled \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dopengl=3Dfalse \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Degl=3Denabled \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dgbm=3Denabled \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dglx=3Ddisabled \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dglvnd=3Dtrue \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dbuild-tests=3Dtrue \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Dtools=3D \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Db_ndebug=3Dtrue \</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Ddri-drivers-path=3D/usr/lib/$(DEB_HOST_MULTIARCH)/dri \</b></di=
v>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b>=C2=A0 -Ddri-search-path=3D&#39;/usr/lib/$(DEB_HOST_MULTIARCH)/dri:\$$$$=
{ORIGIN}/dri:/usr/lib/dri&#39;</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<b><br>
</b></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
On my first run I didn&#39;t set egl&#39;s native platform to drm and compa=
red to your old article (i tested the buildroot you meantioned there) i use=
d dri3 and disabled dri2 completly.=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
So my running setup is now:</div>
<ul style=3D"margin-top:0px;margin-bottom:0px">
<li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calib=
ri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);list-style-type:&qu=
ot;- &quot;">
<div role=3D"presentation">Linux 5.15.148, NXP branch with mainline /driver=
/gpu/drm/{etnaviv,imx} of mainline branch</div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);list-style-typ=
e:&quot;- &quot;">
<div role=3D"presentation">Custom devicetree for NXP branch with adapted gp=
u- and lbd-node to mainline branch</div>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);list-style-typ=
e:&quot;- &quot;">
<div role=3D"presentation">Mesa 23.2.1 with dri3, egl on drm using gbm</div=
>
</li><li style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,=
Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);list-style-typ=
e:&quot;- &quot;">
<div role=3D"presentation">Qt Application 5.15 with eglfs platform</div>
</li></ul>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Greetings,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Andr=C3=A9</div>
<div id=3D"m_8467096408946725261appendonsend"></div>
<a href=3D"https://www.richard-wolf.com/de/unternehmen/kongresse/messe-deta=
il/77-kongress-der-deutschen-gesellschaft-fuer-urologie-dgu" title=3D"" tar=
get=3D"_blank"><img src=3D"https://www.richard-wolf.com/mam/data/Typo3/bann=
er/e-mail-banner-DGU25.png"></a><a href=3D"https://www.richard-wolf.com/de/=
academy-prima-vista/masterclass-workshops/masterclass-workshop-minimally-in=
vasive-upper-gi-surgery-2" title=3D"" target=3D"_blank"></a><a href=3D"http=
s://www.richard-wolf.com/en/company/congresses/congress-detail/arab-health-=
2025" title=3D"" target=3D"_blank"></a>


<p style=3D"margin-bottom:1pt"><span style=3D"font-size:8pt;font-family:Ari=
al,sans-serif;color:black">Richard
Wolf GmbH, Pforzheimer Strasse 32, 75438 Knittlingen<br>
Managing Directors: Juergen Pfab, Juergen Steinbeck. Trade Register: Mannhe=
im
HRB 510031 </span><u></u><u></u></p><p>

</p><p style=3D"margin-bottom:0pt"><span style=3D"font-size:8pt;font-family=
:Arial,sans-serif;color:darkgray">Richard
Wolf GmbH routinely monitors the content of e-mail sent and received via it=
s
network for the purposes of ensuring compliance with its policies and
procedures. Richard Wolf GmbH is not responsible for any changes made to th=
e
message after it has been sent. Where opinions are expressed, they are not
necessarily those of Richard Wolf GmbH. This e-mail and any files transmitt=
ed
with it are confidential and intended solely for the use of the individual =
or
entity to which they are addressed. If you are not the intended addressee, =
or
the person responsible for delivering it to them, you may not copy, forward=
,
disclose, or otherwise use it or any part of it in any way. To do so may be
unlawful. If you receive this e-mail by mistake, please advise the sender
immediately.<br></span><span style=3D"font-size:8pt;font-family:Arial,sans-=
serif;color:darkgray"><br>
<a href=3D"https://www.richard-wolf.com/en/data-protection-policy" title=3D=
"Data Protection Policy" style=3D"color:rgb(169,169,169)" target=3D"_blank"=
> Data Protection Policy</a></span><span style=3D"font-size:8pt;font-family=
:Arial,sans-serif;color:rgb(154,154,154)">=C2=A0
|=C2=A0 </span><a href=3D"https://www.richard-wolf.com/en/legal-information=
/" title=3D"Legal Information" style=3D"font-size:8pt;color:rgb(169,169,169=
)" target=3D"_blank">Legal Information</a><span style=3D"font-size:8pt;font=
-family:Arial,sans-serif;color:rgb(154,154,154)">=C2=A0
|=C2=A0 </span><a href=3D"https://www.richard-wolf.com/en/terms-conditions/=
" title=3D"Terms &amp; Conditions" style=3D"font-size:8pt;color:rgb(154,156=
,158)" target=3D"_blank">Terms &amp; Conditions</a></p>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_8467096408946725261divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> e=
tnaviv &lt;<a href=3D"mailto:etnaviv-bounces@lists.freedesktop.org" target=
=3D"_blank">etnaviv-bounces@lists.freedesktop.org</a>&gt; im Auftrag von Fa=
bio Estevam &lt;<a href=3D"mailto:festevam@gmail.com" target=3D"_blank">fes=
tevam@gmail.com</a>&gt;<br>
<b>Gesendet:</b> Montag, 4. August 2025 21:50<br>
<b>An:</b> Wagner Andre &lt;<a href=3D"mailto:andre.wagner@richard-wolf.com=
" target=3D"_blank">andre.wagner@richard-wolf.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:etnaviv@lists.freedesktop.org" target=3D"_blan=
k">etnaviv@lists.freedesktop.org</a> &lt;<a href=3D"mailto:etnaviv@lists.fr=
eedesktop.org" target=3D"_blank">etnaviv@lists.freedesktop.org</a>&gt;<br>
<b>Betreff:</b> Re: running etnaviv driver on i.mx6</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>Hi Andre,<br>
<br>
On Mon, Aug 4, 2025 at 12:39=E2=80=AFPM Wagner Andre<br>
&lt;<a href=3D"mailto:andre.wagner@richard-wolf.com" target=3D"_blank">andr=
e.wagner@richard-wolf.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Fabio,<br>
&gt;<br>
&gt; thanks for your fast answer!<br>
&gt; A few hours ago, i just found an old article of you where you=C2=A0 de=
scribed howto do it ;):<br>
&gt;<br>
&gt; <a href=3D"https://imxdev.gitlab.io/tutorial/Running_kmscube_with_Etna=
viv_on_mx6sabresd_board/" target=3D"_blank">
https://imxdev.gitlab.io/tutorial/Running_kmscube_with_Etnaviv_on_mx6sabres=
d_board/</a><br>
&gt;<br>
&gt; I try to do the setup you described there, but i still got no plan how=
 to port the devicetree i got for my board from the NXP kernel variant to t=
he mainline, without causing a bunch of new problems.<br>
<br>
The display subsystem representation in the devicetree is different<br>
between the mainline kernel and the NXP kernel.<br>
<br>
Try getting the i.MX6 display interface to work with the mainline kernel fi=
rst.<br>
<br>
There are many i.MX6-based boards are supported by the mainline<br>
kernel, which you can use as a reference for adapting your devicetree.<br>
</div>
</span></font></div>
</div>

</div></blockquote></div>

--0000000000004eb0bf063bb46467--
