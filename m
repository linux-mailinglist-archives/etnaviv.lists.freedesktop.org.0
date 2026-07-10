Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7+J0HPyoUGoY3AIAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 10:10:36 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A5B7384CF
	for <lists+etnaviv@lfdr.de>; Fri, 10 Jul 2026 10:10:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of etnaviv-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=etnaviv-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AC210E14D;
	Fri, 10 Jul 2026 08:10:34 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29FB10E14D
 for <etnaviv@lists.freedesktop.org>; Fri, 10 Jul 2026 08:10:33 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1wi6JR-0005QS-ED; Fri, 10 Jul 2026 10:10:21 +0200
Message-ID: <26876decb5bcf4df8bb01abe47f9e70a4e5d63ef.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/etnaviv: Add GPU reset counters
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie	
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Christian Gmeiner	 <cgmeiner@igalia.com>
Date: Fri, 10 Jul 2026 10:10:20 +0200
In-Reply-To: <CAH9NwWe9gDjg-6_e1KHdUQ8_Pi2sjhfDizZGzWavQAnnuymQ2g@mail.gmail.com>
References: <20260709-etnaviv-reset-notification-v1-0-64c617496958@igalia.com>
 <20260709-etnaviv-reset-notification-v1-2-64c617496958@igalia.com>
 <bb5b8c8ff15f8d8b9ad9a61e4887c14b9f77f3d6.camel@pengutronix.de>
 <CAH9NwWe9gDjg-6_e1KHdUQ8_Pi2sjhfDizZGzWavQAnnuymQ2g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.gmeiner@gmail.com,m:linux+etnaviv@armlinux.org.uk,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel-dev@igalia.com,m:cgmeiner@igalia.com,m:christiangmeiner@gmail.com,m:linux@armlinux.org.uk,s:lists@lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[l.stach@pengutronix.de,etnaviv-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[l.stach@pengutronix.de,etnaviv-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,igalia.com];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[etnaviv];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,pengutronix.de:mid,pengutronix.de:from_mime,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0A5B7384CF

Am Donnerstag, dem 09.07.2026 um 21:41 +0200 schrieb Christian Gmeiner:
> Hi Lucas,
>=20
> > > The OpenGL and Vulkan robustness extensions let an application detect=
 a
> > > GPU reset and check if its own context caused it, so the application =
can
> > > drop the broken context and build a new one. The kernel knows both
> > > facts, but etnaviv has no way to report them to userspace.
> > >=20
> > > Add two counters and expose them through GET_PARAM: a per-GPU counter
> > > that counts every reset of that GPU, and a per-context counter that o=
nly
> > > counts the resets this context was guilty of. Userspace compares the
> > > counters with saved values: if the context counter moved the context =
was
> > > guilty, if only the GPU counter moved the context was an innocent
> > > victim.
> >=20
> > I don't really agree with the design of exposing this through
> > GET_PARAM.
> >=20
> >=20
> > First it assumes that each etnaviv_file_private can only have a single
> > context, something that is true today but which I would very much like
> > to change to rid of false dependencies when the application uses
> > multiple GL contexts through the same screen. I have a rework to do
> > this in the pipe, which I didn't get around to finish, yet. While I
> > don't want to block any of your work on this rework, I also wouldn't
> > like to see UAPI land which bakes in the single context per file
> > private assumption.
> >=20
>=20
> Makes sense. I only picked it because msm and v3d expose their fault
> counters that way.
>=20
> For v2 I have replaced the two params with a dedicated ioctl:
>=20
> struct drm_etnaviv_reset_query {
>     __u32 pipe;            /* in */
>     __u32 flags;            /* in, must be 0 */
>     __u64 global_reset_counter;    /* out */
>     __u64 context_reset_counter;    /* out */
> };
>=20
> flags must be zero for now and is rejected with EINVAL otherwise, so
> your multi context rework can later add a flag plus a context field to
> query a specific context.
>=20
Looks good to me.

> >=20
> > Second, with this design each userspace query incurs two roundtrips
> > into the kernel, as userspace needs to know both counter values to tell
> > innocent vs guilty resets apart.
> >=20
> > My vote would be on adding a new ioctl to query both reset counters at
> > the same time, with a flags argument baked in, so it can be extended
> > once I manage to finish the multi context rework.
> >=20
>=20
> One thing to note: the global counter is per GPU core, so a context
> that uses more than one pipe still needs one query per pipe. I think
> that is fine for the robustness use case, but tell me if you would
> rather have a variant that returns all pipes at once.

I think the current design is fine. While there might be some
configurations where a context uses multiple pipes (2D GPU texture
upload or one of those chips with multiple 3D GPUs), I think that those
are sufficiently rare that we might want to deal with the additional
kernel transitions for those rather than complicating the ioctl for the
common case of a context using a single pipe.

Regards,
Lucas
