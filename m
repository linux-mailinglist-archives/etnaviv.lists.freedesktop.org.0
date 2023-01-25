Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C067E6A4
	for <lists+etnaviv@lfdr.de>; Fri, 27 Jan 2023 14:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AC610E984;
	Fri, 27 Jan 2023 13:26:42 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AE710E756
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Jan 2023 08:38:57 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-4b34cf67fb6so179869177b3.6
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Jan 2023 00:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gBh0+9Ej4fdZiBcL1FEtjjBddEyxpct0JkyXcSRf3Wg=;
 b=lB4btchvNlTfCRHflexrgCXbRXFvyy8g1gFK/OMeKiIJNh1tqeN9E/OUXMnf2U4uji
 YYT9ZG6Uz9BNIXcJPuB6IBGSNwEdssClBGTD7I8F8xN9feCnsNR77DeUemH49gSW7JIZ
 i8Fyk+8dX7xmZBgb/4LlxS50DWuY+p/ZAvE5rke3AXUvgG50Y7E3pTP3J2Z3NRLwRPG+
 tuCoTtjvQeclLyeusopPtZIO8LUuu13+9dnLJ2g+6d0g96WjPTO8eD8l7HbwyilzSGVH
 oGzLOV4is7gwgAYTgd7llD5IZe+pWMCF81FsE6KNSAjCT9NY1E+DcM18ZvHUvuruVpcX
 WOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gBh0+9Ej4fdZiBcL1FEtjjBddEyxpct0JkyXcSRf3Wg=;
 b=nOFF0n5IXphA3pEZZewTM8Pr0fAe6qpa4QPbJcrShGX8MHGDgZxy2ROxMxqPygqpeH
 6gaFwjQHPTCl0T8qcld6wfWBPxuXc0IW/jF7yfo1qxm8qursWgmSL5PSOsMZABAWM93d
 nx1R4AiFNLCKsb6Vj4zq85mp14y60if4wFPgaC6Y8b95FVbPMLP37XHMHvZY48DH+qeh
 nKflovSamgHqK4AVScZoa0jvmZn0wJ6tipBMlFYd3f2HIfWaERn7kMVtNGyWDN5kHWHj
 TJNOp9ifbB77ZeO6wWkEXrEwTelCfPu1E34A72Mz4n9kPFhPMnAf1/qqiVnjrlZ3ORUk
 Dyzw==
X-Gm-Message-State: AFqh2kqKpE3dBR1e0MQySLjgkp9WJqs9k/eynl68pLquhkkRWq3QGxtP
 g5MDB4CceuGu+LHN8mQ0PpQT6vm7QTM=
X-Google-Smtp-Source: AMrXdXtLI+TT5dUaC9pRI2aKjkmKt7tjdC79b+se6AwZUh4jJJgCSUqcAubWc2ByjewYclrfSPgwiLKmrmw=
X-Received: from surenb-desktop.mtv.corp.google.com
 ([2620:15c:211:200:f7b0:20e8:ce66:f98])
 (user=surenb job=sendgmr) by 2002:a05:6902:34f:b0:6f9:7bf9:8fc7 with SMTP id
 e15-20020a056902034f00b006f97bf98fc7mr3373858ybs.279.1674635936246; Wed, 25
 Jan 2023 00:38:56 -0800 (PST)
