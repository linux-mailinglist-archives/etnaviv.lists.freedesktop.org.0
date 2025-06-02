Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D903BACA9B2
	for <lists+etnaviv@lfdr.de>; Mon,  2 Jun 2025 09:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50CE10E1C7;
	Mon,  2 Jun 2025 07:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="q7RCQAus";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD10D10E1C4;
 Mon,  2 Jun 2025 07:07:08 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b9lJh2yvqz9t8V;
 Mon,  2 Jun 2025 09:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1748848020; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kq1wmnVPeTYKmV46jUPOVvQMHJU6mW0OqpZmnehPvTY=;
 b=q7RCQAus6tqiNg1QRi3EKKgzV1gHHV6MXGtmTaPOH77c+JAORuJnct3BeRuFg7p+qaNLJu
 U+qxbrKz/0OnYlHMJDMgHe8hcDC2GX6vhSwlzSefWyeq2YRy4yKqifmSxrPNG27kicD9Ai
 oMOaAZ8tt4y00f98e2jKVOtMvIFI4hWhbAhGx/NT8hNI+9VYMv6j8sCFmtPvmCyVK9TVNq
 8WrvZAIyJQl+NhFZSgKjUYQu35AVFgHT3G/bO+S9L7JxDV2g0GuwYL7YUFo0lVAg3yL8Wa
 JhZ6OAuZzFkIB1ZBa2fLTrtjGoDq3lflSet9rxIN7lXCT9bEPGDpxF7pyWjNnQ==
Message-ID: <1e0fb3c8bbbcc18b0fb771b6e2d4616a0a9a11a3.camel@mailbox.org>
Subject: Re: [PATCH v2 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Simona Vetter <simona@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 02 Jun 2025 09:06:49 +0200
In-Reply-To: <20250530-sched-skip-reset-v2-2-c40a8d2d8daa@igalia.com>
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
 <20250530-sched-skip-reset-v2-2-c40a8d2d8daa@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: e7caa072284141d545c
X-MBO-RS-META: 1pztgb7cszg759n5wufu8q19n8s3qxak
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

Hi,

thx for the update. Seems to be developing nicely. Some comments below.

On Fri, 2025-05-30 at 11:01 -0300, Ma=C3=ADra Canal wrote:
> When the DRM scheduler times out, it's possible that the GPU isn't
> hung;
> instead, a job may still be running, and there may be no valid reason
> to
> reset the hardware. This can occur in two situations:
>=20
> =C2=A0 1. The GPU exposes some mechanism that ensures the GPU is still
> making
> =C2=A0=C2=A0=C2=A0=C2=A0 progress. By checking this mechanism, the driver=
 can safely skip
> the
> =C2=A0=C2=A0=C2=A0=C2=A0 reset, re-arm the timeout, and allow the job to =
continue running
> until
> =C2=A0=C2=A0=C2=A0=C2=A0 completion. This is the case for v3d, Etnaviv, a=
nd Xe.
> =C2=A0 2. Timeout has fired before the free-job worker. Consequently, the
> =C2=A0=C2=A0=C2=A0=C2=A0 scheduler calls `timedout_job()` for a job that =
isn't timed out.
>=20
> These two scenarios are problematic because the job was removed from
> the
> `sched->pending_list` before calling `sched->ops->timedout_job()`,
> which
> means that when the job finishes, it won't be freed by the scheduler
> though `sched->ops->free_job()`. As a result, the job and its
> resources
> won't be freed, leading to a memory leak.

nit: redundant "won't bee freed"

>=20
> To resolve those scenarios, create a new `drm_gpu_sched_stat`, called

nit:
s/resolve those scenarios/solve those problems

> DRM_GPU_SCHED_STAT_NO_HANG, that allows a driver to skip the reset.
> The
> new status will indicate that the job should be reinserted into the

nit:
s/should/must

> pending list, and the hardware / driver is still responsible to
> signal job completion.

The driver is *always* responsible for signaling, well, "the hardware
fence". We could have a discussion about whether a job is "completed"
if the driver signals its hardware fence through the timedout_job()
callback, but I think it's safer to just change this sentence to:

"and the hardware / driver will still complete that job."

>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 49
> ++++++++++++++++++++++++++++++++--
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A02 files changed, 50 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index
> 3b0760dfa4fe2fc63e893cda733e78d08dd451d5..ddc53eadab7bb6a15109f43989a
> fa1f7a95a3b41 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -379,11 +379,16 @@ static void drm_sched_run_free_queue(struct
> drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0	struct drm_sched_job *job;
> =C2=A0
> -	spin_lock(&sched->job_list_lock);
> =C2=A0	job =3D list_first_entry_or_null(&sched->pending_list,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job, list=
);
> =C2=A0	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> =C2=A0		__drm_sched_run_free_queue(sched);
> +}
> +
> +static void drm_sched_run_free_queue_unlocked(struct
> drm_gpu_scheduler *sched)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	drm_sched_run_free_queue(sched);
> =C2=A0	spin_unlock(&sched->job_list_lock);
> =C2=A0}

nit:
Took me a few seconds to realize why that's necessary. A sentence in
the commit message might have been good. But no big thing, up to you

