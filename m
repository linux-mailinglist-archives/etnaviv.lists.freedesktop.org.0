Return-Path: <etnaviv-bounces@lists.freedesktop.org>
X-Original-To: lists+etnaviv@lfdr.de
Delivered-To: lists+etnaviv@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA78BB1F7
	for <lists+etnaviv@lfdr.de>; Fri,  3 May 2024 19:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11EF10FCE7;
	Fri,  3 May 2024 17:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cWyjYN7l";
	dkim-atps=neutral
X-Original-To: etnaviv@lists.freedesktop.org
Delivered-To: etnaviv@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FCC10FCE7
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2024 17:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714758895;
 bh=NHPpYbdKZ3/z/d9k/T7FQOYmAcAzBTu6ze6a4YOX1BY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=cWyjYN7lmeU+NrTJN610ZBq8FqjHvL78JPlDd624ZzJIWo6o6T1p1O6w0fKEuN5qF
 vbOgktJ4m3j1fCA9kDUdhiA54p5NgJjr88l0M/t689iHlmw6pdiaS2Mrzbw39z6zYD
 pBJx5XBahI7BNQ4IB0H6YKCIH6o6Dq9R9Jry+yfUglWsT2JdQMv4Ckd0yKkzgBcI+D
 761fLwj316/EOUqmzNjN0IiSAcp+PffmtEZBmCaj+HvhsbaoOAQgo/Lr91cxPd/Dt6
 pojJp1twAJm9YH6gewigPESQKvgTEfWc1lH3iVS9urmeZMeTirh0N9bH8qVzCbLZsn
 d+aoHs85WPFwQ==
Received: from [100.120.197.163] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: derekf)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7A454378148F
 for <etnaviv@lists.freedesktop.org>; Fri,  3 May 2024 17:54:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------GSg08nlbLmgnMzk0pVjwlG8G"
Message-ID: <a597b0d0-816b-4063-b35f-08d125c3a0e7@collabora.com>
Date: Fri, 3 May 2024 12:54:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/etnaviv: during dump, read registers twice
To: etnaviv@lists.freedesktop.org
References: <20240503142255.263399-1-derek.foreman@collabora.com>
 <6d4f4269-abe3-4d71-b91a-bb951de14627@collabora.com>
 <489f726758ecfcec0b3955530f405d93ea4a4e99.camel@pengutronix.de>
Content-Language: en-US
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <489f726758ecfcec0b3955530f405d93ea4a4e99.camel@pengutronix.de>
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

This is a multi-part message in MIME format.
--------------GSg08nlbLmgnMzk0pVjwlG8G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lucas,

On 2024-05-03 12:12, Lucas Stach wrote:
> Hi Derek,
>
> Am Freitag, dem 03.05.2024 um 09:27 -0500 schrieb Derek Foreman:
>> I have a follow up question related to this:
>>
>> In etnaviv_sched_timedoutjob we only read this register once - we should
>> probably read twice there as well?
>>
> The register read being unreliable seems to be a specialty of the GPU
> you are dealing with. I'm not saying that making this more robust is
> the wrong thing to do, but I've seen quite a few GPU hang issues over
> time and the reported DMA address always made sense on the GPUs I've
> seen so far.

Yes, this is a GC7000 rev 6009, and it seems to occasionally return very 
exciting values on the first read.

An example:

0000065c = 0000c1f8
00000660 = 00000001 Cmd: [dec DMA: idle Fetch: idle] Req idle Cal idle
00000664 = 00000905 Command DMA address
00000668 = 0000c1f8 FE fetched word 0
0000066c = 080105d0 FE fetched word 1
00000670 = feb71000

Some of the values are shifted by one register. 905 should have been in 
660, c1f8 should have been in 664, and the state load should have been 
in 668 instead of 66c. Very confusing.

  I can only assume this weirdness is why the gpu-viv driver 
unconditionally reads the DMA registers twice every time. I expect that 
the extra read is pointless on most of the registers in the dump, but I 
was lazy - would you prefer I limit the extra read to only DMA registers?

It looks like we use these registers in other places (verify_dma, 
etnaviv_gpu_debugfs). Should I add this double read there as well?

>> Further, that function appears to always treat the first timeout as
>> spurious because gpu->hangcheck_dma_addr starts as 0? The Vivante
>> driver's hang check spins briefly to see if forward progress is being
>> made, would that be a better thing to do there?
>>
> Briefly spinning will yield many false positives, as the DMA frontend
> address doesn't move during large draws. The timeout we are using is
> short enough that in most cases it's okay that we need to hit the
> timeout twice until we mark the GPU as hung, but also long enough so it
> doesn't get confused by large draws.

Fair enough - I won't bother sending a patch to change that behavior.

I do wonder if setting the timeout to be twice as long instead of 
requiring it to trigger twice would be more intuitive, though.

Thanks,
Derek


