---
title: "Delete Video"
date: 2022-10-15T18:04:37+02:00
draft: false
weight: 3
---

{{% notice note %}}
Base url `https://api.omegastream.net/company/company/client/video` this will be called from now as *`{base_url}`*
{{% /notice %}}

## Delete video by uuid

Delete the givin video using its UUID, but the video should be completed processing or failed for more than **4 hours**.

To fetch **ONLY** all deleted videos use [Fetch Deleted](#delete-video-by-uuid).

### Endpoint

```url
DELETE: {base_url}/:uuid
```

- `:uuid`: video's uuid.

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |

{{% notice tip %}}
When the video is deleted it can't be streamed or watched. If you need to revert deletion, head to [Revert Deletion](#revert-video-deletion-by-uuid)
{{% /notice %}}

### Response

Status Code: `200`

```json
{
    "message": "video is not available anymore"
}
```

{{% notice note %}}
If you have multiple videos to delete at once you can use [Bulk Delete](#bulk-delete-videos-by-uuids).
{{% /notice %}}

---

## Revert video deletion by uuid

You can revert the deletion of the video using its UUID.

### Endpoint

```url
POST: {base_url}/revert_deletion/:uuid
```

- `:uuid`: video's uuid.

### Url Query 

- `status`: video status. for [more](/video/managment/video_model#video-status).

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |


### Response

Status Code: `200`

```json
{
    "message": "video is not available again"
}
```

---

Bulk delete videos by uuids

### Endpoint

```url
DELETE: {base_url}/bulk_delete
```

### Request Body

```json
{
    "uuids": [
        "a0dc8dbf-3126-4805-89a1-662a33331f93"
        "ec070291-f584-4ce0-af1a-58fbe46cb905"
    ]
}
```

- ```uuids```: array of video's uuids. min length is 1 and max length is 50.

### Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |                                                         |

### Response

Status Code: `200`

```json
{
    "has_error": false,
    "videos_count": 1,
    "updated_count": 1,
    "failed_count": 0,
    "failed_videos": {}
}
```