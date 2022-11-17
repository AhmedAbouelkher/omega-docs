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

---

## Fetch only deleted videos

### Endpoint
```url
POST: [base_url]/client/video/deleted
```

### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |


### Response
```json
[
    {
        "id": "6322f9ad601b871c57d875a6",
        "created_at": "2022-09-15T10:08:45.712Z",
        "updated_at": "2022-09-15T10:14:02.645Z",
        "deleted_at": "2022-09-16T10:14:07.324Z",
        "title": "TearsOfSteel",
        "uuid": "86a7f8bd-a365-4070-94b6-7fd179838ecd",
        "coid": "omega-cop-KoNef9DB5i",
        "status": "process-completed",
        "entity_tag": "a1630fb6d7056812bf7cbc3a5f4cc062-36",
        "playback": {
            "hls": "s3://processed-enterprise-media/93db1c64/video/86a7f8bd-a365-4070-94b6-7fd179838ecd/playlist.m3u8",
            "dash": null
        },
        "input": {
            "width": 1280,
            "height": 534
        },
        "duration": 734,
        "size": 185765954,
        "ready_to_stream": true,
        "thumbnail": "s3://processed-enterprise-media/93db1c64/video/86a7f8bd-a365-4070-94b6-7fd179838ecd/thumbnail.png",
        "thumbnail_timestamp_pct": null,
        "storage": {
            "bucket": "processed-enterprise-media",
            "raw_bucket": "raw-enterprise-media",
            "meta": null
        },
        "meta": {
            "downloaded_from": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
        }
    }
]
```