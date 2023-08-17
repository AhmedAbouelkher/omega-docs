---
title: "Move Videos To Collection"
date: 2023-08-17T17:00:41+03:00
draft: false
---

{{% notice tip %}}
To move multiple videos to root instead of a collection, you can use [Move Videos to Root](/collection/move_videos_to_root_collection)
{{% /notice %}}

## Endpoint

```url
POST: https://api.omegastream.net/company/client/collections/move
```

```json
{
    "id": "64dcdbe1ae6153f5cc03a735",
    "uuids": [
        "1deaa017-4727-4c52-a0fa-c219e9adafd3",
        "a23fe4e9-dc10-4f6b-bda5-afe93f8d5d4a"
    ]
}
```

- `id`: collection id. ex: `63fcdbd82eec9b89aa5bfdf3`
- `uuids`: array of video's uuids. min length is 1 and max length is 50.

## Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |   |


## Response

Status Code: `204` No Content