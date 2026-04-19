Return-Path: <etnaviv-bounces@lists.freedesktop.org>
Delivered-To: lists+etnaviv@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM97CfRl8GnKSwEAu9opvQ
	(envelope-from <etnaviv-bounces@lists.freedesktop.org>)
	for <lists+etnaviv@lfdr.de>; Tue, 28 Apr 2026 09:47:00 +0200
X-Original-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795E947F2C2
	for <lists+etnaviv@lfdr.de>; Tue, 28 Apr 2026 09:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300B910EA4F;
	Tue, 28 Apr 2026 07:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtI/BbYq";
	dkim=permerror (0-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lt7NZaMd";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D49810E008
 for <etnaviv@lists.freedesktop.org>; Sun, 19 Apr 2026 18:22:56 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63JGCa7x1508425
 for <etnaviv@lists.freedesktop.org>; Sun, 19 Apr 2026 18:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mBAk+Sm+mnO
 5DTzI9lKqPEUkJ5P/e03TPLtapt4NgHw=; b=TtI/BbYqpUab5NfqgQhMFLclp+1
 vB8QQKaUZdB3IKVwvUETKTX7BPZaM0leoiaXakCLo+BH3SBzBCFmCiehpHxoXYZM
 pM+ImQCuUPJdNay9rYSFyPJMflKv5KATqG+qDw2CnQof6stTseqGtop+jqw3YtnZ
 2gi3MuZITOPyCcC6+OKw8mhoS4FlFGH01J9J1DJWArEuDb1xPztJyEWE3Q4x2X0r
 uopJsMioEiWd4ImnyLchni5JQEAxGVeXYiVpiEMMAhVIKdWvyR+OscjBxdOoR6Yn
 CBQVZ3tVV3rJ20/nTm6ZzQzaW2GNfuEN9zMxaA5rJKuFOGUAEkWSM1c3rtA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21ujyt4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <etnaviv@lists.freedesktop.org>; Sun, 19 Apr 2026 18:22:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50b802961ecso25448091cf.1
 for <etnaviv@lists.freedesktop.org>; Sun, 19 Apr 2026 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776622975; x=1777227775;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mBAk+Sm+mnO5DTzI9lKqPEUkJ5P/e03TPLtapt4NgHw=;
 b=Lt7NZaMd+TsfKvUL8U9kfqDtx1jGEFP1lIkZRii6xxkcBvF4BTN8rM/Lk7nadlObWf
 wOAfkz4oqI4lA0n8+3eQGGGIcMkUYowx9Dg8wVFT9Rhu5BNHzHfLH315zxdrKxWs7GtW
 +jzwsQwDhX8LFEEl2AiJW9SlB62+QqJIwz1iCG4Z8bdoBkMo6tpSrTOeBZQGj0FMfSqt
 ilypwTqFItnPnXPcx2jQrvkyrJihIukv6sfZmUBZqMgHmTt9Zn9L/wvOYOCE9W8QkwD+
 XNJ8IKANaNbQnU3RX91AtmK6m2l45cT05IoCTt4kTnaxUyzo0ZiTERxkZv6NusCAx6B3
 dHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776622975; x=1777227775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mBAk+Sm+mnO5DTzI9lKqPEUkJ5P/e03TPLtapt4NgHw=;
 b=s8MRN6Yaum2W2wVP9iCm+KLLAX+vTGw90MDNTftyvLAh62ojE17EtPHdGQgX9R8X1S
 eX93SFtn0IhXbeGQaXl9B/hFmuotuYB1WW9ENd0NWdIyyJ6fBPhqzrt5u++JSLM9J7HA
 y1HvJQElK017vfMlsyVP5nY7hNRuSjQR6UbNt/zil5he//CL5iQkHwVLclrfcRoVhwb3
 jlmm+hejldg8FJlmOgHFLULa7j+HADB/KblgHYZnEtnSg3ct1MtyqIG1aY0X75qElROK
 wu5FLIVyuHdLJqknYtWQVEAF1X3rIlFAcPK3yvE60T7E622orn4jlzfjyc5ZowBGqbxA
 meWg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+4c5CpAE0400kZfEcQSL6dB/nLqo0y0lDGHY26oygSXJklSw1zlXkUjeBBOmzrcflDWVIB2hvQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz97hWKWHLN+QSniNZGXMw8/Qj7EFmdVuzKGijFjiQtKy5GDQC4
 c73e4bAm1oDoe1k/JAn4s4ujMN8cHElTNRt11xQP/EljsBAUw3D193Kr9ef4OkBMl+v82YHWKUW
 5utqkY/IndRbSWE/u1mEit7bjtuO2gt7kV9QuKAnfcPz4oFS9xeFdrCIFWOm9MMitLcuz
X-Gm-Gg: AeBDiesh9GFc8qO13UScN1vXpr2ctr5HtcdPMabSA7tR77Fg6skMCj7w5s0peUmQVXO
 5FcrTl8H957WqHaflENb74JEH6W2/SyPKbz/SOdr2AGbRmnEfHmcj/bKTbDq4yIk1h7EruGJf8P
 ag7RAvmEvUKptSUcAPvUd+W6I8+d+YZ1rM8IHrgk0sXerITyOg66Q5ABngKbOTaccZQaV9YlRBi
 ZCCV5+7t6kpvpZ2tKjC+jyKd7UI98kx/pYk6WNUbdmeQAAfCg5RGUs4OEzIo25q4tp4VEndrB4Y
 lmRyE2bgg1jFVIB+kHmb9IN2vwDWk4S6uXmScCIrDTZPZIBuUlsfsKBCiY9vNLsIqXrXTrl2XTA
 KbEnUJgR9miLYWg97OvNIczKaQaUqG9uTsXHtp7SGeuu3KT0+4e+yrGbWUrcB
X-Received: by 2002:a05:622a:5c05:b0:50b:4755:94b9 with SMTP id
 d75a77b69052e-50e36c77202mr167950501cf.56.1776622974632; 
 Sun, 19 Apr 2026 11:22:54 -0700 (PDT)
X-Received: by 2002:a05:622a:5c05:b0:50b:4755:94b9 with SMTP id
 d75a77b69052e-50e36c77202mr167950031cf.56.1776622974124; 
 Sun, 19 Apr 2026 11:22:54 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2026 11:22:52 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
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
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 etnaviv@lists.freedesktop.org (moderated list:DRM DRIVERS FOR VIVANTE GPU IP), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR VIVANTE GPU IP)
Subject: [PATCH v1 11/14] thermal/of: Introduce cooling device of_index
Date: Sun, 19 Apr 2026 20:21:55 +0200
Message-ID: <20260419182203.4083985-12-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfX+Qtq4EVmPKr9
 FV7wO1PXbnCAgXi1LPNzcvlaIv+fTzi1xiw0EyXrOHg2sbnvcFzGKMhfjkt1xMOJTv+xL0fOoMl
 Z+MM64pfpFssRSODAc9R0wowVcmokKxfvNiSnIuKxIkqyJhWSVSoUtjRXqOxa6KQEe2drCms0/+
 yDeXSJ4fhixy4g7i4yqvnjh/2glZ5yrzzYqciMYOJACPdTdVMLaorFWlPBFYQ/eFg5MXqljZE67
 vI7GpjzLeZI/uUtCdOaKpJZF2weaiCrdRkSDJHSn5DOTPsAwpZWItSswmm8JaNkp8LNzOM0vgfD
 0PrWceIXgfMN/ll+wIJ4D4DiYlqzmWAekmlCo/BPdvaXQKd82PlfBtdEvRUMde7UDbkpsT+v+YO
 uqepQLJydQGUKlp4c5QNeJncXDBtWxXy95fpMpQC/u5edEQ6Cw9ihYD4kqSxGrugtUCqW1+YHQ6
 jPXKDNL3uAbhy2O6GaQ==
