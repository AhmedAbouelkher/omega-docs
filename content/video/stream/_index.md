---
title: "Stream"
date: 2022-09-15T23:31:03+02:00
draft: false
weight: 4
pre: "<b>4. </b>"
---

{{% notice note %}}
Base url `https://omega-stream.site/stream` this will be called from now as *`[base_url]`*
{{% /notice %}}

### Endpoint
```url
GET: [base_url]/company/{S3_PATH}
```

- **S3_PATH** represents the video s3 url without ***s3://*** ex: `processed-enterprise-media/bc233331/video/cbd7774c-aea7-4d8a-83d5-d0d51002dd53/playlist.m3u8`.

### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |
