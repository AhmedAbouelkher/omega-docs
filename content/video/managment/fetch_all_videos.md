---
title: "Fetch all"
date: 2022-09-15T18:03:51+02:00
draft: false
---

Fetches all the videos uploaded by the company in a sorted order (newest is **up**), with no pagination.

{{% notice note %}}
Base url `https://omega-stream.site/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

### Endpoint
```url
GET: [base_url]/client/video/all
```

### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer {{api_key}} | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |


### Response
```json
[
    {
        "id": "6322f9ad601b871c57d875a6",
        "created_at": "2022-09-15T10:08:45.712Z",
        "updated_at": "2022-09-15T10:14:02.645Z",
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
    },
    {
        "id": "6322f996601b871c57d875a5",
        "created_at": "2022-09-15T10:08:22.972Z",
        "updated_at": "2022-09-15T10:14:07.324Z",
        "title": "Sintel",
        "uuid": "a0dc8dbf-3126-4805-89a1-662a33331f93",
        "coid": "omega-cop-KoNef9DB5i",
        "status": "process-completed",
        "entity_tag": "ca29e57cc6e7f9d278a8c4fe4934c53c-37",
        "playback": {
            "hls": "s3://processed-enterprise-media/93db1c64/video/a0dc8dbf-3126-4805-89a1-662a33331f93/playlist.m3u8",
            "dash": null
        },
        "input": {
            "width": 1280,
            "height": 546
        },
        "duration": 888,
        "size": 190612452,
        "ready_to_stream": true,
        "thumbnail": "s3://processed-enterprise-media/93db1c64/video/a0dc8dbf-3126-4805-89a1-662a33331f93/thumbnail.png",
        "thumbnail_timestamp_pct": null,
        "storage": {
            "bucket": "processed-enterprise-media",
            "raw_bucket": "raw-enterprise-media",
            "meta": null
        },
        "meta": {
            "downloaded_from": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"
        }
    }
]
```