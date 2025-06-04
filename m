Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F7FACEF51
	for <lists+etnaviv@lfdr.de>; Thu,  5 Jun 2025 14:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA4C10E87A;
	Thu,  5 Jun 2025 12:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UXwzIoU3";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2728410E1BF
 for <etnaviv@lists.freedesktop.org>; Wed,  4 Jun 2025 21:20:57 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d54bso387502a12.2
 for <etnaviv@lists.freedesktop.org>; Wed, 04 Jun 2025 14:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749072055; x=1749676855; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=/jgnW+seAU5B54GuyMKF0J551SIwtf+uOkY04EcOe54=;
 b=UXwzIoU3QYR8/PZvJS5OFj9ie+/UgrK25bvaxsFgh7TzXpc9ObpTPg1t283QOwVwGV
 KKmzZ8HtuC1HgheMrSmz0ctkECYrQEcD0vSEqhUE/27BmWxngZA/1Rify4SyusLWkE2e
 7EFmTT91JcUB+eoF47Z55ky4nVrxopukH1oouvs3w/XP/S6gLkBi2p/VhHZkQBeHXjZh
 2zHBLyYyJyc6p2O2mTguBkHkvPgCsYBMbMe7n7r+f0b1svvdeS9eXNcEwJazr+QP97Wh
 if+tp+0Wue0TnAbxjQ8JiHAYwAH6wPjP52pZedi1csMAPkFk6tCRpWnWqKIOENAV3nIT
 eYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749072056; x=1749676856;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/jgnW+seAU5B54GuyMKF0J551SIwtf+uOkY04EcOe54=;
 b=ED5eRMQu7/21YTsLAPCDM76CyN8w1+EEFNsfaMPhoY9ZnH2bXrZRpJ1T2blxRDetWh
 7Azu71hr2x9OmnlKDpXog2JfVvVQXy7iT26TjD0B6ATvkUBwsCu6erEWUSUhP1fI7jNr
 FpcE4AMEa3dcpOQoUErDkunrR55sNb5AE/4DF3eK6Re2LahKRPWFR0Oh2DqBDxt4fFWu
 lM4Gw8EuOclFRAel/QkN3ELAZN5sLXGHVyPXtDCCnSN5HtjvuLt5VT+q3jvIoCTy7F58
 mKa4LOC/q/DW7N32c3E53bFIEd2Mta0N4x4ap4ictHlqQKTzV+8AJ8WY/roPPSegNVF7
 DWvg==
X-Gm-Message-State: AOJu0YwSD5kg+UOF2JFWInjLcWmtgUTlyB48UCXCGPY8mcaNnSbP21Hs
 EskFUkxEajgJUPM5GEZR4Ankl66laTxsHydUkor+ikP/vDo5mwufg1ZxWX5Hu0Al
X-Gm-Gg: ASbGnct1bnKrlULYyXwS4YT2dSEPkUSqhrdfBXL3BoK8vETf9QP9Y7GsDZDaCkvnIFa
 Jxe/vrQpJ9BLKkF5358EPgscF8uA9vlxSq9bAhgg12rD0+9SfYGRWSoskWOVdY6Gohlgiq/v/mR
 3ssLljksEaTih6P/s5aeM0gsAaXQ4noBSXZ4pCb/IYoi56uoi63i+ltNfjdX2GYepIruOwy/LXs
 yn0ts1RXlLMFbampV36Z7nBaUmOjh0NYwIb5JEbFK4/0T48FEvcBhs1H9ozPpLPSFSEkXewx+qo
 rVnjoE1fN3fF8vtI1aO64amw6LFbHpSsgal2uxZKg3mw8xocfQpzFtfJNVoLHHim
X-Google-Smtp-Source: AGHT+IEi+rvwyOCje3Sf+uzVcWBgwmkUKv4J+W2OO/2AzGMWVeJOIxclSpJfcdamgJTgJ79X/F75PQ==
X-Received: by 2002:a17:906:dc93:b0:ad2:43b6:dd75 with SMTP id
 a640c23a62f3a-addf8c9b356mr411068466b.10.1749072055477; 
 Wed, 04 Jun 2025 14:20:55 -0700 (PDT)
Received: from rivendell.box ([2a02:2454:c280:4800:63d:9df9:3ebb:5fc6])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ada5dd043a9sm1145699466b.89.2025.06.04.14.20.54
 for <etnaviv@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 14:20:55 -0700 (PDT)
From: Gert Wollny <gw.fossdev@gmail.com>
X-Google-Original-From: Gert Wollny <gert.wollny@collabora.com>
To: etnaviv@lists.freedesktop.org
Subject: RFC: Add PPU flop reset 
Date: Wed,  4 Jun 2025 23:19:18 +0200
Message-ID: <20250604212032.3387616-1-gert.wollny@collabora.com>
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

