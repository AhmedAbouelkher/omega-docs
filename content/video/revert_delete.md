---
title: "Revert Video Delete"
date: 2023-08-17T16:19:04+03:00
draft: false
---

You can revert the deletion of the video using its UUID.

{{% notice note %}}
Base url `https://api.omegastream.net/company/client/video` this will be called from now as *`{base_url}`*
{{% /notice %}}


### Endpoint

```url
POST: {base_url}/revert_deletion/:uuid
```

- `:uuid`: video's uuid.

### Url Query 

- `status`: video status. for [more](/video/managment/video_model#video-status).

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |


### Response

Status Code: `204` No Content