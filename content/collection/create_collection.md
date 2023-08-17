---
title: "Create Collection"
date: 2023-08-17T17:00:27+03:00
draft: false
---

## Endpoint

```url
POST: https://api.omegastream.net/company/client/collections
```

```json
{
    "name": "my new collection",
}
```

- `name`: collection name. it should be at most 128 characters length.


## Headers

| Key           | Value              | Details                                                 |
|---------------|--------------------|---------------------------------------------------------|
| Authorization | Bearer *{{api_key}}* | api key is very important here to authorize your request. |
| Content-Type  | application/json   |   |


## Response

Status Code: `201` Created

```json
{
    "id": "64dcdbe1ae6153f5cc03a735",
    "created_at": "2023-08-16T14:23:29.471Z",
    "updated_at": "2023-08-16T14:23:29.471Z",
    "deleted_at": null,
    "coid": "omega-cop-223411c1",
    "name": "my new collection"
}
```