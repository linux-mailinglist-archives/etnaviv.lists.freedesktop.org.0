Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A4B015D4
	for <lists+etnaviv@lfdr.de>; Fri, 11 Jul 2025 10:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0F710E9CD;
	Fri, 11 Jul 2025 08:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="xX41uABp";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DDA10E91C
 for <etnaviv@lists.freedesktop.org>; Thu, 10 Jul 2025 16:01:12 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id
 d75a77b69052e-4a585dc5f4aso14033291cf.2
 for <etnaviv@lists.freedesktop.org>; Thu, 10 Jul 2025 09:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752163272; x=1752768072;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
 :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=h2JvzJqEFY8FcNSNGs4AC4X799LbBQx2h7PFI9T2cfQ=;
 b=xX41uABpz5C6Agw/IjNAZ4yubxuufgiUFu2ZdJJbSmVcOhRS2Yo8BXY3AT3Sw/7nxJ
 9HfDrzq9dlfR/+Ge3t8LPOY5/po+HIEve9enHSPRp0QqVQZroUjiSY3bPArTr23/IUx3
 XQBT4uF5ZFPe9fuH6T7kdp0UglWdClKh7EAfHombxj+WmqGMkt6nxis2pQdrUgpLFm30
 03qByckU0Qfxz61sk06nwhnS1Va3s/XKuISWwBqjBwI30Xg+7r12x18GZVtZSwRfteUb
 AKJX12tNdK2BzgSl1d/L4COR4RxrLSJP+Nk/+B44okDFpLVHiKe4Zg9DRKkipxq71jXS
 ZSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752163272; x=1752768072;
 h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
 :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h2JvzJqEFY8FcNSNGs4AC4X799LbBQx2h7PFI9T2cfQ=;
 b=I7RqXX/bDeB19r9mKAjvJBLJ8U7nF9/KdjA0F/vH0PxiAovA80bkGM7Fdtb/yEZ8ue
 qOrc7U88gwZI4fe/NNenwPVPdUW3bLRGuBTyWEw25vMwDagc7MaY+v4jKWEzWBjwV0xj
 naW5j4436+wzUps4znpTCPefHy4eWxp5C1ciARMBNoGGyjjPcl9k+7yQ//xAwHW4M8ZN
 LZFfE8qYmn1FnJaKqUQeSHidhIv2aS/b0VeQatRQBPinOoXjQA+jf/mjp+Oc6hCBLv41
 Id97aljMx7683AgyideMPF4kTD4PItCy1Ov4q9NPblmjgcTV1u2L73LbAbgW04c30enZ
 ANIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHgk49r3rEwxzrrCMyCq65785vBQmxyq4hjG+fpw1cVBG9LKuUAswZWAnU3k2GgY2OmtcVbTnJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf8HKdRSVpxMrPakXO1eyzfXOogr07jon41lr90twviOsLgTX6
 MPvOXP3ULpUq6jabwgD1qwKPi/AecUg5PiS6OB28vFsOwERuIIr6ZRcItozabYDencI=
X-Gm-Gg: ASbGncvRQoZb7hWGXc6TaRugD6i4VzK3q5cI2XRqgjS01drSZ5CAABh2IqgLT3eU1W5
 c/p8xKTaH24I6AN0rk5Qe/XMSxQPQWteEBRMynS6xDiKmrXfm9gl3wv/iEtKaL3PxzfZHoLz8+u
 c5ZnVWBr9YGoaKToXitVUCZ+9v6vicWwfYm0J5uxyhc2cvNzxabWS3X22T4pYAtu/uyIG1XZeV6
 Sd92pdyzNlp+cvwyT8XtkrK/Ay9CPu5iu/PSq4k19hMMSuAeVci/W4nyiumxc6g5/8AIGiFdMe4
 WWWbvJTpm7w/SyE4RUsD9oSuPy6xMSm5ty73OYZBfmcg8Rbe5VrBH7Equ4NvoEFm3nk=
X-Google-Smtp-Source: AGHT+IFbQFapyLU2kvG8JwQQkxoFge/HX+KIphHVjcEQzpniLu173HdtuK79yftQGxLEwpJMC++ZBw==
X-Received: by 2002:a05:622a:8cc:b0:4a4:30a0:39c0 with SMTP id
 d75a77b69052e-4a9f80b0c22mr23008391cf.28.1752163271437; 
 Thu, 10 Jul 2025 09:01:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9edefb55asm10028431cf.77.2025.07.10.09.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:01:09 -0700 (PDT)
