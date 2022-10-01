---
title: "Upload via link"
date: 2022-09-15T18:06:20+02:00
draft: false
weight: 1
---

If you have videos stored in a cloud storage bucket, you can simply pass a HTTP link for the file. Stream will fetch the file and make it available for streaming.

By using [webhooks](/video/webhooks/) you can receive a notification when the video is ready to be played or if it errors.

{{% notice note %}}
Base url `https://omegastream.net/company` this will be called from now as *`[base_url]`*
{{% /notice %}}

## Step 1: Make an API call with the link

Make a HTTP request to the Stream API with the URL of the video.

```url
POST: [base_url]/client/video/stream/copy
```

### Request body
```json
{
    "title": "video",
    "url": "https://storage.googleapis.com/zaid-test/Watermarks%20Demo/cf-ad-original.mp4"
}
```
| Key     | Required | Description                                                                    | Example                                                                       |
|---------|----------|--------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| title   | **true**    | this is the video title.                                                       | video                                                                         |
| url     | **true** | video direct url                                                               | https://storage.googleapis.com/zaid-test/Watermarks%20Demo/cf-ad-original.mp4 |
| headers | false    | those are the video headers which will be sent with the *url* to request video | json formatted, ex: `{"user-id":"id-1234"}`|

### Headers
| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |


### Response
status code: `OK 200`

```json
{
    "id": "6322ffb8601b871c57d875a9",
    "created_at": "2022-09-15T10:34:32.948100006Z",
    "updated_at": "2022-09-15T10:34:32.948100327Z",
    "title": "video",
    "uuid": "d13752eb-4341-48fe-9384-56bcd26d3de5",
    "coid": "omega-cop-KoNef9DB5i",
    "status": "uploaded",
    "entity_tag": null,
    "playback": null,
    "input": null,
    "duration": null,
    "size": null,
    "ready_to_stream": false,
    "thumbnail": null,
    "thumbnail_timestamp_pct": null,
    "storage": {
        "bucket": "processed-enterprise-media",
        "raw_bucket": "raw-enterprise-media",
        "meta": null
    },
    "meta": {
        "downloaded_from": "https://storage.googleapis.com/zaid-test/Watermarks%20Demo/cf-ad-original.mp4"
    }
}
```

## Step 2: Poll the API or wait for a webhook

Because Stream must download and encode the video, the video might not be available for a few seconds to a few minutes depending on the length of your video. You should poll the Stream API until `readyToStream` is `true`, or use [webhooks](/video/webhooks/) to be notified when a video is ready for streaming.
