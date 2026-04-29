Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH8aC4ku8mlvogEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Wed, 29 Apr 2026 18:15:05 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAEC497917
	for <lists+etnaviv@lfdr.de>; Wed, 29 Apr 2026 18:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CB6892ED;
	Wed, 29 Apr 2026 16:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="adwaPxQN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FO3iYDpK";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C88310F08A
 for <etnaviv@lists.freedesktop.org>; Wed, 29 Apr 2026 16:14:57 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63TF7UOi1641654
 for <etnaviv@lists.freedesktop.org>; Wed, 29 Apr 2026 16:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=QlIuh8BM0Sa
 SyTeAREDnPHaWMXvZjHEGYrSurFk/U6c=; b=adwaPxQN1ZFLAoj5evhUxLj8Dub
 gQzwmrMQs6MKYZhkYAg85k5YXLDNXCttNlXn+hKBLMJdI9GgMACVPujLb+6/1Izp
 UW0vdfGT5a5liZ9LTWnwFm5rbs7wmB3j7jv3Uhvb3llXqB0CSLXuP4D9Q19ZsoxA
 GDC8cksxVQv5T/jW04qUiJKBV9/WU0CLRqI2uko3JP1CsnDtRynkT95VczHZ54wr
 mtnQXkq4PowTF1OVbQkCE3U5xpZPhIVPidMLdA2eAVDzTUWI1W4uh4xEf8TEfce1
 gB47Dua0eYb6FNxWDUI/DhbNawh24OfStpfOCdoxge/dwBEqFyuAvXKLoAw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj82de3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <etnaviv@lists.freedesktop.org>; Wed, 29 Apr 2026 16:14:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-56eeff9a2e3so22070518e0c.3
 for <etnaviv@lists.freedesktop.org>; Wed, 29 Apr 2026 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777479296; x=1778084096;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlIuh8BM0SaSyTeAREDnPHaWMXvZjHEGYrSurFk/U6c=;
 b=FO3iYDpKCsxvuXgPlo6xchQexhAY6cypQKD8GkEqer/bWUoC8pHFsykAE4JUDZrbHp
 pbd3c4peFtmWf7oJHOFi3vEhsnilrmUaKTRB6c/CnxQCf3md8VjWB8Cbbs+cScAHBwxO
 BMD6LXWou7yqzKogPLEQKvlHCuXgDQGsXlzMcHhy1J/yxzgoMvE/qNp12BmfBny8EvwR
 qBfJXjBb+7SRPvrPcViipqGsR0duIeKavYluaSDbBtGTQ8+rAM/fU0NzYMdTs6h/xFS+
 IfytL65u9U5b15Iu9HUb15FEw0eO9caLTnSuj+QwNBvxlKmnMEhE6uPF6GHcvZY7vsP9
 GOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777479296; x=1778084096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QlIuh8BM0SaSyTeAREDnPHaWMXvZjHEGYrSurFk/U6c=;
 b=ah4uc3P62vbDc+Mm5Qe9GVtmcef6+nBhzxoFMNZUHj7RL8e154dkozhJ4OuNCZYRO4
 6K1OwpXHH36QPTaeHQQ3WxGqny7CCkWd5SVFTMsRWcXPGVGPMIAtklud857436d7KNkg
 q7wLx+gGVT1g8g0Qnd6Dx86+rZa6LgIjaB8+QggYTkLzYLtj1wQn7/vlWkUb88vlHbBm
 pMJgDuoWTIKGZt7KbpWu31wX8nJIuDXCa4sy+4tjb74YfU4+5LmlbDcIcHn4ylxKxmYS
 u+qd2IZ6/fJdf87RhjARGhiOAchdhZImo5uAahVvM4f0st16EJRHQbLvkPOOf8w7jwH6
 zAgA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+WDo8cCWm3C5k0X9/P9Lj6hEMHzszjcjTAv/lKl8/VuSA7J+tezD95L1WaCa3ZXNYVZH412vOI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLOBvMPJjN8mN9Kxjzt34jE9BflTPDRDqeKiAq41mpkL3wh5sz
 qHVl6x8LlzwHKUWrdCpRzfTlwTeZCpAEqcguluHa8GvXJQWZKWA0hmUXeAPDRL1Idr5CxMQRmH3
 gawU8qzmMRVfp9H/z9lhTpCLxHmHUy7el16j6MB7ek2qFOfHW5heqH1kEkh4iHm56WO0g
