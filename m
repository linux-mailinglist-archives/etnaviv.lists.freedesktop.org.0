Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAAA67E6A7
	for <lists+etnaviv@lfdr.de>; Fri, 27 Jan 2023 14:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB15D10E98F;
	Fri, 27 Jan 2023 13:26:42 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCA010E7F4
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Jan 2023 16:55:25 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-4a263c4ddbaso272946837b3.0
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Jan 2023 08:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=49H+5dcfdqsESvQ4qNxkOgTxyGkRYtaMvRra0jMgwoI=;
 b=S433Z2p/j0oEnqzhdMbCoBVS6yLsoVuhPxi7PQkxnyRK8RoE5tlGqQCWFiSx/y2EvP
 VAUU6f5te6yd0FF3QKoXQk59fXSc40Ni99FjmOhoS8uoMeuhfG+AT8hg6vTHrAcNtls7
 iMIrnMdjSfEnhMBuERTLvpM6IdVwE9wobd2Cb3XY0VBKEUGGTBatMri522T6kyoxGdRv
 R/YHI2CzXA+66ssNNRD0kBHVPl8TI5ear6XOrgI2lTdtmT0YpMoSddNSDob6lG0ADoLk
 +xTQAwFZ3i/oeH+aroOYDwlOGwYRh8N7mvnq0HFpqRIYUl+jcTUyG7X+0g74P9WaFx1x
 4nDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=49H+5dcfdqsESvQ4qNxkOgTxyGkRYtaMvRra0jMgwoI=;
 b=uZREnK9anXzT9SU1ZkvqA7axsU9VZq46cT315/iv7+QawM7vm2UVOsfStNRO2UQN5L
 WkQEiL3+u+teB2RVhMHTwJb74UWDuiLDCul8tz8ccaKjn+8fF154/1jBWiVvrr+Xn0qx
 o2AHSq5UB812NAwUzk9J+qwNyBR7mZMhQgBdjOK2tZztVrYjLgyJ1MkRbZ+Oay+oYSGQ
 HyrKQ1rwQJW1yjtdwYxWD9rfKnAAY7jDIqBrnnAJEvCiirsQA+XSxYGaoudd6LhCH2ti
 zYkt0FOJMHUxf6QEfs1BwxwV9ANi3V1L0ya9wvaGYUer3dXfvoMFlM9KtQibDt5oY39J
 HBuA==
X-Gm-Message-State: AO0yUKW6Dn2t7lP+IS6phQmILrBcaTZ7BWpMU2rbNYtMWdhoPoJl3pnU
 gLbsNqUNYkKnbu44NNN/Do4apCCMBUGuwi+pfBsX8A==
X-Google-Smtp-Source: AK7set/FwLbWx6yiqkzvjcGbe3t+VxnD8xj+/iXHUbjRIwB0jRkvrcCR+VhH4DhOMzxTzJJlzd0h1TxaYfABci/YfRk=
X-Received: by 2002:a0d:d456:0:b0:507:26dc:ebd with SMTP id
 w83-20020a0dd456000000b0050726dc0ebdmr239978ywd.455.1674665724181; Wed, 25
 Jan 2023 08:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-4-surenb@google.com>
 <Y9D2zXpy+9iyZNun@dhcp22.suse.cz>
In-Reply-To: <Y9D2zXpy+9iyZNun@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 08:55:12 -0800
Message-ID: <CAJuCfpG7KWnj3J_t4nN1R4gfiM5jgjsiTfL55hNa=Uvz4E835g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] mm: replace vma->vm_flags direct modifications
 with modifier calls
To: Michal Hocko <mhocko@suse.com>
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
 linux-sgx@vger.kernel.org, martin.petersen@oracle.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-media@vger.kernel.org, freedreno@lists.freedesktop.org,
 joelaf@google.com, linux-aio@kvack.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, david@redhat.com, dave.hansen@linux.intel.com,
 virtualization@lists.linux-foundation.org, edumazet@google.com,
 target-devel@vger.kernel.org, punit.agrawal@bytedance.com,
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
 davem@davemloft.net, kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org,
 bigeasy@linutronix.de, alexandre.torgue@foss.st.com, dhowells@redhat.com,
 linux-mm@kvack.org, ray.huang@amd.com, adilger.kernel@dilger.ca,
 kuba@kernel.org, sparclinux@vger.kernel.org, airlied@gmail.com,
 anton.ivanov@cambridgegreys.com, herbert@gondor.apana.org.au,
 linux-scsi@vger.kernel.org, richard@nod.at, x86@kernel.org, vkoul@kernel.org,
 mingo@redhat.com, axelrasmussen@google.com, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, paulmck@kernel.org, jannh@google.com, chao@kernel.org,
 maarten.lankhorst@linux.intel.com, liam.howlett@oracle.com,
 hdegoede@redhat.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, vbabka@suse.cz, dimitri.sivanich@hpe.com,
 amd-gfx@lists.freedesktop.org, posk@google.com, lstoakes@gmail.com,
 peterjung1337@gmail.com, yoshfuji@linux-ipv6.org,
 linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev,
 kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org,
 johannes@sipsolutions.net, mgorman@techsingularity.net,
 linux-accelerators@lists.ozlabs.org, l.stach@pengutronix.de
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 1:30 AM 'Michal Hocko' via kernel-team
<kernel-team@android.com> wrote:
>
> On Wed 25-01-23 00:38:48, Suren Baghdasaryan wrote:
> > Replace direct modifications to vma->vm_flags with calls to modifier
> > functions to be able to track flag changes and to keep vma locking
> > correctness.
>
> Is this a manual (git grep) based work or have you used Coccinele for
> the patch generation?

It was a manual "search and replace" and in the process I temporarily
renamed vm_flags to ensure I did not miss any usage.

>
> My potentially incomplete check
> $ git grep ">[[:space:]]*vm_flags[[:space:]]*[&|^]="
>
> shows that nothing should be left after this. There is still quite a lot
> of direct checks of the flags (more than 600). Maybe it would be good to
> make flags accessible only via accessors which would also prevent any
> future direct setting of those flags in uncontrolled way as well.

Yes, I think Peter's suggestion in the first patch would also require
that. Much more churn but probably worth it for the future
maintenance. I'll add a patch which converts all readers as well.

>
> Anyway
> Acked-by: Michal Hocko <mhocko@suse.com>

Thanks for all the reviews!

> --
> Michal Hocko
> SUSE Labs
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
