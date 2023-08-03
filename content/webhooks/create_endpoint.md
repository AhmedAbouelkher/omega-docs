---
title: "Create An Endpoint"
date: 2022-09-15T22:37:32+02:00
draft: false
weight: 1
---

Creating a new webhook endpoint is very important process, but simple to achieve with our api.

{{% notice note %}}
Base url `https://api.omegastream.net/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

### Endpoint

```url
GET: [base_url]/client/webhooks
```

### Request Body

#### Fields

| Field       | Required | Description                                                         | Example                       |
|-------------|----------|---------------------------------------------------------------------|-------------------------------|
| url         | **true** | Must be a valid url with method **POST**                            | http://localhost:8888/webhook |
| description | false    | It is just for viewing                                              |                               |
| [events](#events)      | **true** | A list of events string on which you want to receive a notification |                               |

#### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |     

#### Events

They are the triggers on which you will be receiving a new event with a structure of the following
```json
{
    "id" : "630fac88bd5bb64cf8b24b99",
    "coid" : "omega-cop-OyJrgi5-fx",
    "api_version" : "v1",
    "created" : 1661971592,
    "type" : "video.process_failed",
    "data" : {
        
    },
    "endpoint_id" : "6307b4d6570090479813a762",
    "response" : {
        "status_code" : 200,
        "status" : "200 OK",
        "body" : "webhook received\n",
        "message" : "webhook event with type video.process_failed succeeded"
    }
}
```

{{% notice info %}}
`response` field is the response we got from your endpoint.
{{% /notice %}}

Event data will be the full video data for now
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
    "playback_v2": {
        "hls": "https://api.omegastream.net/stream/company/dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/playlist.m3u8?s=AUTH_SIGNATURE",
        "dash": "https://api.omegastream.net/stream/company/dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/playlist.mpd?s=AUTH_SIGNATURE",
        "audio": "https://api.omegastream.net/stream/company/dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/audio.aac?s=AUTH_SIGNATURE",
        "r_1080p": null,
        "r_720p": "https://api.omegastream.net/stream/company/dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/720p.mp4?s=AUTH_SIGNATURE",
        "r_360p": "https://api.omegastream.net/stream/company/dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/360p.mp4?s=AUTH_SIGNATURE",
        "r_480p": "https://api.omegastream.net/stream/company/dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/480p.mp4?s=AUTH_SIGNATURE",
        "r_240p": "https://api.omegastream.net/stream/company/dev-processed-media/69e4ed89/video/17008615-2fd2-46f3-bb85-2ad4ca0466e1/240p.mp4?s=AUTH_SIGNATURE"
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

To see the [full body](/video/webhooks/events)

#### Available events are

- `video.uploaded` ⚠️ Triggered when video is uploaded or ready to be pushed for processing.

- `video.ready_for_processing` ❌ Triggered when video is pushed for processing and ready (but not yet processed).

- `video.in_progress` ❌ Triggered when video is being processed right now.

- `video.completed_processing` ❌ Triggered when video processing is complete. (but not yet confirmed to be working and with no confirmed success)

- `video.process_failed` ✅ Triggered when video processing failed.

- `video.process_succeeded` ✅ Triggered when video processing succeeded.

- `video.ready_to_watch` ❌ Triggered when video is ready to be watched right now.

- `video.deleted` ⚠️ Triggered when the video is successfully deleted.

- `video.failed_to_delete` ⚠️ Triggered when the video deleted failed.

- `video.deletion_reverted` ⚠️ Triggered when the video deletion is reverted.

**Keys:**

 - ✅ Alive and kicking.

 - ⚠️ Only available for some features. (send to **Omega** support to learn more)

 - ❌ Doesn't have any effect right now.

{{% notice note %}}
As of now (*2022-10-01*) you can use `video.process_succeeded` to indicate video process complete.
{{% /notice %}}

{{% notice tip %}}
To View endpoint events and each event details go to [Events](/video/webhooks/events)
{{% /notice %}}

### Response

Status code: `OK 200`
```json
{
    "id": "6323940afc8e1c02d9f3b155",
    "created_at": "2022-09-15T21:07:22.823797Z",
    "updated_at": "2022-09-15T21:07:22.824194Z",
    "coid": "omega-cop-OyJrgi5-fx",
    "url": "http://localhost:6060/webhook",
    "description": null,
    "events": [
        "video.completed_processing",
        "video.process_failed",
        "video.process_succeeded",
        "video.ready_to_watch",
        "video.uploaded",
        "video.ready_for_processing",
        "video.in_progress"
    ],
    "active": true
}
```

{{% notice tip %}}
You can learn more about **active** field from [here](/video/webhooks/managment/#update-status)
{{% /notice %}}