Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21617ACEF4E
	for <lists+etnaviv@lfdr.de>; Thu,  5 Jun 2025 14:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D5B10E81F;
	Thu,  5 Jun 2025 12:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gnA8cFUy";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5287E10E1BF
 for <etnaviv@lists.freedesktop.org>; Wed,  4 Jun 2025 21:20:59 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-adb2bb25105so57458166b.0
 for <etnaviv@lists.freedesktop.org>; Wed, 04 Jun 2025 14:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749072058; x=1749676858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rv18Nm+XvBnug5jkCOLPhd1kajolgW5alKdvqyQ8Do4=;
 b=gnA8cFUyceRJ7IqL7AGjPwP/diAYTiRZ4GXOFd9W+/Jl8AGd2XnA2j2khrTj27se7G
 1WdZ9CkvL8y4pa981pdTv4djFzfP24yYvgXde5dgVIH8ruwuJBmJajA+oK2mm5CNbjj1
 JU17B3p8I51bkeUt7NTAsMdXIvB8iUZibLWf8ONpxXnVlGriFP4oGct6oZPmZHYnBH9v
 t90UDtI3Zb/oqtD4lzhohfkWQx6xCl+9TFDU0s0BXdxsDjx9vKSpcmMroCglU5XgUq0O
 lt+qcd9MujVWxgVTsTZy+IR7gxBKsRuZK3CnNBWHN4uk9P6LLSdkad+yvlBKEqDFpCsX
 17KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749072058; x=1749676858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rv18Nm+XvBnug5jkCOLPhd1kajolgW5alKdvqyQ8Do4=;
 b=cQcWDqQsr68Rq3ADXrJVv2Rh+hIoVnyzEmstZqTRigZgfijFU3N+5tUPaFZTO+JXLP
 KsjVj8m59pP9CZqoIWpUfOKAsUeKDMixwzkamsXFHJP6CdqqI0ulpudwBChSUEvNYasr
 msBPR7/rResPvEhgd72Ag2mW3xY/2OKDMtpQRATUTGUBReAKNSLbcjDm5ETNE1YMAiHa
 YOiJprxrmQc9/XM4FglSJciUzh2iKvmIWsA7X7wgHmIaQ2wsjkOUu2hjMZ6rzHxtldlc
 /aoCln1U2JTDuzum8qvJPuhM9T4KvxSDFzudfQ6rtOqu+L2ZMoFWquCeepo3yHOQJBd6
 bY1g==
X-Gm-Message-State: AOJu0Yzq3vUqvdr6l9JN1sYtu5EVhZ+NMIXdPHuU6Q/e115Xymqaa8Xf
 QrE4FEoDqKhr1jj1KxfHfb2YDFMUZfarWV8axqaRMCnF99M2lF5DxZ+f3Iuulndr
X-Gm-Gg: ASbGncvwnGxAEeLeXGM+hZBx0FGsm+1ir+Jn8Xgi6Lu+ebBuGN7/QxrtJPF7mIrCrSs
 rTPZTWwXWKFo8N1h7J5myHrrkPJqzk2IdUlZclvibG+drN1ftixNufL+6wAM1yMyu23C4aQ/8YM
 DnaWv+nTqrh62zfYMwuujP1jTCYzAAOZc/QAWnbtLCLGFo79m6SRYY3w+2O+MBncM/pXhxdS+E1
 Jn+7UIYdqZCOWdgvW5LNxlgnJqLNtB+9h+3MOeRmyPS14+AtHNOdXp3XKy8HkZp9vH7Uz70N1dK
 kGnh1gxtynTngaIE2ScHq6/cOs/C6y34p0sT6ikhdK2FB0RtrH6GR3vgf+d3PhBT
X-Google-Smtp-Source: AGHT+IGjQB4IF5lgBt1aVlqsHTIaMvPUeyjzsaHbIYMV8jguhJorOkCKLom4H2I8qKkRakkIdEg6Gw==
X-Received: by 2002:a17:907:9282:b0:ad8:9e80:6baf with SMTP id
 a640c23a62f3a-addf8ce3d31mr404142466b.13.1749072057578; 
 Wed, 04 Jun 2025 14:20:57 -0700 (PDT)
Received: from rivendell.box ([2a02:2454:c280:4800:63d:9df9:3ebb:5fc6])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ada5dd043a9sm1145699466b.89.2025.06.04.14.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 14:20:57 -0700 (PDT)
From: Gert Wollny <gw.fossdev@gmail.com>
X-Google-Original-From: Gert Wollny <gert.wollny@collabora.com>
To: etnaviv@lists.freedesktop.org
Cc: Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH 3/4] etnaviv: Add a new function to emit a series of states to
 cmd stream
Date: Wed,  4 Jun 2025 23:19:21 +0200
Message-ID: <20250604212032.3387616-4-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250604212032.3387616-1-gert.wollny@collabora.com>
References: <20250604212032.3387616-1-gert.wollny@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Jun 2025 12:35:02 +0000
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

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
index 0cb65a0c3bfc..b0a093b28774 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
@@ -41,6 +41,20 @@ static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer,
 	OUT(buffer, value);
 }
 
+static inline void CMD_LOAD_STATES_START(struct etnaviv_cmdbuf *buffer,
+					u32 reg, u32 nvalues)
+{
+	u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
+
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	/* write a register via cmd stream */
+	OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
+	    VIV_FE_LOAD_STATE_HEADER_OFFSET(index) |
+	    (VIV_FE_LOAD_STATE_HEADER_COUNT(nvalues) &
+	     VIV_FE_LOAD_STATE_HEADER_COUNT__MASK));
+}
+
 static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
 {
 	buffer->user_size = ALIGN(buffer->user_size, 8);
-- 
2.47.2