> Regards,
> Lucas
>
>> Thanks,
>> Derek
>>
>> On 2024-05-03 09:22, Derek Foreman wrote:
>>> The vivante driver always reads dma registers twice and discards the first
>>> value - we need to do this too or at least the DMA address and low/high
>>> fetches can return wrong results.
>>>
>>> Signed-off-by: Derek Foreman<derek.foreman@collabora.com>
>>> ---
>>>    drivers/gpu/drm/etnaviv/etnaviv_dump.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
>>> index 898f84a0fc30..8a8ca8dcc49a 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
>>> @@ -91,6 +91,8 @@ static void etnaviv_core_dump_registers(struct core_dump_iterator *iter,
>>>    		    read_addr <= VIVS_PM_PULSE_EATER)
>>>    			read_addr = gpu_fix_power_address(gpu, read_addr);
>>>    		reg->reg = cpu_to_le32(etnaviv_dump_registers[i]);
>>> +		/* Discard first read, as it is frequently inaccurate */
>>> +		gpu_read(gpu, read_addr);
>>>    		reg->value = cpu_to_le32(gpu_read(gpu, read_addr));
>>>    	}
>>>    
--------------GSg08nlbLmgnMzk0pVjwlG8G
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Lucas,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2024-05-03 12:12, Lucas Stach wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:489f726758ecfcec0b3955530f405d93ea4a4e99.camel@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">Hi Derek,

Am Freitag, dem 03.05.2024 um 09:27 -0500 schrieb Derek Foreman:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I have a follow up question related to this:

In etnaviv_sched_timedoutjob we only read this register once - we should 
probably read twice there as well?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">The register read being unreliable seems to be a specialty of the GPU
you are dealing with. I'm not saying that making this more robust is
the wrong thing to do, but I've seen quite a few GPU hang issues over
time and the reported DMA address always made sense on the GPUs I've
seen so far.</pre>
    </blockquote>
    <p>Yes, this is a GC7000 rev 6009, and it seems to occasionally
      return very exciting values on the first read.<br>
    </p>
    <p>An example:</p>
    <p>0000065c = 0000c1f8<br>
      00000660 = 00000001 Cmd: [dec DMA: idle Fetch: idle] Req idle Cal
      idle<br>
      00000664 = 00000905 Command DMA address<br>
      00000668 = 0000c1f8 FE fetched word 0<br>
      0000066c = 080105d0 FE fetched word 1<br>
      00000670 = feb71000<br>
    </p>
    <p>Some of the values are shifted by one register. 905 should have
      been in 660, c1f8 should have been in 664, and the state load
      should have been in 668 instead of 66c. Very confusing.<br>
    </p>
    <p> I can only assume this weirdness is why the gpu-viv driver
      unconditionally reads the DMA registers twice every time. I expect
      that the extra read is pointless on most of the registers in the
      dump, but I was lazy - would you prefer I limit the extra read to
      only DMA registers?<br>
    </p>
    <p>It looks like we use these registers in other places (verify_dma,
      etnaviv_gpu_debugfs). Should I add this double read there as well?</p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
cite="mid:489f726758ecfcec0b3955530f405d93ea4a4e99.camel@pengutronix.de">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Further, that function appears to always treat the first timeout as 
spurious because gpu-&gt;hangcheck_dma_addr starts as 0? The Vivante 
driver's hang check spins briefly to see if forward progress is being 
made, would that be a better thing to do there?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Briefly spinning will yield many false positives, as the DMA frontend
address doesn't move during large draws. The timeout we are using is
short enough that in most cases it's okay that we need to hit the
timeout twice until we mark the GPU as hung, but also long enough so it
doesn't get confused by large draws.</pre>
    </blockquote>
    <p>Fair enough - I won't bother sending a patch to change that
      behavior.</p>
    <p>I do wonder if setting the timeout to be twice as long instead of
      requiring it to trigger twice would be more intuitive, though.<br>
    </p>
    <p>Thanks,<br>
      Derek<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:489f726758ecfcec0b3955530f405d93ea4a4e99.camel@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">
Regards,
Lucas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Thanks,
Derek

On 2024-05-03 09:22, Derek Foreman wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The vivante driver always reads dma registers twice and discards the first
value - we need to do this too or at least the DMA address and low/high
fetches can return wrong results.

Signed-off-by: Derek Foreman <a class="moz-txt-link-rfc2396E" href="mailto:derek.foreman@collabora.com">&lt;derek.foreman@collabora.com&gt;</a>
---
  drivers/gpu/drm/etnaviv/etnaviv_dump.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
index 898f84a0fc30..8a8ca8dcc49a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
@@ -91,6 +91,8 @@ static void etnaviv_core_dump_registers(struct core_dump_iterator *iter,
  		    read_addr &lt;= VIVS_PM_PULSE_EATER)
  			read_addr = gpu_fix_power_address(gpu, read_addr);
  		reg-&gt;reg = cpu_to_le32(etnaviv_dump_registers[i]);
+		/* Discard first read, as it is frequently inaccurate */
+		gpu_read(gpu, read_addr);
  		reg-&gt;value = cpu_to_le32(gpu_read(gpu, read_addr));
  	}
  
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------GSg08nlbLmgnMzk0pVjwlG8G--