X-Gm-Gg: AeBDieup2fFrSvbOtFzfeBksyJQNdZMh1omsnzaIDhfmlmsuQh++gjivJA3t+/hdpDA
 s/Xnz2mxqmK5fxjNhyTl6aFSxgKHgHckci+KDprrlQ9onqfYy9Izgct9CzGRwGXiN4IaRXhusq7
 eGMTCoE9kbzY0N4T+asi+aOkIfREOzNWTHpJ007WyGQ/5ZZlsXDxoOKVqSPwzz87bbSk4b2e3vu
 n2UCQHOhIPiKYojRgTKwrEOWUxGEDtqfyklRWkekiNmJKYay+9jVZ1FScp6uqoIGSRsFBlbCfoD
 B/h5jp5qm4Iv6Et0h5q2a3aAgyManopAKlPuKB8Zdl4KW5ZGx4GrCisei8y5rh+oY6EeMiphEV2
 6kq0Mi0zTolRWXQ0xDnOo/pcEbMsPedzyyFztEovv/eQmGD0pY1LZMcjxDfw0
X-Received: by 2002:a05:6122:24c:b0:56f:7c7e:f33a with SMTP id
 71dfb90a1353d-573a52eea5dmr5244113e0c.0.1777479295863; 
 Wed, 29 Apr 2026 09:14:55 -0700 (PDT)
X-Received: by 2002:a05:6122:24c:b0:56f:7c7e:f33a with SMTP id
 71dfb90a1353d-573a52eea5dmr5244024e0c.0.1777479295316; 
 Wed, 29 Apr 2026 09:14:55 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81ed659dsm2438525e9.2.2026.04.29.09.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 09:14:54 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benson Leung <bleung@chromium.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 etnaviv@lists.freedesktop.org (moderated list:DRM DRIVERS FOR VIVANTE GPU IP), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR VIVANTE GPU IP)
Subject: [PATCH v3 08/11] thermal/of: Introduce cooling device of_index
Date: Wed, 29 Apr 2026 18:14:21 +0200
Message-ID: <20260429161430.3802970-9-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
References: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fGG7m4SJ8PKgeOD81DUgP-nwnqaFqII-
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f22e80 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=kkni0TwwaAke5k-tc94A:9
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: fGG7m4SJ8PKgeOD81DUgP-nwnqaFqII-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfXzHgBrYTe1FYp
 FknvUVHt2LruRJk3lSfkDfRUi7NZGs8pwhfK7Q/e9+VibEybNAWBhN+f7GPrV+Dpx0vcTM26sho
 tsRQ7oZFqse9zUMQzY9vc3dz88fCkF6oXI8dMWEHbzOgfbVj0OFz+Ra7Pk0M8RtvhPuiGa6wSsX
 RUtVxMJL3WVn6NBKIK5ON0S6SjfhSa/Sa/ym5iE3oTWB2EnAUh9TInYZDr85nzihVrp3QXloEZX
 /myQEQ54cr69CdSDAU3G4M053/8yR/ctBjC2tEnvtS505s98rqDnr7TTbUKWyOvaDwydrMwPAr2
 o6sJuhiojKWC4ZyAZZMg20s3idiwPRM5ECTBvV/Ofmd+d2xJ19RGuro+ag0ZPFXWHuITIchBc1/
 kzhj2FugIKbv2UqdodFZILr/PERDvF7S7ZIu8Q06h/OCTs110ah29bw3YYoATznpWCJyaxtA2Pp
 jMZG0pjKZkysH8S+yiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290162
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
X-Rspamd-Queue-Id: 9BAEC497917
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,intel.com,arm.com,kernel.org,pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,roeck-us.net,jms.id.au,codeconstruct.com.au,weissschuh.net,chromium.org,google.com,sntech.de,nvidia.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux@roeck-us.net,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux@weissschuh.net,m:bleung@chromium.org,m:pali@kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:heiko@sntech.de,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:amit.kachhap@gmail.com,m:viresh.kumar@linaro.org,m:neil.armstrong@linaro.org,m:amitk@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:krzk@kernel.org,m:conor@kernel.org,m:linux@armlinux.org.u
 k,m:christiangmeiner@gmail.com,m:taliperry1@gmail.com,m:thierryreding@gmail.com,m:amitkachhap@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,etnaviv-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.199];
	TAGGED_RCPT(0.00)[etnaviv,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]

As described in the previous change, the new incoming DT binding will
describe a tuple device_node + cooling device id, instead of child
nodes.

Let's augment thermal_of_cooling_device_register() to receive the
cooling device id and propagate the changes to the four remaining
drivers using the non-devm version of the cooling device registering
function.

