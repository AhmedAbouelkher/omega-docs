---
title: "Delete Multiple Videos"
date: 2023-08-17T16:08:14+03:00
draft: false
---

{{% notice note %}}
Base url `https://api.omegastream.net/company/client/video` this will be called from now as *`{base_url}`*
{{% /notice %}}

{{% notice tip %}}
Incase you want to delete a single video, you should use [Delete Video](/video/delete_video) api instead.
{{% /notice %}}

### Endpoint

```url
DELETE: {base_url}/delete_videos
```

### Request Body

```json
{
    "uuids": [
        "a0dc8dbf-3126-4805-89a1-662a33331f93"
        "ec070291-f584-4ce0-af1a-58fbe46cb905"
    ]
}
```

- ```uuids```: array of video's uuids. min length is 1 and max length is 50.

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |

### Response

Status Code: `200` OK

```json
{
    "has_error": false,
    "videos_count": 1,
    "updated_count": 1,
    "failed_count": 0,
    "failed_videos": {}
}
```