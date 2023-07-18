Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8366A75820C
	for <lists+etnaviv@lfdr.de>; Tue, 18 Jul 2023 18:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1891D10E383;
	Tue, 18 Jul 2023 16:24:47 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from out-5.mta1.migadu.com (out-5.mta1.migadu.com
 [IPv6:2001:41d0:203:375::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F289D10E37E
 for <etnaviv@lists.freedesktop.org>; Tue, 18 Jul 2023 16:24:44 +0000 (UTC)
Message-ID: <77cbc2f6-c574-19f5-7277-cc85afefe855@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689697481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfcgypQOAxzvXKZanWnc9PpMkW6aFsIfrCBY7LttHdk=;
 b=SROZTuSO2XZiJnsvUFQ3QJqxa2GSqhCn6XwN4/0xhKR/OJxXTJg+D8KxG8xTy28x3lwFoS
 XMe5b+wC3t//Vj3+V5Dr00N207aEb3CLnSUMy/Afg4E1EYQeuW2ugepxm+TuhLW/aJ8SIQ
 8KxuNYFQjlvuKnB8WiVGzkGypUP360M=
Date: Wed, 19 Jul 2023 00:24:31 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v1 3/8] drm/etnaviv: Drop the second argument of the
 etnaviv_gem_new_impl()
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
 <20230623100822.274706-4-sui.jingfeng@linux.dev>
 <862358e67a6f118b11ba16fb94828e9d1635cb66.camel@pengutronix.de>
 <e3a05204-61fe-2318-5f06-fd12addfe2e9@loongson.cn>
 <ee96ed1a1ff12656f6e6542ae928fb526a9758fe.camel@pengutronix.de>
 <06b291d4-9cab-5179-2a90-a73449ddb2dd@loongson.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <06b291d4-9cab-5179-2a90-a73449ddb2dd@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: loongson-kernel@lists.loongnix.cn, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: etnaviv-bounces@lists.freedesktop.org
Sender: "etnaviv" <etnaviv-bounces@lists.freedesktop.org>


On 2023/7/19 00:16, suijingfeng wrote:
> Because communicate will you


'will' -> 'with'