Add the id in the cooling device structure and store the value when
registering it.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  5 +++--
 drivers/thermal/cpufreq_cooling.c     |  2 +-
 drivers/thermal/cpuidle_cooling.c     |  2 +-
 drivers/thermal/devfreq_cooling.c     |  2 +-
 drivers/thermal/thermal_of.c          | 21 ++++++++++++++++-----
 include/linux/thermal.h               |  6 ++++--
 6 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a891d4f1f843..552631c3554a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1791,8 +1791,9 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	int ret;
 
 	if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL)) {
-		gpu->cooling = thermal_of_cooling_device_register(dev->of_node,
-				(char *)dev_name(dev), gpu, &cooling_ops);
+		gpu->cooling = thermal_of_cooling_device_register(dev->of_node, 0,
+								  dev_name(dev),
+								  gpu, &cooling_ops);
 		if (IS_ERR(gpu->cooling))
 			return PTR_ERR(gpu->cooling);
 	}
diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 32bf5ab44f4a..768859a7aed0 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -592,7 +592,7 @@ __cpufreq_cooling_register(struct device_node *np,
 	if (!name)
 		goto remove_qos_req;
 
-	cdev = thermal_of_cooling_device_register(np, name, cpufreq_cdev,
+	cdev = thermal_of_cooling_device_register(np, 0, name, cpufreq_cdev,
 						  cooling_ops);
 	kfree(name);
 
diff --git a/drivers/thermal/cpuidle_cooling.c b/drivers/thermal/cpuidle_cooling.c
index 425f596614e8..bbd2e91cf5ab 100644
--- a/drivers/thermal/cpuidle_cooling.c
+++ b/drivers/thermal/cpuidle_cooling.c
@@ -207,7 +207,7 @@ static int __cpuidle_cooling_register(struct device_node *np,
 		goto out_unregister;
 	}
 
-	cdev = thermal_of_cooling_device_register(np, name, idle_cdev,
+	cdev = thermal_of_cooling_device_register(np, 0, name, idle_cdev,
 						  &cpuidle_cooling_ops);
 	if (IS_ERR(cdev)) {
 		ret = PTR_ERR(cdev);
diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 1c7dffc8d45f..0330a8112832 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -454,7 +454,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 	if (!name)
 		goto remove_qos_req;
 
-	cdev = thermal_of_cooling_device_register(np, name, dfc, ops);
+	cdev = thermal_of_cooling_device_register(np, 0, name, dfc, ops);
 	kfree(name);
 
 	if (IS_ERR(cdev)) {
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index cf60ac64db54..b38623f6b89f 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -511,16 +511,23 @@ void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_dev
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_zone_unregister);
 
+struct thermal_of_cdev_init {
+	struct device_node *np;
+	int of_index;
+};
+
 static void thermal_of_cooling_device_init(struct thermal_cooling_device *cdev, void *data)
 {
-	struct device_node *np = data;
+	struct thermal_of_cdev_init *of_cdev = data;
 
-	cdev->np = np;
+	cdev->np = of_cdev->np;
+	cdev->of_index = of_cdev->of_index;
 }
 
 /**
  * thermal_of_cooling_device_register() - register an OF thermal cooling device
  * @np:		a pointer to a device tree node.
+ * @of_index:	a cooling device index in the cooling controller
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
  * @ops:		standard thermal cooling devices callbacks.
@@ -534,14 +541,18 @@ static void thermal_of_cooling_device_init(struct thermal_cooling_device *cdev,
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
 	struct thermal_cooling_device *cdev;
+	struct thermal_of_cdev_init of_cdev = {
+		.np = np,
+		.of_index = of_index,
+	};
 
 	cdev = __thermal_cooling_device_register(type, devdata, ops,
-						 thermal_of_cooling_device_init, np);
+						 thermal_of_cooling_device_init, &of_cdev);
 	if (IS_ERR(cdev))
 		return cdev;
 
@@ -585,7 +596,7 @@ devm_thermal_of_child_cooling_device_register(struct device *dev,
 	struct thermal_cooling_device *cdev;
 	int ret;
 
-	cdev = thermal_of_cooling_device_register(np, type, devdata, ops);
+	cdev = thermal_of_cooling_device_register(np, 0, type, devdata, ops);
 	if (IS_ERR(cdev))
 		return cdev;
 
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index e39bec84b2b6..26e33c0236c4 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -134,6 +134,7 @@ struct thermal_cooling_device {
 	struct list_head node;
 #ifdef CONFIG_THERMAL_OF
 	struct device_node *np;
+	int of_index;
 #endif
 #ifdef CONFIG_THERMAL_DEBUGFS
 	struct thermal_debugfs *debugfs;
@@ -201,7 +202,8 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
 void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_device *tz);
 
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np, const char *type, void *devdata,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
+				   const char *type, void *data,
 				   const struct thermal_cooling_device_ops *ops);
 
 struct thermal_cooling_device *
@@ -224,7 +226,7 @@ static inline void devm_thermal_of_zone_unregister(struct device *dev,
 }
 
 static inline struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
-- 
2.43.0

