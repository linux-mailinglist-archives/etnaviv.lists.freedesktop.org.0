Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QAoRNpDpUGpc8QIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 14:46:08 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5990973AE34
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 14:46:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3758710F897;
	Fri, 10 Jul 2026 12:46:07 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73CE10F88F
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 12:46:05 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1wiAcA-0002rv-If; Fri, 10 Jul 2026 14:45:58 +0200
Message-ID: <dd7772f2554fc5c949c59c686b313d8bebe763ec.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] drm/etnaviv: Add GPU reset counters
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King	
 <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard	 <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, Christian Gmeiner
 <cgmeiner@igalia.com>
Date: Fri, 10 Jul 2026 14:45:58 +0200
In-Reply-To: <20260710-etnaviv-reset-notification-v3-2-7a145c8a1d01@igalia.com>
References: <20260710-etnaviv-reset-notification-v3-0-7a145c8a1d01@igalia.com>
 <20260710-etnaviv-reset-notification-v3-2-7a145c8a1d01@igalia.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.gmeiner@gmail.com,m:linux+etnaviv@armlinux.org.uk,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel-dev@igalia.com,m:cgmeiner@igalia.com,m:christiangmeiner@gmail.com,m:linux@armlinux.org.uk,s:lists@lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,armlinux.org.uk,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER(0.00)[l.stach@pengutronix.de,etnaviv-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[l.stach@pengutronix.de,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:from_mime,pengutronix.de:email,pengutronix.de:mid,lists.freedesktop.org:from_smtp,igalia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5990973AE34

Am Freitag, dem 10.07.2026 um 14:03 +0200 schrieb Christian Gmeiner:
> From: Christian Gmeiner <cgmeiner@igalia.com>
>=20
> The OpenGL and Vulkan robustness extensions let an application detect a
> GPU reset and check if its own context caused it, so the application can
> drop the broken context and build a new one. The kernel knows both
> facts, but etnaviv has no way to report them to userspace.
>=20
> Add two counters and a RESET_QUERY ioctl that returns both in one call:
> a per-GPU counter that counts every reset of that GPU, and a per-context
> counter that only counts the resets this context was guilty of.
> Userspace compares the counters with saved values: if the context
> counter moved the context was guilty, if only the GPU counter moved the
> context was an innocent victim.
>=20
> The GPU counter is per GPU core and not per device, so a hang on one
> pipe does not look like an innocent reset to contexts that only use
> another pipe.
>=20
> The timeout handler updates both counters and the ioctl reads both
> under the GPU lock. Without the lock the query could run between the
> two updates, see only the GPU counter move and report an innocent
> reset to the guilty context.
>=20
> Bump the driver minor version so userspace can detect the feature.
>=20
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c   | 29 +++++++++++++++++++++++++++=
+-
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h   |  1 +
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h   |  2 ++
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c |  5 +++++
>  include/uapi/drm/etnaviv_drm.h          | 19 ++++++++++++++++++-
>  5 files changed, 54 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index a27ed014fb4e..5c50e5a24408 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -296,6 +296,32 @@ static int etnaviv_ioctl_get_param(struct drm_device=
 *dev, void *data,
>  	return etnaviv_gpu_get_param(gpu, args->param, &args->value);
>  }
> =20
> +static int etnaviv_ioctl_reset_query(struct drm_device *dev, void *data,
> +		struct drm_file *file)
> +{
> +	struct etnaviv_drm_private *priv =3D dev->dev_private;
> +	struct etnaviv_file_private *ctx =3D file->driver_priv;
> +	struct drm_etnaviv_reset_query *args =3D data;
> +	struct etnaviv_gpu *gpu;
> +
> +	if (args->flags)
> +		return -EINVAL;
> +
> +	if (args->pipe >=3D ETNA_MAX_PIPES)
> +		return -EINVAL;
> +
> +	gpu =3D priv->gpu[args->pipe];
> +	if (!gpu)
> +		return -ENXIO;
> +
> +	mutex_lock(&gpu->lock);
> +	args->global_reset_counter =3D gpu->reset_counter;
> +	args->context_reset_counter =3D ctx->reset_counter;
> +	mutex_unlock(&gpu->lock);
> +
> +	return 0;
> +}
> +
>  static int etnaviv_ioctl_gem_new(struct drm_device *dev, void *data,
>  		struct drm_file *file)
>  {
> @@ -502,6 +528,7 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] =
=3D {
>  	ETNA_IOCTL(GEM_WAIT,     gem_wait,     DRM_RENDER_ALLOW),
>  	ETNA_IOCTL(PM_QUERY_DOM, pm_query_dom, DRM_RENDER_ALLOW),
>  	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
> +	ETNA_IOCTL(RESET_QUERY,  reset_query,  DRM_RENDER_ALLOW),
>  };
> =20
>  static void etnaviv_show_fdinfo(struct drm_printer *p, struct drm_file *=
file)
> @@ -530,7 +557,7 @@ static const struct drm_driver etnaviv_drm_driver =3D=
 {
>  	.name               =3D "etnaviv",
>  	.desc               =3D "etnaviv DRM",
>  	.major              =3D 1,
> -	.minor              =3D 4,
> +	.minor              =3D 5,
>  };
> =20
>  /*
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etna=
viv/etnaviv_drv.h
> index cba4323ae589..9c348aa7f8d3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -34,6 +34,7 @@ struct etnaviv_file_private {
>  	int id;
>  	struct etnaviv_iommu_context	*mmu;
>  	struct drm_sched_entity		sched_entity[ETNA_MAX_PIPES];
> +	u32 reset_counter;
>  };
> =20
>  struct etnaviv_drm_private {
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.h
> index 5cb46c84e03a..a97780131426 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -148,6 +148,8 @@ struct etnaviv_gpu {
>  	u32 hangcheck_primid;
>  	u32 hangcheck_fence;
> =20
> +	u32 reset_counter;
> +
>  	void __iomem *mmio;
>  	int irq;
> =20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/et=
naviv/etnaviv_sched.c
> index 139e6e38784b..6e9b677122e3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -79,6 +79,11 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_=
job(struct drm_sched_job
>  	if(sched_job)
>  		drm_sched_increase_karma(sched_job);
> =20
> +	mutex_lock(&gpu->lock);
> +	gpu->reset_counter++;
> +	submit->ctx->reset_counter++;
> +	mutex_unlock(&gpu->lock);
> +
>  	/* get the GPU back into the init state */
>  	etnaviv_core_dump(submit);
>  	etnaviv_gpu_recover_hang(submit);
> diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_dr=
m.h
> index af024d90453d..b50a3a0799e6 100644
> --- a/include/uapi/drm/etnaviv_drm.h
> +++ b/include/uapi/drm/etnaviv_drm.h
> @@ -265,6 +265,21 @@ struct drm_etnaviv_pm_signal {
>  	char  name[64];   /* out, name of domain */
>  };
> =20
> +/*
> + * Reset status query:
> + *
> + * Both counters start at zero and only ever increase. Userspace saves
> + * both values and compares them on a later query: if the context
> + * counter moved this context caused a reset, if only the global
> + * counter moved the GPU was reset on behalf of another context.
> + */
> +struct drm_etnaviv_reset_query {
> +	__u32 pipe;			/* in */
> +	__u32 flags;			/* in, must be 0 */
> +	__u32 global_reset_counter;	/* out, all resets of this GPU core */
> +	__u32 context_reset_counter;	/* out, resets caused by this context */
> +};
> +
>  #define DRM_ETNAVIV_GET_PARAM          0x00
>  /* placeholder:
>  #define DRM_ETNAVIV_SET_PARAM          0x01
> @@ -279,7 +294,8 @@ struct drm_etnaviv_pm_signal {
>  #define DRM_ETNAVIV_GEM_WAIT           0x09
>  #define DRM_ETNAVIV_PM_QUERY_DOM       0x0a
>  #define DRM_ETNAVIV_PM_QUERY_SIG       0x0b
> -#define DRM_ETNAVIV_NUM_IOCTLS         0x0c
> +#define DRM_ETNAVIV_RESET_QUERY        0x0c
> +#define DRM_ETNAVIV_NUM_IOCTLS         0x0d
> =20
>  #define DRM_IOCTL_ETNAVIV_GET_PARAM    DRM_IOWR(DRM_COMMAND_BASE + DRM_E=
TNAVIV_GET_PARAM, struct drm_etnaviv_param)
>  #define DRM_IOCTL_ETNAVIV_GEM_NEW      DRM_IOWR(DRM_COMMAND_BASE + DRM_E=
TNAVIV_GEM_NEW, struct drm_etnaviv_gem_new)
> @@ -292,6 +308,7 @@ struct drm_etnaviv_pm_signal {
>  #define DRM_IOCTL_ETNAVIV_GEM_WAIT     DRM_IOW(DRM_COMMAND_BASE + DRM_ET=
NAVIV_GEM_WAIT, struct drm_etnaviv_gem_wait)
>  #define DRM_IOCTL_ETNAVIV_PM_QUERY_DOM DRM_IOWR(DRM_COMMAND_BASE + DRM_E=
TNAVIV_PM_QUERY_DOM, struct drm_etnaviv_pm_domain)
>  #define DRM_IOCTL_ETNAVIV_PM_QUERY_SIG DRM_IOWR(DRM_COMMAND_BASE + DRM_E=
TNAVIV_PM_QUERY_SIG, struct drm_etnaviv_pm_signal)
> +#define DRM_IOCTL_ETNAVIV_RESET_QUERY  DRM_IOWR(DRM_COMMAND_BASE + DRM_E=
TNAVIV_RESET_QUERY, struct drm_etnaviv_reset_query)
> =20
>  #if defined(__cplusplus)
>  }
