---
title: "Delete Video"
date: 2022-10-15T18:04:37+02:00
draft: false
weight: 3
---

## Delete video by uuid

{{% notice note %}}
Base url `https://api.omegastream.net/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

Delete the givin video using its UUID, but the video should be completed processing or failed for more than **4 hours**.

To fetch **ONLY** all deleted videos use [Fetch Deleted](#delete-video-by-uuid).

{{% notice warning %}}
When the video is deleted it can't be streamed or watched. If you need to revert deletion, head to [Revert Deletion](#revert-video-deletion-by-uuid)
{{% /notice %}}

### Endpoint
```url
DELETE: [base_url]/client/video/:uuid
```
- `:uuid`: video's uuid.

### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |


### Response
```json
{
    "message": "video is not available anymore"
}
```

---

## Revert video deletion by uuid

### Endpoint
```url
POST: [base_url]/client/video/revert_deletion/:uuid
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
```json
{
    "message": "video is not available again"
}
```