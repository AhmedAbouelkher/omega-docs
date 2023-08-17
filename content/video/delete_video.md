---
title: "Delete Video"
date: 2022-10-15T18:04:37+02:00
draft: false
---

{{% notice note %}}
Base url `https://api.omegastream.net/company/client/video` this will be called from now as *`{base_url}`*
{{% /notice %}}

{{% notice tip %}}
Incase you want to bulk delete video *multiple videos at once*, you should use [Delete multiple videos](/video/delete_multiple_videos) api instead.
{{% /notice %}}

## Delete video by uuid

Delete the givin video using its UUID, but the video should be completed processing or failed for more than **4 hours**.

To fetch **ONLY** all deleted videos use [Fetch Deleted](#delete-video-by-uuid).

### Endpoint

```url
DELETE: {base_url}/:uuid
```

- `:uuid`: video's uuid.

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |

{{% notice tip %}}
When the video is deleted it can't be streamed or watched. If you need to revert deletion, head to [Revert Deletion](#revert-video-deletion-by-uuid)
{{% /notice %}}

### Response

Status Code: `204` No Content