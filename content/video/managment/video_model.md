---
title: "Video Model"
date: 2022-09-17T16:05:24+02:00
draft: false
weight: 1
---

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

| Field     | Type       | Description                        | Nullable |
|-----------|------------|------------------------------------|----------|
| id        | string   | video db id                        | NO       |
| title     | string   | video title           | NO       |
| coid      | string   | company's omega id.                | NO       |
| status    | string   | video current status. for [more](#video-status) | NO       |
| Privacy    | string   | video current privacy. `private` and `public` | NO       |
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
|   r_1080p      | string   | direct link for 1080p resolution     | YES       |
|   r_720p      | string   | direct link for 720p resolution     | YES       |
|   r_480p      | string   | direct link for 480p resolution     | YES       |
|   r_360p      | string   | direct link for 360p resolution     | YES       |
|   r_240p      | string   | direct link for 240p resolution     | YES       |

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