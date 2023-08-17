---
title: "Get Video"
date: 2023-08-17T15:56:32+03:00
draft: false
---

Fetches the video full info with its UUID.

{{% notice note %}}
Base url `https://api.omegastream.net/company/client/video` this will be called from now as *`{base_url}`*
{{% /notice %}}

### Endpoint

```url
GET: {base_url}/:uuid
```

- **:uuid**: video's uuid. (ex: `a0dc8dbf-3126-4805-89a1-662a33331f93`)

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |   |


### Response

Status Code: `200` OK

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
        ...
    },
    "playback_v2": {
        ...
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
       ...
    },
    "meta": {
        "downloaded_from": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4"
    }
}
```

{{% notice note %}}
You can find the full video model details [here](/video/managment/video_model)
{{% /notice %}}
