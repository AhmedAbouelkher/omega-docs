---
title: "Get Videos"
date: 2023-08-17T16:11:56+03:00
draft: false
---

If you want to list all your uploaded and non deleted videos.

{{% notice tip %}}
To Fetch only deleted videos use [Get Deleted Videos](/video/get_deleted_videos)
{{% /notice %}}

### Endpoint

```url
GET: https://api.omegastream.net/company/client/video
```

### Query Params

- `status`: fetch videos status. to learn more see [video status](/video/video_model#video-status)
- `collection`: collection id to fetch videos from specific collection.

    > If you don't want to select specific collection just leave it empty or don't send it.
- `page`: page number to fetch videos from.
- `limit`: limit number of videos to fetch.


### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |   |


### Response

The response video object is not the complete video model, it's a subset of the video model. You can find the full video model details [here](/video/managment/video_model)


Status Code: `200` OK

```json
{
    "data": [
        {
            "id": "64de1635d89f91a65a96f5d2",
            "created_at": "2023-08-17T12:44:37.385Z",
            "updated_at": "2023-08-17T12:44:37.385Z",
            "deleted_at": null,
            "uuid": "1deaa017-4727-4c52-a0fa-c219e9adafd3",
            "coid": "omega-cop-223411c1",
            "title": "my new video",
            "status": "ready-to-upload",
            "privacy": "private",
            "duration": null,
            "size": 0,
            "ready_to_stream": false,
            "thumbnail": null,
            "thumbnail_timestamp_pct": null,
            "collection_id": null
        },
        {
            "id": "64ddf0215fb09ef1f8ec900e",
            "created_at": "2023-08-17T10:02:09.709Z",
            "updated_at": "2023-08-17T10:03:48.187Z",
            "deleted_at": null,
            "uuid": "a23fe4e9-dc10-4f6b-bda5-afe93f8d5d4a",
            "coid": "omega-cop-223411c1",
            "title": "new video to test moving to root",
            "status": "process-completed",
            "privacy": "private",
            "duration": 15,
            "size": 10767949,
            "ready_to_stream": true,
            "thumbnail": "https://api.omegastream.net/stream/dashboard/dev-processed-media/bd413f82/video/a23fe4e9-dc10-4f6b-bda5-afe93f8d5d4a/thumbnail.jpg",
            "thumbnail_timestamp_pct": null,
            "collection_id": null
        }
    ],
    "total": 2,
    "page": 1,
    "per_page": 10,
    "prev": 0,
    "next": 0,
    "total_page": 1
}
```
