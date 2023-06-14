Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7C673057B
	for <lists+etnaviv@lfdr.de>; Wed, 14 Jun 2023 18:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1457010E152;
	Wed, 14 Jun 2023 16:53:44 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
X-Greylist: delayed 439 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jun 2023 16:53:40 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBD589131
 for <etnaviv@lists.freedesktop.org>; Wed, 14 Jun 2023 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AR8QRqbW1yXBNO88g9z3TQccGrksSHt3oK1md7nsOUs=; b=AvM3MRfA5oxs5DIo1GFgpPpUAi
 uo7/bIe8f+e7jQ1KfRsxTsnXQTyPb8cBznbipFjmWJTS34KCF1BtbDFvOYRj4+m0jLcgaCFl7MM8K
 fjBFtFn3Btti8j7tkJQMgHr6yCPEza6ianXq8SRJB+CcOS8j9cFq2xlRIEVjVJIbWZ3nEys5Tz/Xx
 PSEqfIaKiMHI5snKJ2AjPF7FW8ZWK4W/NvuzcUKG6wAuW5A1+c5ca+7h9FyYjyaCA+CLnTYfYZfox
 KgUOC/lGfPgaJg9WED5dhqceRHtxBM8MmEgr2bKR5uVqbN4PWkK2xmH7mWC/NYRlbYq8JcEgnPg7M
 jbcwPHkg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50712)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1q9TdP-000219-Lk; Wed, 14 Jun 2023 17:46:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1q9TdO-0000aR-LS; Wed, 14 Jun 2023 17:46:14 +0100
Date: Wed, 14 Jun 2023 17:46:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: disable MLCG and pulse eater on GPU reset
Message-ID: <ZInu1lTjiV/UDPI2@shell.armlinux.org.uk>
References: <20230607125841.3518385-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607125841.3518385-1-l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, Jun 07, 2023 at 02:58:41PM +0200, Lucas Stach wrote:
> Module level clock gating and the pulse eater might interfere with
> the GPU reset, as they both have the potential to stop the clock
> and thus reset propagation to parts of the GPU.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> I'm not aware of any cases where this would have been an issue, but
> it is what the downstream driver does and fundametally seems like
> the right thing to do.

Maybe Dove, where the PLLs generating the clock to the GPU can be
changed, iirc?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
