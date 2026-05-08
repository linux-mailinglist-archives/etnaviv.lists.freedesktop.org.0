Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP2FNw+XAWqXfAEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Mon, 11 May 2026 10:45:03 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA3D50A44A
	for <lists+etnaviv@lfdr.de>; Mon, 11 May 2026 10:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114E210E186;
	Mon, 11 May 2026 08:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ogKWmlef";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE81410F598
 for <etnaviv@lists.freedesktop.org>; Fri,  8 May 2026 18:05:22 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8cb40149037so212330385a.2
 for <etnaviv@lists.freedesktop.org>; Fri, 08 May 2026 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778263522; x=1778868322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9oUEHji2HuAH1Squ/e2hO3APLsVoXtI85k3zSv3ekYQ=;
 b=ogKWmlef4oC+fAL/XVYkuNPiOjJPPC96efzmyOupvdUGgnbXH4GbgtBvX9GlgLU/ku
 +SQLcS4Qw7x8+HbELlKRzGOkg3ZbiO9+H9HF1siiBjdCeumB+TsxlNOBh7b4mWlBtPNb
 O5quw+p+6nLbot/jCGIehTopEN8/wuRhmtiqkpozw+PBd8oYfEIxoJtd3yZDuITJ5Pvn
 VqTuomu5F0FNHMjB2TIYuEfUuTKLpAIhuunQ+GVoY7W5mZ37Bt68Yi+8nlh1yxndkM8o
 I1WAwoy0vzI/96kEhRCmLRY5NyxorUclL2XVT1y31mTB9Q/b1rYdwOMouNjPrGqTsMdK
 9nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778263522; x=1778868322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9oUEHji2HuAH1Squ/e2hO3APLsVoXtI85k3zSv3ekYQ=;
 b=kAyFZC/iVa89OWYvAYWAx/wREP+UGy9bqZxobc48jAD/t1nCAv2vlABy5ZJFcqmJas
 69M1MkgHYxDO/+q+ioqwc9SL21yq4d980ALCu0xMrvfBggC/onF0aMJobzBiUoxWoo37
 exi9rKpvhmSoQ7pU3ym6dbhKebNOxEn0RqL2dx22mLbXtWRWGMfUoop97ratA0kzMW3M
 t4JRL5RhOXuB7RCuXB42dRI7pGkCU9UyMVbVXO62J6WnmU9cqhiQqaTDo5FpLkzEbk1M
 WhnzCltiQmfLa7EF5oJo64zoCT0YEeMn7gszAK6BT7nJgzOZVEO4McK69VJ1s47kMcoV
 2hgg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/JtCZ6y1Xc+cCWXgu7QSw1tibGXUA3S9zMGQWSzUzsQro17dKHHjA9a3xxQReXO3SYqLtVKxXj@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw74nI6XEeVZpZNifoZCY2IS6o5w4E9EvEnuOPdvukXRmB7/+1
 v+yBT2r6xSNC398cVMMqZFQMWz1XyIYqsN4xxqPVA+07pVi88VR2+kDJ
X-Gm-Gg: AeBDievQPV71gYu6Z1yoHVvZK7ulcJeHvpq2nj/IIMb40wNeNWnPUb7lFzIagz/+RBX
 35N2e0B+OXFDegUrYF5ZI9TRfrJ+k+VaYiZzmDrg4WjUPTP6XIWg5JF3aTaiKnUZjq+Rv6IplOj
 8JUPhE14XWYFZU7Vw94JcNwNCFs/L26WS/s42DYHm0ehqqjaYJwNyCRt+/YOtM8SRwassH/BZho
 Ty83TvL8VY2t/bW4qxP2ZxdyTDLWQdSkDVkolZu5Ww/mbbMkMO8LOiV3r9YUuKnfVpkwagSbd1+
 Tyd6RbzhjG2XDDnrrNxXyBihpuXR4GONaaIwtjDAFjdIzRYKc2uh3XMYU5FeIHDP6R/2TN/Wb+L
 +JThdBxmVE4M8lcLrdWNboS6QXJSahnv7KgRphX2xDdj4MIU3MjYMtBHQq5iZs+yDG9ezKkaL9U
 6tS7Bl4Tk8jbR0pWBXWXSMMqP+bUtcsDyCpjLZRYuIw9TqdJWnwKrH2SO8c7qJ5Bo71svKC8aGa
 sxixhStZZESJ38LprOATU/fFXxBcdne7x+DLeb6FhU=
X-Received: by 2002:a05:620a:1991:b0:8ef:3953:7ab with SMTP id
 af79cd13be357-907badfb1b2mr550343985a.40.1778263521386; 
 Fri, 08 May 2026 11:05:21 -0700 (PDT)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu.
 [165.124.184.136]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-907b9c542cdsm265592085a.0.2026.05.08.11.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 11:05:21 -0700 (PDT)
From: Ziyi Guo <guoziyi114@gmail.com>
X-Google-Original-From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: l.stach@pengutronix.de
Cc: linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 airlied@gmail.com, simona@ffwll.ch, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] drm/etnaviv: Honor userptr read-only at the GPU MMU
Date: Fri,  8 May 2026 18:05:18 +0000
Message-Id: <20260508180518.1417371-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 May 2026 08:45:01 +0000
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
X-Rspamd-Queue-Id: 3DA3D50A44A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.19 / 15.00];
	SEM_URIBL(3.50)[northwestern.edu:email];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[62];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:n7l8m4@u.northwestern.edu,m:linux@armlinux.org.uk,m:christiangmeiner@gmail.com,s:lists@lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[guoziyi114@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,u.northwestern.edu];
	TAGGED_RCPT(0.00)[etnaviv];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoziyi114@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_SPAM(0.00)[0.777];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,u.northwestern.edu:mid]
X-Rspamd-Action: add header
X-Spam: Yes

The IOMMU mapping for a userptr BO was installed with a hard-coded
ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE, ignoring the read-only
attribute set when the BO was created without ETNA_USERPTR_WRITE.
Build the prot mask from etnaviv_obj->userptr.ro so MMUv2 clears
MMUv2_PTE_WRITEABLE for read-only userptr BOs.

MMUv1 PTEs carry no R/W bits and its fast path skips the MMU, so
read-only cannot be enforced there; refuse such a mapping with
-ENODEV.

Fixes: a8c21a5451d8 ("drm/etnaviv: add initial etnaviv DRM driver")
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index e3572461b599..28f26d60ac05 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -269,10 +269,18 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 {
 	struct sg_table *sgt = etnaviv_obj->sgt;
 	struct drm_mm_node *node;
+	int prot = ETNAVIV_PROT_READ;
 	int ret;
 
 	lockdep_assert_held(&etnaviv_obj->lock);
 
+	if (!etnaviv_obj->userptr.ptr || !etnaviv_obj->userptr.ro)
+		prot |= ETNAVIV_PROT_WRITE;
+
+	if (etnaviv_obj->userptr.ptr && etnaviv_obj->userptr.ro &&
+	    context->global->version == ETNAVIV_IOMMU_V1)
+		return -ENODEV;
+
 	mutex_lock(&context->lock);
 
 	/* v1 MMU can optimize single entry (contiguous) scatterlists */
@@ -301,7 +309,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 
 	mapping->iova = node->start;
 	ret = etnaviv_iommu_map(context, node->start, etnaviv_obj->size, sgt,
-				ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE);
+				prot);
 
 	if (ret < 0) {
 		drm_mm_remove_node(node);
-- 
2.34.1

