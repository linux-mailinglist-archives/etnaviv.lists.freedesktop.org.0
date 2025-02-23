Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE760A3243B
	for <lists+etnaviv@lfdr.de>; Wed, 12 Feb 2025 12:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B05210E856;
	Wed, 12 Feb 2025 11:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="RtbBqBQH";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4155C10E854;
 Wed, 12 Feb 2025 11:05:06 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YtFp70HSwz9sWv;
 Wed, 12 Feb 2025 12:05:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1739358303; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+n/GdP6EppMGHTS6u7anhwpTi7SfGPgvqwKvAyC1teM=;
 b=RtbBqBQHmLdABObFG6hBcjMtFGlTiiqbIFn8TopC/3iwc6W/P99QXEO7PsJwKnnN1yo8Ij
 uKHRFwTOLOJ+DRriXgA+pfseXt/Ir16Znw0SKZmaLMimrh3iyKG4ttyNQZXU98Euvc37M4
 Vilr93mR5LWnQzY0tlrUilTjz8YTFWYTOupLzoeH52ACavB2ZZENWaMg4s84jRTOpJSEF8
 GOmy5+JWxhwsun+n6qPmSgsaRvJotEt3F0g2Dc2v3mObA9Y2shBnyjGTYtFuOwPa6+RhMY
 xLutxekAh31fu6M8EdNlTU0r1tI3BPTx8iEWQh5sC0kEm+xloy7h6RzutxQStA==
Message-ID: <59c601f04990a702c77c0dfc692d4d1eeeb6494d.camel@mailbox.org>
Subject: Re: [PATCH v4] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Min Ma <min.ma@amd.com>, Lizhi Hou
 <lizhi.hou@amd.com>, Oded Gabbay <ogabbay@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu
 <yuq825@gmail.com>,  Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,  Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, 
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>,  Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li
 <Yunxiang.Li@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Christian Gmeiner <cgmeiner@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Wed, 12 Feb 2025 12:04:46 +0100
In-Reply-To: <20250211111422.21235-2-phasta@kernel.org>
References: <20250211111422.21235-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 3bu44jpkz7fgqnse158c1w364bu6x3au
X-MBO-RS-ID: 75d062aed26871cd865
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
Reply-To: phasta@kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Tue, 2025-02-11 at 12:14 +0100, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming, addressed in:
>=20
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> nouveau_sched_init()").
>=20
> Introduce a new struct for the scheduler init parameters and port all
> users.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com> # for Xe
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # for
> Panfrost and Panthor
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com> # for Etnaviv
> Reviewed-by: Frank Binns <frank.binns@imgtec.com> # for Imagination
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> # for Sched
> Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com> # for v3d

Applied this one with the additional RBs to drm-misc-next

P.

