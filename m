Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2F84F11BA
	for <lists+etnaviv@lfdr.de>; Mon,  4 Apr 2022 11:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6690810EBE1;
	Mon,  4 Apr 2022 09:12:51 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF15F10EBE1
 for <etnaviv@lists.freedesktop.org>; Mon,  4 Apr 2022 09:12:50 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nbIlT-00034E-OG; Mon, 04 Apr 2022 11:12:47 +0200
Message-ID: <0caef672cc44515edd7ead5dfacae09866816524.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] drm/etnaviv: Use scheduler dependency handling
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Mon, 04 Apr 2022 11:12:41 +0200
In-Reply-To: <20220331204651.2699107-2-daniel.vetter@ffwll.ch>
References: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
 <20220331204651.2699107-2-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: etnaviv@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Am Donnerstag, dem 31.03.2022 um 22:46 +0200 schrieb Daniel Vetter:
> We need to pull the drm_sched_job_init much earlier, but that's very
> minor surgery.
> 
> v2: Actually fix up cleanup paths by calling drm_sched_job_init, which
> I wanted to to in the previous round (and did, for all other drivers).
> Spotted by Lucas.
> 
> v3: Rebase over renamed functions to add dependencies.
> 
> v4: Rebase over patches from Christian.
> 
> v5: More rebasing over work from Christian.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: etnaviv@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Acked-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  4 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 51 +++++++++++--------
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 53 +-------------------
>  drivers/gpu/drm/etnaviv/etnaviv_sched.h      |  3 +-
>  4 files changed, 35 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> index 8983a0ef383e..63688e6e4580 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> @@ -80,8 +80,6 @@ struct etnaviv_gem_submit_bo {
>  	u64 va;
>  	struct etnaviv_gem_object *obj;
>  	struct etnaviv_vram_mapping *mapping;
> -	unsigned int nr_fences;
> -	struct dma_fence **fences;
>  };
>  
>  /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
> @@ -94,7 +92,7 @@ struct etnaviv_gem_submit {
>  	struct etnaviv_file_private *ctx;
>  	struct etnaviv_gpu *gpu;
>  	struct etnaviv_iommu_context *mmu_context, *prev_mmu_context;
> -	struct dma_fence *out_fence, *in_fence;
> +	struct dma_fence *out_fence;
>  	int out_fence_id;
>  	struct list_head node; /* GPU active submit list */
>  	struct etnaviv_cmdbuf cmdbuf;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 592cbb38609a..5f502c49aec2 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -188,9 +188,9 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
>  			continue;
>  
> -		ret = dma_resv_get_fences(robj,
> -					  bo->flags & ETNA_SUBMIT_BO_WRITE,
> -					  &bo->nr_fences, &bo->fences);
> +		ret = drm_sched_job_add_implicit_dependencies(&submit->sched_job,
> +							      &bo->obj->base,
> +							      bo->flags & ETNA_SUBMIT_BO_WRITE);
>  		if (ret)
>  			return ret;
>  	}
> @@ -398,8 +398,6 @@ static void submit_cleanup(struct kref *kref)
>  
>  	wake_up_all(&submit->gpu->fence_event);
>  
> -	if (submit->in_fence)
> -		dma_fence_put(submit->in_fence);
>  	if (submit->out_fence) {
>  		/* first remove from IDR, so fence can not be found anymore */
>  		mutex_lock(&submit->gpu->fence_lock);
> @@ -530,58 +528,69 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &submit->cmdbuf,
>  				  ALIGN(args->stream_size, 8) + 8);
>  	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_put;
>  
>  	submit->ctx = file->driver_priv;
>  	submit->mmu_context = etnaviv_iommu_context_get(submit->ctx->mmu);
>  	submit->exec_state = args->exec_state;
>  	submit->flags = args->flags;
>  
> +	ret = drm_sched_job_init(&submit->sched_job,
> +				 &ctx->sched_entity[args->pipe],
> +				 submit->ctx);
> +	if (ret)
> +		goto err_submit_put;
> +
>  	ret = submit_lookup_objects(submit, file, bos, args->nr_bos);
>  	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>  
>  	if ((priv->mmu_global->version != ETNAVIV_IOMMU_V2) &&
>  	    !etnaviv_cmd_validate_one(gpu, stream, args->stream_size / 4,
>  				      relocs, args->nr_relocs)) {
>  		ret = -EINVAL;
> -		goto err_submit_objects;
> +		goto err_submit_job;
>  	}
>  
>  	if (args->flags & ETNA_SUBMIT_FENCE_FD_IN) {
> -		submit->in_fence = sync_file_get_fence(args->fence_fd);
> -		if (!submit->in_fence) {
> +		struct dma_fence *in_fence = sync_file_get_fence(args->fence_fd);
> +		if (!in_fence) {
>  			ret = -EINVAL;
> -			goto err_submit_objects;
> +			goto err_submit_job;
>  		}
> +
> +		ret = drm_sched_job_add_dependency(&submit->sched_job,
> +						   in_fence);
> +		if (ret)
> +			goto err_submit_job;
>  	}
>  
>  	ret = submit_pin_objects(submit);
>  	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>  
>  	ret = submit_reloc(submit, stream, args->stream_size / 4,
>  			   relocs, args->nr_relocs);
>  	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>  
>  	ret = submit_perfmon_validate(submit, args->exec_state, pmrs);
>  	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>  
>  	memcpy(submit->cmdbuf.vaddr, stream, args->stream_size);
>  
>  	ret = submit_lock_objects(submit, &ticket);
>  	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>  
>  	ret = submit_fence_sync(submit);
>  	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>  
> -	ret = etnaviv_sched_push_job(&ctx->sched_entity[args->pipe], submit);
> +	ret = etnaviv_sched_push_job(submit);
>  	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>  
>  	submit_attach_object_fences(submit);
>  
> @@ -595,7 +604,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		sync_file = sync_file_create(submit->out_fence);
>  		if (!sync_file) {
>  			ret = -ENOMEM;
> -			goto err_submit_objects;
> +			goto err_submit_job;
>  		}
>  		fd_install(out_fence_fd, sync_file->file);
>  	}
> @@ -603,7 +612,9 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	args->fence_fd = out_fence_fd;
>  	args->fence = submit->out_fence_id;
>  
> -err_submit_objects:
> +err_submit_job:
> +	drm_sched_job_cleanup(&submit->sched_job);
> +err_submit_put:
>  	etnaviv_submit_put(submit);
>  
>  err_submit_ww_acquire:
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index a8452ce10e3a..72e2553fbc98 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -17,48 +17,6 @@ module_param_named(job_hang_limit, etnaviv_job_hang_limit, int , 0444);
>  static int etnaviv_hw_jobs_limit = 4;
>  module_param_named(hw_job_limit, etnaviv_hw_jobs_limit, int , 0444);
>  
> -static struct dma_fence *
> -etnaviv_sched_dependency(struct drm_sched_job *sched_job,
> -			 struct drm_sched_entity *entity)
> -{
> -	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
> -	struct dma_fence *fence;
> -	int i;
> -
> -	if (unlikely(submit->in_fence)) {
> -		fence = submit->in_fence;
> -		submit->in_fence = NULL;
> -
> -		if (!dma_fence_is_signaled(fence))
> -			return fence;
> -
> -		dma_fence_put(fence);
> -	}
> -
> -	for (i = 0; i < submit->nr_bos; i++) {
> -		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
> -		int j;
> -
> -		for (j = 0; j < bo->nr_fences; j++) {
> -			if (!bo->fences[j])
> -				continue;
> -
> -			fence = bo->fences[j];
> -			bo->fences[j] = NULL;
> -
> -			if (!dma_fence_is_signaled(fence))
> -				return fence;
> -
> -			dma_fence_put(fence);
> -		}
> -		kfree(bo->fences);
> -		bo->nr_fences = 0;
> -		bo->fences = NULL;
> -	}
> -
> -	return NULL;
> -}
> -
>  static struct dma_fence *etnaviv_sched_run_job(struct drm_sched_job *sched_job)
>  {
>  	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
> @@ -132,29 +90,22 @@ static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)
>  }
>  
>  static const struct drm_sched_backend_ops etnaviv_sched_ops = {
> -	.dependency = etnaviv_sched_dependency,
>  	.run_job = etnaviv_sched_run_job,
>  	.timedout_job = etnaviv_sched_timedout_job,
>  	.free_job = etnaviv_sched_free_job,
>  };
>  
> -int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
> -			   struct etnaviv_gem_submit *submit)
> +int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
>  {
>  	int ret = 0;
>  
>  	/*
>  	 * Hold the fence lock across the whole operation to avoid jobs being
>  	 * pushed out of order with regard to their sched fence seqnos as
> -	 * allocated in drm_sched_job_init.
> +	 * allocated in drm_sched_job_arm.
>  	 */
>  	mutex_lock(&submit->gpu->fence_lock);
>  
> -	ret = drm_sched_job_init(&submit->sched_job, sched_entity,
> -				 submit->ctx);
> -	if (ret)
> -		goto out_unlock;
> -
>  	drm_sched_job_arm(&submit->sched_job);
>  
>  	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.h b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> index c0a6796e22c9..baebfa069afc 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> @@ -18,7 +18,6 @@ struct etnaviv_gem_submit *to_etnaviv_submit(struct drm_sched_job *sched_job)
>  
>  int etnaviv_sched_init(struct etnaviv_gpu *gpu);
>  void etnaviv_sched_fini(struct etnaviv_gpu *gpu);
> -int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
> -			   struct etnaviv_gem_submit *submit);
> +int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit);
>  
>  #endif /* __ETNAVIV_SCHED_H__ */


