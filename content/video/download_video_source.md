---
title: "Download Video Source"
date: 2024-02-12T20:55:51+02:00
draft: false
---


{{% notice note %}}
Base url `https://api.omegastream.net/company/client/video` this will be called from now as *`{base_url}`*
{{% /notice %}}

## Get video source URL by uuid

### Endpoint

```url
GET: /:uuid/src_download
```

- `:uuid`: video's uuid.

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |


### Response

Status Code: `200` OK

```json
{
    "url": "SRC_DOWNLOAD_URL"
}
```

{{% notice warning %}}
Do not assume any thing about the `SRC_DOWNLOAD_URL` it can be a temporary url or a permanent url. It is recommended to request the source url when you need it.
{{% /notice %}}