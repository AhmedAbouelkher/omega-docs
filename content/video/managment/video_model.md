---
title: "Video Model"
date: 2022-09-17T16:05:24+02:00
draft: false
weight: 1
---

```json
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
}
```

| Field     | Type       | Description                        | Nullable |
|-----------|------------|------------------------------------|----------|
| id        | string   | video db id                        | NO       |
| title     | string   | video title           | NO       |
| coid      | string   | company's omega id.                | NO       |
| status    | string   | video current status. for [more](#video-status) | NO       |
| entity_id | string   | video s3 storage id.               | YES      |
| playback  | [Playback](#playback) | play back options.    | YES      |
| input     | [Input](#video-input)    | uploaded video size details.        | YES      |
| size  | integer  | video size in *bytes*.              | YES      |
| duration  | integer  | video duration in *seconds*.              | YES      |
| ready_to_watch  | boolean  | video completion flag to show that the video can be streamed.    | NO      |
| thumbnail  | string  | video generated thumbnail, captured from **00:00:01.000** timestamp.    | YES      |
| storage  | [Storage](#storage-details)  | video storage details    | YES      |
| meta  | map[string]string  | video metadata.    | NO      |

#### Video Status
videos status is an enum with values:

- `uploaded` video has been uploaded to our systems and ready to be processed.

- `in-progress` video processing is triggered and awaiting the worker.

- `process-failed` video process failed for some reason. (see [Video Failure](#video-failure))

- `process-completed` video is ready to be watched. (see [Playback](#playback))

{{% notice tip %}}
Video status are very important when receiving [webhooks events](/video/webhooks/create_endpoint).
{{% /notice %}}


#### Playback

| Field     | Type       | Description                        | Nullable |
|-----------|------------|------------------------------------|----------|
| hls        | string   | video hls streaming url    | YES       |
| dash        | string   | video dash streaming url    | YES       |

{{% notice tip %}}
To learn more on how to stream video from **HLS** or **DAHS** links, take a look here [video stream](/video/stream).
{{% /notice %}}

#### Storage Details

| Field     | Type       | Description                        | Nullable |
|-----------|------------|------------------------------------|----------|
| bucket        | string   | processed video storage bucket.    | NO       |
| raw_bucket        | string   | raw video storage bucket.    | NO       |
| meta        | map[string]string   | additional storage metadata    | YES       |

#### Video Input

| Field     | Type       | Description                        | Nullable |
|-----------|------------|------------------------------------|----------|
| width        | integer   | original video width in px.    | NO       |
| height        | integer   | original video height in px.    | NO       |


### Video Failure
Video failure is indicated by status `process-failed` and failure reason can be found in `meta.failure`.

Example:
```json
{
    "downloaded_from" : "https://example.com/dashboard/download/storage/VEc5dVp5QndiMnhzSUhKbGNYVmxjM1J6SUhkcGRHZ2dUR0Z5WVhabGJDNXRjRFE9",
    "failure" : "AccessDenied: Access Denied\n\tstatus code: 403, request id: 588945944CC48625:B, host id: btRoYPJTQm8NRBFi3Pc07IkikXlsK7QHfC8XuCI9kN1T5DtP26rg7PIkLgU5GLaeeJ80rjoBgx1K"
}
```