Date: Wed, 25 Jan 2023 00:38:45 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f-goog
Message-ID: <20230125083851.27759-1-surenb@google.com>
Subject: [PATCH v2 0/6] introduce vm_flags modifier functions
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 27 Jan 2023 13:26:37 +0000
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
Cc: michel@lespinasse.org, nvdimm@lists.linux.dev, heiko@sntech.de,
 leewalsh@google.com, dri-devel@lists.freedesktop.org, perex@perex.cz,
 jglisse@google.com, arjunroy@google.com, m.szyprowski@samsung.com,
 linux-arch@vger.kernel.org, qianweili@huawei.com,
 linux-samsung-soc@vger.kernel.org, aneesh.kumar@linux.ibm.com,
 chenhuacai@kernel.org, kasan-dev@googlegroups.com, linux-acpi@vger.kernel.org,
 rientjes@google.com, xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 robdclark@gmail.com, minchan@google.com, robert.jarzmik@free.fr,
 linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, npiggin@gmail.com,
 alex.williamson@redhat.com, viro@zeniv.linux.org.uk, luto@kernel.org,
 gthelen@google.com, tglx@linutronix.de, ldufour@linux.ibm.com,
 surenb@google.com, linux-sgx@vger.kernel.org, martin.petersen@oracle.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 freedreno@lists.freedesktop.org, joelaf@google.com, linux-aio@kvack.org,
 linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, david@redhat.com,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
 edumazet@google.com, target-devel@vger.kernel.org, punit.agrawal@bytedance.com,
 linux-s390@vger.kernel.org, dave@stgolabs.net, deller@gmx.de, hughd@google.com,
 andrii@kernel.org, patrik.r.jakobsson@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-graphics-maintainer@vmware.com, kernel-team@android.com,
 jayalk@intworks.biz, soheil@google.com, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org, shakeelb@google.com,
 haojian.zhuang@gmail.com, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, tytso@mit.edu, nico@fluxnic.net,
 muchun.song@linux.dev, hjc@rock-chips.com, mcoquelin.stm32@gmail.com,
 tatashin@google.com, mike.kravetz@oracle.com, songliubraving@fb.com,
 jasowang@redhat.com, alsa-devel@alsa-project.org, peterx@redhat.com,
 linux-tegra@vger.kernel.org, kraxel@redhat.com, will@kernel.org,
 dmaengine@vger.kernel.org, bhe@redhat.com, miklos@szeredi.hu,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, willy@infradead.org,
 gurua@google.com, dgilbert@interlog.com, xiang@kernel.org, pabeni@redhat.com,
 jejb@linux.ibm.com, quic_abhinavk@quicinc.com, bp@alien8.de,
 mchehab@kernel.org, linux-ext4@vger.kernel.org, tomba@kernel.org,
 hughlynch@google.com, sre@kernel.org, tfiga@chromium.org,
 linux-xfs@vger.kernel.org, zhangfei.gao@linaro.org, wangzhou1@hisilicon.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 davem@davemloft.net, mhocko@suse.com, kvm@vger.kernel.org, mst@redhat.com,
 peterz@infradead.org, bigeasy@linutronix.de, alexandre.torgue@foss.st.com,
 dhowells@redhat.com, linux-mm@kvack.org, ray.huang@amd.com,
 adilger.kernel@dilger.ca, kuba@kernel.org, sparclinux@vger.kernel.org,
 airlied@gmail.com, anton.ivanov@cambridgegreys.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, richard@nod.at,
 x86@kernel.org, vkoul@kernel.org, mingo@redhat.com, axelrasmussen@google.com,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, paulmck@kernel.org,
 jannh@google.com, chao@kernel.org, maarten.lankhorst@linux.intel.com,
 liam.howlett@oracle.com, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, vbabka@suse.cz,
 dimitri.sivanich@hpe.com, amd-gfx@lists.freedesktop.org, posk@google.com,
 lstoakes@gmail.com, peterjung1337@gmail.com, yoshfuji@linux-ipv6.org,
 linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev,
 kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org,
 johannes@sipsolutions.net, mgorman@techsingularity.net,
 linux-accelerators@lists.ozlabs.org, l.stach@pengutronix.de
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

This patchset was originally published as a part of per-VMA locking [1] and
was split after suggestion that it's viable on its own and to facilitate
the review process. It is now a preprequisite for the next version of per-VMA
lock patchset, which reuses vm_flags modifier functions to lock the VMA when
vm_flags are being updated.

