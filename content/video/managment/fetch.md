---
title: "Fetch video"
date: 2022-09-15T18:04:05+02:00
draft: false
weight: 2
---

Fetches the video full info with its UUID.

{{% notice note %}}
Base url `https://api.omegastream.net/company` this will be called from now as *`[base_url]`*
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
    "id": "63fcdbd82eec9b89aa5bfdf3",
    "created_at": "2023-02-27T16:35:36.008Z",
    "updated_at": "2023-02-27T16:55:26.156Z",
    "deleted_at": null,
    "title": "WeAreGoingOnBullrun",
    "uuid": "17008615-2fd2-46f3-bb85-2ad4ca0466e1",
    "coid": "omega-cop-f60d8a4c",
    "status": "process-completed",
    "privacy": "private",
    "playback": {
        "hls": "s3://dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/playlist.m3u8",
        "dash": "s3://dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/playlist.mpd",
        "audio": "s3://dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/audio.aac",
        "r_1080p": null,
        "r_720p": "s3://dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/720p.mp4",
        "r_360p": "s3://dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/360p.mp4",
        "r_480p": "s3://dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/480p.mp4",
        "r_240p": "s3://dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/240p.mp4"
    },
    "input": {
        "width": 1280,
        "height": 720
    },
    "duration": 47,
    "size": 59039744,
    "ready_to_stream": true,
    "thumbnail": "s3://dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/thumbnail.png",
    "thumbnail_timestamp_pct": null,
    "storage": {
        "bucket": "dev-processed-media",
        "raw_bucket": "raw-client-media",
        "provider": "omega",
        "source": {
            "key": "raw-client-media/69e4ed89/17008615-2fd2-46f3-bb85-2ad4ca0466e1.mp4",
            "size": 13183260
        },
        "meta": null
    },
    "meta": {
        "downloaded_from": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4"
    }
}
```