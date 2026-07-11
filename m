Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oggrIoEHVGpahAMAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:41 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D1A745FB3
	for <lists+etnaviv@lfdr.de>; Sun, 12 Jul 2026 23:30:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HwBiHjyd;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED58110E4EE;
	Sun, 12 Jul 2026 21:30:38 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093BA89A1F;
 Sat, 11 Jul 2026 18:45:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BE3B1436AC;
 Sat, 11 Jul 2026 18:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9E11F000E9;
 Sat, 11 Jul 2026 18:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783795542;
 bh=6Gq4ADgsF216KVXDCQvsNulS1k0GIw7kWSrVwfWrShU=;
 h=From:Subject:Date:To:Cc;
 b=HwBiHjydO82LFji0UszYF+rut4yPEXSI9+yS+Eeji5ZCbyrT7X+W6u1SUhVQrniFh
 k7zXkJTLpkdkF17TCk/BE+KcBy5UxuqcCjXmdN5PS9ECGxuOXb2w3UmsQyrZZxq7/t
 c+KqnJP4WL+6PC8X11/5T9fjXKiXHAd7Xpt/IXxNiG+CVT7P4gTg2l4JBZQF5qRc7Q
 jPA9ta75uC74wIyT42vdmuOfCbRm4RxExyPtvpLAMrtRGgX9U5roby63Qt1Y3NlQfu
 ZTdoDsuPZHxU6x5M8BAHXT6+GUlCHjJtm0CqjR6W2GWRZYz7riaLxSYOABQQKBAl2z
 Lovf7UvBmWVMw==
From: Lorenzo Stoakes <ljs@kernel.org>
Subject: [PATCH v2 00/13] mm: convert more vm_flags_t users to vma_flags_t
Date: Sat, 11 Jul 2026 19:44:57 +0100
Message-Id: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACmPUmoC/yWNwQ6CMBAFf4Xs2TZtFYqe/A/DAcq2FIGaLTYaw
 r8LeJxk3rwFIpLHCLdsAcLkow/TBuqUgenqySHz7caghCqElpI1F5bGmtmhdpGNI2takZ/LvLV
 Xa2BbvQit/xzFR/Xn+G56NPOe2Y3OxznQ97hMcvfAhITEpS6VLkShBXd+5kMf70+kCQceyEG1r
 usP7sodQ68AAAA=
X-Change-ID: 20260711-b4-vma-flags-mm-bd05385df9fc
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Helge Deller <deller@gmx.de>, Kees Cook <kees@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
 linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9041; i=ljs@kernel.org;
 h=from:subject:message-id; bh=LqsBGIOBz5PhtEm4kn0sretpylkcze+o2dhAS4zKBkg=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKC+i02/1R97n5LZdUBvaNhKqyiTOKbuqcr+39vmCDrN
 C/ldFJnRykLgxgXg6yYIsvzL+L7g0TC5nVe8HeDmcPKBDKEgYtTACYy7TDDP8WyBX46r8L/TZLs
 cZaTWbaR54Fcv03k49BlKk/5xW3LKhkZ3pq+mhJ2N67ur3lDuMiZzJwFGnk8BsunfPLc6v+h6dI
 LDgA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-Mailman-Approved-At: Sun, 12 Jul 2026 21:30:36 +0000
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[26];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,alpha.franken.de,kvack.org,zeniv.linux.org.uk,suse.cz,linux.alibaba.com,suse.de,linux.dev,nvidia.com,redhat.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,linux.intel.com,ffwll.ch,pengutronix.de,armlinux.org.uk,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,poorly.run,somainline.org,ideasonboard.com,rock-chips.com,sntech.de,collabora.com,chromium.org,broadcom.com,epam.com,gmx.de,perex.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[101];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17D1A745FB3

This series makes further progress in converting usage of the deprecated
vm_flags_t type to its replacement, vma_flags_t.

It focuses on mm, though updates some users of mm APIs also.

It updates:

* The core do_mmap() code path for VMA mapping.
* Unmapped area logic.
* The usage of mm->def_vma_flags.
* VMA page protection bit logic.
* General usage of VMA flags in core mm code, mlock, mprotect, mremap.

REVIEWER/MERGER NOTE: This is dependent on [0], which must be merged before
this.

[0]:https://lore.kernel.org/linux-mm/20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org/

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
Changes in v2:
* Rebased on to mm-new that has the 33 patch rework dependency in it.
* Distributed tags, thanks everybody!
* Moved VMA_STACK_INCOMPLETE_SETUP and VMA_STACK_EARLY VMA userland test defines
  from 1/13 to 9/13 as per Zi.
* Fixed whitespace in 3/13 as per Zi.
* Updated 5/13 to use %*pb formatter for VMA flags (to match mm flags formatter)
  in dump_mm(), as per Lance.
* Updated 8/13 to update panthor_gem.c to vma_get_page_prot() as per Lance.
* Fixed up comment type in 11/13 as per Lance.
* Fixed bug of using VMA_GROWSUP_BIT rather than VMA_GROWSUP as per Lance
  in 12/13.