VMA vm_flags modifications are usually done under exclusive mmap_lock
protection because this attrubute affects other decisions like VMA merging
or splitting and races should be prevented. Introduce vm_flags modifier
functions to enforce correct locking.

[1] https://lore.kernel.org/all/20230109205336.3665937-1-surenb@google.com/

The patchset applies cleanly over mm-unstable branch of mm tree.

My apologies for an extremely large distribution list. The patch touches
lots of files and many are in arch/ and drivers/.

Suren Baghdasaryan (6):
  mm: introduce vma->vm_flags modifier functions
  mm: replace VM_LOCKED_CLEAR_MASK with VM_LOCKED_MASK
  mm: replace vma->vm_flags direct modifications with modifier calls
  mm: replace vma->vm_flags indirect modification in ksm_madvise
  mm: introduce mod_vm_flags_nolock and use it in untrack_pfn
  mm: export dump_mm()

 arch/arm/kernel/process.c                     |  2 +-
 arch/ia64/mm/init.c                           |  8 +--
 arch/loongarch/include/asm/tlb.h              |  2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c            |  5 +-
 arch/powerpc/kvm/book3s_xive_native.c         |  2 +-
 arch/powerpc/mm/book3s64/subpage_prot.c       |  2 +-
 arch/powerpc/platforms/book3s/vas-api.c       |  2 +-
 arch/powerpc/platforms/cell/spufs/file.c      | 14 ++---
 arch/s390/mm/gmap.c                           |  8 +--
 arch/x86/entry/vsyscall/vsyscall_64.c         |  2 +-
 arch/x86/kernel/cpu/sgx/driver.c              |  2 +-
 arch/x86/kernel/cpu/sgx/virt.c                |  2 +-
 arch/x86/mm/pat/memtype.c                     | 14 +++--
 arch/x86/um/mem_32.c                          |  2 +-
 drivers/acpi/pfr_telemetry.c                  |  2 +-
 drivers/android/binder.c                      |  3 +-
 drivers/char/mspec.c                          |  2 +-
 drivers/crypto/hisilicon/qm.c                 |  2 +-
 drivers/dax/device.c                          |  2 +-
 drivers/dma/idxd/cdev.c                       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c     |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  4 +-
 drivers/gpu/drm/drm_gem.c                     |  2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c          |  3 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  2 +-
 drivers/gpu/drm/drm_vm.c                      |  8 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |  4 +-
 drivers/gpu/drm/gma500/framebuffer.c          |  2 +-
 drivers/gpu/drm/i810/i810_dma.c               |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |  3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  3 +-
 drivers/gpu/drm/tegra/gem.c                   |  5 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  3 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c         |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c      |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |  3 +-
 drivers/hsi/clients/cmt_speech.c              |  2 +-
 drivers/hwtracing/intel_th/msu.c              |  2 +-
 drivers/hwtracing/stm/core.c                  |  2 +-
 drivers/infiniband/hw/hfi1/file_ops.c         |  4 +-
 drivers/infiniband/hw/mlx5/main.c             |  4 +-
 drivers/infiniband/hw/qib/qib_file_ops.c      | 13 +++--
 drivers/infiniband/hw/usnic/usnic_ib_verbs.c  |  2 +-
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.c   |  2 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |  2 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c |  2 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c     |  4 +-
 drivers/media/v4l2-core/videobuf-vmalloc.c    |  2 +-
 drivers/misc/cxl/context.c                    |  2 +-
 drivers/misc/habanalabs/common/memory.c       |  2 +-
 drivers/misc/habanalabs/gaudi/gaudi.c         |  4 +-
 drivers/misc/habanalabs/gaudi2/gaudi2.c       |  8 +--
 drivers/misc/habanalabs/goya/goya.c           |  4 +-
 drivers/misc/ocxl/context.c                   |  4 +-
 drivers/misc/ocxl/sysfs.c                     |  2 +-
 drivers/misc/open-dice.c                      |  4 +-
 drivers/misc/sgi-gru/grufile.c                |  4 +-
 drivers/misc/uacce/uacce.c                    |  2 +-
 drivers/sbus/char/oradax.c                    |  2 +-
 drivers/scsi/cxlflash/ocxl_hw.c               |  2 +-
 drivers/scsi/sg.c                             |  2 +-
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  2 +-
 drivers/staging/media/deprecated/meye/meye.c  |  4 +-
 .../media/deprecated/stkwebcam/stk-webcam.c   |  2 +-
 drivers/target/target_core_user.c             |  2 +-
 drivers/uio/uio.c                             |  2 +-
 drivers/usb/core/devio.c                      |  3 +-
 drivers/usb/mon/mon_bin.c                     |  3 +-
 drivers/vdpa/vdpa_user/iova_domain.c          |  2 +-
 drivers/vfio/pci/vfio_pci_core.c              |  2 +-
 drivers/vhost/vdpa.c                          |  2 +-
 drivers/video/fbdev/68328fb.c                 |  2 +-
 drivers/video/fbdev/core/fb_defio.c           |  4 +-
 drivers/xen/gntalloc.c                        |  2 +-
 drivers/xen/gntdev.c                          |  4 +-
 drivers/xen/privcmd-buf.c                     |  2 +-
 drivers/xen/privcmd.c                         |  4 +-
 fs/aio.c                                      |  2 +-
 fs/cramfs/inode.c                             |  2 +-
 fs/erofs/data.c                               |  2 +-
 fs/exec.c                                     |  4 +-
 fs/ext4/file.c                                |  2 +-
 fs/fuse/dax.c                                 |  2 +-
 fs/hugetlbfs/inode.c                          |  4 +-
 fs/orangefs/file.c                            |  3 +-
 fs/proc/task_mmu.c                            |  2 +-
 fs/proc/vmcore.c                              |  3 +-
 fs/userfaultfd.c                              |  2 +-
 fs/xfs/xfs_file.c                             |  2 +-
 include/linux/mm.h                            | 51 +++++++++++++++++--
 include/linux/mm_types.h                      |  8 ++-
 include/linux/pgtable.h                       |  5 +-
 kernel/bpf/ringbuf.c                          |  4 +-
 kernel/bpf/syscall.c                          |  4 +-
 kernel/events/core.c                          |  2 +-
 kernel/fork.c                                 |  2 +-
 kernel/kcov.c                                 |  2 +-
 kernel/relay.c                                |  2 +-
 mm/debug.c                                    |  1 +
 mm/hugetlb.c                                  |  4 +-
 mm/khugepaged.c                               |  2 +
 mm/ksm.c                                      |  2 +
 mm/madvise.c                                  |  2 +-
 mm/memory.c                                   | 19 +++----
 mm/memremap.c                                 |  4 +-
 mm/mlock.c                                    | 12 ++---
 mm/mmap.c                                     | 32 +++++++-----
 mm/mprotect.c                                 |  2 +-
 mm/mremap.c                                   |  8 +--
 mm/nommu.c                                    | 11 ++--
 mm/secretmem.c                                |  2 +-
 mm/shmem.c                                    |  2 +-
 mm/vmalloc.c                                  |  2 +-
 net/ipv4/tcp.c                                |  4 +-
 security/selinux/selinuxfs.c                  |  6 +--
 sound/core/oss/pcm_oss.c                      |  2 +-
 sound/core/pcm_native.c                       |  9 ++--
 sound/soc/pxa/mmp-sspa.c                      |  2 +-
 sound/usb/usx2y/us122l.c                      |  4 +-
 sound/usb/usx2y/usX2Yhwdep.c                  |  2 +-
 sound/usb/usx2y/usx2yhwdeppcm.c               |  2 +-
 129 files changed, 292 insertions(+), 233 deletions(-)

-- 
2.39.1

