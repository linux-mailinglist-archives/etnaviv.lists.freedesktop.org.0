Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BC643833D
	for <lists+etnaviv@lfdr.de>; Sat, 23 Oct 2021 12:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95E06E2A3;
	Sat, 23 Oct 2021 10:43:45 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 2527 seconds by postgrey-1.36 at gabe;
 Tue, 12 Oct 2021 14:10:09 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F156E840;
 Tue, 12 Oct 2021 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zdyIb3oBp/BlhX+9vAWcoi+2YMxkU/gWhCNIxQ8QZIA=; b=1SzKqwy49mR9hLimaYa6nIcEoG
 ZzTyXMSvESwGxAbUNsMcjkBz5AKXdIR4eoSnnOTXgjuWINrVKBuriP1R6f3y/mg59PD5Z6guQj5Rq
 gpFnvFpG5a3EWQp2UJ+rMOcpGxuvXG5xi2AnFCEq5Bp8KPE5siH4BejF0yNSz0M0cCWLJoVLgf1OD
 IrLUDkilD3RjNg8B4TxrkeiLKHBICBPTM0NIbhUoMqxVRHTbc2NGv6qPZz5r926Jm+zmY871pT4Nl
 osAw/hDJo1a6J5HU/awRLBKUL3YMKd4cMaBN7ej+WJlC2gr+PxLwcLvArTfoGZ+s0oGfQliJ3w77q
 7Tj1jlvw==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1maHom-0001tq-7C; Tue, 12 Oct 2021 16:27:44 +0300
MIME-Version: 1.0
Date: Tue, 12 Oct 2021 16:27:41 +0300
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robdclark@gmail.com, sean@poorly.run, tomba@kernel.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: Remove redundant 'flush_workqueue()' calls
In-Reply-To: <75e8ba40076ad707d47e3a3670e6b23c1b8b11bc.1633874223.git.christophe.jaillet@wanadoo.fr>
References: <75e8ba40076ad707d47e3a3670e6b23c1b8b11bc.1633874223.git.christophe.jaillet@wanadoo.fr>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <7da16f9598241be144f67398efb24164@iki.fi>
X-Sender: jyri.sarha@iki.fi
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Mailman-Approved-At: Sat, 23 Oct 2021 10:43:44 +0000
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

On 2021-10-10 16:59, Christophe JAILLET wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> @@
> expression E;
> @@
> - 	flush_workqueue(E);
> 	destroy_workqueue(E);
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

For tilcdc
Acked-by: Jyri Sarha <jyri.sarha@iki.fi>

Thanks,
Jyri

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 1 -
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 1 -
>  drivers/gpu/drm/msm/edp/edp_ctrl.c    | 1 -
>  drivers/gpu/drm/msm/hdmi/hdmi.c       | 4 +---
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c   | 4 +---
>  drivers/gpu/drm/vmwgfx/ttm_memory.c   | 1 -
>  6 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 789acae37f55..06bde46df451 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1733,7 +1733,6 @@ static void etnaviv_gpu_unbind(struct device
> *dev, struct device *master,
> 
>  	DBG("%s", dev_name(gpu->dev));
> 
> -	flush_workqueue(gpu->wq);
>  	destroy_workqueue(gpu->wq);
> 
>  	etnaviv_sched_fini(gpu);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index c86b5090fae6..462ea65ebf89 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1925,7 +1925,6 @@ void msm_dsi_host_destroy(struct mipi_dsi_host 
> *host)
>  	DBG("");
>  	dsi_tx_buf_free(msm_host);
>  	if (msm_host->workqueue) {
> -		flush_workqueue(msm_host->workqueue);
>  		destroy_workqueue(msm_host->workqueue);
>  		msm_host->workqueue = NULL;
>  	}
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index fe1366b4c49f..07129a6e5dbb 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -1190,7 +1190,6 @@ void msm_edp_ctrl_destroy(struct edp_ctrl *ctrl)
>  		return;
> 
>  	if (ctrl->workqueue) {
> -		flush_workqueue(ctrl->workqueue);
>  		destroy_workqueue(ctrl->workqueue);
>  		ctrl->workqueue = NULL;
>  	}
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
> b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 737453b6e596..5ba7c8f28419 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -61,10 +61,8 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
>  	 * at this point, hpd has been disabled,
>  	 * after flush workq, it's safe to deinit hdcp
>  	 */
> -	if (hdmi->workq) {
> -		flush_workqueue(hdmi->workq);
> +	if (hdmi->workq)
>  		destroy_workqueue(hdmi->workq);
> -	}
>  	msm_hdmi_hdcp_destroy(hdmi);
> 
>  	if (hdmi->phy_dev) {
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index 6b03f89a98d4..3ddb7c710a3d 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -186,10 +186,8 @@ static void tilcdc_fini(struct drm_device *dev)
>  	if (priv->mmio)
>  		iounmap(priv->mmio);
> 
> -	if (priv->wq) {
> -		flush_workqueue(priv->wq);
> +	if (priv->wq)
>  		destroy_workqueue(priv->wq);
> -	}
> 
>  	dev->dev_private = NULL;
> 
> diff --git a/drivers/gpu/drm/vmwgfx/ttm_memory.c
> b/drivers/gpu/drm/vmwgfx/ttm_memory.c
> index edd17c30d5a5..7f7fe35fc21d 100644
> --- a/drivers/gpu/drm/vmwgfx/ttm_memory.c
> +++ b/drivers/gpu/drm/vmwgfx/ttm_memory.c
> @@ -468,7 +468,6 @@ void ttm_mem_global_release(struct ttm_mem_global 
> *glob)
>  	struct ttm_mem_zone *zone;
>  	unsigned int i;
> 
> -	flush_workqueue(glob->swap_queue);
>  	destroy_workqueue(glob->swap_queue);
>  	glob->swap_queue = NULL;
>  	for (i = 0; i < glob->num_zones; ++i) {
