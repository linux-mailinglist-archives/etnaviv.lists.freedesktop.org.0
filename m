Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6317022B
	for <lists+etnaviv@lfdr.de>; Wed, 26 Feb 2020 16:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856026EA0A;
	Wed, 26 Feb 2020 15:19:33 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EEE6EA0A
 for <etnaviv@lists.freedesktop.org>; Wed, 26 Feb 2020 15:19:32 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j6yTC-0005WE-8j; Wed, 26 Feb 2020 16:19:30 +0100
Message-ID: <78e5e739269ee8f7467284ad88d2097e2ad991ba.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: rework perfmon query infrastructure
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Wed, 26 Feb 2020 16:19:29 +0100
In-Reply-To: <20200106104339.215511-1-christian.gmeiner@gmail.com>
References: <20200106104339.215511-1-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hi Christian,

sorry for taking so long to get around to this.

On Mo, 2020-01-06 at 11:43 +0100, Christian Gmeiner wrote:
> Report the correct perfmon domains and signals depending
> on the supported feature flags.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 9e2c2e273012 ("drm/etnaviv: add infrastructure to query perf counter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 57 ++++++++++++++++++++---
>  1 file changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index 8adbf2861bff..7ae8f347ca06 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -32,6 +32,7 @@ struct etnaviv_pm_domain {
>  };
>  
>  struct etnaviv_pm_domain_meta {
> +	unsigned int feature;
>  	const struct etnaviv_pm_domain *domains;
>  	u32 nr_domains;
>  };
> @@ -410,36 +411,78 @@ static const struct etnaviv_pm_domain doms_vg[] = {
>  
>  static const struct etnaviv_pm_domain_meta doms_meta[] = {
>  	{
> +		.feature = chipFeatures_PIPE_3D,
>  		.nr_domains = ARRAY_SIZE(doms_3d),
>  		.domains = &doms_3d[0]
>  	},
>  	{
> +		.feature = chipFeatures_PIPE_2D,
>  		.nr_domains = ARRAY_SIZE(doms_2d),
>  		.domains = &doms_2d[0]
>  	},
>  	{
> +		.feature = chipFeatures_PIPE_VG,
>  		.nr_domains = ARRAY_SIZE(doms_vg),
>  		.domains = &doms_vg[0]
>  	}
>  };
>  
> +static unsigned int num_pm_domains(const struct etnaviv_gpu *gpu)
> +{
> +	unsigned int num = 0, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(doms_meta); i++) {
> +		const struct etnaviv_pm_domain_meta *meta = &doms_meta[i];
> +
> +		if (gpu->identity.features & meta->feature)
> +			num += meta->nr_domains;
> +	}
> +
> +	return num;
> +}
> +
> +static const struct etnaviv_pm_domain *pm_domain(const struct etnaviv_gpu *gpu,
> +	unsigned int index)
> +{
> +	const struct etnaviv_pm_domain *domain = NULL;
> +	unsigned int offset = 0, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(doms_meta); i++) {
> +		const struct etnaviv_pm_domain_meta *meta = &doms_meta[i];
> +
> +		if (!(gpu->identity.features & meta->feature))
> +			continue;
> +
> +		if (meta->nr_domains < (index - offset)) {
> +			offset += meta->nr_domains;
> +			continue;
> +		}
> +
> +		domain = meta->domains + (index - offset);
> +	}
> +
> +	BUG_ON(!domain);

This is a no-go. BUG_ON is reserved for only the most severe kernel
bugs where you can't possibly continue without risking a corruption of
non-volatile state. This isn't the case here, please instead just make
the callers handle a NULL return gracefully.

Regards,
Lucas

> +
> +	return domain;
> +}
> +
>  int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
>  	struct drm_etnaviv_pm_domain *domain)
>  {
> -	const struct etnaviv_pm_domain_meta *meta = &doms_meta[domain->pipe];
> +	const unsigned int nr_domains = num_pm_domains(gpu);
>  	const struct etnaviv_pm_domain *dom;
>  
> -	if (domain->iter >= meta->nr_domains)
> +	if (domain->iter >= nr_domains)
>  		return -EINVAL;
>  
> -	dom = meta->domains + domain->iter;
> +	dom = pm_domain(gpu, domain->iter);
>  
>  	domain->id = domain->iter;
>  	domain->nr_signals = dom->nr_signals;
>  	strncpy(domain->name, dom->name, sizeof(domain->name));
>  
>  	domain->iter++;
> -	if (domain->iter == meta->nr_domains)
> +	if (domain->iter == nr_domains)
>  		domain->iter = 0xff;
>  
>  	return 0;
> @@ -448,14 +491,14 @@ int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
>  int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
>  	struct drm_etnaviv_pm_signal *signal)
>  {
> -	const struct etnaviv_pm_domain_meta *meta = &doms_meta[signal->pipe];
> +	const unsigned int nr_domains = num_pm_domains(gpu);
>  	const struct etnaviv_pm_domain *dom;
>  	const struct etnaviv_pm_signal *sig;
>  
> -	if (signal->domain >= meta->nr_domains)
> +	if (signal->domain >= nr_domains)
>  		return -EINVAL;
>  
> -	dom = meta->domains + signal->domain;
> +	dom = pm_domain(gpu, signal->domain);
>  
>  	if (signal->iter >= dom->nr_signals)
>  		return -EINVAL;

_______________________________________________
etnaviv mailing list
etnaviv@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/etnaviv
