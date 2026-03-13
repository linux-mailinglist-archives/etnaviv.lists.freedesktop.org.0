Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPyHCZAVuGl/YwEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Mon, 16 Mar 2026 15:37:04 +0100
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C916829B817
	for <lists+etnaviv@lfdr.de>; Mon, 16 Mar 2026 15:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A7110E4F6;
	Mon, 16 Mar 2026 14:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m3kl09Ol";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B3610EC1F
 for <etnaviv@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:40 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-467161c4b7aso1095791b6e.1
 for <etnaviv@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408279; x=1774013079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rnDJitpTduufuEe6X95vH8IiBFUBoxeB6eQQOPNaxFg=;
 b=m3kl09OlQN5dK2iZ3NA0J2efr132PpZtDsIPxBXmaAKJ4RI0ksQkuzxGLA6izbl41V
 k74ar3fx3+22dsxwwqDJLTrI77Fppo8C7usxpODu7DgqrKgG+//9SEg13QZE0dMNV2Od
 iDuopc7myG6Bq6sgV9TWhkzhBbx/oMXUABnmnhW3DX4GBTXsNZqxM9nEtW8oS3PI3q11
 eVue2eMom4TE8QvVJGeCqAyG9PYXV1iV91BGY+xom+yXKM/vc2nrTq+ZeSHJm1I8wU+Y
 /ek9E0mOkrZfncmtkCXwH4Y0r6Oxc3AOKju4dNqkaCsMMOcEuyDgMmItIbHudzGrXqGj
 ZtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408279; x=1774013079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rnDJitpTduufuEe6X95vH8IiBFUBoxeB6eQQOPNaxFg=;
 b=mCYVs4XnLmaHYdVJPIs7wcpgn/uKrAT/dz9UeLJfmbOhWC/DETrXu1470r4qr/6Fha
 +l5gYDN1v3WnnaqboSO0MDTu2+L073huhuV7FHJtXxGsPPmvqXBkuGxvxTSNfNEw2/9j
 Xn49G2fMIgNGTk/j680391gVoYLb7PzjIEVgYap3I6D0L3FiRJ6iYGGKuZxbf8XbWXr5
 GNgPvffAmrCw2qYiVmFPZOE6a+J+qw3bOungGGTj1nXcKarmGB0Zb6eTzJAPI+0Vfo/l
 0yBOBTirupd6DoQHxo1f+N+KQ1I6O7/IUkymXkfZPQWvl4H3t/YoDKX5/aGjq8WhFqP4
 JAqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZzVRPf3IAgxB9x2mX7PawGWmfn5cCGQF+lUkxtGXGCyceF6ahk1o3djLL7wsWraXS9soQ8o5P@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWd2o0o2Hr9zVwgFrB8BGbl6Uxr+6HYYpStLO/r1pO4ShxeX6G
 b8XQdAxHYZBFB8JbW4e0UP0kDqRPaf038wM/sqPkH8cdavXGQSc5FfmD
X-Gm-Gg: ATEYQzwFE5g3jcoB/Asbjb0qoyDmmKRIg3/4kZZuqkzvViNSy5dmh5JXR7jSKaxdRG3
 C39ARSP1eSIrNvEtxY5iAogLsHrB9r86l70BZNKJ/n/vkgWFs6Xt12D7CpbP5GbslrE0i0kZPJm
 nDUWH/xGdEEj68vSIyua12zTlUsAKTCTCG/1/BG5ZgsbBQCVr+fN5x36zuonHAv2EMAaEzg1/fk
 ZN6P2a+VzejUlHcyW44z3Eh1TjRdDlo3hx/oPYTplUIXUdEIPaYcza32AHyXhy8l9e/fL2IBAqB
 0kjnhXpdxiuGUzVomX5P4IguEc20tHiGfHhe2vpb/Cl/27P8ZKknF7xhk/GorN79eK5zJMvOaFE
 WNUU+rSKAVbkBBzoOor7Lr7yovn5KmErsUHhiruewPnGio9Ywj73AmCshYe5mb7QvNDfChNkWOO
 L6bOIBX+mGkEqs0YHbiocL0p3w2xB3DtuSBdQO+yOGT8MQfKsn
X-Received: by 2002:a05:6808:11cb:b0:464:305e:8fcc with SMTP id
 5614622812f47-4675713631amr1649395b6e.20.1773408279143; 
 Fri, 13 Mar 2026 06:24:39 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:38 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, mripard@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 48/65] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Fri, 13 Mar 2026 07:20:13 -0600
Message-ID: <20260313132103.2529746-49-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Mar 2026 14:37:00 +0000
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[73];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,pengutronix.de,armlinux.org.uk,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:intel-gfx@lists.freedesktop.org,m:amd-gfx@lists.freedesktop.org,m:linux@armlinux.org.uk,m:christiangmeiner@gmail.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,etnaviv-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[etnaviv];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,suse.de,linux.intel.com,intel.com,amd.com,bootlin.com,linuxfoundation.org,suse.com,chromium.org,lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C916829B817
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 08aca9035fc1..ef4423d4987f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -26,6 +26,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * DRM operations:
  */
-- 
2.53.0