Message-ID: <775b0f527f365fa4217a5d9acfbb80e4f87078ef.camel@ndufresne.ca>
Subject: Re: DMA-BUFs always uncached on arm64, causing poor camera
 performance on Librem 5
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Pavel Machek <pavel@ucw.cz>, kraxel@redhat.com,
 vivek.kasireddy@intel.com, 	dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, 	benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, 	tjmercier@google.com,
 linux-media@vger.kernel.org, 	linaro-mm-sig@lists.linaro.org, kernel list
 <linux-kernel@vger.kernel.org>, 	laurent.pinchart@ideasonboard.com,
 l.stach@pengutronix.de, 	linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, 	etnaviv@lists.freedesktop.org,
 phone-devel@vger.kernel.org
Date: Thu, 10 Jul 2025 12:01:07 -0400
In-Reply-To: <aG94uNDrL1MdHJPM@duo.ucw.cz>
References: <aG94uNDrL1MdHJPM@duo.ucw.cz>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Nzv40WcQzqiJQr2kcTPI"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 11 Jul 2025 08:24:32 +0000
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


--=-Nzv40WcQzqiJQr2kcTPI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pavel,

Le jeudi 10 juillet 2025 =C3=A0 10:24 +0200, Pavel Machek a =C3=A9crit=C2=
=A0:
> Hi!
>=20
> It seems that DMA-BUFs are always uncached on arm64... which is a
> problem.
>=20
> I'm trying to get useful camera support on Librem 5, and that includes
> recording vidos (and taking photos).
>=20
> memcpy() from normal memory is about 2msec/1MB. Unfortunately, for
> DMA-BUFs it is 20msec/1MB, and that basically means I can't easily do
> 760p video recording. Plus, copying full-resolution photo buffer takes
> more than 200msec!
>=20
> There's possibility to do some processing on GPU, and its implemented her=
e:
>=20
> https://gitlab.com/tui/tui/-/tree/master/icam?ref_type=3Dheads
>=20
> but that hits the same problem in the end -- data is in DMA-BUF,
> uncached, and takes way too long to copy out.
>=20
> And that's ... wrong. DMA ended seconds ago, complete cache flush
> would be way cheaper than copying single frame out, and I still have
> to deal with uncached frames.
>=20
> So I have two questions:
>=20
> 1) Is my analysis correct that, no matter how I get frame from v4l and
> process it on GPU, I'll have to copy it from uncached memory in the
> end?
>=20
> 2) Does anyone have patches / ideas / roadmap how to solve that? It
> makes GPU unusable for computing, and camera basically unusable for
> video.

If CPU access is strictly required for your use case, the way forward is to
implement=C2=A0V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINT in the capture driver.=
 Very
little drivers enable that.

Once your driver have that capability, you will be able to set
V4L2_MEMORY_FLAG_NON_COHERENT while doing REQBUFS or CREATE_BUFS ioctl. Tha=
t
gives you allocation with CPU cache working, but you'll get the invalidatio=
n (or
flush) overhead by default. When capture data have not been read by CPU, yo=
u can
always queue it back with the V4L2_BUF_FLAG_NO_CACHE_INVALIDATE. But for yo=
ur
use case, it seems that you want the invalidation to take place, otherwise =
your
software will endup reading old cache data instead of the next frame data.

Please note that the integration in the DMABuf SYNC ioctl was missing for a
while, so make sure you have recent enough kernel or get ready for backport=
s.
The feature itself was commonly used with CPU only access, notably on Chrom=
eOS
using libyuv. No DMABuf was involved initially.

regards,

Nicolas

[0] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-r=
eqbufs.html#v4l2-buf-cap-supports-mmap-cache-hints

>=20
> Best regards,
> 								Pavel

--=-Nzv40WcQzqiJQr2kcTPI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaG/jwwAKCRDZQZRRKWBy
9BRcAP404riqHZv877jAk3LeonpmR8YSE9c6bNWGPspAtHTMNAEAzVw7ScK+PCWl
1/uUbQsGbqWd6r5mH47vDOU14pKwSQM=
=wFFh
-----END PGP SIGNATURE-----

--=-Nzv40WcQzqiJQr2kcTPI--
