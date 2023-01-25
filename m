Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F203967E69C
	for <lists+etnaviv@lfdr.de>; Fri, 27 Jan 2023 14:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94FC10E47C;
	Fri, 27 Jan 2023 13:26:39 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AC710E7F7
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Jan 2023 17:22:36 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id p141so21123868ybg.12
 for <etnaviv@lists.freedesktop.org>; Wed, 25 Jan 2023 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IqJXv+IInDU1mKTOWecSjx46uIp9RhIiEah7PjvPLrg=;
 b=QlZyecSvRJAlH7daZiVbTmdMCDJawwIkjqybbPcYd50INvCOOFwycJjGFsDCENBvPF
 JeBM9yeOQDknmaZC6LT0p7wlzLAJo3QYgAn7K1xQNCTJjPrh6oinOxgRNGwGedAqUfeH
 4EF6oknHwKU0N6BIZOc0CJi1hrgM4W0zxm3gicvvOuEGF7JC9HCNICDdMPEAz6Lz/B5y
 FN2dpyuojKkpe3r7ipsFxRIyHaJ4nJmkiiUGkQy6aOsuBhBZ3WzwUsGkq0uXDlGTKFEH
 iRh4N/trPN148wcbBUC1DmqB3ErHQLF9n9pkmMXooLK6oXyXf0aS41iIJv2buhnN7zSu
 X8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IqJXv+IInDU1mKTOWecSjx46uIp9RhIiEah7PjvPLrg=;
 b=S0fH/qpJ/1EgL/yA6ianro123cjTe44UDmX+S+Bb4RGvnLz0qJ8N/Kwb+zW07xVS9B
 yRuPjYfAkrfNHX1M+pG7yHxMsvKXLLLKbzNwS6YW0eSNXiqHDOdsgwm5avPaLr1EMp8j
 6o53WWKnC9SC6xy79kx5wbcNV9/g+spqwHjdXZyXAn6CpH5MGYT41i3mQz2E2MK3ExkV
 tpFmTS2DzxSzAEcD+DTjuFMqwAJfDMEXrWKh8MgoupR1CwfHwq68mLJJiXoAVVIKLEbK
 3YWUrp4Yrm3aAFY62pUxw/7rhq7CdqJZRWxudPrq3t8O6oaAtvZmbtTJncJT7EQAYyrv
 KmCg==
X-Gm-Message-State: AFqh2kqrRLHvuyY6BoD8xLBtkd4AGsSHopV/cjrgOakFspw1XEc6jsXz
 008aX9ASAUzchvZmbt3Hx3cZLtB7/EQWJJ+xv16EMA==
X-Google-Smtp-Source: AMrXdXv634nY3BrnZ3PlTUGlyUi8i7L3YenO2gMgxW5qJ4tF6Xha6yZp+2FFeWeU8OQrXrCFeHpomo5nr++haHZW7UI=
X-Received: by 2002:a25:a408:0:b0:800:28d4:6936 with SMTP id
 f8-20020a25a408000000b0080028d46936mr2303639ybi.431.1674667354997; Wed, 25
 Jan 2023 09:22:34 -0800 (PST)
MIME-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-5-surenb@google.com>
 <Y9D4rWEsajV/WfNx@dhcp22.suse.cz>
 <CAJuCfpGd2eG0RSMte9OVgsRVWPo+Sj7+t8EOo8o_iKzZoh1MXA@mail.gmail.com>
 <Y9Fh9joU3vTCwYbX@dhcp22.suse.cz>
In-Reply-To: <Y9Fh9joU3vTCwYbX@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 09:22:23 -0800
Message-ID: <CAJuCfpEJ1U2UHBNhLx4gggN3PLZKP5RejiZL_U5ZLxU_wdviVg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] mm: replace vma->vm_flags indirect modification in
 ksm_madvise
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

On Wed, Jan 25, 2023 at 9:08 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Wed 25-01-23 08:57:48, Suren Baghdasaryan wrote:
> > On Wed, Jan 25, 2023 at 1:38 AM 'Michal Hocko' via kernel-team
> > <kernel-team@android.com> wrote:
> > >
> > > On Wed 25-01-23 00:38:49, Suren Baghdasaryan wrote:
> > > > Replace indirect modifications to vma->vm_flags with calls to modifier
> > > > functions to be able to track flag changes and to keep vma locking
> > > > correctness. Add a BUG_ON check in ksm_madvise() to catch indirect
> > > > vm_flags modification attempts.
> > >
> > > Those BUG_ONs scream to much IMHO. KSM is an MM internal code so I
> > > gueess we should be willing to trust it.
> >
> > Yes, but I really want to prevent an indirect misuse since it was not
> > easy to find these. If you feel strongly about it I will remove them
> > or if you have a better suggestion I'm all for it.
>
> You can avoid that by making flags inaccesible directly, right?

Ah, you mean Peter's suggestion of using __private? I guess that would
cover it. I'll drop these BUG_ONs in the next version. Thanks!

>
> --
> Michal Hocko
> SUSE Labs