> ---
> Changes in v4:
> =C2=A0 - Add forgotten driver accel/amdxdna. (Me)
> =C2=A0 - Rephrase the "init to NULL" comments. (Tvrtko)
> =C2=A0 - Apply RBs by Tvrtko and Maira.
> =C2=A0 - Terminate the last struct members with a comma, so that future
> =C2=A0=C2=A0=C2=A0 fields can be added with a minimal patch diff. (Me)
>=20
> Changes in v3:
> =C2=A0 - Various formatting requirements.
>=20
> Changes in v2:
> =C2=A0 - Point out that the hang-limit is deprecated. (Christian)
> =C2=A0 - Initialize the structs to 0 at declaration. (Planet Earth)
> =C2=A0 - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
> =C2=A0 - Make the structs const where possible. (Boris)
> =C2=A0 - v3d: Use just 1, universal, function for sched-init. (Ma=C3=ADra=
)
> ---
> =C2=A0drivers/accel/amdxdna/aie2_ctx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +++-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++--
> =C2=A0drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0 | 20 +++-=
---
> =C2=A0drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0 | 18 ++++=
--
> =C2=A0drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 16 ++++--
> =C2=A0drivers/gpu/drm/msm/msm_ringbuffer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 17 +++---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0 | 16 ++++=
--
> =C2=A0drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0 | 20 ++++=
---
> =C2=A0drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 16 ++++--
> =C2=A0drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0 | 28 ++++=
++----
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 | 50=
 ++++++-----------
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 65 +++++++++-----------
> --
> =C2=A0drivers/gpu/drm/xe/xe_execlist.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++--
> =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 17 +++++-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36 ++++++++++--
> =C2=A015 files changed, 210 insertions(+), 154 deletions(-)
>=20
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c
> b/drivers/accel/amdxdna/aie2_ctx.c
> index 2799729801f6..8ac01bc2f0db 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -516,6 +516,14 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
> =C2=A0{
> =C2=A0	struct amdxdna_client *client =3D hwctx->client;
> =C2=A0	struct amdxdna_dev *xdna =3D client->xdna;
> +	const struct drm_sched_init_args args =3D {
> +		.ops =3D &sched_ops,
> +		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit =3D HWCTX_MAX_CMDS,
> +		.timeout =3D msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
> +		.name =3D hwctx->name,
> +		.dev =3D xdna->ddev.dev,
> +	};
> =C2=A0	struct drm_gpu_scheduler *sched;
> =C2=A0	struct amdxdna_hwctx_priv *priv;
> =C2=A0	struct amdxdna_gem_obj *heap;
> @@ -573,9 +581,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
> =C2=A0	might_lock(&priv->io_lock);
> =C2=A0	fs_reclaim_release(GFP_KERNEL);
> =C2=A0
> -	ret =3D drm_sched_init(sched, &sched_ops, NULL,
> DRM_SCHED_PRIORITY_COUNT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 HWCTX_MAX_CMDS, 0,
> msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
> -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, hwctx->name, xdna-
> >ddev.dev);
> +	ret =3D drm_sched_init(sched, &args);
> =C2=A0	if (ret) {
> =C2=A0		XDNA_ERR(xdna, "Failed to init DRM scheduler. ret
> %d", ret);
> =C2=A0		goto free_cmd_bufs;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 96316111300a..daa65971c503 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2816,6 +2816,12 @@ static int amdgpu_device_fw_loading(struct
> amdgpu_device *adev)
> =C2=A0
> =C2=A0static int amdgpu_device_init_schedulers(struct amdgpu_device *adev=
)
> =C2=A0{
> +	struct drm_sched_init_args args =3D {
> +		.ops =3D &amdgpu_sched_ops,
> +		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +		.timeout_wq =3D adev->reset_domain->wq,
> +		.dev =3D adev->dev,
> +	};
> =C2=A0	long timeout;
> =C2=A0	int r, i;
> =C2=A0
> @@ -2841,12 +2847,12 @@ static int
> amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> =C2=A0			break;
> =C2=A0		}
> =C2=A0
> -		r =3D drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> NULL,
> -				=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> -				=C2=A0=C2=A0 ring->num_hw_submission, 0,
> -				=C2=A0=C2=A0 timeout, adev->reset_domain->wq,
> -				=C2=A0=C2=A0 ring->sched_score, ring->name,
> -				=C2=A0=C2=A0 adev->dev);
> +		args.timeout =3D timeout;
> +		args.credit_limit =3D ring->num_hw_submission;
> +		args.score =3D ring->sched_score;
> +		args.name =3D ring->name;
> +
> +		r =3D drm_sched_init(&ring->sched, &args);
> =C2=A0		if (r) {
> =C2=A0			DRM_ERROR("Failed to create scheduler on
> ring %s.\n",
> =C2=A0				=C2=A0 ring->name);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 5b67eda122db..76a3a3e517d8 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -144,17 +144,17 @@ int etnaviv_sched_push_job(struct
> etnaviv_gem_submit *submit)
> =C2=A0
> =C2=A0int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> =C2=A0{
> -	int ret;
> +	const struct drm_sched_init_args args =3D {
> +		.ops =3D &etnaviv_sched_ops,
> +		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit =3D etnaviv_hw_jobs_limit,
> +		.hang_limit =3D etnaviv_job_hang_limit,
> +		.timeout =3D msecs_to_jiffies(500),
> +		.name =3D dev_name(gpu->dev),
> +		.dev =3D gpu->dev,
> +	};
> =C2=A0
> -	ret =3D drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 etnaviv_hw_jobs_limit,
> etnaviv_job_hang_limit,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(500), NULL, NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(gpu->dev), gpu->dev);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return drm_sched_init(&gpu->sched, &args);
> =C2=A0}
> =C2=A0
> =C2=A0void etnaviv_sched_fini(struct etnaviv_gpu *gpu)
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
> b/drivers/gpu/drm/imagination/pvr_queue.c
> index c4f08432882b..21c185d18bb2 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -1210,6 +1210,17 @@ struct pvr_queue *pvr_queue_create(struct
> pvr_context *ctx,
> =C2=A0		},
> =C2=A0	};
> =C2=A0	struct pvr_device *pvr_dev =3D ctx->pvr_dev;
> +	const struct drm_sched_init_args sched_args =3D {
> +		.ops =3D &pvr_queue_sched_ops,
> +		.submit_wq =3D pvr_dev->sched_wq,
> +		.num_rqs =3D 1,
> +		.credit_limit =3D 64 * 1024,
> +		.hang_limit =3D 1,
> +		.timeout =3D msecs_to_jiffies(500),
> +		.timeout_wq =3D pvr_dev->sched_wq,
> +		.name =3D "pvr-queue",
> +		.dev =3D pvr_dev->base.dev,
> +	};
> =C2=A0	struct drm_gpu_scheduler *sched;
> =C2=A0	struct pvr_queue *queue;
> =C2=A0	int ctx_state_size, err;
> @@ -1282,12 +1293,7 @@ struct pvr_queue *pvr_queue_create(struct
> pvr_context *ctx,
> =C2=A0
> =C2=A0	queue->timeline_ufo.value =3D cpu_map;
> =C2=A0
> -	err =3D drm_sched_init(&queue->scheduler,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 &pvr_queue_sched_ops,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 pvr_dev->sched_wq, 1, 64 * 1024, 1,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(500),
> -			=C2=A0=C2=A0=C2=A0=C2=A0 pvr_dev->sched_wq, NULL, "pvr-queue",
> -			=C2=A0=C2=A0=C2=A0=C2=A0 pvr_dev->base.dev);
> +	err =3D drm_sched_init(&queue->scheduler, &sched_args);
> =C2=A0	if (err)
> =C2=A0		goto err_release_ufo;
> =C2=A0
> diff --git a/drivers/gpu/drm/lima/lima_sched.c
> b/drivers/gpu/drm/lima/lima_sched.c
> index b40c90e97d7e..825135a26aa4 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -515,18 +515,22 @@ int lima_sched_pipe_init(struct lima_sched_pipe
> *pipe, const char *name)
> =C2=A0{
> =C2=A0	unsigned int timeout =3D lima_sched_timeout_ms > 0 ?
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lima_sched_timeout_ms : 100=
00;
> +	const struct drm_sched_init_args args =3D {
> +		.ops =3D &lima_sched_ops,
> +		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit =3D 1,
> +		.hang_limit =3D lima_job_hang_limit,
> +		.timeout =3D msecs_to_jiffies(timeout),
> +		.name =3D name,
> +		.dev =3D pipe->ldev->dev,
> +	};
> =C2=A0
> =C2=A0	pipe->fence_context =3D dma_fence_context_alloc(1);
> =C2=A0	spin_lock_init(&pipe->fence_lock);
> =C2=A0
> =C2=A0	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> =C2=A0
> -	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lima_job_hang_limit,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(timeout), NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, name, pipe->ldev->dev);
> +	return drm_sched_init(&pipe->base, &args);
> =C2=A0}
> =C2=A0
> =C2=A0void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c
> b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index c803556a8f64..c5651c39ac2a 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -59,8 +59,14 @@ static const struct drm_sched_backend_ops
> msm_sched_ops =3D {
> =C2=A0struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int
> id,
> =C2=A0		void *memptrs, uint64_t memptrs_iova)
> =C2=A0{
> +	struct drm_sched_init_args args =3D {
> +		.ops =3D &msm_sched_ops,
> +		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit =3D num_hw_submissions,
> +		.timeout =3D MAX_SCHEDULE_TIMEOUT,
> +		.dev =3D gpu->dev->dev,
> +	};
> =C2=A0	struct msm_ringbuffer *ring;
> -	long sched_timeout;
> =C2=A0	char name[32];
> =C2=A0	int ret;
> =C2=A0
> @@ -87,6 +93,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct
> msm_gpu *gpu, int id,
> =C2=A0	}
> =C2=A0
> =C2=A0	msm_gem_object_set_name(ring->bo, "ring%d", id);
> +	args.name =3D to_msm_bo(ring->bo)->name,
> =C2=A0
> =C2=A0	ring->end=C2=A0=C2=A0 =3D ring->start + (MSM_GPU_RINGBUFFER_SZ >> =
2);
> =C2=A0	ring->next=C2=A0 =3D ring->start;
> @@ -95,13 +102,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct
> msm_gpu *gpu, int id,
> =C2=A0	ring->memptrs =3D memptrs;
> =C2=A0	ring->memptrs_iova =3D memptrs_iova;
> =C2=A0
> -	 /* currently managing hangcheck ourselves: */
> -	sched_timeout =3D MAX_SCHEDULE_TIMEOUT;
> -
> -	ret =3D drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 num_hw_submissions, 0, sched_timeout,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, to_msm_bo(ring->bo)->name,
> gpu->dev->dev);
> +	ret =3D drm_sched_init(&ring->sched, &args);
> =C2=A0	if (ret) {
> =C2=A0		goto fail;
> =C2=A0	}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 4412f2711fb5..d326e55d2d24 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -404,7 +404,14 @@ nouveau_sched_init(struct nouveau_sched *sched,
> struct nouveau_drm *drm,
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *drm_sched =3D &sched->base;
> =C2=A0	struct drm_sched_entity *entity =3D &sched->entity;
> -	const long timeout =3D
> msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> +	struct drm_sched_init_args args =3D {
> +		.ops =3D &nouveau_sched_ops,
> +		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit =3D credit_limit,
> +		.timeout =3D
> msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS),
> +		.name =3D "nouveau_sched",
> +		.dev =3D drm->dev->dev
> +	};
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	if (!wq) {
> @@ -416,10 +423,9 @@ nouveau_sched_init(struct nouveau_sched *sched,
> struct nouveau_drm *drm,
> =C2=A0		sched->wq =3D wq;
> =C2=A0	}
> =C2=A0
> -	ret =3D drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 NOUVEAU_SCHED_PRIORITY_COUNT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 credit_limit, 0, timeout,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, "nouveau_sched", drm->dev-
> >dev);
> +	args.submit_wq =3D wq,
> +
> +	ret =3D drm_sched_init(drm_sched, &args);
> =C2=A0	if (ret)
> =C2=A0		goto fail_wq;
> =C2=A0
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 9b8e82fb8bc4..5657106c2f7d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -836,8 +836,16 @@ static irqreturn_t panfrost_job_irq_handler(int
> irq, void *data)
> =C2=A0
> =C2=A0int panfrost_job_init(struct panfrost_device *pfdev)
> =C2=A0{
> +	struct drm_sched_init_args args =3D {
> +		.ops =3D &panfrost_sched_ops,
> +		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit =3D 2,
> +		.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> +		.timeout_wq =3D pfdev->reset.wq,
> +		.name =3D "pan_js",
> +		.dev =3D pfdev->dev,
> +	};
> =C2=A0	struct panfrost_job_slot *js;
> -	unsigned int nentries =3D 2;
> =C2=A0	int ret, j;
> =C2=A0
> =C2=A0	/* All GPUs have two entries per queue, but without jobchain
> @@ -845,7 +853,7 @@ int panfrost_job_init(struct panfrost_device
> *pfdev)
> =C2=A0	 * so let's just advertise one entry in that case.
> =C2=A0	 */
> =C2=A0	if (!panfrost_has_hw_feature(pfdev,
> HW_FEATURE_JOBCHAIN_DISAMBIGUATION))
> -		nentries =3D 1;
> +		args.credit_limit =3D 1;
> =C2=A0
> =C2=A0	pfdev->js =3D js =3D devm_kzalloc(pfdev->dev, sizeof(*js),
> GFP_KERNEL);
> =C2=A0	if (!js)
> @@ -875,13 +883,7 @@ int panfrost_job_init(struct panfrost_device
> *pfdev)
> =C2=A0	for (j =3D 0; j < NUM_JOB_SLOTS; j++) {
> =C2=A0		js->queue[j].fence_context =3D
> dma_fence_context_alloc(1);
> =C2=A0
> -		ret =3D drm_sched_init(&js->queue[j].sched,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 &panfrost_sched_ops, NULL,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 nentries, 0,
> -				=C2=A0=C2=A0=C2=A0=C2=A0
> msecs_to_jiffies(JOB_TIMEOUT_MS),
> -				=C2=A0=C2=A0=C2=A0=C2=A0 pfdev->reset.wq,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "pan_js", pfdev->dev);
> +		ret =3D drm_sched_init(&js->queue[j].sched, &args);
> =C2=A0		if (ret) {
> =C2=A0			dev_err(pfdev->dev, "Failed to create
> scheduler: %d.", ret);
> =C2=A0			goto err_sched;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
> b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 5ce80e2532d5..f8efe07152a4 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2278,6 +2278,16 @@ panthor_vm_create(struct panthor_device
> *ptdev, bool for_mcu,
> =C2=A0	u64 full_va_range =3D 1ull << va_bits;
> =C2=A0	struct drm_gem_object *dummy_gem;
> =C2=A0	struct drm_gpu_scheduler *sched;
> +	const struct drm_sched_init_args sched_args =3D {
> +		.ops =3D &panthor_vm_bind_ops,
> +		.submit_wq =3D ptdev->mmu->vm.wq,
> +		.num_rqs =3D 1,
> +		.credit_limit =3D 1,
> +		/* Bind operations are synchronous for now, no
> timeout needed. */
> +		.timeout =3D MAX_SCHEDULE_TIMEOUT,
> +		.name =3D "panthor-vm-bind",
> +		.dev =3D ptdev->base.dev,
> +	};
> =C2=A0	struct io_pgtable_cfg pgtbl_cfg;
> =C2=A0	u64 mair, min_va, va_range;
> =C2=A0	struct panthor_vm *vm;
> @@ -2335,11 +2345,7 @@ panthor_vm_create(struct panthor_device
> *ptdev, bool for_mcu,
> =C2=A0		goto err_mm_takedown;
> =C2=A0	}
> =C2=A0
> -	/* Bind operations are synchronous for now, no timeout
> needed. */
> -	ret =3D drm_sched_init(&vm->sched, &panthor_vm_bind_ops,
> ptdev->mmu->vm.wq,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 1, 1, 0,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 MAX_SCHEDULE_TIMEOUT, NULL, NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 "panthor-vm-bind", ptdev->base.dev);
> +	ret =3D drm_sched_init(&vm->sched, &sched_args);
> =C2=A0	if (ret)
> =C2=A0		goto err_free_io_pgtable;
> =C2=A0
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
> b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5844a7f639e0..f49e2dfcbc6c 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3284,6 +3284,22 @@ static struct panthor_queue *
> =C2=A0group_create_queue(struct panthor_group *group,
> =C2=A0		=C2=A0=C2=A0 const struct drm_panthor_queue_create *args)
> =C2=A0{
> +	const struct drm_sched_init_args sched_args =3D {
> +		.ops =3D &panthor_queue_sched_ops,
> +		.submit_wq =3D group->ptdev->scheduler->wq,
> +		.num_rqs =3D 1,
> +		/*
> +		 * The credit limit argument tells us the total
> number of
> +		 * instructions across all CS slots in the
> ringbuffer, with
> +		 * some jobs requiring twice as many as others,
> depending on
> +		 * their profiling status.
> +		 */
> +		.credit_limit =3D args->ringbuf_size / sizeof(u64),
> +		.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> +		.timeout_wq =3D group->ptdev->reset.wq,
> +		.name =3D "panthor-queue",
> +		.dev =3D group->ptdev->base.dev,
> +	};
> =C2=A0	struct drm_gpu_scheduler *drm_sched;
> =C2=A0	struct panthor_queue *queue;
> =C2=A0	int ret;
> @@ -3354,17 +3370,7 @@ group_create_queue(struct panthor_group
> *group,
> =C2=A0	if (ret)
> =C2=A0		goto err_free_queue;
> =C2=A0
> -	/*
> -	 * Credit limit argument tells us the total number of
> instructions
> -	 * across all CS slots in the ringbuffer, with some jobs
> requiring
> -	 * twice as many as others, depending on their profiling
> status.
> -	 */
> -	ret =3D drm_sched_init(&queue->scheduler,
> &panthor_queue_sched_ops,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->scheduler->wq, 1,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 args->ringbuf_size / sizeof(u64),
> -			=C2=A0=C2=A0=C2=A0=C2=A0 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> -			=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->reset.wq,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "panthor-queue", group->ptdev-
> >base.dev);
> +	ret =3D drm_sched_init(&queue->scheduler, &sched_args);
> =C2=A0	if (ret)
> =C2=A0		goto err_free_queue;
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index a48be16ab84f..8c36a59afb72 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1244,40 +1244,24 @@ static void drm_sched_run_job_work(struct
> work_struct *w)
> =C2=A0 * drm_sched_init - Init a gpu scheduler instance
> =C2=A0 *
> =C2=A0 * @sched: scheduler instance
> - * @ops: backend operations for this scheduler
> - * @submit_wq: workqueue to use for submission. If NULL, an ordered
> wq is
> - *	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocated and used
> - * @num_rqs: number of runqueues, one for each priority, up to
> DRM_SCHED_PRIORITY_COUNT
> - * @credit_limit: the number of credits this scheduler can hold from
> all jobs
> - * @hang_limit: number of times to allow a job to hang before
> dropping it
> - * @timeout: timeout value in jiffies for the scheduler
> - * @timeout_wq: workqueue to use for timeout work. If NULL, the
> system_wq is
> - *		used
> - * @score: optional score atomic shared with other schedulers
> - * @name: name used for debugging
> - * @dev: target &struct device
> + * @args: scheduler initialization arguments
> =C2=A0 *
> =C2=A0 * Return 0 on success, otherwise error code.
> =C2=A0 */
> -int drm_sched_init(struct drm_gpu_scheduler *sched,
> -		=C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> -		=C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> -		=C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int
> hang_limit,
> -		=C2=A0=C2=A0 long timeout, struct workqueue_struct
> *timeout_wq,
> -		=C2=A0=C2=A0 atomic_t *score, const char *name, struct device
> *dev)
> +int drm_sched_init(struct drm_gpu_scheduler *sched, const struct
> drm_sched_init_args *args)
> =C2=A0{
> =C2=A0	int i;
> =C2=A0
> -	sched->ops =3D ops;
> -	sched->credit_limit =3D credit_limit;
> -	sched->name =3D name;
> -	sched->timeout =3D timeout;
> -	sched->timeout_wq =3D timeout_wq ? : system_wq;
> -	sched->hang_limit =3D hang_limit;
> -	sched->score =3D score ? score : &sched->_score;
> -	sched->dev =3D dev;
> +	sched->ops =3D args->ops;
> +	sched->credit_limit =3D args->credit_limit;
> +	sched->name =3D args->name;
> +	sched->timeout =3D args->timeout;
> +	sched->hang_limit =3D args->hang_limit;
> +	sched->timeout_wq =3D args->timeout_wq ? args->timeout_wq :
> system_wq;
> +	sched->score =3D args->score ? args->score : &sched->_score;
> +	sched->dev =3D args->dev;
> =C2=A0
> -	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> +	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> =C2=A0		/* This is a gross violation--tell drivers what the=C2=A0
> problem is.
> =C2=A0		 */
> =C2=A0		drm_err(sched, "%s: num_rqs cannot be greater than
> DRM_SCHED_PRIORITY_COUNT\n",
> @@ -1292,16 +1276,16 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched,
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
> -	if (submit_wq) {
> -		sched->submit_wq =3D submit_wq;
> +	if (args->submit_wq) {
> +		sched->submit_wq =3D args->submit_wq;
> =C2=A0		sched->own_submit_wq =3D false;
> =C2=A0	} else {
> =C2=A0#ifdef CONFIG_LOCKDEP
> -		sched->submit_wq =3D
> alloc_ordered_workqueue_lockdep_map(name,
> +		sched->submit_wq =3D
> alloc_ordered_workqueue_lockdep_map(args->name,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 WQ_MEM_RECLAIM,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 &drm_sched_lockdep_map);
> =C2=A0#else
> -		sched->submit_wq =3D alloc_ordered_workqueue(name,
> WQ_MEM_RECLAIM);
> +		sched->submit_wq =3D alloc_ordered_workqueue(args-
> >name, WQ_MEM_RECLAIM);
> =C2=A0#endif
> =C2=A0		if (!sched->submit_wq)
> =C2=A0			return -ENOMEM;
> @@ -1309,11 +1293,11 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched,
> =C2=A0		sched->own_submit_wq =3D true;
> =C2=A0	}
> =C2=A0
> -	sched->sched_rq =3D kmalloc_array(num_rqs, sizeof(*sched-
> >sched_rq),
> +	sched->sched_rq =3D kmalloc_array(args->num_rqs,
> sizeof(*sched->sched_rq),
> =C2=A0					GFP_KERNEL | __GFP_ZERO);
> =C2=A0	if (!sched->sched_rq)
> =C2=A0		goto Out_check_own;
> -	sched->num_rqs =3D num_rqs;
> +	sched->num_rqs =3D args->num_rqs;
> =C2=A0	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
> {
> =C2=A0		sched->sched_rq[i] =3D kzalloc(sizeof(*sched-
> >sched_rq[i]), GFP_KERNEL);
> =C2=A0		if (!sched->sched_rq[i])
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index 961465128d80..80466ce8c7df 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -820,67 +820,54 @@ static const struct drm_sched_backend_ops
> v3d_cpu_sched_ops =3D {
> =C2=A0	.free_job =3D v3d_cpu_job_free
> =C2=A0};
> =C2=A0
> +static int
> +v3d_queue_sched_init(struct v3d_dev *v3d, const struct
> drm_sched_backend_ops *ops,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 enum v3d_queue queue, const char *name)
> +{
> +	struct drm_sched_init_args args =3D {
> +		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit =3D 1,
> +		.timeout =3D msecs_to_jiffies(500),
> +		.dev =3D v3d->drm.dev,
> +	};
> +
> +	args.ops =3D ops;
> +	args.name =3D name;
> +
> +	return drm_sched_init(&v3d->queue[queue].sched, &args);
> +}
> +
> =C2=A0int
> =C2=A0v3d_sched_init(struct v3d_dev *v3d)
> =C2=A0{
> -	int hw_jobs_limit =3D 1;
> -	int job_hang_limit =3D 0;
> -	int hang_limit_ms =3D 500;
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D drm_sched_init(&v3d->queue[V3D_BIN].sched,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_bin_sched_ops, NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms), NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_bin", v3d->drm.dev);
> +	ret =3D v3d_queue_sched_init(v3d, &v3d_bin_sched_ops, V3D_BIN,
> "v3d_bin");
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	ret =3D drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_render_sched_ops, NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms), NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_render", v3d->drm.dev);
> +	ret =3D v3d_queue_sched_init(v3d, &v3d_render_sched_ops,
> V3D_RENDER,
> +				=C2=A0=C2=A0 "v3d_render");
> =C2=A0	if (ret)
> =C2=A0		goto fail;
> =C2=A0
> -	ret =3D drm_sched_init(&v3d->queue[V3D_TFU].sched,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_tfu_sched_ops, NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms), NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_tfu", v3d->drm.dev);
> +	ret =3D v3d_queue_sched_init(v3d, &v3d_tfu_sched_ops, V3D_TFU,
> "v3d_tfu");
> =C2=A0	if (ret)
> =C2=A0		goto fail;
> =C2=A0
> =C2=A0	if (v3d_has_csd(v3d)) {
> -		ret =3D drm_sched_init(&v3d->queue[V3D_CSD].sched,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_csd_sched_ops, NULL,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> -				=C2=A0=C2=A0=C2=A0=C2=A0
> msecs_to_jiffies(hang_limit_ms), NULL,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_csd", v3d->drm.dev);
> +		ret =3D v3d_queue_sched_init(v3d, &v3d_csd_sched_ops,
> V3D_CSD,
> +					=C2=A0=C2=A0 "v3d_csd");
> =C2=A0		if (ret)
> =C2=A0			goto fail;
> =C2=A0
> -		ret =3D drm_sched_init(&v3d-
> >queue[V3D_CACHE_CLEAN].sched,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cache_clean_sched_ops,
> NULL,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> -				=C2=A0=C2=A0=C2=A0=C2=A0
> msecs_to_jiffies(hang_limit_ms), NULL,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cache_clean", v3d-
> >drm.dev);
> +		ret =3D v3d_queue_sched_init(v3d,
> &v3d_cache_clean_sched_ops,
> +					=C2=A0=C2=A0 V3D_CACHE_CLEAN,
> "v3d_cache_clean");
> =C2=A0		if (ret)
> =C2=A0			goto fail;
> =C2=A0	}
> =C2=A0
> -	ret =3D drm_sched_init(&v3d->queue[V3D_CPU].sched,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cpu_sched_ops, NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 1, job_hang_limit,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms), NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cpu", v3d->drm.dev);
> +	ret =3D v3d_queue_sched_init(v3d, &v3d_cpu_sched_ops, V3D_CPU,
> "v3d_cpu");
> =C2=A0	if (ret)
> =C2=A0		goto fail;
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> b/drivers/gpu/drm/xe/xe_execlist.c
> index a8c416a48812..809aaba59561 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -332,6 +332,15 @@ static const struct drm_sched_backend_ops
> drm_sched_ops =3D {
> =C2=A0static int execlist_exec_queue_init(struct xe_exec_queue *q)
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *sched;
> +	const struct drm_sched_init_args args =3D {
> +		.ops =3D &drm_sched_ops,
> +		.num_rqs =3D 1,
> +		.credit_limit =3D q->lrc[0]->ring.size /
> MAX_JOB_SIZE_BYTES,
> +		.hang_limit =3D XE_SCHED_HANG_LIMIT,
> +		.timeout =3D XE_SCHED_JOB_TIMEOUT,
> +		.name =3D q->hwe->name,
> +		.dev =3D gt_to_xe(q->gt)->drm.dev,
> +	};
> =C2=A0	struct xe_execlist_exec_queue *exl;
> =C2=A0	struct xe_device *xe =3D gt_to_xe(q->gt);
> =C2=A0	int err;
> @@ -346,11 +355,7 @@ static int execlist_exec_queue_init(struct
> xe_exec_queue *q)
> =C2=A0
> =C2=A0	exl->q =3D q;
> =C2=A0
> -	err =3D drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 q->lrc[0]->ring.size /
> MAX_JOB_SIZE_BYTES,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 XE_SCHED_HANG_LIMIT,
> XE_SCHED_JOB_TIMEOUT,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, q->hwe->name,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 gt_to_xe(q->gt)->drm.dev);
> +	err =3D drm_sched_init(&exl->sched, &args);
> =C2=A0	if (err)
> =C2=A0		goto err_free;
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index 50361b4638f9..869b43a4151d 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -63,13 +63,24 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
> =C2=A0		=C2=A0 atomic_t *score, const char *name,
> =C2=A0		=C2=A0 struct device *dev)
> =C2=A0{
> +	const struct drm_sched_init_args args =3D {
> +		.ops =3D ops,
> +		.submit_wq =3D submit_wq,
> +		.num_rqs =3D 1,
> +		.credit_limit =3D hw_submission,
> +		.hang_limit =3D hang_limit,
> +		.timeout =3D timeout,
> +		.timeout_wq =3D timeout_wq,
> +		.score =3D score,
> +		.name =3D name,
> +		.dev =3D dev,
> +	};
> +
> =C2=A0	sched->ops =3D xe_ops;
> =C2=A0	INIT_LIST_HEAD(&sched->msgs);
> =C2=A0	INIT_WORK(&sched->work_process_msg,
> xe_sched_process_msg_work);
> =C2=A0
> -	return drm_sched_init(&sched->base, ops, submit_wq, 1,
> hw_submission,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hang_limit, timeout, timeout_wq,
> score, name,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev);
> +	return drm_sched_init(&sched->base, &args);
> =C2=A0}
> =C2=A0
> =C2=A0void xe_sched_fini(struct xe_gpu_scheduler *sched)
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index a0ff08123f07..fcc071fc1543 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -540,12 +540,38 @@ struct drm_gpu_scheduler {
> =C2=A0	struct device			*dev;
> =C2=A0};
> =C2=A0
> +/**
> + * struct drm_sched_init_args - parameters for initializing a DRM
> GPU scheduler
> + *
> + * @ops: backend operations provided by the driver
> + * @submit_wq: workqueue to use for submission. If NULL, an ordered
> wq is
> + *	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocated and used.
> + * @num_rqs: Number of run-queues. This may be at most
> DRM_SCHED_PRIORITY_COUNT,
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 as there's usually one run-queue per priorit=
y, but may
> be less.
> + * @credit_limit: the number of credits this scheduler can hold from
> all jobs
> + * @hang_limit: number of times to allow a job to hang before
> dropping it.
> + *		This mechanism is DEPRECATED. Set it to 0.
> + * @timeout: timeout value in jiffies for submitted jobs.
> + * @timeout_wq: workqueue to use for timeout work. If NULL, the
> system_wq is used.
> + * @score: score atomic shared with other schedulers. May be NULL.
> + * @name: name (typically the driver's name). Used for debugging
> + * @dev: associated device. Used for debugging
> + */
> +struct drm_sched_init_args {
> +	const struct drm_sched_backend_ops *ops;
> +	struct workqueue_struct *submit_wq;
> +	struct workqueue_struct *timeout_wq;
> +	u32 num_rqs;
> +	u32 credit_limit;
> +	unsigned int hang_limit;
> +	long timeout;
> +	atomic_t *score;
> +	const char *name;
> +	struct device *dev;
> +};
> +
> =C2=A0int drm_sched_init(struct drm_gpu_scheduler *sched,
> -		=C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> -		=C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> -		=C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int
> hang_limit,
> -		=C2=A0=C2=A0 long timeout, struct workqueue_struct
> *timeout_wq,
> -		=C2=A0=C2=A0 atomic_t *score, const char *name, struct device
> *dev);
> +		=C2=A0=C2=A0 const struct drm_sched_init_args *args);
> =C2=A0
> =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched);
> =C2=A0int drm_sched_job_init(struct drm_sched_job *job,