> =C2=A0
> @@ -536,6 +541,32 @@ static void drm_sched_job_begin(struct
> drm_sched_job *s_job)
> =C2=A0	spin_unlock(&sched->job_list_lock);
> =C2=A0}
> =C2=A0
> +/**
> + * drm_sched_job_reinsert_on_false_timeout - Reinsert the job on a
> false timeout
> + *

Please remove this empty line. Our docu style in those files is not
consistent, and I'd like to move towards a more unified style.

> + * @sched: scheduler instance
> + * @job: job to be reinserted on the pending list
> + *
> + * In the case of a "false timeout" - when a timeout occurs but the
> GPU isn't
> + * hung and the job is making progress, the scheduler must reinsert
> the job back
> + * into the pending list. Otherwise, the job and its resources won't
> be freed
> + * through the &drm_sched_backend_ops.free_job callback.
> + *
> + * Note that after reinserting the job, the scheduler enqueues the
> free-job
> + * work again if ready. Otherwise, a signaled job could be added to
> the pending
> + * list, but never freed.
> + *
> + * This function must be used in "false timeout" cases only.
> + */
> +static void drm_sched_job_reinsert_on_false_timeout(struct
> drm_gpu_scheduler *sched,
> +						=C2=A0=C2=A0=C2=A0 struct
> drm_sched_job *job)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	list_add(&job->list, &sched->pending_list);
> +	drm_sched_run_free_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +
> =C2=A0static void drm_sched_job_timedout(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *sched;
> @@ -569,6 +600,14 @@ static void drm_sched_job_timedout(struct
> work_struct *work)
> =C2=A0			job->sched->ops->free_job(job);
> =C2=A0			sched->free_guilty =3D false;
> =C2=A0		}
> +
> +		/*
> +		 * If the driver indicated that the GPU is still
> running and wants
> +		 * to skip the reset, reinsert the job back into the
> pending list
> +		 * and re-arm the timeout.

Doesn't sound entirely correct to me =E2=80=93 at this point, the driver it=
self
did already skip the reset. The scheduler has no control over that.

You might also just drop the comment, I think the function name and the
function's docstring make what's happening perfectly clear.

> +		 */
> +		if (status =3D=3D DRM_GPU_SCHED_STAT_NO_HANG)
> +			drm_sched_job_reinsert_on_false_timeout(sche
> d, job);
> =C2=A0	} else {
> =C2=A0		spin_unlock(&sched->job_list_lock);
> =C2=A0	}
> @@ -591,6 +630,9 @@ static void drm_sched_job_timedout(struct
> work_struct *work)
> =C2=A0 * This function is typically used for reset recovery (see the docu
> of
> =C2=A0 * drm_sched_backend_ops.timedout_job() for details). Do not call i=
t
> for
> =C2=A0 * scheduler teardown, i.e., before calling drm_sched_fini().
> + *
> + * As it's used for reset recovery, drm_sched_stop() shouldn't be
> called
> + * if the driver skipped the timeout (DRM_GPU_SCHED_STAT_NO_HANG).

s/timeout/reset

> =C2=A0 */
> =C2=A0void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
> drm_sched_job *bad)
> =C2=A0{
> @@ -676,6 +718,9 @@ EXPORT_SYMBOL(drm_sched_stop);
> =C2=A0 * drm_sched_backend_ops.timedout_job() for details). Do not call i=
t
> for
> =C2=A0 * scheduler startup. The scheduler itself is fully operational
> after
> =C2=A0 * drm_sched_init() succeeded.
> + *
> + * As it's used for reset recovery, drm_sched_start() shouldn't be
> called
> + * if the driver skipped the timeout (DRM_GPU_SCHED_STAT_NO_HANG).

same

> =C2=A0 */
> =C2=A0void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
> =C2=A0{
> @@ -1197,7 +1242,7 @@ static void drm_sched_free_job_work(struct
> work_struct *w)
> =C2=A0	if (job)
> =C2=A0		sched->ops->free_job(job);
> =C2=A0
> -	drm_sched_run_free_queue(sched);
> +	drm_sched_run_free_queue_unlocked(sched);
> =C2=A0	drm_sched_run_job_queue(sched);
> =C2=A0}
> =C2=A0
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index
> 83e5c00d8dd9a83ab20547a93d6fc572de97616e..063c1915841aa54a0859bdccd3c
> 1ef6028105bec 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -393,11 +393,14 @@ struct drm_sched_job {
> =C2=A0 * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> =C2=A0 * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
> =C2=A0 * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available
> anymore.
> + * @DRM_GPU_SCHED_STAT_NO_HANG: Contrary to scheduler's belief, the
> GPU
> + * did not hang and it's operational.

s/it's/is

> =C2=A0 */
> =C2=A0enum drm_gpu_sched_stat {
> =C2=A0	DRM_GPU_SCHED_STAT_NONE,
> =C2=A0	DRM_GPU_SCHED_STAT_RESET,
> =C2=A0	DRM_GPU_SCHED_STAT_ENODEV,
> +	DRM_GPU_SCHED_STAT_NO_HANG,
> =C2=A0};
> =C2=A0
> =C2=A0/**
>=20

Thx, I'll look through the other ones soonish, too
