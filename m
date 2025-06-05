Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F787ACEF53
	for <lists+etnaviv@lfdr.de>; Thu,  5 Jun 2025 14:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8816410E87B;
	Thu,  5 Jun 2025 12:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S08jT/of";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBA910E806
 for <etnaviv@lists.freedesktop.org>; Thu,  5 Jun 2025 12:12:55 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-60700a745e5so1708589a12.3
 for <etnaviv@lists.freedesktop.org>; Thu, 05 Jun 2025 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749125574; x=1749730374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Lf9b+sNUXAKTzOPQttOSORpbiOGE5K+I0E6ezXmb9w=;
 b=S08jT/ofD0Z1NY+9n+jrrP02Rq74ECDXzX2KP+BbF+I40l0p6CQw2MQUGA2J7vT9zW
 874RMIGrdM/GNSSYNGhVcMt0g6FbRi+NmWOPT0YLslTYrpr49fs5mV98FLyp1H88H3ZA
 tm3prplfzrVHaGBqYx9nJqrejzXyludoT7vVDzPn4BPOwstvNIq6wpb8KV8DTNQ4cqqR
 dhOnSsFusfMBAexqvLY1stv19857gSpf6gKERTj6se1r4sZMywYsy4iKqPCAks03EY7f
 PF4IO/gnGcfcK8EkUhygX2vet6vED5a9zu+P8HxBqNRLJJR0qJNQ77UZ2hL3qK/rHdBu
 3W2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749125574; x=1749730374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Lf9b+sNUXAKTzOPQttOSORpbiOGE5K+I0E6ezXmb9w=;
 b=WVrrqxnZ7K+EL2+IFvZkvEYtBh808wgQ+TkHsf4EPnRbBx1jqT1iZLNQu4Eci1inkS
 jMAeddPohrp1bMIOwC27myjyAQdRLUvSfVQ+0gvsneeaKq/ga4OyyAClhZhWWve9BQej
 EwS93dbE8cnCzVxMgkUow1b73MV7e//063X+ic07M7gidVLyxRR/GDh5rd9J9V/V4bzE
 ZEweqGeKseyFqx2Fq6icshQT1kq/j6a46zIvLdpSkqapNLlw9HDemjj5uhTO3uwS4eYO
 McWmk4TmwJDOcnhP+bUbSa6wzfmoMmW8sfLYUnmXeJRe/cffayL4KCobJjm8DlenllZB
 U9Iw==
X-Gm-Message-State: AOJu0YxlkFv8uZAm6EBqmzWacNnG5M2qymmPvLi9pH5QuOJzIb3ZDjol
 po5USaCCQS9xDWetrheR3RpFIAqbIW0vMc+a8TcX1BaLcSNlxCmj28Qjg4Kbww==
X-Gm-Gg: ASbGncsAFHshthDIF1X3vfzLjM/rYdHSQ9IXT/ozb1B07PFh04zNJ3xGYmoobaZlP+f
 qYWy5T9cEQjnf0MWWeCWD0GL4vQF4u+CUnOuG++AxIdVfo3uvWKqfccgwDRjy4P+i7kikdhnuST
 yPYpKJKZx/czbNaF+X3RkzSs0yeiF7uiaeBdhDcpWk21KjbLmhKmEThogxV3umDji5OverUWIvP
 hnOKjEXMKq38i0a2m8laUuckgwBf/II8YxarRd2gHl6xHBewyvih3t/z5BXBI/TlJi8EhrE5Ass
 TK/yKfep1cgIGnM7HP9uETcW0s40ReoN/dfNb7SKXxv1iTMBIbawL/+b/TE=
X-Google-Smtp-Source: AGHT+IHx/Aqbsy3i4O3mLQ04mkcbc5DMCfPjxnhvVIf090XQ5HQGmx4DswFZMl4mq3trU7Wq7W/tEA==
X-Received: by 2002:a05:6402:5c8:b0:602:28d9:d555 with SMTP id
 4fb4d7f45d1cf-606ea3a80ccmr6111447a12.32.1749125574259; 
 Thu, 05 Jun 2025 05:12:54 -0700 (PDT)
Received: from rivendell.box ([2a02:2454:c280:4800:7b01:afa0:a96d:a592])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-606bea242d3sm3360645a12.60.2025.06.05.05.12.53
 for <etnaviv@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 05:12:53 -0700 (PDT)
From: Gert Wollny <gw.fossdev@gmail.com>
X-Google-Original-From: Gert Wollny <gert.wollny@collabora.com>
To: etnaviv@lists.freedesktop.org
Subject: RFC: Add PPU flop reset 
Date: Thu,  5 Jun 2025 14:12:02 +0200
Message-ID: <20250605121230.3405127-1-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Dear all, 

This series adds running the PPU flop reset which is required for some
hardware. This implementation was tested with the STM vendor kernel based on 
linux-6.6.48 and that is provided with 
  https://github.com/STMicroelectronics/oe-manifest/
  Release: openstlinux-6.6-yocto-scarthgap-mpu-v25.04.30

The command stream is based on the stream that is emitted in the acccording 
code of the galcore kernel. Since I have only a stm32mp257f-ev1 board to
test this for all parts that are emitted conditionally in the galcore kernel
only the part that is required for this board is submitted here. 

Thanks for any comments, 
Gert 


[RFC PATCH 1/4] etnaviv: Add command stream definitions required for
[RFC PATCH 2/4] etnaviv: move some functions to a header to be able
[RFC PATCH 3/4] etnaviv: Add a new function to emit a series of
[RFC PATCH 4/4] etnaviv: Add PPU flop reset