X-Proofpoint-GUID: XMR01PdpAWTJWvwLVhLkUq0DF1Zu7vWx
X-Proofpoint-ORIG-GUID: XMR01PdpAWTJWvwLVhLkUq0DF1Zu7vWx
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e51d7f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=UUaV7nkyxFtcjw1PROYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190197
X-Mailman-Approved-At: Tue, 28 Apr 2026 07:46:57 +0000
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
X-Rspamd-Queue-Id: 795E947F2C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[205];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,intel.com,arm.com,kernel.org,pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,roeck-us.net,jms.id.au,codeconstruct.com.au,weissschuh.net,chromium.org,google.com,sntech.de,nvidia.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,etnaviv-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux@roeck-us.net,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux@weissschuh.net,m:bleung@chromium.org,m:pali@kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:heiko@sntech.de,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:amit.kachhap@gmail.com,m:viresh.kumar@linaro.org,m:neil.armstrong@linaro.org,m:amitk@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:daniel.lezcano@kernel.org,m:dri-devel@lists.freedesktop.org,m:krzk@kernel.org,m:conor@kernel.org,m:linux@armlinux.org.u
 k,m:christiangmeiner@gmail.com,m:taliperry1@gmail.com,m:thierryreding@gmail.com,m:amitkachhap@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[etnaviv@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,etnaviv-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[etnaviv,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid]

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
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 +-
 drivers/thermal/cpufreq_cooling.c     | 2 +-
 drivers/thermal/cpuidle_cooling.c     | 2 +-
 drivers/thermal/devfreq_cooling.c     | 2 +-
 drivers/thermal/thermal_of.c          | 6 ++++--
 include/linux/thermal.h               | 5 +++--
 6 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a891d4f1f843..a965cc0633fc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1791,7 +1791,7 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	int ret;
 
 	if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL)) {
-		gpu->cooling = thermal_of_cooling_device_register(dev->of_node,
+		gpu->cooling = thermal_of_cooling_device_register(dev->of_node, 0,
 				(char *)dev_name(dev), gpu, &cooling_ops);
 		if (IS_ERR(gpu->cooling))
 			return PTR_ERR(gpu->cooling);
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
index ba5093f612d0..a728da1f4e56 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -514,6 +514,7 @@ EXPORT_SYMBOL_GPL(devm_thermal_of_zone_unregister);
 /**
  * thermal_of_cooling_device_register() - register an OF thermal cooling device
  * @np:		a pointer to a device tree node.
+ * @of_index:	a cooling device index in the cooling controller
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
  * @ops:		standard thermal cooling devices callbacks.
@@ -527,7 +528,7 @@ EXPORT_SYMBOL_GPL(devm_thermal_of_zone_unregister);
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
@@ -538,6 +539,7 @@ thermal_of_cooling_device_register(struct device_node *np,
 		return cdev;
 
 	cdev->np = np;
+	cdev->of_index = of_index;
 	thermal_cooling_device_init_complete(cdev);
 
 	return cdev;
@@ -579,7 +581,7 @@ devm_thermal_of_child_cooling_device_register(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	tcd = thermal_of_cooling_device_register(np, type, devdata, ops);
+	tcd = thermal_of_cooling_device_register(np, 0, type, devdata, ops);
 	if (IS_ERR(tcd)) {
 		devres_free(ptr);
 		return tcd;
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 6535353ae83c..9813f02db088 100644
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
@@ -201,7 +202,7 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
 void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_device *tz);
 
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
 				   const char *type, void *data,
 				   const struct thermal_cooling_device_ops *ops);
 
@@ -225,7 +226,7 @@ static inline void devm_thermal_of_zone_unregister(struct device *dev,
 }
 
 static inline struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
-- 
2.43.0

