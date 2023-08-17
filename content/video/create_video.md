---
title: "Create Video"
date: 2023-08-17T16:29:01+03:00
draft: false
---

### Endpoint

```url
POST: https://api.omegastream.net/company/client/video
```

```json
{
    "title": "new video title",
    "collection": "COLLECTION_ID"
}
```

- `title`: video viewed title. it should be at most 128 characters length.
- `collection`: collection id. ex: `63fcdbd82eec9b89aa5bfdf3` it can be `nullable`

    > if you don't want to add this video to any collection, you can leave this field empty.
    
    > You can move a video later to a collection using [Move Videos to Collection](/collection/move_videos_to_collection)


### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |   |


### Response

Status Code: `201` Created

```json
{
    "id": "64de1635d89f91a65a96f5d2",
    "created_at": "2023-08-17T12:44:37.385087561Z",
    "updated_at": "2023-08-17T12:44:37.385088142Z",
    "deleted_at": null,
    "title": "new video title",
    "uuid": "1deaa017-4727-4c52-a0fa-c219e9adafd3",
    "coid": "omega-cop-223411c1",
    "collection_id": "collection_id",
    "status": "ready-to-upload",
    "privacy": "private",
    "playback": null,
    "playback_v2": null,
    "input": null,
    "duration": null,
    "size": null,
    "ready_to_stream": false,
    "thumbnail": null,
    "thumbnail_timestamp_pct": null,
    "storage": null,
    "meta": null
}
```

{{% notice note %}}
You can find the full video model details [here](/video/managment/video_model)
{{% /notice %}}
