Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D79ACEF56
	for <lists+etnaviv@lfdr.de>; Thu,  5 Jun 2025 14:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A8C10E898;
	Thu,  5 Jun 2025 12:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UiqPzZLN";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40FC10E806
 for <etnaviv@lists.freedesktop.org>; Thu,  5 Jun 2025 12:12:57 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-60727e46168so1327137a12.0
 for <etnaviv@lists.freedesktop.org>; Thu, 05 Jun 2025 05:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749125576; x=1749730376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rv18Nm+XvBnug5jkCOLPhd1kajolgW5alKdvqyQ8Do4=;
 b=UiqPzZLN6UcBg5C6DQweRiymPYw3hRm4/oUSpaBsfzgOEBX7Ri7gU75xrxY3LdZQpG
 FPyj2SKwAlUbGNJlMUDzJOsXD9oMUQ/fOAEZu8TH14qdzK+g/ITGCu1Arq5vYobVdDWD
 Qxm+4kO60VIJXKSw/Ax9hXiGCYa4HtSAHHJfrs9zkNQeYj1rIRZHv2+fBJityYZChhS0
 d20LAlu/1387miQHWKpKKzWLQTCIELUV9zPv7xkrAyCGrTJ1BiYHQNClRVOhyYMS0v0K
 7FKAPYL3JFbudvlAKi1+ELhJa7HqxzhJtyC19qQ86aFFpD+vxyG2JmPvRYxtQLPwb7Cn
 V+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749125576; x=1749730376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rv18Nm+XvBnug5jkCOLPhd1kajolgW5alKdvqyQ8Do4=;
 b=DZYVmWh6+Z6jMmNYXsSowXdQpmhkSgiYrqMKnY9P6nOnYc3Ki3JbqIe7RHKteTph+e
 ANIKoMRcDT7CtTNSb8Dz9Hbl4Z0IYjZTn5cNegT9vyM7ObC3uq6CtQzFLil4LbRasnOy
 pNMeyPevFxrN3pgHr3DCsgOl3b+de7lDVr8MIH4ctjNBVVW01uqLbu3YlGeF+stWb5hG
 A4xMRT5E/nvcbawD8pGvEK8QFHIbFGHTwGYcivcUBDfZ0JMaV3LVdvMCyTyWR+Kj23+/
 oOGJYb6wxVjBOxZrUxgMaupvtwTPdfr3mTN78PrKvDjjzE7O2yw6fh6btFQWakyV/60g
 PZUw==
X-Gm-Message-State: AOJu0Yz0xmsfBmc9RAoxqzbuGka+kkkLimaBqBy47MguO5Lmkr+k0C9a
 KPc9mC887Z/hBOkcwwjqVyqUQZsUS51P5BPP2BuQpUsqlJuKc9LC6NAsM55nbQ==
X-Gm-Gg: ASbGncvRp047GukQYv2OWSNcbljCa7N5Whxnv8HIDynqYzFV33/TVaKdgGg4GiMDg+S
 4COVXzT952d0x4k0bKBWZrX80Zlj3ZQm81yZSKV2Xy1q/ZPpfyLCOeo/krZ3F4Rw4kwVrLX19eJ
 WlywUu/69FHBWxVsFOPfh74wijW6kVg1im4C7AgAB0rQTHZera9TAOnrJFe7dFC2b+0Ipdf8DMw
 ISVLIVG6VnI4pkk51FKxZbDpWAcadqtn8bi6FLFL/uaOOZf0Ca32MrXAIF7lEsqLefGVvfH5Td8
 h8YtHqDebjjvPcn9IhrYkstQrO9wmuHVu4ukmVcgS+pRiCoJqL3ucrNgqClHtZmiwrpAKg==
X-Google-Smtp-Source: AGHT+IFFkufnDMAk5sjOMupKCUKvaQ4LzwcogCmaJi6ZR+TuIsTncmqI3U73nlDq9rTA4SFHxg9CrA==
X-Received: by 2002:a05:6402:51c9:b0:607:671:2e81 with SMTP id
 4fb4d7f45d1cf-6070671331fmr4498132a12.11.1749125576102; 
 Thu, 05 Jun 2025 05:12:56 -0700 (PDT)
Received: from rivendell.box ([2a02:2454:c280:4800:7b01:afa0:a96d:a592])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-606bea242d3sm3360645a12.60.2025.06.05.05.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 05:12:55 -0700 (PDT)
From: Gert Wollny <gw.fossdev@gmail.com>
X-Google-Original-From: Gert Wollny <gert.wollny@collabora.com>
To: etnaviv@lists.freedesktop.org
Cc: Gert Wollny <gert.wollny@collabora.com>
Subject: [RFC PATCH 3/4] etnaviv: Add a new function to emit a series of
 states to cmd stream
Date: Thu,  5 Jun 2025 14:12:05 +0200
Message-ID: <20250605121230.3405127-4-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250605121230.3405127-1-gert.wollny@collabora.com>
References: <20250605121230.3405127-1-gert.wollny@collabora.com>
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

