Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B554EA24B
	for <lists+etnaviv@lfdr.de>; Mon, 28 Mar 2022 23:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8C410E124;
	Mon, 28 Mar 2022 21:18:35 +0000 (UTC)
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3534E10E11D
 for <etnaviv@lists.freedesktop.org>; Mon, 28 Mar 2022 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648502313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o/20j76lcDPeDTIfcY54M2M3yeP1hzS1Frzdk4vK99I=;
 b=bcy1c4S6x+cJ0ONdmzDTWM1ob9BuCHXnKJnnxlAIJZFJ5SCfCIJeZzqCDS6bonCo1TcXlA
 Pq9bRt4rN8Y10xYLNoDelMPRyWLcq7Gfgu+UEIIAhKGa3au64Abwjj5rt0ZFF7ZdVFWDDa
 KhrwmwSHyE2bR/6A3HVsWq3TzZ+U8rY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-KAuh7iH6O9ie_jCaVzYTEw-1; Mon, 28 Mar 2022 17:18:29 -0400
X-MC-Unique: KAuh7iH6O9ie_jCaVzYTEw-1
Received: by mail-qv1-f72.google.com with SMTP id
 w10-20020a05621412ea00b00440d10d2799so12275110qvv.9
 for <etnaviv@lists.freedesktop.org>; Mon, 28 Mar 2022 14:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=o/20j76lcDPeDTIfcY54M2M3yeP1hzS1Frzdk4vK99I=;
 b=62Kd9/yFTEbw/xe4EKO/pOdlTjXKBP22DziyoutmoIQc1JD+qRC7Ouz8e2kyLj0CcN
 3FPm6/jdb7w9tDzwwIb3LoEbkTqUI5j300tqN5ouh7rUbbMnlIqGlUHFxLzjKr44lg3Y
 TCo682W4kCKx3NwKTdzKkrk9jYybWMWpIXFf3EbTr7a16fHoekPURt992r8Ka24xSLXT
 3tKvnTiTKOPaxKttyNRIYqhXlqBFtUM/1TS+R5H/VaxENG5YEpzDOFuwNmGYUSq1oTTQ
 BKb0Ln+nUsMxaSSmJ8T1q1YmOV/wW411ltXPeoiP0bzPm2AosEhm/SGsZqk26P3f8L/X
 bdpQ==
X-Gm-Message-State: AOAM530PgtZEbdWxOOp0zc1d/DaG2wfoonc9rM0Ep8qVUOcCx9CYZzef
 telJzdwStlN1iCtIf7NrnjoAMOyl8cVIs3wubKCOloAWjS4dlNMYTNadtXmixpy55yCr1UYWQW9
 I71QVOdHcMK+92BHaOtpbJu9Cng==
X-Received: by 2002:a05:6214:29c8:b0:440:fac2:a6c with SMTP id
 gh8-20020a05621429c800b00440fac20a6cmr23153264qvb.96.1648502308561; 
 Mon, 28 Mar 2022 14:18:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx80FvxqgxoMsKHifZxJPlSaASMzEtm2PCjdcW91NHHki6CRsyrlYXzQuiJUFDSkSZnID/Qgg==
X-Received: by 2002:a05:6214:29c8:b0:440:fac2:a6c with SMTP id
 gh8-20020a05621429c800b00440fac20a6cmr23153243qvb.96.1648502308333; 
 Mon, 28 Mar 2022 14:18:28 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 br13-20020a05620a460d00b00680d020b4cbsm2856816qkb.10.2022.03.28.14.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:18:27 -0700 (PDT)
Message-ID: <dc0ead0da30d0ccf8c4c57a2548d293c57407080.camel@redhat.com>
Subject: 2022 X.org Foundation Election Candidates
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Mon, 28 Mar 2022 17:18:21 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.DarkModeFix.fc35)
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

To all X.Org Foundation Members:

The election for the X.Org Foundation Board of Directors will begin on 04 April
2022. We have 6 candidates who are running for 4 seats. They are:

    Emma Anholt
    Shashank Sharma
    Ricardo Garcia
    Mark Filion
    Lucas Stach
    Alyssa Rosenzweig

To be found in the link below below are the Personal Statements each candidate
submitted for your consideration along with their Statements of Contribution
that they submitted with the membership application. Please review each of the
candidates' statements to help you decide whom to vote for during the upcoming
election.

    https://www.x.org/wiki/BoardOfDirectors/Elections/2022/

If you have questions of the candidates, you should feel free to ask them here
on the mailing list.

The election committee will provide detailed instructions on how the voting
system will work when the voting period begins.

Lyude Paul, on behalf of the X.Org elections committee

