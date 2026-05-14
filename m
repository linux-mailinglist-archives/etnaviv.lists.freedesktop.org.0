Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHozImUlDGoIXQUAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 19 May 2026 10:55:01 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E757A95A
	for <lists+etnaviv@lfdr.de>; Tue, 19 May 2026 10:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8BB10E39B;
	Tue, 19 May 2026 08:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="MKWJK1wn";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676F210E3BA
 for <etnaviv@lists.freedesktop.org>; Thu, 14 May 2026 13:14:58 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-651b17f1bcdso1177520d50.3
 for <etnaviv@lists.freedesktop.org>; Thu, 14 May 2026 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1778764497; x=1779369297;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=29KtfuJlXrDbhr12CTsDbe7NtrYpv9Xo28OIJR4h52E=;
 b=MKWJK1wngZACbYxQaxPF0/O2uKkeymOLdBZ+VpIw8LihYulpm3v8UfsxsCXGDWPoNn
 bDEL3jL9vwUt9E4JryNTHYx7VBU8qoa8qbAjlT3a539/t6nyXfFzcZezYunMM2xPbZPk
 Lg2FquLrfhZGyRQ5TtUka7ygghm3bIKaBDiW42gCJumXqBkMkIw+HzKA2sqgmEja7kvD
 oAHuGqj/8w4RzD55etxT1l1R1ZfERReIASjVbjd2opZQNeyBCpw3tQXDgc0POSjbBlAv
 9urJNNQGyzRWTGs82IEiI0bTtKHxrqxcf1YV7B+52rb6onuaoJLMxTbkTPrU+ZAgZ04S
 zi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778764497; x=1779369297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29KtfuJlXrDbhr12CTsDbe7NtrYpv9Xo28OIJR4h52E=;
 b=BAUKCQ5gIcz/MZvgMfKvTzo10FpAINX+BcqygRx94ekzJAv+FXxvmR6DREEToNbsz0
 wEjcfvDsivutBfHz9J5eqTmrdyrUfm93Zs0kwl6ObRkysaQueE3PtNobVbvEvCjXx4yG
 bLCRObw4lCmJ1HAQmTkJCH3Bx04RQPZOrhLu+uBse2uQUiPlc8GwhMLe6xxiNh/azht/
 KKBGr2tdl+KyQ23esEF4sjYtE7TLGok/Mf8RbbmATLrgP3A6u/KiHFGGQroyGXEv766i
 l3K2QwG7GL3Mk0zbofUE4CJWC8MB3fUHMfV98gVWa4737ClYyqpj4FecgU9negLdG+jH
 TnDQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/L67MjRGwHr/7HLyr8jbf8keyGub8mltfmwPLxge/IqV3pYpybHbkt/J+4ucHBGCgXuMPaPJOM@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy46/V3OEe1LZx20D2w81bVzWl6KpvW6I2TKw+X68kIFGuRYFhy
 9S3wnKWCDzkDZLjblYAywoAWQPjsIWPYQR7CfEuMu9IHPA/Gxr+mkYBntO3BgIxFKC1G
X-Gm-Gg: Acq92OGueNanEtSPmM0CrzqYTXDDIm0Wi2jiCUoZZVyyLCj6D8sFGNR9Dqk9Pn3fn4/
 zOXJyoBnQ5NPGPzM4CwNSNLOrfc7/ctkvOo9sM6XyGS6mSHxDa7mWr6BcJxp3lKVOSNsIjWwNeQ
 80Rkhq8KYcOpGzr3ZIm3Q4Mv79xKA50A+b2ZQqPpjpDasdR15AHpQwVi3QTTDPtiGQpq3CRrxPs
 i98sPKQZU2YYlSQwROhkXZdZ/mMOXfUPd5yHHpPSx5vs/E1j0hozRmMPiDjluMNnqpsF72FHu2+
 d+pfRNTc/VbydjbdfqFLkTI3dQX5yf1blAPQ/5i7A5Dj1YvOnT0ak/28qNWuO1JK+tVfdHf5PCM
 jZGmvBozh/IullhEtLuJLYV+e0HxeKmXjwgnf9urq/k+aFIds4Zt8jMETxmyLFO0DYQcy9BrDwe
 xhtZ3IyuqaPBixLpH+zkHjdS0shmqodjl4m+zoUrx5tz+lcDHgeGmf9RJXnPq2/7XYQDX3Jnnuw
 SoWB3hAHwv1HlI=
X-Received: by 2002:a05:690e:4004:b0:65c:ca50:a6 with SMTP id
 956f58d0204a3-65df61e049amr4748006d50.2.1778764497126; 
 Thu, 14 May 2026 06:14:57 -0700 (PDT)
