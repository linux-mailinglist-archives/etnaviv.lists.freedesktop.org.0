Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIKGJPOdAWoHggEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Mon, 11 May 2026 11:14:27 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A67150AB2A
	for <lists+etnaviv@lfdr.de>; Mon, 11 May 2026 11:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C8110E151;
	Mon, 11 May 2026 09:04:47 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB6010E151
 for <etnaviv@lists.freedesktop.org>; Mon, 11 May 2026 09:04:45 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1wMMZ8-0004bk-7y; Mon, 11 May 2026 11:04:42 +0200
Message-ID: <3e298ed6a361a0aa5526d859b0f3a98c0cd47090.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Honor userptr read-only at the GPU MMU
From: Lucas Stach <l.stach@pengutronix.de>
To: Ziyi Guo <guoziyi114@gmail.com>
Cc: linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com, 
 airlied@gmail.com, simona@ffwll.ch, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Ziyi Guo
 <n7l8m4@u.northwestern.edu>
Date: Mon, 11 May 2026 11:04:41 +0200
In-Reply-To: <20260508180518.1417371-1-n7l8m4@u.northwestern.edu>
References: <20260508180518.1417371-1-n7l8m4@u.northwestern.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: etnaviv@lists.freedesktop.org
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
X-Rspamd-Queue-Id: 2A67150AB2A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.69 / 15.00];
	SEM_URIBL(3.50)[northwestern.edu:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:guoziyi114@gmail.com,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:n7l8m4@u.northwestern.edu,m:linux@armlinux.org.uk,m:christiangmeiner@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[l.stach@pengutronix.de,etnaviv-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.802];
	R_DKIM_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[l.stach@pengutronix.de,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,u.northwestern.edu];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,northwestern.edu:email,pengutronix.de:mid]
X-Rspamd-Action: no action

Am Freitag, dem 08.05.2026 um 18:05 +0000 schrieb Ziyi Guo:
> The IOMMU mapping for a userptr BO was installed with a hard-coded
> ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE, ignoring the read-only
> attribute set when the BO was created without ETNA_USERPTR_WRITE.
> Build the prot mask from etnaviv_obj->userptr.ro so MMUv2 clears
> MMUv2_PTE_WRITEABLE for read-only userptr BOs.
>=20
> MMUv1 PTEs carry no R/W bits and its fast path skips the MMU, so
> read-only cannot be enforced there; refuse such a mapping with
> -ENODEV.

I don't think it's a good idea to completely reject those mappings on
MMUv1. We can always force a BO to be mapped through the
translation/protection region of the MMUv1 by adding the
ETNA_BO_FORCE_MMU flag, which is what you might want to do when
constructing a ro userptr BO.

Regards,
Lucas

>=20
> Fixes: a8c21a5451d8 ("drm/etnaviv: add initial etnaviv DRM driver")
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etna=
viv/etnaviv_mmu.c
> index e3572461b599..28f26d60ac05 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -269,10 +269,18 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_cont=
ext *context,
>  {
>  	struct sg_table *sgt =3D etnaviv_obj->sgt;
>  	struct drm_mm_node *node;
> +	int prot =3D ETNAVIV_PROT_READ;
>  	int ret;
> =20
>  	lockdep_assert_held(&etnaviv_obj->lock);
> =20
> +	if (!etnaviv_obj->userptr.ptr || !etnaviv_obj->userptr.ro)
> +		prot |=3D ETNAVIV_PROT_WRITE;
> +
> +	if (etnaviv_obj->userptr.ptr && etnaviv_obj->userptr.ro &&
> +	    context->global->version =3D=3D ETNAVIV_IOMMU_V1)
> +		return -ENODEV;
> +
>  	mutex_lock(&context->lock);
> =20
>  	/* v1 MMU can optimize single entry (contiguous) scatterlists */
> @@ -301,7 +309,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_contex=
t *context,
> =20
>  	mapping->iova =3D node->start;
>  	ret =3D etnaviv_iommu_map(context, node->start, etnaviv_obj->size, sgt,
> -				ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE);
> +				prot);
> =20
>  	if (ret < 0) {
>  		drm_mm_remove_node(node);
