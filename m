Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE03051072E
	for <lists+etnaviv@lfdr.de>; Tue, 26 Apr 2022 20:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B4710E1D2;
	Tue, 26 Apr 2022 18:36:50 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF3A10E2DA
 for <etnaviv@lists.freedesktop.org>; Tue, 26 Apr 2022 18:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650998208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U7x3WHti8mB7zSssr6dU5T2fFBWQH7ax9JH4iLf8LkU=;
 b=d9odd6x1wzf73HOPYL+LjGvCy5TRQTwMNFXtI7TiJWkb2z+0740XtXKsww5enbon1NOxeF
 BeG1IYDTzNhyXmzTw+t6NMKFraaMmw1xYNzzvnOVQgpTc3twvCLZqelVa6nWwYVLUI0dgS
 Jw9Uy9J+ihQ3S93rr9oF7tHVSIqJsL4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-9p2UkVzCN8mPyNdcvoZPig-1; Tue, 26 Apr 2022 14:36:47 -0400
X-MC-Unique: 9p2UkVzCN8mPyNdcvoZPig-1
Received: by mail-qv1-f71.google.com with SMTP id
 gi15-20020a056214248f00b00456389202a2so5030567qvb.10
 for <etnaviv@lists.freedesktop.org>; Tue, 26 Apr 2022 11:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=U7x3WHti8mB7zSssr6dU5T2fFBWQH7ax9JH4iLf8LkU=;
 b=3BX5NjgS+dp7/6N9etVqnsCsIt7HqF0Lq6GOmBiW0Fl6ABMlLh23oI3DhHcP60Q4g7
 hXi5w60hhQ6E6ZLfw1HT+GAl/A7oUaW0ZvJMY+ILpmNppXUT8I4WLLBKxy2tODYpL3xH
 DN9s/iZpoK6u0WkHtoY+oww1dHSrVnU+V905fjXtT7/nna4wBncRej9y3v70Kercylpf
 pF69G/x6XTbdFH0DTbLMNCP645XAERGxaiQiFMFD3QEO9yyIsExbMqIpukrHEVAQTYxh
 7QgK4UHKH7mn5TVPJI+NhyDr5hQIjsSspluQ9N459frAWotsmfXU2WJBVaPtcnciKbE9
 5dBg==
X-Gm-Message-State: AOAM531QN04Jwsvt8I8iLBjKAYcdieXyCfO9QpR49ZW22+9Zo4xvcwGc
 zb3np0ND0Ul/x8yV/Toq9s/40LPQTc+k5pvZkKV5Ug+v4b6p79PE6OFI6Zg0OYqoaMD21xjVU+c
 HhAsUQz4asY8ccxzQUyNLicsKsw==
X-Received: by 2002:a05:620a:f98:b0:648:a980:5161 with SMTP id
 b24-20020a05620a0f9800b00648a9805161mr13975232qkn.545.1650998206549; 
 Tue, 26 Apr 2022 11:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFlkV78mcoPFbdNEywIl8YhmnRu/TNzHWCRjxstF0LNzVzvVzweFee+/7HtJv0KoRQlwNbkA==
X-Received: by 2002:a05:620a:f98:b0:648:a980:5161 with SMTP id
 b24-20020a05620a0f9800b00648a9805161mr13975211qkn.545.1650998206290; 
 Tue, 26 Apr 2022 11:36:46 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 f39-20020a05622a1a2700b002f367d7a7a5sm4252542qtb.23.2022.04.26.11.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:36:45 -0700 (PDT)
Message-ID: <2be5f25b4212817ebc5e0435467848675063b45f.camel@redhat.com>
Subject: Requests For Proposals for hosting XDC 2023 are now open
From: Lyude Paul <lyude@redhat.com>
To: "events@lists.x.org" <events@lists.x.org>, 
 "xorg-devel@lists.freedesktop.org"
 <xorg-devel@lists.freedesktop.org>, wayland-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, libre-soc-dev@lists.libre-soc.org
Date: Tue, 26 Apr 2022 14:36:44 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: board@foundation.x.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>

Hello everyone!

The X.org board is soliciting proposals to host XDC in 2023. Since
XDC 2022 is being held in North America this year, XDC 2023 is expected
to be in Europe. However, the board is open to other locations,
especially if there's an interesting co-location with another
conference.

If you're considering hosting XDC, we've assembled a wiki page with
what's generally expected and needed:

https://www.x.org/wiki/Events/RFP/

When submitting your proposal, please make sure to include at least the
key information about the potential location in question, possible
dates along with estimated costs. Proposals can be submitted to board
at foundation.x.org until the deadline of *September 1st, 2022*. 

Additionally, an quirk early heads-up to the board if you're
considering hosting would be appreciated, in case we need to adjust the
schedule a bit. Also, earlier is better since there generally will be a
bit of Q&A with organizers.

And if you just have some questions about what organizing XDC entails,
please feel free to chat with previous organizers, or someone from the
board.

Best regards,
	Lyude Paul
On behalf of X.org