* Added detail about when we are and are not required to open code
  vma_write_lock() for VMA flag mutators in the commit message for 13/13 as
  per Lance and Zi.

v1:
https://patch.msgid.link/cover.1782760670.git.ljs@kernel.org

To: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@kernel.org>
To: "Liam R. Howlett" <liam@infradead.org>
To: Vlastimil Babka <vbabka@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
To: Michal Hocko <mhocko@suse.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Benjamin LaHaise <bcrl@kvack.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>
To: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
To: Hugh Dickins <hughd@google.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Jann Horn <jannh@google.com>
To: Pedro Falcato <pfalcato@suse.de>
To: Muchun Song <muchun.song@linux.dev>
To: Oscar Salvador <osalvador@suse.de>
To: Zi Yan <ziy@nvidia.com>
To: Nico Pache <npache@redhat.com>
To: Ryan Roberts <ryan.roberts@arm.com>
To: Dev Jain <dev.jain@arm.com>
To: Barry Song <baohua@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
To: Usama Arif <usama.arif@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
To: Russell King <linux+etnaviv@armlinux.org.uk>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
To: Inki Dae <inki.dae@samsung.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Lyude Paul <lyude@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Sandy Huang <hjc@rock-chips.com>
To: Heiko Stübner <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>
To: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
To: Chia-I Wu <olvaffe@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Matthew Brost <matthew.brost@intel.com>
To: Thomas Hellström <thomas.hellstrom@linux.intel.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
To: Helge Deller <deller@gmx.de>
To: Kees Cook <kees@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: ljs@kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-aio@kvack.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: dri-devel@lists.freedesktop.org
Cc: etnaviv@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Cc: virtualization@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
Cc: xen-devel@lists.xenproject.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-sound@vger.kernel.org

---
Lorenzo Stoakes (13):
      mm: introduce vma_flags_can_grow() and vma_can_grow()
      mm/vma: update do_mmap() to use vma_flags_t
      mm: convert __get_unmapped_area() to use vma_flags_t
      mm: update generic_get_unmapped_area[_topdown]() to use vma_flags_t
      mm: prefer mm->def_vma_flags in mm logic
      mm/vma: convert vm_pgprot_modify() to use vma_flags_t and rename
      mm/vma: rename vma_get_page_prot to vma_flags_to_page_prot
      mm: introduce vma_get_page_prot() and use it
      mm/vma: update create_init_stack_vma() to use vma_flags_t
      mm/vma: convert miscellaneous uses of VMA flags in core mm
      mm/mlock: convert mlock code to use vma_flags_t
      mm/mprotect: convert mprotect code to use vma_flags_t
      mm/mremap: convert mremap code to use vma_flags_t

 arch/mips/kernel/vdso.c                     |   4 +-
 arch/powerpc/mm/book3s64/slice.c            |   6 +-
 drivers/gpu/drm/drm_gem.c                   |   2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c        |   2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c      |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c     |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c    |  12 +-
 drivers/gpu/drm/msm/msm_gem.c               |   2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c       |   2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c        |   2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c          |   6 +-
 drivers/gpu/drm/panthor/panthor_gem.c       |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |   2 +-
 drivers/gpu/drm/tegra/gem.c                 |   2 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c       |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c  |   2 +-
 drivers/gpu/drm/xe/xe_device.c              |   2 +-
 drivers/gpu/drm/xe/xe_mmio_gem.c            |   2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c     |   2 +-
 drivers/video/fbdev/core/fb_io_fops.c       |   2 +-
 fs/aio.c                                    |   2 +-
 fs/hugetlbfs/inode.c                        |   3 +-
 include/linux/huge_mm.h                     |  10 +-
 include/linux/memfd.h                       |   6 +-
 include/linux/mm.h                          |  52 +++++++--
 include/linux/sched/mm.h                    |  13 +--
 ipc/shm.c                                   |   3 +-
 mm/debug.c                                  |   5 +-
 mm/huge_memory.c                            |  21 ++--
 mm/memfd.c                                  |  15 +--
 mm/mlock.c                                  |  99 +++++++++--------
 mm/mmap.c                                   | 164 +++++++++++++++-------------
 mm/mprotect.c                               |  16 +--
 mm/mremap.c                                 |  38 ++++---
 mm/nommu.c                                  |   3 +-
 mm/util.c                                   |  10 +-
 mm/vma.c                                    |  26 +++--
 mm/vma.h                                    |   8 +-
 mm/vma_exec.c                               |  20 ++--
 sound/core/memalloc.c                       |   2 +-
 tools/testing/vma/include/dup.h             |  23 ++--
 42 files changed, 341 insertions(+), 264 deletions(-)
---
base-commit: 61cccb8363fcc282d4ae0555b8739dd227f5ad0b
change-id: 20260711-b4-vma-flags-mm-bd05385df9fc

Cheers,
-- 
Lorenzo Stoakes <ljs@kernel.org>