Received: from kelso.tail8e61da.ts.net
 (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-65e0db69f26sm1009573d50.17.2026.05.14.06.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 06:14:55 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/etnaviv: honor read-only userptr flag in GPU MMU
 mapping
Date: Thu, 14 May 2026 09:14:01 -0400
Message-ID: <20260514131401.2660079-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 May 2026 08:54:58 +0000
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
X-Spamd-Result: default: False [3.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[115];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[northecho-dev.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux@armlinux.org.uk,m:christiangmeiner@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	DMARC_NA(0.00)[northecho.dev];
	FORGED_SENDER(0.00)[clusk@northecho.dev,etnaviv-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[clusk@northecho.dev,etnaviv-bounces@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[etnaviv];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[northecho-dev.20251104.gappssmtp.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: DC4E757A95A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A userptr buffer object created with ETNA_USERPTR_READ (no
ETNA_USERPTR_WRITE) is pinned without FOLL_WRITE in
etnaviv_gem_userptr_get_pages(); the kernel agrees to allow only
read access to the underlying user pages, and the state is
recorded as etnaviv_obj->userptr.ro = true.

etnaviv_iommu_map_gem() then maps the object's sg_table into
the GPU MMU with ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE
unconditionally, regardless of userptr.ro. A submission that
names the BO as a write target therefore causes the GPU to write
pages that the kernel pinned without write permission, including
page-cache pages of files the caller has only read access to.

The ioctl entry points (DRM_ETNAVIV_GEM_NEW_USERPTR, GEM_SUBMIT)
are DRM_RENDER_ALLOW, so the path is reachable from any
unprivileged render-group user. No intervening permission check,
no RO-aware branch, no MMU-level fallback.

This is the same class shape as drivers/accel/ivpu
commit 7dd57d7a6350 ("accel/ivpu: Disallow re-exporting imported GEM objects"),
fixed 2026-04-30. The Etnaviv manifestation has a simpler trigger
path that does not require PRIME re-import. Source-level analysis
only - no Vivante hardware was available to validate the mutation
primitive end-to-end.

Mask ETNAVIV_PROT_WRITE in the call to etnaviv_iommu_map() when
the buffer originates as a read-only userptr. The userptr.mm
check guards against any non-userptr object that might somehow
have userptr.ro set.

This work is LLM-assisted: Codex (gpt-5.5) drove the static
analysis and class sweep that identified the candidate site;
Claude (claude-opus-4-7) drove the writeup and patch refinement.
Operator review at each gate. Methodology context at
https://northecho.dev/posts/codex-vs-claude-code-vuln-research/.
Posted to the public list per the security-bugs.rst exception
for findings trivial to discover via automated tooling, as
interpreted by the kernel security team for LLM-assisted reports.

Signed-off-by: Christopher Lusk <clusk@northecho.dev>
Assisted-by: Codex:gpt-5.5
Assisted-by: Claude:claude-opus-4-7
---
v7.1-rc2 reference: drivers/gpu/drm/etnaviv/etnaviv_mmu.c:303-304

Open questions for review:

1. v1 MMU shortcut. etnaviv_iommu_map_gem() takes a shortcut for
   v1 MMU + single-segment sg_table at lines 278-291, bypassing
   etnaviv_iommu_map() entirely and using sg_dma_address directly.
   For typical multi-page userptr BOs sgt->nents > 1 so the
   shortcut is not taken, but for small contiguous regions on v1
   MMU hardware it may apply. This patch does not address the v1
   MMU path. If you believe v1 MMU also needs handling, I am happy
   to follow up with a separate patch.

2. ETNA_SUBMIT_BO_WRITE per-BO flag. etnaviv_gem_submit accepts
   ETNA_SUBMIT_BO_READ / ETNA_SUBMIT_BO_WRITE per buffer object,
   currently used for synchronization dependency tracking. Should
   a submit naming an RO userptr BO with ETNA_SUBMIT_BO_WRITE be
   rejected at submit time as defense-in-depth? Orthogonal to
   this patch; happy to follow up with a separate small patch in
   etnaviv_gem_submit.c if you would like that.

3. Fixes: tag. My v7.1-rc2 clone is shallow; I could not trace
   the introducing commit for the userptr.ro / ETNA_USERPTR_WRITE
   distinction. The bug is present in v7.0, v7.1-rc2, and
   linux-next (2026-05-08). If you have the introducing commit
   handy from deep Etnaviv history, please add the Fixes: tag in
   your applied version, or let me know and I will supply it from
   an unshallowed mirror.

A reviewer with Vivante hardware can confirm the primitive with
the following pseudocode (before/after this patch):

  fd = open("/dev/dri/renderD128", O_RDWR);
  ptr = mmap(...);  /* page-aligned, page-cache-backed file */
  bo_handle = drm_ioctl(fd, DRM_IOCTL_ETNAVIV_GEM_USERPTR,
                        .ptr = ptr, .size = page,
                        .flags = ETNA_USERPTR_READ);
  /* GEM_SUBMIT with the BO listed as ETNA_SUBMIT_BO_WRITE and a
     command stream that writes to the BO GPU VA */
  drm_ioctl(fd, DRM_IOCTL_ETNAVIV_GEM_SUBMIT, ...);
  /* observe: on unpatched kernel, ptr contents have changed;
              on patched kernel, the write does not land in the
              user page-cache pages. */

I am happy to source a Vivante board (Sabre Lite, Wandboard,
HummingBoard Pro) and post a v2 with Tested-by trailers if you
prefer hardware validation before this lands. Source-only is
offered first to avoid asking for a hardware-spend decision that
may not be necessary.

 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index e3572461b599..c4dcb7ee3e49 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -301,7 +301,9 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 
 	mapping->iova = node->start;
 	ret = etnaviv_iommu_map(context, node->start, etnaviv_obj->size, sgt,
-				ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE);
+				(etnaviv_obj->userptr.mm && etnaviv_obj->userptr.ro) ?
+				ETNAVIV_PROT_READ :
+				(ETNAVIV_PROT_READ | ETNAVIV_PROT_WRITE));
 
 	if (ret < 0) {
 		drm_mm_remove_node(node);
-- 
2.54.0

