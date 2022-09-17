---
title: "Fetch video"
date: 2022-09-15T18:04:05+02:00
draft: false
---

Fetches the video full info with its UUID.

{{% notice note %}}
Base url `https://omega-stream.site/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

### Endpoint
```url
GET: [base_url]/client/video/:uuid
```
- **:uuid**: video's uuid. (ex: `a0dc8dbf-3126-4805-89a1-662a33331f93`)

### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |


### Response
```json
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
```